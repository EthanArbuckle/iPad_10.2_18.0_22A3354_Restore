@implementation CAMShallowDepthOfFieldBadge

- (CAMShallowDepthOfFieldBadge)initWithFrame:(CGRect)a3
{
  CAMShallowDepthOfFieldBadge *v3;
  CAMShallowDepthOfFieldBadge *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  CEKBadgeTextView *enabledTextView;
  CEKBadgeTextView *v16;
  void *v17;
  CEKBadgeTextView *v18;
  void *v19;
  uint64_t v20;
  CEKBadgeTextView *disabledTextView;
  CEKBadgeTextView *v22;
  void *v23;
  CEKBadgeTextView *v24;
  void *v25;
  CAMShallowDepthOfFieldBadge *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CAMShallowDepthOfFieldBadge;
  v3 = -[CAMShallowDepthOfFieldBadge initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMShallowDepthOfFieldBadge bounds](v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    CAMLocalizedFrameworkString(CFSTR("PORTRAIT_MODE_BADGE"), &stru_1EA3325A0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0D028]), "initWithFrame:", v6, v8, v10, v12);
    enabledTextView = v4->__enabledTextView;
    v4->__enabledTextView = (CEKBadgeTextView *)v14;

    -[CEKBadgeTextView _setText:](v4->__enabledTextView, "_setText:", v13);
    v16 = v4->__enabledTextView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeTextView _setFillColor:](v16, "_setFillColor:", v17);

    v18 = v4->__enabledTextView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeTextView _setContentColor:](v18, "_setContentColor:", v19);

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0D028]), "initWithFrame:", v6, v8, v10, v12);
    disabledTextView = v4->__disabledTextView;
    v4->__disabledTextView = (CEKBadgeTextView *)v20;

    -[CEKBadgeTextView _setText:](v4->__disabledTextView, "_setText:", v13);
    v22 = v4->__disabledTextView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeTextView _setFillColor:](v22, "_setFillColor:", v23);

    v24 = v4->__disabledTextView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKBadgeTextView _setContentColor:](v24, "_setContentColor:", v25);

    -[CEKBadgeTextView setAlpha:](v4->__disabledTextView, "setAlpha:", 0.3);
    -[CAMShallowDepthOfFieldBadge addSubview:](v4, "addSubview:", v4->__enabledTextView);
    -[CAMShallowDepthOfFieldBadge addSubview:](v4, "addSubview:", v4->__disabledTextView);
    -[CAMShallowDepthOfFieldBadge _updateForShallowDepthOfFieldStatusAnimated:](v4, "_updateForShallowDepthOfFieldStatusAnimated:", 0);
    v26 = v4;

  }
  return v4;
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3
{
  -[CAMShallowDepthOfFieldBadge setShallowDepthOfFieldStatus:animated:](self, "setShallowDepthOfFieldStatus:animated:", a3, 0);
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_shallowDepthOfFieldStatus != a3)
  {
    self->_shallowDepthOfFieldStatus = a3;
    -[CAMShallowDepthOfFieldBadge _updateForShallowDepthOfFieldStatusAnimated:](self, "_updateForShallowDepthOfFieldStatusAnimated:", a4);
  }
}

- (void)_updateForShallowDepthOfFieldStatusAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;
  id v14;
  char v15;

  -[CAMShallowDepthOfFieldBadge _enabledTextView](self, "_enabledTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMShallowDepthOfFieldBadge _disabledTextView](self, "_disabledTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CAMShallowDepthOfFieldBadge shallowDepthOfFieldStatus](self, "shallowDepthOfFieldStatus");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__CAMShallowDepthOfFieldBadge__updateForShallowDepthOfFieldStatusAnimated___block_invoke;
  aBlock[3] = &unk_1EA32CDB8;
  v15 = (v7 < 0xF) & (0x6202u >> v7);
  v8 = v5;
  v13 = v8;
  v9 = v6;
  v14 = v9;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v10, 0, 0.17, 0.0);
  else
    (*((void (**)(void *))v10 + 2))(v10);

}

uint64_t __75__CAMShallowDepthOfFieldBadge__updateForShallowDepthOfFieldStatusAnimated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  double v4;
  double v5;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = 1.0;
  if (v2)
  {
    v5 = 0.0;
  }
  else
  {
    v4 = 0.0;
    v5 = 0.3;
  }
  objc_msgSend(v3, "setAlpha:", v4);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[CEKBadgeTextView sizeThatFits:](self->__disabledTextView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CEKBadgeTextView intrinsicContentSize](self->__disabledTextView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
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
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAMShallowDepthOfFieldBadge;
  -[CAMShallowDepthOfFieldBadge layoutSubviews](&v11, sel_layoutSubviews);
  -[CAMShallowDepthOfFieldBadge bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CEKBadgeTextView setFrame:](self->__disabledTextView, "setFrame:");
  -[CEKBadgeTextView setFrame:](self->__enabledTextView, "setFrame:", v4, v6, v8, v10);
}

- (int64_t)shallowDepthOfFieldStatus
{
  return self->_shallowDepthOfFieldStatus;
}

- (CEKBadgeTextView)_enabledTextView
{
  return self->__enabledTextView;
}

- (CEKBadgeTextView)_disabledTextView
{
  return self->__disabledTextView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__disabledTextView, 0);
  objc_storeStrong((id *)&self->__enabledTextView, 0);
}

@end
