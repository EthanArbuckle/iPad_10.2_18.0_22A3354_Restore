@implementation EQKitOverlayBox

- (EQKitOverlayBox)initWithBox:(id)a3 overlayBox:(id)a4
{
  id v7;
  id v8;
  EQKitOverlayBox *v9;
  EQKitOverlayBox *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EQKitOverlayBox;
  v9 = -[EQKitOverlayBox init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_box, a3);
    objc_storeStrong((id *)&v10->_overlayBox, a4);
  }

  return v10;
}

- (BOOL)canContainBoxes
{
  return 1;
}

- (id)containedBoxes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  -[EQKitOverlayBox box](self, "box");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[EQKitOverlayBox overlayBox](self, "overlayBox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)width
{
  double result;

  -[EQKitBox width](self->_box, "width");
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
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v15;
  CGRect v17;

  -[EQKitBox erasableBounds](self->_box, "erasableBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[EQKitBox erasableBounds](self->_overlayBox, "erasableBounds");
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  return CGRectUnion(v15, v17);
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
  v8.super_class = (Class)EQKitOverlayBox;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_, v7, x, y);
  -[EQKitBox renderIntoContext:offset:](self->_box, "renderIntoContext:offset:", v7, x, y);
  -[EQKitBox renderIntoContext:offset:](self->_overlayBox, "renderIntoContext:offset:", v7, x, y);

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
  EQKitOverlayBox *v6;
  BOOL v7;

  v6 = (EQKitOverlayBox *)a4;
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
  -[EQKitOverlayBox box](self, "box");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EQKitOverlayBox overlayBox](self, "overlayBox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithBox:overlayBox:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  EQKitOverlayBox *v4;
  EQKitOverlayBox *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (EQKitOverlayBox *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (-[EQKitOverlayBox isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[EQKitOverlayBox box](self, "box");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EQKitOverlayBox box](v5, "box");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[EQKitOverlayBox overlayBox](self, "overlayBox");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EQKitOverlayBox overlayBox](v5, "overlayBox");
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
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitOverlayBox height](self, "height");
  v6 = v5;
  -[EQKitOverlayBox depth](self, "depth");
  v8 = v7;
  -[EQKitOverlayBox width](self, "width");
  v10 = v9;
  -[EQKitOverlayBox box](self, "box");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EQKitOverlayBox overlayBox](self, "overlayBox");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f box=%@ overlayBox=%@ "), v4, self, v6, v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (EQKitBox)box
{
  return self->_box;
}

- (EQKitBox)overlayBox
{
  return self->_overlayBox;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayBox, 0);
  objc_storeStrong((id *)&self->_box, 0);
}

@end
