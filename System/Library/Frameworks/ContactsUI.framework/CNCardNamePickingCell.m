@implementation CNCardNamePickingCell

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
  v12.super_class = (Class)CNCardNamePickingCell;
  -[CNContactCell cardGroupItem](&v12, sel_cardGroupItem);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)CNCardNamePickingCell;
    -[CNContactCell setCardGroupItem:](&v11, sel_setCardGroupItem_, v4);
    CNContactsUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NAME_LABEL"), CFSTR("Name"), CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardNamePickingCell sourceLabel](self, "sourceLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    objc_msgSend(v4, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardNamePickingCell nameLabel](self, "nameLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

  }
}

- (BOOL)isSuggested
{
  return 0;
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
}

@end
