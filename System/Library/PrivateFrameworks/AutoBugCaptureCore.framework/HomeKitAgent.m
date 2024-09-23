@implementation HomeKitAgent

- (HomeKitAgent)initWithIDSService:(id)a3
{
  id v5;
  HomeKitAgent *v6;
  HomeKitAgent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HomeKitAgent;
  v6 = -[HomeKitAgent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_idsService, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  gHMHomeManagerClass = 0;
  if (gHomeKitDyLibHandle)
  {
    dlclose((void *)gHomeKitDyLibHandle);
    gHomeKitDyLibHandle = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)HomeKitAgent;
  -[HomeKitAgent dealloc](&v3, sel_dealloc);
}

+ (BOOL)_loadHomeKit
{
  if (_loadHomeKit_symbolLoadOnce != -1)
    dispatch_once(&_loadHomeKit_symbolLoadOnce, &__block_literal_global_9);
  return _loadHomeKit_symbolsLoaded;
}

void __28__HomeKitAgent__loadHomeKit__block_invoke()
{
  Class Class;
  BOOL v1;
  char v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  __int16 v7;

  gHomeKitDyLibHandle = (uint64_t)dlopen("/System/Library/Frameworks/HomeKit.framework/HomeKit", 6);
  if (!gHomeKitDyLibHandle)
  {
    xpcLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = 0;
      v4 = "Failed to load HomeKit.framework";
      v5 = (uint8_t *)&v6;
      goto LABEL_14;
    }
LABEL_15:

    return;
  }
  gHMHomeManagerClass = (uint64_t)objc_getClass("HMHomeManager");
  Class = objc_getClass("HMMutableHomeManagerConfiguration");
  gHMMutableHomeManagerConfigurationClass = (uint64_t)Class;
  if (gHMHomeManagerClass)
    v1 = Class == 0;
  else
    v1 = 1;
  v2 = !v1;
  _loadHomeKit_symbolsLoaded = v2;
  if (v1)
  {
    xpcLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = 0;
      v4 = "Failed to load HMHomeManager and/or HMHomeManagerConfiguration class from HomeKit.framework";
      v5 = (uint8_t *)&v7;
LABEL_14:
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_ERROR, v4, v5, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
}

- (void)fetchResidentDevicesIDSIdentifiersWithReply:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  HMHomeManager *v7;
  HMHomeManager *homeManager;
  id completionBlock;
  id v10;
  void *v11;
  id v12;
  id aBlock;

  aBlock = a3;
  v4 = +[HomeKitAgent _loadHomeKit](HomeKitAgent, "_loadHomeKit");
  v5 = aBlock;
  if (v4)
  {
    if (!self->_homeManager)
    {
      objc_msgSend((id)gHMMutableHomeManagerConfigurationClass, "defaultPrivateConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setOptions:", 2056);
      objc_msgSend(v6, "setCachePolicy:", 2);
      objc_msgSend(v6, "setDiscretionary:", 1);
      v7 = (HMHomeManager *)objc_msgSend(objc_alloc((Class)gHMHomeManagerClass), "initWithHomeMangerConfiguration:", v6);
      homeManager = self->_homeManager;
      self->_homeManager = v7;

      completionBlock = self->_completionBlock;
      if (completionBlock)
      {
        _Block_release(completionBlock);
        v10 = self->_completionBlock;
        self->_completionBlock = 0;

      }
      _Block_copy(aBlock);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self->_completionBlock;
      self->_completionBlock = v11;

      -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", self);
      goto LABEL_8;
    }
    v5 = aBlock;
    if (self->_didUpdateHomes)
    {
      -[HomeKitAgent _replyWithResidentDevicesIDSIdentifiers:](self, "_replyWithResidentDevicesIDSIdentifiers:", aBlock);
LABEL_8:
      v5 = aBlock;
    }
  }

}

- (void)_replyWithResidentDevicesIDSIdentifiers:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void (**v7)(id, id);
  _QWORD v8[5];
  id v9;

  v7 = (void (**)(id, id))a3;
  -[HMHomeManager homes](self->_homeManager, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__HomeKitAgent__replyWithResidentDevicesIDSIdentifiers___block_invoke;
  v8[3] = &unk_1EA3B5A10;
  v8[4] = self;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  if (v7)
    v7[2](v7, v6);

}

void __56__HomeKitAgent__replyWithResidentDevicesIDSIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeAccessControlForUser:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOwner");

  if (v6)
  {
    objc_msgSend(v3, "residentDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__HomeKitAgent__replyWithResidentDevicesIDSIdentifiers___block_invoke_2;
    v10[3] = &unk_1EA3B59E8;
    v8 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  }
  else
  {
    homekitLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_INFO, "User does not own this home : %@", buf, 0xCu);
    }

  }
}

void __56__HomeKitAgent__replyWithResidentDevicesIDSIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IDSDeviceForIDSService:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else
  {
    homekitLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "Failed to retrieve account ID from ResidentDevice %@ (%@)", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id completionBlock;

  self->_didUpdateHomes = 1;
  if (self->_completionBlock)
  {
    -[HomeKitAgent _replyWithResidentDevicesIDSIdentifiers:](self, "_replyWithResidentDevicesIDSIdentifiers:");
    _Block_release(self->_completionBlock);
    completionBlock = self->_completionBlock;
    self->_completionBlock = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end
