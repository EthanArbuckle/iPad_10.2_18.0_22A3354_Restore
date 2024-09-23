@implementation EQKitPaddedBox

- (EQKitPaddedBox)initWithBox:(id)a3 height:(double)a4 width:(double)a5 depth:(double)a6 lspace:(double)a7 voffset:(double)a8
{
  id v15;
  EQKitPaddedBox *v16;
  EQKitPaddedBox *v17;
  objc_super v19;

  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EQKitPaddedBox;
  v16 = -[EQKitPaddedBox init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_box, a3);
    v17->_height = a4;
    v17->_width = a5;
    v17->_depth = a6;
    v17->_lspace = a7;
    v17->_voffset = a8;
  }

  return v17;
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
  -[EQKitPaddedBox box](self, "box");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)width
{
  return self->_width + self->_lspace;
}

- (double)opticalAlignWidth
{
  double result;

  -[EQKitBox opticalAlignWidth](self->_box, "opticalAlignWidth");
  return result;
}

- (double)height
{
  return self->_height + self->_voffset;
}

- (double)depth
{
  return self->_depth - self->_voffset;
}

- (CGRect)erasableBounds
{
  CGRect v3;

  -[EQKitBox erasableBounds](self->_box, "erasableBounds");
  return CGRectOffset(v3, self->_lspace, -self->_voffset);
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
  v8.super_class = (Class)EQKitPaddedBox;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_, v7, x, y);
  -[EQKitBox renderIntoContext:offset:](self->_box, "renderIntoContext:offset:", v7, x + self->_lspace, y - self->_voffset);

}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  switch(*((_DWORD *)a3 + 6))
  {
    case 0:
    case 2:
      a4.y = a4.y - self->_voffset;
      break;
    case 1:
    case 3:
      a4.x = a4.x + self->_lspace;
      break;
    default:
      return -[EQKitBox appendOpticalAlignToSpec:offset:](self->_box, "appendOpticalAlignToSpec:offset:", a4.x, a4.y);
  }
  return -[EQKitBox appendOpticalAlignToSpec:offset:](self->_box, "appendOpticalAlignToSpec:offset:", a4.x, a4.y);
}

- (id)hitTest:(CGPoint)a3
{
  return -[EQKitBox hitTest:](self->_box, "hitTest:", a3.x - self->_lspace, a3.y + self->_voffset);
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  EQKitPaddedBox *v6;
  __int128 v7;
  double lspace;
  __int128 v9;
  BOOL v10;
  CGAffineTransform v12;
  CGAffineTransform v13;

  v6 = (EQKitPaddedBox *)a4;
  if (v6 != self)
  {
    if (!-[EQKitBox p_getTransform:fromDescendant:](self->_box, "p_getTransform:fromDescendant:", a3, v6))
    {
      v10 = 0;
      goto LABEL_6;
    }
    v7 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v12.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v12.c = v7;
    lspace = self->_lspace;
    *(_OWORD *)&v12.tx = *(_OWORD *)&a3->tx;
    CGAffineTransformTranslate(&v13, &v12, lspace, -self->_voffset);
    v9 = *(_OWORD *)&v13.c;
    *(_OWORD *)&a3->a = *(_OWORD *)&v13.a;
    *(_OWORD *)&a3->c = v9;
    *(_OWORD *)&a3->tx = *(_OWORD *)&v13.tx;
  }
  v10 = 1;
LABEL_6:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitPaddedBox box](self, "box");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EQKitPaddedBox height](self, "height");
  v7 = v6;
  -[EQKitPaddedBox width](self, "width");
  v9 = v8;
  -[EQKitPaddedBox depth](self, "depth");
  v11 = v10;
  -[EQKitPaddedBox lspace](self, "lspace");
  v13 = v12;
  -[EQKitPaddedBox voffset](self, "voffset");
  v15 = (void *)objc_msgSend(v4, "initWithBox:height:width:depth:lspace:voffset:", v5, v7, v9, v11, v13, v14);

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  EQKitPaddedBox *v4;
  EQKitPaddedBox *v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  char v23;

  v4 = (EQKitPaddedBox *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else if (-[EQKitPaddedBox isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[EQKitPaddedBox height](self, "height");
    v7 = v6;
    -[EQKitPaddedBox height](v5, "height");
    if (v7 != v8)
      goto LABEL_11;
    -[EQKitPaddedBox width](self, "width");
    v10 = v9;
    -[EQKitPaddedBox width](v5, "width");
    if (v10 != v11)
      goto LABEL_11;
    -[EQKitPaddedBox depth](self, "depth");
    v13 = v12;
    -[EQKitPaddedBox depth](v5, "depth");
    if (v13 != v14)
      goto LABEL_11;
    -[EQKitPaddedBox lspace](self, "lspace");
    v16 = v15;
    -[EQKitPaddedBox lspace](v5, "lspace");
    if (v16 == v17
      && (-[EQKitPaddedBox voffset](self, "voffset"), v19 = v18, -[EQKitPaddedBox voffset](v5, "voffset"), v19 == v20))
    {
      -[EQKitPaddedBox box](self, "box");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EQKitPaddedBox box](v5, "box");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

    }
    else
    {
LABEL_11:
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitPaddedBox height](self, "height");
  v6 = v5;
  -[EQKitPaddedBox depth](self, "depth");
  v8 = v7;
  -[EQKitPaddedBox width](self, "width");
  v10 = v9;
  -[EQKitPaddedBox lspace](self, "lspace");
  v12 = v11;
  -[EQKitPaddedBox voffset](self, "voffset");
  v14 = v13;
  -[EQKitPaddedBox box](self, "box");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f lspace=%f voffset=%f box=%@ "), v4, self, v6, v8, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (EQKitBox)box
{
  return self->_box;
}

- (double)lspace
{
  return self->_lspace;
}

- (double)voffset
{
  return self->_voffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_box, 0);
}

@end
