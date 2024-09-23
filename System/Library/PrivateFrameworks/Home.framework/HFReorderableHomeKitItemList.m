@implementation HFReorderableHomeKitItemList

uint64_t __59__HFReorderableHomeKitItemList_sortedHomeKitItemComparator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;

  v5 = a3;
  +[HFReorderableHomeKitItemList _dataForHomeKitItem:](HFReorderableHomeKitItemList, "_dataForHomeKitItem:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFReorderableHomeKitItemList _dataForHomeKitItem:](HFReorderableHomeKitItemList, "_dataForHomeKitItem:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_homeKitItemDataComparator");
  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9 = ((uint64_t (**)(_QWORD, void *, void *))v8)[2](v8, v6, v7);

  return v9;
}

uint64_t __58__HFReorderableHomeKitItemList__homeKitItemDataComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  uint64_t (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  uint64_t (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_sortedHomeKitIdentifierComparator");
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = ((uint64_t (**)(_QWORD, void *, void *))v7)[2](v7, v8, v9);

  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_actionSetTypeComparator");
    v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionSetType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionSetType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = ((uint64_t (**)(_QWORD, void *, void *))v11)[2](v11, v12, v13);

    if (!v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "_reorderableObjectDateAddedComparator");
      v14 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateAdded");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateAdded");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = ((uint64_t (**)(_QWORD, void *, void *))v14)[2](v14, v15, v16);

      if (!v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "_reorderableObjectTitleComparator");
        v17 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = ((uint64_t (**)(_QWORD, void *, void *))v17)[2](v17, v18, v19);

        if (!v10)
        {
          objc_msgSend(v5, "uniqueIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "UUIDString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uniqueIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "UUIDString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v21, "compare:", v23);

        }
      }
    }
  }

  return v10;
}

uint64_t __66__HFReorderableHomeKitItemList__sortedHomeKitIdentifierComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL8 v15;
  BOOL v16;
  uint64_t v17;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "sortedHomeKitObjectIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "sortedHomeKitObjectIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v6);

  v12 = v9 == 0x7FFFFFFFFFFFFFFFLL;
  v13 = v11 == 0x7FFFFFFFFFFFFFFFLL;
  v14 = v11 == 0x7FFFFFFFFFFFFFFFLL && v9 == 0x7FFFFFFFFFFFFFFFLL;
  if (v9 == v11)
  {
    v14 = 1;
    v12 = 1;
  }
  v15 = !v14;
  if (v9 < v11)
    v13 = 1;
  v16 = !v13;
  v17 = -1;
  if (v16)
    v17 = 1;
  if (v12)
    return v15;
  else
    return v17;
}

- (NSArray)sortedHomeKitObjectIdentifiers
{
  return self->_sortedHomeKitObjectIdentifiers;
}

- (id)_sortedHomeKitIdentifierComparator
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__HFReorderableHomeKitItemList__sortedHomeKitIdentifierComparator__block_invoke;
  aBlock[3] = &unk_1EA73EF18;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = _Block_copy(v2);

  return v3;
}

- (id)_actionSetTypeComparator
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  if (_MergedGlobals_319 != -1)
    dispatch_once(&_MergedGlobals_319, &__block_literal_global_159_1);
  v2 = (id)qword_1ED379D90;
  +[HFUtilities comparatorWithSortedObjects:](HFUtilities, "comparatorWithSortedObjects:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HFComparatorForNullableObjects_block_invoke;
  v7[3] = &unk_1EA73F0E8;
  v8 = v3;
  v4 = v3;
  v5 = (void *)objc_msgSend(v7, "copy");

  return v5;
}

- (id)_homeKitItemDataComparator
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__HFReorderableHomeKitItemList__homeKitItemDataComparator__block_invoke;
  v6[3] = &unk_1EA73EEF0;
  v6[4] = self;
  v3 = v6;
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __HFComparatorForNullableObjects_block_invoke;
  v7[3] = &unk_1EA73F0E8;
  v8 = v3;
  v4 = (void *)objc_msgSend(v7, "copy");

  return v4;
}

uint64_t __65__HFReorderableHomeKitItemList__reorderableObjectTitleComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:");
}

- (id)_reorderableObjectTitleComparator
{
  void *v2;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __HFComparatorForNullableObjects_block_invoke;
  v4[3] = &unk_1EA73F0E8;
  v5 = &__block_literal_global_153_1;
  v2 = (void *)objc_msgSend(v4, "copy");

  return v2;
}

- (id)_reorderableObjectDateAddedComparator
{
  void *v2;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __HFComparatorForNullableObjects_block_invoke;
  v4[3] = &unk_1EA73F0E8;
  v5 = &__block_literal_global_155_0;
  v2 = (void *)objc_msgSend(v4, "copy");

  return v2;
}

+ (id)_dataForHomeKitItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;

  v3 = a3;
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dateAdded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v3;
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    objc_msgSend(v11, "sourceItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "conformsToProtocol:", &unk_1F03F0850);

    if (v13)
    {
      objc_msgSend(v11, "sourceItem");
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v14;
    }

  }
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1F0413DE0))
  {
    v15 = v9;
    if (objc_msgSend(v15, "conformsToProtocol:", &unk_1F0413DE0))
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v17, "primaryHomeKitObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v9, "homeKitObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v18, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFOrderedHomeKitItemData dataWithUniqueIdentifier:title:dateAdded:](HFOrderedHomeKitItemData, "dataWithUniqueIdentifier:title:dateAdded:", v19, v5, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeKitObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "homeKitObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "actionSetType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActionSetType:", v24);

  }
  return v20;
}

- (id)sortedHomeKitItemComparator
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__HFReorderableHomeKitItemList_sortedHomeKitItemComparator__block_invoke;
  aBlock[3] = &unk_1EA73EEA0;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedHomeKitObjectIdentifiers, 0);
}

- (HFReorderableHomeKitItemList)initWithApplicationDataContainer:(id)a3 category:(id)a4
{
  HFReorderableHomeKitItemList *v4;
  HFReorderableHomeKitItemList *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSArray *sortedHomeKitObjectIdentifiers;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HFReorderableHomeKitItemList;
  v4 = -[HFReorderableItemListAbstractBase initWithApplicationDataContainer:category:](&v16, sel_initWithApplicationDataContainer_category_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HFReorderableItemListAbstractBase applicationDataContainer](v4, "applicationDataContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFReorderableHomeKitItemList _applicationDataKey](v5, "_applicationDataKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v12, "na_map:", &__block_literal_global_219);
    v13 = objc_claimAutoreleasedReturnValue();
    sortedHomeKitObjectIdentifiers = v5->_sortedHomeKitObjectIdentifiers;
    v5->_sortedHomeKitObjectIdentifiers = (NSArray *)v13;

  }
  return v5;
}

- (NSString)_applicationDataKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HFReorderableItemListAbstractBase category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("HFSortedIdentifierStrings"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

uint64_t __61__HFReorderableHomeKitItemList_sortedHomeKitObjectComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t (**v20)(_QWORD, _QWORD, _QWORD);
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "conformsToProtocol:", &unk_1F04290B8);
  v8 = objc_msgSend(v6, "conformsToProtocol:", &unk_1F04290B8);
  v9 = v8;
  if (v7 && (v8 & 1) != 0)
  {
    __61__HFReorderableHomeKitItemList_sortedHomeKitObjectComparator__block_invoke_2(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_dateAdded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFOrderedHomeKitItemData dataWithUniqueIdentifier:title:dateAdded:](HFOrderedHomeKitItemData, "dataWithUniqueIdentifier:title:dateAdded:", v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "actionSetType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActionSetType:", v14);

    }
    __61__HFReorderableHomeKitItemList_sortedHomeKitObjectComparator__block_invoke_2(v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "hf_displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_dateAdded");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFOrderedHomeKitItemData dataWithUniqueIdentifier:title:dateAdded:](HFOrderedHomeKitItemData, "dataWithUniqueIdentifier:title:dateAdded:", v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "actionSetType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setActionSetType:", v19);

    }
    objc_msgSend(*(id *)(a1 + 32), "_homeKitItemDataComparator");
    v20 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v21 = ((uint64_t (**)(_QWORD, void *, void *))v20)[2](v20, v13, v18);

  }
  else
  {
    NSLog(CFSTR("Attempting to sort non-reorderable HomeKit objects %@ and %@. This is probably a bug."), v5, v6);
    if (v7)
      v21 = -1;
    else
      v21 = v9;
  }

  return v21;
}

id __61__HFReorderableHomeKitItemList_sortedHomeKitObjectComparator__block_invoke_2(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v2 = v1;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

    objc_msgSend(v4, "hf_primaryService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "hf_primaryService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v4, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(v1, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)sortedHomeKitObjectComparator
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HFReorderableHomeKitItemList_sortedHomeKitObjectComparator__block_invoke;
  aBlock[3] = &unk_1EA73EEC8;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (BOOL)isEqual:(id)a3
{
  HFReorderableHomeKitItemList *v4;
  HFReorderableHomeKitItemList *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (HFReorderableHomeKitItemList *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HFReorderableItemListAbstractBase applicationDataContainer](v5, "applicationDataContainer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFReorderableItemListAbstractBase applicationDataContainer](self, "applicationDataContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[HFReorderableItemListAbstractBase applicationDataContainer](v5, "applicationDataContainer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFReorderableItemListAbstractBase applicationDataContainer](self, "applicationDataContainer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      -[HFReorderableItemListAbstractBase category](v5, "category");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFReorderableItemListAbstractBase category](self, "category");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v13)
      {
        -[HFReorderableItemListAbstractBase category](v5, "category");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFReorderableItemListAbstractBase category](self, "category");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 &= objc_msgSend(v14, "isEqual:", v15);

      }
      -[HFReorderableHomeKitItemList sortedHomeKitObjectIdentifiers](v5, "sortedHomeKitObjectIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFReorderableHomeKitItemList sortedHomeKitObjectIdentifiers](self, "sortedHomeKitObjectIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == v17)
      {
        v11 = v10 != 0;
      }
      else
      {
        -[HFReorderableHomeKitItemList sortedHomeKitObjectIdentifiers](v5, "sortedHomeKitObjectIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFReorderableHomeKitItemList sortedHomeKitObjectIdentifiers](self, "sortedHomeKitObjectIdentifiers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);
        if (v10)
          v11 = v20;
        else
          v11 = 0;

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

void __56__HFReorderableHomeKitItemList__actionSetTypeComparator__block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB8218];
  v4[0] = *MEMORY[0x1E0CB8240];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0CB8228];
  v4[2] = *MEMORY[0x1E0CB8210];
  v4[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379D90;
  qword_1ED379D90 = v2;

}

id __74__HFReorderableHomeKitItemList_initWithApplicationDataContainer_category___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFReorderableHomeKitItemList *v4;
  void *v5;
  void *v6;
  HFReorderableHomeKitItemList *v7;
  void *v8;

  v4 = [HFReorderableHomeKitItemList alloc];
  -[HFReorderableItemListAbstractBase applicationDataContainer](self, "applicationDataContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFReorderableItemListAbstractBase category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:](v4, "initWithApplicationDataContainer:category:", v5, v6);

  -[HFReorderableHomeKitItemList sortedHomeKitObjectIdentifiers](self, "sortedHomeKitObjectIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFReorderableHomeKitItemList setSortedHomeKitObjectIdentifiers:](v7, "setSortedHomeKitObjectIdentifiers:", v8);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HFMutableReorderableHomeKitItemList *v4;
  void *v5;
  void *v6;
  HFMutableReorderableHomeKitItemList *v7;
  void *v8;

  v4 = [HFMutableReorderableHomeKitItemList alloc];
  -[HFReorderableItemListAbstractBase applicationDataContainer](self, "applicationDataContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFReorderableItemListAbstractBase category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:](v4, "initWithApplicationDataContainer:category:", v5, v6);

  -[HFReorderableHomeKitItemList sortedHomeKitObjectIdentifiers](self, "sortedHomeKitObjectIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFReorderableHomeKitItemList setSortedHomeKitObjectIdentifiers:](v7, "setSortedHomeKitObjectIdentifiers:", v8);

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFReorderableHomeKitItemList _applicationDataKey](self, "_applicationDataKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[HFReorderableHomeKitItemList sortedHomeKitObjectIdentifiers](self, "sortedHomeKitObjectIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

uint64_t __69__HFReorderableHomeKitItemList__reorderableObjectDateAddedComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setSortedHomeKitObjectIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
