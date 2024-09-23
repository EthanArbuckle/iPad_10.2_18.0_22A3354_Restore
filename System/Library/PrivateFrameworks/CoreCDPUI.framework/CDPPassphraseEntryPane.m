@implementation CDPPassphraseEntryPane

- (CDPPassphraseEntryPane)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CDPPassphraseEntryPane *v7;
  uint64_t v8;
  UIScrollView *containerView;
  void *v10;
  void *v11;
  CDPPaneHeaderView *v12;
  uint64_t v13;
  CDPPaneHeaderView *headerView;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)CDPPassphraseEntryPane;
  v7 = -[DevicePINPane initWithFrame:](&v16, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD918]), "initWithFrame:", x, y, width, height);
    containerView = v7->_containerView;
    v7->_containerView = (UIScrollView *)v8;

    -[UIScrollView setKeyboardDismissMode:](v7->_containerView, "setKeyboardDismissMode:", 0);
    -[CDPPassphraseEntryPane addSubview:](v7, "addSubview:", v7->_containerView);
    -[UIScrollView addSubview:](v7->_containerView, "addSubview:", *(Class *)((char *)&v7->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75680]));
    objc_msgSend(MEMORY[0x24BEBD4B8], "_systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPPassphraseEntryPane setBackgroundColor:](v7, "setBackgroundColor:", v10);

    objc_msgSend(MEMORY[0x24BEBD4B8], "_systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView setBackgroundColor:](v7->_containerView, "setBackgroundColor:", v11);

    v12 = [CDPPaneHeaderView alloc];
    v13 = -[CDPPaneHeaderView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    headerView = v7->_headerView;
    v7->_headerView = (CDPPaneHeaderView *)v13;

    -[UIScrollView addSubview:](v7->_containerView, "addSubview:", v7->_headerView);
    -[CDPPassphraseEntryPane startListeningForKeyboardEvents](v7, "startListeningForKeyboardEvents");
  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CDPPassphraseEntryPane;
  -[DevicePINPane dealloc](&v4, sel_dealloc);
}

- (void)startListeningForKeyboardEvents
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardLayoutChanged, *MEMORY[0x24BEBE518], 0);

}

- (BOOL)isSmallScreen
{
  CGRect v3;

  -[CDPPassphraseEntryPane availableHeaderRect](self, "availableHeaderRect");
  return CGRectGetHeight(v3) < 190.0;
}

- (BOOL)isVerySmallScreen
{
  CGRect v3;

  -[CDPPassphraseEntryPane availableHeaderRect](self, "availableHeaderRect");
  return CGRectGetHeight(v3) < 120.0;
}

- (void)_keyboardLayoutChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  -[PSEditingPane viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSEditingPane viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "navigationController");
  else
    objc_msgSend(v5, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__CDPPassphraseEntryPane__keyboardLayoutChanged__block_invoke;
    v10[3] = &unk_24C854F40;
    v10[4] = self;
    objc_msgSend(v8, "offsetForCurrentKeyboard:", v10);
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__CDPPassphraseEntryPane__keyboardLayoutChanged__block_invoke_3;
    v9[3] = &unk_24C8541C0;
    v9[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);
  }

}

void __48__CDPPassphraseEntryPane__keyboardLayoutChanged__block_invoke(uint64_t a1, double a2)
{
  _QWORD block[5];

  *(double *)(*(_QWORD *)(a1 + 32) + 568) = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__CDPPassphraseEntryPane__keyboardLayoutChanged__block_invoke_2;
  block[3] = &unk_24C8541C0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __48__CDPPassphraseEntryPane__keyboardLayoutChanged__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

uint64_t __48__CDPPassphraseEntryPane__keyboardLayoutChanged__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (double)keyboardHeightOffset
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double MaxY;
  double v29;
  CGRect v30;
  CGRect v31;

  v3 = (void *)MEMORY[0x24BEBD6C8];
  -[PSEditingPane viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeForInterfaceOrientation:", objc_msgSend(v4, "interfaceOrientation"));
  v29 = v5;

  -[PSEditingPane viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSEditingPane viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v7, "convertRect:toView:", 0);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v30.origin.x = v20;
  v30.origin.y = v22;
  v30.size.width = v24;
  v30.size.height = v26;
  MaxY = CGRectGetMaxY(v30);
  v31.origin.x = v11;
  v31.origin.y = v13;
  v31.size.width = v15;
  v31.size.height = v17;
  return fmax(v29 - (MaxY - CGRectGetMaxY(v31)), 0.0);
}

- (id)headerView
{
  return self->_headerView;
}

- (void)layoutSubviews
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 568));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_20DC8F000, v2, v3, "\"Starting layout with KB offset: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)_layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  -[PSEditingPane viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSEditingPane viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "navigationController");
  else
    objc_msgSend(v5, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[CDPPassphraseEntryPane keyboardHeightOffset](self, "keyboardHeightOffset");
    self->_keyboardOffset = v8;
  }
  -[CDPPassphraseEntryPane _layoutContainerView](self, "_layoutContainerView");
  -[CDPPassphraseEntryPane _layoutHeaderRect](self, "_layoutHeaderRect");
  -[CDPPassphraseEntryPane _layoutPinView](self, "_layoutPinView");

}

- (CGRect)availableHeaderRect
{
  CGFloat Width;
  CGFloat v4;
  double v5;
  double v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect v13;
  CGRect result;

  -[UIScrollView bounds](self->_containerView, "bounds");
  Width = CGRectGetWidth(v12);
  -[UIScrollView bounds](self->_containerView, "bounds");
  v4 = CGRectGetHeight(v13) - self->_keyboardOffset;
  -[CDPPassphraseEntryPane desiredMinPinHeight](self, "desiredMinPinHeight");
  v6 = v4 - v5;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CDPPassphraseEntryPane availableHeaderRect].cold.1(Width, v6);

  v8 = 0.0;
  v9 = 0.0;
  v10 = Width;
  v11 = v6;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (double)desiredMinPinHeight
{
  _BOOL4 v2;
  double result;

  v2 = -[DevicePINPane simplePIN](self, "simplePIN");
  result = 75.0;
  if (v2)
    return 73.0;
  return result;
}

- (void)_layoutContainerView
{
  UIScrollView *containerView;
  void *v3;
  void *v4;
  id v5;

  containerView = self->_containerView;
  -[PSEditingPane viewController](self, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutFrame");
  -[UIScrollView setFrame:](containerView, "setFrame:");

}

- (void)_layoutHeaderRect
{
  CDPPaneHeaderView *headerView;

  headerView = self->_headerView;
  -[CDPPassphraseEntryPane availableHeaderRect](self, "availableHeaderRect");
  -[CDPPaneHeaderView setFrame:](headerView, "setFrame:");
  -[CDPPaneHeaderView layoutSubviews](self->_headerView, "layoutSubviews");
  -[CDPPassphraseEntryPane didFinishResizingHeaderView](self, "didFinishResizingHeaderView");
}

- (void)_layoutPinView
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_20DC8F000, v1, v2, "\"Pin View Start %@\", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_0();
}

- (void)didFinishResizingPinView
{
  CGFloat v3;
  UIScrollView *containerView;
  CGRect v5;
  CGRect v6;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75680]), "frame");
  v3 = CGRectGetMaxY(v5) + self->_keyboardOffset;
  -[UIScrollView setContentSize:](self->_containerView, "setContentSize:", 0.0, v3);
  containerView = self->_containerView;
  -[UIScrollView frame](containerView, "frame");
  -[UIScrollView setContentOffset:](containerView, "setContentOffset:", 0.0, fmax(v3 - CGRectGetHeight(v6), 0.0));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (void)availableHeaderRect
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;
  CGRect v10;

  v10.size.height = a2;
  v10.size.width = a1;
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  NSStringFromCGRect(v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_20DC8F000, v3, v4, "\"Available header rect: %@\", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_0();
}

@end
