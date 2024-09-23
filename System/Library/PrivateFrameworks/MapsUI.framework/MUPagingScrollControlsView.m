@implementation MUPagingScrollControlsView

- (MUPagingScrollControlsView)initWithHorizontalScrollView:(id)a3
{
  id v5;
  MUPagingScrollControlsView *v6;
  MUPagingScrollControlsView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPagingScrollControlsView;
  v6 = -[MUPagingScrollControlsView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollView, a3);
    -[MUPagingScrollControlsView _setupSubviews](v7, "_setupSubviews");
    -[MUPagingScrollControlsView _setupConstraints](v7, "_setupConstraints");
  }

  return v7;
}

- (void)_setupSubviews
{
  UIButton *v3;
  UIButton *previousPageButton;
  void *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  UIButton *nextPageButton;
  void *v11;
  UIButton *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.compact.left"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  previousPageButton = self->_previousPageButton;
  self->_previousPageButton = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_previousPageButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self->_previousPageButton, "setTintColor:", v5);

  -[UIButton setAlpha:](self->_previousPageButton, "setAlpha:", 0.0);
  -[UIButton setImage:forState:](self->_previousPageButton, "setImage:forState:", v15, 0);
  v6 = self->_previousPageButton;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 21.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](v6, "setPreferredSymbolConfiguration:forImageInState:", v7, 0);

  -[UIButton addTarget:action:forControlEvents:](self->_previousPageButton, "addTarget:action:forControlEvents:", self, sel__scrollPrevious, 64);
  -[MUPagingScrollControlsView addSubview:](self, "addSubview:", self->_previousPageButton);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.compact.right"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
  nextPageButton = self->_nextPageButton;
  self->_nextPageButton = v9;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_nextPageButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self->_nextPageButton, "setTintColor:", v11);

  -[UIButton setAlpha:](self->_nextPageButton, "setAlpha:", 0.0);
  -[UIButton setImage:forState:](self->_nextPageButton, "setImage:forState:", v8, 0);
  v12 = self->_nextPageButton;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 21.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](v12, "setPreferredSymbolConfiguration:forImageInState:", v13, 0);

  -[UIButton addTarget:action:forControlEvents:](self->_nextPageButton, "addTarget:action:forControlEvents:", self, sel__scrollNext, 64);
  -[MUPagingScrollControlsView addSubview:](self, "addSubview:", self->_nextPageButton);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", self, sel_handleHover_);
  -[MUPagingScrollControlsView addGestureRecognizer:](self, "addGestureRecognizer:", v14);

}

- (void)_setupConstraints
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UIButton centerYAnchor](self->_previousPageButton, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPagingScrollControlsView centerYAnchor](self, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  -[UIButton centerYAnchor](self->_nextPageButton, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPagingScrollControlsView centerYAnchor](self, "centerYAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  -[UIButton leftAnchor](self->_previousPageButton, "leftAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPagingScrollControlsView leftAnchor](self, "leftAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v8;
  -[UIButton rightAnchor](self->_nextPageButton, "rightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPagingScrollControlsView rightAnchor](self, "rightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v12);

  v13 = (void *)MEMORY[0x1E0CB3718];
  v14 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v13, "activateConstraints:", v14);

}

- (void)handleHover:(id)a3
{
  -[MUPagingScrollControlsView setHoverActive:](self, "setHoverActive:", (unint64_t)(objc_msgSend(a3, "state") - 1) < 2);
}

- (void)setHoverActive:(BOOL)a3
{
  if (self->_hoverActive != a3)
  {
    self->_hoverActive = a3;
    -[MUPagingScrollControlsView _updateChevronVisibility](self, "_updateChevronVisibility");
  }
}

- (BOOL)shouldFlipPagingDirection
{
  _BOOL4 v3;

  v3 = -[UIView _mapsui_isRTL](self, "_mapsui_isRTL");
  if (v3)
    LOBYTE(v3) = -[MUPagingScrollControlsView automaticallyFlipsForRTL](self, "automaticallyFlipsForRTL");
  return v3;
}

- (void)_updateChevronVisibility
{
  double Width;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  BOOL v9;
  _BOOL4 v10;
  BOOL v11;
  BOOL v12;
  _QWORD v13[5];
  BOOL v14;
  BOOL v15;
  CGRect v16;

  -[MUScrollViewProtocol frame](self->_scrollView, "frame");
  Width = CGRectGetWidth(v16);
  -[MUScrollViewProtocol contentSize](self->_scrollView, "contentSize");
  v5 = v4 - Width;
  -[MUScrollViewProtocol contentOffset](self->_scrollView, "contentOffset");
  v7 = v6 <= 0.0;
  -[MUScrollViewProtocol contentOffset](self->_scrollView, "contentOffset");
  v9 = v8 >= v5;
  v10 = -[MUPagingScrollControlsView shouldFlipPagingDirection](self, "shouldFlipPagingDirection");
  if (v10)
    v11 = v7;
  else
    v11 = v9;
  if (v10)
    v12 = v9;
  else
    v12 = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__MUPagingScrollControlsView__updateChevronVisibility__block_invoke;
  v13[3] = &unk_1E2E02A10;
  v13[4] = self;
  v14 = v12;
  v15 = v11;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v13, 0.2);
}

uint64_t __54__MUPagingScrollControlsView__updateChevronVisibility__block_invoke(uint64_t a1)
{
  int v2;
  double v3;
  double v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hoverActive");
  v3 = 0.0;
  v4 = 0.0;
  if (v2 && !*(_BYTE *)(a1 + 40))
    v4 = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", v4);
  if (objc_msgSend(*(id *)(a1 + 32), "hoverActive"))
  {
    if (*(_BYTE *)(a1 + 41))
      v3 = 0.0;
    else
      v3 = 1.0;
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", v3);
}

- (void)_scrollPrevious
{
  uint64_t v3;

  if (-[MUPagingScrollControlsView shouldFlipPagingDirection](self, "shouldFlipPagingDirection"))
    v3 = 1;
  else
    v3 = -1;
  -[MUPagingScrollControlsView _adjustScrollIndexByOffset:](self, "_adjustScrollIndexByOffset:", v3);
}

- (void)_scrollNext
{
  uint64_t v3;

  if (-[MUPagingScrollControlsView shouldFlipPagingDirection](self, "shouldFlipPagingDirection"))
    v3 = -1;
  else
    v3 = 1;
  -[MUPagingScrollControlsView _adjustScrollIndexByOffset:](self, "_adjustScrollIndexByOffset:", v3);
}

- (void)_adjustScrollIndexByOffset:(int64_t)a3
{
  double Width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  CGRect v12;

  -[MUScrollViewProtocol frame](self->_scrollView, "frame");
  Width = CGRectGetWidth(v12);
  -[MUScrollViewProtocol contentOffset](self->_scrollView, "contentOffset");
  v7 = round(v6 / Width);
  -[MUScrollViewProtocol contentSize](self->_scrollView, "contentSize");
  v9 = v8 - Width;
  v10 = Width * fmax(v7 + (double)a3, 0.0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__MUPagingScrollControlsView__adjustScrollIndexByOffset___block_invoke;
  v11[3] = &unk_1E2E01A60;
  if (v10 < v9)
    v9 = v10;
  v11[4] = self;
  *(double *)&v11[5] = v9;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v11, 0.2);
}

uint64_t __57__MUPagingScrollControlsView__adjustScrollIndexByOffset___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setContentOffset:", *(double *)(a1 + 40), 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "_updateChevronVisibility");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  MUPagingScrollControlsView *v8;
  uint64_t v9;
  MUPagingScrollControlsView *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)MUPagingScrollControlsView;
  v7 = a4;
  -[MUPagingScrollControlsView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  v8 = (MUPagingScrollControlsView *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "type", v12.receiver, v12.super_class);

  if (v9 || v8 != self)
    v10 = v8;
  else
    v10 = 0;

  return v10;
}

- (BOOL)automaticallyFlipsForRTL
{
  return self->_automaticallyFlipsForRTL;
}

- (void)setAutomaticallyFlipsForRTL:(BOOL)a3
{
  self->_automaticallyFlipsForRTL = a3;
}

- (BOOL)hoverActive
{
  return self->_hoverActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_nextPageButton, 0);
  objc_storeStrong((id *)&self->_previousPageButton, 0);
}

@end
