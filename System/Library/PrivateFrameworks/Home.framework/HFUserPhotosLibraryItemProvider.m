@implementation HFUserPhotosLibraryItemProvider

- (HFUserPhotosLibraryItemProvider)initWithHome:(id)a3
{
  id v5;
  HFUserPhotosLibraryItemProvider *v6;
  HFUserPhotosLibraryItemProvider *v7;
  uint64_t v8;
  NSMutableSet *userPhotosLibraryItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFUserPhotosLibraryItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    userPhotosLibraryItems = v7->_userPhotosLibraryItems;
    v7->_userPhotosLibraryItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HFUserPhotosLibraryItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA738C40;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  -[HFUserPhotosLibraryItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_allUsersIncludingCurrentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v6, 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __46__HFUserPhotosLibraryItemProvider_reloadItems__block_invoke_2;
  v11[3] = &unk_1EA72C438;
  v11[4] = self;
  objc_msgSend(v7, "flatMap:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recover:", &__block_literal_global_152);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

HFUserPhotosLibraryItem *__46__HFUserPhotosLibraryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  HFUserPhotosLibraryItem *v7;
  void *v8;
  HFUserPhotosLibraryItem *v9;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = [HFUserPhotosLibraryItem alloc];
    objc_msgSend(*(id *)(a1 + 32), "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFUserPhotosLibraryItem initWithUser:inHome:](v7, "initWithUser:inHome:", v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __46__HFUserPhotosLibraryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "userPhotosLibraryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(*(id *)(a1 + 32), "userPhotosLibraryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __46__HFUserPhotosLibraryItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory(0x29uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v2;
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "Person fetch failed with error %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFUserPhotosLibraryItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("user"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSMutableSet)userPhotosLibraryItems
{
  return self->_userPhotosLibraryItems;
}

- (void)setUserPhotosLibraryItems:(id)a3
{
  objc_storeStrong((id *)&self->_userPhotosLibraryItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPhotosLibraryItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
