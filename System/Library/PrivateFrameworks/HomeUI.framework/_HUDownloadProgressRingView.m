@implementation _HUDownloadProgressRingView

- (_HUDownloadProgressRingView)initWithFrame:(CGRect)a3
{
  _HUDownloadProgressRingView *v3;
  _HUDownloadProgressRingView *v4;
  void *v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_HUDownloadProgressRingView;
  v3 = -[_HUDownloadProgressRingView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_HUDownloadProgressRingView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[_HUDownloadProgressRingView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v5, "setStrokeStart:", 0.0);
    -[_HUDownloadProgressRingView tintColor](v4, "tintColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

    objc_msgSend(v5, "setLineCap:", CFSTR("round"));
    -[_HUDownloadProgressRingView _updateShapePath](v4, "_updateShapePath");

  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_HUDownloadProgressRingView;
  -[_HUDownloadProgressRingView layoutSubviews](&v3, sel_layoutSubviews);
  -[_HUDownloadProgressRingView _updateShapePath](self, "_updateShapePath");
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HUDownloadProgressRingView;
  -[_HUDownloadProgressRingView tintColorDidChange](&v6, sel_tintColorDidChange);
  -[_HUDownloadProgressRingView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HUDownloadProgressRingView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HUDownloadProgressRingView;
  if (-[_HUDownloadProgressRingView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("strokeEnd"));

  return v5;
}

- (void)setProgress:(double)a3
{
  id v4;

  self->_progress = a3;
  -[_HUDownloadProgressRingView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrokeEnd:", self->_progress);

}

- (void)_updateShapePath
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v20;
  double MidX;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  -[_HUDownloadProgressRingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_HUDownloadProgressRingView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = HUGetSafeScaleForValue(v12);

  -[_HUDownloadProgressRingView layer](self, "layer");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lineWidth");
  v15 = v14 * 0.5;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  v29 = CGRectInset(v28, v15, v15);
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  MidX = CGRectGetMidX(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  objc_msgSend(v20, "moveToPoint:", MidX, CGRectGetMinY(v31));
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v22 = CGRectGetWidth(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v23 = CGRectGetHeight(v33);
  if (v22 < v23)
    v23 = v22;
  v24 = v23 * 0.5;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v25 = CGRectGetMidX(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  objc_msgSend(v20, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v25, CGRectGetMidY(v35), v24, -1.57079633, 4.71238898);
  v26 = objc_retainAutorelease(v20);
  objc_msgSend(v27, "setPath:", objc_msgSend(v26, "CGPath"));
  objc_msgSend(v27, "setLineWidth:", 1.0 / v13 + 2.0);

}

- (double)progress
{
  return self->_progress;
}

@end
