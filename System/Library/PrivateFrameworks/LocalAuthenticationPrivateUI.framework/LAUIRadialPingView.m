@implementation LAUIRadialPingView

- (LAUIRadialPingView)initWithFrame:(CGRect)a3
{
  LAUIRadialPingView *v3;
  uint64_t v4;
  UIColor *color;
  id v6;
  double *v7;
  uint64_t v8;
  UIView *container;
  uint64_t v10;
  UIView *primary;
  uint64_t v12;
  char v13;
  char v14;
  id *p_container;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)LAUIRadialPingView;
  v3 = -[LAUIRadialPingView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v4 = objc_claimAutoreleasedReturnValue();
    color = v3->_color;
    v3->_color = (UIColor *)v4;

    v6 = objc_alloc(MEMORY[0x24BDF6F90]);
    v7 = (double *)MEMORY[0x24BDBF090];
    v8 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    container = v3->_container;
    v3->_container = (UIView *)v8;

    -[UIView setClipsToBounds:](v3->_container, "setClipsToBounds:", 1);
    -[LAUIRadialPingView addSubview:](v3, "addSubview:", v3->_container);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", *v7, v7[1], v7[2], v7[3]);
    primary = v3->_primary;
    v3->_primary = (UIView *)v10;

    -[UIView addSubview:](v3->_container, "addSubview:", v3->_primary);
    p_container = (id *)&v3->_container;
    -[LAUIRadialPingView initWithFrame:]::$_0::operator()(&p_container, (void **)&v3->_blurs, 0.15);
    -[LAUIRadialPingView initWithFrame:]::$_0::operator()(&p_container, (void **)&v3->_blurs.__elems_[1].view, 0.1);
    -[LAUIRadialPingView setTintColor:](v3, "setTintColor:", v3->_color);
    -[LAUIRadialPingView _updateViewsWithColor](v3, "_updateViewsWithColor");
    -[LAUIRadialPingView _updateAnimatingAnimated:](v3, "_updateAnimatingAnimated:", 0);
    v12 = 0;
    v13 = 1;
    do
    {
      v14 = v13;
      -[LAUIRadialPingView _updateExpandForBlurAtIndex:withDelay:](v3, "_updateExpandForBlurAtIndex:withDelay:", v12, 0.0);
      v13 = 0;
      v12 = 1;
    }
    while ((v14 & 1) != 0);
  }
  return v3;
}

- (void)initWithFrame:
{
  void *v6;
  void *v7;
  void *v8;
  CATransform3D v9;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v9, 0.001, 0.001, 1.0);
  objc_msgSend(v7, "setTransform:", &v9);

  objc_msgSend(v6, "setAlpha:", a3);
  objc_msgSend(**a1, "addSubview:", v6);
  v8 = *a2;
  *a2 = v6;

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)LAUIRadialPingView;
  -[LAUIRadialPingView dealloc](&v2, sel_dealloc);
}

- (void)tintColorDidChange
{
  UIColor *v3;
  UIColor *color;
  UIColor *v5;
  UIColor *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LAUIRadialPingView;
  -[LAUIRadialPingView tintColorDidChange](&v7, sel_tintColorDidChange);
  -[LAUIRadialPingView tintColor](self, "tintColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  color = self->_color;
  if (color != v3 && (!v3 || !color || (-[UIColor isEqual:](color, "isEqual:", v3) & 1) == 0))
  {
    v5 = (UIColor *)-[UIColor copy](v3, "copy");
    v6 = self->_color;
    self->_color = v5;

    -[LAUIRadialPingView _updateViewsWithColor](self, "_updateViewsWithColor");
  }

}

- (void)didMoveToWindow
{
  void *v3;
  LAUIRadialPingView *v4;
  uint64_t v5;
  uint64_t i;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LAUIRadialPingView;
  -[LAUIRadialPingView didMoveToWindow](&v7, sel_didMoveToWindow);
  if (self->_animating)
  {
    -[LAUIRadialPingView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (self->_animating_dirty)
      {
        v4 = self;
        v5 = 1;
LABEL_9:
        -[LAUIRadialPingView _updateAnimatingAnimated:](v4, "_updateAnimatingAnimated:", v5);
        return;
      }
      -[LAUIRadialPingView _startExpandWithDelay:](self, "_startExpandWithDelay:", 0.0);
    }
    else
    {
      LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_pulse);
      for (i = 8; i != 88; i += 40)
        LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)((char *)&self->_blurs + i));
      if (self->_animating_dirty)
      {
        v4 = self;
        v5 = 0;
        goto LABEL_9;
      }
      -[LAUIRadialPingView _endExpand](self, "_endExpand");
    }
  }
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double MidX;
  double MidY;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v22;
  array<(anonymous namespace)::blur_container, 2UL> *p_blurs;
  double v24;
  UIImageView *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  UIImageView *v30;
  double v31;
  double v32;
  objc_super v34;
  CATransform3D v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v34.receiver = self;
  v34.super_class = (Class)LAUIRadialPingView;
  -[LAUIRadialPingView layoutSubviews](&v34, sel_layoutSubviews);
  -[LAUIRadialPingView bounds](self, "bounds");
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  MidX = CGRectGetMidX(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  MidY = CGRectGetMidY(v37);
  if (height >= width)
    v9 = width;
  else
    v9 = height;
  v10 = *MEMORY[0x24BDBEFB0];
  v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[UIView bounds](self->_container, "bounds");
  v42.origin.x = v10;
  v42.origin.y = v11;
  v42.size.width = v9;
  v42.size.height = v9;
  if (!CGRectEqualToRect(v38, v42))
  {
    -[UIView setBounds:](self->_container, "setBounds:", v10, v11, v9, v9);
    -[UIView layer](self->_container, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v9 * 0.5);

  }
  -[UIView center](self->_container, "center");
  if (v14 != MidX || v13 != MidY)
    -[UIView setCenter:](self->_container, "setCenter:", MidX, MidY);
  v39.origin.x = v10;
  v39.origin.y = v11;
  v39.size.width = v9;
  v39.size.height = v9;
  v16 = CGRectGetMidX(v39);
  v40.origin.x = v10;
  v40.origin.y = v11;
  v40.size.width = v9;
  v40.size.height = v9;
  v17 = CGRectGetMidY(v40);
  -[UIView bounds](self->_primary, "bounds");
  v43.origin.x = v10;
  v43.origin.y = v11;
  v43.size.width = v9;
  v43.size.height = v9;
  if (!CGRectEqualToRect(v41, v43))
  {
    -[UIView setBounds:](self->_primary, "setBounds:", v10, v11, v9, v9);
    -[UIView layer](self->_primary, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", v9 * 0.5);

  }
  -[UIView center](self->_primary, "center");
  if (v20 != v16 || v19 != v17)
    -[UIView setCenter:](self->_primary, "setCenter:", v16, v17);
  v22 = 0;
  p_blurs = &self->_blurs;
  v24 = v9 / 1000.0;
  do
  {
    v25 = p_blurs->__elems_[v22].view;
    -[UIImageView layer](v25, "layer");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    if (v28 >= v27)
      v29 = v27;
    else
      v29 = v28;
    CATransform3DMakeScale(&v35, v24 * (v29 / 1000.0) * 0.001, v24 * (v29 / 1000.0) * 0.001, 1.0);
    objc_msgSend(v26, "setTransform:", &v35);

    v30 = v25;
    -[UIImageView center](v30, "center");
    if (v32 != v16 || v31 != v17)
      -[UIImageView setCenter:](v30, "setCenter:", v16, v17);

    ++v22;
  }
  while (v22 != 2);
}

- (void)_updateViewsWithColor
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a2;
  v5 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(**(id **)a1, "pathForResource:ofType:", a3, CFSTR("png"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (**(_QWORD **)(a1 + 8))
  {
    objc_msgSend(v7, "_flatImageWithColor:");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  objc_msgSend(v13, "setImage:", v7);
  v9 = *MEMORY[0x24BDBEFB0];
  v10 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v7, "size");
  objc_msgSend(v13, "setBounds:", v9, v10, v11, v12);

}

- (void)_setPulse:(BOOL)a3 withDelay:(double)a4
{
  void *v6;
  _BOOL4 v7;
  dispatch_source_t *p_pulse;
  NSString *key;
  double v10;
  double v11;
  id to;
  _QWORD v13[4];
  id v14;
  id location;

  if (a3)
  {
    -[LAUIRadialPingView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }
  p_pulse = (dispatch_source_t *)&self->_pulse;
  if (self->_pulse.enabled != v7)
  {
    *(_BYTE *)p_pulse = v7;
    LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)&self->_pulse);
    key = self->_pulse._key;
    if (*(_BYTE *)p_pulse)
    {
      if (!key)
        -[LAUIRadialPingView _attachPulseAnimationWithDelay:](self, "_attachPulseAnimationWithDelay:", a4);
    }
    else if (key)
    {
      if (LAUI_CA_utilities::periodic_animation_state::elapsed_duration((LAUI_CA_utilities::periodic_animation_state *)&self->_pulse) <= 0.0
        || (v10 = LAUI_CA_utilities::periodic_animation_state::remaining_duration((LAUI_CA_utilities::periodic_animation_state *)&self->_pulse),
            v10 <= 0.0))
      {
        LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_pulse);
      }
      else
      {
        v11 = v10;
        objc_initWeak(&location, self);
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3321888768;
        v13[2] = __42__LAUIRadialPingView__setPulse_withDelay___block_invoke;
        v13[3] = &__block_descriptor_40_ea8_32c55_ZTSKZ42__LAUIRadialPingView__setPulse_withDelay__E3__4_e5_v8__0l;
        objc_copyWeak(&to, &location);
        objc_copyWeak(&v14, &to);
        LAUI_CA_utilities::periodic_animation_state::create_removal_timer(p_pulse, v13, v11);
        objc_destroyWeak(&to);
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __42__LAUIRadialPingView__setPulse_withDelay___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    LAUI_CA_utilities::periodic_animation_state::detach_animation(WeakRetained + 65);
    WeakRetained = v2;
  }

}

- (void)_attachPulseAnimationWithDelay:(double)a3
{
  id *p_pulse;
  void *v6;
  CAAnimation *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  CALayer *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  p_pulse = (id *)&self->_pulse;
  if (!self->_pulse._key)
  {
    -[LAUIRadialPingView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
      v7 = (CAAnimation *)objc_claimAutoreleasedReturnValue();
      -[CAAnimation setBeginTimeMode:](v7, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
      -[CAAnimation setBeginTime:](v7, "setBeginTime:", a3);
      -[CAAnimation setAdditive:](v7, "setAdditive:", 1);
      -[CAAnimation setDuration:](v7, "setDuration:", 2.0);
      -[CAAnimation setCalculationMode:](v7, "setCalculationMode:", *MEMORY[0x24BDE5830]);
      LODWORD(v8) = 2139095039;
      -[CAAnimation setRepeatCount:](v7, "setRepeatCount:", v8);
      -[CAAnimation setKeyTimes:](v7, "setKeyTimes:", &unk_24C285500);
      -[CAAnimation setValues:](v7, "setValues:", &unk_24C285518);
      LODWORD(v9) = 1054280253;
      LODWORD(v10) = 0;
      LODWORD(v11) = 1.0;
      LODWORD(v12) = 1.0;
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v13;
      LODWORD(v14) = 1058306785;
      LODWORD(v15) = 0;
      LODWORD(v16) = 0;
      LODWORD(v17) = 1.0;
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v15, v16, v14, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAAnimation setTimingFunctions:](v7, "setTimingFunctions:", v19);

      -[UIView layer](self->_container, "layer");
      v20 = (CALayer *)objc_claimAutoreleasedReturnValue();
      LAUI_CA_utilities::periodic_animation_state::attach_animation(p_pulse, v20, v7, CFSTR("pulse"));

    }
  }
}

- (void)_setExpand:(BOOL)a3 forBlurAtIndex:(unint64_t)a4 withDelay:(double)a5
{
  void *v8;
  int v9;
  blur_container *v10;
  periodic_animation_state *p_pulse;
  int enabled;

  if (a3)
  {
    -[LAUIRadialPingView window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }
  if (a4 >= 2)
    -[LAUIRadialPingView _setExpand:forBlurAtIndex:withDelay:].cold.1();
  v10 = &self->_blurs.__elems_[a4];
  enabled = v10->pulse.enabled;
  p_pulse = &v10->pulse;
  if (enabled != v9)
  {
    p_pulse->enabled = v9;
    -[LAUIRadialPingView _updateExpandForBlurAtIndex:withDelay:](self, "_updateExpandForBlurAtIndex:withDelay:", a4, a5);
  }
}

- (void)_updateExpandForBlurAtIndex:(unint64_t)a3 withDelay:(double)a4
{
  array<(anonymous namespace)::blur_container, 2UL> *p_blurs;
  blur_container *v8;
  LAUI_CA_utilities::periodic_animation_state *p_pulse;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  float v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  CAAnimation *v35;
  unsigned __int8 animating_counter;
  CALayer *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  char v41;
  id v42;
  _OWORD v43[8];
  _OWORD v44[8];
  __int128 location;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 to;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;

  if (a3 >= 2)
    -[LAUIRadialPingView _updateExpandForBlurAtIndex:withDelay:].cold.1();
  p_blurs = &self->_blurs;
  v8 = &self->_blurs.__elems_[a3];
  p_pulse = (LAUI_CA_utilities::periodic_animation_state *)&v8->pulse;
  if (v8->pulse.enabled)
  {
    -[UIImageView setHidden:](v8->view, "setHidden:", 0);
    if (!p_blurs->__elems_[a3].pulse._key)
      -[LAUIRadialPingView _attachExpandAnimationToContainer:withDelay:](self, "_attachExpandAnimationToContainer:withDelay:", v8, a4);
  }
  else if (p_blurs->__elems_[a3].pulse._key)
  {
    v10 = LAUI_CA_utilities::periodic_animation_state::elapsed_duration(p_pulse);
    LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)p_pulse);
    -[UIImageView layer](v8->view, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentationLayer");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v10 <= 0.0 || v12 == 0)
    {
      -[UIImageView setHidden:](v8->view, "setHidden:", 1);
    }
    else
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      to = 0u;
      v54 = 0u;
      objc_msgSend(v13, "transform");
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      location = 0u;
      v46 = 0u;
      if (v11)
        objc_msgSend(v11, "transform");
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x24BDE5858];
      objc_msgSend(v16, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
      objc_msgSend(v16, "setAdditive:", 1);
      LODWORD(v18) = 0;
      LODWORD(v19) = 0;
      LODWORD(v20) = 1.0;
      LODWORD(v21) = 1055369095;
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v18, v19, v21, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTimingFunction:", v22);

      objc_msgSend(v16, "setDuration:", 0.25);
      v44[5] = v58;
      v44[6] = v59;
      v44[7] = v60;
      v44[1] = v54;
      v44[2] = v55;
      v44[3] = v56;
      v44[4] = v57;
      v43[2] = v47;
      v43[3] = v48;
      v43[0] = location;
      v43[1] = v46;
      v43[7] = v52;
      v44[0] = to;
      v43[5] = v50;
      v43[6] = v51;
      v43[4] = v49;

      objc_msgSend(v15, "addObject:", v16);
      objc_msgSend(v13, "opacity");
      v24 = v23;
      objc_msgSend(v11, "opacity");
      v26 = v25;
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBeginTimeMode:", v17);
      objc_msgSend(v27, "setAdditive:", 1);
      LODWORD(v28) = 0;
      LODWORD(v29) = 0;
      LODWORD(v30) = 1.0;
      LODWORD(v31) = 1055369095;
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v28, v29, v31, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTimingFunction:", v32);

      objc_msgSend(v27, "setDuration:", 0.25);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24 - v26);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setFromValue:", v33);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -v26);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setToValue:", v34);

      objc_msgSend(v15, "addObject:", v27);
      objc_msgSend(MEMORY[0x24BDE5638], "animation");
      v35 = (CAAnimation *)objc_claimAutoreleasedReturnValue();
      -[CAAnimation setBeginTimeMode:](v35, "setBeginTimeMode:", v17);
      -[CAAnimation setFillMode:](v35, "setFillMode:", *MEMORY[0x24BDE5968]);
      -[CAAnimation setBeginTime:](v35, "setBeginTime:", a4);
      -[CAAnimation setDuration:](v35, "setDuration:", 0.25);
      -[CAAnimation setAnimations:](v35, "setAnimations:", v15);
      objc_initWeak((id *)&location, self);
      animating_counter = self->_animating_counter;
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3321888768;
      v39[2] = __60__LAUIRadialPingView__updateExpandForBlurAtIndex_withDelay___block_invoke;
      v39[3] = &__block_descriptor_56_ea8_32c73_ZTSKZ60__LAUIRadialPingView__updateExpandForBlurAtIndex_withDelay__E3__5_e8_v12__0B8l;
      objc_copyWeak((id *)&to, (id *)&location);
      BYTE8(to) = animating_counter;
      v37 = v11;
      *(_QWORD *)&v54 = v37;
      objc_copyWeak(&v40, (id *)&to);
      v41 = BYTE8(to);
      v42 = (id)v54;
      -[CAAnimation laui_setDidStopHandler:](v35, "laui_setDidStopHandler:", v39);

      objc_destroyWeak((id *)&to);
      v38 = LAUILayerAddAdditiveAnimation(v37, 0, v35);

      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)&location);

    }
  }
  else
  {
    -[UIImageView setHidden:](v8->view, "setHidden:", 1);
  }
}

void __60__LAUIRadialPingView__updateExpandForBlurAtIndex_withDelay___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[553] == *(unsigned __int8 *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 48), "setHidden:", 1);

}

- (void)_attachExpandAnimationToContainer:(blur_container *)a3 withDelay:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  CAAnimation *v42;
  double v43;
  CALayer *v44;
  CATransform3D v45;
  CATransform3D v46;
  CATransform3D v47;
  _QWORD v48[3];
  _QWORD v49[4];
  _QWORD v50[5];

  v50[3] = *MEMORY[0x24BDAC8D0];
  if (!a3->pulse._key)
  {
    -[LAUIRadialPingView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIImageView layer](a3->view, "layer");
      v44 = (CALayer *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
      objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x24BDE5858];
      objc_msgSend(v8, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
      objc_msgSend(v8, "setAdditive:", 1);
      objc_msgSend(v8, "setDuration:", 2.0);
      v10 = *MEMORY[0x24BDE5848];
      objc_msgSend(v8, "setCalculationMode:", *MEMORY[0x24BDE5848]);
      objc_msgSend(v8, "setKeyTimes:", &unk_24C285530);
      v11 = (void *)MEMORY[0x24BDD1968];
      CATransform3DMakeScale(&v47, 0.0, 0.0, 0.0);
      objc_msgSend(v11, "valueWithCATransform3D:", &v47);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v12;
      v13 = (void *)MEMORY[0x24BDD1968];
      CATransform3DMakeScale(&v46, 1000.0, 1000.0, 0.0);
      objc_msgSend(v13, "valueWithCATransform3D:", &v46);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v14;
      v15 = (void *)MEMORY[0x24BDD1968];
      CATransform3DMakeScale(&v45, 1000.0, 1000.0, 0.0);
      objc_msgSend(v15, "valueWithCATransform3D:", &v45);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v50[2] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValues:", v17);

      LODWORD(v18) = 1054280253;
      LODWORD(v19) = 1061901975;
      LODWORD(v20) = 0;
      LODWORD(v21) = 1.0;
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v18, v20, v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTimingFunction:", v22);

      objc_msgSend(v7, "addObject:", v8);
      -[CALayer opacity](v44, "opacity");
      v24 = v23;
      objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("opacity"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBeginTimeMode:", v9);
      objc_msgSend(v25, "setAdditive:", 1);
      objc_msgSend(v25, "setDuration:", 2.0);
      objc_msgSend(v25, "setCalculationMode:", v10);
      objc_msgSend(v25, "setKeyTimes:", &unk_24C285548);
      v49[0] = &unk_24C285098;
      v49[1] = &unk_24C285098;
      v26 = -v24;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2] = v27;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v49[3] = v28;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setValues:", v29);

      LODWORD(v30) = 0;
      LODWORD(v31) = 0;
      LODWORD(v32) = 1.0;
      LODWORD(v33) = 1058306785;
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v30, v31, v33, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v34;
      LODWORD(v35) = 0;
      LODWORD(v36) = 0;
      LODWORD(v37) = 1.0;
      LODWORD(v38) = 1058306785;
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v35, v36, v38, v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v39;
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2] = v40;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 3);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTimingFunctions:", v41);

      objc_msgSend(v7, "addObject:", v25);
      objc_msgSend(MEMORY[0x24BDE5638], "animation");
      v42 = (CAAnimation *)objc_claimAutoreleasedReturnValue();
      -[CAAnimation setBeginTimeMode:](v42, "setBeginTimeMode:", v9);
      -[CAAnimation setBeginTime:](v42, "setBeginTime:", a4);
      -[CAAnimation setDuration:](v42, "setDuration:", 2.0);
      LODWORD(v43) = 2139095039;
      -[CAAnimation setRepeatCount:](v42, "setRepeatCount:", v43);
      -[CAAnimation setAnimations:](v42, "setAnimations:", v7);
      LAUI_CA_utilities::periodic_animation_state::attach_animation((id *)&a3->pulse, v44, v42, CFSTR("expand"));

    }
  }
}

- (void)setAnimating:(BOOL)a3
{
  void *v4;

  if (self->_animating != a3)
  {
    self->_animating = a3;
    -[LAUIRadialPingView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_animating && v4 == 0)
      self->_animating_dirty = 1;
    else
      -[LAUIRadialPingView _updateAnimatingAnimated:](self, "_updateAnimatingAnimated:", v4 != 0);
  }
}

- (void)_updateAnimatingAnimated:(BOOL)a3
{
  _BOOL4 v3;
  unsigned __int8 v5;
  void *v6;
  _BOOL4 animating;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  id to;
  __int16 v21;
  id v22;
  _QWORD v23[4];
  id v24;
  __int16 v25;
  id v26;
  id location;
  CATransform3D v28;
  _OWORD v29[8];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CATransform3D v38;
  CATransform3D v39;

  v3 = a3;
  self->_animating_dirty = 0;
  v5 = self->_animating_counter + 1;
  self->_animating_counter = v5;
  -[UIView layer](self->_primary, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  animating = self->_animating;
  v8 = 0.001;
  if (self->_animating)
    v8 = 1.0;
  memset(&v39, 0, sizeof(v39));
  CATransform3DMakeScale(&v39, v8, v8, 1.0);
  objc_msgSend(v6, "removeAnimationForKey:", CFSTR("transform"));
  v38 = v39;
  objc_msgSend(v6, "setTransform:", &v38);
  if (v3)
  {
    objc_msgSend(v6, "presentationLayer");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v6;
    v12 = v11;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    if (v12)
      objc_msgSend(v12, "transform");
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
    objc_msgSend(v13, "setAdditive:", 1);
    LODWORD(v14) = 1055369095;
    LODWORD(v15) = 0;
    LODWORD(v16) = 0;
    LODWORD(v17) = 1.0;
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v15, v16, v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTimingFunction:", v18);

    v19 = 1.0;
    if (!self->_animating)
      v19 = 0.25;
    objc_msgSend(v13, "setDuration:", v19);
    objc_msgSend(v13, "setFillMode:", *MEMORY[0x24BDE5980]);
    v29[5] = v35;
    v29[6] = v36;
    v29[7] = v37;
    v29[1] = v31;
    v29[2] = v32;
    v29[3] = v33;
    v29[4] = v34;
    v28 = v39;
    v29[0] = v30;

    objc_initWeak(&location, self);
    if (self->_animating)
    {
      objc_msgSend(v6, "setHidden:", !animating);
      -[LAUIRadialPingView _startExpandWithDelay:](self, "_startExpandWithDelay:", 0.135);
    }
    else
    {
      -[LAUIRadialPingView _endExpand](self, "_endExpand");
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3321888768;
      v23[2] = __47__LAUIRadialPingView__updateAnimatingAnimated___block_invoke;
      v23[3] = &__block_descriptor_56_ea8_32c60_ZTSKZ47__LAUIRadialPingView__updateAnimatingAnimated__E3__6_e8_v12__0B8l;
      objc_copyWeak(&to, &location);
      LOBYTE(v21) = v5;
      HIBYTE(v21) = !animating;
      v22 = v6;
      objc_copyWeak(&v24, &to);
      v25 = v21;
      v26 = v22;
      objc_msgSend(v13, "laui_setDidStopHandler:", v23);

      objc_destroyWeak(&to);
      objc_destroyWeak(&v24);
    }
    objc_msgSend(v6, "addAnimation:forKey:", v13, CFSTR("transform"));
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(v6, "setHidden:", !animating);
    if (self->_animating)
      -[LAUIRadialPingView _startExpandWithDelay:](self, "_startExpandWithDelay:", 0.0);
    else
      -[LAUIRadialPingView _endExpand](self, "_endExpand");
  }

}

void __47__LAUIRadialPingView__updateAnimatingAnimated___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[553] == *(unsigned __int8 *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 48), "setHidden:", *(unsigned __int8 *)(a1 + 41));

}

- (void)_startExpandWithDelay:(double)a3
{
  -[LAUIRadialPingView _setPulse:withDelay:](self, "_setPulse:withDelay:", 1, a3 + 0.115);
  -[LAUIRadialPingView _setExpand:forBlurAtIndex:withDelay:](self, "_setExpand:forBlurAtIndex:withDelay:", 1, 0, a3);
  -[LAUIRadialPingView _setExpand:forBlurAtIndex:withDelay:](self, "_setExpand:forBlurAtIndex:withDelay:", 1, 1, a3 + 0.265);
}

- (void)_endExpand
{
  -[LAUIRadialPingView _setPulse:withDelay:](self, "_setPulse:withDelay:", 0, 0.0);
  -[LAUIRadialPingView _setExpand:forBlurAtIndex:withDelay:](self, "_setExpand:forBlurAtIndex:withDelay:", 0, 0, 0.0);
  -[LAUIRadialPingView _setExpand:forBlurAtIndex:withDelay:](self, "_setExpand:forBlurAtIndex:withDelay:", 0, 1, 0.0);
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void).cxx_destruct
{
  periodic_animation_state *p_pulse;
  unint64_t v4;
  array<(anonymous namespace)::blur_container, 2UL> *p_blurs;

  p_pulse = &self->_pulse;

  objc_destroyWeak((id *)&p_pulse->_layer);
  v4 = 0;
  p_blurs = &self->_blurs;
  do
  {

    objc_destroyWeak((id *)&p_blurs->__elems_[v4 / 0x28 + 1].pulse._layer);
    v4 -= 40;
  }
  while (v4 != -80);
  objc_storeStrong((id *)&self->_primary, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (id).cxx_construct
{
  uint64_t v3;
  array<(anonymous namespace)::blur_container, 2UL> *p_blurs;
  array<(anonymous namespace)::blur_container, 2UL> *v5;

  v3 = 0;
  p_blurs = &self->_blurs;
  do
  {
    v5 = (array<(anonymous namespace)::blur_container, 2UL> *)((char *)p_blurs + v3 * 40);
    v5->__elems_[0].view = 0;
    v5->__elems_[0].pulse._key = 0;
    v5->__elems_[0].pulse._layer = 0;
    v5->__elems_[0].pulse._removal_timer = 0;
    LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)&p_blurs->__elems_[v3++].pulse);
  }
  while (v3 != 2);
  self->_pulse._key = 0;
  self->_pulse._layer = 0;
  self->_pulse._removal_timer = 0;
  LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)&self->_pulse);
  return self;
}

- (void)_setExpand:forBlurAtIndex:withDelay:.cold.1()
{
  __assert_rtn("-[LAUIRadialPingView _setExpand:forBlurAtIndex:withDelay:]", "LAUIRadialPingView.mm", 258, "index < _blurs.size()");
}

- (void)_updateExpandForBlurAtIndex:withDelay:.cold.1()
{
  __assert_rtn("-[LAUIRadialPingView _updateExpandForBlurAtIndex:withDelay:]", "LAUIRadialPingView.mm", 270, "index < _blurs.size()");
}

@end
