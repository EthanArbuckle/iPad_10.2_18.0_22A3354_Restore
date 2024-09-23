@implementation _BCUCoverEffectsPDF

- (_BCUCoverEffectsPDF)initWithIdentifier:(id)a3 renderer:(id)a4 image:(BOOL)a5 shadow:(BOOL)a6 night:(BOOL)a7
{
  id v13;
  id v14;
  _BCUCoverEffectsPDF *v15;
  _BCUCoverEffectsPDF *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_BCUCoverEffectsPDF;
  v15 = -[_BCUCoverEffectsPDF init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_renderer, a4);
    v16->_image = a5;
    v16->_shadow = a6;
    v16->_night = a7;
  }

  return v16;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)coverLayerWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5
{
  return 0;
}

- (id)shadowLayerWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5 kind:(unint64_t)a6
{
  return 0;
}

- (UIEdgeInsets)_roundedInsetsWithSize:(CGSize)a3
{
  double v3;
  BOOL v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  v3 = 618.0 / a3.width;
  v4 = a3.width <= 0.0;
  v5 = 1.0;
  if (!v4)
    v5 = v3;
  v6 = 46.0 / v5;
  v7 = floor(40.0 / v5);
  v8 = floor(v6);
  v9 = v7;
  v10 = v7;
  result.right = v10;
  result.bottom = v8;
  result.left = v9;
  result.top = v7;
  return result;
}

- (id)_layerWithImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5 minificationFilter:(id)a6
{
  double height;
  double width;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  CGPath *Mutable;
  double MaxY;
  CGFloat v27;
  CGFloat MaxX;
  double MinY;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double MinX;
  double x1;
  double v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  -[_BCUCoverEffectsPDF _roundedInsetsWithSize:](self, "_roundedInsetsWithSize:", width, height);
  v15 = width + v13 + v14;
  v17 = height + v12 + v16;
  if (self->_shadow)
    v18 = v17;
  else
    v18 = height;
  if (self->_shadow)
    v19 = v15;
  else
    v19 = width;
  if (self->_shadow)
    v20 = v12;
  else
    v20 = 0.0;
  if (self->_shadow)
    v21 = v13;
  else
    v21 = 0.0;
  v22 = (void *)objc_opt_new();
  objc_msgSend(v22, "setRasterizationScale:", a5);
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, v19, v18);
  if (self->_shadow)
  {
    v37 = v21;
    v38 = v20;
    if (qword_25598A9D0 != -1)
      dispatch_once(&qword_25598A9D0, &unk_24F113F50);
    v23 = (void *)objc_opt_new();
    v24 = (void *)objc_opt_new();
    Mutable = CGPathCreateMutable();
    v39.origin.x = 0.0;
    v39.origin.y = 0.0;
    v39.size.width = width;
    v39.size.height = height;
    MinX = CGRectGetMinX(v39);
    v40.origin.x = 0.0;
    v40.origin.y = 0.0;
    v40.size.width = width;
    v40.size.height = height;
    MaxY = CGRectGetMaxY(v40);
    v41.origin.x = 0.0;
    v41.origin.y = 0.0;
    v41.size.width = width;
    v41.size.height = height;
    x1 = CGRectGetMaxX(v41);
    v42.origin.x = 0.0;
    v42.origin.y = 0.0;
    v42.size.width = width;
    v42.size.height = height;
    v27 = CGRectGetMaxY(v42);
    v43.origin.x = 0.0;
    v43.origin.y = 0.0;
    v43.size.width = width;
    v43.size.height = height;
    MaxX = CGRectGetMaxX(v43);
    v44.origin.x = 0.0;
    v44.origin.y = 0.0;
    v44.size.width = width;
    v44.size.height = height;
    MinY = CGRectGetMinY(v44);
    CGPathMoveToPoint(Mutable, 0, MinX + 0.0, MaxY + -2.0);
    CGPathAddArcToPoint(Mutable, 0, 0.0, 0.0, 2.0, 0.0, 2.0);
    CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MinY + 2.0, 2.0);
    CGPathAddArcToPoint(Mutable, 0, x1, v27, x1 + -2.0, v27, 2.0);
    CGPathAddArcToPoint(Mutable, 0, MinX, MaxY, MinX + 0.0, MaxY + -2.0, 2.0);
    CGPathCloseSubpath(Mutable);
    objc_msgSend(v23, "setShadowPath:", Mutable);
    objc_msgSend(v24, "setShadowPath:", Mutable);
    CGPathRelease(Mutable);
    objc_msgSend(v23, "setShadowColor:", qword_25598A9C0);
    LODWORD(v30) = 1.0;
    objc_msgSend(v23, "setShadowOpacity:", v30);
    objc_msgSend(v23, "setShadowRadius:", width / 618.0 * 20.0);
    objc_msgSend(v23, "setShadowOffset:", 0.0, width / 618.0 * 6.0);
    objc_msgSend(v24, "setShadowColor:", qword_25598A9C8);
    LODWORD(v31) = 1.0;
    objc_msgSend(v24, "setShadowOpacity:", v31);
    objc_msgSend(v24, "setShadowRadius:", width / 618.0 * 4.0);
    objc_msgSend(v24, "setShadowOffset:", 0.0, width / 618.0);
    v21 = v37;
    v20 = v38;
    objc_msgSend(v23, "setFrame:", v37, v38, width, height);
    objc_msgSend(v24, "setFrame:", v37, v38, width, height);
    objc_msgSend(v22, "addSublayer:", v23);
    objc_msgSend(v22, "addSublayer:", v24);

  }
  if (self->_image)
  {
    v32 = (void *)objc_opt_new();
    objc_msgSend(v32, "setContents:", a3);
    objc_msgSend(v32, "setCornerRadius:", 2.0);
    objc_msgSend(v32, "setMasksToBounds:", 1);
    objc_msgSend(v32, "setFrame:", v21, v20, width, height);
    if (v11)
      objc_msgSend(v32, "setMinificationFilter:", v11);
    objc_msgSend(v22, "addSublayer:", v32);
    if (self->_night)
    {
      objc_msgSend(MEMORY[0x24BDE56D0], "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setBackgroundColor:", objc_msgSend((id)qword_2540D97E0, "overlayColor"));
      objc_msgSend(v33, "setCornerRadius:", 2.0);
      objc_msgSend(v33, "setFrame:", v21, v20, width, height);
      objc_msgSend(v22, "addSublayer:", v33);

    }
  }

  return v22;
}

- (BOOL)supportsOptions
{
  return 0;
}

- (UIEdgeInsets)insetsForSize:(CGSize)a3 contentsScale:(double)a4 options:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  if (self->_shadow)
  {
    -[_BCUCoverEffectsPDF _roundedInsetsWithSize:](self, "_roundedInsetsWithSize:", a5, a3.width, a3.height, a4);
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
  }
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (id)newOperationWithImage:(CGImage *)a3 size:(CGSize)a4 contentsScale:(double)a5 priority:(float)a6 options:(id)a7 waitForCPUSynchronization:(BOOL)a8 logKey:(id)a9 completion:(id)a10
{
  _BOOL8 v12;
  double height;
  double width;
  id v19;
  id v20;
  id v21;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BCULayerRenderer *renderer;
  id v28;
  double v29;
  id v30;
  _QWORD v32[5];
  id v33;
  double v34;
  uint64_t v35;
  CGImage *v36;
  _QWORD v37[5];
  id v38;
  CGImage *v39;
  double v40;
  uint64_t v41;
  double v42;

  v12 = a8;
  height = a4.height;
  width = a4.width;
  v19 = a7;
  v20 = a9;
  v21 = a10;
  v22 = v21;
  if (a3)
  {
    v23 = sub_228580F84(a3, width, height, a5);
    v25 = v24;
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("BCUCoverEffectsFilterOptionMinificationFilter"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRetain(a3);
    renderer = self->_renderer;
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = sub_2285818DC;
    v37[3] = &unk_24F113F78;
    v38 = v26;
    v39 = a3;
    v40 = v23;
    v41 = v25;
    v42 = a5;
    v37[4] = self;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = sub_2285818F4;
    v32[3] = &unk_24F113F30;
    v32[4] = self;
    v34 = v23;
    v35 = v25;
    v33 = v22;
    v36 = a3;
    v28 = v26;
    *(float *)&v29 = a6;
    v30 = -[BCULayerRenderer newOperationWithPriority:waitForCPUSynchronization:logKey:renderLayer:completion:](renderer, "newOperationWithPriority:waitForCPUSynchronization:logKey:renderLayer:completion:", v12, v20, v37, v32, v29);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, double, double, double, double))v21 + 2))(v21, 0, 0, 0, 0.0, 0.0, 0.0, 0.0);
    v30 = 0;
  }

  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end
