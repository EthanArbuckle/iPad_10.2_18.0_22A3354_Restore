@implementation AAUICodeEntryPane

- (AAUICodeEntryPane)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  AAUICodeEntryPane *v7;
  uint64_t v8;
  UIScrollView *containerView;
  void *v10;
  void *v11;
  AAUIPaneHeaderView *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  AAUIPaneHeaderView *headerView;
  UIScrollView *v17;
  void *v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)AAUICodeEntryPane;
  v7 = -[DevicePINPane initWithFrame:](&v20, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", x, y, width, height);
    containerView = v7->_containerView;
    v7->_containerView = (UIScrollView *)v8;

    -[UIScrollView setKeyboardDismissMode:](v7->_containerView, "setKeyboardDismissMode:", 0);
    -[AAUICodeEntryPane addSubview:](v7, "addSubview:", v7->_containerView);
    -[UIScrollView addSubview:](v7->_containerView, "addSubview:", *(Class *)((char *)&v7->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80558]));
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUICodeEntryPane setBackgroundColor:](v7, "setBackgroundColor:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView setBackgroundColor:](v7->_containerView, "setBackgroundColor:", v11);

    v12 = [AAUIPaneHeaderView alloc];
    -[AAUICodeEntryContext promptTitle](v7->_context, "promptTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUICodeEntryContext promptMessage](v7->_context, "promptMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[AAUIPaneHeaderView initWithTitle:detailText:icon:](v12, "initWithTitle:detailText:icon:", v13, v14, 0);
    headerView = v7->_headerView;
    v7->_headerView = (AAUIPaneHeaderView *)v15;

    -[UIScrollView addSubview:](v7->_containerView, "addSubview:", v7->_headerView);
    v17 = v7->_containerView;
    -[AAUICodeEntryPane _createFooterButton](v7, "_createFooterButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView addSubview:](v17, "addSubview:", v18);

    -[AAUICodeEntryPane _startListeningForKeyboardEvents](v7, "_startListeningForKeyboardEvents");
  }
  return v7;
}

- (id)_createFooterButton
{
  UIButton *v3;
  UIButton *footerButton;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  footerButton = self->_footerButton;
  self->_footerButton = v3;

  -[UIButton titleLabel](self->_footerButton, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  -[UIButton titleLabel](self->_footerButton, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", 1);

  -[UIButton setAutoresizingMask:](self->_footerButton, "setAutoresizingMask:", 12);
  return self->_footerButton;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AAUICodeEntryPane;
  -[DevicePINPane dealloc](&v4, sel_dealloc);
}

- (void)_startListeningForKeyboardEvents
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardLayoutChanged, *MEMORY[0x1E0DC4F58], 0);

}

- (BOOL)_isSmallScreen
{
  CGRect v3;

  -[AAUICodeEntryPane _availableHeaderRect](self, "_availableHeaderRect");
  return CGRectGetHeight(v3) < 190.0;
}

- (BOOL)_isVerySmallScreen
{
  CGRect v3;

  -[AAUICodeEntryPane _availableHeaderRect](self, "_availableHeaderRect");
  return CGRectGetHeight(v3) < 120.0;
}

- (void)_keyboardLayoutChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AAUICodeEntryPane__keyboardLayoutChanged__block_invoke;
  block[3] = &unk_1EA2DB208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __43__AAUICodeEntryPane__keyboardLayoutChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (double)keyboardHeightOffset
{
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double MaxY;
  double v31;
  CGRect v32;
  CGRect v33;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 226.0;
  v6 = (void *)MEMORY[0x1E0DC3938];
  -[PSEditingPane viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeForInterfaceOrientation:", objc_msgSend(v7, "interfaceOrientation"));
  v31 = v8;

  -[PSEditingPane viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSEditingPane viewController](self, "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v10, "convertRect:toView:", 0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v32.origin.x = v23;
  v32.origin.y = v25;
  v32.size.width = v27;
  v32.size.height = v29;
  MaxY = CGRectGetMaxY(v32);
  v33.origin.x = v14;
  v33.origin.y = v16;
  v33.size.width = v18;
  v33.size.height = v20;
  return fmax(v31 - (MaxY - CGRectGetMaxY(v33)), 0.0);
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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 560));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_5(&dword_1DB4ED000, v2, v3, "Starting layout with KB offset: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9_0();
}

- (void)_layoutSubviews
{
  double v3;

  -[AAUICodeEntryPane keyboardHeightOffset](self, "keyboardHeightOffset");
  self->_keyboardOffset = v3;
  -[AAUICodeEntryPane _layoutContainerView](self, "_layoutContainerView");
  -[AAUICodeEntryPane _layoutHeaderRect](self, "_layoutHeaderRect");
  -[AAUICodeEntryPane _layoutPinView](self, "_layoutPinView");
}

- (CGRect)_availableHeaderRect
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
  -[AAUICodeEntryPane _desiredMinPinHeight](self, "_desiredMinPinHeight");
  v6 = v4 - v5;
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AAUICodeEntryPane _availableHeaderRect].cold.1(Width, v6);

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

- (double)_desiredMinPinHeight
{
  return 73.0;
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
  AAUIPaneHeaderView *headerView;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AAUIPaneHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  headerView = self->_headerView;
  -[AAUICodeEntryPane _availableHeaderRect](self, "_availableHeaderRect");
  -[AAUIPaneHeaderView setFrame:](headerView, "setFrame:");
  -[AAUIPaneHeaderView widthAnchor](self->_headerView, "widthAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bounds](self->_containerView, "bounds");
  objc_msgSend(v4, "constraintEqualToConstant:", v5 + -24.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[AAUIPaneHeaderView centerXAnchor](self->_headerView, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView centerXAnchor](self->_containerView, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[AAUIPaneHeaderView layoutSubviews](self->_headerView, "layoutSubviews");
  -[AAUICodeEntryPane _didFinishResizingHeaderView](self, "_didFinishResizingHeaderView");
}

- (void)_didFinishResizingHeaderView
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;
  CGRect v9;

  objc_msgSend(*(id *)(a1 + 576), "bounds");
  NSStringFromCGRect(v9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_5(&dword_1DB4ED000, v2, v3, "Available frame for remote secret view: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9_0();
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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_5(&dword_1DB4ED000, v1, v2, "Pin View Start %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_9_0();
}

- (void)_didFinishResizingPinView
{
  CGFloat v3;
  UIScrollView *containerView;
  double v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MidX;
  double Width;
  double v36;
  double v37;
  double v38;
  double v39;
  double MaxY;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  UIScrollView *v45;
  void *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double Height;
  CGFloat v52;
  CGFloat v53;
  double v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80558]), "frame");
  v3 = CGRectGetMaxY(v55) + self->_keyboardOffset;
  -[UIScrollView setContentSize:](self->_containerView, "setContentSize:", 0.0, v3);
  containerView = self->_containerView;
  -[UIScrollView frame](containerView, "frame");
  v48 = v3;
  -[UIScrollView setContentOffset:](containerView, "setContentOffset:", 0.0, fmax(v3 - CGRectGetHeight(v56), 0.0));
  if (-[AAUICodeEntryPane _isSmallScreen](self, "_isSmallScreen"))
    v5 = 8.0;
  else
    v5 = 24.0;
  v6 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledValueForValue:", v5);
  v9 = v8;
  v50 = v8;

  v10 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredFontForTextStyle:compatibleWithTraitCollection:", v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_footerButton, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

  -[UIButton frame](self->_footerButton, "frame");
  v52 = v16;
  v53 = v15;
  -[UIButton titleLabel](self->_footerButton, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUICodeEntryPane frame](self, "frame");
  objc_msgSend(v17, "sizeThatFits:", CGRectGetWidth(v57), 1.79769313e308);
  v19 = v18;
  v21 = v20;

  v22 = (int)*MEMORY[0x1E0D80550];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v22), "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v58.origin.x = v25;
  v58.origin.y = v27;
  v58.size.width = v29;
  v58.size.height = v31;
  Height = CGRectGetHeight(v58);
  -[AAUICodeEntryPane _desiredMinPinHeight](self, "_desiredMinPinHeight");
  v33 = v32;
  v49 = v9 + v21;
  -[AAUICodeEntryPane bounds](self, "bounds");
  MidX = CGRectGetMidX(v59);
  v60.origin.y = v52;
  v60.origin.x = v53;
  v60.size.width = v19;
  v60.size.height = v21;
  Width = CGRectGetWidth(v60);
  v36 = 0.0;
  if (Height > v33)
    v36 = v49;
  v37 = v31 - v36;
  v38 = MidX + Width * -0.5;
  v39 = 8.0;
  if (Height > v33)
    v39 = v50;
  v54 = v39;
  v61.origin.x = v25;
  v61.origin.y = v27;
  v61.size.width = v29;
  v61.size.height = v37;
  MaxY = CGRectGetMaxY(v61);
  -[UIButton setFrame:](self->_footerButton, "setFrame:", v38, MaxY, v19, v21);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v22), "superview");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFrame:", v25, v27, v29, v37);

  v42 = *(Class *)((char *)&self->super.super.super.super.super.isa + v22);
  objc_msgSend(v42, "superview");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bounds");
  objc_msgSend(v42, "setFrame:");

  v62.origin.x = v38;
  v62.origin.y = MaxY;
  v62.size.width = v19;
  v62.size.height = v21;
  -[UIScrollView setContentSize:](self->_containerView, "setContentSize:", 0.0, v54 + CGRectGetMaxY(v62) + self->_keyboardOffset);
  -[UIButton superview](self->_footerButton, "superview");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v45 = self->_containerView;
    -[UIScrollView frame](v45, "frame");
    -[UIScrollView setContentOffset:](v45, "setContentOffset:", 0.0, fmax(v48 - CGRectGetHeight(v63), 0.0));
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "userInterfaceIdiom");

    if ((v47 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      -[UIScrollView setContentInset:](self->_containerView, "setContentInset:", 0.0, 0.0, 10.0, 0.0);
  }
}

- (void)setContext:(id)a3
{
  AAUICodeEntryContext **p_context;
  AAUIPaneHeaderView *headerView;
  void *v7;
  AAUIPaneHeaderView *v8;
  void *v9;
  void *v10;
  UIButton *footerButton;
  UIButton *v12;
  void *v13;
  id v14;

  v14 = a3;
  p_context = &self->_context;
  objc_storeStrong((id *)&self->_context, a3);
  headerView = self->_headerView;
  -[AAUICodeEntryContext promptTitle](self->_context, "promptTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIPaneHeaderView setTitleText:](headerView, "setTitleText:", v7);

  v8 = self->_headerView;
  -[AAUICodeEntryContext promptMessage](self->_context, "promptMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIPaneHeaderView setDetailText:](v8, "setDetailText:", v9);

  -[AAUICodeEntryContext escapeTitle](self->_context, "escapeTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  footerButton = self->_footerButton;
  if (v10)
  {
    -[UIButton addTarget:action:forControlEvents:](footerButton, "addTarget:action:forControlEvents:", self, sel_handleEscapeAction_, 64);
    v12 = self->_footerButton;
    -[AAUICodeEntryContext escapeTitle](*p_context, "escapeTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v12, "setTitle:forState:", v13, 0);

  }
  else
  {
    -[UIButton removeFromSuperview](footerButton, "removeFromSuperview");
  }

}

- (void)handleEscapeAction:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  -[PSEditingPane viewController](self, "viewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[AAUICodeEntryContext escapeAction](self->_context, "escapeAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AAUICodeEntryContext escapeAction](self->_context, "escapeAction");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_availableHeaderRect
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
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_5(&dword_1DB4ED000, v3, v4, "Available header rect: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9_0();
}

@end
