@implementation CNAutocompleteDisambiguatingTableViewCell

+ (id)identifier
{
  return CFSTR("CNAutocompleteDisambiguatingTableViewCell");
}

+ (id)createCheckmarkView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0CEA658]);
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNComposeTableViewCell axCappedSymbolConfigurationIsBold:](CNComposeTableViewCell, "axCappedSymbolConfigurationIsBold:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithImage:", v5);

  objc_msgSend(v6, "setContentMode:", 4);
  return v6;
}

- (CNAutocompleteDisambiguatingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNAutocompleteDisambiguatingTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNAutocompleteDisambiguatingTableViewCell;
  v4 = -[CNComposeTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "createCheckmarkView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteDisambiguatingTableViewCell setCheckmarkImageView:](v4, "setCheckmarkImageView:", v5);

    v6 = (void *)objc_opt_class();
    -[CNAutocompleteDisambiguatingTableViewCell checkmarkImageView](v4, "checkmarkImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requireIntrinsicSizeForView:", v7);

    -[NUITableViewContainerCell containerView](v4, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteDisambiguatingTableViewCell checkmarkImageView](v4, "checkmarkImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addArrangedSubview:", v9);

    -[CNComposeTableViewCell titleLabel](v4, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 0);

  }
  return v4;
}

- (id)titleTextStyle
{
  return (id)*MEMORY[0x1E0CEB590];
}

- (void)setRecipient:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[CNComposeTableViewCell recipient](self, "recipient");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)CNAutocompleteDisambiguatingTableViewCell;
    -[CNComposeTableViewCell setRecipient:](&v10, sel_setRecipient_, v4);
    objc_msgSend(v4, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeTableViewCell titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    objc_msgSend(v4, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeTableViewCell detailLabel](self, "detailLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

  }
}

- (void)setCheckmarkVisible:(BOOL)a3
{
  double v3;
  id v4;

  self->_checkmarkVisible = a3;
  v3 = (double)a3;
  -[CNAutocompleteDisambiguatingTableViewCell checkmarkImageView](self, "checkmarkImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (BOOL)canCollapseRecipient
{
  return 1;
}

- (double)leadingInsetsFromCurrentMargins:(NSDirectionalEdgeInsets)a3
{
  double leading;
  BOOL v5;
  double result;
  double v7;
  objc_super v8;

  leading = a3.leading;
  v5 = +[CNAutocompleteResultsTableViewController avatarsAreHidden](CNAutocompleteResultsTableViewController, "avatarsAreHidden", a3.top, a3.leading, a3.bottom, a3.trailing);
  result = 0.0;
  if (!v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)CNAutocompleteDisambiguatingTableViewCell;
    objc_msgSend(-[CNAutocompleteDisambiguatingTableViewCell class](&v8, sel_class, 0.0), "additionalSeparatorInset");
    return leading + v7;
  }
  return result;
}

- (BOOL)isCheckmarkVisible
{
  return self->_checkmarkVisible;
}

- (UIImageView)checkmarkImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setCheckmarkImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
}

@end
