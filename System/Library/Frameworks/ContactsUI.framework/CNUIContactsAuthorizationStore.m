@implementation CNUIContactsAuthorizationStore

- (CNUIContactsAuthorizationStore)init
{
  CNUIContactsAuthorizationStore *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUIContactsAuthorizationStore)initWithBundleIdentifier:(id)a3
{
  id v5;
  CNUIContactsAuthorizationStore *v6;
  CNUIContactsAuthorizationStore *v7;
  CNUICoreRemoteApplicationIconLoader *v8;
  CNUICoreRemoteApplicationIconFetching *iconFetcher;
  uint64_t v10;
  CNTCCSettings *tccSettings;
  CNUIContactsAuthorizationStore *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNUIContactsAuthorizationStore;
  v6 = -[CNUIContactsAuthorizationStore init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v8 = objc_alloc_init(CNUICoreRemoteApplicationIconLoader);
    iconFetcher = v7->_iconFetcher;
    v7->_iconFetcher = (CNUICoreRemoteApplicationIconFetching *)v8;

    objc_msgSend(MEMORY[0x1E0D13BA8], "defaultTCC");
    v10 = objc_claimAutoreleasedReturnValue();
    tccSettings = v7->_tccSettings;
    v7->_tccSettings = (CNTCCSettings *)v10;

    v12 = v7;
  }

  return v7;
}

- (id)contactsAuthorizationModel
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__CNUIContactsAuthorizationStore_contactsAuthorizationModel__block_invoke;
  v3[3] = &unk_1E2048068;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D13A68], "lazyFutureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)records
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D13848];
  -[CNUIContactsAuthorizationStore bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) != 0)
  {
    -[CNUIContactsAuthorizationStore tccSettings](self, "tccSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authorizationRecords");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNUIContactsAuthorizationStore bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIContactsAuthorizationStore recordForBundleIdentifier:](self, "recordForBundleIdentifier:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v8 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_6;
    }
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;
LABEL_6:

  return v8;
}

- (id)recordForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNUIContactsAuthorizationStore tccSettings](self, "tccSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationRecordForBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  CNUIContactsAuthorizationStore *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A68];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__CNUIContactsAuthorizationStore_contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel___block_invoke;
  v9[3] = &unk_1E20480B8;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "lazyFutureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)saveContactsAuthorizationModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  CNUIContactsAuthorizationStore *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A68];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__CNUIContactsAuthorizationStore_saveContactsAuthorizationModel___block_invoke;
  v9[3] = &unk_1E2048108;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "lazyFutureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CNTCCSettings)tccSettings
{
  return self->_tccSettings;
}

- (CNUICoreRemoteApplicationIconFetching)iconFetcher
{
  return self->_iconFetcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconFetcher, 0);
  objc_storeStrong((id *)&self->_tccSettings, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

uint64_t __65__CNUIContactsAuthorizationStore_saveContactsAuthorizationModel___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "changedItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__CNUIContactsAuthorizationStore_saveContactsAuthorizationModel___block_invoke_2;
  v4[3] = &unk_1E20480E0;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "_cn_each:", v4);

  return MEMORY[0x1E0C9AAB0];
}

void __65__CNUIContactsAuthorizationStore_saveContactsAuthorizationModel___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordForBundleIdentifier:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "authorization");
  objc_msgSend(v8, "setAuthorizationStatus:", v6);
  objc_msgSend(*(id *)(a1 + 32), "tccSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "saveAuthorizationRecord:", v8);

}

CNUICoreContactsAuthorizationModel *__95__CNUIContactsAuthorizationStore_contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CNUICoreContactsAuthorizationModel *v4;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "remoteItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __95__CNUIContactsAuthorizationStore_contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel___block_invoke_2;
  v6[3] = &unk_1E2048090;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "_cn_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[CNUICoreContactsAuthorizationModel initWithItems:]([CNUICoreContactsAuthorizationModel alloc], "initWithItems:", v3);
  return v4;
}

id __95__CNUIContactsAuthorizationStore_contactsAuthorizationModelByLoadingIconsOfRemoteItemsInModel___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "iconFetcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconOfApplictionWithBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemBySettingIcon:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

CNUICoreContactsAuthorizationModel *__60__CNUIContactsAuthorizationStore_contactsAuthorizationModel__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  CNUICoreContactsAuthorizationModel *v4;

  objc_msgSend(*(id *)(a1 + 32), "records");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_cn_map:", &__block_literal_global_1920);
  v2 = objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v4 = -[CNUICoreContactsAuthorizationModel initWithItems:]([CNUICoreContactsAuthorizationModel alloc], "initWithItems:", v3);

  return v4;
}

@end
