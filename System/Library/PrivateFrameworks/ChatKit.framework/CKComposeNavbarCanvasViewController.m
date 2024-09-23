@implementation CKComposeNavbarCanvasViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKComposeNavbarCanvasViewController;
  -[CKComposeNavbarCanvasViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)loadView
{
  void *v3;
  id v4;

  -[CKComposeNavbarCanvasViewController _setupDefaultCanvasView](self, "_setupDefaultCanvasView");
  -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[CKComposeNavbarCanvasViewController canvasView](self, "canvasView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKComposeNavbarCanvasViewController setView:](self, "setView:", v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateTitle:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;
  id v16;
  CKComposeNavbarCanvasViewController *v17;

  v4 = a4;
  v6 = a3;
  -[CKComposeNavbarCanvasViewController titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if ((v9 & 1) == 0)
  {
    -[CKComposeNavbarCanvasViewController titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__CKComposeNavbarCanvasViewController_updateTitle_animated___block_invoke;
    aBlock[3] = &unk_1E274A0B8;
    v11 = v10;
    v15 = v11;
    v16 = v6;
    v17 = self;
    v12 = _Block_copy(aBlock);
    v13 = v12;
    if (v4)
      objc_msgSend(MEMORY[0x1E0CEABB0], "transitionWithView:duration:options:animations:completion:", v11, 5242880, v12, 0, 0.35);
    else
      (*((void (**)(void *))v12 + 2))(v12);

  }
}

void __60__CKComposeNavbarCanvasViewController_updateTitle_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setText:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "canvasView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)_setupDefaultCanvasView
{
  CKNavigationBarCanvasView *v3;
  void *v4;
  void *v5;
  CKNavigationBarCanvasView *v6;

  v3 = [CKNavigationBarCanvasView alloc];
  v6 = -[CKNavigationBarCanvasView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKComposeNavbarCanvasViewController titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavigationBarCanvasView setTitleView:](v6, "setTitleView:", v4);

  -[CKComposeNavbarCanvasViewController cancelButton](self, "cancelButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNavigationBarCanvasView setRightItemView:](v6, "setRightItemView:", v5);

  -[CKComposeNavbarCanvasViewController setCanvasView:](self, "setCanvasView:", v6);
}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    v6 = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (UIButton)cancelButton
{
  UIButton *cancelButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  void *v7;
  UIButton *v8;
  void *v9;
  void *v10;

  cancelButton = self->_cancelButton;
  if (!cancelButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cancelButton;
    self->_cancelButton = v4;

    -[UIButton titleLabel](self->_cancelButton, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    v8 = self->_cancelButton;
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v8, "setTitle:forState:", v10, 0);

    cancelButton = self->_cancelButton;
  }
  return cancelButton;
}

- (id)_windowTraitCollection
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldShowAvatarView
{
  void *v2;
  char v3;

  -[CKComposeNavbarCanvasViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowAvatarViewInNavBarCanvas");

  return v3;
}

- (BOOL)shouldConfigureForJunkModal
{
  return 0;
}

- (NSDirectionalEdgeInsets)systemMinimumLayoutMarginsForView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSDirectionalEdgeInsets result;

  -[CKComposeNavbarCanvasViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemMinimumLayoutMarginsForViewController:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.trailing = v16;
  result.bottom = v15;
  result.leading = v14;
  result.top = v13;
  return result;
}

- (id)locationLabel
{
  return 0;
}

- (BOOL)splitViewControllerIsCollapsed
{
  void *v2;
  void *v3;
  char v4;

  -[CKComposeNavbarCanvasViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCollapsed");

  return v4;
}

- (BOOL)shouldUseMinimumSafeAreas
{
  return 0;
}

- (double)preferredHeightOverride
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  -[CKComposeNavbarCanvasViewController _windowTraitCollection](self, "_windowTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKComposeNavbarCanvasViewController shouldShowAvatarView](self, "shouldShowAvatarView"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultNavigationBarHeightValueWantsMinimumSafeAreas:", -[CKComposeNavbarCanvasViewController shouldUseMinimumSafeAreas](self, "shouldUseMinimumSafeAreas"));
    v6 = v5;

  }
  else if (objc_msgSend(v3, "verticalSizeClass") == 1)
  {
    objc_msgSend(v3, "horizontalSizeClass");
    +[CKNavigationBarCanvasView preferredLandscapeHeightForRegularWidth](CKNavigationBarCanvasView, "preferredLandscapeHeightForRegularWidth");
    v6 = v7;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBarDefaultHeight");
    v6 = v9;

  }
  return v6;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (CKNavbarCanvasViewControllerDelegate)delegate
{
  return (CKNavbarCanvasViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (CKNavigationBarCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
  objc_storeStrong((id *)&self->_canvasView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

@end
