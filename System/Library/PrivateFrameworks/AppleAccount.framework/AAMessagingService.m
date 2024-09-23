@implementation AAMessagingService

+ (id)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_22);
  return (id)sharedService_sharedService;
}

void __35__AAMessagingService_sharedService__block_invoke()
{
  AAMessagingService *v0;
  void *v1;

  v0 = -[AAMessagingService initWithServiceName:]([AAMessagingService alloc], "initWithServiceName:", CFSTR("com.apple.private.alloy.accounts.representative"));
  v1 = (void *)sharedService_sharedService;
  sharedService_sharedService = (uint64_t)v0;

}

- (AAMessagingService)initWithServiceName:(id)a3
{
  id v4;
  AAMessagingService *v5;
  uint64_t v6;
  NSString *serviceName;
  uint64_t v8;
  IDSService *service;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  id v12;
  uint64_t v13;
  IDSIDQueryController *queryController;
  dispatch_queue_t v15;
  OS_dispatch_queue *incomingMessageQueue;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AAMessagingService;
  v5 = -[AAMessagingService init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    v8 = objc_msgSend(objc_alloc((Class)getIDSServiceClass()), "initWithService:", v5->_serviceName);
    service = v5->_service;
    v5->_service = (IDSService *)v8;

    v10 = dispatch_queue_create("com.apple.AAMessaging", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc_init((Class)getIDSServiceDelegatePropertiesClass());
    objc_msgSend(v12, "setWantsCrossAccountMessaging:", 1);
    -[IDSService addDelegate:withDelegateProperties:queue:](v5->_service, "addDelegate:withDelegateProperties:queue:", v5, v12, v5->_queue);
    objc_msgSend(getIDSIDQueryControllerClass(), "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    queryController = v5->_queryController;
    v5->_queryController = (IDSIDQueryController *)v13;

    v15 = dispatch_queue_create("com.apple.appleaccount.incomingMessageProcessing", 0);
    incomingMessageQueue = v5->_incomingMessageQueue;
    v5->_incomingMessageQueue = (OS_dispatch_queue *)v15;

    v5->_lock._os_unfair_lock_opaque = 0;
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v4;
      _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "Created AAMessagingService: %@", buf, 0xCu);
    }

  }
  return v5;
}

- (void)partitionByCapability:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__AAMessagingService_partitionByCapability_completion___block_invoke;
  v13[3] = &unk_1E41703B0;
  v14 = v9;
  v15 = v6;
  v11 = v6;
  v12 = v9;
  -[AAMessagingService _getCurrentRemoteDevices:completion:](self, "_getCurrentRemoteDevices:completion:", v10, v13);

}

void __55__AAMessagingService_partitionByCapability_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __55__AAMessagingService_partitionByCapability_completion___block_invoke_cold_1((uint64_t)v7, (uint64_t)v8, v9);

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __55__AAMessagingService_partitionByCapability_completion___block_invoke_25;
    v18 = &unk_1E4170388;
    v19 = v10;
    v20 = *(id *)(a1 + 32);
    v11 = v10;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v15);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy", v15, v16, v17, v18);
    (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v12 + 16))(v12, 1, v13, 0);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AAMessagingErrorDomain"), 3, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v14 + 16))(v14, 0, 0, v11);
  }

}

void __55__AAMessagingService_partitionByCapability_completion___block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AAMessagingService_partitionByCapability_completion___block_invoke_2;
  v5[3] = &unk_1E4170360;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v5);

}

void __55__AAMessagingService_partitionByCapability_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;
  AAMessagingCapability *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "valueForCapability:", CFSTR("IDSRegistrationPropertySupportsCustodian")) == 1;

  v5 = -[AAMessagingCapability initWithCapabilityType:]([AAMessagingCapability alloc], "initWithCapabilityType:", v4);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "integerValue") + 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &unk_1E41A69D8, *(_QWORD *)(a1 + 32));
  }
}

- (void)fetchCapability:(id)a3 destinations:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__AAMessagingService_fetchCapability_destinations_completion___block_invoke;
  v12[3] = &unk_1E41703B0;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[AAMessagingService _getCurrentRemoteDevices:completion:](self, "_getCurrentRemoteDevices:completion:", a4, v12);

}

void __62__AAMessagingService_fetchCapability_destinations_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__AAMessagingService_fetchCapability_destinations_completion___block_invoke_2;
    v12[3] = &unk_1E4170388;
    v13 = *(id *)(a1 + 32);
    v6 = v5;
    v14 = v6;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v12);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = (void *)objc_msgSend(v6, "copy");
    (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v7 + 16))(v7, 1, v8, 0);

    v9 = v13;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AAMessagingErrorDomain"), 3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, v9);
  }

}

void __62__AAMessagingService_fetchCapability_destinations_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a2;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __62__AAMessagingService_fetchCapability_destinations_completion___block_invoke_3;
  v11 = &unk_1E41703D8;
  v12 = *(id *)(a1 + 32);
  v13 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v15 + 24), v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v5);

  _Block_object_dispose(&v14, 8);
}

void __62__AAMessagingService_fetchCapability_destinations_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "capabilityString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "valueForCapability:", v7);

  if (v8 == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)doDestinations:(id)a3 haveIneligibleDeviceForCapability:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__AAMessagingService_doDestinations_haveIneligibleDeviceForCapability_completion___block_invoke;
  v12[3] = &unk_1E41703B0;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[AAMessagingService _getCurrentRemoteDevices:completion:](self, "_getCurrentRemoteDevices:completion:", a3, v12);

}

void __82__AAMessagingService_doDestinations_haveIneligibleDeviceForCapability_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__AAMessagingService_doDestinations_haveIneligibleDeviceForCapability_completion___block_invoke_2;
    v12[3] = &unk_1E4170388;
    v13 = *(id *)(a1 + 32);
    v6 = v5;
    v14 = v6;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v12);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = (void *)objc_msgSend(v6, "copy");
    (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v7 + 16))(v7, 1, v8, 0);

    v9 = v13;
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AAMessagingErrorDomain"), 3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, v9);
  }

}

void __82__AAMessagingService_doDestinations_haveIneligibleDeviceForCapability_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a2;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __82__AAMessagingService_doDestinations_haveIneligibleDeviceForCapability_completion___block_invoke_3;
  v11 = &unk_1E41703D8;
  v12 = *(id *)(a1 + 32);
  v13 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v15 + 24), v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v5);

  _Block_object_dispose(&v14, 8);
}

void __82__AAMessagingService_doDestinations_haveIneligibleDeviceForCapability_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "capabilityString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "valueForCapability:", v7);

  if (v8 != 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)_getCurrentRemoteDevices:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSString *serviceName;
  IDSIDQueryController *queryController;
  OS_dispatch_queue *queue;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  objc_msgSend(a3, "aaf_map:", &__block_literal_global_34);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queryController = self->_queryController;
  serviceName = self->_serviceName;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__AAMessagingService__getCurrentRemoteDevices_completion___block_invoke_2;
  v12[3] = &unk_1E4170468;
  v13 = v6;
  v11 = v6;
  -[IDSIDQueryController currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:](queryController, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:", v7, serviceName, serviceName, queue, v12);

}

uint64_t __58__AAMessagingService__getCurrentRemoteDevices_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "destination");
}

void __58__AAMessagingService__getCurrentRemoteDevices_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a2;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__AAMessagingService__getCurrentRemoteDevices_completion___block_invoke_3;
    v9[3] = &unk_1E4170440;
    v10 = v3;
    v4 = v3;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)objc_msgSend(v4, "copy");
    (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v5 + 16))(v5, 1, v6, 0);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AAMessagingErrorDomain"), 3, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v7 + 16))(v7, 0, 0, v4);
  }

}

void __58__AAMessagingService__getCurrentRemoteDevices_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  AAMessagingDestination *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[AAMessagingDestination initWithHandle:]([AAMessagingDestination alloc], "initWithHandle:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);
}

- (id)_optionsDictionaryWithResponseIdentifier:(id)a3 fireAndForget:(BOOL)a4 requiredCapabilities:(id)a5 lackingCapabilities:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v7 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E0C99E08];
  v13 = a3;
  v14 = objc_alloc_init(v12);
  if (!v13)
  {
    getIDSSendMessageOptionExpectsPeerResponseKey();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v15);

  }
  getIDSSendMessageOptionPeerResponseIdentifierKey();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v16);

  if (v7)
  {
    getIDSSendMessageOptionFireAndForgetKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v17);

  }
  if (objc_msgSend(v10, "count"))
  {
    -[AAMessagingService _createNewCapabilitySetFrom:](self, "_createNewCapabilitySetFrom:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    getIDSSendMessageOptionRequireAllRegistrationPropertiesKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, v19);

  }
  if (objc_msgSend(v11, "count"))
  {
    -[AAMessagingService _createNewCapabilitySetFrom:](self, "_createNewCapabilitySetFrom:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKey();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, v21);

  }
  v22 = (void *)objc_msgSend(v14, "copy");

  return v22;
}

- (id)sendMessage:(id)a3 destinations:(id)a4 responseIdentifier:(id)a5 fireAndForget:(BOOL)a6 requiredCapabilities:(id)a7 lackingCapabilities:(id)a8 error:(id *)a9
{
  _BOOL8 v11;
  id v15;
  id v16;
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  __CFString *v24;
  __CFString *v25;
  NSObject *v26;
  _BOOL4 v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  IDSService *service;
  int v32;
  id v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  __CFString *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v11 = a6;
  v49 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = (objc_class *)MEMORY[0x1E0C99E20];
  v18 = a8;
  v19 = a7;
  v20 = a4;
  v21 = objc_alloc_init(v17);
  -[AAMessagingService _optionsDictionaryWithResponseIdentifier:fireAndForget:requiredCapabilities:lackingCapabilities:](self, "_optionsDictionaryWithResponseIdentifier:fireAndForget:requiredCapabilities:lackingCapabilities:", v16, v11, v19, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __127__AAMessagingService_sendMessage_destinations_responseIdentifier_fireAndForget_requiredCapabilities_lackingCapabilities_error___block_invoke;
  v39[3] = &unk_1E4170490;
  v23 = v21;
  v40 = v23;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v39);

  v24 = CFSTR("message");
  if (v11)
    v24 = CFSTR("fire-and-forget message");
  v25 = v24;
  _AALogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (!v27)
      goto LABEL_9;
    *(_DWORD *)buf = 138413058;
    v42 = v25;
    v43 = 2112;
    v44 = v15;
    v45 = 2112;
    v46 = v23;
    v47 = 2112;
    v48 = v16;
    v28 = "Sending %@: %@ to %@ in response to %@";
    v29 = v26;
    v30 = 42;
  }
  else
  {
    if (!v27)
      goto LABEL_9;
    *(_DWORD *)buf = 138412802;
    v42 = v25;
    v43 = 2112;
    v44 = v15;
    v45 = 2112;
    v46 = v23;
    v28 = "Sending %@: %@ to %@";
    v29 = v26;
    v30 = 32;
  }
  _os_log_impl(&dword_19EACA000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
LABEL_9:

  service = self->_service;
  v38 = 0;
  v32 = -[IDSService sendData:toDestinations:priority:options:identifier:error:](service, "sendData:toDestinations:priority:options:identifier:error:", v15, v23, 300, v22, &v38, a9);
  v33 = v38;
  _AALogSystem();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG);
  if (v32)
  {
    if (v35)
      -[AAMessagingService sendMessage:destinations:responseIdentifier:fireAndForget:requiredCapabilities:lackingCapabilities:error:].cold.1();
  }
  else if (v35)
  {
    -[AAMessagingService sendMessage:destinations:responseIdentifier:fireAndForget:requiredCapabilities:lackingCapabilities:error:].cold.2();
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v36 = (void *)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "initWithUUIDString:", v33);

  return v36;
}

void __127__AAMessagingService_sendMessage_destinations_responseIdentifier_fireAndForget_requiredCapabilities_lackingCapabilities_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "destinationURI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "destinationURI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)setCustodianDelegate:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_custodianDelegate);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAMessagingService.m"), 242, CFSTR("Custodian delegate already set!"));

  }
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Setting custodian delegate %@", (uint8_t *)&v11, 0xCu);
  }

  if (v5)
  {
    objc_storeWeak((id *)&self->_custodianDelegate, v5);
    -[AAMessagingService _processPendingIDSMessagesOfType:](self, "_processPendingIDSMessagesOfType:", 0);
  }
  else
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AAMessagingService setCustodianDelegate:].cold.1();

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)setInheritanceDelegate:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_inheritanceDelegate);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAMessagingService.m"), 258, CFSTR("Inheritance delegate already set!"));

  }
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Setting inheritance delegate %@", (uint8_t *)&v11, 0xCu);
  }

  if (v5)
  {
    objc_storeWeak((id *)&self->_inheritanceDelegate, v5);
    -[AAMessagingService _processPendingIDSMessagesOfType:](self, "_processPendingIDSMessagesOfType:", 1);
  }
  else
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AAMessagingService setInheritanceDelegate:].cold.1();

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)_addMessageToPendingInheritanceMessages:(id)a3
{
  NSMutableArray *pendingInheritanceMessages;
  id v4;
  NSMutableArray *v5;
  objc_class *v7;
  id v8;
  NSMutableArray *v9;
  NSMutableArray *v10;

  pendingInheritanceMessages = self->_pendingInheritanceMessages;
  if (pendingInheritanceMessages)
  {
    v4 = a3;
    v5 = pendingInheritanceMessages;
  }
  else
  {
    v7 = (objc_class *)MEMORY[0x1E0C99DE8];
    v8 = a3;
    v9 = (NSMutableArray *)objc_alloc_init(v7);
    v10 = self->_pendingInheritanceMessages;
    self->_pendingInheritanceMessages = v9;

    v5 = self->_pendingInheritanceMessages;
    v4 = v8;
  }
  -[NSMutableArray addObject:](v5, "addObject:", v4);

}

- (void)_addMessageToPendingCustodianMessages:(id)a3
{
  NSMutableArray *pendingCustodianMessages;
  id v4;
  NSMutableArray *v5;
  objc_class *v7;
  id v8;
  NSMutableArray *v9;
  NSMutableArray *v10;

  pendingCustodianMessages = self->_pendingCustodianMessages;
  if (pendingCustodianMessages)
  {
    v4 = a3;
    v5 = pendingCustodianMessages;
  }
  else
  {
    v7 = (objc_class *)MEMORY[0x1E0C99DE8];
    v8 = a3;
    v9 = (NSMutableArray *)objc_alloc_init(v7);
    v10 = self->_pendingCustodianMessages;
    self->_pendingCustodianMessages = v9;

    v5 = self->_pendingCustodianMessages;
    v4 = v8;
  }
  -[NSMutableArray addObject:](v5, "addObject:", v4);

}

- (void)_processPendingIDSMessagesOfType:(int64_t)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint8_t v29[128];
  uint8_t buf[4];
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    v5 = 80;
  else
    v5 = 72;
  v6 = *(id *)((char *)&self->super.isa + v5);
  v7 = (void *)objc_msgSend(*(id *)((char *)&self->super.isa + v5), "copy");
  v8 = objc_msgSend(v7, "count");
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134217984;
      v31 = a3;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Processing pending messages of type %ld", buf, 0xCu);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          -[AAMessagingService _processMessage:](self, "_processMessage:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v13);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v11;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v9);
          objc_msgSend(v6, "removeObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), (_QWORD)v20);
        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v17);
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 134217984;
    v31 = a3;
    _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "No messages of type %ld for the delegate to process.", buf, 0xCu);
  }

}

- (void)_processMessage:(id)a3
{
  id v4;
  NSObject *incomingMessageQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  incomingMessageQueue = self->_incomingMessageQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AAMessagingService__processMessage___block_invoke;
  block[3] = &unk_1E41704B8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(incomingMessageQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__AAMessagingService__processMessage___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "type"))
      v3 = WeakRetained + 7;
    else
      v3 = WeakRetained + 8;
    v5 = objc_loadWeakRetained(v3);
    objc_msgSend(*(id *)(a1 + 32), "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "senderHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageService:didReceiveMessage:fromID:", WeakRetained, v6, v7);

  }
  else
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __38__AAMessagingService__processMessage___block_invoke_cold_1();

  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id WeakRetained;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  _AALogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "fromID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v22;
    _os_log_debug_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEBUG, "AAMessagingService: received data %@ from %@ and context %@. Calling delegates", (uint8_t *)&v23, 0x20u);

  }
  v14 = -[AAPendingIDSMessage initInheritanceMessageFrom:data:]([AAPendingIDSMessage alloc], "initInheritanceMessageFrom:data:", v11, v10);
  v15 = -[AAPendingIDSMessage initCustodianMessageFrom:data:]([AAPendingIDSMessage alloc], "initCustodianMessageFrom:data:", v11, v10);
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_inheritanceDelegate);

  _AALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (WeakRetained)
  {
    if (v18)
      -[AAMessagingService service:account:incomingData:fromID:context:].cold.4();

    -[AAMessagingService _processMessage:](self, "_processMessage:", v14);
  }
  else
  {
    if (v18)
      -[AAMessagingService service:account:incomingData:fromID:context:].cold.3();

    -[AAMessagingService _addMessageToPendingInheritanceMessages:](self, "_addMessageToPendingInheritanceMessages:", v14);
  }
  v19 = objc_loadWeakRetained((id *)&self->_custodianDelegate);

  _AALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21)
      -[AAMessagingService service:account:incomingData:fromID:context:].cold.2();

    -[AAMessagingService _processMessage:](self, "_processMessage:", v15);
  }
  else
  {
    if (v21)
      -[AAMessagingService service:account:incomingData:fromID:context:].cold.1();

    -[AAMessagingService _addMessageToPendingCustodianMessages:](self, "_addMessageToPendingCustodianMessages:", v15);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL8 v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v10 = a6;
  v24 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a7;
  v13 = a8;
  _AALogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v11;
    v18 = 2112;
    v19 = v15;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "Did send message %@ success %@ error %@ context %@", (uint8_t *)&v16, 0x2Au);

  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "activeAccountsChanged: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "devicesChanged: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (id)_createNewCapabilitySetFrom:(id)a3
{
  return (id)objc_msgSend(a3, "aaf_map:", &__block_literal_global_54);
}

uint64_t __50__AAMessagingService__createNewCapabilitySetFrom___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "capabilityString");
}

- (AAMessagingServiceDelegate)inheritanceDelegate
{
  return (AAMessagingServiceDelegate *)objc_loadWeakRetained((id *)&self->_inheritanceDelegate);
}

- (AAMessagingServiceDelegate)custodianDelegate
{
  return (AAMessagingServiceDelegate *)objc_loadWeakRetained((id *)&self->_custodianDelegate);
}

- (NSMutableArray)pendingCustodianMessages
{
  return self->_pendingCustodianMessages;
}

- (NSMutableArray)pendingInheritanceMessages
{
  return self->_pendingInheritanceMessages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInheritanceMessages, 0);
  objc_storeStrong((id *)&self->_pendingCustodianMessages, 0);
  objc_destroyWeak((id *)&self->_custodianDelegate);
  objc_destroyWeak((id *)&self->_inheritanceDelegate);
  objc_storeStrong((id *)&self->_incomingMessageQueue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

void __55__AAMessagingService_partitionByCapability_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_19EACA000, a2, a3, "Results of _getCurrentRemoteDevices: %@, error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendMessage:destinations:responseIdentifier:fireAndForget:requiredCapabilities:lackingCapabilities:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_19EACA000, v0, v1, "Request to send message with uuid %@ error %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)sendMessage:destinations:responseIdentifier:fireAndForget:requiredCapabilities:lackingCapabilities:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_19EACA000, v0, v1, "Failed to send with uuid %@ error %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)setCustodianDelegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Attempted to add nil custodian delegate to the messaging service.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setInheritanceDelegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Attempted to add nil inheritance delegate to the messaging service.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__AAMessagingService__processMessage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "MessagingService lost strong ref processing message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:account:incomingData:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, v0, v1, "AAMessagingService: Delegate not available for custodian. Adding to message queue.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:account:incomingData:fromID:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, v0, v1, "AAMessagingService: Delegate available for custodian. Processing message.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:account:incomingData:fromID:context:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, v0, v1, "AAMessagingService: Delegate not available for inheritance. Adding to message queue.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:account:incomingData:fromID:context:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, v0, v1, "AAMessagingService: Delegate available for inheritance. Processing message.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
