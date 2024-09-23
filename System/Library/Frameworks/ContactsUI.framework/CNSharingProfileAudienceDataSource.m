@implementation CNSharingProfileAudienceDataSource

- (CNSharingProfileAudienceDataSource)initWithSelectedSharingAudience:(unint64_t)a3
{
  CNSharingProfileAudienceDataSource *v4;
  CNSharingProfileAudienceDataSource *v5;
  CNSharingProfileAudienceDataSource *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNSharingProfileAudienceDataSource;
  v4 = -[CNSharingProfileAudienceDataSource init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_selectedSharingAudience = a3;
    -[CNSharingProfileAudienceDataSource reloadItems](v4, "reloadItems");
    v6 = v5;
  }

  return v5;
}

- (void)setSelectedSharingAudience:(unint64_t)a3
{
  if (self->_selectedSharingAudience != a3)
  {
    self->_selectedSharingAudience = a3;
    -[CNSharingProfileAudienceDataSource didSelectItemAtIndex:](self, "didSelectItemAtIndex:", -[CNSharingProfileAudienceDataSource indexForSharingAudience:](self, "indexForSharingAudience:"));
  }
}

- (unint64_t)sharingAudienceForItem:(id)a3
{
  return -[CNSharingProfileAudienceDataSource sharingAudienceForIndex:](self, "sharingAudienceForIndex:", -[NSArray indexOfObject:](self->_items, "indexOfObject:", a3));
}

- (BOOL)supportsSelection
{
  return 1;
}

- (unint64_t)selectedIndex
{
  return -[CNSharingProfileAudienceDataSource indexForSharingAudience:](self, "indexForSharingAudience:", self->_selectedSharingAudience);
}

- (unint64_t)indexForSharingAudience:(unint64_t)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray indexOfObject:](self->_valuesArray, "indexOfObject:", v4);

  return v5;
}

- (unint64_t)sharingAudienceForIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_valuesArray, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)reloadItems
{
  void *v3;
  CNSharingProfileRowItem *v4;
  void *v5;
  void *v6;
  CNSharingProfileRowItem *v7;
  CNSharingProfileRowItem *v8;
  void *v9;
  void *v10;
  CNSharingProfileRowItem *v11;
  NSArray *v12;
  NSArray *items;
  NSArray *v14;
  NSArray *valuesArray;
  unint64_t v16;
  CNSharingProfileRowItem *v17;
  CNSharingProfileRowItem *selectedItem;
  id v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [CNSharingProfileRowItem alloc];
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARING_AUDIENCE_CONTACTS_ONLY"), &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNSharingProfileRowItem initWithLabel:accessoryView:](v4, "initWithLabel:accessoryView:", v6, 0);

  objc_msgSend(v19, "addObject:", v7);
  objc_msgSend(v3, "addObject:", &unk_1E20D2DA8);
  v8 = [CNSharingProfileRowItem alloc];
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_AUDIENCE_ALWAYS_ASK"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNSharingProfileRowItem initWithLabel:accessoryView:](v8, "initWithLabel:accessoryView:", v10, 0);

  objc_msgSend(v19, "addObject:", v11);
  objc_msgSend(v3, "addObject:", &unk_1E20D2DC0);
  v12 = (NSArray *)objc_msgSend(v19, "copy");
  items = self->_items;
  self->_items = v12;

  v14 = (NSArray *)objc_msgSend(v3, "copy");
  valuesArray = self->_valuesArray;
  self->_valuesArray = v14;

  v16 = -[CNSharingProfileAudienceDataSource indexForSharingAudience:](self, "indexForSharingAudience:", self->_selectedSharingAudience);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v16);
    v17 = (CNSharingProfileRowItem *)objc_claimAutoreleasedReturnValue();
    selectedItem = self->_selectedItem;
    self->_selectedItem = v17;

    -[CNSharingProfileRowItem setIsSelected:](self->_selectedItem, "setIsSelected:", 1);
  }

}

- (id)sectionHeaderLabel
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARING_AUDIENCE_SECTION_HEADER"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sectionFooterLabel
{
  unint64_t selectedSharingAudience;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  selectedSharingAudience = self->_selectedSharingAudience;
  if (selectedSharingAudience == 2)
  {
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SHARING_AUDIENCE_ALWAYS_ASK_FOOTER");
  }
  else
  {
    if (selectedSharingAudience != 1)
    {
      v6 = 0;
      return v6;
    }
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SHARING_AUDIENCE_CONTACTS_ONLY_FOOTER");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)numberOfItems
{
  return -[NSArray count](self->_items, "count");
}

- (id)itemForIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_items, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)didSelectItemAtIndex:(unint64_t)a3
{
  NSArray *items;
  CNSharingProfileRowItem *v6;
  CNSharingProfileRowItem *selectedItem;
  CNSharingProfileRowItem *v8;

  if (-[NSArray count](self->_items, "count") > a3)
  {
    items = self->_items;
    v8 = self->_selectedItem;
    -[NSArray objectAtIndexedSubscript:](items, "objectAtIndexedSubscript:", a3);
    v6 = (CNSharingProfileRowItem *)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileRowItem setIsSelected:](v8, "setIsSelected:", 0);
    -[CNSharingProfileRowItem setIsSelected:](v6, "setIsSelected:", 1);
    selectedItem = self->_selectedItem;
    self->_selectedItem = v6;

    self->_selectedSharingAudience = -[CNSharingProfileAudienceDataSource sharingAudienceForIndex:](self, "sharingAudienceForIndex:", a3);
  }
}

- (unint64_t)selectedSharingAudience
{
  return self->_selectedSharingAudience;
}

- (CNSharingProfileRowItem)selectedItem
{
  return self->_selectedItem;
}

- (void)setSelectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectedItem, a3);
}

- (BOOL)shouldShowEveryone
{
  return self->_shouldShowEveryone;
}

- (void)setShouldShowEveryone:(BOOL)a3
{
  self->_shouldShowEveryone = a3;
}

- (NSArray)valuesArray
{
  return self->_valuesArray;
}

- (void)setValuesArray:(id)a3
{
  objc_storeStrong((id *)&self->_valuesArray, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_valuesArray, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
}

@end
