@implementation CNContactContainerCell

- (id)labelView
{
  UILabel *accountLabel;
  UILabel *v4;
  UILabel *v5;

  accountLabel = self->_accountLabel;
  if (!accountLabel)
  {
    -[CNLabeledCell standardLabelView](self, "standardLabelView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accountLabel;
    self->_accountLabel = v4;

    accountLabel = self->_accountLabel;
  }
  return accountLabel;
}

- (id)valueView
{
  UILabel *accountNameLabel;
  UILabel *v4;
  UILabel *v5;

  accountNameLabel = self->_accountNameLabel;
  if (!accountNameLabel)
  {
    -[CNLabeledCell standardValueView](self, "standardValueView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accountNameLabel;
    self->_accountNameLabel = v4;

    accountNameLabel = self->_accountNameLabel;
  }
  return accountNameLabel;
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (void)performDefaultAction
{
  void *v3;
  id v4;

  -[CNContactContainerCell delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactCell cardGroupItem](self, "cardGroupItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyCell:performActionForItem:withTransportType:", self, v3, 0);

}

- (void)setCardGroupItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
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
  objc_super v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNContactContainerCell;
  -[CNContactCell cardGroupItem](&v22, sel_cardGroupItem);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)CNContactContainerCell;
    -[CNContactCell setCardGroupItem:](&v21, sel_setCardGroupItem_, v4);
    if (v4)
    {
      objc_msgSend(v4, "containers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7 < 2)
      {
        objc_msgSend(v4, "containers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNContactContainerCell delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "contactViewCache");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "accountForContainer:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C971B0], "_cnui_displayNameForACAccount:", v11);
      }
      else
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        CNContactsUIBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("N_ACCOUNTS"), &stru_1E20507A8, CFSTR("Localized"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "containers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringWithFormat:", v10, objc_msgSend(v11, "count"));
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      CNContactsUIBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_CARD_ITEM_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContainerCell accountLabel](self, "accountLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setText:", v17);

      v19 = v13;
      if (!v13)
      {
        CNContactsUIBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_SOURCE_STRING"), &stru_1E20507A8, CFSTR("Localized"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[CNContactContainerCell accountNameLabel](self, "accountNameLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v19);

      if (!v13)
      {

      }
    }
    else
    {
      -[CNContactContainerCell accountLabel](self, "accountLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", 0);

      -[CNContactContainerCell accountNameLabel](self, "accountNameLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", 0);
    }

  }
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactContainerCell;
  -[CNContactCell updateConstraints](&v3, sel_updateConstraints);
  -[UILabel setNumberOfLines:](self->_accountLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
  -[UILabel setNumberOfLines:](self->_accountNameLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
}

- (CNPropertyCellDelegate)delegate
{
  return (CNPropertyCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)accountLabel
{
  return self->_accountLabel;
}

- (UILabel)accountNameLabel
{
  return self->_accountNameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountNameLabel, 0);
  objc_storeStrong((id *)&self->_accountLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (BOOL)wantsChevron
{
  return 1;
}

@end
