@implementation EQKitVShift

- (EQKitVShift)initWithBox:(id)a3 offset:(double)a4
{
  id v7;
  EQKitVShift *v8;
  EQKitVShift *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EQKitVShift;
  v8 = -[EQKitVShift init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_box, a3);
    v9->_offset = a4;
  }

  return v9;
}

- (BOOL)canContainBoxes
{
  return 1;
}

- (id)containedBoxes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[EQKitVShift box](self, "box");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)width
{
  double result;

  -[EQKitBox width](self->_box, "width");
  return result;
}

- (double)height
{
  double v3;

  -[EQKitBox height](self->_box, "height");
  return v3 + self->_offset;
}

- (double)depth
{
  double v3;

  -[EQKitBox depth](self->_box, "depth");
  return v3 - self->_offset;
}

- (CGRect)erasableBounds
{
  CGRect v3;

  -[EQKitBox erasableBounds](self->_box, "erasableBounds");
  return CGRectOffset(v3, 0.0, -self->_offset);
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  objc_super v8;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EQKitVShift;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_, v7, x, y);
  -[EQKitBox renderIntoContext:offset:](self->_box, "renderIntoContext:offset:", v7, x, y - self->_offset);

}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return -[EQKitBox appendOpticalAlignToSpec:offset:](self->_box, "appendOpticalAlignToSpec:offset:", a3, a4.x, a4.y - self->_offset);
}

- (id)hitTest:(CGPoint)a3
{
  return -[EQKitBox hitTest:](self->_box, "hitTest:", a3.x, a3.y - self->_offset);
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  EQKitVShift *v6;
  __int128 v7;
  __int128 v8;
  BOOL v9;
  CGAffineTransform v11;
  CGAffineTransform v12;

  v6 = (EQKitVShift *)a4;
  if (v6 != self)
  {
    if (!-[EQKitBox p_getTransform:fromDescendant:](self->_box, "p_getTransform:fromDescendant:", a3, v6))
    {
      v9 = 0;
      goto LABEL_6;
    }
    v7 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v11.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v11.c = v7;
    *(_OWORD *)&v11.tx = *(_OWORD *)&a3->tx;
    CGAffineTransformTranslate(&v12, &v11, 0.0, -self->_offset);
    v8 = *(_OWORD *)&v12.c;
    *(_OWORD *)&a3->a = *(_OWORD *)&v12.a;
    *(_OWORD *)&a3->c = v8;
    *(_OWORD *)&a3->tx = *(_OWORD *)&v12.tx;
  }
  v9 = 1;
LABEL_6:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitVShift box](self, "box");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EQKitVShift offset](self, "offset");
  v6 = (void *)objc_msgSend(v4, "initWithBox:offset:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  EQKitVShift *v4;
  EQKitVShift *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (EQKitVShift *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[EQKitVShift isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[EQKitVShift offset](self, "offset");
    v7 = v6;
    -[EQKitVShift offset](v5, "offset");
    if (v7 == v8)
    {
      -[EQKitVShift box](self, "box");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EQKitVShift box](v5, "box");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitVShift height](self, "height");
  v6 = v5;
  -[EQKitVShift depth](self, "depth");
  v8 = v7;
  -[EQKitVShift width](self, "width");
  v10 = v9;
  -[EQKitVShift offset](self, "offset");
  v12 = v11;
  -[EQKitVShift box](self, "box");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f offset=%f box=%@ "), v4, self, v6, v8, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (EQKitBox)box
{
  return self->_box;
}

- (double)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_box, 0);
}

@end
