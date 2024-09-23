@implementation CNMeCardSharingAudienceDataSource

- (CNMeCardSharingAudienceDataSource)initWithSelectedSharingAudience:(unint64_t)a3
{
  CNMeCardSharingAudienceDataSource *v4;
  CNMeCardSharingAudienceDataSource *v5;
  CNMeCardSharingAudienceDataSource *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNMeCardSharingAudienceDataSource;
  v4 = -[CNMeCardSharingAudienceDataSource init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_selectedSharingAudience = a3;
    -[CNMeCardSharingAudienceDataSource reloadItems](v4, "reloadItems");
    v6 = v5;
  }

  return v5;
}

- (void)setSelectedSharingAudience:(unint64_t)a3
{
  if (self->_selectedSharingAudience != a3)
  {
    self->_selectedSharingAudience = a3;
    -[CNMeCardSharingAudienceDataSource didSelectItemAtIndex:](self, "didSelectItemAtIndex:", -[CNMeCardSharingAudienceDataSource indexForSharingAudience:](self, "indexForSharingAudience:"));
  }
}

- (BOOL)supportsSelection
{
  return 1;
}

- (unint64_t)selectedIndex
{
  return -[CNMeCardSharingAudienceDataSource indexForSharingAudience:](self, "indexForSharingAudience:", self->_selectedSharingAudience);
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
  CNMeCardSharingRowItem *v4;
  void *v5;
  void *v6;
  CNMeCardSharingRowItem *v7;
  CNMeCardSharingRowItem *v8;
  void *v9;
  void *v10;
  CNMeCardSharingRowItem *v11;
  NSArray *v12;
  NSArray *items;
  NSArray *v14;
  NSArray *valuesArray;
  unint64_t v16;
  CNMeCardSharingRowItem *v17;
  CNMeCardSharingRowItem *selectedItem;
  id v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [CNMeCardSharingRowItem alloc];
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARING_AUDIENCE_CONTACTS_ONLY"), &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNMeCardSharingRowItem initWithLabel:accessoryView:](v4, "initWithLabel:accessoryView:", v6, 0);

  objc_msgSend(v19, "addObject:", v7);
  objc_msgSend(v3, "addObject:", &unk_1E20D3120);
  v8 = [CNMeCardSharingRowItem alloc];
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_AUDIENCE_ALWAYS_ASK"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNMeCardSharingRowItem initWithLabel:accessoryView:](v8, "initWithLabel:accessoryView:", v10, 0);

  objc_msgSend(v19, "addObject:", v11);
  objc_msgSend(v3, "addObject:", &unk_1E20D3138);
  v12 = (NSArray *)objc_msgSend(v19, "copy");
  items = self->_items;
  self->_items = v12;

  v14 = (NSArray *)objc_msgSend(v3, "copy");
  valuesArray = self->_valuesArray;
  self->_valuesArray = v14;

  v16 = -[CNMeCardSharingAudienceDataSource indexForSharingAudience:](self, "indexForSharingAudience:", self->_selectedSharingAudience);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v16);
    v17 = (CNMeCardSharingRowItem *)objc_claimAutoreleasedReturnValue();
    selectedItem = self->_selectedItem;
    self->_selectedItem = v17;

    -[CNMeCardSharingRowItem setIsSelected:](self->_selectedItem, "setIsSelected:", 1);
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
  CNMeCardSharingRowItem *v6;
  CNMeCardSharingRowItem *selectedItem;
  CNMeCardSharingRowItem *v8;

  if (-[NSArray count](self->_items, "count") > a3)
  {
    items = self->_items;
    v8 = self->_selectedItem;
    -[NSArray objectAtIndexedSubscript:](items, "objectAtIndexedSubscript:", a3);
    v6 = (CNMeCardSharingRowItem *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingRowItem setIsSelected:](v8, "setIsSelected:", 0);
    -[CNMeCardSharingRowItem setIsSelected:](v6, "setIsSelected:", 1);
    selectedItem = self->_selectedItem;
    self->_selectedItem = v6;

    self->_selectedSharingAudience = -[CNMeCardSharingAudienceDataSource sharingAudienceForIndex:](self, "sharingAudienceForIndex:", a3);
  }
}

- (unint64_t)selectedSharingAudience
{
  return self->_selectedSharingAudience;
}

- (CNMeCardSharingRowItem)selectedItem
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
