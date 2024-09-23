@implementation ASCContentSkeleton

- (double)skeletonHeightFromContext:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;

  v3 = a3;
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v5;
  v7 = objc_msgSend(v3, "skeletonNumberOfLines");

  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  v9 = v6 * (double)v8;

  return v9;
}

- (int64_t)effectiveSkeletonAlignmentFromContext:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "textAlignment");
  if (v4 == 4)
  {
    v5 = 2 * (objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection") != 0);
  }
  else if (v4 == 2)
  {
    v5 = 2;
  }
  else
  {
    v5 = v4 == 1;
  }

  return v5;
}

- (CGRect)skeletonRectForBounds:(CGRect)a3 forLineNumber:(unint64_t)a4 usingSkeletonContext:(id)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v11;
  CGFloat v12;
  double MinX;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  int64_t v19;
  double MinY;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MaxX;
  double MidX;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  MinX = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[ASCContentSkeleton widthThatFits:](self, "widthThatFits:", width, height);
  v15 = v14;
  objc_msgSend(v11, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "capHeight");
  v18 = ceil(v17);

  v19 = -[ASCContentSkeleton effectiveSkeletonAlignmentFromContext:](self, "effectiveSkeletonAlignmentFromContext:", v11);
  switch(v19)
  {
    case 2:
      v38.origin.x = x;
      v38.origin.y = y;
      v38.size.width = width;
      v38.size.height = height;
      MaxX = CGRectGetMaxX(v38);
      v39.origin.x = MinX;
      v39.origin.y = v12;
      v39.size.width = v15;
      v39.size.height = v18;
      MinX = MaxX - CGRectGetWidth(v39);
      break;
    case 1:
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      MidX = CGRectGetMidX(v40);
      v41.origin.x = MinX;
      v41.origin.y = v12;
      v41.size.width = v15;
      v41.size.height = v18;
      MinX = floor(MidX + CGRectGetWidth(v41) * -0.5);
      break;
    case 0:
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      MinX = CGRectGetMinX(v37);
      break;
  }
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  MinY = CGRectGetMinY(v42);
  v21 = (double)a4;
  objc_msgSend(v11, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lineHeight");
  v24 = floor(MinY + v21 * v23);

  objc_msgSend(v11, "font");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ascender");
  v27 = v26;
  objc_msgSend(v11, "font");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "capHeight");
  v30 = ceil(v27 - v29);

  v31 = MinX;
  v32 = v24 + v30;
  v33 = v15;
  v34 = v18;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)drawSkeletonInRect:(CGRect)a3 usingSkeletonContext:(id)a4
{
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double height;
  id v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21 = a4;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v9 = objc_msgSend(v21, "skeletonNumberOfLines");
  v10 = 0;
  if (v9 <= 1)
    v11 = 1;
  else
    v11 = v9;
  do
  {
    -[ASCContentSkeleton skeletonRectForBounds:forLineNumber:usingSkeletonContext:](self, "skeletonRectForBounds:forLineNumber:usingSkeletonContext:", v10, v21, x, y, width, height, *(_QWORD *)&height);
    v12 = v22.origin.x;
    v13 = v22.origin.y;
    v14 = v22.size.width;
    v15 = v22.size.height;
    v16 = CGRectGetWidth(v22);
    v23.origin.x = v12;
    v23.origin.y = v13;
    v23.size.width = v14;
    v23.size.height = v15;
    v17 = CGRectGetHeight(v23);
    if (v16 < v17)
      v17 = v16;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v12, v13, v14, v15, v17 * 0.5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "skeletonColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "set");

    objc_msgSend(v18, "fill");
    ++v10;
  }
  while (v11 != v10);
  CGContextRestoreGState(CurrentContext);

}

+ (id)absoluteSkeleton:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:rawValue:", 0, a3);
}

+ (id)fractionalSkeleton:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:rawValue:", 1, a3);
}

- (ASCContentSkeleton)initWithType:(int64_t)a3 rawValue:(double)a4
{
  ASCContentSkeleton *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCContentSkeleton;
  result = -[ASCContentSkeleton init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_rawValue = a4;
  }
  return result;
}

- (unint64_t)hash
{
  ASCHasher *v3;
  unint64_t v4;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCContentSkeleton type](self, "type"));
  -[ASCContentSkeleton rawValue](self, "rawValue");
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  v4 = -[ASCHasher finalizeHash](v3, "finalizeHash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7 && (v8 = -[ASCContentSkeleton type](self, "type"), v8 == objc_msgSend(v7, "type")))
  {
    -[ASCContentSkeleton rawValue](self, "rawValue");
    v10 = v9;
    objc_msgSend(v7, "rawValue");
    v12 = v10 == v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  ASCDescriber *v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  v4 = -[ASCContentSkeleton type](self, "type");
  if (!v4)
  {
    v5 = CFSTR("absolute");
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = CFSTR("fractional");
LABEL_5:
    -[ASCContentSkeleton rawValue](self, "rawValue");
    -[ASCDescriber addDouble:withName:](v3, "addDouble:withName:", v5);
  }
  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)widthThatFits:(CGSize)a3
{
  double width;
  int64_t v5;
  double result;
  double v7;

  width = a3.width;
  v5 = -[ASCContentSkeleton type](self, "type", a3.width, a3.height);
  if (v5 == 1)
  {
    -[ASCContentSkeleton rawValue](self, "rawValue");
    return ceil(width * v7);
  }
  else if (!v5)
  {
    -[ASCContentSkeleton rawValue](self, "rawValue");
    if (width < result)
      return width;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (double)rawValue
{
  return self->_rawValue;
}

@end
