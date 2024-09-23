@implementation HUQuickControlSliderValueOverlayView

- (void)setLayerColor:(id)a3
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)&self->_layerColor, a3);
  v5 = a3;
  -[HUQuickControlSliderValueOverlayView _updateBlendMode](self, "_updateBlendMode");
  -[HUQuickControlSliderValueOverlayView traitCollection](self, "traitCollection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInterfaceStyle");
  v6 = -[HUQuickControlSliderValueOverlayView isOff](self, "isOff");
  borderColorSurroundingColor(v5, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlSliderValueOverlayView topBorder](self, "topBorder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

}

- (UIColor)layerColor
{
  return self->_layerColor;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (HUQuickControlSliderValueOverlayView)initWithFrame:(CGRect)a3
{
  double width;
  HUQuickControlSliderValueOverlayView *v4;
  HUQuickControlSliderValueOverlayView *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIView *topBorder;
  objc_super v12;

  width = a3.size.width;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlSliderValueOverlayView;
  v4 = -[HUQuickControlSliderValueOverlayView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_showGrabbers = 1;
    v6 = *MEMORY[0x1E0CD2B70];
    -[HUQuickControlSliderValueOverlayView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFillRule:", v6);

    -[HUQuickControlSliderValueOverlayView layer](v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMasksToBounds:", 1);

    -[HUQuickControlSliderValueOverlayView setPrimaryGrabberLocation:](v5, "setPrimaryGrabberLocation:", 0);
    v9 = objc_opt_new();
    topBorder = v5->_topBorder;
    v5->_topBorder = (UIView *)v9;

    -[UIView setFrame:](v5->_topBorder, "setFrame:", 0.0, 0.0, width, 5.0);
    -[HUQuickControlSliderValueOverlayView addSubview:](v5, "addSubview:", v5->_topBorder);
    -[HUQuickControlSliderValueOverlayView _updateShape](v5, "_updateShape");
    -[HUQuickControlSliderValueOverlayView _updateBlendMode](v5, "_updateBlendMode");
  }
  return v5;
}

- (void)setOff:(BOOL)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_off != a3)
  {
    self->_off = a3;
    -[HUQuickControlSliderValueOverlayView _updateBlendMode](self, "_updateBlendMode");
  }
  -[HUQuickControlSliderValueOverlayView layerColor](self, "layerColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSliderValueOverlayView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInterfaceStyle");
  v5 = -[HUQuickControlSliderValueOverlayView isOff](self, "isOff");
  borderColorSurroundingColor(v9, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSliderValueOverlayView topBorder](self, "topBorder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

}

- (void)setShowGrabbers:(BOOL)a3
{
  if (self->_showGrabbers != a3)
  {
    self->_showGrabbers = a3;
    -[HUQuickControlSliderValueOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHasSecondGrabber:(BOOL)a3
{
  if (self->_hasSecondGrabber != a3)
  {
    self->_hasSecondGrabber = a3;
    -[HUQuickControlSliderValueOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPrimaryGrabberLocation:(unint64_t)a3
{
  if (self->_primaryGrabberLocation != a3)
  {
    self->_primaryGrabberLocation = a3;
    -[HUQuickControlSliderValueOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setControlSize:(unint64_t)a3
{
  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    -[HUQuickControlSliderValueOverlayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateShape
{
  void *v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  CGRect v32;
  CGRect v33;

  v3 = (void *)MEMORY[0x1E0CEA390];
  -[HUQuickControlSliderValueOverlayView bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithRect:");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (-[HUQuickControlSliderValueOverlayView showGrabbers](self, "showGrabbers"))
  {
    v4 = -[HUQuickControlSliderValueOverlayView controlSize](self, "controlSize");
    -[HUQuickControlSliderValueOverlayView bounds](self, "bounds");
    v6 = 0.65;
    if (v4 != 2)
      v6 = 0.75;
    v7 = v6 * v5;
    -[HUQuickControlSliderValueOverlayView bounds](self, "bounds");
    v8 = CGRectGetMidX(v32) + v7 * -0.5;
    v9 = -[HUQuickControlSliderValueOverlayView primaryGrabberLocation](self, "primaryGrabberLocation");
    v10 = 18.0;
    if (v9 == 1)
    {
      -[HUQuickControlSliderValueOverlayView bounds](self, "bounds");
      v10 = v11 + -10.0 + -18.0;
    }
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", v8, v10, v7, 10.0, 5.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "appendPath:", v12);
    -[HUQuickControlSliderValueOverlayView bounds](self, "bounds");
    if (v13 > 0.0)
    {
      -[HUQuickControlSliderValueOverlayView primaryGrabberShadowLayer](self, "primaryGrabberShadowLayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        -[HUQuickControlSliderValueOverlayView _createGrabberShadowLayer](self, "_createGrabberShadowLayer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUQuickControlSliderValueOverlayView setPrimaryGrabberShadowLayer:](self, "setPrimaryGrabberShadowLayer:", v15);
        -[HUQuickControlSliderValueOverlayView layer](self, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "insertSublayer:atIndex:", v15, 0);

      }
    }
    v17 = objc_retainAutorelease(v12);
    v18 = objc_msgSend(v17, "CGPath");
    -[HUQuickControlSliderValueOverlayView primaryGrabberShadowLayer](self, "primaryGrabberShadowLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPath:", v18);

    if (-[HUQuickControlSliderValueOverlayView hasSecondGrabber](self, "hasSecondGrabber"))
    {
      -[HUQuickControlSliderValueOverlayView bounds](self, "bounds");
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", v8, CGRectGetMaxY(v33) + -28.0, v7, 10.0, 5.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "appendPath:", v20);
      -[HUQuickControlSliderValueOverlayView bounds](self, "bounds");
      if (v21 > 0.0)
      {
        -[HUQuickControlSliderValueOverlayView secondaryGrabberShadowLayer](self, "secondaryGrabberShadowLayer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          -[HUQuickControlSliderValueOverlayView _createGrabberShadowLayer](self, "_createGrabberShadowLayer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlSliderValueOverlayView setSecondaryGrabberShadowLayer:](self, "setSecondaryGrabberShadowLayer:", v23);
          -[HUQuickControlSliderValueOverlayView layer](self, "layer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "insertSublayer:atIndex:", v23, 0);

        }
      }
      v25 = objc_retainAutorelease(v20);
      v26 = objc_msgSend(v25, "CGPath");
      -[HUQuickControlSliderValueOverlayView secondaryGrabberShadowLayer](self, "secondaryGrabberShadowLayer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setPath:", v26);

    }
    v28 = objc_msgSend(objc_retainAutorelease(v31), "CGPath");
    -[HUQuickControlSliderValueOverlayView layer](self, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPath:", v28);

  }
  else
  {
    v30 = objc_msgSend(objc_retainAutorelease(v31), "CGPath");
    -[HUQuickControlSliderValueOverlayView layer](self, "layer");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPath:", v30);
  }

}

- (id)_createGrabberShadowLayer
{
  void *v2;
  double v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShadowRadius:", 10.0);
  LODWORD(v3) = *(_DWORD *)"333?";
  objc_msgSend(v2, "setShadowOpacity:", v3);
  objc_msgSend(MEMORY[0x1E0CEA478], "darkGrayColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setShadowColor:", objc_msgSend(v4, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setFillColor:", objc_msgSend(v5, "CGColor"));

  objc_msgSend(v2, "setShadowOffset:", 0.0, 5.0);
  return v2;
}

- (void)_updateBlendMode
{
  uint64_t v3;
  void *v4;
  id v5;

  if (-[HUQuickControlSliderValueOverlayView isOff](self, "isOff"))
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    -[HUQuickControlSliderValueOverlayView layerColor](self, "layerColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v5, "CGColor");
  -[HUQuickControlSliderValueOverlayView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFillColor:", v3);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUQuickControlSliderValueOverlayView;
  -[HUQuickControlSliderValueOverlayView layoutSubviews](&v11, sel_layoutSubviews);
  -[HUQuickControlSliderValueOverlayView _updateShape](self, "_updateShape");
  -[HUQuickControlSliderValueOverlayView topBorder](self, "topBorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[HUQuickControlSliderValueOverlayView bounds](self, "bounds");
  v7 = v6;

  if (v5 < v7)
  {
    -[HUQuickControlSliderValueOverlayView bounds](self, "bounds");
    v9 = v8;
    -[HUQuickControlSliderValueOverlayView topBorder](self, "topBorder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFrame:", 0.0, 0.0, v9, 1.0);

  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("fillColor")) & 1) != 0
    || (objc_msgSend(v4, "hasPrefix:", CFSTR("compositingFilter")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUQuickControlSliderValueOverlayView;
    v5 = -[HUQuickControlSliderValueOverlayView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (BOOL)isOff
{
  return self->_off;
}

- (BOOL)hasSecondGrabber
{
  return self->_hasSecondGrabber;
}

- (BOOL)showGrabbers
{
  return self->_showGrabbers;
}

- (unint64_t)primaryGrabberLocation
{
  return self->_primaryGrabberLocation;
}

- (unint64_t)controlSize
{
  return self->_controlSize;
}

- (CAShapeLayer)primaryGrabberShadowLayer
{
  return self->_primaryGrabberShadowLayer;
}

- (void)setPrimaryGrabberShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_primaryGrabberShadowLayer, a3);
}

- (CAShapeLayer)secondaryGrabberShadowLayer
{
  return (CAShapeLayer *)objc_loadWeakRetained((id *)&self->_secondaryGrabberShadowLayer);
}

- (void)setSecondaryGrabberShadowLayer:(id)a3
{
  objc_storeWeak((id *)&self->_secondaryGrabberShadowLayer, a3);
}

- (UIView)topBorder
{
  return self->_topBorder;
}

- (void)setTopBorder:(id)a3
{
  objc_storeStrong((id *)&self->_topBorder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_destroyWeak((id *)&self->_secondaryGrabberShadowLayer);
  objc_storeStrong((id *)&self->_primaryGrabberShadowLayer, 0);
  objc_storeStrong((id *)&self->_layerColor, 0);
}

@end
