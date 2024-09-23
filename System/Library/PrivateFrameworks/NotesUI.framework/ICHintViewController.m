@implementation ICHintViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    ICHintViewControllerActionButtonInsetHorizontal = 0x4030000000000000;
    ICHintViewControllerActionButtonInsetVertical = 0x4028000000000000;
    ICHintViewControllerActionButtonSpacing = 0x4028000000000000;
    ICHintViewControllerCloseButtonDimension = 0x403A000000000000;
    ICHintViewControllerContentSpacing = 0x4028000000000000;
    ICHintViewControllerOffsetX = 0xC03A000000000000;
    ICHintViewControllerOffsetY = 0x4059800000000000;
    ICHintViewControllerPadding = 0x4034000000000000;
    ICHintViewControllerTitleSubtitleSpacing = 0x3FF0000000000000;
    ICHintViewControllerWidth = 0x4074400000000000;
  }
}

- (ICHintViewController)initWithRootViewController:(id)a3 showsCloseButton:(BOOL)a4 hintTitle:(id)a5 hintSubtitle:(id)a6 buttonTitle:(id)a7 buttonAction:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  ICHintViewController *v19;
  ICHintViewController *v20;
  void *v21;
  id buttonAction;
  objc_super v24;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ICHintViewController;
  v19 = -[ICPillOrnamentViewController initWithRootViewController:contentAnchorPoint:sceneAnchorPoint:offset:cornerRadius:](&v24, sel_initWithRootViewController_contentAnchorPoint_sceneAnchorPoint_offset_cornerRadius_, a3, 1.0, 0.0, 1.0, 0.0, *(double *)&ICHintViewControllerOffsetX, *(double *)&ICHintViewControllerOffsetY, 0.0);
  v20 = v19;
  if (v19)
  {
    v19->_showsCloseButton = a4;
    objc_storeStrong((id *)&v19->_hintTitle, a5);
    objc_storeStrong((id *)&v20->_hintSubtitle, a6);
    objc_storeStrong((id *)&v20->_buttonTitle, a7);
    v21 = _Block_copy(v18);
    buttonAction = v20->_buttonAction;
    v20->_buttonAction = v21;

  }
  return v20;
}

- (void)viewDidLoad
{
  void *v3;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)ICHintViewController;
  -[ICHintViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[ICPillOrnamentViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHintViewController contentStackView](self, "contentStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[ICHintViewController contentStackView](self, "contentStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_addAnchorsToFillSuperviewWithPadding:", *(double *)&ICHintViewControllerPadding);

  if (-[ICHintViewController showsCloseButton](self, "showsCloseButton"))
  {
    -[ICHintViewController contentStackView](self, "contentStackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHintViewController closeButton](self, "closeButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addArrangedSubview:", v7);

  }
  -[ICHintViewController contentStackView](self, "contentStackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHintViewController hintStackView](self, "hintStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addArrangedSubview:", v9);

  -[ICHintViewController hintStackView](self, "hintStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHintViewController hintTitleLabel](self, "hintTitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addArrangedSubview:", v11);

  -[ICHintViewController hintStackView](self, "hintStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHintViewController hintSubtitleLabel](self, "hintSubtitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addArrangedSubview:", v13);

  -[ICHintViewController hintStackView](self, "hintStackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHintViewController actionButtonTopSpacerView](self, "actionButtonTopSpacerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addArrangedSubview:", v15);

  -[ICHintViewController actionButtonStackView](self, "actionButtonStackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHintViewController actionButton](self, "actionButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addArrangedSubview:", v17);

  -[ICHintViewController actionButtonStackView](self, "actionButtonStackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHintViewController actionButtonTrailingSpacerView](self, "actionButtonTrailingSpacerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addArrangedSubview:", v19);

  -[ICHintViewController hintStackView](self, "hintStackView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHintViewController actionButtonStackView](self, "actionButtonStackView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addArrangedSubview:", v21);

  if (-[ICHintViewController showsCloseButton](self, "showsCloseButton"))
  {
    v22 = (void *)MEMORY[0x1E0CB3718];
    -[ICHintViewController closeButton](self, "closeButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHintViewController hintTitleLabel](self, "hintTitleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v28);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICHintViewController;
  -[ICHintViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  -[ICPillOrnamentViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1148846080;
  LODWORD(v5) = 1112014848;
  objc_msgSend(v3, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *(double *)&ICHintViewControllerWidth, *(double *)(MEMORY[0x1E0DC4FF8] + 8), v4, v5);
  v7 = v6;
  v9 = v8;

  -[ICPillOrnamentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v7, v9);
}

- (UIButton)actionButton
{
  UIButton *actionButton;
  void *v5;
  void *v6;
  void *v7;
  UIButton *v8;
  UIButton *v9;
  UIButton *v10;
  _QWORD v11[5];

  actionButton = self->_actionButton;
  if (actionButton)
    return actionButton;
  objc_msgSend(MEMORY[0x1E0DC3520], "borderedProminentButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHintViewController buttonTitle](self, "buttonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(v5, "setContentInsets:", *(double *)&ICHintViewControllerActionButtonInsetVertical, *(double *)&ICHintViewControllerActionButtonInsetHorizontal, *(double *)&ICHintViewControllerActionButtonInsetVertical, *(double *)&ICHintViewControllerActionButtonInsetHorizontal);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__ICHintViewController_actionButton__block_invoke;
  v11[3] = &unk_1E5C21048;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3428], "actionWithHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v5, v7);
  v8 = (UIButton *)objc_claimAutoreleasedReturnValue();
  v9 = self->_actionButton;
  self->_actionButton = v8;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = self->_actionButton;

  return v10;
}

void __36__ICHintViewController_actionButton__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "buttonAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "buttonAction");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (UIStackView)actionButtonStackView
{
  UIStackView *actionButtonStackView;
  UIStackView *v4;
  UIStackView *v5;

  actionButtonStackView = self->_actionButtonStackView;
  if (!actionButtonStackView)
  {
    v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    v5 = self->_actionButtonStackView;
    self->_actionButtonStackView = v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButtonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_actionButtonStackView, "setAxis:", 0);
    -[UIStackView setSpacing:](self->_actionButtonStackView, "setSpacing:", *(double *)&ICHintViewControllerActionButtonSpacing);
    actionButtonStackView = self->_actionButtonStackView;
  }
  return actionButtonStackView;
}

- (UIView)actionButtonTopSpacerView
{
  UIView *actionButtonTopSpacerView;
  UIView *v4;
  UIView *v5;
  void *v6;
  void *v7;

  actionButtonTopSpacerView = self->_actionButtonTopSpacerView;
  if (!actionButtonTopSpacerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_actionButtonTopSpacerView;
    self->_actionButtonTopSpacerView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButtonTopSpacerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView heightAnchor](self->_actionButtonTopSpacerView, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToConstant:", *(double *)&ICHintViewControllerActionButtonSpacing);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 1);

    actionButtonTopSpacerView = self->_actionButtonTopSpacerView;
  }
  return actionButtonTopSpacerView;
}

- (UIView)actionButtonTrailingSpacerView
{
  UIView *actionButtonTrailingSpacerView;
  UIView *v4;
  UIView *v5;

  actionButtonTrailingSpacerView = self->_actionButtonTrailingSpacerView;
  if (!actionButtonTrailingSpacerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_actionButtonTrailingSpacerView;
    self->_actionButtonTrailingSpacerView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButtonTrailingSpacerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    actionButtonTrailingSpacerView = self->_actionButtonTrailingSpacerView;
  }
  return actionButtonTrailingSpacerView;
}

- (UIButton)closeButton
{
  UIButton *closeButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  UIButton *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIButton *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  closeButton = self->_closeButton;
  if (closeButton)
    return closeButton;
  objc_msgSend(MEMORY[0x1E0DC3520], "borderedProminentButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark"), v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBaseForegroundColor:", v7);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __35__ICHintViewController_closeButton__block_invoke;
  v19[3] = &unk_1E5C21048;
  v19[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3428], "actionWithHandler:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v5, v8);
  v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
  v10 = self->_closeButton;
  self->_closeButton = v9;

  v11 = (void *)MEMORY[0x1E0CB3718];
  -[UIButton widthAnchor](self->_closeButton, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", *(double *)&ICHintViewControllerCloseButtonDimension);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  -[UIButton heightAnchor](self->_closeButton, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", *(double *)&ICHintViewControllerCloseButtonDimension);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v16);

  v17 = self->_closeButton;
  return v17;
}

uint64_t __35__ICHintViewController_closeButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hide");
}

- (UIStackView)contentStackView
{
  UIStackView *contentStackView;
  UIStackView *v4;
  UIStackView *v5;

  contentStackView = self->_contentStackView;
  if (!contentStackView)
  {
    v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    v5 = self->_contentStackView;
    self->_contentStackView = v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](self->_contentStackView, "setSpacing:", *(double *)&ICHintViewControllerContentSpacing);
    -[UIStackView setAxis:](self->_contentStackView, "setAxis:", 0);
    -[UIStackView setAlignment:](self->_contentStackView, "setAlignment:", 1);
    contentStackView = self->_contentStackView;
  }
  return contentStackView;
}

- (UIStackView)hintStackView
{
  UIStackView *hintStackView;
  UIStackView *v4;
  UIStackView *v5;

  hintStackView = self->_hintStackView;
  if (!hintStackView)
  {
    v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    v5 = self->_hintStackView;
    self->_hintStackView = v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_hintStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](self->_hintStackView, "setSpacing:", *(double *)&ICHintViewControllerTitleSubtitleSpacing);
    -[UIStackView setAxis:](self->_hintStackView, "setAxis:", 1);
    hintStackView = self->_hintStackView;
  }
  return hintStackView;
}

- (UILabel)hintTitleLabel
{
  UILabel *hintTitleLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;

  hintTitleLabel = self->_hintTitleLabel;
  if (!hintTitleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_hintTitleLabel;
    self->_hintTitleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_hintTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_hintTitleLabel, "setFont:", v6);

    -[UILabel setNumberOfLines:](self->_hintTitleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTintColor:](self->_hintTitleLabel, "setTintColor:", v7);

    -[ICHintViewController hintTitle](self, "hintTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_hintTitleLabel, "setText:", v8);

    hintTitleLabel = self->_hintTitleLabel;
  }
  return hintTitleLabel;
}

- (UILabel)hintSubtitleLabel
{
  UILabel *hintSubtitleLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;

  hintSubtitleLabel = self->_hintSubtitleLabel;
  if (!hintSubtitleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_hintSubtitleLabel;
    self->_hintSubtitleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_hintSubtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_hintSubtitleLabel, "setFont:", v6);

    -[UILabel setNumberOfLines:](self->_hintSubtitleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTintColor:](self->_hintSubtitleLabel, "setTintColor:", v7);

    -[ICHintViewController hintSubtitle](self, "hintSubtitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_hintSubtitleLabel, "setText:", v8);

    hintSubtitleLabel = self->_hintSubtitleLabel;
  }
  return hintSubtitleLabel;
}

- (BOOL)showsCloseButton
{
  return self->_showsCloseButton;
}

- (NSString)hintTitle
{
  return self->_hintTitle;
}

- (void)setHintTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (NSString)hintSubtitle
{
  return self->_hintSubtitle;
}

- (void)setHintSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (id)buttonAction
{
  return self->_buttonAction;
}

- (void)setButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (void)setContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contentStackView, a3);
}

- (void)setHintStackView:(id)a3
{
  objc_storeStrong((id *)&self->_hintStackView, a3);
}

- (void)setActionButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonStackView, a3);
}

- (void)setActionButtonTopSpacerView:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonTopSpacerView, a3);
}

- (void)setActionButtonTrailingSpacerView:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonTrailingSpacerView, a3);
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (void)setHintTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_hintTitleLabel, a3);
}

- (void)setHintSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_hintSubtitleLabel, a3);
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_hintSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_hintTitleLabel, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_actionButtonTrailingSpacerView, 0);
  objc_storeStrong((id *)&self->_actionButtonTopSpacerView, 0);
  objc_storeStrong((id *)&self->_actionButtonStackView, 0);
  objc_storeStrong((id *)&self->_hintStackView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong(&self->_buttonAction, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_hintSubtitle, 0);
  objc_storeStrong((id *)&self->_hintTitle, 0);
}

@end
