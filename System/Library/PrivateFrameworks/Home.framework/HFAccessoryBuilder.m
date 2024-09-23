@implementation HFAccessoryBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFAccessoryBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  HFAccessoryBuilder *v9;
  HFAccessoryBuilder *v10;
  void *v11;
  void *v12;
  void *v13;
  HFRoomBuilder *v14;
  void *v15;
  void *v16;
  HFRoomBuilder *v17;
  void *v18;
  void *v19;
  void *v21;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryBuilder.m"), 43, CFSTR("%@ can only be used with existing HMAccessories"), objc_opt_class());

  }
  v22.receiver = self;
  v22.super_class = (Class)HFAccessoryBuilder;
  v9 = -[HFItemBuilder initWithExistingObject:inHome:](&v22, sel_initWithExistingObject_inHome_, v7, v8);
  v10 = v9;
  if (v9)
  {
    -[HFItemBuilder homeKitRepresentation](v9, "homeKitRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFNamingComponents namingComponentFromAccessory:](HFNamingComponents, "namingComponentFromAccessory:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryBuilder setNamingComponent:](v10, "setNamingComponent:", v12);

    -[HFAccessoryBuilder originalName](v10, "originalName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryBuilder setName:](v10, "setName:", v13);

    v14 = [HFRoomBuilder alloc];
    -[HFAccessoryBuilder accessory](v10, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "room");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HFRoomBuilder initWithExistingObject:inHome:](v14, "initWithExistingObject:inHome:", v16, v8);
    -[HFAccessoryBuilder setRoom:](v10, "setRoom:", v17);

    -[HFAccessoryBuilder accessory](v10, "accessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryBuilder setShowInHomeDashboard:](v10, "setShowInHomeDashboard:", objc_msgSend(v18, "hf_effectiveShowInHomeDashboard"));

    -[HFAccessoryBuilder accessory](v10, "accessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryBuilder setIsFavorite:](v10, "setIsFavorite:", objc_msgSend(v19, "hf_effectiveIsFavorite"));

    -[HFAccessoryBuilder setSkipPropagateFavoriteToServices:](v10, "setSkipPropagateFavoriteToServices:", 0);
  }

  return v10;
}

- (NSString)originalName
{
  void *v2;
  void *v3;

  -[HFAccessoryBuilder namingComponent](self, "namingComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)accessories
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFAccessoryBuilder accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)supportsFavoriting
{
  void *v2;
  char v3;

  -[HFAccessoryBuilder accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isNetworkRouter");

  return v3 ^ 1;
}

- (id)removeItemFromHome
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFAccessoryBuilder accessories](self, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x28uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "hf_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Removing accessory from home: %@", buf, 0xCu);

  }
  -[HFItemBuilder home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorOnlyCompletionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAccessory:completionHandler:", v5, v9);

  objc_initWeak((id *)buf, self);
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __40__HFAccessoryBuilder_removeItemFromHome__block_invoke;
  v18[3] = &unk_1EA72CA50;
  objc_copyWeak(&v20, (id *)buf);
  v11 = v5;
  v19 = v11;
  objc_msgSend(v3, "flatMap:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __40__HFAccessoryBuilder_removeItemFromHome__block_invoke_2;
  v16[3] = &unk_1EA72A050;
  v13 = v11;
  v17 = v13;
  objc_msgSend(v12, "recover:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

  return v14;
}

id __40__HFAccessoryBuilder_removeItemFromHome__block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Request to remove accessory from home completed successfully: %@", buf, 0xCu);

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __40__HFAccessoryBuilder_removeItemFromHome__block_invoke_9;
  v11 = &unk_1EA7277C8;
  v12 = WeakRetained;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", &v8, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __40__HFAccessoryBuilder_removeItemFromHome__block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didRemoveAccessory:", v3, *(_QWORD *)(a1 + 40));

  }
}

id __40__HFAccessoryBuilder_removeItemFromHome__block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Request to remove accessory from home failed with error: %@, %@", buf, 0x16u);

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
  v15[1] = CFSTR("HFOperationRemoveAccessory");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_errorWithAddedUserInfo:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_shouldUpdateNilNameWithRoomName
{
  void *v2;
  void *v3;
  void *v5;
  char v6;
  void *v7;
  int v8;
  int v9;
  void *v10;

  -[HFAccessoryBuilder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HFAccessoryBuilder accessory](self, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hf_isMediaAccessory");
    if (v8)
    {
      -[HFAccessoryBuilder accessory](self, "accessory");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v2, "hf_isHomePod") & 1) != 0)
      {
        v9 = 0;
      }
      else
      {
        -[HFAccessoryBuilder accessory](self, "accessory");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "hf_isAppleTV") & 1) == 0)
        {

          v6 = 1;
          goto LABEL_15;
        }
        v9 = 1;
      }
    }
    else
    {
      v9 = 0;
    }
    -[HFAccessoryBuilder accessory](self, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "hf_isTelevision");

    if (v9)
    {

      if ((v8 & 1) == 0)
        goto LABEL_16;
    }
    else if (!v8)
    {
      goto LABEL_16;
    }
LABEL_15:

LABEL_16:
    return v6;
  }
  return 0;
}

- (id)_performValidation
{
  return -[HFItemBuilder lazy_verifyPropertyIsSet:](self, "lazy_verifyPropertyIsSet:", CFSTR("room"));
}

- (id)commitItem
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v21;
  _QWORD v22[4];
  __CFString *v23;
  HFAccessoryBuilder *v24;
  _QWORD v25[4];
  uint8_t buf[4];
  HFAccessoryBuilder *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = self;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Starting commit (%@)", buf, 0xCu);
  }

  -[HFItemBuilder home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    -[HFAccessoryBuilder _lazilyUpdateValueForContextType:](self, "_lazilyUpdateValueForContextType:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_safeAddObject:", v7);

    -[HFAccessoryBuilder accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hf_isCamera");

    if ((v9 & 1) == 0)
    {
      -[HFAccessoryBuilder _lazilyUpdateValueForContextType:](self, "_lazilyUpdateValueForContextType:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "na_safeAddObject:", v10);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("HFOperationEditService");
    v13 = (void *)MEMORY[0x1E0D519C0];
    -[HFAccessoryBuilder _performValidation](self, "_performValidation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    -[HFAccessoryBuilder _lazilyUpdateName](self, "_lazilyUpdateName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v15;
    -[HFAccessoryBuilder _lazilyUpdateRoom](self, "_lazilyUpdateRoom");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v16;
    v25[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chainFutures:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __32__HFAccessoryBuilder_commitItem__block_invoke;
    v22[3] = &unk_1EA726990;
    v23 = v12;
    v24 = self;
    objc_msgSend(v18, "recover:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    return v19;
  }
  else
  {
    HFLogForCategory(0x28uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Ignoring request to commit because the current user is not an administrator", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

id __32__HFAccessoryBuilder_commitItem__block_invoke(uint64_t a1, void *a2)
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

- (id)_lazilyUpdateName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[HFAccessoryBuilder _shouldUpdateNilNameWithRoomName](self, "_shouldUpdateNilNameWithRoomName"))
  {
    -[HFAccessoryBuilder room](self, "room");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryBuilder setName:](self, "setName:", v4);
  }
  else
  {
    -[HFAccessoryBuilder namingComponent](self, "namingComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryBuilder name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commitableNameForString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryBuilder setName:](self, "setName:", v5);

  }
  -[HFAccessoryBuilder name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryBuilder originalName](self, "originalName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if (!v8)
    {

LABEL_13:
      -[HFAccessoryBuilder accessory](self, "accessory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAccessoryBuilder name](self, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0D519C0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke;
      v21[3] = &unk_1EA729F18;
      v22 = v15;
      v23 = v16;
      v18 = v16;
      v19 = v15;
      objc_msgSend(v17, "lazyFutureWithBlock:", v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      return v20;
    }
    v11 = objc_msgSend(v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_13;
  }
  HFLogForCategory(0x28uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[HFAccessoryBuilder name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v13;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Not updating name because it hasn't changed (%@)", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v24 = v5;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Updating name from \"%@\" to \"%@\", buf, 0x16u);

  }
  v7 = MEMORY[0x1E0C809B0];
  v8 = (void *)MEMORY[0x1E0D519C0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_22;
  v20[3] = &unk_1EA728590;
  v21 = *(id *)(a1 + 32);
  v22 = *(id *)(a1 + 40);
  objc_msgSend(v8, "futureWithErrorOnlyHandlerAdapterBlock:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_2;
  v16[3] = &unk_1EA72CB18;
  v17 = *(id *)(a1 + 32);
  v10 = v3;
  v18 = v10;
  v19 = *(id *)(a1 + 40);
  v11 = (id)objc_msgSend(v9, "addSuccessBlock:", v16);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_39;
  v14[3] = &unk_1EA726968;
  v15 = v10;
  v12 = v10;
  v13 = (id)objc_msgSend(v9, "addFailureBlock:", v14);

}

uint64_t __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_22(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAccessoryName:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint8_t buf[8];
  _QWORD v33[4];
  id v34;

  v3 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_3;
  v33[3] = &unk_1EA7263F0;
  v34 = a1[4];
  objc_msgSend(v4, "dispatchAccessoryObserverMessage:sender:", v33, 0);

  if ((objc_msgSend(a1[4], "hf_isSingleServiceLikeAccessory") & 1) == 0)
  {
    objc_msgSend(a1[5], "finishWithResult:", v3);
    goto LABEL_9;
  }
  objc_msgSend(a1[4], "hf_visibleServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_5;
  objc_msgSend(a1[4], "hf_primaryService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v7 = v8;

LABEL_5:
    goto LABEL_6;
  }
  objc_msgSend(a1[4], "hf_programmableSwitchServices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    HFLogForCategory(0x28uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Attempted to name a single service accessory without a visible service", buf, 2u);
    }

    v17 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "finishWithError:", v12);
    goto LABEL_7;
  }
LABEL_6:
  v9 = (void *)MEMORY[0x1E0D519C0];
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_28;
  v28[3] = &unk_1EA72CA78;
  v10 = v7;
  v29 = v10;
  v30 = a1[6];
  v31 = a1[4];
  objc_msgSend(v9, "futureWithErrorOnlyHandlerAdapterBlock:", v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_29;
  v22[3] = &unk_1EA72CAC8;
  v23 = a1[4];
  v24 = v10;
  v25 = a1[6];
  v26 = a1[5];
  v27 = v3;
  v12 = v10;
  v13 = (id)objc_msgSend(v11, "addSuccessBlock:", v22);
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_34;
  v18[3] = &unk_1EA72CAF0;
  v19 = a1[6];
  v20 = a1[4];
  v21 = a1[5];
  v14 = (id)objc_msgSend(v11, "addFailureBlock:", v18);

LABEL_7:
LABEL_9:

}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessoryDidUpdateName:", *(_QWORD *)(a1 + 32));

}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_28(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "updateName:completionHandler:", *(_QWORD *)(a1 + 40), a2);
  HFLogForCategory(0x28uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v4;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Apply accessory %@ service %@ name %@ (same as accessory name)", (uint8_t *)&v7, 0x20u);
  }

}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_29(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_2_30;
  v8 = &unk_1EA72CAA0;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v2, "dispatchAccessoryObserverMessage:sender:", &v5, 0);

  HFLogForCategory(0x28uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Successfully applied primary service level name %@ to accessory", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", *(_QWORD *)(a1 + 64), v5, v6, v7, v8);
}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_2_30(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessory:didUpdateNameForService:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Unable to apply primary service level name: %@ to accessory %@ | %@", (uint8_t *)&v8, 0x20u);
  }

  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logError:operationDescription:", v3, CFSTR("HFAccessoryBuilder.updateName"));

  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
}

void __39__HFAccessoryBuilder__lazilyUpdateName__block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Request to update name finished with error: %@", (uint8_t *)&v6, 0xCu);
  }

  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logError:operationDescription:", v3, CFSTR("HFAccessoryBuilder.updateSingleServiceLikeAccessoryName"));

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
}

- (id)_lazilyUpdateRoom
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  -[HFAccessoryBuilder accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryBuilder room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  v10 = (void *)MEMORY[0x1E0D519C0];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__HFAccessoryBuilder__lazilyUpdateRoom__block_invoke;
    v13[3] = &unk_1EA729F18;
    v13[4] = self;
    v14 = v3;
    objc_msgSend(v10, "lazyFutureWithBlock:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __39__HFAccessoryBuilder__lazilyUpdateRoom__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  char v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "originalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {
    v8 = 1;
  }
  else if (v6)
  {
    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  HFLogForCategory(0x28uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "room");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_prettyDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "room");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_prettyDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v11;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Committing HFRoomBuilder to change room from %@ to %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "room");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAccessory:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "room");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commitItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __39__HFAccessoryBuilder__lazilyUpdateRoom__block_invoke_43;
  v19[3] = &unk_1EA72CB40;
  v21 = v8;
  v19[4] = *(_QWORD *)(a1 + 32);
  v20 = v3;
  v17 = v3;
  v18 = (id)objc_msgSend(v16, "addCompletionBlock:", v19);

}

void __39__HFAccessoryBuilder__lazilyUpdateRoom__block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Room builder commit finished with error: %@", (uint8_t *)&v9, 0xCu);
  }

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "originalName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setName:", v8);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v5, v6);

}

- (id)_lazilyUpdateValueForContextType:(unint64_t)a3
{
  _BOOL4 v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v20;
  int v21;
  _QWORD v22[6];
  char v23;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      v5 = -[HFAccessoryBuilder isFavorite](self, "isFavorite");
      goto LABEL_6;
    case 1uLL:
      NSLog(CFSTR("Include in status is not configured by HFAccessoryBuilder."), a2);
      goto LABEL_17;
    case 3uLL:
      v5 = -[HFAccessoryBuilder showInHomeDashboard](self, "showInHomeDashboard");
LABEL_6:
      v6 = v5;
      goto LABEL_7;
    default:
      v6 = 0;
LABEL_7:
      -[HFAccessoryBuilder accessory](self, "accessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessories");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAccessoryBuilder accessory](self, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "containsObject:", v10);

      if ((v11 & 1) == 0)
      {
        HFLogForCategory(0x28uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        *(_DWORD *)buf = 134217984;
        v25 = a3;
        v16 = "HFAccessoryBuilder: Not updating overall state for context type: %lu because accessory was removed from the home";
        v17 = v15;
        v18 = 12;
        goto LABEL_15;
      }
      -[HFAccessoryBuilder accessory](self, "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != objc_msgSend(v12, "hf_shouldBeOnForContextType:", a3))
      {
LABEL_11:

LABEL_12:
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke;
        v22[3] = &unk_1EA72CB90;
        v23 = v6;
        v22[4] = self;
        v22[5] = a3;
        objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        return v14;
      }
      -[HFAccessoryBuilder accessory](self, "accessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != objc_msgSend(v13, "hf_isOnForContextType:", a3))
      {

        goto LABEL_11;
      }
      -[HFAccessoryBuilder accessory](self, "accessory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "hf_hasSetForContextType:", a3);

      if (!v21)
        goto LABEL_12;
      HFLogForCategory(0x28uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v25 = a3;
        v26 = 1024;
        v27 = v6;
        v16 = "HFAccessoryBuilder: Not updating overall state for context type: %lu because it hasn't changed (state = %{BOOL}d)";
        v17 = v15;
        v18 = 18;
LABEL_15:
        _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
LABEL_16:

LABEL_17:
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      return v14;
  }
}

void __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 134218240;
    v35 = v5;
    v36 = 1024;
    LODWORD(v37) = v6;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Updating application data to set state for context type: %lu, currentState: %{BOOL}d", buf, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(unsigned __int8 *)(a1 + 48) == objc_msgSend(v7, "hf_isOnForContextType:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hf_shouldBeOnForContextType:", *(_QWORD *)(a1 + 40));
    v10 = *(unsigned __int8 *)(a1 + 48);

    if (v10 == v9)
    {
      HFLogForCategory(0x28uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        v13 = *(unsigned __int8 *)(a1 + 48);
        *(_DWORD *)buf = 134218240;
        v35 = v12;
        v36 = 1024;
        LODWORD(v37) = v13;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Skipping accessory state update for context type: %lu because it hasn't changed (state = %{BOOL}d)", buf, 0x12u);
      }
LABEL_17:

      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  else
  {

  }
  HFLogForCategory(0x28uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 134218240;
    v35 = v15;
    v36 = 1024;
    LODWORD(v37) = v16;
    _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Updating accessory state for context type: %lu, currentState: %{BOOL}d", buf, 0x12u);
  }

  v17 = objc_msgSend(*(id *)(a1 + 32), "skipPropagateFavoriteToServices");
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0)
    {
      HFLogForCategory(0x28uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "accessory");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v35 = v23;
        v36 = 2112;
        v37 = v24;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Skipping accessory state update for context type: %lu because accessory does not implement hf_updateValueForCurrentObjectOnly, which shouldn't be possible for %@", buf, 0x16u);

      }
      goto LABEL_17;
    }
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hf_updateValueForCurrentObjectOnly:forContextType:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v18, "hf_updateValue:forContextType:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v21;

LABEL_18:
  v25 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke_49;
  v32[3] = &unk_1EA72CB68;
  v32[4] = *(_QWORD *)(a1 + 32);
  v26 = v3;
  v33 = v26;
  v27 = (id)objc_msgSend(v22, "addSuccessBlock:", v32);
  v30[0] = v25;
  v30[1] = 3221225472;
  v30[2] = __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke_3;
  v30[3] = &unk_1EA726968;
  v31 = v26;
  v28 = v26;
  v29 = (id)objc_msgSend(v22, "addFailureBlock:", v30);

}

void __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke_2;
  v5[3] = &unk_1EA7263F0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "dispatchAccessoryObserverMessage:sender:", v5, 0);

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v3);
}

void __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryDidUpdateApplicationData:", v3);

  }
}

void __55__HFAccessoryBuilder__lazilyUpdateValueForContextType___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFAccessoryBuilder: Request to update application data for setting favorite finished with error: %@", (uint8_t *)&v6, 0xCu);
  }

  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logError:operationDescription:", v3, CFSTR("HFAccessoryBuilder.updateFavorite"));

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (HFRoomBuilder)room
{
  return self->room;
}

- (void)setRoom:(id)a3
{
  objc_storeStrong((id *)&self->room, a3);
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

- (BOOL)skipPropagateFavoriteToServices
{
  return self->_skipPropagateFavoriteToServices;
}

- (void)setSkipPropagateFavoriteToServices:(BOOL)a3
{
  self->_skipPropagateFavoriteToServices = a3;
}

- (HFNamingComponents)namingComponent
{
  return self->_namingComponent;
}

- (void)setNamingComponent:(id)a3
{
  objc_storeStrong((id *)&self->_namingComponent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namingComponent, 0);
  objc_storeStrong((id *)&self->room, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end
