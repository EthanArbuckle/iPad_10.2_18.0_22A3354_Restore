@implementation CNFRegAccountsButtonCell

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNFRegAccountsButtonCell;
  -[PSTableCell layoutSubviews](&v7, sel_layoutSubviews);
  -[PSTableCell valueLabel](self, "valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_appearsToBePhoneNumber");

  if (v5)
    v6 = 3;
  else
    v6 = 4;
  objc_msgSend(v3, "setLineBreakMode:", v6);
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v3, "setMinimumScaleFactor:", 0.75);

}

@end
