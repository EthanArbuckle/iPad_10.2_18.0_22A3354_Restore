@implementation CNPostalAddressEditorViewController

- (CNPostalAddressEditorViewController)initWithContact:(id)a3 propertyKey:(id)a4 editNames:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CNPostalAddressEditorViewController *v10;
  CNPostalAddressEditorViewController *v11;
  CNMutableContact *v12;
  CNMutableContact *contact;
  uint64_t v14;
  NSString *propertyKey;
  void *v16;
  objc_super v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNPostalAddressEditorViewController;
  v10 = -[CNPostalAddressEditorViewController initWithStyle:](&v18, sel_initWithStyle_, 0);
  v11 = v10;
  if (v10)
  {
    if (v8)
    {
      v10->_editingExistingContact = 1;
      v12 = (CNMutableContact *)objc_msgSend(v8, "mutableCopy");
    }
    else
    {
      v12 = (CNMutableContact *)objc_alloc_init(MEMORY[0x1E0C97360]);
    }
    contact = v11->_contact;
    v11->_contact = v12;

    v14 = objc_msgSend(v9, "copy");
    propertyKey = v11->_propertyKey;
    v11->_propertyKey = (NSString *)v14;

    v11->_editNames = v5;
    -[CNPostalAddressEditorViewController _rebuildPropertyGroupItems:](v11, "_rebuildPropertyGroupItems:", v5);
    -[CNPostalAddressEditorViewController navigationItem](v11, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLargeTitleDisplayMode:", 2);

  }
  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPostalAddressEditorViewController;
  -[CNPostalAddressEditorViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[CNPostalAddressEditorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cnui_applyContactStyle");

  -[CNPostalAddressEditorViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cnui_applyContactStyle");

}

- (double)tableViewSpacingForExtraSeparators:(id)a3
{
  return 3.40282347e38;
}

- (void)_rebuildPropertyGroupItems:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v5;
  NSMutableArray *propertyItems;
  ABPostalNameGroupItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ABPostalNameGroupItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  ABPostalNameGroupItem *v19;
  ABPostalNameGroupItem *v20;
  uint64_t v21;
  CNMutableContact **p_contact;
  CNMutableContact *contact;
  void *v24;
  CNCardPropertyGroup *v25;
  CNCardPropertyGroup **p_propertyGroup;
  CNCardPropertyGroup *propertyGroup;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  CNMutableContact *v34;
  void *v35;
  CNCardPropertyGroup *v36;
  CNCardPropertyGroup *v37;
  void *v38;
  uint64_t v39;
  CNMutableContact *v40;
  void *v41;
  CNCardPropertyGroup *v42;
  CNCardPropertyGroup *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;

  v3 = a3;
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  propertyItems = self->_propertyItems;
  self->_propertyItems = v5;

  if (v3)
  {
    v7 = objc_alloc_init(ABPostalNameGroupItem);
    -[ABPostalNameGroupItem setContact:](v7, "setContact:", self->_contact);
    -[CNMutableContact givenName](self->_contact, "givenName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABPostalNameGroupItem setValue:](v7, "setValue:", v8);

    -[ABPostalNameGroupItem setProperty:](v7, "setProperty:", *MEMORY[0x1E0C966D0]);
    v9 = (void *)MEMORY[0x1E0C97200];
    -[ABPostalNameGroupItem property](v7, "property");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABPostalNameGroupItem setPlaceholder:](v7, "setPlaceholder:", v11);

    -[ABPostalNameGroupItem setSetter:](v7, "setSetter:", sel_setGivenName_);
    v12 = objc_alloc_init(ABPostalNameGroupItem);
    -[ABPostalNameGroupItem setContact:](v12, "setContact:", self->_contact);
    -[CNMutableContact familyName](self->_contact, "familyName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABPostalNameGroupItem setValue:](v12, "setValue:", v13);

    -[ABPostalNameGroupItem setProperty:](v12, "setProperty:", *MEMORY[0x1E0C966C0]);
    v14 = (void *)MEMORY[0x1E0C97200];
    -[ABPostalNameGroupItem property](v12, "property");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABPostalNameGroupItem setPlaceholder:](v12, "setPlaceholder:", v16);

    -[ABPostalNameGroupItem setSetter:](v12, "setSetter:", sel_setFamilyName_);
    objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "displayNameOrder");

    if (v18 == 1)
      v19 = v7;
    else
      v19 = v12;
    if (v18 == 1)
      v20 = v12;
    else
      v20 = v7;
    -[NSMutableArray addObject:](self->_propertyItems, "addObject:", v19);
    -[NSMutableArray addObject:](self->_propertyItems, "addObject:", v20);

  }
  v21 = *MEMORY[0x1E0C967F0];
  if (-[NSString isEqualToString:](self->_propertyKey, "isEqualToString:", *MEMORY[0x1E0C967F0]))
  {
    p_contact = &self->_contact;
    contact = self->_contact;
    objc_msgSend(MEMORY[0x1E0C97390], "sharedPermissivePolicy");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNCardPropertyGroup groupForProperty:contact:store:policy:linkedPolicies:](CNCardPropertyGroup, "groupForProperty:contact:store:policy:linkedPolicies:", v21, contact, 0, v24, 0);
    v25 = (CNCardPropertyGroup *)objc_claimAutoreleasedReturnValue();
    p_propertyGroup = &self->_propertyGroup;
    propertyGroup = self->_propertyGroup;
    self->_propertyGroup = v25;

    -[CNMutableContact postalAddresses](self->_contact, "postalAddresses");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastObject");
    v46 = (id)objc_claimAutoreleasedReturnValue();

    v29 = (uint64_t)v46;
    if (v46)
    {
LABEL_18:
      v50 = (id)v29;
      +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:group:contact:](CNPropertyGroupItem, "propertyGroupItemWithLabeledValue:group:contact:", v29, *p_propertyGroup, *p_contact);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_propertyItems, "addObject:", v45);

      return;
    }
    v30 = (void *)MEMORY[0x1E0C97338];
    v31 = objc_alloc_init(MEMORY[0x1E0C973A8]);
LABEL_12:
    v32 = v31;
    objc_msgSend(v30, "labeledValueWithLabel:value:", 0, v31);
    v47 = (id)objc_claimAutoreleasedReturnValue();

    v29 = (uint64_t)v47;
    goto LABEL_18;
  }
  v33 = *MEMORY[0x1E0C966A8];
  if (-[NSString isEqualToString:](self->_propertyKey, "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {
    p_contact = &self->_contact;
    v34 = self->_contact;
    objc_msgSend(MEMORY[0x1E0C97390], "sharedPermissivePolicy");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNCardPropertyGroup groupForProperty:contact:store:policy:linkedPolicies:](CNCardPropertyGroup, "groupForProperty:contact:store:policy:linkedPolicies:", v33, v34, 0, v35, 0);
    v36 = (CNCardPropertyGroup *)objc_claimAutoreleasedReturnValue();
    p_propertyGroup = &self->_propertyGroup;
    v37 = self->_propertyGroup;
    self->_propertyGroup = v36;

    -[CNMutableContact emailAddresses](self->_contact, "emailAddresses");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "lastObject");
    v48 = (id)objc_claimAutoreleasedReturnValue();

    v29 = (uint64_t)v48;
    if (!v48)
    {
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, &stru_1E20507A8);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_18;
  }
  v39 = *MEMORY[0x1E0C967C0];
  if (-[NSString isEqualToString:](self->_propertyKey, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    p_contact = &self->_contact;
    v40 = self->_contact;
    objc_msgSend(MEMORY[0x1E0C97390], "sharedPermissivePolicy");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNCardPropertyGroup groupForProperty:contact:store:policy:linkedPolicies:](CNCardPropertyGroup, "groupForProperty:contact:store:policy:linkedPolicies:", v39, v40, 0, v41, 0);
    v42 = (CNCardPropertyGroup *)objc_claimAutoreleasedReturnValue();
    p_propertyGroup = &self->_propertyGroup;
    v43 = self->_propertyGroup;
    self->_propertyGroup = v42;

    -[CNMutableContact phoneNumbers](self->_contact, "phoneNumbers");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "lastObject");
    v49 = (id)objc_claimAutoreleasedReturnValue();

    v29 = (uint64_t)v49;
    if (v49)
      goto LABEL_18;
    v30 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", &stru_1E20507A8);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNPostalAddressEditorViewController;
  -[CNPostalAddressEditorViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[CNPostalAddressEditorViewController registerContactCellClass:](self, "registerContactCellClass:", objc_opt_class());
  -[CNPostalAddressEditorViewController registerContactCellClass:](self, "registerContactCellClass:", objc_opt_class());
  -[CNPostalAddressEditorViewController registerContactCellClass:](self, "registerContactCellClass:", objc_opt_class());
  -[CNPostalAddressEditorViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
  objc_msgSend(v3, "setLeftBarButtonItem:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
  if (!-[NSString isEqualToString:](self->_propertyKey, "isEqualToString:", *MEMORY[0x1E0C966C0]))
    objc_msgSend(v5, "setEnabled:", 0);
  objc_msgSend(v3, "setRightBarButtonItem:", v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPostalAddressEditorViewController;
  -[CNPostalAddressEditorViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CNPostalAddressEditorViewController _startEditingFirstCell](self, "_startEditingFirstCell");
}

- (void)cancel:(id)a3
{
  void *v3;
  id v4;

  -[CNPostalAddressEditorViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addressEditorDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "postalAddressEditorDidCancel:", v4);

}

- (void)done:(id)a3
{
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CNPostalAddressEditorViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_propertyItems;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "saveChangesImmediately:", 0, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "doneWithContact:propertyKey:", self->_contact, self->_propertyKey);
}

- (void)validateContents
{
  uint64_t v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C966A8];
  if (-[NSString isEqualToString:](self->_propertyKey, "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v4 = self->_propertyItems;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v10, "property");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isEqualToString:", v3) & 1) != 0)
          {
            objc_msgSend(v10, "displayValue");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "length");

            if (v13)
              v7 = 1;
          }
          else
          {

          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v6);
      goto LABEL_28;
    }
  }
  else
  {
    v14 = *MEMORY[0x1E0C967C0];
    if (!-[NSString isEqualToString:](self->_propertyKey, "isEqualToString:", *MEMORY[0x1E0C967C0]))
    {
      v23 = -[NSString isEqualToString:](self->_propertyKey, "isEqualToString:", *MEMORY[0x1E0C967F0]);
      goto LABEL_30;
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v4 = self->_propertyItems;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v15)
    {
      v16 = v15;
      v7 = 0;
      v17 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v4);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(v19, "property", (_QWORD)v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v20, "isEqualToString:", v14) & 1) != 0)
          {
            objc_msgSend(v19, "displayValue");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "length");

            if (v22)
              v7 = 1;
          }
          else
          {

          }
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v16);
      goto LABEL_28;
    }
  }
  v7 = 0;
LABEL_28:

  v23 = v7 & 1;
LABEL_30:
  -[CNPostalAddressEditorViewController navigationItem](self, "navigationItem", (_QWORD)v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rightBarButtonItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setEnabled:", v23);

}

- (void)_startEditingFirstCell
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[CNPostalAddressEditorViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForRowAtIndexPath:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstResponderItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)registerContactCellClass:(Class)a3
{
  void *v5;
  id v6;

  objc_msgSend((id)objc_opt_class(), "cellIdentifierForClass:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPostalAddressEditorViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", a3, v6);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSMutableArray count](self->_propertyItems, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;

  -[NSMutableArray objectAtIndex:](self->_propertyItems, "objectAtIndex:", objc_msgSend(a4, "indexAtPosition:", 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "cellIdentifierForEditingProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPostalAddressEditorViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCardGroupItem:", v5);
  v10 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  objc_msgSend(v9, "separatorInset");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C967F0])
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    objc_msgSend(v9, "setPresentingDelegate:", self);
    objc_msgSend(v9, "setDelegate:", self);
    objc_msgSend(v9, "setLabelWidth:", 110.0);
    objc_msgSend(v9, "labelButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "titleEdgeInsets");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    if (v10 == 1)
      v25 = 20.0;
    else
      v21 = 20.0;
    objc_msgSend(v9, "labelButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTitleEdgeInsets:", v19, v21, v23, v25);

  }
  else
  {
    objc_msgSend(v9, "setSeparatorInset:", v12, 154.0, v14, v16);
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  objc_msgSend(a4, "_cnui_applyContactStyle", a3);
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v11;
    -[CNPostalAddressEditorViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v8);

    objc_msgSend(v5, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setTintColor:", v8);
  }
  -[CNPostalAddressEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
  objc_msgSend(a4, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__CNPostalAddressEditorViewController_sender_dismissViewController_completionHandler___block_invoke;
  v8[3] = &unk_1E204FB40;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a4, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewLabel:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "updateLabeledValueWithLabel:", a5);
  objc_msgSend(v8, "updateWithPropertyItem:", v7);

}

- (void)propertyCell:(id)a3 didUpdateItem:(id)a4 withNewValue:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  objc_msgSend(v8, "updateLabeledValueWithValue:", a5);
  -[CNPostalAddressEditorViewController validateContents](self, "validateContents");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "updateWithPropertyItem:", v8);

}

- (void)propertyCellDidChangeLayout:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CNPostalAddressEditorViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("needsHeightCalculation"));
    objc_msgSend(v4, "_heightForRowAtIndexPath:", v5);
    objc_msgSend(v4, "_setHeight:forRowAtIndexPath:", v5);
  }

}

- (id)contactViewCache
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyGroup, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_propertyKey, 0);
  objc_storeStrong((id *)&self->_propertyItems, 0);
}

uint64_t __86__CNPostalAddressEditorViewController_sender_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)cellIdentifierForEditingProperty:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967F0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) == 0)
  {
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967C0]);
  }
  v4 = objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "cellIdentifierForClass:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)cellIdentifierForClass:(Class)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", class_getName(a3), 1);
}

@end
