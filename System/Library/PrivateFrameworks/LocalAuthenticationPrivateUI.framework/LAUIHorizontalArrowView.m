@implementation LAUIHorizontalArrowView

- (LAUIHorizontalArrowView)initWithFrame:(CGRect)a3
{
  LAUIHorizontalArrowView *v3;
  LAUIHorizontalArrowView *v4;
  uint64_t v5;
  UIColor *color;
  id v7;
  double *v8;
  uint64_t v9;
  UIView *container;
  uint64_t v11;
  UIView *arrow_container;
  uint64_t v13;
  UIView *tail_container;
  void *v15;
  uint64_t v16;
  UIImageView *head;
  void *v18;
  uint64_t v19;
  UIImageView *tail;
  void *v21;
  UILabel *v22;
  UILabel *label;
  UILabel *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)LAUIHorizontalArrowView;
  v3 = -[LAUIHorizontalArrowView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_direction = 0;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v5 = objc_claimAutoreleasedReturnValue();
    color = v4->_color;
    v4->_color = (UIColor *)v5;

    v7 = objc_alloc(MEMORY[0x24BDF6F90]);
    v8 = (double *)MEMORY[0x24BDBF090];
    v9 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    container = v4->_container;
    v4->_container = (UIView *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", *v8, v8[1], v8[2], v8[3]);
    arrow_container = v4->_arrow_container;
    v4->_arrow_container = (UIView *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", *v8, v8[1], v8[2], v8[3]);
    tail_container = v4->_tail_container;
    v4->_tail_container = (UIView *)v13;

    -[UIView layer](v4->_tail_container, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAnchorPoint:", 0.0, 0.5);

    -[UIView setClipsToBounds:](v4->_tail_container, "setClipsToBounds:", 1);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
    head = v4->_head;
    v4->_head = (UIImageView *)v16;

    -[UIImageView layer](v4->_head, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAnchorPoint:", 0.0, 0.5);

    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
    tail = v4->_tail;
    v4->_tail = (UIImageView *)v19;

    -[UIImageView layer](v4->_tail, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAnchorPoint:", 1.0, 0.5);

    v22 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    label = v4->_label;
    v4->_label = v22;

    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 3);
    v24 = v4->_label;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v24, "setBackgroundColor:", v25);

    -[LAUIHorizontalArrowView addSubview:](v4, "addSubview:", v4->_container);
    -[UIView addSubview:](v4->_container, "addSubview:", v4->_arrow_container);
    -[UIView addSubview:](v4->_arrow_container, "addSubview:", v4->_tail_container);
    -[UIView addSubview:](v4->_arrow_container, "addSubview:", v4->_head);
    -[UIView addSubview:](v4->_tail_container, "addSubview:", v4->_tail);
    -[UIView addSubview:](v4->_container, "addSubview:", v4->_label);
    -[LAUIHorizontalArrowView setTintColor:](v4, "setTintColor:", v4->_color);
    -[LAUIHorizontalArrowView _updateViewsWithColor](v4, "_updateViewsWithColor");
    -[LAUIHorizontalArrowView _updateAnimatingAnimated:](v4, "_updateAnimatingAnimated:", 0);
    -[LAUIHorizontalArrowView _updateDirectionTransform](v4, "_updateDirectionTransform");
    -[LAUIHorizontalArrowView _updateFont](v4, "_updateFont");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v4, sel_boldTextStatusDidChange_, *MEMORY[0x24BDF71F8], 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v4, sel_contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)LAUIHorizontalArrowView;
  -[LAUIHorizontalArrowView dealloc](&v4, sel_dealloc);
}

- (void)tintColorDidChange
{
  UIColor *v3;
  UIColor *color;
  UIColor *v5;
  UIColor *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LAUIHorizontalArrowView;
  -[LAUIHorizontalArrowView tintColorDidChange](&v7, sel_tintColorDidChange);
  -[LAUIHorizontalArrowView tintColor](self, "tintColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  color = self->_color;
  if (color != v3 && (!v3 || !color || (-[UIColor isEqual:](color, "isEqual:", v3) & 1) == 0))
  {
    v5 = (UIColor *)-[UIColor copy](v3, "copy");
    v6 = self->_color;
    self->_color = v5;

    -[LAUIHorizontalArrowView _updateViewsWithColor](self, "_updateViewsWithColor");
  }

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LAUIHorizontalArrowView;
  -[LAUIHorizontalArrowView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[LAUIHorizontalArrowView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_animating == self->_effective_animating)
    {
      if (self->_animating || self->_dismissal_animation_count)
        -[LAUIHorizontalArrowView _updatePulsingWithDelay:](self, "_updatePulsingWithDelay:", 0.0);
    }
    else
    {
      -[LAUIHorizontalArrowView _updateAnimatingAnimated:](self, "_updateAnimatingAnimated:", 1);
    }
  }
  else
  {
    self->_pulsing = 0;
    LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_head_pulse);
    LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_tail_container_pulse);
    LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_tail_counter_pulse);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double resting_height;
  double v4;
  CGSize result;

  resting_height = self->_resting_height;
  v4 = 52.0;
  result.height = resting_height;
  result.width = v4;
  return result;
}

- (void)_layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  -[LAUIHorizontalArrowView layoutIfNeeded](self, "layoutIfNeeded");
  self->_animated = 0;
}

- (void)layoutSubviews
{
  __assert_rtn("-[LAUIHorizontalArrowView layoutSubviews]", "LAUIHorizontalArrowView.mm", 245, "CGRectEqualToRect([_arrow_container bounds], container_bounds)");
}

- (void)_updateViewsWithColor
{
  uint64_t v3;
  UIImageView *head;
  void *v5;
  void *v6;
  uint64_t v7;
  UIImageView *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double *v13;
  UIImageView *tail;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  UIImageView *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  id v24;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = objc_claimAutoreleasedReturnValue();
  head = self->_head;
  v24 = (id)v3;
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("arrow_head"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_color)
  {
    objc_msgSend(v5, "_flatImageWithColor:");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = head;
  v9 = v6;
  -[UIImageView setImage:](v8, "setImage:", v9);
  objc_msgSend(v9, "size");
  if (v11 >= 0.0)
    v12 = v11;
  else
    v12 = 0.0;
  v13 = (double *)MEMORY[0x24BDBEFB0];
  -[UIImageView setBounds:](v8, "setBounds:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v10, v11);

  tail = self->_tail;
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("arrow_tail"), v24, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (self->_color)
  {
    objc_msgSend(v15, "_flatImageWithColor:");
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  objc_msgSend(v16, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 0.0, 0.0, 5.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = tail;
  v20 = v18;
  -[UIImageView setImage:](v19, "setImage:", v20);
  objc_msgSend(v20, "size");
  v22 = v21;
  -[UIImageView setBounds:](v19, "setBounds:", *v13, v13[1], v23, v21);
  if (v22 < v12)
    v22 = v12;

  self->_resting_height = v22;
  -[UILabel setTextColor:](self->_label, "setTextColor:", self->_color);
  -[LAUIHorizontalArrowView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateAnimatingAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  unsigned int animating;
  _BOOL4 v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  double *v16;
  BOOL *v17;
  unsigned __int8 *v18;
  double v19;
  unsigned __int8 v20;
  BOOL v21;

  v3 = a3;
  v21 = a3;
  -[LAUIHorizontalArrowView layoutIfNeeded](self, "layoutIfNeeded");
  v5 = self->_effective_animating || self->_dismissal_animation_count != 0;
  animating = self->_animating;
  self->_effective_animating = animating;
  v20 = animating;
  if (animating)
    v7 = 0;
  else
    v7 = v3;
  v19 = (double)animating;
  if (v7)
  {
    ++self->_dismissal_animation_count;
    v16 = &v19;
    v17 = &v21;
    v18 = &v20;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x24BDE57D8];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3321888768;
    v13[2] = __52__LAUIHorizontalArrowView__updateAnimatingAnimated___block_invoke;
    v13[3] = &__block_descriptor_40_ea8_32c65_ZTSKZ52__LAUIHorizontalArrowView__updateAnimatingAnimated__E3__3_e5_v8__0l;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v14, &v12);
    objc_msgSend(v8, "setCompletionBlock:", v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    animating = v20;
  }
  else
  {
    v16 = &v19;
    v17 = &v21;
    v18 = &v20;
  }
  if (animating)
    v9 = v5;
  else
    v9 = 1;
  v10 = 0.045;
  if (v9)
  {
    v10 = 0.0;
    v11 = 0.0;
  }
  else
  {
    v11 = 0.27;
  }
  -[LAUIHorizontalArrowView _updateAnimatingAnimated:]::$_2::operator()(&v16, self->_arrow_container, v10);
  -[LAUIHorizontalArrowView _updateAnimatingAnimated:]::$_2::operator()(&v16, self->_label, v11);
  if (v7)
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  -[LAUIHorizontalArrowView setNeedsLayout](self, "setNeedsLayout");
  -[LAUIHorizontalArrowView _layoutIfNeededAnimated:](self, "_layoutIfNeededAnimated:", v21);
}

void __52__LAUIHorizontalArrowView__updateAnimatingAnimated___block_invoke(uint64_t a1)
{
  __int16 v1;
  BOOL v2;
  _WORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = WeakRetained[213] - 1;
    WeakRetained[213] = v1;
    if (*((_BYTE *)WeakRetained + 424))
      v2 = 0;
    else
      v2 = v1 == 0;
    if (v2)
    {
      objc_msgSend(WeakRetained, "setNeedsLayout");
      objc_msgSend(WeakRetained, "_layoutIfNeededAnimated:", 0);
    }
  }

}

- (void)_updateAnimatingAnimated:
{
  id v5;
  void *v6;
  float v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  float v13;
  float v14;
  double v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  id v24;
  void *v25;
  id v26;

  v5 = a2;
  if (v5)
  {
    v26 = v5;
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "opacity");
    if (**a1 != v7)
    {
      objc_msgSend(v6, "removeAnimationForKey:", CFSTR("opacity"));
      v8 = **a1;
      *(float *)&v8 = v8;
      objc_msgSend(v6, "setOpacity:", v8);
      if (*(_BYTE *)a1[1])
      {
        objc_msgSend(v6, "presentationLayer");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (void *)v9;
        else
          v11 = v6;
        v12 = v11;

        objc_msgSend(v12, "opacity");
        v14 = v13;
        v15 = **a1;
        v16 = *(unsigned __int8 *)a1[2];
        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setAdditive:", 1);
        objc_msgSend(v17, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
        LODWORD(v18) = 1036831949;
        LODWORD(v19) = 0.25;
        LODWORD(v20) = 0.25;
        LODWORD(v21) = 1.0;
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v19, v18, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTimingFunction:", v22);

        v23 = 0.5;
        if (!v16)
          v23 = 0.25;
        objc_msgSend(v17, "setDuration:", v23);
        v24 = v17;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14 - v15);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setFromValue:", v25);

        objc_msgSend(v24, "setToValue:", &unk_24C284EB8);
        if (a3 > 0.0)
        {
          objc_msgSend(v24, "setFillMode:", *MEMORY[0x24BDE5968]);
          objc_msgSend(v24, "setBeginTime:", a3);
        }
        objc_msgSend(v6, "addAnimation:forKey:", v24, CFSTR("opacity"));

      }
      else
      {
        objc_msgSend(v6, "removeAnimationForKey:", CFSTR("opacity"));
      }
    }

    v5 = v26;
  }

}

- (void)_updateDirectionTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  UIView *container;
  UILabel *label;
  CATransform3D v9;
  CATransform3D v10;
  CATransform3D v11;

  memset(&v11, 0, sizeof(v11));
  if (self->_direction)
  {
    CATransform3DMakeScale(&v11, -1.0, 1.0, 1.0);
  }
  else
  {
    v3 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    *(_OWORD *)&v11.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    *(_OWORD *)&v11.m33 = v3;
    v4 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    *(_OWORD *)&v11.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    *(_OWORD *)&v11.m43 = v4;
    v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    *(_OWORD *)&v11.m11 = *MEMORY[0x24BDE5598];
    *(_OWORD *)&v11.m13 = v5;
    v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    *(_OWORD *)&v11.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    *(_OWORD *)&v11.m23 = v6;
  }
  container = self->_container;
  v10 = v11;
  -[UIView setTransform3D:](container, "setTransform3D:", &v10);
  label = self->_label;
  v9 = v11;
  -[UILabel setTransform3D:](label, "setTransform3D:", &v9);
}

- (void)_updatePulsingWithDelay:(double)a3
{
  int dismissal_animation_count;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CALayer *v13;
  CALayer *v14;
  CALayer *v15;
  CAAnimation *v16;

  if (self->_effective_animating)
  {
    if (!self->_pulsing)
    {
      self->_pulsing = 1;
LABEL_7:
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position.x"));
      v16 = (CAAnimation *)objc_claimAutoreleasedReturnValue();
      -[CAAnimation setBeginTimeMode:](v16, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
      -[CAAnimation setAdditive:](v16, "setAdditive:", 1);
      -[CAAnimation setDuration:](v16, "setDuration:", 0.75);
      LODWORD(v7) = 2139095039;
      -[CAAnimation setRepeatCount:](v16, "setRepeatCount:", v7);
      LODWORD(v8) = 0.5;
      LODWORD(v9) = 0;
      LODWORD(v10) = 0.5;
      LODWORD(v11) = 1.0;
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v8, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAAnimation setTimingFunction:](v16, "setTimingFunction:", v12);

      -[CAAnimation setBeginTime:](v16, "setBeginTime:", a3);
      -[CAAnimation setFromValue:](v16, "setFromValue:", &unk_24C284EB8);
      -[CAAnimation setToValue:](v16, "setToValue:", &unk_24C2850F8);
      -[CAAnimation setAutoreverses:](v16, "setAutoreverses:", 1);
      -[UIImageView layer](self->_head, "layer");
      v13 = (CALayer *)objc_claimAutoreleasedReturnValue();
      LAUI_CA_utilities::periodic_animation_state::attach_animation((id *)&self->_head_pulse, v13, v16, CFSTR("pulse"));

      -[UIView layer](self->_tail_container, "layer");
      v14 = (CALayer *)objc_claimAutoreleasedReturnValue();
      LAUI_CA_utilities::periodic_animation_state::attach_animation((id *)&self->_tail_container_pulse, v14, v16, CFSTR("pulse"));

      -[CAAnimation setFromValue:](v16, "setFromValue:", &unk_24C284EB8);
      -[CAAnimation setToValue:](v16, "setToValue:", &unk_24C285108);
      -[UIImageView layer](self->_tail, "layer");
      v15 = (CALayer *)objc_claimAutoreleasedReturnValue();
      LAUI_CA_utilities::periodic_animation_state::attach_animation((id *)&self->_tail_counter_pulse, v15, v16, CFSTR("pulse"));

      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    }
  }
  else
  {
    dismissal_animation_count = self->_dismissal_animation_count;
    v6 = self->_dismissal_animation_count != 0;
    if (self->_pulsing != v6)
    {
      self->_pulsing = v6;
      if (dismissal_animation_count)
        goto LABEL_7;
      LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_head_pulse);
      LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_tail_container_pulse);
      LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_tail_counter_pulse);
    }
  }
}

- (void)_updateFont
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  double height;
  void *v16;
  id v17;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v3, "symbolicTraits") | 2);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v17, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  objc_msgSend(v4, "lineHeight");
  v9 = v8;
  objc_msgSend(v4, "leading");
  v10 = fmax(v7, 1.0);
  v12 = ceil(v10 * (v9 + v11)) / v10;
  v13 = v4;
  v14 = v13;
  height = self->_maximum_line_size.height;
  v16 = v13;
  if (v12 > height)
  {
    objc_msgSend(v13, "_fontScaledByScaleFactor:", height / v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[UILabel setFont:](self->_label, "setFont:", v16);
  -[LAUIHorizontalArrowView _updateLabelSize](self, "_updateLabelSize");

}

- (void)_updateLabelSize
{
  double v3;
  double v4;

  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", self->_maximum_line_size.width, 1.79769313e308);
  -[UILabel setBounds:](self->_label, "setBounds:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v3, v4);
  -[LAUIHorizontalArrowView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAnimating:(BOOL)a3
{
  void *v4;
  _BOOL4 v6;

  if (self->_animating != a3)
  {
    self->_animating = a3;
    -[LAUIHorizontalArrowView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = !self->_animating || v4 != 0;
    if (self->_effective_animating != self->_animating && v6)
      -[LAUIHorizontalArrowView _updateAnimatingAnimated:](self, "_updateAnimatingAnimated:", v4 != 0);
  }
}

- (void)setDirection:(int64_t)a3
{
  if (self->_direction != a3)
  {
    self->_direction = a3;
    -[LAUIHorizontalArrowView _updateDirectionTransform](self, "_updateDirectionTransform");
  }
}

- (void)setDisplacement:(double)a3
{
  if (self->_displacement != a3)
  {
    self->_displacement = a3;
    -[LAUIHorizontalArrowView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaximumLineSize:(CGSize)a3
{
  if (a3.width <= 0.0)
    a3.width = 1.79769313e308;
  if (a3.height <= 0.0)
    a3.height = 1.79769313e308;
  if (self->_maximum_line_size.width != a3.width || self->_maximum_line_size.height != a3.height)
  {
    self->_maximum_line_size = a3;
    -[LAUIHorizontalArrowView _updateFont](self, "_updateFont");
  }
}

- (void)setText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *text;
  NSString *v7;
  NSString *v8;
  id v9;
  NSString *v10;

  v4 = a3;
  if (!v4)
    goto LABEL_5;
  v9 = v4;
  if (!objc_msgSend(v4, "length"))
  {

LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v5 = (NSString *)v9;
LABEL_6:
  text = self->_text;
  v10 = v5;
  if (text != v5 && (!v5 || !text || !-[NSString isEqualToString:](text, "isEqualToString:", v5)))
  {
    v7 = (NSString *)-[NSString copy](v10, "copy");
    v8 = self->_text;
    self->_text = v7;

    -[UILabel setText:](self->_label, "setText:", self->_text);
    -[LAUIHorizontalArrowView _updateLabelSize](self, "_updateLabelSize");
  }

}

- (CGSize)maximumLineSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximum_line_size.width;
  height = self->_maximum_line_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (int64_t)direction
{
  return self->_direction;
}

- (double)displacement
{
  return self->_displacement;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_destroyWeak((id *)&self->_tail_counter_pulse._layer);
  objc_destroyWeak((id *)&self->_tail_container_pulse._layer);

  objc_destroyWeak((id *)&self->_head_pulse._layer);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_tail_container, 0);
  objc_storeStrong((id *)&self->_head, 0);
  objc_storeStrong((id *)&self->_arrow_container, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (id).cxx_construct
{
  periodic_animation_state *p_head_pulse;

  p_head_pulse = &self->_head_pulse;
  p_head_pulse->_key = 0;
  p_head_pulse->_layer = 0;
  p_head_pulse->_removal_timer = 0;
  LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)p_head_pulse);
  self->_tail_container_pulse._key = 0;
  self->_tail_container_pulse._layer = 0;
  self->_tail_container_pulse._removal_timer = 0;
  LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)&self->_tail_container_pulse);
  self->_tail_counter_pulse._key = 0;
  self->_tail_counter_pulse._layer = 0;
  self->_tail_counter_pulse._removal_timer = 0;
  LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)&self->_tail_counter_pulse);
  return self;
}

@end
