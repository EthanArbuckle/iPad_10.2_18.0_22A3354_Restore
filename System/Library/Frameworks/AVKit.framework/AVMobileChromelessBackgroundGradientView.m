@implementation AVMobileChromelessBackgroundGradientView

- (AVMobileChromelessBackgroundGradientView)initWithFrame:(CGRect)a3
{
  AVMobileChromelessBackgroundGradientView *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSArray *colorsDark;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSArray *colorsLight;
  void *v18;
  objc_super v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)AVMobileChromelessBackgroundGradientView;
  v3 = -[AVMobileChromelessBackgroundGradientView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[0] = objc_msgSend(v4, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[1] = objc_msgSend(v5, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[2] = objc_msgSend(v6, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[3] = objc_msgSend(v7, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[4] = objc_msgSend(v8, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
    v9 = objc_claimAutoreleasedReturnValue();
    colorsDark = v3->_colorsDark;
    v3->_colorsDark = (NSArray *)v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.25);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21[0] = objc_msgSend(v11, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21[1] = objc_msgSend(v12, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21[2] = objc_msgSend(v13, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.25);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21[3] = objc_msgSend(v14, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21[4] = objc_msgSend(v15, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
    v16 = objc_claimAutoreleasedReturnValue();
    colorsLight = v3->_colorsLight;
    v3->_colorsLight = (NSArray *)v16;

    -[AVMobileChromelessBackgroundGradientView layer](v3, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLocations:", &unk_1E5BF4008);
    -[AVMobileChromelessBackgroundGradientView _updateGradientColors]((char *)v3);
    v3->_active = 1;

  }
  return v3;
}

- (void)setActive:(BOOL)a3
{
  float v4;
  double v5;
  id v6;

  if (self->_active != a3)
  {
    self->_active = a3;
    if (-[AVMobileChromelessBackgroundGradientView isActive](self, "isActive"))
      v4 = 1.0;
    else
      v4 = 0.0;
    -[AVMobileChromelessBackgroundGradientView layer](self, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v5 = v4;
    objc_msgSend(v6, "setOpacity:", v5);

  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  AVMobileChromelessBackgroundGradientView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMobileChromelessBackgroundGradientView;
  -[AVMobileChromelessBackgroundGradientView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (AVMobileChromelessBackgroundGradientView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromelessBackgroundGradientView;
  v4 = a3;
  -[AVMobileChromelessBackgroundGradientView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[AVMobileChromelessBackgroundGradientView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[AVMobileChromelessBackgroundGradientView _updateGradientColors]((char *)self);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorsLight, 0);
  objc_storeStrong((id *)&self->_colorsDark, 0);
}

- (void)_updateGradientColors
{
  void *v2;
  uint64_t v3;
  void *v4;
  int *v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a1, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceStyle");

    objc_msgSend(a1, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v5 = &OBJC_IVAR___AVMobileChromelessBackgroundGradientView__colorsDark;
    if (v3 == 1)
      v5 = &OBJC_IVAR___AVMobileChromelessBackgroundGradientView__colorsLight;
    objc_msgSend(v4, "setColors:", *(_QWORD *)&a1[*v5]);

  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
