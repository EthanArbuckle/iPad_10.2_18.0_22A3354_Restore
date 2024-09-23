@implementation CDPUICodeEntryPane

- (CDPUICodeEntryPane)initWithFrame:(CGRect)a3
{
  CDPUICodeEntryPane *v3;
  CDPUICodeEntryPane *v4;
  UIScrollView *containerView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CDPUICodeEntryPane;
  v3 = -[CDPPassphraseEntryPane initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    containerView = v3->super._containerView;
    -[CDPUICodeEntryPane _createFooterButton](v3, "_createFooterButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView addSubview:](containerView, "addSubview:", v6);

  }
  return v4;
}

- (id)_createFooterButton
{
  UIButton *v3;
  UIButton *footerButton;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
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

- (void)didFinishResizingHeaderView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDPUICodeEntryPane;
  -[CDPPassphraseEntryPane didFinishResizingHeaderView](&v3, sel_didFinishResizingHeaderView);
  -[CDPUICodeEntryPane setViewModel:](self, "setViewModel:", self->_viewModel);
}

- (void)didFinishResizingPinView
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
  double v46;
  double v47;
  double v48;
  double Height;
  CGFloat v50;
  CGFloat v51;
  double v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75680]), "frame");
  v3 = CGRectGetMaxY(v53) + self->super._keyboardOffset;
  -[UIScrollView setContentSize:](self->super._containerView, "setContentSize:", 0.0, v3);
  containerView = self->super._containerView;
  -[UIScrollView frame](containerView, "frame");
  v46 = v3;
  -[UIScrollView setContentOffset:](containerView, "setContentOffset:", 0.0, fmax(v3 - CGRectGetHeight(v54), 0.0));
  if (-[CDPPassphraseEntryPane isSmallScreen](self, "isSmallScreen"))
    v5 = 8.0;
  else
    v5 = 24.0;
  v6 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledValueForValue:", v5);
  v9 = v8;
  v48 = v8;

  v10 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredFontForTextStyle:compatibleWithTraitCollection:", v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_footerButton, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

  -[UIButton frame](self->_footerButton, "frame");
  v50 = v16;
  v51 = v15;
  -[UIButton titleLabel](self->_footerButton, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICodeEntryPane frame](self, "frame");
  objc_msgSend(v17, "sizeThatFits:", CGRectGetWidth(v55), 1.79769313e308);
  v19 = v18;
  v21 = v20;

  v22 = (int)*MEMORY[0x24BE75678];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v22), "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v56.origin.x = v25;
  v56.origin.y = v27;
  v56.size.width = v29;
  v56.size.height = v31;
  Height = CGRectGetHeight(v56);
  -[CDPPassphraseEntryPane desiredMinPinHeight](self, "desiredMinPinHeight");
  v33 = v32;
  v47 = v9 + v21;
  -[CDPUICodeEntryPane bounds](self, "bounds");
  MidX = CGRectGetMidX(v57);
  v58.origin.y = v50;
  v58.origin.x = v51;
  v58.size.width = v19;
  v58.size.height = v21;
  Width = CGRectGetWidth(v58);
  v36 = 0.0;
  if (Height > v33)
    v36 = v47;
  v37 = v31 - v36;
  v38 = MidX + Width * -0.5;
  v39 = 8.0;
  if (Height > v33)
    v39 = v48;
  v52 = v39;
  v59.origin.x = v25;
  v59.origin.y = v27;
  v59.size.width = v29;
  v59.size.height = v37;
  MaxY = CGRectGetMaxY(v59);
  -[UIButton setFrame:](self->_footerButton, "setFrame:", v38, MaxY, v19, v21);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v22), "superview");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFrame:", v25, v27, v29, v37);

  v42 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v22);
  objc_msgSend(v42, "superview");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bounds");
  objc_msgSend(v42, "setFrame:");

  v60.origin.x = v38;
  v60.origin.y = MaxY;
  v60.size.width = v19;
  v60.size.height = v21;
  -[UIScrollView setContentSize:](self->super._containerView, "setContentSize:", 0.0, v52 + CGRectGetMaxY(v60) + self->super._keyboardOffset);
  -[UIButton superview](self->_footerButton, "superview");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v45 = self->super._containerView;
    -[UIScrollView frame](v45, "frame");
    -[UIScrollView setContentOffset:](v45, "setContentOffset:", 0.0, v46 - CGRectGetHeight(v61));
  }
}

- (void)setViewModel:(id)a3
{
  CDPUICodeEntryViewModel **p_viewModel;
  CDPPaneHeaderView *headerView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIButton *footerButton;
  void *v18;
  UIButton *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  p_viewModel = &self->_viewModel;
  objc_storeStrong((id *)&self->_viewModel, a3);
  headerView = self->super._headerView;
  -[CDPUICodeEntryViewModel promptTitle](self->_viewModel, "promptTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPPaneHeaderView setTitleText:](headerView, "setTitleText:", v7);

  -[CDPUICodeEntryViewModel promptMessage](self->_viewModel, "promptMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPPaneHeaderView subLabel](self->super._headerView, "subLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  v10 = (void *)MEMORY[0x24BEBB520];
  v11 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredFontForTextStyle:compatibleWithTraitCollection:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPPaneHeaderView subLabel](self->super._headerView, "subLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  -[CDPPaneHeaderView makeAllTheTextFits](self->super._headerView, "makeAllTheTextFits");
  -[CDPUICodeEntryViewModel escapeOffer](self->_viewModel, "escapeOffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  footerButton = self->_footerButton;
  if (v16)
  {
    -[CDPUICodeEntryViewModel escapeOffer](*p_viewModel, "escapeOffer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addTarget:action:forControlEvents:](footerButton, "addTarget:action:forControlEvents:", v18, sel_handleEscapeAction_, 64);

    v19 = self->_footerButton;
    -[CDPUICodeEntryViewModel escapeOffer](*p_viewModel, "escapeOffer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v19, "setTitle:forState:", v21, 0);

  }
  else
  {
    -[UIButton removeFromSuperview](self->_footerButton, "removeFromSuperview");
  }

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
}

@end
