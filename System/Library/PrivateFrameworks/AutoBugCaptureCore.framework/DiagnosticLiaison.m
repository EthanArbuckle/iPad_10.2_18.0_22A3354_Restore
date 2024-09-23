@implementation DiagnosticLiaison

- (DiagnosticLiaison)init
{
  DiagnosticLiaison *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  void *v6;
  int v7;
  uint64_t v8;
  PrimaryInterfaceUtils *interfaceUtils;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DiagnosticLiaison;
  v2 = -[DiagnosticLiaison init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.symptoms.diagnostic_liaison", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_allowRemoteTrigger = 1;
    +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "deviceClass");

    if (v7 == 7)
      v2->_allowRemoteTrigger = 0;
    +[PrimaryInterfaceUtils sharedInstance](PrimaryInterfaceUtils, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    interfaceUtils = v2->_interfaceUtils;
    v2->_interfaceUtils = (PrimaryInterfaceUtils *)v8;

  }
  return v2;
}

- (void)dealloc
{
  IDSCrossDeviceTransport *idsTransport;
  HomeKitAgent *homeKitAgent;
  objc_super v5;

  -[DiagnosticLiaison unregisterAllTransportsSync](self, "unregisterAllTransportsSync");
  idsTransport = self->_idsTransport;
  self->_idsTransport = 0;

  homeKitAgent = self->_homeKitAgent;
  self->_homeKitAgent = 0;

  v5.receiver = self;
  v5.super_class = (Class)DiagnosticLiaison;
  -[DiagnosticLiaison dealloc](&v5, sel_dealloc);
}

- (id)homeKitAgent
{
  HomeKitAgent *homeKitAgent;
  void *v4;
  void *v5;
  NSObject *v6;
  HomeKitAgent *v7;
  HomeKitAgent *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  homeKitAgent = self->_homeKitAgent;
  if (!homeKitAgent)
  {
    -[DiagnosticLiaison idsTransport](self, "idsTransport");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idsService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    liaisonLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_INFO, "Creating HomeKitAgent with IDSService %@", (uint8_t *)&v10, 0xCu);
    }

    v7 = -[HomeKitAgent initWithIDSService:]([HomeKitAgent alloc], "initWithIDSService:", v5);
    v8 = self->_homeKitAgent;
    self->_homeKitAgent = v7;

    homeKitAgent = self->_homeKitAgent;
  }
  return homeKitAgent;
}

- (id)idsTransport
{
  IDSCrossDeviceTransport *v3;
  IDSCrossDeviceTransport *idsTransport;

  if (+[IDSCrossDeviceTransport isIDSEndpointEnabled](IDSCrossDeviceTransport, "isIDSEndpointEnabled")
    && !self->_idsTransport)
  {
    v3 = objc_alloc_init(IDSCrossDeviceTransport);
    idsTransport = self->_idsTransport;
    self->_idsTransport = v3;

  }
  return self->_idsTransport;
}

- (void)registerAdministrativeTransports
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *queue;
  _QWORD block[5];

  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "deviceClass") == 7)
  {
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "autoBugCaptureAvailable");

    if ((v6 & 1) != 0)
      goto LABEL_4;
  }
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "autoBugCaptureEnabled");

  if (v9)
  {
LABEL_4:
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__DiagnosticLiaison_registerAdministrativeTransports__block_invoke;
    block[3] = &unk_1EA3B4960;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

void __53__DiagnosticLiaison_registerAdministrativeTransports__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "idsTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "registerIDSService");
    objc_msgSend(v3, "addDelegate:endpoint:", *(_QWORD *)(a1 + 32), CFSTR("AutoBugCapture"));
    v2 = v3;
  }

}

- (void)registerAutoBugCaptureTransports:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__DiagnosticLiaison_registerAutoBugCaptureTransports___block_invoke;
  v7[3] = &unk_1EA3B4988;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __54__DiagnosticLiaison_registerAutoBugCaptureTransports___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "idsTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    liaisonLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "Registering with IDS service", v5, 2u);
    }

    objc_msgSend(v2, "registerIDSService");
    objc_msgSend(v2, "addDelegate:endpoint:", *(_QWORD *)(a1 + 32), CFSTR("HomeKit"));
    objc_msgSend(v2, "addDelegate:endpoint:", *(_QWORD *)(a1 + 32), CFSTR("Trigger"));
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

- (void)unregisterAllTransportsSync
{
  IDSCrossDeviceTransport *idsTransport;
  IDSCrossDeviceTransport *v4;
  NSObject *v5;
  uint8_t v6[16];

  idsTransport = self->_idsTransport;
  if (idsTransport)
  {
    v4 = idsTransport;
    -[IDSCrossDeviceTransport removeDelegate:endpoint:](v4, "removeDelegate:endpoint:", self, CFSTR("AutoBugCapture"));
    -[IDSCrossDeviceTransport removeDelegate:endpoint:](v4, "removeDelegate:endpoint:", self, CFSTR("HomeKit"));
    -[IDSCrossDeviceTransport removeDelegate:endpoint:](v4, "removeDelegate:endpoint:", self, CFSTR("Trigger"));
    -[IDSCrossDeviceTransport unregisterIDSService](v4, "unregisterIDSService");

    liaisonLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "Unregistered with IDS service", v6, 2u);
    }

  }
}

- (void)unregisterAllTransports:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__DiagnosticLiaison_unregisterAllTransports___block_invoke;
  v7[3] = &unk_1EA3B4988;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __45__DiagnosticLiaison_unregisterAllTransports___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "unregisterAllTransportsSync");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)caseSignatureForRemoteSignature:(id)a3 groupIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("groupID"));

  return v7;
}

- (void)startRemotelyTriggeredSessionForSignature:(id)a3 groupIdentifier:(id)a4 events:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[DiagnosticLiaison caseSignatureForRemoteSignature:groupIdentifier:](self, "caseSignatureForRemoteSignature:groupIdentifier:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  liaisonLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "Ready to start remotely triggered case", (uint8_t *)&v13, 2u);
  }

  -[DiagnosticLiaison delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    liaisonLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEFAULT, "Starting a remotely triggered case with signature: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(v11, "requestSnapshotWithSignature:flags:events:", v9, 3, v8);
  }

}

- (void)remotelyTriggerSessionWithSignature:(id)a3 forDestinations:(id)a4 groupIdentifier:(id)a5 validFor:(double)a6 queue:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  DiagnosticLiaison *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  double v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("remoteTrigger"), CFSTR("type"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("IDSTransportSend"), CFSTR("name"));
  queue = self->_queue;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke;
  v27[3] = &unk_1EA3B4A00;
  v28 = v15;
  v29 = self;
  v30 = v19;
  v31 = v14;
  v35 = a6;
  v33 = v17;
  v34 = v18;
  v32 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v16;
  v24 = v14;
  v25 = v19;
  v26 = v15;
  dispatch_async(queue, v27);

}

void __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "idsTransport");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v3, CFSTR("count"));

    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", CFSTR("Trigger"), CFSTR("endpoint"));
    objc_msgSend(*(id *)(a1 + 40), "remoteCasePayloadForIDSTransport:groupID:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(double *)(a1 + 88);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke_2;
    v11[3] = &unk_1EA3B49D8;
    v14 = *(id *)(a1 + 80);
    v12 = *(id *)(a1 + 72);
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v2, "sendMessage:toIDSDevices:toEndpoint:validFor:reply:", v4, v5, CFSTR("Trigger"), v11, v6);

  }
  else
  {
    if (!*(_QWORD *)(a1 + 80))
      return;
    v7 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke_18;
    block[3] = &unk_1EA3B4988;
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 80);
    dispatch_async(v7, block);

    v2 = v9;
  }

}

void __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v7 = a3;
  v8 = a4;
  if (*(_QWORD *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke_3;
    block[3] = &unk_1EA3B49B0;
    v9 = *(NSObject **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v15 = a2;
    v12 = v7;
    v13 = v8;
    v14 = *(id *)(a1 + 48);
    dispatch_async(v9, block);

  }
}

uint64_t __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("timestamp"));

  v5 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("In Progress"), CFSTR("status"));
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("IDSMessageIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("IDSMessageIdentifier"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("failure"), CFSTR("result"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("Finished"), CFSTR("status"));
    if (*(_QWORD *)(a1 + 48))
    {
      liaisonLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 48);
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "Failed to send remote IDS trigger message with error %@", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("errorObj"));
      objc_msgSend(*(id *)(a1 + 48), "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("error"));

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  liaisonLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "No IDS destinations to send remote trigger.", v7, 2u);
  }

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("timestamp"));

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("failure"), CFSTR("result"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("Cancelled"), CFSTR("status"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("No valid destinations"), CFSTR("error"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)remotelyTriggerSessionForSignature:(id)a3 groupIdentifier:(id)a4 event:(id)a5 queue:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *queue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (a5)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a5);
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("remoteTrigger"), CFSTR("type"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("failure"), CFSTR("result"));
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSince1970");
  objc_msgSend(v17, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("timestamp"));

  queue = self->_queue;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke;
  v26[3] = &unk_1EA3B4AA0;
  v26[4] = self;
  v27 = v16;
  v28 = v12;
  v29 = v13;
  v30 = v14;
  v31 = v15;
  v21 = v14;
  v22 = v13;
  v23 = v12;
  v24 = v15;
  v25 = v16;
  dispatch_async(queue, v26);

}

void __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke(id *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  const __CFString *v22;
  id v23;
  void (**v24)(id, _QWORD, id);
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD block[4];
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!*((_BYTE *)a1[4] + 8))
  {
    +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "deviceClass");

    liaisonLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v42) = v16;
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEFAULT, "Remotely triggering sessions is not supported on this device (%d)", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported device class (%d)"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v18, CFSTR("error"));

    goto LABEL_22;
  }
  if (!objc_msgSend(a1[6], "count"))
  {
    liaisonLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = a1[6];
      *(_DWORD *)buf = 138412290;
      v42 = v20;
      _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_ERROR, "Remote trigger requested for a case, but a valid signature was not provided. %@", buf, 0xCu);
    }

    v21 = a1[5];
    v22 = CFSTR("Empty Signature");
    goto LABEL_21;
  }
  v2 = objc_msgSend(a1[7], "length");
  liaisonLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v23 = a1[6];
      *(_DWORD *)buf = 138412290;
      v42 = v23;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_ERROR, "Remote trigger requested for a case, but a valid group identifier was not provided. %@", buf, 0xCu);
    }

    v21 = a1[5];
    v22 = CFSTR("Missing group identifier");
LABEL_21:
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("error"));
LABEL_22:
    v24 = (void (**)(id, _QWORD, id))a1[9];
    if (v24)
      v24[2](v24, 0, a1[5]);
    return;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v6 = a1[6];
    v5 = a1[7];
    *(_DWORD *)buf = 138412546;
    v42 = v5;
    v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEBUG, "Remotely triggering a session for group identifier %@ and signature %@", buf, 0x16u);
  }

  objc_msgSend(a1[6], "objectForKeyedSubscript:", CFSTR("domain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("HomeKit"));

  if (v8)
  {
    objc_msgSend(*((id *)a1[4] + 5), "idsService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      liaisonLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = a1[6];
        *(_DWORD *)buf = 138412290;
        v42 = v11;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "Cannot use IDS transport for signature %@", buf, 0xCu);
      }

      objc_msgSend(a1[5], "setObject:forKeyedSubscript:", CFSTR("remoteTrigger"), CFSTR("type"));
      objc_msgSend(a1[5], "setObject:forKeyedSubscript:", CFSTR("IDS transport not ready"), CFSTR("error"));
      v12 = a1[9];
      if (v12)
      {
        v13 = a1[8];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_32;
        block[3] = &unk_1EA3B4A28;
        v40 = v12;
        v39 = a1[5];
        dispatch_async(v13, block);

        v14 = v40;
LABEL_28:

      }
    }
    else
    {
      objc_msgSend(a1[4], "remoteCasePayloadForIDSTransport:groupID:", a1[6], a1[7]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      liaisonLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v30, OS_LOG_TYPE_INFO, "Selecting IDS transport for HomeKit cases", buf, 2u);
      }

      v31 = a1[4];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_33;
      v35[3] = &unk_1EA3B4A78;
      v37 = a1[9];
      v36 = a1[8];
      objc_msgSend(v31, "sendPayloadToHomeKitRelays:additionalPredicate:toEndpoint:reply:", v29, 0, CFSTR("HomeKit"), v35);

    }
  }
  else
  {
    liaisonLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = a1[6];
      *(_DWORD *)buf = 138412290;
      v42 = v26;
      _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_ERROR, "Unable to determine appropriate transport for signature %@", buf, 0xCu);
    }

    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", CFSTR("No appropriate transport for signature"), CFSTR("error"));
    v27 = a1[9];
    if (v27)
    {
      v28 = a1[8];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_37;
      v32[3] = &unk_1EA3B4A28;
      v34 = v27;
      v33 = a1[5];
      dispatch_async(v28, v32);

      v14 = v34;
      goto LABEL_28;
    }
  }
}

uint64_t __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_33(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_2;
    block[3] = &unk_1EA3B4A50;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)sendPayloadToHomeKitRelays:(id)a3 additionalPredicate:(id)a4 toEndpoint:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *homekitRelayTimer;
  uint64_t v15;
  dispatch_time_t v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_time_t v22;
  OS_dispatch_source *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD handler[5];
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!self->_allowRemoteTrigger)
  {
    liaisonLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = objc_msgSend(v18, "deviceClass");
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEFAULT, "Sending remote ABC messages are not supported on this device (%d)", buf, 8u);

    }
    goto LABEL_14;
  }
  if (!objc_msgSend(v12, "length"))
  {
    liaisonLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Missing or invalid endpoint";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!v10 || !objc_msgSend(v10, "count"))
  {
    liaisonLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Missing required message payload";
LABEL_13:
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_ERROR, v19, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  self->_homekitRelayTimedOut = 0;
  homekitRelayTimer = self->_homekitRelayTimer;
  v15 = MEMORY[0x1E0C809B0];
  if (homekitRelayTimer)
  {
    v16 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(homekitRelayTimer, v16, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }
  else
  {
    -[DiagnosticLiaison queue](self, "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v20);

    v22 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
    handler[0] = v15;
    handler[1] = 3221225472;
    handler[2] = __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke;
    handler[3] = &unk_1EA3B4AC8;
    handler[4] = self;
    v33 = v12;
    v34 = v13;
    dispatch_source_set_event_handler(v21, handler);
    v23 = self->_homekitRelayTimer;
    self->_homekitRelayTimer = (OS_dispatch_source *)v21;
    v24 = v21;

    dispatch_resume(v24);
  }
  liaisonLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v11;
    _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_INFO, "Looking up IDS identifiers for HomeKit relay devices (additional predicate: %@)", buf, 0xCu);
  }

  -[DiagnosticLiaison homeKitAgent](self, "homeKitAgent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke_40;
  v27[3] = &unk_1EA3B4B40;
  v27[4] = self;
  v28 = v11;
  v29 = v10;
  v30 = v12;
  v31 = v13;
  objc_msgSend(v26, "fetchResidentDevicesIDSIdentifiersWithReply:", v27);

LABEL_15:
}

uint64_t __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t result;
  uint8_t v6[16];

  v2 = a1[4];
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  *(_BYTE *)(a1[4] + 24) = 1;
  liaisonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_ERROR, "Timed out waiting for all resident devices IDS Identifiers", v6, 2u);
  }

  objc_msgSend(0, "setObject:forKeyedSubscript:", CFSTR("remoteTrigger"), CFSTR("type"));
  objc_msgSend(0, "setObject:forKeyedSubscript:", a1[5], CFSTR("endpoint"));
  objc_msgSend(0, "setObject:forKeyedSubscript:", CFSTR("failure"), CFSTR("result"));
  objc_msgSend(0, "setObject:forKeyedSubscript:", CFSTR("Timed out looking up HomeKit relay IDS Identifiers"), CFSTR("error"));
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  dispatch_source_t *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v3 = a2;
  v4 = *(dispatch_source_t **)(a1 + 32);
  if (v4[2])
  {
    dispatch_source_cancel(v4[2]);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

    v4 = *(dispatch_source_t **)(a1 + 32);
  }
  -[dispatch_source_t queue](v4, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke_2;
  v11[3] = &unk_1EA3B4B18;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v12 = v3;
  v13 = v8;
  v14 = v9;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  v10 = v3;
  dispatch_async(v7, v11);

}

void __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[2];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  liaisonLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v23 = v3;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_DEBUG, "All IDS identifiers = %@", buf, 0xCu);
  }

  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24))
  {
    liaisonLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v5 = "Relay service reply came in after timeout. Dropping";
      v6 = v4;
      v7 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_1DBAE1000, v6, v7, v5, buf, 2u);
    }
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      liaisonLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      v5 = "No IDS identifiers for HomeKit relay devices found.";
      v6 = v4;
      v7 = OS_LOG_TYPE_INFO;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uniqueID IN %@"), *(_QWORD *)(a1 + 32));
    v8 = objc_claimAutoreleasedReturnValue();
    v4 = v8;
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3528];
      v21[0] = v8;
      v21[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = v8;
    }
    objc_msgSend(*(id *)(a1 + 40), "idsTransport");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 64);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke_46;
    v16[3] = &unk_1EA3B4AF0;
    v17 = *(id *)(a1 + 32);
    v18 = *(id *)(a1 + 56);
    v20 = *(id *)(a1 + 72);
    v19 = *(id *)(a1 + 64);
    objc_msgSend(v13, "sendMessage:toIDSDevicesMatching:toEndpoint:reply:", v14, v12, v15, v16);

  }
LABEL_14:

}

void __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke_46(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  __CFString **v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  liaisonLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v8, "unsignedLongValue");
      v12 = objc_msgSend(*(id *)(a1 + 32), "count");
      v21 = 134218240;
      v22 = v11;
      v23 = 2048;
      v24 = v12;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "Successfully sent payload to %ld device(s) (%lu total HomeKit relay devices)", (uint8_t *)&v21, 0x16u);
    }

    liaisonLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v21 = 138412290;
      v22 = v14;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "Message payload: %@", (uint8_t *)&v21, 0xCu);
    }

    v15 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(v8, "unsignedLongValue");
      v17 = objc_msgSend(*(id *)(a1 + 32), "count");
      v21 = 134218498;
      v22 = v16;
      v23 = 2048;
      v24 = v17;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "Failed to send payload to %ld devices(s) (%lu total HomeKit relay devices): %@", (uint8_t *)&v21, 0x20u);
    }

    liaisonLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(_QWORD *)(a1 + 40);
      v21 = 138412290;
      v22 = v19;
      _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEBUG, "Message payload: %@", (uint8_t *)&v21, 0xCu);
    }

    if (v7)
    {
      objc_msgSend(v7, "localizedDescription");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = CFSTR("No matching IDS devices.");
    }
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(0, "setObject:forKeyedSubscript:", CFSTR("remoteTrigger"), CFSTR("type"));
    objc_msgSend(0, "setObject:forKeyedSubscript:", CFSTR("IDSTransportSend"), CFSTR("name"));
    objc_msgSend(0, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("endpoint"));
    v20 = kSymptomDiagnosticEventResultSuccess;
    if (!a2)
      v20 = kSymptomDiagnosticEventResultFailure;
    objc_msgSend(0, "setObject:forKeyedSubscript:", *v20, CFSTR("result"));
    objc_msgSend(0, "setObject:forKeyedSubscript:", v8, CFSTR("count"));
    objc_msgSend(0, "setObject:forKeyedSubscript:", v15, CFSTR("error"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)remotelyEnableAutoBugCapture:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_allowRemoteTrigger)
  {
    -[DiagnosticLiaison idsTransport](self, "idsTransport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[DiagnosticLiaison abcPayloadForIDSTransport:](self, "abcPayloadForIDSTransport:", 1);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modelIdentifier BEGINSWITH 'AudioAccessory'"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__DiagnosticLiaison_remotelyEnableAutoBugCapture___block_invoke;
      v9[3] = &unk_1EA3B4B68;
      v10 = v4;
      -[DiagnosticLiaison sendPayloadToHomeKitRelays:additionalPredicate:toEndpoint:reply:](self, "sendPayloadToHomeKitRelays:additionalPredicate:toEndpoint:reply:", v6, v7, CFSTR("AutoBugCapture"), v9);

    }
    else
    {
      liaisonLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "IDS transport is not available. Cannot remotely enable ABC.", buf, 2u);
      }
    }
  }
  else
  {
    liaisonLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      v12 = objc_msgSend(v8, "deviceClass");
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "Sending remote ABC toggle is not supported on this device (%d)", buf, 8u);

    }
  }

}

uint64_t __50__DiagnosticLiaison_remotelyEnableAutoBugCapture___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if (a2)
  {
    v2 = result;
    liaisonLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "Success in sending remote ABC enable toggle", v4, 2u);
    }

    result = *(_QWORD *)(v2 + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)remotelyDisableAutoBugCapture:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_allowRemoteTrigger)
  {
    -[DiagnosticLiaison idsTransport](self, "idsTransport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[DiagnosticLiaison abcPayloadForIDSTransport:](self, "abcPayloadForIDSTransport:", 0);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("modelIdentifier BEGINSWITH 'AudioAccessory'"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __51__DiagnosticLiaison_remotelyDisableAutoBugCapture___block_invoke;
      v9[3] = &unk_1EA3B4B68;
      v10 = v4;
      -[DiagnosticLiaison sendPayloadToHomeKitRelays:additionalPredicate:toEndpoint:reply:](self, "sendPayloadToHomeKitRelays:additionalPredicate:toEndpoint:reply:", v6, v7, CFSTR("AutoBugCapture"), v9);

    }
    else
    {
      liaisonLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "IDS transport is not available. Cannot remotely disable ABC.", buf, 2u);
      }
    }
  }
  else
  {
    liaisonLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      v12 = objc_msgSend(v8, "deviceClass");
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "sending remote ABC toggle is not supported on this device (%d)", buf, 8u);

    }
  }

}

uint64_t __51__DiagnosticLiaison_remotelyDisableAutoBugCapture___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if (a2)
  {
    v2 = result;
    liaisonLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "Success in sending remote ABC enable toggle", v4, 2u);
    }

    result = *(_QWORD *)(v2 + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)residentDevicesIDSIdentifiersWithReply:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[DiagnosticLiaison homeKitAgent](self, "homeKitAgent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__DiagnosticLiaison_residentDevicesIDSIdentifiersWithReply___block_invoke;
    v6[3] = &unk_1EA3B4B90;
    v7 = v4;
    objc_msgSend(v5, "fetchResidentDevicesIDSIdentifiersWithReply:", v6);

  }
}

uint64_t __60__DiagnosticLiaison_residentDevicesIDSIdentifiersWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)messageReceivedFromIDS:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  liaisonLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "Received message from IDS transport: %@", buf, 0xCu);
  }

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__DiagnosticLiaison_messageReceivedFromIDS___block_invoke;
    block[3] = &unk_1EA3B4BB8;
    block[4] = self;
    v10 = v4;
    v11 = v6;
    v8 = v6;
    dispatch_async(queue, block);

  }
}

uint64_t __44__DiagnosticLiaison_messageReceivedFromIDS___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processPayloadFromIDSTransport:incomingTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)messageWithIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  __CFString **v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v15 = a3;
  v8 = a5;
  -[DiagnosticLiaison delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("remoteTrigger"), CFSTR("type"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("IDSTransportSend"), CFSTR("name"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("Finished"), CFSTR("status"));
    v11 = kSymptomDiagnosticEventResultSuccess;
    if (!v6)
      v11 = kSymptomDiagnosticEventResultFailure;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", *v11, CFSTR("result"));
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    objc_msgSend(v12, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("timestamp"));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("IDSMessageIdentifier"));
    if (v8)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("errorObj"));
    objc_msgSend(v9, "remoteTriggerDeliveryUpdateEvent:", v10);

  }
}

- (void)messageWithIdentifierHasBeenDelivered:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[DiagnosticLiaison delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("remoteTrigger"), CFSTR("type"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("IDSTransportDelivered"), CFSTR("name"));
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("timestamp"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("IDSMessageIdentifier"));
    objc_msgSend(v4, "remoteTriggerDeliveryUpdateEvent:", v5);

  }
}

- (id)basicSignatureFrom:(id)a3
{
  id v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("domain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("domain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("domain"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("type"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtype"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtype"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("subtype"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("additional"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("additional"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("additional"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("detected"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("detected"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("detected"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("effective"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("effective"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("effective"));

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("threshval"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("threshval"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("threshval"));

  }
  return v4;
}

- (id)remoteCasePayloadForIDSTransport:(id)a3 groupID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  uint8_t v13[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("remoteCase"), CFSTR("type"));
    -[DiagnosticLiaison basicSignatureFrom:](self, "basicSignatureFrom:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("sig"));

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("gid"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("time"));

    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1EA3CFA50, CFSTR("vers"));
  }
  else
  {
    liaisonLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "IDS payload requires a signature dictionary and group identifier.", v13, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)abcPayloadForIDSTransport:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("AutoBugCapture"), CFSTR("type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("UserConsent"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("time"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA3CFA50, CFSTR("vers"));
  return v4;
}

- (void)processPayloadFromIDSTransport:(id)a3 incomingTime:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("vers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "isEqual:", &unk_1EA3CFA68))
  {
    -[DiagnosticLiaison processPayloadVersionOneFromIDSTransport:incomingTime:](self, "processPayloadVersionOneFromIDSTransport:incomingTime:", v8, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "isEqual:", &unk_1EA3CFA50))
      -[DiagnosticLiaison processPayloadVersionTwoFromIDSTransport:incomingTime:](self, "processPayloadVersionTwoFromIDSTransport:incomingTime:", v8, v6);
  }

}

- (void)processPayloadVersionOneFromIDSTransport:(id)a3 incomingTime:(id)a4
{
  __CFString *v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  NSObject *v15;
  _BOOL4 v16;
  objc_class *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  NSObject *v21;
  _BOOL4 v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  const __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("sig"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    liaisonLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v10)
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v40 = v7;
        v41 = 2112;
        v42 = v12;
        v43 = 2112;
        v44 = CFSTR("sig");
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_INFO, "Found unexpected object %@ (%@) for key %@ in IDS payload.", buf, 0x20u);

      }
    }
    else if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v40 = CFSTR("sig");
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_INFO, "Missing object for key %@ in IDS payload.", buf, 0xCu);
    }

    v8 = 0;
  }
  -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("time"));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;
  }
  else
  {
    liaisonLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v16)
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v40 = v13;
        v41 = 2112;
        v42 = v18;
        v43 = 2112;
        v44 = CFSTR("time");
        _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_INFO, "Found unexpected object %@ (%@) for key %@ in IDS payload.", buf, 0x20u);

      }
    }
    else if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v40 = CFSTR("sig");
      _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_INFO, "Missing object for key %@ in IDS payload.", buf, 0xCu);
    }

    v14 = 0;
  }
  -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("gid"));
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v19;
    if (!v14)
      goto LABEL_31;
  }
  else
  {
    liaisonLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v19)
    {
      if (v22)
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v40 = v19;
        v41 = 2112;
        v42 = v24;
        v43 = 2112;
        v44 = CFSTR("gid");
        _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_INFO, "Found unexpected object %@ (%@) for key %@ in IDS payload.", buf, 0x20u);

      }
    }
    else if (v22)
    {
      *(_DWORD *)buf = 138412290;
      v40 = CFSTR("gid");
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_INFO, "Missing object for key %@ in IDS payload.", buf, 0xCu);
    }

    v20 = 0;
    if (!v14)
      goto LABEL_31;
  }
  if (-[__CFString count](v8, "count") && -[__CFString length](v20, "length"))
  {
    v32 = v7;
    v37[0] = CFSTR("type");
    v37[1] = CFSTR("name");
    v38[0] = CFSTR("remoteTrigger");
    v38[1] = CFSTR("IDSTransportSend");
    v37[2] = CFSTR("timestamp");
    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[__CFString timeIntervalSince1970](v14, "timeIntervalSince1970");
    objc_msgSend(v25, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v27 = objc_claimAutoreleasedReturnValue();

    v35[0] = CFSTR("type");
    v35[1] = CFSTR("name");
    v36[0] = CFSTR("remoteTrigger");
    v36[1] = CFSTR("IDSTransportReceive");
    v35[2] = CFSTR("timestamp");
    v28 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v28, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = v27;
    v34[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticLiaison startRemotelyTriggeredSessionForSignature:groupIdentifier:events:](self, "startRemotelyTriggeredSessionForSignature:groupIdentifier:events:", v8, v20, v31);

    v7 = v32;
    goto LABEL_33;
  }
LABEL_31:
  liaisonLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v5;
    _os_log_impl(&dword_1DBAE1000, v27, OS_LOG_TYPE_ERROR, "Received a cross device trigger message over IDS that was malformed: %@", buf, 0xCu);
  }
LABEL_33:

}

- (void)processPayloadVersionTwoFromIDSTransport:(id)a3 incomingTime:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v15;
  NSObject *v16;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_13;
  if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("remoteCase")))
  {
    -[DiagnosticLiaison processPayloadVersionOneFromIDSTransport:incomingTime:](self, "processPayloadVersionOneFromIDSTransport:incomingTime:", v6, v7);
    goto LABEL_16;
  }
  if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("AutoBugCapture")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UserConsent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    liaisonLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = CFSTR("NO");
      if (v11)
        v13 = CFSTR("YES");
      v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "Received an ABC IDS message with UserConsent = %@", (uint8_t *)&v17, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (v11)
      v15 = CFSTR("com.apple.autobugcapture.UserConsentYES");
    else
      v15 = CFSTR("com.apple.autobugcapture.UserConsentNO");
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v15, 0, 0, 4u);
  }
  else
  {
LABEL_13:
    liaisonLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v9;
      _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_ERROR, "Received an IDS message with unknown type: %@", (uint8_t *)&v17, 0xCu);
    }

  }
LABEL_16:

}

- (void)checkForUIImpactScenarioForCase:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFData *Data;
  const __CFData *v21;
  int v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PrimaryInterfaceUtils interfaceBecamePrimaryDate](self->_interfaceUtils, "interfaceBecamePrimaryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[PrimaryInterfaceUtils primaryInterfaceType](self->_interfaceUtils, "primaryInterfaceType") == 1)
    {
      objc_msgSend(v5, "timeIntervalSinceNow");
      if (v6 > -180.0)
      {
        v7 = -v6;
        liaisonLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v22 = 134217984;
          v23 = v7;
          _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "UIPerformance case seen within TH Period (%f since primary interface change)", (uint8_t *)&v22, 0xCu);
        }

        symptom_framework_init();
        symptom_new();
        symptom_set_qualifier();
        -[PrimaryInterfaceUtils primaryInterfaceType](self->_interfaceUtils, "primaryInterfaceType");
        symptom_set_qualifier();
        objc_msgSend(v4, "signature");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("detected"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_retainAutorelease(v10);
        v12 = (const char *)objc_msgSend(v11, "UTF8String");
        if (v12)
        {
          strlen(v12);
          symptom_set_additional_qualifier();
        }
        objc_msgSend(v4, "signature");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("subtype"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_retainAutorelease(v14);
        v16 = (const char *)objc_msgSend(v15, "UTF8String");
        if (v16)
        {
          strlen(v16);
          symptom_set_additional_qualifier();
        }
        objc_msgSend(v4, "deParametersFromPayloads");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("com.apple.DiagnosticExtensions.tailspin"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "count"))
          {
            Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v18, kCFPropertyListXMLFormat_v1_0, 0, 0);
            if (Data)
            {
              v21 = Data;
              CFDataGetLength(Data);
              CFDataGetBytePtr(v21);
              symptom_set_additional_qualifier();
              CFRelease(v21);
            }
          }

        }
        symptom_send();

      }
    }
  }

}

- (DiagnosticLiaisonDelegate)delegate
{
  return (DiagnosticLiaisonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (id)interruptionHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interfaceUtils, 0);
  objc_storeStrong((id *)&self->_idsTransport, 0);
  objc_storeStrong((id *)&self->_homeKitAgent, 0);
  objc_storeStrong((id *)&self->_homekitRelayTimer, 0);
}

@end
