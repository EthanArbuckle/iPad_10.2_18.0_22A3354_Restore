@implementation CNMeCardSharingSettingsNameDataSource

- (BOOL)supportsSelection
{
  return 0;
}

- (id)sectionHeaderLabel
{
  return 0;
}

- (id)sectionFooterLabel
{
  return 0;
}

- (unint64_t)numberOfItems
{
  return 2;
}

- (id)itemForIndex:(unint64_t)a3
{
  return 0;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSString)formattedName
{
  return self->_formattedName;
}

- (void)setFormattedName:(id)a3
{
  objc_storeStrong((id *)&self->_formattedName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedName, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
