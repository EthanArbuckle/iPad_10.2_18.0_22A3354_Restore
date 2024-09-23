@implementation EQKitAttributionBox

- (EQKitAttributionBox)initWithBox:(id)a3 attribution:(id)a4
{
  id v7;
  id v8;
  EQKitAttributionBox *v9;
  EQKitAttributionBox *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EQKitAttributionBox;
  v9 = -[EQKitAttributionBox init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_box, a3);
    objc_storeStrong((id *)&v10->_attribution, a4);
  }

  return v10;
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
  -[EQKitAttributionBox box](self, "box");
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

- (double)opticalAlignWidth
{
  double result;

  -[EQKitBox opticalAlignWidth](self->_box, "opticalAlignWidth");
  return result;
}

- (double)height
{
  double result;

  -[EQKitBox height](self->_box, "height");
  return result;
}

- (double)depth
{
  double result;

  -[EQKitBox depth](self->_box, "depth");
  return result;
}

- (CGRect)erasableBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[EQKitBox erasableBounds](self->_box, "erasableBounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
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
  v8.super_class = (Class)EQKitAttributionBox;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_, v7, x, y);
  -[EQKitBox renderIntoContext:offset:](self->_box, "renderIntoContext:offset:", v7, x, y);

}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return -[EQKitBox appendOpticalAlignToSpec:offset:](self->_box, "appendOpticalAlignToSpec:offset:", a3, a4.x, a4.y);
}

- (id)hitTest:(CGPoint)a3
{
  return -[EQKitBox hitTest:](self->_box, "hitTest:", a3.x, a3.y);
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  EQKitAttributionBox *v6;
  BOOL v7;

  v6 = (EQKitAttributionBox *)a4;
  v7 = v6 == self || -[EQKitBox p_getTransform:fromDescendant:](self->_box, "p_getTransform:fromDescendant:", a3, v6);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitAttributionBox box](self, "box");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EQKitAttributionBox attribution](self, "attribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithBox:attribution:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  EQKitAttributionBox *v4;
  EQKitAttributionBox *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (EQKitAttributionBox *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (-[EQKitAttributionBox isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[EQKitAttributionBox box](self, "box");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EQKitAttributionBox box](v5, "box");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[EQKitAttributionBox attribution](self, "attribution");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EQKitAttributionBox attribution](v5, "attribution");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSRange v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitAttributionBox box](self, "box");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EQKitAttributionBox attribution](self, "attribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EQKitAttributionBox attribution](self, "attribution");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.location = objc_msgSend(v8, "range");
  NSStringFromRange(v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: box=%@ source='%@' range=%@"), v4, self, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (EQKitBox)box
{
  return self->_box;
}

- (EQKitSourceAttribution)attribution
{
  return self->_attribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_box, 0);
}

@end
