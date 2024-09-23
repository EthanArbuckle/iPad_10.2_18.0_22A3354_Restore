@implementation HKUITodayCirclePulseView

- (HKUITodayCirclePulseView)initWithFrame:(CGRect)a3
{
  HKUITodayCirclePulseView *v3;
  void *v4;
  UIView *v5;
  UIView *backgroundContainer;
  void *v7;
  HKUITodayCirclePulseBackground *v8;
  HKUITodayCirclePulseBackground *background;
  void *v10;
  uint64_t v11;
  CALayer *dayLabel;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HKUITodayCirclePulseView;
  v3 = -[HKUITodayCirclePulseView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKUITodayCirclePulseView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[HKUITodayCirclePulseView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundContainer = v3->_backgroundContainer;
    v3->_backgroundContainer = v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_backgroundContainer, "setBackgroundColor:", v7);

    v8 = objc_alloc_init(HKUITodayCirclePulseBackground);
    background = v3->_background;
    v3->_background = v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKUITodayCirclePulseBackground setBackgroundColor:](v3->_background, "setBackgroundColor:", v10);

    -[HKUITodayCirclePulseBackground setAutoresizingMask:](v3->_background, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v3->_backgroundContainer, "addSubview:", v3->_background);
    -[HKUITodayCirclePulseView addSubview:](v3, "addSubview:", v3->_backgroundContainer);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v11 = objc_claimAutoreleasedReturnValue();
    dayLabel = v3->_dayLabel;
    v3->_dayLabel = (CALayer *)v11;

    -[HKUITodayCirclePulseView layer](v3, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v3->_dayLabel);

  }
  return v3;
}

- (void)setDayLabelContent:(id)a3
{
  -[CALayer setContents:](self->_dayLabel, "setContents:", a3);
}

- (void)setCircleDiameter:(double)a3
{
  self->_circleDiameter = a3;
}

- (void)_layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double x;
  double y;
  double width;
  double height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;

  -[HKUITodayCirclePulseView circleDiameter](self, "circleDiameter");
  UIRoundToViewScale();
  v4 = v3;
  -[HKUITodayCirclePulseView circleDiameter](self, "circleDiameter");
  v6 = v5;
  -[HKUITodayCirclePulseView circleDiameter](self, "circleDiameter");
  v16.origin.x = HKUICeilRectToScreenScale(0.0, 0.0, v6, v7);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v17 = CGRectInset(v16, 1.0, 1.0);
  v12 = v17.origin.x;
  v13 = v17.origin.y;
  v14 = v17.size.width;
  v15 = v17.size.height;
  -[CALayer setFrame:](self->_dayLabel, "setFrame:", x, y, width, height);
  -[CALayer setPosition:](self->_dayLabel, "setPosition:", v4, v4);
  -[UIView setFrame:](self->_backgroundContainer, "setFrame:", v12, v13, v14, v15);
  -[UIView setCenter:](self->_backgroundContainer, "setCenter:", v4, v4);
}

- (void)pulse:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = a3;
  -[HKUITodayCirclePulseView _layoutSubviews](self, "_layoutSubviews");
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__HKUITodayCirclePulseView_pulse___block_invoke;
  v11[3] = &unk_1E9C3F0D0;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0x20000, v11, 0, 0.230000004, 0.0700000003, 1.20000005, 400.0, 16.0, 0.0);
  v6 = (void *)MEMORY[0x1E0DC3F10];
  v9 = v4;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __34__HKUITodayCirclePulseView_pulse___block_invoke_2;
  v10[3] = &unk_1E9C3F0D0;
  v10[4] = self;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __34__HKUITodayCirclePulseView_pulse___block_invoke_3;
  v8[3] = &unk_1E9C422F8;
  v7 = v4;
  objc_msgSend(v6, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 196608, v10, v8, 1.28999996, 0.0, 1.20000005, 400.0, 16.0, 0.0);

}

void __34__HKUITodayCirclePulseView_pulse___block_invoke(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  CATransform3D v7;
  CATransform3D v8;
  CATransform3D v9;

  v2 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v8.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v8.m33 = v2;
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v8.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v8.m43 = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v8.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v8.m13 = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v8.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v8.m23 = v5;
  CATransform3DScale(&v9, &v8, 0.84, 0.84, 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  objc_msgSend(v6, "setTransform:", &v7);

}

void __34__HKUITodayCirclePulseView_pulse___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  CATransform3D v7;
  CATransform3D v8;
  CATransform3D v9;

  v2 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v8.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v8.m33 = v2;
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v8.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v8.m43 = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v8.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v8.m13 = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v8.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v8.m23 = v5;
  CATransform3DScale(&v9, &v8, 1.19047619, 1.19047619, 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  objc_msgSend(v6, "setTransform:", &v7);

}

uint64_t __34__HKUITodayCirclePulseView_pulse___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (double)circleDiameter
{
  return self->_circleDiameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_backgroundContainer, 0);
}

@end
