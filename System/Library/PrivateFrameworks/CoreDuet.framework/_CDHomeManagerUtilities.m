@implementation _CDHomeManagerUtilities

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken5_1 != -1)
    dispatch_once(&sharedInstance__pasOnceToken5_1, &__block_literal_global_65);
  return (id)sharedInstance__pasExprOnceResult_4;
}

- (_CDHomeManagerUtilities)init
{
  _CDHomeManagerUtilities *v2;
  void *v3;
  uint64_t v4;
  HMHomeManager *homeManager;
  CNContactStore *v6;
  CNContactStore *contactStore;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CDHomeManagerUtilities;
  v2 = -[_CDHomeManagerUtilities init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(getHMHomeManagerConfigurationClass()), "initWithOptions:cachePolicy:", 8, 2);
    v4 = objc_msgSend(objc_alloc(getHMHomeManagerClass()), "initWithHomeMangerConfiguration:", v3);
    homeManager = v2->_homeManager;
    v2->_homeManager = (HMHomeManager *)v4;

    v6 = (CNContactStore *)objc_alloc_init(getCNContactStoreClass());
    contactStore = v2->_contactStore;
    v2->_contactStore = v6;

  }
  return v2;
}

- (id)contactsInHome
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  CNContactStore *contactStore;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  _CDHomeManagerUtilities *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v28 = (void *)objc_opt_new();
  -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", self);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v29 = self;
  -[HMHomeManager homes](self->_homeManager, "homes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        objc_msgSend(v8, "users");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v36 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
              objc_msgSend(v14, "userID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                objc_msgSend(v14, "userID");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v16);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          }
          while (v11);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v5);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = v3;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        -[objc_class predicateForContactsMatchingEmailAddress:](getCNContactClass(), "predicateForContactsMatchingEmailAddress:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        contactStore = v29->_contactStore;
        -[_CDHomeManagerUtilities contactKeysToFetch](v29, "contactKeysToFetch");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v22, v24, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          objc_msgSend(v28, "addObject:", v26);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v19);
  }

  return v28;
}

- (id)contactKeysToFetch
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  getCNContactIdentifierKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  getCNContactBirthdayKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  getCNContactRelationsKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  getCNContactGivenNameKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  getCNContactMiddleNameKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  getCNContactFamilyNameKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  getCNContactNicknameKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v8;
  getCNContactPhoneNumbersKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v9;
  getCNContactEmailAddressesKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end
