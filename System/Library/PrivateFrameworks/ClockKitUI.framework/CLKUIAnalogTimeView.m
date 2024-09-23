@implementation CLKUIAnalogTimeView

- (CLKUIAnalogTimeView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  id v6;
  CLKUIAnalogTimeView *v7;
  CLKUIHandsView *v8;
  uint64_t v9;
  CLKUIHandsView *handsView;
  void *v11;
  void *v12;
  _BYTE v14[8];
  double v15;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLKUIAnalogTimeView;
  v7 = -[CLKUITimeView initWithDevice:clockTimer:](&v16, sel_initWithDevice_clockTimer_, v6, a4);
  if (v7)
  {
    v8 = [CLKUIHandsView alloc];
    _LayoutConstants_1(v6, (uint64_t)v14);
    v9 = -[CLKUIHandsView initWithDiameter:forDevice:](v8, "initWithDiameter:forDevice:", v6, v15);
    handsView = v7->_handsView;
    v7->_handsView = (CLKUIHandsView *)v9;

    -[CLKUIAnalogHandsView hourHandView](v7->_handsView, "hourHandView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnableBackgroundColorAction:", 1);

    -[CLKUIAnalogHandsView minuteHandView](v7->_handsView, "minuteHandView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnableBackgroundColorAction:", 1);

    -[CLKUIAnalogTimeView addSubview:](v7, "addSubview:", v7->_handsView);
  }

  return v7;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MidX;
  void *v16;
  double v17;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v19.receiver = self;
  v19.super_class = (Class)CLKUIAnalogTimeView;
  -[CLKUIAnalogTimeView layoutSubviews](&v19, sel_layoutSubviews);
  MEMORY[0x1D17A167C](-[CLKUIAnalogTimeView bounds](self, "bounds"));
  -[CLKUIHandsView setCenter:](self->_handsView, "setCenter:");
  if (self->_ticksView)
  {
    -[CLKUIAnalogTimeView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[CLKUITimeView dialInset](self, "dialInset");
    v12 = v11;
    -[CLKUITimeView dialInset](self, "dialInset");
    v14 = v13;
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    v21 = CGRectInset(v20, v12, v14);
    -[CLKUIDualTimeAnalogTicksView setFrame:](self->_ticksView, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
  }
  if (self->_backgroundView)
  {
    -[CLKUIAnalogTimeView bounds](self, "bounds");
    MidX = CGRectGetMidX(v22);
    -[UIView layer](self->_backgroundView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerRadius:", MidX);

    -[CLKUIAnalogTimeView bounds](self, "bounds");
    -[UIView setFrame:](self->_backgroundView, "setFrame:");
  }
  if (self->_inactiveBackgroundView)
  {
    -[CLKUIAnalogTimeView bounds](self, "bounds");
    v17 = CGRectGetMidX(v23);
    -[UIView layer](self->_inactiveBackgroundView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", v17);

    -[CLKUIAnalogTimeView bounds](self, "bounds");
    -[UIView setFrame:](self->_inactiveBackgroundView, "setFrame:");
  }
}

- (void)setConfiguration:(id)a3
{
  id v4;
  int v5;
  CLKUIDualTimeAnalogTicksView *ticksView;
  void *v7;
  uint64_t v8;
  CLKUIDualTimeAnalogTicksView *v9;
  CLKUIDualTimeAnalogTicksView *v10;
  CLKUIDualTimeAnalogTicksView *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  CLKUIDualTimeAnalogTicksView *v16;
  void *v17;
  void *v18;
  UIView *backgroundView;
  UIView *v20;
  UIView *v21;
  UIView *v22;
  void *v23;
  UIView *inactiveBackgroundView;
  UIView *v25;
  UIView *v26;
  UIView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _OWORD v35[3];
  uint64_t v36;
  uint64_t v37;
  char v38;
  _DWORD v39[3];
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CLKUIAnalogTimeView;
  -[CLKUITimeView setConfiguration:](&v43, sel_setConfiguration_, v4);
  v5 = objc_msgSend(v4, "showsDialTicks");
  ticksView = self->_ticksView;
  if (v5)
  {
    if (ticksView)
    {
      -[CLKUIDualTimeAnalogTicksView setHidden:](ticksView, "setHidden:", 0);
    }
    else
    {
      v42 = 0;
      v40 = 0u;
      v41 = 0u;
      -[CLKUITimeView device](self, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _LayoutConstants_1(v7, (uint64_t)&v40);

      v8 = v42;
      v9 = [CLKUIDualTimeAnalogTicksView alloc];
      v35[0] = xmmword_1CB9E28D0;
      v35[1] = v41;
      v35[2] = v41;
      v36 = v8;
      v37 = v8;
      v38 = 1;
      v39[0] = 0;
      *(_DWORD *)((char *)v39 + 3) = 0;
      v10 = -[CLKUIDualTimeAnalogTicksView initWithConfiguration:](v9, "initWithConfiguration:", v35);
      v11 = self->_ticksView;
      self->_ticksView = v10;

      -[CLKUIAnalogTimeView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_ticksView, 0);
    }
    objc_msgSend(v4, "majorTickColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[CLKUITimeView timeColor](self, "timeColor");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    v16 = self->_ticksView;
    objc_msgSend(v15, "colorWithAlphaComponent:", 0.5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIDualTimeAnalogTicksView setHourTickColor:minuteTickColor:](v16, "setHourTickColor:minuteTickColor:", v15, v17);

  }
  else if (ticksView)
  {
    -[CLKUIDualTimeAnalogTicksView setHidden:](ticksView, "setHidden:", 1);
  }
  objc_msgSend(v4, "backgroundView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  backgroundView = self->_backgroundView;
  if (v18)
  {
    if (backgroundView)
      -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_msgSend(v4, "backgroundView");
    v20 = (UIView *)objc_claimAutoreleasedReturnValue();
    v21 = self->_backgroundView;
    self->_backgroundView = v20;

    -[UIView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", 1);
    -[CLKUIAnalogTimeView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
  }
  else if (backgroundView)
  {
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    v22 = self->_backgroundView;
    self->_backgroundView = 0;

  }
  objc_msgSend(v4, "inactiveBackgroundView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  inactiveBackgroundView = self->_inactiveBackgroundView;
  if (v23)
  {
    if (inactiveBackgroundView)
      -[UIView removeFromSuperview](inactiveBackgroundView, "removeFromSuperview");
    objc_msgSend(v4, "inactiveBackgroundView");
    v25 = (UIView *)objc_claimAutoreleasedReturnValue();
    v26 = self->_inactiveBackgroundView;
    self->_inactiveBackgroundView = v25;

    -[UIView setClipsToBounds:](self->_inactiveBackgroundView, "setClipsToBounds:", 1);
    -[UIView setAlpha:](self->_inactiveBackgroundView, "setAlpha:", 0.0);
    -[CLKUIAnalogTimeView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_inactiveBackgroundView, 0);
  }
  else if (inactiveBackgroundView)
  {
    -[UIView removeFromSuperview](inactiveBackgroundView, "removeFromSuperview");
    v27 = self->_inactiveBackgroundView;
    self->_inactiveBackgroundView = 0;

  }
  -[CLKUIAnalogHandsView setSecondHandDisabled:](self->_handsView, "setSecondHandDisabled:", objc_msgSend(v4, "secondHandDisabled"));
  objc_msgSend(v4, "secondHandColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hourMinuteHandInlayColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hourMinuteHandOutlineColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIAnalogHandsView applySecondHandColor:](self->_handsView, "applySecondHandColor:", v28);
  -[CLKUIAnalogHandsView setInlayColor:](self->_handsView, "setInlayColor:", v29);
  -[CLKUIAnalogHandsView minuteHandView](self->_handsView, "minuteHandView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setColor:", v30);

  -[CLKUIAnalogHandsView hourHandView](self->_handsView, "hourHandView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setColor:", v30);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIAnalogHandsView secondHandView](self->_handsView, "secondHandView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setHandDotColor:", v33);

}

- (void)setState:(unint64_t)a3
{
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKUIAnalogTimeView;
  -[CLKUITimeView setState:](&v6, sel_setState_);
  if (a3)
  {
    if (a3 != 1)
      return;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  -[CLKUIAnalogHandsView setFrozen:](self->_handsView, "setFrozen:", v5);
}

- (void)setOverrideDate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKUIAnalogTimeView;
  v4 = a3;
  -[CLKUITimeView setOverrideDate:](&v5, sel_setOverrideDate_, v4);
  -[CLKUIHandsView setOverrideDate:](self->_handsView, "setOverrideDate:", v4, v5.receiver, v5.super_class);

}

- (void)setAodTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  _OWORD v7[3];
  _OWORD v8[3];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLKUIAnalogTimeView;
  v5 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v5;
  v8[2] = *(_OWORD *)&a3->tx;
  -[CLKUITimeView setAodTransform:](&v9, sel_setAodTransform_, v8);
  v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  -[CLKUIAnalogTimeView setTransform:](self, "setTransform:", v7);
}

+ (double)dialContainerSizeForDevice:(id)a3
{
  double v4[5];

  _LayoutConstants_1(a3, (uint64_t)v4);
  return v4[0];
}

- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  CLKUIDualTimeAnalogTicksView *ticksView;
  void *v26;
  UIView *inactiveBackgroundView;
  id v28;

  v5 = a4;
  -[CLKUIAnalogTimeView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "activeAppearance");
  v8 = objc_msgSend(v5, "activeAppearance");

  if (v7 != v8)
  {
    -[CLKUIAnalogTimeView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "activeAppearance");

    if (v10)
      v11 = 1.0;
    else
      v11 = 0.0;
    -[CLKUITimeView configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v12;
    if (v10)
    {
      objc_msgSend(v12, "hourMinuteHandInlayColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hourMinuteHandOutlineColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = v15;
    }
    else
    {
      objc_msgSend(v12, "inactiveHourMinuteHandInlayColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "inactiveHourMinuteHandOutlineColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[CLKUIAnalogHandsView setInlayColor:](self->_handsView, "setInlayColor:", v16);
    -[CLKUIAnalogHandsView minuteHandView](self->_handsView, "minuteHandView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setColor:", v14);

    -[CLKUIAnalogHandsView hourHandView](self->_handsView, "hourHandView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setColor:", v14);

    -[CLKUIAnalogHandsView minuteHandView](self->_handsView, "minuteHandView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHandDotColor:", v15);

    -[CLKUIAnalogHandsView secondHandView](self->_handsView, "secondHandView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", v11);

    if (self->_ticksView)
    {
      if (v10)
      {
        objc_msgSend(v28, "majorTickColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v23 = v21;
        }
        else
        {
          -[CLKUITimeView timeColor](self, "timeColor");
          v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        v24 = v23;

      }
      else
      {
        objc_msgSend(v28, "inactiveMajorTickColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      ticksView = self->_ticksView;
      objc_msgSend(v24, "colorWithAlphaComponent:", 0.5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIDualTimeAnalogTicksView setHourTickColor:minuteTickColor:](ticksView, "setHourTickColor:minuteTickColor:", v24, v26);

    }
    inactiveBackgroundView = self->_inactiveBackgroundView;
    if (inactiveBackgroundView)
    {
      -[UIView setAlpha:](inactiveBackgroundView, "setAlpha:", 1.0 - v11);
      -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v11);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_ticksView, 0);
  objc_storeStrong((id *)&self->_handsView, 0);
}

@end
