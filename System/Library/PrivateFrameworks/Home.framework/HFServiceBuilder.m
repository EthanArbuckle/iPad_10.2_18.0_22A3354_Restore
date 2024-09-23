@implementation HFServiceBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFServiceBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  HFServiceBuilder *v9;
  HFServiceBuilder *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HFRoomBuilder *v17;
  void *v18;
  void *v19;
  void *v20;
  HFRoomBuilder *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceBuilder.m"), 40, CFSTR("%@ can only be used with existing HMServices"), objc_opt_class());

  }
  v31.receiver = self;
  v31.super_class = (Class)HFServiceBuilder;
  v9 = -[HFItemBuilder initWithExistingObject:inHome:](&v31, sel_initWithExistingObject_inHome_, v7, v8);
  v10 = v9;
  if (v9)
  {
    -[HFServiceBuilder service](v9, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFNamingComponents namingComponentFromService:](HFNamingComponents, "namingComponentFromService:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceBuilder setNamingComponent:](v10, "setNamingComponent:", v12);

    -[HFServiceBuilder originalName](v10, "originalName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceBuilder setName:](v10, "setName:", v13);

    -[HFServiceBuilder service](v10, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceBuilder setAccessoryName:](v10, "setAccessoryName:", v16);

    v17 = [HFRoomBuilder alloc];
    -[HFServiceBuilder service](v10, "service");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "room");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HFRoomBuilder initWithExistingObject:inHome:](v17, "initWithExistingObject:inHome:", v20, v8);
    -[HFServiceBuilder setRoom:](v10, "setRoom:", v21);

    -[HFServiceBuilder service](v10, "service");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "associatedServiceType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceBuilder setAssociatedServiceType:](v10, "setAssociatedServiceType:", v23);

    -[HFServiceBuilder service](v10, "service");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hf_iconDescriptor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceBuilder setIconDescriptor:](v10, "setIconDescriptor:", v25);

    -[HFServiceBuilder service](v10, "service");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceBuilder setShowInHomeDashboard:](v10, "setShowInHomeDashboard:", objc_msgSend(v26, "hf_effectiveShowInHomeDashboard"));

    -[HFServiceBuilder service](v10, "service");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceBuilder setIsFavorite:](v10, "setIsFavorite:", objc_msgSend(v27, "hf_effectiveIsFavorite"));

    -[HFServiceBuilder service](v10, "service");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceBuilder setConfigurationState:](v10, "setConfigurationState:", objc_msgSend(v28, "configurationState"));

  }
  return v10;
}

- (NSString)originalName
{
  void *v2;
  void *v3;

  -[HFServiceBuilder namingComponent](self, "namingComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAssociatedServiceType:(id)a3
{
  void *v3;
  NSString *v5;
  NSString *associatedServiceType;
  BOOL v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;

  v3 = a3;
  v5 = (NSString *)a3;
  associatedServiceType = self->_associatedServiceType;
  if (associatedServiceType != v5)
  {
    v13 = v5;
    v7 = -[NSString isEqualToString:](associatedServiceType, "isEqualToString:", v5);
    v5 = v13;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_associatedServiceType, v3);
      v8 = self->_associatedServiceType;
      v9 = v8;
      if (!v8)
      {
        -[HFServiceBuilder service](self, "service");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "serviceType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[HFServiceBuilder service](self, "service");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceSubtype");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFServiceIconFactory defaultIconDescriptorForServiceType:serviceSubtype:](HFServiceIconFactory, "defaultIconDescriptorForServiceType:serviceSubtype:", v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFServiceBuilder setIconDescriptor:](self, "setIconDescriptor:", v12);

      v5 = v13;
      if (!v8)
      {

        v5 = v13;
      }
    }
  }

}

- (id)accessories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFServiceBuilder service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)supportsFavoriting
{
  return 1;
}

- (NSArray)availableIconDescriptors
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HFServiceBuilder associatedServiceType](self, "associatedServiceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HFServiceBuilder service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_effectiveServiceType");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[HFServiceBuilder service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceSubtype");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconFactory allIconDescriptorsForServiceType:serviceSubtype:](HFServiceIconFactory, "allIconDescriptorsForServiceType:serviceSubtype:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
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
  -[HFServiceBuilder accessories](self, "accessories");
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
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Removing accessory from home: %@", buf, 0xCu);

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
  v18[2] = __38__HFServiceBuilder_removeItemFromHome__block_invoke;
  v18[3] = &unk_1EA72CA50;
  objc_copyWeak(&v20, (id *)buf);
  v11 = v5;
  v19 = v11;
  objc_msgSend(v3, "flatMap:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __38__HFServiceBuilder_removeItemFromHome__block_invoke_2;
  v16[3] = &unk_1EA72A050;
  v13 = v11;
  v17 = v13;
  objc_msgSend(v12, "recover:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

  return v14;
}

id __38__HFServiceBuilder_removeItemFromHome__block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to remove accessory from home completed successfully: %@", buf, 0xCu);

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __38__HFServiceBuilder_removeItemFromHome__block_invoke_10;
  v11 = &unk_1EA7277C8;
  v12 = WeakRetained;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", &v8, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __38__HFServiceBuilder_removeItemFromHome__block_invoke_10(uint64_t a1, void *a2)
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

id __38__HFServiceBuilder_removeItemFromHome__block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to remove accessory from home failed with error: %@, %@", buf, 0x16u);

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

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceBuilder service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HFServiceBuilder service](self, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("service"));

  }
  else
  {
    -[HFServiceBuilder name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("name"));
  }

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)_shouldUpdateNilNameWithRoomName
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[HFServiceBuilder name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  -[HFServiceBuilder service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "hf_isMediaAccessory")
    || (objc_msgSend(v6, "hf_isHomePod") & 1) != 0
    || objc_msgSend(v6, "hf_isAppleTV"))
  {
    v4 = objc_msgSend(v6, "hf_isTelevision");
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)_performValidation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HFItemBuilder lazy_verifyPropertyIsSet:](self, "lazy_verifyPropertyIsSet:", CFSTR("room"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chainFutures:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)commitItem
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  __CFString *v26;
  HFServiceBuilder *v27;
  _QWORD v28[7];
  _QWORD v29[2];
  uint8_t buf[4];
  HFServiceBuilder *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = self;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Starting commit (%@)", buf, 0xCu);
  }

  -[HFItemBuilder home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if ((v5 & 1) != 0)
  {
    -[HFServiceBuilder _lazilyUpdateValueForContextType:](self, "_lazilyUpdateValueForContextType:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v6;
    -[HFServiceBuilder _lazilyUpdateValueForContextType:](self, "_lazilyUpdateValueForContextType:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("HFOperationEditService");
    v9 = (void *)MEMORY[0x1E0D519C0];
    -[HFServiceBuilder _performValidation](self, "_performValidation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    -[HFServiceBuilder _lazilyUpdateName](self, "_lazilyUpdateName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v11;
    -[HFServiceBuilder _lazilyUpdateRoom](self, "_lazilyUpdateRoom");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v12;
    v28[3] = v22;
    -[HFServiceBuilder _lazilyUpdateAssociatedServiceType](self, "_lazilyUpdateAssociatedServiceType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v13;
    -[HFServiceBuilder _lazilyUpdateIcon](self, "_lazilyUpdateIcon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[5] = v14;
    -[HFServiceBuilder _lazilyUpdateConfigurationState](self, "_lazilyUpdateConfigurationState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[6] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chainFutures:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __30__HFServiceBuilder_commitItem__block_invoke;
    v25[3] = &unk_1EA726990;
    v26 = v8;
    v27 = self;
    objc_msgSend(v17, "recover:", v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __30__HFServiceBuilder_commitItem__block_invoke_2;
    v24[3] = &unk_1EA72CBB8;
    v24[4] = self;
    v19 = (id)objc_msgSend(v18, "addCompletionBlock:", v24);

  }
  else
  {
    HFLogForCategory(0x28uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Ignoring request to commit because the current user is not an administrator", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v18;
}

id __30__HFServiceBuilder_commitItem__block_invoke(uint64_t a1, void *a2)
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

void __30__HFServiceBuilder_commitItem__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x28uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Commit for %@ finished with error: %@", (uint8_t *)&v7, 0x16u);
  }

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
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[HFServiceBuilder _shouldUpdateNilNameWithRoomName](self, "_shouldUpdateNilNameWithRoomName"))
  {
    -[HFServiceBuilder room](self, "room");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceBuilder setName:](self, "setName:", v4);
  }
  else
  {
    -[HFServiceBuilder namingComponent](self, "namingComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceBuilder name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commitableNameForString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFServiceBuilder setName:](self, "setName:", v5);

  }
  -[HFServiceBuilder name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceBuilder originalName](self, "originalName");
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
      objc_initWeak((id *)buf, self);
      v15 = (void *)MEMORY[0x1E0D519C0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __37__HFServiceBuilder__lazilyUpdateName__block_invoke;
      v17[3] = &unk_1EA729F60;
      objc_copyWeak(&v18, (id *)buf);
      objc_msgSend(v15, "lazyFutureWithBlock:", v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
      return v16;
    }
    v11 = objc_msgSend(v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_13;
  }
  HFLogForCategory(0x28uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[HFServiceBuilder name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v13;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating name because it hasn't changed (%@)", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __37__HFServiceBuilder__lazilyUpdateName__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x28uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Updating name from \"%@\" to \"%@\", buf, 0x16u);

  }
  v10 = (void *)MEMORY[0x1E0D519C0];
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __37__HFServiceBuilder__lazilyUpdateName__block_invoke_28;
  v18[3] = &unk_1EA729F60;
  objc_copyWeak(&v19, v4);
  objc_msgSend(v10, "futureWithBlock:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __37__HFServiceBuilder__lazilyUpdateName__block_invoke_4;
  v16[3] = &unk_1EA72A0C8;
  v16[4] = WeakRetained;
  v13 = v3;
  v17 = v13;
  v14 = (id)objc_msgSend(v12, "addCompletionBlock:", v16);
  v15 = (id)objc_msgSend(v12, "addFailureBlock:", &__block_literal_global_190);

  objc_destroyWeak(&v19);
}

void __37__HFServiceBuilder__lazilyUpdateName__block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__HFServiceBuilder__lazilyUpdateName__block_invoke_2;
  v12[3] = &unk_1EA736F18;
  objc_copyWeak(&v15, v4);
  v10 = v3;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v8, "updateName:completionHandler:", v9, v12);

  objc_destroyWeak(&v15);
}

void __37__HFServiceBuilder__lazilyUpdateName__block_invoke_2(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v3)
  {
    objc_msgSend(a1[4], "finishWithError:", v3);
  }
  else if (objc_msgSend(a1[5], "hf_isSingleServiceLikeAccessory")
         && (objc_msgSend(WeakRetained, "service"),
             v5 = (void *)objc_claimAutoreleasedReturnValue(),
             v6 = objc_msgSend(v5, "hf_isChildService"),
             v5,
             (v6 & 1) == 0))
  {
    v7 = a1[5];
    objc_msgSend(WeakRetained, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__HFServiceBuilder__lazilyUpdateName__block_invoke_3;
    v9[3] = &unk_1EA726968;
    v10 = a1[4];
    objc_msgSend(v7, "updateName:completionHandler:", v8, v9);

  }
  else
  {
    objc_msgSend(a1[4], "finishWithNoResult");
  }

}

uint64_t __37__HFServiceBuilder__lazilyUpdateName__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

void __37__HFServiceBuilder__lazilyUpdateName__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to update name finished with error: %@", buf, 0xCu);
  }

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __37__HFServiceBuilder__lazilyUpdateName__block_invoke_31;
  v16[3] = &unk_1EA7263F0;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "dispatchAccessoryObserverMessage:sender:", v16, 0);

  objc_msgSend(*(id *)(a1 + 32), "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  v13 = v11;
  if (v12 == v13)
  {

  }
  else
  {
    v14 = v13;
    if (!v12)
    {

      goto LABEL_10;
    }
    v15 = objc_msgSend(v12, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "originalName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setName:", v10);
LABEL_10:

LABEL_11:
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v5, v6);

}

void __37__HFServiceBuilder__lazilyUpdateName__block_invoke_31(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory:didUpdateNameForService:", v4, v5);

  }
}

void __37__HFServiceBuilder__lazilyUpdateName__block_invoke_2_35(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFServiceBuilder.updateName"));

}

- (id)_lazilyUpdateValueForContextType:(unint64_t)a3
{
  _BOOL4 v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _QWORD v21[6];
  char v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      v5 = -[HFServiceBuilder isFavorite](self, "isFavorite");
      goto LABEL_6;
    case 1uLL:
      NSLog(CFSTR("Include in status is not configured by HFServiceBuilder."), a2);
      goto LABEL_13;
    case 3uLL:
      v5 = -[HFServiceBuilder showInHomeDashboard](self, "showInHomeDashboard");
LABEL_6:
      v6 = v5;
      goto LABEL_7;
    default:
      v6 = 0;
LABEL_7:
      -[HFServiceBuilder service](self, "service");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accessories");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFServiceBuilder service](self, "service");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "containsObject:", v12);

      if ((v13 & 1) == 0)
      {
        HFLogForCategory(0x28uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v24 = a3;
          _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating state for context type %lu because accessory was removed from the home", buf, 0xCu);
        }

        goto LABEL_13;
      }
      -[HFServiceBuilder service](self, "service");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == objc_msgSend(v14, "hf_isOnForContextType:", a3))
      {
        -[HFServiceBuilder service](self, "service");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "hf_hasSetForContextType:", a3);

        if (!v18)
          goto LABEL_18;
        HFLogForCategory(0x28uLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v24 = a3;
          v25 = 1024;
          v26 = v6;
          _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating state for context type %lu because it hasn't changed (currentState = %{BOOL}d)", buf, 0x12u);
        }

LABEL_13:
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        return v16;
      }

LABEL_18:
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke;
      v21[3] = &unk_1EA72CB90;
      v21[4] = self;
      v21[5] = a3;
      v22 = v6;
      objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      return v16;
  }
}

void __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, void *);
  void *v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    v37 = v5;
    v38 = 2112;
    v39 = v7;
    v40 = 2048;
    v41 = v8;
    v42 = 1024;
    v43 = v9;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Updating application data to set state for service %@, accessory: %@, context type %lu, currentState: %{BOOL}d)", buf, 0x26u);

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hf_isHomePod");

  if (!v13
    || (objc_msgSend(*(id *)(a1 + 32), "service"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "accessory"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "hf_hasSetForContextType:", *(_QWORD *)(a1 + 40)),
        v15,
        v14,
        v16))
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hf_updateValue:forContextType:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObject:", v18);
  }
  objc_msgSend(*(id *)(a1 + 32), "service");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accessory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "hf_showAsIndividualServices"))
    goto LABEL_11;
  objc_msgSend(*(id *)(a1 + 32), "service");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "hf_shouldBeOnForContextType:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "service");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "accessory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "accessory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hf_updateValue:forContextType:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObject:", v19);
LABEL_12:

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke_42;
  v33 = &unk_1EA72A0C8;
  v34 = *(_QWORD *)(a1 + 32);
  v35 = v3;
  v27 = v3;
  v28 = (id)objc_msgSend(v26, "addCompletionBlock:", &v30);
  v29 = (id)objc_msgSend(v26, "addFailureBlock:", &__block_literal_global_46_6, v30, v31, v32, v33, v34);

}

void __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to update application data for setting favorite finished with error: %@", buf, 0xCu);
  }

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke_43;
  v9[3] = &unk_1EA7263F0;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "dispatchAccessoryObserverMessage:sender:", v9, 0);

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, v5);
}

void __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke_43(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory:didUpdateApplicationDataForService:", v4, v5);

  }
}

void __53__HFServiceBuilder__lazilyUpdateValueForContextType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFServiceBuilder.updateFavorite"));

}

- (id)_lazilyUpdateRoom
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  HFServiceBuilder *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HFServiceBuilder service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceBuilder room](self, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if (v10)
  {
    HFLogForCategory(0x28uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HFServiceBuilder room](self, "room");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating room because it hasn't changed (%@)", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0D519C0];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __37__HFServiceBuilder__lazilyUpdateRoom__block_invoke;
    v20 = &unk_1EA729F18;
    v21 = self;
    v22 = v4;
    objc_msgSend(v14, "lazyFutureWithBlock:", &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v13, "addCompletionBlock:", &__block_literal_global_51_5, v17, v18, v19, v20, v21);

  }
  return v13;
}

void __37__HFServiceBuilder__lazilyUpdateRoom__block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Committing HFRoomBuilder to change room from %@ to %@", buf, 0x16u);

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
  v19[2] = __37__HFServiceBuilder__lazilyUpdateRoom__block_invoke_49;
  v19[3] = &unk_1EA72CB40;
  v21 = v8;
  v19[4] = *(_QWORD *)(a1 + 32);
  v20 = v3;
  v17 = v3;
  v18 = (id)objc_msgSend(v16, "addCompletionBlock:", v19);

}

void __37__HFServiceBuilder__lazilyUpdateRoom__block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "originalName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setName:", v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v7, v5);

}

void __37__HFServiceBuilder__lazilyUpdateRoom__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Room builder commit finished with error: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (id)_lazilyUpdateIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HFServiceBuilder service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_iconDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFServiceBuilder iconDescriptor](self, "iconDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    HFLogForCategory(0x28uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[HFServiceBuilder iconDescriptor](self, "iconDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating icon because it hasn't changed (%@)", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke;
    v15[3] = &unk_1EA728A78;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

void __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "iconDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Updating application data to set icon (%@)", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iconDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_updateIconDescriptor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke_52;
  v16[3] = &unk_1EA72A050;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "recover:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke_2;
  v14[3] = &unk_1EA72A0C8;
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v3;
  v12 = v3;
  v13 = (id)objc_msgSend(v11, "addCompletionBlock:", v14);

}

id __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(v3, "hf_isHMErrorWithCode:", 3) & 1) != 0
    || objc_msgSend(v3, "hf_isHFErrorWithCode:", 33))
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFServiceIconFactory defaultIconDescriptorForService:](HFServiceIconFactory, "defaultIconDescriptorForService:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_updateIconDescriptor:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logError:operationDescription:", v3, CFSTR("HFServiceBuilder.updateIcon"));

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "iconDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to update application data for setting icon (%@) finished with error: %@", buf, 0x16u);

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke_55;
  v11[3] = &unk_1EA7263F0;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v10, "dispatchAccessoryObserverMessage:sender:", v11, 0);

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, v5);
}

void __37__HFServiceBuilder__lazilyUpdateIcon__block_invoke_55(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory:didUpdateApplicationDataForService:", v4, v5);

  }
}

- (id)_lazilyUpdateAssociatedServiceType
{
  __CFString *v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  __CFString *v18;
  HFServiceBuilder *v19;
  uint8_t buf[4];
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HFServiceBuilder associatedServiceType](self, "associatedServiceType");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[HFServiceBuilder service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[__CFString isEqualToString:](v3, "isEqualToString:", v5);

  if (v6)
  {

    v3 = 0;
  }
  if (v3)
    v7 = v3;
  else
    v7 = &stru_1EA741FF8;
  -[HFServiceBuilder service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "associatedServiceType");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1EA741FF8;
  v12 = -[__CFString isEqualToString:](v7, "isEqualToString:", v11);

  if (v12)
  {
    HFLogForCategory(0x28uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v3;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating associated service type because it hasn't changed (%@)", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0D519C0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke;
    v17[3] = &unk_1EA729F18;
    v18 = v3;
    v19 = self;
    objc_msgSend(v15, "lazyFutureWithBlock:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

void __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke(int8x16_t *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  int8x16_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  int8x16_t v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[2].i64[0];
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Updating associated service type (%@)", buf, 0xCu);
  }

  v6 = (void *)MEMORY[0x1E0D519C0];
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_56;
  v20[3] = &unk_1EA728590;
  v15 = a1[2];
  v8 = (id)v15.i64[0];
  v21 = vextq_s8(v15, v15, 8uLL);
  objc_msgSend(v6, "futureWithErrorOnlyHandlerAdapterBlock:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "addFailureBlock:", &__block_literal_global_58_0);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_3;
  v16[3] = &unk_1EA726EF8;
  v11 = (id)a1[2].i64[0];
  v12 = a1[2].i64[1];
  v17 = v11;
  v18 = v12;
  v19 = v3;
  v13 = v3;
  v14 = (id)objc_msgSend(v9, "addCompletionBlock:", v16);

}

void __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_56(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateAssociatedServiceType:completionHandler:", *(_QWORD *)(a1 + 40), v4);

}

void __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFServiceBuilder.updateAssociatedServiceType"));

}

void __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to update associated service type (%@) finished with error: %@", buf, 0x16u);
  }

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_61;
  v10[3] = &unk_1EA7263F0;
  v10[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v9, "dispatchAccessoryObserverMessage:sender:", v10, 0);

  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:error:", v6, v5);
}

void __54__HFServiceBuilder__lazilyUpdateAssociatedServiceType__block_invoke_61(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory:didUpdateAssociatedServiceTypeForService:", v4, v5);

  }
}

- (id)_lazilyUpdateConfigurationState
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[HFServiceBuilder configurationState](self, "configurationState");
  -[HFServiceBuilder service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "configurationState");

  if (v3 == v5)
  {
    HFLogForCategory(0x28uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromConfigurationState(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Not updating configuration state because it hasn't changed (%@)", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke;
    v10[3] = &unk_1EA726388;
    v10[4] = self;
    v10[5] = v3;
    objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

void __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  _QWORD v15[6];

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_2;
  v15[3] = &unk_1EA728E58;
  v5 = *(_QWORD *)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v15[5] = v5;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "addFailureBlock:", &__block_literal_global_64_2);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_4;
  v12[3] = &unk_1EA72D0C0;
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v3;
  v14 = v8;
  v12[4] = v9;
  v10 = v3;
  v11 = (id)objc_msgSend(v6, "addCompletionBlock:", v12);

}

void __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateConfigurationState:completionHandler:", *(_QWORD *)(a1 + 40), v4);

}

void __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFServiceBuilder.updateConfigurationState"));

}

void __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromConfigurationState(*(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "HFServiceBuilder: Request to update configuration state (%@) finished with error: %@", buf, 0x16u);

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_67;
  v10[3] = &unk_1EA7263F0;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "dispatchAccessoryObserverMessage:sender:", v10, 0);

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, v5);
}

void __51__HFServiceBuilder__lazilyUpdateConfigurationState__block_invoke_67(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory:didUpdateConfigurationStateForService:", v4, v5);

  }
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

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_iconDescriptor, a3);
}

- (NSString)associatedServiceType
{
  return self->_associatedServiceType;
}

- (int64_t)configurationState
{
  return self->_configurationState;
}

- (void)setConfigurationState:(int64_t)a3
{
  self->_configurationState = a3;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_associatedServiceType, 0);
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->room, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end
