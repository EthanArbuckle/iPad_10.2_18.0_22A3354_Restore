@implementation HURoomListItemManager

- (int64_t)roomsSection
{
  return 0;
}

- (HFReorderableHomeKitItemList)reorderableRoomList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HURoomListItemManager clientReorderableRoomList](self, "clientReorderableRoomList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HURoomListItemManager clientReorderableRoomList](self, "clientReorderableRoomList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "latestResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CB8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (HFReorderableHomeKitItemList *)v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31710];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithHome:", v5);
  v7 = objc_msgSend(v5, "hf_currentUserIsAdministrator");

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D31840]);
    v20 = *MEMORY[0x1E0D30D18];
    _HULocalizedStringWithDefaultValue(CFSTR("HURoomListAddButtonTitle"), CFSTR("HURoomListAddButtonTitle"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithResults:", v10);
    -[HURoomListItemManager setAddRoomItem:](self, "setAddRoomItem:", v11);

  }
  v12 = objc_alloc(MEMORY[0x1E0D31848]);
  v13 = (void *)MEMORY[0x1E0C99E60];
  -[HURoomListItemManager addRoomItem](self, "addRoomItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_setWithSafeObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithItems:", v15);

  v19[0] = v6;
  v19[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)HURoomListItemManager;
  -[HFItemManager _comparatorForSectionIdentifier:](&v13, sel__comparatorForSectionIdentifier_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURoomListItemManager reorderableRoomList](self, "reorderableRoomList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedHomeKitItemComparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v4;
  v8 = _Block_copy(v6);

  v9 = (void *)MEMORY[0x1E0D319D0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "comparatorWithSortedClasses:secondaryComparator:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HFItem)addRoomItem
{
  return self->_addRoomItem;
}

- (void)setAddRoomItem:(id)a3
{
  objc_storeStrong((id *)&self->_addRoomItem, a3);
}

- (HFReorderableHomeKitItemList)clientReorderableRoomList
{
  return self->_clientReorderableRoomList;
}

- (void)setClientReorderableRoomList:(id)a3
{
  objc_storeStrong((id *)&self->_clientReorderableRoomList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientReorderableRoomList, 0);
  objc_storeStrong((id *)&self->_addRoomItem, 0);
}

@end
