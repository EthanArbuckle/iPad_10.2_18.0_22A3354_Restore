@implementation CNAutocompleteGroupExpansionTableViewCell

+ (id)identifier
{
  return CFSTR("CNAutocompleteGroupExpansionTableViewCell");
}

- (CNAutocompleteGroupExpansionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNAutocompleteGroupExpansionTableViewCell *v4;
  CNAutocompleteGroupExpansionTableViewCell *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteGroupExpansionTableViewCell;
  v4 = -[CNComposeRecipientTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNComposeTableViewCell titleLabel](v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

    -[CNComposeTableViewCell detailLabel](v5, "detailLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

  }
  return v5;
}

- (BOOL)canCollapseRecipient
{
  return 1;
}

- (BOOL)canExpandRecipient
{
  return 0;
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
    v8.super_class = (Class)CNAutocompleteGroupExpansionTableViewCell;
    objc_msgSend(-[CNAutocompleteGroupExpansionTableViewCell class](&v8, sel_class, 0.0), "additionalSeparatorInset");
    return leading + v7;
  }
  return result;
}

@end
