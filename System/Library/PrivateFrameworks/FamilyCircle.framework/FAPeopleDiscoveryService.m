@implementation FAPeopleDiscoveryService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  return (id)sharedInstance_sharedInstance;
}

void __42__FAPeopleDiscoveryService_sharedInstance__block_invoke()
{
  FAPeopleDiscoveryService *v0;
  void *v1;

  v0 = objc_alloc_init(FAPeopleDiscoveryService);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (FAPeopleDiscoveryService)init
{
  FAPeopleDiscoveryService *v2;
  RPPeopleDiscovery *v3;
  RPPeopleDiscovery *peopleDiscovery;
  NSObject *v5;
  dispatch_queue_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FAPeopleDiscoveryService;
  v2 = -[FAPeopleDiscoveryService init](&v8, sel_init);
  if (v2)
  {
    v3 = (RPPeopleDiscovery *)objc_alloc_init(MEMORY[0x1E0D83948]);
    peopleDiscovery = v2->_peopleDiscovery;
    v2->_peopleDiscovery = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.family.peoplediscovery", v5);
    -[RPPeopleDiscovery setDispatchQueue:](v2->_peopleDiscovery, "setDispatchQueue:", v6);

    -[RPPeopleDiscovery setDiscoveryMode:](v2->_peopleDiscovery, "setDiscoveryMode:", 400);
    -[RPPeopleDiscovery setDiscoveryFlags:](v2->_peopleDiscovery, "setDiscoveryFlags:", 88);
    -[RPPeopleDiscovery setScanRate:](v2->_peopleDiscovery, "setScanRate:", 20);
    -[RPPeopleDiscovery setChangeFlags:](v2->_peopleDiscovery, "setChangeFlags:", 0xFFFFFFFFLL);
    -[RPPeopleDiscovery setPersonFoundHandler:](v2->_peopleDiscovery, "setPersonFoundHandler:", &__block_literal_global_4);
    -[RPPeopleDiscovery setPersonLostHandler:](v2->_peopleDiscovery, "setPersonLostHandler:", &__block_literal_global_6);
    -[RPPeopleDiscovery setPersonChangedHandler:](v2->_peopleDiscovery, "setPersonChangedHandler:", &__block_literal_global_9);
    -[RPPeopleDiscovery setInvalidationHandler:](v2->_peopleDiscovery, "setInvalidationHandler:", &__block_literal_global_12);
    -[RPPeopleDiscovery setInterruptionHandler:](v2->_peopleDiscovery, "setInterruptionHandler:", &__block_literal_global_14_0);
  }
  return v2;
}

void __32__FAPeopleDiscoveryService_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1CAEBA000, v3, OS_LOG_TYPE_DEFAULT, "Found new person: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __32__FAPeopleDiscoveryService_init__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1CAEBA000, v3, OS_LOG_TYPE_DEFAULT, "Lost person: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __32__FAPeopleDiscoveryService_init__block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1CAEBA000, v5, OS_LOG_TYPE_DEFAULT, "Changed person: %@, changes: %@", (uint8_t *)&v7, 0x16u);

  }
}

void __32__FAPeopleDiscoveryService_init__block_invoke_11()
{
  NSObject *v0;
  uint8_t v1[16];

  _FALogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1CAEBA000, v0, OS_LOG_TYPE_DEFAULT, "People discovery session invalidated", v1, 2u);
  }

}

void __32__FAPeopleDiscoveryService_init__block_invoke_13()
{
  NSObject *v0;
  uint8_t v1[16];

  _FALogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1CAEBA000, v0, OS_LOG_TYPE_DEFAULT, "People discovery session interrupted", v1, 2u);
  }

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAEBA000, v3, OS_LOG_TYPE_DEFAULT, "dealloc people discovery", buf, 2u);
  }

  -[RPPeopleDiscovery invalidate](self->_peopleDiscovery, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)FAPeopleDiscoveryService;
  -[FAPeopleDiscoveryService dealloc](&v4, sel_dealloc);
}

- (void)startMonitoringProximity
{
  -[RPPeopleDiscovery activateWithCompletion:](self->_peopleDiscovery, "activateWithCompletion:", &__block_literal_global_18);
}

void __52__FAPeopleDiscoveryService_startMonitoringProximity__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v8 = 138412290;
      v9 = v2;
      v5 = "Error activating people discovery: %@";
      v6 = v3;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_1CAEBA000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    v5 = "Activated people discovery";
    v6 = v3;
    v7 = 2;
    goto LABEL_6;
  }

}

- (void)stopMonitoringProximity
{
  NSObject *v3;
  uint8_t v4[16];

  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CAEBA000, v3, OS_LOG_TYPE_DEFAULT, "invalidating people discovery", v4, 2u);
  }

  -[RPPeopleDiscovery invalidate](self->_peopleDiscovery, "invalidate");
}

- (id)getNearbyPeople
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPPeopleDiscovery dispatchQueue](self->_peopleDiscovery, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__FAPeopleDiscoveryService_getNearbyPeople__block_invoke;
  v9[3] = &unk_1E85620D0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(v4, v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __43__FAPeopleDiscoveryService_getNearbyPeople__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "discoveredPeople");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "contactID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v4);
  }
  v8 = objc_msgSend(v2, "count");
  _FALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v20 = v2;
      v21 = 2112;
      v22 = v11;
      v12 = "Found nearby people: %@, nearbyContactIDs: %@";
      v13 = v9;
      v14 = 22;
LABEL_15:
      _os_log_impl(&dword_1CAEBA000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    v12 = "No nearby people to boost family suggestions";
    v13 = v9;
    v14 = 2;
    goto LABEL_15;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleDiscovery, 0);
}

@end
