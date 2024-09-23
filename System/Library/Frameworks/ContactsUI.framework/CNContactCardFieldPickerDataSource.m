@implementation CNContactCardFieldPickerDataSource

- (CNContactCardFieldPickerDataSource)initWithContact:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CNContactCardFieldPickerDataSource *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNContactCardFieldPickerDataSource initWithContacts:](self, "initWithContacts:", v6, v9, v10);
  return v7;
}

- (CNContactCardFieldPickerDataSource)initWithContacts:(id)a3
{
  return -[CNContactCardFieldPickerDataSource initWithContacts:hiddenProperties:](self, "initWithContacts:hiddenProperties:", a3, 0);
}

- (CNContactCardFieldPickerDataSource)initWithContacts:(id)a3 hiddenProperties:(id)a4
{
  id v7;
  id v8;
  CNContactCardFieldPickerDataSource *v9;
  CNContactCardFieldPickerDataSource *v10;
  uint64_t v11;
  NSArray *sections;
  CNContactCardFieldPickerDataSource *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNContactCardFieldPickerDataSource;
  v9 = -[CNContactCardFieldPickerDataSource init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contacts, a3);
    objc_storeStrong((id *)&v10->_hiddenProperties, a4);
    -[CNContactCardFieldPickerDataSource _loadSections](v10, "_loadSections");
    v11 = objc_claimAutoreleasedReturnValue();
    sections = v10->_sections;
    v10->_sections = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (BOOL)isFieldHidden:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CNContactCardFieldPickerDataSource hiddenProperties](self, "hiddenProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNContactCardFieldPickerDataSource hiddenProperties](self, "hiddenProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_cn_containsObject:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_loadSectionsForContacts
{
  void *v3;
  int v4;
  CNContactCardFieldSection *v5;
  void *v6;
  void *v7;
  CNContactCardFieldSection *v8;
  void *v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  CNContactCardFieldSection *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  CNContactCardFieldSection *v32;
  void *v33;
  CNContactCardFieldSection *v34;
  id v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  _BYTE v49[128];
  _BYTE v50[128];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!-[CNContactCardFieldPickerDataSource isFieldHidden:](self, "isFieldHidden:", *MEMORY[0x1E0C96708]))
  {
    -[CNContactCardFieldPickerDataSource contacts](self, "contacts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __62__CNContactCardFieldPickerDataSource__loadSectionsForContacts__block_invoke;
    v48[3] = &unk_1E2050520;
    v48[4] = self;
    v4 = objc_msgSend(v3, "_cn_any:", v48);

    if (v4)
    {
      v5 = [CNContactCardFieldSection alloc];
      +[CNContactCardFieldItem photoItem](CNContactCardFieldItem, "photoItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CNContactCardFieldSection initWithSectionType:items:](v5, "initWithSectionType:items:", CFSTR("contactCardFieldPickerPhotoSection"), v7);

      objc_msgSend(v39, "addObject:", v8);
    }
  }
  -[CNContactCardFieldPickerDataSource contacts](self, "contacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 <= 1)
  {
    -[CNContactCardFieldPickerDataSource contacts](self, "contacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C97200]);
  }
  v38 = v11;
  +[CNContactCardFieldPickerDataSource shareableNamePropertiesForContact:](CNContactCardFieldPickerDataSource, "shareableNamePropertiesForContact:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (!-[CNContactCardFieldPickerDataSource isFieldHidden:](self, "isFieldHidden:", v20))
        {
          -[CNContactCardFieldPickerDataSource contacts](self, "contacts");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactCardFieldPickerDataSource itemsForKey:forContacts:](self, "itemsForKey:forContacts:", v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObjectsFromArray:", v22);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v17);
  }
  v36 = v15;

  if (objc_msgSend(v14, "count"))
  {
    v23 = -[CNContactCardFieldSection initWithSectionType:items:]([CNContactCardFieldSection alloc], "initWithSectionType:items:", CFSTR("contactCardFieldPickerNameSection"), v14, v15);
    objc_msgSend(v39, "addObject:", v23);

  }
  -[CNContactCardFieldPickerDataSource shareableCardProperties](self, "shareableCardProperties", v36);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v41 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
        -[CNContactCardFieldPickerDataSource contacts](self, "contacts");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactCardFieldPickerDataSource itemsForKey:forContacts:](self, "itemsForKey:forContacts:", v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v31, "count"))
        {
          v32 = [CNContactCardFieldSection alloc];
          objc_msgSend(MEMORY[0x1E0C97200], "localizedStringForKey:", v29);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[CNContactCardFieldSection initWithSectionType:items:displayTitle:](v32, "initWithSectionType:items:displayTitle:", v29, v31, v33);

          objc_msgSend(v39, "addObject:", v34);
        }

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v26);
  }

  return v39;
}

- (id)itemsForKey:(id)a3 forContacts:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __62__CNContactCardFieldPickerDataSource_itemsForKey_forContacts___block_invoke;
  v34[3] = &unk_1E20492B8;
  v34[4] = self;
  v8 = v6;
  v35 = v8;
  objc_msgSend(v7, "_cn_flatMap:", v34);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPickerDataSource contacts](self, "contacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 > 1)
  {
    v28 = v8;
    v29 = v7;
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v27 = v9;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      v12 = (id)MEMORY[0x1E0C9AA60];
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v19, "groupItem");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "displayLabel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v13, "containsObject:", v21);

          if ((v22 & 1) == 0)
          {
            objc_msgSend(v12, "arrayByAddingObject:", v19);
            v23 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "groupItem");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "displayLabel");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v25);

            v12 = (id)v23;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v16);
    }
    else
    {
      v12 = (id)MEMORY[0x1E0C9AA60];
    }

    v8 = v28;
    v7 = v29;
    v9 = v27;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (id)itemsForKey:(id)a3 forContact:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  CNContactCardFieldItem *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  CNContactCardFieldItem *v26;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C96708]))
  {
    if (-[CNContactCardFieldPickerDataSource hasPhotoForContact:](self, "hasPhotoForContact:", v7))
    {
      +[CNContactCardFieldItem photoItem](CNContactCardFieldItem, "photoItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = (id)MEMORY[0x1E0C9AA60];
    }
    goto LABEL_22;
  }
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[CNCardPropertyGroup groupForProperty:contact:store:policy:linkedPolicies:](CNCardPropertyGroup, "groupForProperty:contact:store:policy:linkedPolicies:", v6, v7, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CNContactView isMultiValueProperty:](CNContactView, "isMultiValueProperty:", v6))
  {
    v28 = v10;
    v29 = v6;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      v14 = *MEMORY[0x1E0D13850];
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(obj);
          v16 = v9;
          v17 = v7;
          +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:group:contact:](CNPropertyGroupItem, "propertyGroupItemWithLabeledValue:group:contact:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v15), v9, v7, v28, v29);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "displayValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v19);

          if (v20)
          {
            v21 = -[CNContactCardFieldItem initWithGroupItem:]([CNContactCardFieldItem alloc], "initWithGroupItem:", v18);
            objc_msgSend(v31, "addObject:", v21);

          }
          ++v15;
          v7 = v17;
          v9 = v16;
        }
        while (v12 != v15);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v12);
    }

    v10 = v28;
    v6 = v29;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:group:contact:](CNPropertyGroupItem, "propertyGroupItemWithLabeledValue:group:contact:", v22, v9, v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0D13850];
  objc_msgSend(v23, "displayValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = (*(uint64_t (**)(uint64_t, void *))(v24 + 16))(v24, v25);

  if ((_DWORD)v24)
  {
    v26 = -[CNContactCardFieldItem initWithGroupItem:]([CNContactCardFieldItem alloc], "initWithGroupItem:", v23);
    objc_msgSend(v31, "addObject:", v26);

LABEL_18:
    v8 = v31;
    goto LABEL_20;
  }

  v8 = (id)MEMORY[0x1E0C9AA60];
LABEL_20:

LABEL_22:
  return v8;
}

- (id)keyForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[CNContactCardFieldPickerDataSource sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sectionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("contactCardFieldPickerPhotoSection"));

  if (v8)
  {
    v9 = (id)*MEMORY[0x1E0C96708];
  }
  else
  {
    objc_msgSend(v6, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "groupItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "property");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)groupItemForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CNContactCardFieldPickerDataSource sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)hasPhotoForContact:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "thumbnailImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v3, "isKeyAvailable:", *MEMORY[0x1E0C96708]))
  {
    objc_msgSend(v3, "imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)firstContactContainingPhoto
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[CNContactCardFieldPickerDataSource contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__CNContactCardFieldPickerDataSource_firstContactContainingPhoto__block_invoke;
  v6[3] = &unk_1E2050520;
  v6[4] = self;
  objc_msgSend(v3, "_cn_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)totalItemCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNContactCardFieldPickerDataSource sections](self, "sections", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "items");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "count");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[CNContactCardFieldPickerDataSource sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[CNContactCardFieldPickerDataSource sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;

  v7 = a3;
  v8 = a4;
  -[CNContactCardFieldPickerDataSource sections](self, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactCardFieldPickerDataSource sections](self, "sections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "section");

  objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v16, "isEqualToString:", CFSTR("contactCardFieldPickerPhotoSection"));

  if ((_DWORD)v11
    && (-[CNContactCardFieldPickerDataSource contacts](self, "contacts"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "count"),
        v17,
        v18 == 1))
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("contactCardFieldPickerPhotoCell"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("contactCardFieldPickerCell"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactCardFieldPickerDataSource contacts](self, "contacts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDisplaysValue:", objc_msgSend(v20, "count") == 1);

    objc_msgSend(v19, "setItem:", v12);
  }
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactCardFieldPickerDataSource.m"), 266, CFSTR("Cell is nil"));

  }
  objc_msgSend(v19, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "textLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v21);

  return v19;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[CNContactCardFieldPickerDataSource contacts](self, "contacts", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 2)
  {
    -[CNContactCardFieldPickerDataSource sections](self, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "displayTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)shareableCardProperties
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C966A8];
  v18[0] = *MEMORY[0x1E0C967C0];
  v18[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_opt_class();
  -[CNContactCardFieldPickerDataSource contacts](self, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "canSharePronounsForContacts:", v7);

  if ((_DWORD)v6)
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0C96668]);
  v8 = *MEMORY[0x1E0C967F0];
  v17[0] = *MEMORY[0x1E0C968A0];
  v17[1] = v8;
  v9 = *MEMORY[0x1E0C96690];
  v17[2] = CFSTR("birthdays");
  v17[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  v11 = (void *)objc_opt_class();
  -[CNContactCardFieldPickerDataSource contacts](self, "contacts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "isSharingMeContactForContacts:", v12);

  if ((_DWORD)v11)
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0C96840]);
  v13 = *MEMORY[0x1E0C96740];
  v16[0] = *MEMORY[0x1E0C96868];
  v16[1] = v13;
  v16[2] = *MEMORY[0x1E0C967B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v14);

  return v3;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSArray)hiddenProperties
{
  return self->_hiddenProperties;
}

- (void)setHiddenProperties:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenProperties, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

uint64_t __65__CNContactCardFieldPickerDataSource_firstContactContainingPhoto__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasPhotoForContact:", a2);
}

uint64_t __62__CNContactCardFieldPickerDataSource_itemsForKey_forContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemsForKey:forContact:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __62__CNContactCardFieldPickerDataSource__loadSectionsForContacts__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasPhotoForContact:", a2);
}

+ (id)shareableNamePropertiesForContact:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t *v7;
  id v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C97218];
  if (v3)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C97218], "nameOrderForContact:", v3);
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C97200]);
    v5 = objc_msgSend(v4, "nameOrderForContact:", v6);

  }
  if (v5 == 1)
  {
    if (shareableNamePropertiesForContact__cn_once_token_1 != -1)
      dispatch_once(&shareableNamePropertiesForContact__cn_once_token_1, &__block_literal_global_11777);
    v7 = &shareableNamePropertiesForContact__cn_once_object_1;
  }
  else
  {
    if (shareableNamePropertiesForContact__cn_once_token_2 != -1)
      dispatch_once(&shareableNamePropertiesForContact__cn_once_token_2, &__block_literal_global_74);
    v7 = &shareableNamePropertiesForContact__cn_once_object_2;
  }
  v8 = (id)*v7;

  return v8;
}

+ (BOOL)canSharePronounsForContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  char v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFeatureEnabled:", 12);

  if (v7)
    v8 = objc_msgSend(a1, "isSharingMeContactForContacts:", v4);
  else
    v8 = 0;

  return v8;
}

+ (BOOL)isSharingMeContactForContacts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isMeContact:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __72__CNContactCardFieldPickerDataSource_shareableNamePropertiesForContact___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[15];

  v10[14] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C966C0];
  v10[0] = *MEMORY[0x1E0C96790];
  v10[1] = v0;
  v1 = *MEMORY[0x1E0C96820];
  v10[2] = *MEMORY[0x1E0C967D0];
  v10[3] = v1;
  v2 = *MEMORY[0x1E0C967D8];
  v10[4] = *MEMORY[0x1E0C966D0];
  v10[5] = v2;
  v3 = *MEMORY[0x1E0C967E0];
  v10[6] = *MEMORY[0x1E0C96780];
  v10[7] = v3;
  v4 = *MEMORY[0x1E0C967A0];
  v10[8] = *MEMORY[0x1E0C96798];
  v10[9] = v4;
  v5 = *MEMORY[0x1E0C96698];
  v10[10] = *MEMORY[0x1E0C96758];
  v10[11] = v5;
  v6 = *MEMORY[0x1E0C967E8];
  v10[12] = *MEMORY[0x1E0C967B8];
  v10[13] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)shareableNamePropertiesForContact__cn_once_object_2;
  shareableNamePropertiesForContact__cn_once_object_2 = v8;

}

void __72__CNContactCardFieldPickerDataSource_shareableNamePropertiesForContact___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[15];

  v10[14] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C966D0];
  v10[0] = *MEMORY[0x1E0C96790];
  v10[1] = v0;
  v1 = *MEMORY[0x1E0C96780];
  v10[2] = *MEMORY[0x1E0C967D8];
  v10[3] = v1;
  v2 = *MEMORY[0x1E0C966C0];
  v10[4] = *MEMORY[0x1E0C967E0];
  v10[5] = v2;
  v3 = *MEMORY[0x1E0C96820];
  v10[6] = *MEMORY[0x1E0C967D0];
  v10[7] = v3;
  v4 = *MEMORY[0x1E0C967A0];
  v10[8] = *MEMORY[0x1E0C96798];
  v10[9] = v4;
  v5 = *MEMORY[0x1E0C96698];
  v10[10] = *MEMORY[0x1E0C96758];
  v10[11] = v5;
  v6 = *MEMORY[0x1E0C967E8];
  v10[12] = *MEMORY[0x1E0C967B8];
  v10[13] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)shareableNamePropertiesForContact__cn_once_object_1;
  shareableNamePropertiesForContact__cn_once_object_1 = v8;

}

@end
