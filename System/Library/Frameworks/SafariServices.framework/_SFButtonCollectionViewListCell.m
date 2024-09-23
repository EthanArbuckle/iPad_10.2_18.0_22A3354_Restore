@implementation _SFButtonCollectionViewListCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("translationIssueReportButtonCell");
}

- (_SFButtonCollectionViewListCell)initWithFrame:(CGRect)a3
{
  _SFButtonCollectionViewListCell *v3;
  void *v4;
  double v5;
  uint64_t v6;
  UIButton *button;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *v12;
  void *v13;
  void *v14;
  _SFButtonCollectionViewListCell *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_SFButtonCollectionViewListCell;
  v3 = -[_SFButtonCollectionViewListCell initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentInsets");
    objc_msgSend(v4, "setContentInsets:", v5 + 8.0);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v4, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v6;

    -[UIButton setEnabled:](v3->_button, "setEnabled:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setAccessibilityIdentifier:](v3->_button, "setAccessibilityIdentifier:", CFSTR("ReportTranslationIssueButton"));
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v3->_button, "setBackgroundColor:", v9);

    -[UIButton addTarget:action:forControlEvents:](v3->_button, "addTarget:action:forControlEvents:", v3, sel__reportTranslationIssue_, 64);
    -[_SFButtonCollectionViewListCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v3->_button);

    v11 = (void *)MEMORY[0x1E0CB3718];
    v12 = v3->_button;
    -[_SFButtonCollectionViewListCell contentView](v3, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_constraintsMatchingFrameOfView:withFrameOfView:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:", v14);

    v15 = v3;
  }

  return v3;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  void *v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

  -[UIButton configuration](self->_button, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  v8 = self->_title;
  v13[0] = *MEMORY[0x1E0DC32A0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "_sf_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v13[1] = *MEMORY[0x1E0DC32A8];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v11);
  objc_msgSend(v6, "setAttributedTitle:", v12);

  -[UIButton setConfiguration:](self->_button, "setConfiguration:", v6);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  UIButton **p_button;
  void *v7;

  v3 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    p_button = &self->_button;
    -[UIButton setBackgroundColor:](*p_button, "setBackgroundColor:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    p_button = &self->_button;
    -[UIButton setBackgroundColor:](*p_button, "setBackgroundColor:", v7);

  }
  -[UIButton setEnabled:](*p_button, "setEnabled:", v3);
}

- (BOOL)isEnabled
{
  return -[UIButton isEnabled](self->_button, "isEnabled");
}

- (void)_reportTranslationIssue:(id)a3
{
  id v4;

  -[_SFButtonCollectionViewListCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewListCellButtonPressed:", self);

}

- (NSString)title
{
  return self->_title;
}

- (_SFButtonCollectionViewListCellDelegate)delegate
{
  return (_SFButtonCollectionViewListCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
