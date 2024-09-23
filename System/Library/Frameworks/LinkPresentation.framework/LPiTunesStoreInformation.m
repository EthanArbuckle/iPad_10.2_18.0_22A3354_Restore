@implementation LPiTunesStoreInformation

+ (id)shared
{
  void *v2;
  LPiTunesStoreInformation *v3;
  void *v4;

  v2 = (void *)shared_singleton;
  if (!shared_singleton)
  {
    v3 = objc_alloc_init(LPiTunesStoreInformation);
    v4 = (void *)shared_singleton;
    shared_singleton = (uint64_t)v3;

    v2 = (void *)shared_singleton;
  }
  return v2;
}

- (LPiTunesStoreInformation)init
{
  LPiTunesStoreInformation *v2;
  uint64_t v3;
  NSMapTable *changeHandlers;
  LPiTunesStoreInformation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LPiTunesStoreInformation;
  v2 = -[LPiTunesStoreInformation init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    changeHandlers = v2->_changeHandlers;
    v2->_changeHandlers = (NSMapTable *)v3;

    v2->_capabilities = 0;
    -[LPiTunesStoreInformation _setupCloudServiceController](v2, "_setupCloudServiceController");
    v5 = v2;
  }

  return v2;
}

- (void)_setupCloudServiceController
{
  NSObject *v3;
  _QWORD block[5];

  cloudServiceControllerQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke;
  block[3] = &unk_1E44A7CE8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v2 = (void *)getSKCloudServiceControllerClass_softClass;
  v19 = getSKCloudServiceControllerClass_softClass;
  v3 = MEMORY[0x1E0C809B0];
  if (!getSKCloudServiceControllerClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getSKCloudServiceControllerClass_block_invoke;
    v15[3] = &unk_1E44A7DB0;
    v15[4] = &v16;
    __getSKCloudServiceControllerClass_block_invoke((uint64_t)v15);
    v2 = (void *)v17[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v16, 8);
  v5 = objc_msgSend([v4 alloc], "init");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setAllowsPromptingForPrivacyAcknowledgement:", 0);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_2;
  v14[3] = &unk_1E44A8B50;
  v14[4] = v8;
  objc_msgSend(v9, "requestStorefrontIdentifierWithCompletionHandler:", v14);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 8);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_4;
  v13[3] = &unk_1E44A8BA0;
  v13[4] = v10;
  return objc_msgSend(v11, "requestCapabilitiesWithCompletionHandler:", v13);
}

void __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_3;
  v5[3] = &unk_1E44A7D10;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "_setStorefrontIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getSKStorefrontIdentifierDidChangeNotificationSymbolLoc_ptr;
  v11 = getSKStorefrontIdentifierDidChangeNotificationSymbolLoc_ptr;
  if (!getSKStorefrontIdentifierDidChangeNotificationSymbolLoc_ptr)
  {
    v5 = StoreKitLibrary();
    v4 = dlsym(v5, "SKStorefrontIdentifierDidChangeNotification");
    v9[3] = (uint64_t)v4;
    getSKStorefrontIdentifierDidChangeNotificationSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    objc_msgSend(v2, "addObserver:selector:name:object:", v3, sel__storefrontDidChangeNotification, *v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSNotificationName getSKStorefrontIdentifierDidChangeNotification(void)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("LPiTunesStoreInformation.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[8];

  if (!a3)
  {
    v5[6] = v3;
    v5[7] = v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_5;
    v5[3] = &unk_1E44A8B78;
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }
}

void __56__LPiTunesStoreInformation__setupCloudServiceController__block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "_setCapabilities:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getSKCloudServiceCapabilitiesDidChangeNotificationSymbolLoc_ptr;
  v11 = getSKCloudServiceCapabilitiesDidChangeNotificationSymbolLoc_ptr;
  if (!getSKCloudServiceCapabilitiesDidChangeNotificationSymbolLoc_ptr)
  {
    v5 = StoreKitLibrary();
    v4 = dlsym(v5, "SKCloudServiceCapabilitiesDidChangeNotification");
    v9[3] = (uint64_t)v4;
    getSKCloudServiceCapabilitiesDidChangeNotificationSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    objc_msgSend(v2, "addObserver:selector:name:object:", v3, sel__capabilitiesDidChangeNotification, *v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSNotificationName getSKCloudServiceCapabilitiesDidChangeNotification(void)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("LPiTunesStoreInformation.m"), 18, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (unint64_t)userStateForMediaStorefrontIdentifier:(id)a3
{
  id v4;
  NSString *storefrontIdentifier;
  unint64_t v6;

  v4 = a3;
  storefrontIdentifier = self->_storefrontIdentifier;
  if (storefrontIdentifier && self->_hasUpdatedCapabilities)
  {
    if (-[NSString isEqualToString:](storefrontIdentifier, "isEqualToString:", v4))
    {
      if ((self->_capabilities & 1) != 0)
        v6 = 1;
      else
        v6 = 2;
    }
    else
    {
      v6 = 4;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

+ (unint64_t)_convertCapabilities:(unint64_t)a3
{
  return a3 & 1;
}

- (void)_setCapabilities:(unint64_t)a3
{
  unint64_t v4;

  self->_hasUpdatedCapabilities = 1;
  v4 = objc_msgSend((id)objc_opt_class(), "_convertCapabilities:", a3);
  if (self->_capabilities != v4)
  {
    self->_capabilities = v4;
    -[LPiTunesStoreInformation _notifyChangeHandlers](self, "_notifyChangeHandlers");
  }
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

+ (id)_convertNewStorefrontIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") >= 6)
  {
    objc_msgSend(v3, "substringToIndex:", 6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_setStorefrontIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_convertNewStorefrontIdentifier:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](self->_storefrontIdentifier, "isEqualToString:", v4))
  {
    objc_storeStrong((id *)&self->_storefrontIdentifier, v4);
    -[LPiTunesStoreInformation _notifyChangeHandlers](self, "_notifyChangeHandlers");
  }

}

- (void)_capabilitiesDidChangeNotification
{
  NSObject *v3;
  _QWORD block[5];

  cloudServiceControllerQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__LPiTunesStoreInformation__capabilitiesDidChangeNotification__block_invoke;
  block[3] = &unk_1E44A7CE8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __62__LPiTunesStoreInformation__capabilitiesDidChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__LPiTunesStoreInformation__capabilitiesDidChangeNotification__block_invoke_2;
  v4[3] = &unk_1E44A8BA0;
  v4[4] = v1;
  return objc_msgSend(v2, "requestCapabilitiesWithCompletionHandler:", v4);
}

void __62__LPiTunesStoreInformation__capabilitiesDidChangeNotification__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[8];

  if (!a3)
  {
    v5[6] = v3;
    v5[7] = v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__LPiTunesStoreInformation__capabilitiesDidChangeNotification__block_invoke_3;
    v5[3] = &unk_1E44A8B78;
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }
}

uint64_t __62__LPiTunesStoreInformation__capabilitiesDidChangeNotification__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCapabilities:", *(_QWORD *)(a1 + 40));
}

- (void)_storefrontDidChangeNotification
{
  NSObject *v3;
  _QWORD block[5];

  cloudServiceControllerQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__LPiTunesStoreInformation__storefrontDidChangeNotification__block_invoke;
  block[3] = &unk_1E44A7CE8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __60__LPiTunesStoreInformation__storefrontDidChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__LPiTunesStoreInformation__storefrontDidChangeNotification__block_invoke_2;
  v4[3] = &unk_1E44A8B50;
  v4[4] = v1;
  return objc_msgSend(v2, "requestStorefrontIdentifierWithCompletionHandler:", v4);
}

void __60__LPiTunesStoreInformation__storefrontDidChangeNotification__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__LPiTunesStoreInformation__storefrontDidChangeNotification__block_invoke_3;
  v5[3] = &unk_1E44A7D10;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __60__LPiTunesStoreInformation__storefrontDidChangeNotification__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setStorefrontIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyChangeHandlers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[NSMapTable objectEnumerator](self->_changeHandlers, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)registerForStoreAvailablityChangesWithToken:(id)a3 handler:(id)a4
{
  NSMapTable *changeHandlers;
  id v6;
  id v7;

  changeHandlers = self->_changeHandlers;
  v6 = a3;
  v7 = _Block_copy(a4);
  -[NSMapTable setObject:forKey:](changeHandlers, "setObject:forKey:");

}

- (void)unregisterForStoreAvailablityChangesWithToken:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_changeHandlers, "removeObjectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_changeHandlers, 0);
  objc_storeStrong((id *)&self->_cloudServiceController, 0);
}

@end
