@implementation _SFCheckableItemCollectionViewListCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("_SFCheckableItemCollectionViewListCellReuseIdentifier");
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_SFCheckableItemCollectionViewListCell setAutomaticallyUpdatesBackgroundConfiguration:](self, "setAutomaticallyUpdatesBackgroundConfiguration:", 0);
  v7 = (id)objc_msgSend(v4, "copy");

  objc_msgSend(v7, "setHighlighted:", 0);
  objc_msgSend(v7, "setSelected:", 0);
  objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatedConfigurationForState:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFCheckableItemCollectionViewListCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v6);
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  void *v6;
  id v7;
  UICellAccessory *v8;
  UICellAccessory *cellAccessoryCheckmark;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)objc_msgSend(a3, "copy");
  text = self->_text;
  self->_text = v4;

  -[_SFCheckableItemCollectionViewListCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", self->_text);
  -[_SFCheckableItemCollectionViewListCell setContentConfiguration:](self, "setContentConfiguration:", v6);
  v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[_SFCheckableItemCollectionViewListCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v7);

  v8 = (UICellAccessory *)objc_alloc_init(MEMORY[0x1E0DC3548]);
  cellAccessoryCheckmark = self->_cellAccessoryCheckmark;
  self->_cellAccessoryCheckmark = v8;

  -[UICellAccessory setDisplayedState:](self->_cellAccessoryCheckmark, "setDisplayedState:", 0);
  -[UICellAccessory setHidden:](self->_cellAccessoryCheckmark, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICellAccessory setTintColor:](self->_cellAccessoryCheckmark, "setTintColor:", v10);

  v12[0] = self->_cellAccessoryCheckmark;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFCheckableItemCollectionViewListCell setAccessories:](self, "setAccessories:", v11);

}

- (BOOL)isChecked
{
  return !-[UICellAccessory isHidden](self->_cellAccessoryCheckmark, "isHidden");
}

- (void)setChecked:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _QWORD v6[2];

  v3 = a3;
  v6[1] = *MEMORY[0x1E0C80C00];
  if (-[UICellAccessory isHidden](self->_cellAccessoryCheckmark, "isHidden") == a3)
  {
    -[UICellAccessory setHidden:](self->_cellAccessoryCheckmark, "setHidden:", !v3);
    v6[0] = self->_cellAccessoryCheckmark;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFCheckableItemCollectionViewListCell setAccessories:](self, "setAccessories:", v5);

  }
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_cellAccessoryCheckmark, 0);
}

@end
