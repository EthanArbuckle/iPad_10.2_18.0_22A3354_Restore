@implementation BCUIRingCapShadow

+ (id)ringCapShadowForRingWithBounds:(CGRect)a3 lineWidth:(double)a4
{
  return -[BCUIRingCapShadow _initWithRingBounds:lineWidth:]([BCUIRingCapShadow alloc], "_initWithRingBounds:lineWidth:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (void)setArcFraction:(double)a3
{
  if (self->_arcFraction != a3)
  {
    self->_arcFraction = a3;
    -[BCUIRingCapShadow setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIImageView *shadowCapImageView;
  uint64_t v12;
  CGFloat v13;
  UIImageView *v14;
  CGAffineTransform v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)BCUIRingCapShadow;
  -[BCUIRingCapShadow layoutSubviews](&v24, sel_layoutSubviews);
  -[BCUIRingCapShadow _shadowCapFrame](self, "_shadowCapFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  shadowCapImageView = self->_shadowCapImageView;
  if (shadowCapImageView)
    -[UIImageView transform](shadowCapImageView, "transform");
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __35__BCUIRingCapShadow_layoutSubviews__block_invoke;
  v20[3] = &unk_1E9418368;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v20);
  -[UIImageView setFrame:](self->_shadowCapImageView, "setFrame:", v4, v6, v8, v10);
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __35__BCUIRingCapShadow_layoutSubviews__block_invoke_2;
  v16[3] = &unk_1E94184D0;
  v16[4] = self;
  v17 = v21;
  v18 = v22;
  v19 = v23;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v16);
  v13 = (self->_arcFraction + -0.75 + self->_arcFraction + -0.75) * 3.14159265;
  v14 = self->_shadowCapImageView;
  CGAffineTransformMakeRotation(&v15, v13);
  -[UIImageView setTransform:](v14, "setTransform:", &v15);
}

uint64_t __35__BCUIRingCapShadow_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __35__BCUIRingCapShadow_layoutSubviews__block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

+ (id)_ringCapShadowImageWithRingBounds:(CGRect)a3 lineWidth:(double)a4 scale:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[10];
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = CGRectGetWidth(a3);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("ringCapShadow-%fx%f%f@%f"), *(_QWORD *)&v12, CGRectGetHeight(v18), *(_QWORD *)&a4, *(_QWORD *)&a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[BCUIMappedImageCache sharedCache](BCUIMappedImageCache, "sharedCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__BCUIRingCapShadow__ringCapShadowImageWithRingBounds_lineWidth_scale___block_invoke;
  v17[3] = &__block_descriptor_80_e18___UIImage_16__0_Q8l;
  *(CGFloat *)&v17[4] = x;
  *(CGFloat *)&v17[5] = y;
  *(CGFloat *)&v17[6] = width;
  *(CGFloat *)&v17[7] = height;
  *(double *)&v17[8] = a4;
  *(double *)&v17[9] = a5;
  objc_msgSend(v14, "imageForKey:generatingIfNecessaryWithBlock:", v13, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __71__BCUIRingCapShadow__ringCapShadowImageWithRingBounds_lineWidth_scale___block_invoke(double *a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  BCUIRingView *v9;
  void *v10;
  CGColorSpace *DeviceGray;
  size_t Width;
  CGFloat Height;
  CGContext *v14;
  void *v15;
  CGImageRef Image;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _BYTE v26[24];
  uint64_t v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGImageRef v37;
  _BYTE v38[20];
  uint64_t v39;
  CGRect v40;
  CGRect v41;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = a1[8];
  v1 = a1[9];
  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  *(_OWORD *)&v38[4] = *MEMORY[0x1E0C9D820];
  *(_DWORD *)v26 = 1065353216;
  *(_OWORD *)&v26[4] = *(_OWORD *)v38;
  *(_DWORD *)&v26[20] = *(_DWORD *)&v38[16];
  v27 = 0x4014000000000000;
  objc_msgSend(MEMORY[0x1E0DC3870], "mt_shadowTemplateImageWithAttributes:scale:maskCornerRadius:continuousCorners:maskSize:resizableCapInsets:", v26, 0, 0, v1, v2 * 0.5, v2 * 0.5 + v2 * 0.5, v2 * 0.5 + v2 * 0.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithRenderingMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(BCUIRingView);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCUIRingView setStrokeColor:](v9, "setStrokeColor:", v10);

  -[BCUIRingView setFrame:](v9, "setFrame:", v3, v4, v5, v6);
  -[BCUIRingView setRingStart:](v9, "setRingStart:", 0.755);
  -[BCUIRingView setRingEnd:](v9, "setRingEnd:", 1.0);
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v40.origin.x = v3;
  v40.origin.y = v4;
  v40.size.width = v5;
  v40.size.height = v6;
  Width = (unint64_t)CGRectGetWidth(v40);
  v41.origin.x = v3;
  v41.origin.y = v4;
  v41.size.width = v5;
  v41.size.height = v6;
  Height = CGRectGetHeight(v41);
  v14 = CGBitmapContextCreate(0, Width, (unint64_t)Height, 8uLL, 0, DeviceGray, 0);
  CGColorSpaceRelease(DeviceGray);
  -[BCUIRingView layer](v9, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "renderInContext:", v14);

  Image = CGBitmapContextCreateImage(v14);
  CGContextRelease(v14);

  objc_msgSend(v8, "size");
  v18 = v17;
  v20 = v19;
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setScale:", v1);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v21, v18, v20);
  *(_QWORD *)v26 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v26[8] = 3221225472;
  *(_QWORD *)&v26[16] = __NewRingCapShadowImage_block_invoke;
  v27 = (uint64_t)&unk_1E9418518;
  v29 = v3;
  v30 = v4;
  v31 = v5;
  v32 = v6;
  v33 = v2;
  v34 = v1;
  v35 = v18;
  v36 = v20;
  v37 = Image;
  v28 = v8;
  v23 = v8;
  objc_msgSend(v22, "imageWithActions:", v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_initWithRingBounds:(CGRect)a3 lineWidth:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  BCUIRingCapShadow *v9;
  id *p_isa;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)BCUIRingCapShadow;
  v9 = -[BCUIRingCapShadow init](&v21, sel_init);
  p_isa = (id *)&v9->super.super.super.isa;
  if (v9)
  {
    v9->_ringBounds.origin.x = x;
    v9->_ringBounds.origin.y = y;
    v9->_ringBounds.size.width = width;
    v9->_ringBounds.size.height = height;
    v9->_lineWidth = a4;
    v11 = objc_alloc(MEMORY[0x1E0DC3890]);
    v12 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    objc_msgSend(v12, "_ringCapShadowImageWithRingBounds:lineWidth:scale:", x, y, width, height, a4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "initWithImage:", v15);
    v17 = p_isa[52];
    p_isa[52] = (id)v16;

    objc_msgSend(p_isa, "addSubview:", p_isa[52]);
    objc_msgSend(p_isa, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowsGroupBlending:", 0);

    objc_msgSend(p_isa[52], "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCompositingFilter:", *MEMORY[0x1E0CD2E98]);

  }
  return p_isa;
}

- (CGRect)_shadowCapFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  v16 = CGRectInset(self->_ringBounds, self->_lineWidth * 0.5, self->_lineWidth * 0.5);
  CoordinatesOfPointAtArcFraction(v16.origin.x, v16.origin.y, v16.size.width, v16.size.height, self->_arcFraction);
  UIPointRoundToScale();
  v4 = v3;
  v6 = v5;
  -[UIImageView image](self->_shadowCapImageView, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;

  v12 = v4 - v9 * 0.5;
  v13 = v6 - v11 * 0.5;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)ringBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_ringBounds.origin.x;
  y = self->_ringBounds.origin.y;
  width = self->_ringBounds.size.width;
  height = self->_ringBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (double)arcFraction
{
  return self->_arcFraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowCapImageView, 0);
}

@end
