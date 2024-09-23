@implementation HUSimpleSliderControlView

- (HUSimpleSliderControlView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  HUSimpleSliderControlView *v7;
  uint64_t v8;
  UISlider *slider;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)HUSimpleSliderControlView;
  v7 = -[HUSimpleSliderControlView initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9B0]), "initWithFrame:", x, y, width, height);
    slider = v7->_slider;
    v7->_slider = (UISlider *)v8;

    -[UISlider setAutoresizingMask:](v7->_slider, "setAutoresizingMask:", 18);
    -[UISlider addTarget:action:forControlEvents:](v7->_slider, "addTarget:action:forControlEvents:", v7, sel__sliderTouchDown_, 1);
    -[UISlider addTarget:action:forControlEvents:](v7->_slider, "addTarget:action:forControlEvents:", v7, sel__sliderValueChanged_, 4096);
    -[UISlider addTarget:action:forControlEvents:](v7->_slider, "addTarget:action:forControlEvents:", v7, sel__sliderTouchUp_, 448);
    -[HUSimpleSliderControlView addSubview:](v7, "addSubview:", v7->_slider);
  }
  return v7;
}

- (float)minValue
{
  void *v2;
  float v3;
  float v4;

  -[HUSimpleSliderControlView slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumValue");
  v4 = v3;

  return v4;
}

- (void)setMinValue:(float)a3
{
  double v4;
  id v5;

  -[HUSimpleSliderControlView slider](self, "slider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setMinimumValue:", v4);

}

- (float)maxValue
{
  void *v2;
  float v3;
  float v4;

  -[HUSimpleSliderControlView slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumValue");
  v4 = v3;

  return v4;
}

- (void)setMaxValue:(float)a3
{
  double v4;
  id v5;

  -[HUSimpleSliderControlView slider](self, "slider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setMaximumValue:", v4);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HUSimpleSliderControlView slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HUSimpleSliderControlView slider](self, "slider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)value
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[HUSimpleSliderControlView slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  objc_msgSend(v2, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setValue:(id)a3
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  double v8;
  id v9;

  v4 = a3;
  -[HUSimpleSliderControlView slider](self, "slider");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  v7 = objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock");
  LODWORD(v8) = v6;
  objc_msgSend(v9, "setValue:animated:", v7, v8);

}

- (BOOL)isDisabled
{
  void *v2;
  char v3;

  -[HUSimpleSliderControlView slider](self, "slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled") ^ 1;

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[HUSimpleSliderControlView slider](self, "slider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)_sliderTouchDown:(id)a3
{
  id v4;

  -[HUSimpleSliderControlView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlViewDidBeginUserInteraction:", self);

}

- (void)_sliderTouchUp:(id)a3
{
  id v4;

  -[HUSimpleSliderControlView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlViewDidEndUserInteraction:", self);

}

- (void)_sliderValueChanged:(id)a3
{
  void *v4;
  id v5;

  -[HUSimpleSliderControlView delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUSimpleSliderControlView value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlView:valueDidChange:", self, v4);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (HUControlViewDelegate)delegate
{
  return (HUControlViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISlider)slider
{
  return self->_slider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
