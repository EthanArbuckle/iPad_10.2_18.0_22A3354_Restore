@implementation CNUINavigationListItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_defaultItem);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_content, 0);
}

- (UIImage)image
{
  return self->_image;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (CNUINavigationListItem)defaultItem
{
  return (CNUINavigationListItem *)objc_loadWeakRetained((id *)&self->_defaultItem);
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDefaultItem:(id)a3
{
  objc_storeWeak((id *)&self->_defaultItem, a3);
}

+ (id)navigationListItemsForUserActionListModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  CNUINavigationListItem *v21;
  CNUINavigationListItem *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  __int128 v30;
  id v31;
  void *v32;
  id obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v4;
  if (v6)
  {
    objc_msgSend(v4, "defaultAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  v12 = v4;
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v36;
    *(_QWORD *)&v11 = 138543362;
    v30 = v11;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(a1, "itemForActionItem:isGrouped:", v16, objc_msgSend(v16, "shouldGroupByBundleIdentifier", v30));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v16, "shouldGroupByBundleIdentifier");
        if (v19)
          v20 = v18 == 0;
        else
          v20 = 0;
        if (v20)
        {
          CNUILogContactCard();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v30;
            v40 = v16;
            _os_log_error_impl(&dword_18AC56000, v26, OS_LOG_TYPE_ERROR, "[CNUINavigationListItem+CNUIUserActionModel] Item had shouldGroupByBundleIdentifier set, which is incompatible with a nil bundleIdentifier. Falling back to ungrouped action item for: %{public}@", buf, 0xCu);
          }

LABEL_19:
          objc_msgSend(v34, "addObject:", v17);
          goto LABEL_20;
        }
        if (!v19)
          goto LABEL_19;
        objc_msgSend(v32, "objectForKeyedSubscript:", v18);
        v21 = (CNUINavigationListItem *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          v22 = [CNUINavigationListItem alloc];
          objc_msgSend(a1, "localizedLabelForActionItem:usingPropertyLabel:", v16, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[CNUINavigationListItem initWithTitle:](v22, "initWithTitle:", v23);

          -[CNUINavigationListItem setIdentifier:](v21, "setIdentifier:", v18);
          -[CNUINavigationListItem setItems:](v21, "setItems:", MEMORY[0x1E0C9AA60]);
          objc_msgSend(v34, "addObject:", v21);
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, v18);
        }
        objc_msgSend(v17, "setParent:", v21);
        -[CNUINavigationListItem items](v21, "items");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "arrayByAddingObject:", v17);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNUINavigationListItem setItems:](v21, "setItems:", v25);

        v12 = v31;
LABEL_20:
        objc_msgSend(v12, "defaultAction");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27 == v16)
          objc_msgSend(0, "setDefaultItem:", v17);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v13);
  }

  v28 = (void *)objc_msgSend(v34, "copy");
  return v28;
}

+ (id)itemForActionItem:(id)a3 isGrouped:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  CNUINavigationListItem *v8;
  void *v9;
  char v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "localizedLabelForActionItem:usingPropertyLabel:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNUINavigationListItem initWithTitle:]([CNUINavigationListItem alloc], "initWithTitle:", v7);
  if (v4
    || (objc_msgSend(v6, "bundleIdentifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C965C0]),
        v9,
        (v10 & 1) == 0))
  {
    objc_msgSend(v6, "targetHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListItem setSubtitle:](v8, "setSubtitle:", v11);

  }
  -[CNUINavigationListItem setContent:](v8, "setContent:", v6);

  return v8;
}

- (CNUINavigationListItem)initWithTitle:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  CNUINavigationListItem *v8;
  CNUINavigationListItem *v9;
  NSArray *items;
  uint64_t v11;
  NSString *title;
  NSString *subtitle;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNUINavigationListItem;
  v8 = -[CNUINavigationListItem init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_image, a4);
    items = v9->_items;
    v9->_items = 0;

    v11 = objc_msgSend(v6, "copy");
    title = v9->_title;
    v9->_title = (NSString *)v11;

    subtitle = v9->_subtitle;
    v9->_subtitle = 0;

  }
  return v9;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (CNUINavigationListItem)initWithTitle:(id)a3
{
  return -[CNUINavigationListItem initWithTitle:image:](self, "initWithTitle:image:", a3, 0);
}

+ (id)favoritesNavigationListItemsForUserActionListModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_filter:", &__block_literal_global_30477);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13D90]), "initWithModel:actions:", v4, v6);
  objc_msgSend(a1, "navigationListItemsForUserActionListModel:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CNUINavigationListItemContent)content
{
  return self->_content;
}

+ (id)localizedLabelForActionItem:(id)a3 usingPropertyLabel:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    objc_msgSend(v5, "contactProperty");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(v6, "contactProperty");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedDisplayStringForLabel:propertyName:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v13, "isEqual:", *MEMORY[0x1E0C96648]);

  if ((_DWORD)v11)
  {
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
    {
      CNContactsUIBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("TTYRELAY_NO_LABEL");
LABEL_10:
      objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E20507A8, CFSTR("Localized"));
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_14:

      v12 = (void *)v19;
      goto LABEL_15;
    }
    v20 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    v22 = CFSTR("TTYRELAY_LABEL_SUFFIX");
    goto LABEL_13;
  }
  objc_msgSend(v6, "type");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C96638]);

  if (v18)
  {
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
    {
      CNContactsUIBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("TTY_NO_LABEL");
      goto LABEL_10;
    }
    v20 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    v22 = CFSTR("TTY_LABEL_SUFFIX");
LABEL_13:
    objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_1E20507A8, CFSTR("Localized"));
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v23, v12);
    v19 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v23;
    goto LABEL_14;
  }
LABEL_15:

  return v12;
}

uint64_t __98__CNUINavigationListItem_CNUIUserActionModel__favoritesNavigationListItemsForUserActionListModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggested") ^ 1;
}

+ (id)faceTimeNavigationListItemsForUserActionListModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "defaultAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    v15 = (void *)*MEMORY[0x1E0C965C0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "bundleIdentifier", (_QWORD)v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 == v15)
        {
          objc_msgSend(a1, "itemForActionItem:isGrouped:", v17, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v19);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  v20 = (void *)objc_msgSend(v5, "copy");
  return v20;
}

+ (id)navigationListItemForContactProperty:(id)a3
{
  id v5;
  CNUINavigationListItem *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CNUINavigationListItem *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v18;

  v5 = a3;
  v6 = [CNUINavigationListItem alloc];
  v7 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(v5, "label");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedDisplayStringForLabel:propertyName:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNUINavigationListItem initWithTitle:](v6, "initWithTitle:", v10);

  objc_msgSend(v5, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v8) = objc_opt_isKindOfClass();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C967C0]);

    if (v15)
    {
      objc_msgSend(v5, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "formattedStringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNUINavigationListItem+CNContactProperty.m"), 28, CFSTR("Value is not a string, not supported"));

  }
  -[CNUINavigationListItem setSubtitle:](v11, "setSubtitle:", v13);
  -[CNUINavigationListItem setContent:](v11, "setContent:", v5);

  return v11;
}

- (CNUINavigationListItem)init
{
  return -[CNUINavigationListItem initWithTitle:](self, "initWithTitle:", &stru_1E20507A8);
}

- (CNUINavigationListItem)parent
{
  return (CNUINavigationListItem *)objc_loadWeakRetained((id *)&self->_parent);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
