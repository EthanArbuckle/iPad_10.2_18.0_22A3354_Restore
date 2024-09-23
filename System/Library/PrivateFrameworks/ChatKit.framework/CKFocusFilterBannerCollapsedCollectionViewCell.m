@implementation CKFocusFilterBannerCollapsedCollectionViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("FocusFilterBannerCollapsed");
}

- (CKFocusFilterBannerCollapsedCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKFocusFilterBannerCollapsedCollectionViewCell *v3;
  CKFocusFilterBannerCollapsedCollectionViewCell *v4;
  void *v5;
  uint64_t v6;
  UIButton *focusFilterToggleButton;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CKFocusFilterBannerCollapsedCollectionViewCell;
  v3 = -[CKFocusFilterBannerCollapsedCollectionViewCell initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKFocusFilterBannerCollapsedCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFocusFilterBannerCollapsedCollectionViewCell setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(v5, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    focusFilterToggleButton = v4->_focusFilterToggleButton;
    v4->_focusFilterToggleButton = (UIButton *)v6;

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v4);
    -[UIButton addInteraction:](v4->_focusFilterToggleButton, "addInteraction:", v8);
    -[UIButton addTarget:action:forControlEvents:](v4->_focusFilterToggleButton, "addTarget:action:forControlEvents:", v4, sel__focusFilterToggleButtonSelected_, 0x2000);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_focusFilterToggleButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v4->_focusFilterToggleButton);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conversationListFocusFilterBannerTopPadding");
    v11 = v10;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conversationListFocusFilterBannerBottomPadding");
    v14 = v13;

    -[UIButton topAnchor](v4->_focusFilterToggleButton, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    objc_msgSend(v5, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton bottomAnchor](v4->_focusFilterToggleButton, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    -[UIButton centerXAnchor](v4->_focusFilterToggleButton, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    LODWORD(v24) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_focusFilterToggleButton, "setContentCompressionResistancePriority:forAxis:", 0, v24);
    LODWORD(v25) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v4->_focusFilterToggleButton, "setContentHuggingPriority:forAxis:", 0, v25);
    LODWORD(v26) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_focusFilterToggleButton, "setContentCompressionResistancePriority:forAxis:", 1, v26);
    LODWORD(v27) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v4->_focusFilterToggleButton, "setContentHuggingPriority:forAxis:", 1, v27);
    -[CKFocusFilterBannerCollapsedCollectionViewCell _updateFocusFilterToggleButton](v4, "_updateFocusFilterToggleButton");

  }
  return v4;
}

- (void)setIsFocusFilterEnabled:(BOOL)a3
{
  if (self->_isFocusFilterEnabled != a3)
  {
    self->_isFocusFilterEnabled = a3;
    -[CKFocusFilterBannerCollapsedCollectionViewCell _updateFocusFilterToggleButton](self, "_updateFocusFilterToggleButton");
  }
}

- (void)_updateFocusFilterToggleButton
{
  _BOOL4 isFocusFilterEnabled;
  void *v4;
  void *v5;
  id v6;

  isFocusFilterEnabled = self->_isFocusFilterEnabled;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (isFocusFilterEnabled)
    objc_msgSend(v4, "conversationListFocusFilterBannerCollapsedEnabledIcon");
  else
    objc_msgSend(v4, "conversationListFocusFilterBannerCollapsedDisabledIcon");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UIButton setImage:forState:](self->_focusFilterToggleButton, "setImage:forState:", v6, 0);
}

- (void)_focusFilterToggleButtonSelected:(id)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !self->_isFocusFilterEnabled;
  -[CKFocusFilterBannerCollapsedCollectionViewCell focusFilterBannerDelegate](self, "focusFilterBannerDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusFilterBannerEnabledStateDidChange:", v3);

}

- (CKFocusFilterBannerDelegate)focusFilterBannerDelegate
{
  return (CKFocusFilterBannerDelegate *)objc_loadWeakRetained((id *)&self->_focusFilterBannerDelegate);
}

- (void)setFocusFilterBannerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_focusFilterBannerDelegate, a3);
}

- (BOOL)isFocusFilterEnabled
{
  return self->_isFocusFilterEnabled;
}

- (UIButton)focusFilterToggleButton
{
  return self->_focusFilterToggleButton;
}

- (void)setFocusFilterToggleButton:(id)a3
{
  objc_storeStrong((id *)&self->_focusFilterToggleButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusFilterToggleButton, 0);
  objc_destroyWeak((id *)&self->_focusFilterBannerDelegate);
}

@end
