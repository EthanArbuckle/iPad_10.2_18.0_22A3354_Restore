@implementation CNLinkedCardsCell

- (id)labelView
{
  UILabel *sourceLabel;
  UILabel *v4;
  UILabel *v5;

  sourceLabel = self->_sourceLabel;
  if (!sourceLabel)
  {
    -[CNLabeledCell standardLabelView](self, "standardLabelView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sourceLabel;
    self->_sourceLabel = v4;

    sourceLabel = self->_sourceLabel;
  }
  return sourceLabel;
}

- (id)valueView
{
  UILabel *nameLabel;
  UILabel *v4;
  UILabel *v5;

  nameLabel = self->_nameLabel;
  if (!nameLabel)
  {
    -[CNLabeledCell standardValueView](self, "standardValueView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_nameLabel;
    self->_nameLabel = v4;

    nameLabel = self->_nameLabel;
  }
  return nameLabel;
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (void)performDefaultAction
{
  void *v3;
  id v4;

  -[CNLinkedCardsCell delegate](self, "delegate");
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
  id v9;
  void *v10;
  void *v11;
  objc_super v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNLinkedCardsCell;
  -[CNContactCell cardGroupItem](&v13, sel_cardGroupItem);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)CNLinkedCardsCell;
    -[CNContactCell setCardGroupItem:](&v12, sel_setCardGroupItem_, v4);
    objc_msgSend(v4, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[CNLinkedCardsCell titleForContact:](self, "titleForContact:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLinkedCardsCell sourceLabel](self, "sourceLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v7);

      v9 = objc_alloc_init(MEMORY[0x1E0C97218]);
      objc_msgSend(v9, "setStyle:", 0);
      objc_msgSend(v9, "setFallbackStyle:", -1);
      objc_msgSend(v9, "stringFromContact:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNLinkedCardsCell nameLabel](self, "nameLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v10);

    }
  }

}

- (id)titleForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CNLinkedCardsCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactViewCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "containerForContact:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "type") == 1003)
  {
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "accountForContact:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C971B0], "_cnui_displayNameForACAccount:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNLinkedCardsCell;
  -[CNContactCell updateConstraints](&v3, sel_updateConstraints);
  -[UILabel setNumberOfLines:](self->_sourceLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
  -[UILabel setNumberOfLines:](self->_nameLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
}

- (CNPropertyCellDelegate)delegate
{
  return (CNPropertyCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)sourceLabel
{
  return self->_sourceLabel;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_sourceLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (BOOL)wantsChevron
{
  return 1;
}

@end
