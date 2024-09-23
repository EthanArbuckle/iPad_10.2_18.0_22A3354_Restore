@implementation EQKitLayoutImplementation

- (EQKitLayoutImplementation)initWithRoot:(id)a3 environment:(id)a4
{
  EQKitLayoutImplementation *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EQKitLayoutImplementation;
  v6 = -[EQKitLayoutImplementation init](&v8, sel_init);
  if (v6)
  {
    v6->mRoot = (EQKitRootNode *)a3;
    v6->mEnvironment = (EQKitEnvironment *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitLayoutImplementation;
  -[EQKitLayoutImplementation dealloc](&v3, sel_dealloc);
}

- (BOOL)layoutWithContext:(id)a3
{
  uint64_t v5;
  EQKitBox *mBox;
  double v7;
  double v8;
  double v9;
  double mLeading;
  double mAscent;
  double v12;
  double v13;
  double mDescent;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  _BYTE v31[624];

  self->mBox = 0;
  self->mScale = 1.0;
  if (a3)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return self->mBox != 0;
    v5 = -[EQKitRootNode attributeCollection](self->mRoot, "attributeCollection");
    if (!v5)
      return self->mBox != 0;
    -[EQKitEnvironment beginLayout](self->mEnvironment, "beginLayout");
    EQKitLayoutManager::EQKitLayoutManager(v31, a3, self->mEnvironment, v5);
    mBox = EQKitLayoutManager::layoutExpression((EQKitLayoutManager *)v31, self->mRoot, &self->mAscent, &self->mDescent, &self->mLeading, &self->mNaturalAlignmentOffset, &self->mSingleLineHeight);
    self->mBox = mBox;
    if (self->mSingleLineHeight)
    {
      v7 = self->mAscent + self->mDescent;
    }
    else
    {
      -[EQKitBox height](mBox, "height");
      v9 = v8;
      mLeading = self->mLeading;
      mAscent = self->mAscent;
      -[EQKitBox depth](self->mBox, "depth");
      v13 = v9 + mLeading * 0.5;
      if (v13 < mAscent)
        v13 = mAscent;
      mDescent = v12 + self->mLeading * 0.5;
      if (mDescent < self->mDescent)
        mDescent = self->mDescent;
      v7 = v13 + mDescent;
      mBox = self->mBox;
    }
    -[EQKitBox width](mBox, "width");
    if (v15 > 0.0 && v7 > 0.0)
    {
      objc_msgSend(a3, "targetSize");
      v18 = v17;
      if (v17 <= 0.0 || (v19 = v16, v16 <= 0.0))
      {
        objc_msgSend(a3, "containerSize");
        v26 = v25;
        if (v25 <= 0.0)
          goto LABEL_20;
        v27 = v24;
        if (v24 <= 0.0)
          goto LABEL_20;
        -[EQKitBox width](self->mBox, "width");
        *(float *)&v28 = v26 / v28;
        v21 = fminf(*(float *)&v28, 1.0);
        v23 = v27 / v7;
      }
      else
      {
        -[EQKitBox erasableBounds](self->mBox, "erasableBounds");
        v21 = v18 / v20;
        v23 = v19 / v22;
      }
      v29 = v23;
      self->mScale = fminf(v21, v29);
    }
LABEL_20:
    -[EQKitEnvironment endLayout](self->mEnvironment, "endLayout");
    EQKitLayoutManager::~EQKitLayoutManager((EQKitLayoutManager *)v31);
    return self->mBox != 0;
  }
  return 0;
}

- (double)scale
{
  return self->mScale;
}

- (double)height
{
  double *p_mAscent;
  double mScale;
  double v5;

  if (self->mSingleLineHeight)
  {
    p_mAscent = &self->mAscent;
    mScale = self->mScale;
  }
  else
  {
    -[EQKitBox height](self->mBox, "height");
    mScale = v5 + self->mLeading * 0.5;
    if (mScale < self->mAscent)
      mScale = self->mAscent;
    p_mAscent = &self->mScale;
  }
  return *p_mAscent * mScale;
}

- (double)depth
{
  double *p_mDescent;
  double mScale;
  double v5;

  if (self->mSingleLineHeight)
  {
    p_mDescent = &self->mDescent;
    mScale = self->mScale;
  }
  else
  {
    -[EQKitBox depth](self->mBox, "depth");
    mScale = v5 + self->mLeading * 0.5;
    if (mScale < self->mDescent)
      mScale = self->mDescent;
    p_mDescent = &self->mScale;
  }
  return *p_mDescent * mScale;
}

- (double)width
{
  double v3;

  -[EQKitBox width](self->mBox, "width");
  return v3 * self->mScale;
}

- (double)vsize
{
  double v3;
  double v4;
  double v5;

  -[EQKitLayoutImplementation height](self, "height");
  v4 = v3;
  -[EQKitLayoutImplementation depth](self, "depth");
  return v4 + v5;
}

- (double)naturalAlignmentOffset
{
  return self->mNaturalAlignmentOffset * self->mScale;
}

- (CGRect)erasableBounds
{
  EQKitBox *mBox;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGAffineTransform v12;
  CGRect v13;

  mBox = self->mBox;
  if (mBox)
  {
    -[EQKitBox erasableBounds](mBox, "erasableBounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    CGAffineTransformMakeScale(&v12, self->mScale, self->mScale);
    v13.origin.x = v5;
    v13.origin.y = v7;
    v13.size.width = v9;
    v13.size.height = v11;
    return CGRectApplyAffineTransform(v13, &v12);
  }
  else
  {
    return *(CGRect *)*(_QWORD *)&MEMORY[0x24BDBF090];
  }
}

- (id)selectionForPoint:(CGPoint)a3
{
  id result;

  result = -[EQKitBox hitTest:](self->mBox, "hitTest:", a3.x, a3.y);
  if (result)
    return -[EQKitSelection initWithBox:]([EQKitSelection alloc], "initWithBox:", result);
  return result;
}

- (CGSize)naturalSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[EQKitLayoutImplementation erasableBounds](self, "erasableBounds");
  v4 = v3;
  v6 = v5;
  -[EQKitLayoutImplementation width](self, "width");
  if (v7 >= v4)
    v8 = v7;
  else
    v8 = v4;
  -[EQKitLayoutImplementation height](self, "height");
  v10 = v9;
  -[EQKitLayoutImplementation depth](self, "depth");
  v12 = v10 + v11;
  if (v12 >= v6)
    v13 = v12;
  else
    v13 = v6;
  v14 = v8 + 2.0;
  v15 = v13 + 2.0;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  CGContext *v6;
  double y;
  double x;
  CGAffineTransform v9;

  y = a4.y;
  x = a4.x;
  v6 = (CGContext *)objc_msgSend(a3, "cgContext");
  CGContextSaveGState(v6);
  CGContextScaleCTM(v6, self->mScale, self->mScale);
  CGAffineTransformMakeScale(&v9, 1.0 / self->mScale, 1.0 / self->mScale);
  -[EQKitBox renderIntoContext:offset:](self->mBox, "renderIntoContext:offset:", a3, vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, y), *(float64x2_t *)&v9.a, x)));
  CGContextRestoreGState(v6);
}

- (id)rootInspectable
{
  return -[_EQKitInspectableBox initWithBox:]([_EQKitInspectableBox alloc], "initWithBox:", self->mBox);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p box=%@>"), NSStringFromClass(v4), self, self->mBox);
}

- (EQKitRootNode)root
{
  return self->mRoot;
}

- (EQKitBox)box
{
  return self->mBox;
}

@end
