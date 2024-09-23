@implementation CNContactPropertyGroupPickerViewController

- (CNContactPropertyGroupPickerViewController)initWithGroups:(id)a3
{
  CNContactPropertyGroupPickerViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNContactPropertyGroupPickerViewController;
  v3 = -[CNContactPropertyGroupPickerViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  if (v3)
  {
    CNContactsUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ADD_MORE_PROPERTIES_NAV_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPropertyGroupPickerViewController setTitle:](v3, "setTitle:", v5);

    -[CNContactPropertyGroupPickerViewController navigationItem](v3, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLargeTitleDisplayMode:", 2);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_groupPickerDelegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)CNContactPropertyGroupPickerViewController;
  -[CNContactPropertyGroupPickerViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *pickableGroups;
  id v8;
  UITableView *v9;
  UITableView *tableView;
  void *v11;
  id v12;

  -[CNContactPropertyGroupPickerViewController groupPickerDelegate](self, "groupPickerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alreadyPickedGroups");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactPropertyGroupPickerViewController groupPickerDelegate](self, "groupPickerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "policy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactPropertyGroupPickerViewController _loadPickableGroupsWithPickedGroups:policy:](self, "_loadPickableGroupsWithPickedGroups:policy:", v12, v5);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  pickableGroups = self->_pickableGroups;
  self->_pickableGroups = v6;

  v8 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v9 = (UITableView *)objc_msgSend(v8, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableView = self->_tableView;
  self->_tableView = v9;

  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  if (-[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers"))
  {
    +[CNUIColorRepository popoverBackgroundColor](CNUIColorRepository, "popoverBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v11);

  }
  -[CNContactPropertyGroupPickerViewController setView:](self, "setView:", self->_tableView);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (-[UIViewController ab_shouldShowNavBarButtons](self, "ab_shouldShowNavBarButtons"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
    -[CNContactPropertyGroupPickerViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  }
  v8.receiver = self;
  v8.super_class = (Class)CNContactPropertyGroupPickerViewController;
  -[CNContactPropertyGroupPickerViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
  -[CNContactPropertyGroupPickerViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cnui_applyContactStyle");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_pickableGroups, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndexedSubscript:](self->_pickableGroups, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (objc_class *)MEMORY[0x1E0DC3D50];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithStyle:reuseIdentifier:", 0, 0);
  -[NSArray objectAtIndexedSubscript:](self->_pickableGroups, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C97200];
  v10 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(v7, "_cnui_applyContactStyle");
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSArray *pickableGroups;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  pickableGroups = self->_pickableGroups;
  v6 = a4;
  -[NSArray objectAtIndexedSubscript:](pickableGroups, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactPropertyGroupPickerViewController groupPickerDelegate](self, "groupPickerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactGroupPickerDidFinish:withGroup:", self, v9);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  objc_msgSend(v7, "_cnui_applyContactStyle");
  if (-[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers"))
  {
    objc_msgSend(v9, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  objc_msgSend(a4, "_cnui_applyContactStyle", a3);
}

- (void)cancel:(id)a3
{
  id v4;

  -[CNContactPropertyGroupPickerViewController groupPickerDelegate](self, "groupPickerDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactGroupPickerDidCancel:", self);

}

- (id)_loadPickableGroupsWithPickedGroups:(id)a3 policy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[CNContactPropertyGroupPickerViewController prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPropertyGroupPickerViewController contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactPropertyGroupPickerViewController pickableGroupsWithPickedGroups:policy:prohibitedPropertyKeys:contact:](CNContactPropertyGroupPickerViewController, "pickableGroupsWithPickedGroups:policy:prohibitedPropertyKeys:contact:", v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (CNContactGroupPickerDelegate)groupPickerDelegate
{
  return (CNContactGroupPickerDelegate *)objc_loadWeakRetained((id *)&self->_groupPickerDelegate);
}

- (void)setGroupPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_groupPickerDelegate, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_groupPickerDelegate);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_pickableGroups, 0);
}

+ (BOOL)propertiesLeftToPickWithPickedGroups:(id)a3 policy:(id)a4
{
  return objc_msgSend(a1, "propertiesLeftToPickWithPickedGroups:policy:prohibitedPropertyKeys:", a3, a4, MEMORY[0x1E0C9AA60]);
}

+ (BOOL)propertiesLeftToPickWithPickedGroups:(id)a3 policy:(id)a4 prohibitedPropertyKeys:(id)a5
{
  return objc_msgSend(a1, "propertiesLeftToPickWithPickedGroups:policy:prohibitedPropertyKeys:contact:", a3, a4, a5, 0);
}

+ (BOOL)propertiesLeftToPickWithPickedGroups:(id)a3 policy:(id)a4 prohibitedPropertyKeys:(id)a5 contact:(id)a6
{
  void *v6;
  BOOL v7;

  +[CNContactPropertyGroupPickerViewController pickableGroupsWithPickedGroups:policy:prohibitedPropertyKeys:contact:](CNContactPropertyGroupPickerViewController, "pickableGroupsWithPickedGroups:policy:prohibitedPropertyKeys:contact:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

+ (id)propertySections
{
  if (propertySections_onceToken != -1)
    dispatch_once(&propertySections_onceToken, &__block_literal_global_8502);
  return (id)propertySections_sections;
}

+ (id)pickableGroupsWithPickedGroups:(id)a3 policy:(id)a4 prohibitedPropertyKeys:(id)a5 contact:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  int v22;
  id obj;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v29 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  +[CNContactPropertyGroupPickerViewController propertySections](CNContactPropertyGroupPickerViewController, "propertySections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v35;
    v12 = *MEMORY[0x1E0C96668];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(obj);
        v28 = v13;
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v16 = v14;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v31 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              if ((objc_msgSend(v10, "containsObject:", v21) & 1) == 0)
              {
                v22 = objc_msgSend(v21, "isEqualToString:", v12);
                if ((!v11 || !v22 || objc_msgSend(v11, "contactType") != 1)
                  && (objc_msgSend(v9, "containsObject:", v21) & 1) == 0
                  && objc_msgSend(v29, "maximumCountOfValuesForContactProperty:", v21))
                {
                  objc_msgSend(v15, "addObject:", v21);
                }
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v18);
        }

        if (objc_msgSend(v15, "count"))
          objc_msgSend(v25, "addObject:", v15);

        v13 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v27);
  }

  return v25;
}

void __62__CNContactPropertyGroupPickerViewController_propertySections__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[12];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C966D0];
  v18[0] = *MEMORY[0x1E0C96790];
  v18[1] = v1;
  v2 = *MEMORY[0x1E0C96830];
  v18[2] = *MEMORY[0x1E0C967D8];
  v18[3] = v2;
  v3 = *MEMORY[0x1E0C967E0];
  v18[4] = *MEMORY[0x1E0C96780];
  v18[5] = v3;
  v4 = *MEMORY[0x1E0C967D0];
  v18[6] = *MEMORY[0x1E0C966C0];
  v18[7] = v4;
  v5 = *MEMORY[0x1E0C96820];
  v18[8] = *MEMORY[0x1E0C96828];
  v18[9] = v5;
  v6 = *MEMORY[0x1E0C967A0];
  v18[10] = *MEMORY[0x1E0C96798];
  v18[11] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v8 = *MEMORY[0x1E0C96698];
  v17[0] = *MEMORY[0x1E0C96758];
  v17[1] = v8;
  v9 = *MEMORY[0x1E0C967E8];
  v17[2] = *MEMORY[0x1E0C967B8];
  v17[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v11);

  +[CNContactView addFieldCardProperties](CNContactView, "addFieldCardProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v13);

  v14 = objc_msgSend(v0, "copy");
  v15 = (void *)propertySections_sections;
  propertySections_sections = v14;

}

@end
