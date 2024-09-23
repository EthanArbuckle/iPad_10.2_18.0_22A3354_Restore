@implementation ABShadowView

- (ABShadowView)initWithFrame:(CGRect)a3
{
  ABShadowView *v3;
  ABShadowView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABShadowView;
  v3 = -[ABShadowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_topShadowRatio = 0.5;
    -[ABShadowView _setupGradient](v3, "_setupGradient");
  }
  return v4;
}

- (void)_setupGradient
{
  CAGradientLayer *v3;
  CAGradientLayer *topGradientLayer;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  CAGradientLayer *v13;
  void *v14;
  CABackdropLayer *v15;
  CABackdropLayer *bottomVariableBlurLayer;
  void *v17;
  void *v18;
  void *v19;
  CAGradientLayer *v20;
  CAGradientLayer *bottomGradientLayer;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  CATransform3D v34;
  CATransform3D v35;
  void *v36;
  _QWORD v37[18];

  v37[16] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE56B8], "layer");
  v3 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
  topGradientLayer = self->_topGradientLayer;
  self->_topGradientLayer = v3;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.00392156863);
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[0] = objc_msgSend(v33, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0143711881);
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[1] = objc_msgSend(v32, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0442915775);
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[2] = objc_msgSend(v31, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0728674787);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[3] = objc_msgSend(v30, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.114800887);
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[4] = objc_msgSend(v29, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.173203094);
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[5] = objc_msgSend(v28, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.250244738);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[6] = objc_msgSend(v27, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.346236755);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[7] = objc_msgSend(v26, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.458754447);
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[8] = objc_msgSend(v25, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.707279774);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[9] = objc_msgSend(v5, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.822990973);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[10] = objc_msgSend(v6, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.917060124);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[11] = objc_msgSend(v7, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.952464435);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[12] = objc_msgSend(v8, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.978587023);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[13] = objc_msgSend(v9, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.994603225);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[14] = objc_msgSend(v10, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37[15] = objc_msgSend(v11, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](self->_topGradientLayer, "setColors:", v12);

  -[CAGradientLayer setLocations:](self->_topGradientLayer, "setLocations:", &unk_250742A18);
  CATransform3DMakeScale(&v35, 1.0, -1.0, 1.0);
  v13 = self->_topGradientLayer;
  v34 = v35;
  -[CAGradientLayer setTransform:](v13, "setTransform:", &v34);
  -[ABShadowView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSublayer:", self->_topGradientLayer);

  objc_msgSend(MEMORY[0x24BDE5640], "layer");
  v15 = (CABackdropLayer *)objc_claimAutoreleasedReturnValue();
  bottomVariableBlurLayer = self->_bottomVariableBlurLayer;
  self->_bottomVariableBlurLayer = v15;

  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5C28]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABackdropLayer setFilters:](self->_bottomVariableBlurLayer, "setFilters:", v18);

  -[CABackdropLayer setValue:forKeyPath:](self->_bottomVariableBlurLayer, "setValue:forKeyPath:", &unk_2507426A0, CFSTR("filters.variableBlur.inputRadius"));
  -[CABackdropLayer setValue:forKeyPath:](self->_bottomVariableBlurLayer, "setValue:forKeyPath:", MEMORY[0x24BDBD1C8], CFSTR("filters.variableBlur.inputNormalizeEdges"));
  -[ABShadowView layer](self, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSublayer:", self->_bottomVariableBlurLayer);

  objc_msgSend(MEMORY[0x24BDE56B8], "layer");
  v20 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
  bottomGradientLayer = self->_bottomGradientLayer;
  self->_bottomGradientLayer = v20;

  -[CAGradientLayer colors](self->_topGradientLayer, "colors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](self->_bottomGradientLayer, "setColors:", v22);

  -[CAGradientLayer locations](self->_topGradientLayer, "locations");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setLocations:](self->_bottomGradientLayer, "setLocations:", v23);

  -[ABShadowView layer](self, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSublayer:", self->_bottomGradientLayer);

}

- (void)setTopShadowRatio:(double)a3
{
  if (a1)
  {
    if (*((double *)a1 + 55) != a3)
    {
      *((double *)a1 + 55) = a3;
      return (void *)objc_msgSend(a1, "setNeedsLayout");
    }
  }
  return a1;
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
  CGRect v10;
  CGRect v11;

  -[ABShadowView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = v5 * 0.75;
  -[CAGradientLayer setFrame:](self->_topGradientLayer, "setFrame:", 0.0, 0.0);
  -[ABShadowView bounds](self, "bounds");
  -[CAGradientLayer setFrame:](self->_bottomGradientLayer, "setFrame:", 0.0, v6 - v7);
  -[CABackdropLayer frame](self->_bottomVariableBlurLayer, "frame");
  v8 = v6 * 0.45;
  v9 = v6 - v6 * 0.45;
  v11.origin.x = 0.0;
  v11.origin.y = v9;
  v11.size.width = v4;
  v11.size.height = v8;
  if (!CGRectEqualToRect(v10, v11))
  {
    -[CABackdropLayer setFrame:](self->_bottomVariableBlurLayer, "setFrame:", 0.0, v9, v4, v8);
    -[CABackdropLayer setValue:forKeyPath:](self->_bottomVariableBlurLayer, "setValue:forKeyPath:", -[ABShadowView _renderBottomVariableBlurMaskWithSize:](self, "_renderBottomVariableBlurMaskWithSize:", v4, v8), CFSTR("filters.variableBlur.inputMaskImage"));
  }
}

- (CGImage)_renderBottomVariableBlurMaskWithSize:(CGSize)a3
{
  double height;
  double width;
  CGColorSpace *DeviceRGB;
  size_t AlignedBytesPerRow;
  CGContext *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CGFloat *v14;
  uint64_t i;
  double v16;
  double v17;
  float v18;
  id v19;
  CGGradient *v20;
  CGImageRef Image;
  CGPoint v23;
  CGPoint v24;
  CGRect v25;

  height = a3.height;
  width = a3.width;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v7 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 32);
  LODWORD(v9) = 1053609165;
  LODWORD(v10) = 0;
  LODWORD(v11) = 1.0;
  LODWORD(v12) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (CGFloat *)malloc_type_malloc(0x100uLL, 0x100004000313F17uLL);
  for (i = 0; i != 32; ++i)
  {
    v16 = (double)i;
    v17 = (double)i / 31.0;
    *(float *)&v16 = v17;
    objc_msgSend(v13, "_solveForInput:", v16);
    v14[i] = v18;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 1.0 - v17);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "addObject:", objc_msgSend(v19, "CGColor"));

  }
  v20 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v8, v14);
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = width;
  v25.size.height = height;
  CGContextClearRect(v7, v25);
  v23.x = 0.0;
  v23.y = 0.0;
  v24.x = 0.0;
  v24.y = height;
  CGContextDrawLinearGradient(v7, v20, v23, v24, 3u);
  Image = CGBitmapContextCreateImage(v7);
  CFAutorelease(Image);
  if (DeviceRGB)
    CFRelease(DeviceRGB);
  if (v20)
    CFRelease(v20);
  free(v14);
  if (v7)
    CFRelease(v7);

  return Image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomVariableBlurLayer, 0);
  objc_storeStrong((id *)&self->_bottomGradientLayer, 0);
  objc_storeStrong((id *)&self->_topGradientLayer, 0);
}

@end
