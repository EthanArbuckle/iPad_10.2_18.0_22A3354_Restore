@implementation CAMLevelIndicatorView

- (CAMLevelIndicatorView)initWithCoder:(id)a3
{
  CAMLevelIndicatorView *v3;
  CAMLevelViewModel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMLevelIndicatorView;
  v3 = -[CAMLevelIndicatorView initWithCoder:](&v6, sel_initWithCoder_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(CAMLevelViewModel);
    -[CAMLevelIndicatorView _commonCAMLevelIndicatorViewInitializationWithViewModel:](v3, "_commonCAMLevelIndicatorViewInitializationWithViewModel:", v4);

  }
  return v3;
}

- (CAMLevelIndicatorView)initWithFrame:(CGRect)a3
{
  CAMLevelIndicatorView *v3;
  CAMLevelViewModel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMLevelIndicatorView;
  v3 = -[CAMLevelIndicatorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CAMLevelViewModel);
    -[CAMLevelIndicatorView _commonCAMLevelIndicatorViewInitializationWithViewModel:](v3, "_commonCAMLevelIndicatorViewInitializationWithViewModel:", v4);

  }
  return v3;
}

- (CAMLevelIndicatorView)initWithViewModel:(id)a3
{
  id v4;
  CAMLevelIndicatorView *v5;
  CAMLevelIndicatorView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMLevelIndicatorView;
  v5 = -[CAMLevelIndicatorView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
    -[CAMLevelIndicatorView _commonCAMLevelIndicatorViewInitializationWithViewModel:](v5, "_commonCAMLevelIndicatorViewInitializationWithViewModel:", v4);

  return v6;
}

- (void)_commonCAMLevelIndicatorViewInitializationWithViewModel:(id)a3
{
  CAMLevelViewModel **p_viewModel;
  id v6;
  CAMLevelCrosshair *v7;
  CAMLevelCrosshair *userCrosshair;
  CAMLevelCrosshair *v9;
  CAMLevelCrosshair *goalCrosshair;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;

  p_viewModel = &self->_viewModel;
  objc_storeStrong((id *)&self->_viewModel, a3);
  v6 = a3;
  -[CAMObservable registerChangeObserver:context:](*p_viewModel, "registerChangeObserver:context:", self, 0);
  v7 = objc_alloc_init(CAMLevelCrosshair);
  userCrosshair = self->__userCrosshair;
  self->__userCrosshair = v7;

  v9 = objc_alloc_init(CAMLevelCrosshair);
  goalCrosshair = self->__goalCrosshair;
  self->__goalCrosshair = v9;

  -[CAMLevelIndicatorView addSubview:](self, "addSubview:", self->__userCrosshair);
  -[CAMLevelIndicatorView addSubview:](self, "addSubview:", self->__goalCrosshair);
  -[CAMLevelIndicatorView bounds](self, "bounds");
  UIRectGetCenter();
  -[CAMLevelCrosshair setCenter:](self->__goalCrosshair, "setCenter:");
  -[CAMLevelCrosshair setAutoresizingMask:](self->__goalCrosshair, "setAutoresizingMask:", 45);
  -[CAMLevelCrosshair setBounds:](self->__userCrosshair, "setBounds:", 0.0, 0.0, 32.0, 32.0);
  -[CAMLevelCrosshair setBounds:](self->__goalCrosshair, "setBounds:", 0.0, 0.0, 32.0, 32.0);
  -[CAMLevelViewModel currentIndicatorAlpha](*p_viewModel, "currentIndicatorAlpha");
  v12 = v11;
  -[CAMLevelViewModel currentIndicatorOffset](*p_viewModel, "currentIndicatorOffset");
  v14 = v13;
  v16 = v15;
  v17 = -[CAMLevelViewModel currentIndicatorMode](*p_viewModel, "currentIndicatorMode");

  -[CAMLevelIndicatorView _updateCrosshairAlphasWithAlpha:indicatorMode:](self, "_updateCrosshairAlphasWithAlpha:indicatorMode:", v17, v12);
  -[CAMLevelIndicatorView _updateCrosshairHighlightWithOffset:](self, "_updateCrosshairHighlightWithOffset:", v14, v16);
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
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMLevelIndicatorView;
  -[CAMLevelIndicatorView layoutSubviews](&v13, sel_layoutSubviews);
  -[CAMLevelIndicatorView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "currentIndicatorMode") == 1)
  {
    -[CAMLevelIndicatorView bounds](self, "bounds");
    UIRectGetCenter();
    v5 = v4;
    v7 = v6;
    objc_msgSend(v3, "currentIndicatorOffset");
    v9 = v5 + v8;
    v11 = v7 + v10;
    -[CAMLevelIndicatorView _userCrosshair](self, "_userCrosshair");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCenter:", v9, v11);

  }
}

- (void)_updateCrosshairHighlightWithOffset:(UIOffset)a3
{
  double vertical;
  double horizontal;
  void *v6;
  _BOOL8 v7;
  id v8;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[CAMLevelIndicatorView _goalCrosshair](self, "_goalCrosshair");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMLevelIndicatorView _userCrosshair](self, "_userCrosshair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = vertical == *(double *)(MEMORY[0x1E0DC51A8] + 8) && horizontal == *MEMORY[0x1E0DC51A8];
  objc_msgSend(v8, "setHighlighted:", v7);
  objc_msgSend(v6, "setHighlighted:", 1);

}

- (void)_updateCrosshairAlphasWithAlpha:(double)a3 indicatorMode:(int64_t)a4
{
  void *v6;
  id v7;

  if (a4 != 1)
    a3 = 0.0;
  -[CAMLevelIndicatorView _userCrosshair](self, "_userCrosshair");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMLevelIndicatorView _goalCrosshair](self, "_goalCrosshair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", a3);
  objc_msgSend(v6, "setAlpha:", a3);

}

- (void)observable:(id)a3 didPublishChange:(unint64_t)a4 withContext:(void *)a5
{
  char v6;
  id v8;
  double v9;
  id v10;

  v6 = a4;
  v8 = a3;
  if (!a5)
  {
    v10 = v8;
    if ((v6 & 3) != 0)
    {
      objc_msgSend(v8, "currentIndicatorOffset");
      -[CAMLevelIndicatorView _updateCrosshairHighlightWithOffset:](self, "_updateCrosshairHighlightWithOffset:");
      -[CAMLevelIndicatorView setNeedsLayout](self, "setNeedsLayout");
      v8 = v10;
    }
    if ((v6 & 5) != 0)
    {
      objc_msgSend(v10, "currentIndicatorAlpha");
      -[CAMLevelIndicatorView _updateCrosshairAlphasWithAlpha:indicatorMode:](self, "_updateCrosshairAlphasWithAlpha:indicatorMode:", objc_msgSend(v10, "currentIndicatorMode"), v9);
      v8 = v10;
    }
  }

}

- (CAMLevelViewModel)viewModel
{
  return self->_viewModel;
}

- (CAMLevelCrosshair)_goalCrosshair
{
  return self->__goalCrosshair;
}

- (CAMLevelCrosshair)_userCrosshair
{
  return self->__userCrosshair;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__userCrosshair, 0);
  objc_storeStrong((id *)&self->__goalCrosshair, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
