@implementation WDProfileEditableTableViewCell

+ (double)notEditingTrailingEdgeMargin
{
  double v2;

  +[WDProfileTableViewCell notEditingTrailingEdgeMargin](WDProfileTableViewCell, "notEditingTrailingEdgeMargin");
  return v2 + 12.0;
}

- (WDProfileEditableTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDProfileEditableTableViewCell *v4;
  WDProfileEditableTableViewCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WDProfileEditableTableViewCell;
  v4 = -[WDProfileTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WDProfileTableViewCell displayValueTextField](v4, "displayValueTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v5, sel__textFieldDidChange_, 0x20000);

  }
  return v5;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;

  -[WDProfileTableViewCell displayValueTextField](self, "displayValueTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  -[WDProfileTableViewCell displayValueTextField](self, "displayValueTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "becomeFirstResponder");

  return (char)v3;
}

- (void)_textFieldDidChange:(id)a3
{
  void *v4;
  id v5;

  -[WDProfileTableViewCell displayValueTextField](self, "displayValueTextField", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setDisplayValue:](self, "setDisplayValue:", v4);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v3;

  -[WDProfileTableViewCell displayValueTextField](self, "displayValueTextField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

}

@end
