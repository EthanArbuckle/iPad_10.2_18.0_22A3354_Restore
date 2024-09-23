@implementation CNCardPropertyGroup

- (id)displayItems
{
  NSArray *displayItems;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  displayItems = self->_displayItems;
  if (!displayItems)
  {
    -[CNCardPropertyGroup _mergeItems:forEditing:](self, "_mergeItems:forEditing:", self->_propertyItems, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") || -[CNCardPropertyGroup showActionsWhenEmpty](self, "showActionsWhenEmpty"))
    {
      -[CNCardGroup actionItems](self, "actionItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_displayItems;
      self->_displayItems = v6;

    }
    displayItems = self->_displayItems;
  }
  return displayItems;
}

- (NSArray)editingItems
{
  NSArray *editingItems;
  NSArray *v4;
  NSArray *v5;
  CNPropertyPlaceholderItem *v6;
  void *v7;
  CNPropertyPlaceholderItem *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *originalEditingItems;

  editingItems = self->_editingItems;
  if (!editingItems)
  {
    -[CNCardPropertyGroup _mergeItems:forEditing:](self, "_mergeItems:forEditing:", self->_propertyItems, 1);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_editingItems;
    self->_editingItems = v4;

    if (-[CNCardPropertyGroup canAddEditingItem](self, "canAddEditingItem"))
    {
      v6 = [CNPropertyPlaceholderItem alloc];
      -[CNCardPropertyGroup property](self, "property");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CNPropertyPlaceholderItem initWithProperty:](v6, "initWithProperty:", v7);

      -[NSArray arrayByAddingObject:](self->_editingItems, "arrayByAddingObject:", v8);
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v10 = self->_editingItems;
      self->_editingItems = v9;

    }
    editingItems = self->_editingItems;
    if (!self->_originalEditingItems)
    {
      v11 = (NSArray *)-[NSArray copy](editingItems, "copy");
      originalEditingItems = self->_originalEditingItems;
      self->_originalEditingItems = v11;

      editingItems = self->_editingItems;
    }
  }
  return editingItems;
}

- (id)_mergeItems:(id)a3 forEditing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNCardPropertyGroup _shouldShowGroupWhenEditing:](self, "_shouldShowGroupWhenEditing:", v4))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (!(objc_msgSend(MEMORY[0x1E0C97200], "suggestionsShownInEditMode", v21) | !v4))
          {
            if (objc_msgSend(v12, "isSuggested"))
            {
              -[CNCardGroup contact](self, "contact");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isSuggested");

              if (!v14)
                continue;
            }
          }
          if (v4)
          {
            if (objc_msgSend(v12, "isSuggested"))
            {
              -[CNCardGroup contact](self, "contact");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isSuggestedMe");

              if ((v16 & 1) != 0)
                continue;
            }
          }
          -[CNCardPropertyGroup _itemToBeMergedWith:fromItems:forEditing:](self, "_itemToBeMergedWith:fromItems:forEditing:", v12, v7, v4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
            v19 = v17 == v12;
          else
            v19 = 1;
          if (v19)
            objc_msgSend(v7, "addObject:", v12);
          else
            objc_msgSend(v17, "mergeItem:", v12);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    v6 = v21;
  }

  return v7;
}

- (BOOL)_shouldShowGroupWhenEditing:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    -[CNCardPropertyGroup property](self, "property");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C96680]))
    {

    }
    else
    {
      -[CNCardPropertyGroup property](self, "property");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C96888]);

      if (!v9)
      {
        -[CNCardPropertyGroup property](self, "property");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0C967B0]);

        if (v22)
        {
          -[CNCardGroup contact](self, "contact");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isUnknown");

          if (v24)
          {
            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            -[CNCardPropertyGroup propertyItems](self, "propertyItems", 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v34;
              while (2)
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v34 != v28)
                    objc_enumerationMutation(v25);
                  objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "labeledValue");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "value");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "length");

                  if (v32)
                  {

                    goto LABEL_33;
                  }
                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
                if (v27)
                  continue;
                break;
              }
            }

            LOBYTE(v11) = 0;
            return v11;
          }
        }
        goto LABEL_33;
      }
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[CNCardPropertyGroup propertyItems](self, "propertyItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v38;
      while (2)
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "labeledValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            LOBYTE(v11) = 1;
            goto LABEL_18;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_18:

    return v11;
  }
  -[CNCardGroup contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSuggested");

  if (v5)
  {
    -[CNCardPropertyGroup property](self, "property");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C96680]))
    {

LABEL_20:
      -[CNCardGroup contact](self, "contact");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isSuggestedMe");

      return v19;
    }
    -[CNCardPropertyGroup property](self, "property");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C96888]);

    if (v17)
      goto LABEL_20;
  }
LABEL_33:
  LOBYTE(v11) = 1;
  return v11;
}

- (id)_loadPropertyItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardGroup contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardPropertyGroup property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CNCardPropertyGroup property](self, "property");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C96668]);

  if (v6
    || -[CNCardPropertyGroup isRequired](self, "isRequired")
    || (-[CNCardPropertyGroup isAdded](self, "isAdded") | v8) == 1)
  {
    v9 = -[CNCardPropertyGroup propertyGroupItemClass](self, "propertyGroupItemClass");
    if (-[CNCardPropertyGroup isMultiValue](self, "isMultiValue"))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v6 = v6;
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v6);
            -[objc_class propertyGroupItemWithLabeledValue:group:contact:](v9, "propertyGroupItemWithLabeledValue:group:contact:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), self, v4, (_QWORD)v18);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "_cn_addNonNilObject:", v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v11);
      }

    }
    else
    {
      if (!v6)
      {
        -[objc_class emptyValueForLabel:](v9, "emptyValueForLabel:", 0);
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class propertyGroupItemWithLabeledValue:group:contact:](v9, "propertyGroupItemWithLabeledValue:group:contact:", v15, self, v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v16);

    }
  }

  return v3;
}

- (NSString)property
{
  return self->_property;
}

- (BOOL)isMultiValue
{
  void *v2;
  BOOL v3;

  -[CNCardPropertyGroup property](self, "property");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CNContactView isMultiValueProperty:](CNContactView, "isMultiValueProperty:", v2);

  return v3;
}

- (Class)propertyGroupItemClass
{
  void *v2;
  void *v3;

  -[CNCardPropertyGroup property](self, "property");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPropertyGroupItem classForProperty:](CNPropertyGroupItem, "classForProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (id)_itemToBeMergedWith:(id)a3 fromItems:(id)a4 forEditing:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = a4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isEquivalentToItem:whenEditing:", v7, v5, (_QWORD)v16))
        {
          v14 = v13;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)canAddEditingItem
{
  return !-[CNCardPropertyGroup _arrayContainsMaxAllowedItems:](self, "_arrayContainsMaxAllowedItems:", self->_editingItems);
}

- (BOOL)_arrayContainsMaxAllowedItems:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  unint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(v4, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v8 = v5 - (isKindOfClass & 1);
  if (-[CNCardPropertyGroup isFixedValue](self, "isFixedValue")
    || !-[CNCardPropertyGroup isMultiValue](self, "isMultiValue"))
  {
    return v5 != (isKindOfClass & 1);
  }
  -[CNCardPropertyGroup policy](self, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardPropertyGroup property](self, "property");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8 >= objc_msgSend(v9, "_cnui_maximumNumberOfValuesForProperty:", v10);

  return v11;
}

- (BOOL)isFixedValue
{
  void *v2;
  BOOL v3;

  -[CNCardPropertyGroup property](self, "property");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CNContactView isFixedValueProperty:](CNContactView, "isFixedValueProperty:", v2);

  return v3;
}

- (BOOL)showActionsWhenEmpty
{
  return self->_showActionsWhenEmpty;
}

+ (id)groupForProperty:(id)a3 contact:(id)a4 store:(id)a5 policy:(id)a6 linkedPolicies:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProperty:contact:store:policy:linkedPolicies:", v16, v15, v14, v13, v12);

  return v17;
}

- (CNCardPropertyGroup)initWithProperty:(id)a3 contact:(id)a4 store:(id)a5 policy:(id)a6 linkedPolicies:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CNCardPropertyGroup *v17;
  CNCardPropertyGroup *v18;
  uint64_t v19;
  NSArray *propertyItems;
  objc_super v22;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CNCardPropertyGroup;
  v17 = -[CNCardGroup initWithContact:](&v22, sel_initWithContact_, a4);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_property, a3);
    -[CNCardPropertyGroup _loadPropertyItems](v18, "_loadPropertyItems");
    v19 = objc_claimAutoreleasedReturnValue();
    propertyItems = v18->_propertyItems;
    v18->_propertyItems = (NSArray *)v19;

    objc_storeStrong((id *)&v18->_policy, a6);
    objc_storeStrong((id *)&v18->_contactStore, a5);
    objc_storeStrong((id *)&v18->_linkedPolicies, a7);
    v18->_allowsDisplayModePickerActions = 1;
    v18->_hasReorderedItems = 0;
    -[CNCardPropertyGroup setShowActionsWhenEmpty:](v18, "setShowActionsWhenEmpty:", 0);
  }

  return v18;
}

- (void)setShowActionsWhenEmpty:(BOOL)a3
{
  self->_showActionsWhenEmpty = a3;
}

- (void)setAllowsDisplayModePickerActions:(BOOL)a3
{
  self->_allowsDisplayModePickerActions = a3;
}

- (NSArray)propertyItems
{
  return self->_propertyItems;
}

- (id)policyForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(a3, "contactProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCardPropertyGroup policy](self, "policy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardGroup contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    -[CNCardPropertyGroup linkedPolicies](self, "linkedPolicies");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v6);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }

  return v7;
}

- (CNPolicy)policy
{
  return self->_policy;
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  NSArray *displayItems;
  NSArray *editingItems;
  NSArray *deletedItems;
  NSArray *v8;
  NSArray *propertyItems;

  displayItems = self->_displayItems;
  self->_displayItems = 0;

  if (!a3)
  {
    editingItems = self->_editingItems;
    self->_editingItems = 0;

    deletedItems = self->_deletedItems;
    self->_deletedItems = 0;

  }
  -[CNCardPropertyGroup _loadPropertyItems](self, "_loadPropertyItems");
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  propertyItems = self->_propertyItems;
  self->_propertyItems = v8;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CNCardPropertyGroup property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardPropertyGroup displayItems](self, "displayItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[CNCardPropertyGroup editingItems](self, "editingItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[CNCardGroup actions](self, "actions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> [%@]: %d/%d items, %d actions"), v4, self, v5, v7, v9, objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)allowsAdding
{
  void *v3;
  _BOOL4 v4;

  -[CNCardPropertyGroup displayItems](self, "displayItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") && !-[CNCardPropertyGroup isMultiValue](self, "isMultiValue"))
    LOBYTE(v4) = 0;
  else
    v4 = !-[CNCardPropertyGroup isFixedValue](self, "isFixedValue");

  return v4;
}

- (BOOL)isMultiLine
{
  void *v3;
  char v4;
  void *v5;

  -[CNCardPropertyGroup property](self, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967F0]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[CNCardPropertyGroup property](self, "property");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C967B0]);

  }
  return v4;
}

- (BOOL)modified
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CNCardPropertyGroup deletedItems](self, "deletedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 || -[CNCardPropertyGroup hasReorderedItems](self, "hasReorderedItems"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[CNCardPropertyGroup editingItems](self, "editingItems", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v10, "modified") & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_16;
          }
        }
        v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_16:

  }
  return v5;
}

- (id)nextAvailableLabel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;

  -[CNCardPropertyGroup property](self, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96868]);

  if (v4)
  {
    -[CNCardPropertyGroup _nextAvailableSocialService](self, "_nextAvailableSocialService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNCardPropertyGroup property](self, "property");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C96740]);

    if (v7)
      -[CNCardPropertyGroup _nextAvailableInstantMessageService](self, "_nextAvailableInstantMessageService");
    else
      -[CNCardPropertyGroup _nextAvailableLabel](self, "_nextAvailableLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)addEditingItem
{
  return -[CNCardPropertyGroup addEditingItem:](self, "addEditingItem:", 0);
}

- (BOOL)addEditingItem:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;

  v4 = a3;
  v5 = -[CNCardPropertyGroup canAddEditingItem](self, "canAddEditingItem");
  if (!v5)
    goto LABEL_11;
  -[CNCardPropertyGroup editingItems](self, "editingItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    -[CNCardPropertyGroup setIsAdded:](self, "setIsAdded:", 1);
    -[CNCardPropertyGroup reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
    goto LABEL_11;
  }
  -[CNCardPropertyGroup editingItems](self, "editingItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v9)
  {
    if (v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_5:
    v10 = -[CNCardPropertyGroup propertyGroupItemClass](self, "propertyGroupItemClass");
    -[CNCardPropertyGroup nextAvailableLabel](self, "nextAvailableLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardGroup contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class propertyGroupItemWithLabel:group:contact:](v10, "propertyGroupItemWithLabel:group:contact:", v11, self, v12);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_6:
  -[CNCardPropertyGroup editingItems](self, "editingItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertObject:atIndex:", v4, objc_msgSend(v13, "count") - 1);

  if (-[CNCardPropertyGroup _arrayContainsMaxAllowedItems:](self, "_arrayContainsMaxAllowedItems:", v9))
  {
    objc_msgSend(v9, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v9, "removeLastObject");
  }
  -[CNCardPropertyGroup setEditingItems:](self, "setEditingItems:", v9);

LABEL_11:
  return v5;
}

- (void)removeEditingItem:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *editingItems;
  void *v8;
  char isKindOfClass;
  CNPropertyPlaceholderItem *v10;
  void *v11;
  CNPropertyPlaceholderItem *v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[NSArray containsObject:](self->_editingItems, "containsObject:", v4))
    {
      v5 = (void *)-[NSArray mutableCopy](self->_editingItems, "mutableCopy");
      objc_msgSend(v5, "removeObjectIdenticalTo:", v4);
      v6 = (NSArray *)objc_msgSend(v5, "copy");
      editingItems = self->_editingItems;
      self->_editingItems = v6;

      if (-[CNCardPropertyGroup canAddEditingItem](self, "canAddEditingItem"))
      {
        objc_msgSend(v5, "lastObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v10 = [CNPropertyPlaceholderItem alloc];
          -[CNCardPropertyGroup property](self, "property");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[CNPropertyPlaceholderItem initWithProperty:](v10, "initWithProperty:", v11);

          -[NSArray arrayByAddingObject:](self->_editingItems, "arrayByAddingObject:", v12);
          v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v14 = self->_editingItems;
          self->_editingItems = v13;

        }
      }

    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = self->_originalEditingItems;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
LABEL_9:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v20, "labeledValue", (_QWORD)v33);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "labeledValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualIgnoringIdentifiers:", v22);

          if ((v23 & 1) != 0)
            break;
        }
        if (v17 == ++v19)
        {
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v17)
            goto LABEL_9;
          goto LABEL_16;
        }
      }

      v28 = (void *)objc_opt_class();
      objc_msgSend(v4, "labeledValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "label");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "emptyValueForLabel:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateLabeledValueWithValue:", v31);

      -[CNCardPropertyGroup deletedItems](self, "deletedItems");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[CNCardPropertyGroup deletedItems](self, "deletedItems");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "arrayByAddingObject:", v4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNCardPropertyGroup setDeletedItems:](self, "setDeletedItems:", v26);
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNCardPropertyGroup setDeletedItems:](self, "setDeletedItems:", v25);
    }
    else
    {
LABEL_16:

      v24 = (void *)objc_opt_class();
      objc_msgSend(v4, "labeledValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "label");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "emptyValueForLabel:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateLabeledValueWithValue:", v27);

LABEL_19:
    }

  }
}

- (BOOL)moveEditingItemFromIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  if (-[CNCardPropertyGroup valueEditingItemsCount](self, "valueEditingItemsCount") <= a3
    || -[CNCardPropertyGroup valueEditingItemsCount](self, "valueEditingItemsCount") <= a4)
  {
    return 0;
  }
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[CNCardPropertyGroup editingItems](self, "editingItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectAtIndex:", a3);
  objc_msgSend(v9, "insertObject:atIndex:", v10, a4);
  -[CNCardPropertyGroup setEditingItems:](self, "setEditingItems:", v9);
  v11 = 1;
  -[CNCardPropertyGroup setHasReorderedItems:](self, "setHasReorderedItems:", 1);

  return v11;
}

- (id)lastEditingItem
{
  void *v2;
  void *v3;
  void *v4;

  -[CNCardPropertyGroup editingItems](self, "editingItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_reversed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_firstObjectPassingTest:", &__block_literal_global_3356);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)valueEditingItemsCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;

  -[CNCardPropertyGroup editingItems](self, "editingItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[CNCardPropertyGroup editingItems](self, "editingItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return v4 - (isKindOfClass & 1);
}

- (void)saveChanges
{
  void *v3;
  void *v4;
  NSArray *originalEditingItems;

  -[CNCardPropertyGroup deletedItems](self, "deletedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardPropertyGroup saveChangesForItems:](self, "saveChangesForItems:", v3);

  -[CNCardPropertyGroup editingItems](self, "editingItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardPropertyGroup saveChangesForItems:](self, "saveChangesForItems:", v4);

  -[CNCardPropertyGroup setDeletedItems:](self, "setDeletedItems:", 0);
  originalEditingItems = self->_originalEditingItems;
  self->_originalEditingItems = 0;

}

- (void)setEditingItems:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_editingItems != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_editingItems, a3);
    v5 = v6;
  }

}

- (BOOL)isRequired
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  +[CNContactView requiredNameProperties](CNContactView, "requiredNameProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardPropertyGroup property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[CNCardPropertyGroup property](self, "property");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C967B0]);

  }
  return v5;
}

- (BOOL)labelsAreUnique
{
  void *v2;
  char v3;

  -[CNCardPropertyGroup property](self, "property");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("birthdays"));

  return v3;
}

- (void)_updateNameValuesForItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CNContactView nameProperties](CNContactView, "nameProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardPropertyGroup property](self, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (!v7)
    goto LABEL_25;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (!v9)
  {
LABEL_12:
    v16 = v8;
    goto LABEL_24;
  }
  v10 = v9;
  v11 = *(_QWORD *)v30;
LABEL_4:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v30 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
    v14 = (void *)objc_opt_class();
    if (!objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()))
      goto LABEL_10;
    v15 = v13;
    if ((objc_msgSend(v15, "modified") & 1) != 0)
      break;

LABEL_10:
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v10)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  objc_msgSend(v15, "labeledValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_25;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v22);
        v24 = (void *)objc_opt_class();
        if (objc_msgSend(v24, "isSubclassOfClass:", objc_opt_class(), (_QWORD)v25))
          objc_msgSend(v23, "updateLabeledValueWithValue:", v16);
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

LABEL_24:
LABEL_25:

}

- (void)saveChangesForItems:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNCardPropertyGroup _updateNameValuesForItems:](self, "_updateNameValuesForItems:", v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = (void *)objc_opt_class();
        if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class(), (_QWORD)v13))
        {
          v12 = v10;
          if (objc_msgSend(v12, "modified"))
            objc_msgSend(v12, "saveChangesImmediately:", 0);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (id)labelsForItem:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  const __CFString *v33;
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CNCardPropertyGroup property](self, "property");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("birthdays"));

  -[CNCardPropertyGroup policy](self, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    v11 = objc_msgSend(v9, "_cnui_maximumNumberOfValuesForProperty:", CFSTR("birthdays"));

    if (v11 < 2)
    {
      v34 = CFSTR("_systemCalendar");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35[0] = CFSTR("_systemCalendar");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D3EFB0];
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lunarCalendarsForLocaleID:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[CNCardPropertyGroup property](self, "property");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "supportedLabelsForContactProperty:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v19 = (void *)MEMORY[0x1E0C97298];
      -[CNCardPropertyGroup property](self, "property");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "standardLabelsForPropertyWithKey:options:", v20, a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v32 = 0;
  if (-[CNCardPropertyGroup labelsAreUnique](self, "labelsAreUnique"))
  {
    -[CNCardPropertyGroup _availableLabelsInLabels:forItem:withValueSelector:usedLabelsCount:](self, "_availableLabelsInLabels:forItem:withValueSelector:usedLabelsCount:", v17, v6, 0, &v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNCardPropertyGroup property](self, "property");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("birthdays"));

    if (v23)
    {
      if (v32 >= 1
        && (unint64_t)objc_msgSend(v21, "count") >= 2
        && (objc_msgSend(v21, "objectAtIndexedSubscript:", 0),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("_systemCalendar")),
            v24,
            v25))
      {
        v33 = CFSTR("_systemCalendar");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
        v26 = v21;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = (void *)MEMORY[0x1E0D3EFB0];
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localeIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "preferredLunarCalendarForLocaleID:", v29);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26
          && objc_msgSend(v21, "containsObject:", CFSTR("_systemCalendar"))
          && (objc_msgSend(v21, "containsObject:", CFSTR("_systemCalendar")) & 1) == 0
          && (unint64_t)objc_msgSend(v21, "count") >= 2)
        {
          v30 = (void *)objc_msgSend(v21, "mutableCopy");
          objc_msgSend(v30, "removeObject:", CFSTR("_systemCalendar"));
          objc_msgSend(v30, "insertObject:atIndex:", CFSTR("_systemCalendar"), 0);

          v21 = v30;
        }
      }

    }
    v17 = v21;
  }

  return v17;
}

- (id)labelsInUseByGroup
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CNCardPropertyGroup editingItems](self, "editingItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x1E0D13850];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "labeledValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "label");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if ((*(unsigned int (**)(uint64_t, void *))(v8 + 16))(v8, v12))
            objc_msgSend(v3, "addObject:", v12);

        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)itemsUsingLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CNCardPropertyGroup editingItems](self, "editingItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "labeledValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "label");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v13, "isEqualToString:", v4))
            objc_msgSend(v5, "addObject:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_availableLabelsInLabels:(id)a3 forItem:(id)a4 withValueSelector:(SEL)a5 usedLabelsCount:(int64_t *)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  CNCardPropertyGroup *v31;
  id v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v35 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v31 = self;
  -[CNCardPropertyGroup editingItems](self, "editingItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v10);
        v15 = *(id *)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "labeledValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (a5)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v31, CFSTR("CNCardPropertyGroup.m"), 600, CFSTR("A valueSelector has been specified but the value doesn’t support it."));

            }
            ((void (*)(void *, SEL))objc_msgSend(v17, "methodForSelector:", a5))(v17, a5);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
              objc_msgSend(v9, "addObject:", v18);
LABEL_15:

          }
          else if (v15 != v35)
          {
            objc_msgSend(v15, "labeledValue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "label");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v15, "labeledValue");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "label");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v21);

              goto LABEL_15;
            }
          }

          continue;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = v33;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
        if ((objc_msgSend(v9, "containsObject:", v29) & 1) == 0)
          objc_msgSend(v23, "addObject:", v29);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v26);
  }

  if (a6)
    *a6 = objc_msgSend(v9, "count");

  return v23;
}

- (id)_nextAvailableLabelInLabels:(id)a3 withValueSelector:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v13;

  v6 = a3;
  v13 = 0;
  -[CNCardPropertyGroup _availableLabelsInLabels:forItem:withValueSelector:usedLabelsCount:](self, "_availableLabelsInLabels:forItem:withValueSelector:usedLabelsCount:", v6, 0, a4, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = v7;
    v9 = 0;
  }
  else
  {
    if (objc_msgSend(v6, "count"))
    {
      v10 = v13;
      v9 = v10 % objc_msgSend(v6, "count");
    }
    else
    {
      v9 = 0;
    }
    v8 = v6;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_nextAvailableLabel
{
  void *v3;
  void *v4;

  -[CNCardPropertyGroup labelsForItem:options:](self, "labelsForItem:options:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[CNCardPropertyGroup _nextAvailableLabelInLabels:withValueSelector:](self, "_nextAvailableLabelInLabels:withValueSelector:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_nextAvailableInstantMessageService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[CNCardPropertyGroup policy](self, "policy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedLabelsForContactProperty:", *MEMORY[0x1E0C96868]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    +[CNInstantMessagePickerController defaultServices](CNInstantMessagePickerController, "defaultServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardGroup contact](self, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "supportsInstantMessageService");

    if (v8)
    {
      -[CNCardPropertyGroup _nextAvailableLabelInLabels:withValueSelector:](self, "_nextAvailableLabelInLabels:withValueSelector:", v6, sel_service);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)_nextAvailableSocialService
{
  void *v3;
  void *v4;

  +[CNSocialProfileServicePickerController defaultServices](CNSocialProfileServicePickerController, "defaultServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[CNCardPropertyGroup _nextAvailableLabelInLabels:withValueSelector:](self, "_nextAvailableLabelInLabels:withValueSelector:", v3, sel_service);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSDictionary)linkedPolicies
{
  return self->_linkedPolicies;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (BOOL)allowsDisplayModePickerActions
{
  return self->_allowsDisplayModePickerActions;
}

- (BOOL)isAdded
{
  return self->_isAdded;
}

- (void)setIsAdded:(BOOL)a3
{
  self->_isAdded = a3;
}

- (NSArray)deletedItems
{
  return self->_deletedItems;
}

- (void)setDeletedItems:(id)a3
{
  objc_storeStrong((id *)&self->_deletedItems, a3);
}

- (BOOL)hasReorderedItems
{
  return self->_hasReorderedItems;
}

- (void)setHasReorderedItems:(BOOL)a3
{
  self->_hasReorderedItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedItems, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_linkedPolicies, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong((id *)&self->_originalEditingItems, 0);
  objc_storeStrong((id *)&self->_editingItems, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_propertyItems, 0);
}

BOOL __38__CNCardPropertyGroup_lastEditingItem__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

@end
