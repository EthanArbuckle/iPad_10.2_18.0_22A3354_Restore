@implementation AXSFFocusRingShapeLayer

+ (id)layer
{
  uint64_t v2;
  id v4;
  id v5;
  objc_super v6;
  id v7[3];

  v7[2] = a1;
  v7[1] = (id)a2;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AXSFFocusRingShapeLayer;
  v7[0] = objc_msgSendSuper2(&v6, sel_layer);
  v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v2 = objc_msgSend(objc_retainAutorelease(v4), "CGColor");
  objc_msgSend(v7[0], "setFillColor:", v2);

  v5 = v7[0];
  objc_storeStrong(v7, 0);
  return v5;
}

+ (id)focusLayerForUserInterfaceStyle:(int64_t)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27[4];

  v27[3] = a1;
  v27[2] = (id)a2;
  v27[1] = (id)a3;
  v27[0] = +[AXSFFocusRingShapeLayer layer](AXSFFocusRingShapeLayer, "layer");
  v4 = (id)objc_msgSend(MEMORY[0x24BDE5758], "layer");
  -[AXSFFocusRingShapeLayer setInnerBorder:]((uint64_t)v27[0], v4);

  v7 = (id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v5 = objc_msgSend(objc_retainAutorelease(v7), "CGColor");
  v6 = (id)-[AXSFFocusRingShapeLayer innerBorder]((uint64_t)v27[0]);
  objc_msgSend(v6, "setStrokeColor:", v5);

  v10 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = objc_msgSend(objc_retainAutorelease(v10), "CGColor");
  v9 = (id)-[AXSFFocusRingShapeLayer innerBorder]((uint64_t)v27[0]);
  objc_msgSend(v9, "setFillColor:", v8);

  v11 = (id)-[AXSFFocusRingShapeLayer innerBorder]((uint64_t)v27[0]);
  objc_msgSend(v11, "setLineWidth:", 3.0);

  v12 = (id)-[AXSFFocusRingShapeLayer innerBorder]((uint64_t)v27[0]);
  objc_msgSend(v12, "setCornerRadius:");

  v13 = v27[0];
  v14 = (id)-[AXSFFocusRingShapeLayer innerBorder]((uint64_t)v27[0]);
  objc_msgSend(v13, "addSublayer:");

  v15 = (id)objc_msgSend(MEMORY[0x24BDE5758], "layer");
  -[AXSFFocusRingShapeLayer setOuterBorder:]((uint64_t)v27[0], v15);

  v18 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v16 = objc_msgSend(objc_retainAutorelease(v18), "CGColor");
  v17 = (id)-[AXSFFocusRingShapeLayer outerBorder]((uint64_t)v27[0]);
  objc_msgSend(v17, "setStrokeColor:", v16);

  v21 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v19 = objc_msgSend(objc_retainAutorelease(v21), "CGColor");
  v20 = (id)-[AXSFFocusRingShapeLayer outerBorder]((uint64_t)v27[0]);
  objc_msgSend(v20, "setFillColor:", v19);

  v22 = (id)-[AXSFFocusRingShapeLayer outerBorder]((uint64_t)v27[0]);
  objc_msgSend(v22, "setLineWidth:", 1.0);

  v23 = (id)-[AXSFFocusRingShapeLayer outerBorder]((uint64_t)v27[0]);
  objc_msgSend(v23, "setCornerRadius:", 5.0);

  v24 = v27[0];
  v25 = (id)-[AXSFFocusRingShapeLayer outerBorder]((uint64_t)v27[0]);
  objc_msgSend(v24, "addSublayer:");

  v26 = v27[0];
  objc_storeStrong(v27, 0);
  return v26;
}

- (void)setInnerBorder:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (uint64_t)innerBorder
{
  if (a1)
    return *(_QWORD *)(a1 + 32);
  else
    return 0;
}

- (void)setOuterBorder:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (uint64_t)outerBorder
{
  if (a1)
    return *(_QWORD *)(a1 + 40);
  else
    return 0;
}

+ (id)parentLayerForUserInterfaceStyle:(int64_t)a3
{
  return +[AXSFFocusRingShapeLayer layer](AXSFFocusRingShapeLayer, "layer");
}

+ (id)selectedLayerForUserInterfaceStyle:(int64_t)a3
{
  return +[AXSFFocusRingShapeLayer focusLayerForUserInterfaceStyle:](AXSFFocusRingShapeLayer, "focusLayerForUserInterfaceStyle:", 0);
}

+ (id)selectedParentLayerForUserInterfaceStyle:(int64_t)a3
{
  return +[AXSFFocusRingShapeLayer layer](AXSFFocusRingShapeLayer, "layer");
}

- (void)setPath:(CGPath *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGPath *v7;
  id v8;
  double Width;
  double Height;
  void *__src;
  uint64_t v12;
  id v13;
  _BYTE v14[48];
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGPoint origin;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[48];
  CGAffineTransform __dst;
  CGAffineTransform __b;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  id v29;
  objc_super v30;
  CGPath *v31;
  SEL v32;
  AXSFFocusRingShapeLayer *v33;
  CGRect v34;

  v33 = self;
  v32 = a2;
  v31 = a3;
  v30.receiver = self;
  v30.super_class = (Class)AXSFFocusRingShapeLayer;
  -[AXSFFocusRingShapeLayer setPath:](&v30, sel_setPath_, a3);
  v7 = v31;
  v8 = (id)-[AXSFFocusRingShapeLayer outerBorder]((uint64_t)v33);
  objc_msgSend(v8, "setPath:", v7);

  v29 = (id)objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", v31);
  objc_msgSend(v29, "bounds");
  v28 = v34;
  v27 = CGRectInset(v34, 1.0, 1.0);
  Width = CGRectGetWidth(v27);
  v26 = Width / CGRectGetWidth(v28);
  Height = CGRectGetHeight(v27);
  v25 = Height / CGRectGetHeight(v28);
  memset(&__b, 0, sizeof(__b));
  __src = (void *)MEMORY[0x24BDBD8B8];
  memcpy(&__dst, MEMORY[0x24BDBD8B8], sizeof(__dst));
  CGAffineTransformScale(&__b, &__dst, v26, v25);
  memcpy(v22, &__b, sizeof(v22));
  objc_msgSend(v29, "applyTransform:", v22);
  objc_msgSend(v29, "bounds");
  *(_QWORD *)&v19 = v3;
  *((_QWORD *)&v19 + 1) = v4;
  v20 = v5;
  v21 = v6;
  v18 = v19;
  origin = v28.origin;
  memset(&v16, 0, sizeof(v16));
  memcpy(&v15, __src, sizeof(v15));
  CGAffineTransformTranslate(&v16, &v15, v28.origin.x - *(double *)&v19 + 1.0, v28.origin.y - *((double *)&v19 + 1) + 1.0);
  memcpy(v14, &v16, sizeof(v14));
  objc_msgSend(v29, "applyTransform:", v14);
  v12 = objc_msgSend(objc_retainAutorelease(v29), "CGPath");
  v13 = (id)-[AXSFFocusRingShapeLayer innerBorder]((uint64_t)v33);
  objc_msgSend(v13, "setPath:", v12);

  objc_storeStrong(&v29, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerBorder, 0);
  objc_storeStrong((id *)&self->_innerBorder, 0);
}

@end
