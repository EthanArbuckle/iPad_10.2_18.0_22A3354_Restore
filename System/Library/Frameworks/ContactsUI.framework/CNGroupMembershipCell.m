@implementation CNGroupMembershipCell

- (BOOL)allowsCellSelection
{
  return 0;
}

- (id)labelView
{
  UILabel *parentGroupNameLabel;
  UILabel *v4;
  UILabel *v5;

  parentGroupNameLabel = self->_parentGroupNameLabel;
  if (!parentGroupNameLabel)
  {
    -[CNLabeledCell standardLabelView](self, "standardLabelView");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_parentGroupNameLabel;
    self->_parentGroupNameLabel = v4;

    parentGroupNameLabel = self->_parentGroupNameLabel;
  }
  return parentGroupNameLabel;
}

- (void)setCardGroupItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNGroupMembershipCell;
  -[CNContactCell cardGroupItem](&v11, sel_cardGroupItem);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)CNGroupMembershipCell;
    -[CNContactCell setCardGroupItem:](&v10, sel_setCardGroupItem_, v4);
    objc_msgSend(v4, "group");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNGroupMembershipCell parentGroupNameLabel](self, "parentGroupNameLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v8);

    }
  }

}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNGroupMembershipCell;
  -[CNContactCell updateConstraints](&v3, sel_updateConstraints);
  -[UILabel setNumberOfLines:](self->_parentGroupNameLabel, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
}

- (CNPropertyCellDelegate)delegate
{
  return (CNPropertyCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)parentGroupNameLabel
{
  return self->_parentGroupNameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentGroupNameLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (BOOL)wantsHorizontalLayout
{
  return 1;
}

@end
