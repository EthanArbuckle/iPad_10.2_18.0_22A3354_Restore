@implementation HUQuickControlMagnifierView

- (HUQuickControlMagnifierView)initWithFrame:(CGRect)a3
{
  HUQuickControlMagnifierView *v3;
  HUQuickControlMagnifierView *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HUQuickControlMagnifierView;
  v3 = -[HUQuickControlMagnifierView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUQuickControlMagnifierView setSelectedColor:](v3, "setSelectedColor:", 0);
    -[HUQuickControlMagnifierView _outlineWidth](v4, "_outlineWidth");
    v6 = v5;
    -[HUQuickControlMagnifierView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderWidth:", v6);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    -[HUQuickControlMagnifierView layer](v4, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderColor:", v9);

    -[HUQuickControlMagnifierView layer](v4, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1045220557;
    objc_msgSend(v11, "setShadowOpacity:", v12);

    -[HUQuickControlMagnifierView layer](v4, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowRadius:", 15.0);

    v14 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[HUQuickControlMagnifierView layer](v4, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShadowOffset:", v14, v15);

  }
  return v4;
}

- (double)_outlineWidth
{
  void *v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  result = 1.66666667;
  if (v4 <= 2.0)
    return 1.5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HUQuickControlMagnifierView innerRadius](self, "innerRadius", a3.width, a3.height);
  v5 = v4;
  -[HUQuickControlMagnifierView _outlineWidth](self, "_outlineWidth");
  v7 = v5 + v6 + v5 + v6;
  v8 = v7;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlMagnifierView;
  -[HUQuickControlMagnifierView layoutSubviews](&v10, sel_layoutSubviews);
  -[HUQuickControlMagnifierView bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[HUQuickControlMagnifierView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  v6 = (void *)MEMORY[0x1E0CEA390];
  -[HUQuickControlMagnifierView bounds](self, "bounds");
  objc_msgSend(v6, "bezierPathWithOvalInRect:");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "CGPath");
  -[HUQuickControlMagnifierView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShadowPath:", v8);

}

- (double)innerRadius
{
  return self->_innerRadius;
}

- (void)setInnerRadius:(double)a3
{
  self->_innerRadius = a3;
}

@end
