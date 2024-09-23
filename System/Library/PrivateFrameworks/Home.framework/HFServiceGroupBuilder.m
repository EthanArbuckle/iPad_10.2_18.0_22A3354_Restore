@implementation HFServiceGroupBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFServiceGroupBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6;
  HFServiceGroupBuilder *v7;
  HFServiceGroupBuilder *v8;
  void *v9;
  void *v10;
  void *v11;
  HFMutableSetDiff *v12;
  HFMutableSetDiff *serviceUUIDs;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HFRoomBuilder *v20;
  void *v21;
  HFRoomBuilder *v22;
  objc_super v24;

  v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HFServiceGroupBuilder;
  v7 = -[HFItemBuilder initWithExistingObject:inHome:](&v24, sel_initWithExistingObject_inHome_, a3, v6);
  v8 = v7;
  if (v7)
  {
    if (a3)
    {
      -[HFServiceGroupBuilder serviceGroup](v7, "serviceGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "services");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HFHomeKitObjectUniqueIdentifiers(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = -[HFMutableSetDiff initWithFromSet:]([HFMutableSetDiff alloc], "initWithFromSet:", v11);
    serviceUUIDs = v8->_serviceUUIDs;
    v8->_serviceUUIDs = v12;

    -[HFServiceGroupBuilder serviceGroup](v8, "serviceGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceGroupBuilder setName:](v8, "setName:", v15);

    -[HFServiceGroupBuilder serviceGroup](v8, "serviceGroup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceGroupBuilder setShowInHomeDashboard:](v8, "setShowInHomeDashboard:", objc_msgSend(v16, "hf_effectiveShowInHomeDashboard"));

    -[HFServiceGroupBuilder serviceGroup](v8, "serviceGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceGroupBuilder setIsFavorite:](v8, "setIsFavorite:", objc_msgSend(v17, "hf_effectiveIsFavorite"));

    -[HFServiceGroupBuilder _rooms](v8, "_rooms");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "count") == 1)
    {
      v20 = [HFRoomBuilder alloc];
      objc_msgSend(v19, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HFRoomBuilder initWithExistingObject:inHome:](v20, "initWithExistingObject:inHome:", v21, v6);
      -[HFServiceGroupBuilder setRoom:](v8, "setRoom:", v22);

    }
    -[HFServiceGroupBuilder setHasSetRoom:](v8, "setHasSetRoom:", 0);
    -[HFServiceGroupBuilder setHasSetIcon:](v8, "setHasSetIcon:", 0);

  }
  return v8;
}

- (NSString)primaryServiceType
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HFServiceGroupBuilder services](self, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "hf_effectiveServiceType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "na_safeAddObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        v18 = objc_msgSend(v10, "countForObject:", v17, (_QWORD)v22);
        if (v18 > v13)
        {
          v19 = v18;
          v20 = v17;

          v13 = v19;
          v14 = v20;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v12);
  }
  else
  {
    v14 = 0;
  }

  return (NSString *)v14;
}

- (id)_mostCommonIconDescriptor
{
  void *v2;
  void *v3;
  void *v4;
  HFImageIconDescriptor *v5;

  -[HFServiceGroupBuilder services](self, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_107);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "setWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_mostCommonObject");
    v5 = (HFImageIconDescriptor *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", CFSTR("HFImageIconIdentifierGeneric"));
  }

  return v5;
}

uint64_t __50__HFServiceGroupBuilder__mostCommonIconDescriptor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_iconDescriptor");
}

- (BOOL)shouldAllowAddingService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  objc_msgSend(v4, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HFItemBuilder home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_serviceGroupsForService:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "count"))
      goto LABEL_5;
    -[HFServiceGroupBuilder serviceGroup](self, "serviceGroup");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_8;
    v9 = (void *)v8;
    -[HFServiceGroupBuilder serviceGroup](self, "serviceGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "containsObject:", v10);

    if (v11)
    {
LABEL_5:
      -[HFServiceGroupBuilder services](self, "services");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        -[HFServiceGroupBuilder services](self, "services");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __50__HFServiceGroupBuilder_shouldAllowAddingService___block_invoke;
        v17[3] = &unk_1EA7283A0;
        v18 = v4;
        v15 = objc_msgSend(v14, "na_any:", v17);

      }
      else
      {
        v15 = 1;
      }
    }
    else
    {
LABEL_8:
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __50__HFServiceGroupBuilder_shouldAllowAddingService___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_canGroupWithService:", *(_QWORD *)(a1 + 32));
}

- (void)addService:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[HFServiceGroupBuilder shouldAllowAddingService:](self, "shouldAllowAddingService:", v4))
  {
    HFLogForCategory(0x28uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "hf_prettyDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Request to add a service that is not supported in this service group. We'll allow this to proceed (because there are no API restriction of what services can go into a group; we just want to enforce restrictions in our UI). Service: %@",
        (uint8_t *)&v9,
        0xCu);

    }
  }
  -[HFServiceGroupBuilder serviceUUIDs](self, "serviceUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

- (void)removeService:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HFServiceGroupBuilder serviceUUIDs](self, "serviceUUIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "deleteObject:", v5);
}

- (NSArray)services
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[HFServiceGroupBuilder serviceUUIDs](self, "serviceUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__HFServiceGroupBuilder_services__block_invoke;
  v8[3] = &unk_1EA72B548;
  v8[4] = self;
  objc_msgSend(v5, "na_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

id __33__HFServiceGroupBuilder_services__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_serviceWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)removeItemFromHome
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFServiceGroupBuilder serviceGroup](self, "serviceGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x28uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "HFServiceGroupBuilder: Removing service group from home: %@", buf, 0xCu);

  }
  -[HFItemBuilder home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorOnlyCompletionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeServiceGroup:completionHandler:", v4, v8);

  objc_initWeak((id *)buf, self);
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __43__HFServiceGroupBuilder_removeItemFromHome__block_invoke;
  v17[3] = &unk_1EA72CA50;
  objc_copyWeak(&v19, (id *)buf);
  v10 = v4;
  v18 = v10;
  objc_msgSend(v3, "flatMap:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __43__HFServiceGroupBuilder_removeItemFromHome__block_invoke_2;
  v15[3] = &unk_1EA72A050;
  v12 = v10;
  v16 = v12;
  objc_msgSend(v11, "recover:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return v13;
}

id __43__HFServiceGroupBuilder_removeItemFromHome__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory(0x28uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "HFServiceGroupBuilder: Request to remove service group from home completed successfully: %@", buf, 0xCu);

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __43__HFServiceGroupBuilder_removeItemFromHome__block_invoke_10;
  v11 = &unk_1EA7277C8;
  v12 = WeakRetained;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", &v8, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __43__HFServiceGroupBuilder_removeItemFromHome__block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didRemoveServiceGroup:", v3, *(_QWORD *)(a1 + 40));

  }
}

id __43__HFServiceGroupBuilder_removeItemFromHome__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v3;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFServiceGroupBuilder: Request to remove service group from home failed with error: %@, %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1EA741FF8;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  v14[0] = CFSTR("HFErrorHandlerOptionFailedItemName");
  v14[1] = CFSTR("HFErrorUserInfoOperationKey");
  v15[0] = v9;
  v15[1] = CFSTR("HFOperationRemoveServiceGroup");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_errorWithAddedUserInfo:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)commitItem
{
  void *v3;
  char v4;
  void *v5;
  __CFString **v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  _QWORD v19[4];
  __CFString *v20;
  HFServiceGroupBuilder *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];

  -[HFItemBuilder home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_currentUserIsAdministrator");

  if ((v4 & 1) != 0)
  {
    -[HFServiceGroupBuilder serviceGroup](self, "serviceGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = HFOperationEditItemGroup;
    if (!v5)
      v6 = HFOperationAddServiceGroup;
    v7 = *v6;

    -[HFServiceGroupBuilder serviceGroup](self, "serviceGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x1E0C809B0];
    if (!v8)
    {
      -[HFItemBuilder home](self, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceGroups");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v9;
      v24[1] = 3221225472;
      v24[2] = __35__HFServiceGroupBuilder_commitItem__block_invoke;
      v24[3] = &unk_1EA72E668;
      v24[4] = self;
      objc_msgSend(v11, "na_firstObjectPassingTest:", v24);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFServiceGroupBuilder setServiceGroup:](self, "setServiceGroup:", v12);

    }
    -[HFServiceGroupBuilder _performValidation](self, "_performValidation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __35__HFServiceGroupBuilder_commitItem__block_invoke_2;
    v23[3] = &unk_1EA726940;
    v23[4] = self;
    objc_msgSend(v13, "flatMap:", v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __35__HFServiceGroupBuilder_commitItem__block_invoke_3;
    v22[3] = &unk_1EA726940;
    v22[4] = self;
    objc_msgSend(v14, "flatMap:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __35__HFServiceGroupBuilder_commitItem__block_invoke_4;
    v19[3] = &unk_1EA726990;
    v20 = v7;
    v21 = self;
    v16 = v7;
    objc_msgSend(v15, "recover:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v17;
}

BOOL __35__HFServiceGroupBuilder_commitItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v7))
  {
    objc_msgSend(v3, "services");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __35__HFServiceGroupBuilder_commitItem__block_invoke_2(uint64_t a1)
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
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "serviceGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_updateValueForContextType:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v4;
    objc_msgSend(*(id *)(a1 + 32), "_updateValueForContextType:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(*(id *)(a1 + 32), "_updateName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = v7;
    objc_msgSend(*(id *)(a1 + 32), "_updateRooms");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v10;
    objc_msgSend(*(id *)(a1 + 32), "_updateIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chainFutures:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  else
  {
    objc_msgSend(v3, "_createServiceGroup");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t __35__HFServiceGroupBuilder_commitItem__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateServices");
}

id __35__HFServiceGroupBuilder_commitItem__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0D519C0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_errorWithOperationType:failedItemName:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "futureWithError:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_performValidation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D519C0];
  -[HFItemBuilder lazy_verifyPropertyIsSet:](self, "lazy_verifyPropertyIsSet:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  -[HFServiceGroupBuilder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder lazy_verifyNameIsNotEmpty:](self, "lazy_verifyNameIsNotEmpty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chainFutures:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_createServiceGroup
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__HFServiceGroupBuilder__createServiceGroup__block_invoke;
  v8[3] = &unk_1EA7268F0;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithCompletionHandlerAdapterBlock:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __44__HFServiceGroupBuilder__createServiceGroup__block_invoke_2;
  v7[3] = &unk_1EA734278;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __44__HFServiceGroupBuilder__createServiceGroup__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addServiceGroupWithName:completionHandler:", v5, v4);

}

id __44__HFServiceGroupBuilder__createServiceGroup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setServiceGroup:", v3);
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __44__HFServiceGroupBuilder__createServiceGroup__block_invoke_3;
  v11 = &unk_1EA7277C8;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "dispatchHomeObserverMessage:sender:", &v8, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __44__HFServiceGroupBuilder__createServiceGroup__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didAddServiceGroup:", v3, *(_QWORD *)(a1 + 40));

  }
}

- (id)_updateName
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__HFServiceGroupBuilder__updateName__block_invoke;
  v9[3] = &unk_1EA7268C8;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "addFailureBlock:", &__block_literal_global_28_4);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __36__HFServiceGroupBuilder__updateName__block_invoke_3;
  v8[3] = &unk_1EA726940;
  v8[4] = self;
  objc_msgSend(v4, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __36__HFServiceGroupBuilder__updateName__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "serviceGroup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateName:completionHandler:", v5, v4);

}

void __36__HFServiceGroupBuilder__updateName__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFServiceGroupBuilder.updateName"));

}

id __36__HFServiceGroupBuilder__updateName__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__HFServiceGroupBuilder__updateName__block_invoke_4;
  v7[3] = &unk_1EA726918;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "dispatchHomeObserverMessage:sender:", v7, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __36__HFServiceGroupBuilder__updateName__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serviceGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didUpdateNameForServiceGroup:", v3, v4);

  }
}

- (id)_updateServices
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[5];

  -[HFServiceGroupBuilder serviceUUIDs](self, "serviceUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HFServiceGroupBuilder__updateServices__block_invoke;
  v7[3] = &unk_1EA7342E0;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__HFServiceGroupBuilder__updateServices__block_invoke_7;
  v6[3] = &unk_1EA7342E0;
  -[HFItemBuilder commitSetDiff:addBlock:updateBlock:deleteBlock:](self, "commitSetDiff:addBlock:updateBlock:deleteBlock:", v3, v7, &__block_literal_global_40_2, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __40__HFServiceGroupBuilder__updateServices__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_serviceWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D519C0];
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __40__HFServiceGroupBuilder__updateServices__block_invoke_2;
  v17[3] = &unk_1EA728590;
  v17[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v18 = v9;
  objc_msgSend(v7, "futureWithErrorOnlyHandlerAdapterBlock:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "addFailureBlock:", &__block_literal_global_34_3);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __40__HFServiceGroupBuilder__updateServices__block_invoke_4;
  v15[3] = &unk_1EA732620;
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v12 = v9;
  objc_msgSend(v10, "flatMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __40__HFServiceGroupBuilder__updateServices__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "serviceGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addService:completionHandler:", *(_QWORD *)(a1 + 40), v4);

}

void __40__HFServiceGroupBuilder__updateServices__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFServiceGroupBuilder.addService"));

}

id __40__HFServiceGroupBuilder__updateServices__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __40__HFServiceGroupBuilder__updateServices__block_invoke_5;
  v11 = &unk_1EA7277C8;
  v5 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  objc_msgSend(v4, "dispatchHomeObserverMessage:sender:", &v8, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __40__HFServiceGroupBuilder__updateServices__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "serviceGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home:didAddService:toServiceGroup:", v3, v4, v5);

  }
}

uint64_t __40__HFServiceGroupBuilder__updateServices__block_invoke_6()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

id __40__HFServiceGroupBuilder__updateServices__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_serviceWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D519C0];
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __40__HFServiceGroupBuilder__updateServices__block_invoke_8;
  v17[3] = &unk_1EA728590;
  v17[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v18 = v9;
  objc_msgSend(v7, "futureWithErrorOnlyHandlerAdapterBlock:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "addFailureBlock:", &__block_literal_global_41_0);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __40__HFServiceGroupBuilder__updateServices__block_invoke_10;
  v15[3] = &unk_1EA732620;
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v12 = v9;
  objc_msgSend(v10, "flatMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __40__HFServiceGroupBuilder__updateServices__block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "serviceGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeService:completionHandler:", *(_QWORD *)(a1 + 40), v4);

}

void __40__HFServiceGroupBuilder__updateServices__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFServiceGroupBuilder.removeService"));

}

id __40__HFServiceGroupBuilder__updateServices__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __40__HFServiceGroupBuilder__updateServices__block_invoke_11;
  v11 = &unk_1EA7277C8;
  v5 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  objc_msgSend(v4, "dispatchHomeObserverMessage:sender:", &v8, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __40__HFServiceGroupBuilder__updateServices__block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "serviceGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home:didRemoveService:fromServiceGroup:", v3, v4, v5);

  }
}

- (id)_updateValueForContextType:(unint64_t)a3
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  int v9;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];

  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      v5 = -[HFServiceGroupBuilder isFavorite](self, "isFavorite");
      goto LABEL_6;
    case 1uLL:
      NSLog(CFSTR("Include in status is not configured by HFServiceGroupBuilder."), a2);
      goto LABEL_10;
    case 3uLL:
      v5 = -[HFServiceGroupBuilder showInHomeDashboard](self, "showInHomeDashboard");
LABEL_6:
      v6 = v5;
      goto LABEL_7;
    default:
      v6 = 0;
LABEL_7:
      -[HFServiceGroupBuilder serviceGroup](self, "serviceGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == objc_msgSend(v7, "hf_isOnForContextType:", a3))
      {
        -[HFServiceGroupBuilder serviceGroup](self, "serviceGroup");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hf_hasSetForContextType:", a3);

        if (v9)
        {
LABEL_10:
          objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
          return (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {

      }
      -[HFServiceGroupBuilder serviceGroup](self, "serviceGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hf_updateValue:forContextType:", v6, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (id)objc_msgSend(v12, "addFailureBlock:", &__block_literal_global_48_1);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __52__HFServiceGroupBuilder__updateValueForContextType___block_invoke_2;
      v15[3] = &unk_1EA726940;
      v15[4] = self;
      objc_msgSend(v12, "flatMap:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      return v14;
  }
}

void __52__HFServiceGroupBuilder__updateValueForContextType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFServiceGroupBuilder.updateName"));

}

id __52__HFServiceGroupBuilder__updateValueForContextType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __52__HFServiceGroupBuilder__updateValueForContextType___block_invoke_3;
        v14[3] = &unk_1EA7263F0;
        v14[4] = v9;
        objc_msgSend(v10, "dispatchAccessoryObserverMessage:sender:", v14, 0);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __52__HFServiceGroupBuilder__updateValueForContextType___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory:didUpdateApplicationDataForService:", v3, *(_QWORD *)(a1 + 32));

  }
}

- (id)_updateRooms
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[HFServiceGroupBuilder hasSetRoom](self, "hasSetRoom"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[HFServiceGroupBuilder accessories](self, "accessories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v3)
    {
      v4 = v3;
      v18 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v20 != v18)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v6, "room");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "uniqueIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFServiceGroupBuilder room](self, "room");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "room");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v8, "isEqual:", v11);

          if ((v12 & 1) == 0)
          {
            -[HFServiceGroupBuilder room](self, "room");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addAccessory:", v6);

          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v4);
    }

    -[HFServiceGroupBuilder room](self, "room");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "commitItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_updateIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  HFServiceGroupBuilder *v17;
  id v18;

  if (-[HFServiceGroupBuilder hasSetIcon](self, "hasSetIcon"))
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    -[HFServiceGroupBuilder services](self, "services");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFServiceGroupBuilder services](self, "services");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __36__HFServiceGroupBuilder__updateIcon__block_invoke;
    v16 = &unk_1EA7343A8;
    v17 = self;
    v18 = v5;
    v7 = v5;
    v8 = (id)objc_msgSend(v6, "na_map:", &v13);

    v9 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler", v13, v14, v15, v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "combineAllFutures:ignoringErrors:scheduler:", v7, 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

id __36__HFServiceGroupBuilder__updateIcon__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "iconDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_updateIconDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__HFServiceGroupBuilder__updateIcon__block_invoke_2;
  v11[3] = &unk_1EA72F4A8;
  v6 = v3;
  v12 = v6;
  objc_msgSend(v5, "flatMap:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v7, "addFailureBlock:", &__block_literal_global_54_1);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  v9 = v6;

  return v9;
}

id __36__HFServiceGroupBuilder__updateIcon__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__HFServiceGroupBuilder__updateIcon__block_invoke_3;
  v7[3] = &unk_1EA7263F0;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "dispatchAccessoryObserverMessage:sender:", v7, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __36__HFServiceGroupBuilder__updateIcon__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory:didUpdateApplicationDataForService:", v3, *(_QWORD *)(a1 + 32));

  }
}

void __36__HFServiceGroupBuilder__updateIcon__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFServiceGroupBuilder.updateIcon"));

}

- (id)_rooms
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HFServiceGroupBuilder services](self, "services", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "accessory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "room");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "na_safeAddObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSString)originalName
{
  void *v2;
  void *v3;

  -[HFServiceGroupBuilder serviceGroup](self, "serviceGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)supportsFavoriting
{
  return 1;
}

- (id)accessories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFServiceGroupBuilder serviceGroup](self, "serviceGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __36__HFServiceGroupBuilder_accessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

- (HFRoomBuilder)room
{
  HFRoomBuilder *roomBuilder;
  HFRoomBuilder *v4;
  void *v5;
  HFRoomBuilder *v6;
  HFRoomBuilder *v7;

  roomBuilder = self->_roomBuilder;
  if (!roomBuilder)
  {
    v4 = [HFRoomBuilder alloc];
    -[HFItemBuilder home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HFItemBuilder initWithHome:](v4, "initWithHome:", v5);
    v7 = self->_roomBuilder;
    self->_roomBuilder = v6;

    roomBuilder = self->_roomBuilder;
  }
  return roomBuilder;
}

- (void)setRoom:(id)a3
{
  HFRoomBuilder *v4;
  HFRoomBuilder *roomBuilder;

  v4 = (HFRoomBuilder *)a3;
  -[HFServiceGroupBuilder setHasSetRoom:](self, "setHasSetRoom:", 1);
  roomBuilder = self->_roomBuilder;
  self->_roomBuilder = v4;

}

- (HFIconDescriptor)iconDescriptor
{
  HFIconDescriptor *iconDescriptor;
  HFIconDescriptor *v4;
  HFIconDescriptor *v5;

  iconDescriptor = self->_iconDescriptor;
  if (!iconDescriptor)
  {
    -[HFServiceGroupBuilder _mostCommonIconDescriptor](self, "_mostCommonIconDescriptor");
    v4 = (HFIconDescriptor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_iconDescriptor;
    self->_iconDescriptor = v4;

    iconDescriptor = self->_iconDescriptor;
  }
  return iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
  HFIconDescriptor *v4;
  HFIconDescriptor *iconDescriptor;

  v4 = (HFIconDescriptor *)a3;
  -[HFServiceGroupBuilder setHasSetIcon:](self, "setHasSetIcon:", 1);
  iconDescriptor = self->_iconDescriptor;
  self->_iconDescriptor = v4;

}

- (NSArray)availableIconDescriptors
{
  void *v3;
  void *v4;
  void *v5;

  if (-[HFServiceGroupBuilder _supportsCustomIcons](self, "_supportsCustomIcons"))
  {
    -[HFServiceGroupBuilder primaryServiceType](self, "primaryServiceType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFServiceIconFactory allIconDescriptorsForServiceType:serviceSubtype:](HFServiceIconFactory, "allIconDescriptorsForServiceType:serviceSubtype:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v5;
}

- (BOOL)_supportsCustomIcons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  -[HFServiceGroupBuilder services](self, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_effectiveServiceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFServiceGroupBuilder services](self, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__HFServiceGroupBuilder__supportsCustomIcons__block_invoke;
  v9[3] = &unk_1EA7283A0;
  v10 = v5;
  v7 = v5;
  LOBYTE(v4) = objc_msgSend(v6, "na_all:", v9);

  return (char)v4;
}

uint64_t __45__HFServiceGroupBuilder__supportsCustomIcons__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unsigned int v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;

  objc_msgSend(a2, "hf_effectiveServiceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));
  +[HFServiceIconFactory allIconDescriptorsForServiceType:serviceSubtype:](HFServiceIconFactory, "allIconDescriptorsForServiceType:serviceSubtype:", *(_QWORD *)(a1 + 32), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > 1)
    v7 = v4;
  else
    v7 = 0;

  return v7;
}

- (BOOL)isFavorite
{
  return self->isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->isFavorite = a3;
}

- (BOOL)showInHomeDashboard
{
  return self->showInHomeDashboard;
}

- (void)setShowInHomeDashboard:(BOOL)a3
{
  self->showInHomeDashboard = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (HFMutableSetDiff)serviceUUIDs
{
  return self->_serviceUUIDs;
}

- (HFRoomBuilder)roomBuilder
{
  return self->_roomBuilder;
}

- (void)setRoomBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_roomBuilder, a3);
}

- (BOOL)hasSetRoom
{
  return self->_hasSetRoom;
}

- (void)setHasSetRoom:(BOOL)a3
{
  self->_hasSetRoom = a3;
}

- (BOOL)hasSetIcon
{
  return self->_hasSetIcon;
}

- (void)setHasSetIcon:(BOOL)a3
{
  self->_hasSetIcon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomBuilder, 0);
  objc_storeStrong((id *)&self->_serviceUUIDs, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
}

@end
