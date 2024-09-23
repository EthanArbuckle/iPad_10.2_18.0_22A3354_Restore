@implementation NTKPeopleDetailComplicationPickerDataSource

+ (CNContactFormatter)sharedFormatter
{
  if (sharedFormatter_onceToken != -1)
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_107);
  return (CNContactFormatter *)(id)sharedFormatter_formatter;
}

uint64_t __62__NTKPeopleDetailComplicationPickerDataSource_sharedFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedFormatter_formatter;
  sharedFormatter_formatter = v0;

  objc_msgSend((id)sharedFormatter_formatter, "setStyle:", 0);
  objc_msgSend((id)sharedFormatter_formatter, "setEmphasizesPrimaryNameComponent:", 1);
  return objc_msgSend((id)sharedFormatter_formatter, "setFallbackStyle:", -1);
}

- (NTKPeopleDetailComplicationPickerDataSource)initWithTableView:(id)a3 detailConfiguration:(id)a4
{
  id v7;
  id v8;
  NTKPeopleDetailComplicationPickerDataSource *v9;
  NTKPeopleDetailComplicationPickerDataSource *v10;
  uint64_t v11;
  CNContactStoreDataSource *allContactsDataSource;
  uint64_t v13;
  NSArray *allFavoriteContacts;
  uint64_t v15;
  CNContact *myCard;
  void *v17;
  NTKCFaceDetailComplicationCellProvider *v18;
  NTKCFaceDetailComplicationCellProvider *pickerCellProvider;
  void *v20;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NTKPeopleDetailComplicationPickerDataSource;
  v9 = -[NTKPeopleDetailComplicationPickerDataSource init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tableView, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    v11 = objc_msgSend((id)objc_opt_class(), "_newDataSourceWithName:", CFSTR("NTKPeopleComplicationPickerViewController:allContacts"));
    allContactsDataSource = v10->_allContactsDataSource;
    v10->_allContactsDataSource = (CNContactStoreDataSource *)v11;

    -[NTKPeopleDetailComplicationPickerDataSource _allFavoriteContactsSorted](v10, "_allFavoriteContactsSorted");
    v13 = objc_claimAutoreleasedReturnValue();
    allFavoriteContacts = v10->_allFavoriteContacts;
    v10->_allFavoriteContacts = (NSArray *)v13;

    -[NTKPeopleDetailComplicationPickerDataSource _myCard](v10, "_myCard");
    v15 = objc_claimAutoreleasedReturnValue();
    myCard = v10->_myCard;
    v10->_myCard = (CNContact *)v15;

    objc_msgSend(v8, "listProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NTKCFaceDetailComplicationCellProvider initWithTableView:listProvider:]([NTKCFaceDetailComplicationCellProvider alloc], "initWithTableView:listProvider:", v7, v17);
    pickerCellProvider = v10->_pickerCellProvider;
    v10->_pickerCellProvider = v18;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v10, sel__contactStoreChanged_, *MEMORY[0x1E0C96870], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v10, sel__favoritesChanged_, *MEMORY[0x1E0C968E0], 0);

  }
  return v10;
}

- (NSIndexPath)selectedIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  uint64_t v18;

  -[NTKPeopleDetailComplicationPickerDataSource configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickerSelectedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ntk_contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[NTKPeopleComplicationContactsCache sharedCache](NTKPeopleComplicationContactsCache, "sharedCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactForId:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_myCard
      && (v9 = -[NTKPeopleDetailComplicationPickerDataSource _myCardSectionIndex](self, "_myCardSectionIndex"),
          v9 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v16 = v9;
      v17 = (void *)MEMORY[0x1E0CB36B0];
      v18 = 0;
    }
    else
    {
      -[NTKPeopleDetailComplicationPickerDataSource allFavoriteContacts](self, "allFavoriteContacts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "indexOfObject:", v8);

      if (v11 == 0x7FFFFFFFFFFFFFFFLL
        || (v12 = -[NTKPeopleDetailComplicationPickerDataSource _favoritesSectionIndex](self, "_favoritesSectionIndex"),
            v12 == 0x7FFFFFFFFFFFFFFFLL))
      {
        -[NTKPeopleDetailComplicationPickerDataSource allContactsDataSource](self, "allContactsDataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "indexPathForContact:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v14, "item"), objc_msgSend(v14, "section") + 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        goto LABEL_12;
      }
      v16 = v12;
      v17 = (void *)MEMORY[0x1E0CB36B0];
      v18 = v11;
    }
    objc_msgSend(v17, "indexPathForItem:inSection:", v18, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v15 = 0;
LABEL_12:

  return (NSIndexPath *)v15;
}

- (id)complicationItemForIndexPath:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v4 = a3;
  -[NTKPeopleDetailComplicationPickerDataSource _contactAtIndexPath:](self, "_contactAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NTKPeopleDetailComplicationPickerDataSource _isMyCardAtIndexPath:](self, "_isMyCardAtIndexPath:", v4)
    || -[NTKPeopleDetailComplicationPickerDataSource _isFavoriteAtIndexPath:](self, "_isFavoriteAtIndexPath:", v4);
  +[NTKPeopleComplication complicationForContact:forPromotedSection:](NTKPeopleComplication, "complicationForContact:forPromotedSection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)_numberOfItemsInSection:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  int64_t v10;

  v5 = -[NTKPeopleDetailComplicationPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:");
  if (v5 == 2)
  {
    -[NTKPeopleDetailComplicationPickerDataSource _allContactsSections](self, "_allContactsSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = a3
         - -[NTKPeopleDetailComplicationPickerDataSource _firstAllContactsSectionIndex](self, "_firstAllContactsSectionIndex");
      if (v8 >= objc_msgSend(v7, "count"))
      {

        return 0;
      }
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "range");
      v6 = v10;
    }
    else
    {
      -[CNContactStoreDataSource contacts](self->_allContactsDataSource, "contacts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "count");
    }

    return v6;
  }
  if (v5 == 1)
    return -[NSArray count](self->_allFavoriteContacts, "count");
  if (v5)
    return 0;
  return self->_myCard != 0;
}

- (int64_t)_totalSectionCount
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[NTKPeopleDetailComplicationPickerDataSource _allContactsSections](self, "_allContactsSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  v6 = v5 + -[NTKPeopleDetailComplicationPickerDataSource _myCardSectionNeeded](self, "_myCardSectionNeeded");
  return v6 + -[NTKPeopleDetailComplicationPickerDataSource _favoritesSectionNeeded](self, "_favoritesSectionNeeded");
}

- (BOOL)_itemIsSelectedAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[NTKPeopleDetailComplicationPickerDataSource _contactAtIndexPath:](self, "_contactAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPeopleDetailComplicationPickerDataSource configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "listProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pickerSelectedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "ntk_contactIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKPeopleDetailComplicationPickerDataSource _isMyCardAtIndexPath:](self, "_isMyCardAtIndexPath:", v4)
    || -[NTKPeopleDetailComplicationPickerDataSource _isFavoriteAtIndexPath:](self, "_isFavoriteAtIndexPath:", v4)
    || objc_msgSend(v9, "ntk_itemType") == 4)
  {
    v11 = objc_msgSend(v6, "isEqual:", v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_sectionIndexTitles
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NTKPeopleDetailComplicationPickerDataSource _allContactsSections](self, "_allContactsSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v2, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "title", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  v10 = (void *)objc_msgSend(v3, "copy", (_QWORD)v12);

  return v10;
}

- (int64_t)_sectionForTitleIndex:(int64_t)a3
{
  return -[NTKPeopleDetailComplicationPickerDataSource _firstAllContactsSectionIndex](self, "_firstAllContactsSectionIndex")+ a3;
}

- (void)_reloadData
{
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (int64_t)collectionView:(id)a3 sectionForSectionTitleIndex:(int64_t)a4
{
  return -[NTKPeopleDetailComplicationPickerDataSource _sectionForTitleIndex:](self, "_sectionForTitleIndex:", a4);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NTKPeopleDetailComplicationPickerDataSource _numberOfItemsInSection:](self, "_numberOfItemsInSection:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v5 = a4;
  -[NTKPeopleDetailComplicationPickerDataSource complicationItemForIndexPath:](self, "complicationItemForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPeopleDetailComplicationPickerDataSource pickerCellProvider](self, "pickerCellProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItem:atIndexPath:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[NTKPeopleDetailComplicationPickerDataSource _itemIsSelectedAtIndexPath:](self, "_itemIsSelectedAtIndexPath:", v5);
  objc_msgSend(v8, "ntk_setPickerSelected:", v9);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;

  v6 = -[NTKPeopleDetailComplicationPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", a4);
  if (v6 != 2)
  {
    if (v6 == 1)
    {
      v7 = CFSTR("COMPLICATION_PICKER_PEOPLE_FAVORITES_SECTION_NAME");
      v8 = CFSTR("FAVORITES");
      goto LABEL_9;
    }
    if (!v6)
    {
      v7 = CFSTR("COMPLICATION_PICKER_PEOPLE_MY_CARD_SECTION_NAME");
      v8 = CFSTR("MY CARD");
LABEL_9:
      NTKClockFaceLocalizedString(v7, v8);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v13;
    }
LABEL_11:
    v13 = &stru_1E6BDC918;
    return v13;
  }
  -[NTKPeopleDetailComplicationPickerDataSource _allContactsSections](self, "_allContactsSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = a4
            - -[NTKPeopleDetailComplicationPickerDataSource _firstAllContactsSectionIndex](self, "_firstAllContactsSectionIndex"), v10 >= objc_msgSend(v9, "count")))
  {

    goto LABEL_11;
  }
  -[NTKPeopleDetailComplicationPickerDataSource _allContactsSections](self, "_allContactsSections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_contactAtIndexPath:(id)a3
{
  void *v3;
  id v5;
  int64_t v6;
  CNContact *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  v5 = a3;
  v6 = -[NTKPeopleDetailComplicationPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(v5, "section"));
  switch(v6)
  {
    case 2:
      v8 = objc_msgSend(v5, "section");
      v9 = objc_msgSend(v5, "row");
      -[NTKPeopleDetailComplicationPickerDataSource _allContactsSections](self, "_allContactsSections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = v8
            - -[NTKPeopleDetailComplicationPickerDataSource _firstAllContactsSectionIndex](self, "_firstAllContactsSectionIndex");
        if (v11 < objc_msgSend(v10, "count"))
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "range");
          v9 = v13 + objc_msgSend(v5, "row");

        }
      }
      -[CNContactStoreDataSource contacts](self->_allContactsDataSource, "contacts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 >= objc_msgSend(v14, "count"))
      {
        v3 = 0;
      }
      else
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }

      break;
    case 1:
      v15 = objc_msgSend(v5, "row");
      if (v15 >= -[NSArray count](self->_allFavoriteContacts, "count"))
      {
        v3 = 0;
        break;
      }
      -[NSArray objectAtIndexedSubscript:](self->_allFavoriteContacts, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
      v7 = (CNContact *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 0:
      v7 = self->_myCard;
LABEL_12:
      v3 = v7;
      break;
  }

  return v3;
}

- (int64_t)_contactIndexForIdentifier:(id)a3 inContactList:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  int64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      v11 = 0;
      v12 = v9 + v8;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "identifier", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v5);

        if ((v14 & 1) != 0)
        {
          v15 = v9 + v11;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }
  v15 = -1;
LABEL_11:

  return v15;
}

- (int64_t)_myCardSectionIndex
{
  if (-[NTKPeopleDetailComplicationPickerDataSource _myCardSectionNeeded](self, "_myCardSectionNeeded"))
    return 0;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_favoritesSectionIndex
{
  int64_t v3;
  int64_t v4;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NTKPeopleDetailComplicationPickerDataSource _favoritesSectionNeeded](self, "_favoritesSectionNeeded"))
  {
    v4 = -[NTKPeopleDetailComplicationPickerDataSource _myCardSectionIndex](self, "_myCardSectionIndex");
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return v4 + 1;
  }
  return v3;
}

- (int64_t)_firstAllContactsSectionIndex
{
  int64_t v3;
  int64_t v4;

  v3 = -[NTKPeopleDetailComplicationPickerDataSource _favoritesSectionIndex](self, "_favoritesSectionIndex");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    return v3 + 1;
  v4 = -[NTKPeopleDetailComplicationPickerDataSource _myCardSectionIndex](self, "_myCardSectionIndex");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return v4 + 1;
}

- (int64_t)_sectionTypeForSectionIndex:(int64_t)a3
{
  if (-[NTKPeopleDetailComplicationPickerDataSource _myCardSectionIndex](self, "_myCardSectionIndex") == a3)
    return 0;
  if (-[NTKPeopleDetailComplicationPickerDataSource _favoritesSectionIndex](self, "_favoritesSectionIndex") == a3)
    return 1;
  return 2;
}

- (id)_myCard
{
  return +[NTKPeopleComplication myCard](NTKPeopleComplication, "myCard");
}

- (id)_allFavoriteContactsSorted
{
  return +[NTKPeopleComplication allValidFavoriteContacts](NTKPeopleComplication, "allValidFavoriteContacts");
}

- (BOOL)_myCardSectionNeeded
{
  return self->_myCard != 0;
}

- (BOOL)_favoritesSectionNeeded
{
  return -[NSArray count](self->_allFavoriteContacts, "count") != 0;
}

- (id)_allContactsSections
{
  return (id)-[CNContactStoreDataSource sections](self->_allContactsDataSource, "sections");
}

- (BOOL)_isMyCardAtIndexPath:(id)a3
{
  return -[NTKPeopleDetailComplicationPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(a3, "section")) == 0;
}

- (BOOL)_isFavoriteAtIndexPath:(id)a3
{
  return -[NTKPeopleDetailComplicationPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(a3, "section")) == 1;
}

+ (id)_newDataSourceWithName:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C972A0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)tcc_identity_create();
  objc_msgSend(v6, "setAssumedIdentity:", v7);

  v8 = objc_alloc(MEMORY[0x1E0C974C8]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v6);
  v10 = (void *)objc_msgSend(v8, "initWithStore:", v9);

  objc_msgSend(a1, "_descriptorForRequiredKeysWithDescription:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKeysToFetch:", v12);

  objc_msgSend(v10, "setFetchUnified:", 1);
  return v10;
}

+ (id)_descriptorForRequiredKeysWithDescription:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__NTKPeopleDetailComplicationPickerDataSource__descriptorForRequiredKeysWithDescription___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  v9 = v3;
  v4 = _descriptorForRequiredKeysWithDescription__cn_once_token_0;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&_descriptorForRequiredKeysWithDescription__cn_once_token_0, block);
  v6 = (id)_descriptorForRequiredKeysWithDescription__cn_once_object_0;

  return v6;
}

void __89__NTKPeopleDetailComplicationPickerDataSource__descriptorForRequiredKeysWithDescription___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1002, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1000);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v6, *(_QWORD *)(a1 + 32));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_descriptorForRequiredKeysWithDescription__cn_once_object_0;
  _descriptorForRequiredKeysWithDescription__cn_once_object_0 = v7;

}

- (UITableView)tableView
{
  return self->_tableView;
}

- (NTKComplicationPickerDetailViewConfiguration)configuration
{
  return self->_configuration;
}

- (CNContact)myCard
{
  return self->_myCard;
}

- (NSArray)allFavoriteContacts
{
  return self->_allFavoriteContacts;
}

- (CNContactStoreDataSource)allContactsDataSource
{
  return self->_allContactsDataSource;
}

- (NTKCFaceDetailComplicationCellProvider)pickerCellProvider
{
  return self->_pickerCellProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerCellProvider, 0);
  objc_storeStrong((id *)&self->_allContactsDataSource, 0);
  objc_storeStrong((id *)&self->_allFavoriteContacts, 0);
  objc_storeStrong((id *)&self->_myCard, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
