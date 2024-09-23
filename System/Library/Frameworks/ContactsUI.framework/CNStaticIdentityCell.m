@implementation CNStaticIdentityCell

- (id)labelView
{
  UILabel *labelLabel;
  UILabel *v4;
  UILabel *v5;

  labelLabel = self->_labelLabel;
  if (!labelLabel)
  {
    -[CNLabeledCell standardLabelView](self, "standardLabelView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_labelLabel;
    self->_labelLabel = v4;

    labelLabel = self->_labelLabel;
  }
  return labelLabel;
}

- (id)valueView
{
  UILabel *valueLabel;
  UILabel *v4;
  UILabel *v5;

  valueLabel = self->_valueLabel;
  if (!valueLabel)
  {
    -[CNLabeledCell standardValueView](self, "standardValueView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_valueLabel;
    self->_valueLabel = v4;

    -[CNLabeledCell setValueViewNeedsHuggingContent:](self, "setValueViewNeedsHuggingContent:", 0);
    valueLabel = self->_valueLabel;
  }
  return valueLabel;
}

- (void)setValueTextAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v6, "monospacedSystemFontOfSize:weight:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC1138]);

  if (-[CNStaticIdentityCell isValueTextValid](self, "isValueTextValid"))
    +[CNUIColorRepository contactCardStaticIdentityValidTextColor](CNUIColorRepository, "contactCardStaticIdentityValidTextColor");
  else
    +[CNUIColorRepository contactCardStaticIdentityInvalidTextColor](CNUIColorRepository, "contactCardStaticIdentityInvalidTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1140]);

  v9.receiver = self;
  v9.super_class = (Class)CNStaticIdentityCell;
  -[CNLabeledCell setValueTextAttributes:](&v9, sel_setValueTextAttributes_, v4);

}

- (BOOL)isValueTextValid
{
  void *v2;
  void *v3;
  char v4;

  -[CNStaticIdentityCell valueLabel](self, "valueLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(MEMORY[0x1E0D13D68], "isValidStaticKeyString:", v3);

  return v4;
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (void)performDefaultAction
{
  void *v3;
  id v4;

  -[CNStaticIdentityCell delegate](self, "delegate");
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNStaticIdentityCell;
  -[CNContactCell cardGroupItem](&v12, sel_cardGroupItem);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)CNStaticIdentityCell;
    -[CNContactCell setCardGroupItem:](&v11, sel_setCardGroupItem_, v4);
    objc_msgSend(v4, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_SHOW_STATIC_IDENTITY"), &stru_1E20507A8, CFSTR("Localized-NARWHAL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNStaticIdentityCell labelLabel](self, "labelLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v8);

      -[CNStaticIdentityCell valueLabel](self, "valueLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v6);

    }
  }

}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNStaticIdentityCell;
  -[CNContactCell updateConstraints](&v3, sel_updateConstraints);
  -[UILabel setNumberOfLines:](self->_labelLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
  -[UILabel setNumberOfLines:](self->_valueLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
}

- (CNPropertyCellDelegate)delegate
{
  return (CNPropertyCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (BOOL)wantsChevron
{
  return 0;
}

@end
