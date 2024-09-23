@implementation DAManager

+ (BOOL)isSupported
{
  DAManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v2 = objc_alloc_init(DAManager);
  -[DAManager establishXpcConnection](v2);
  -[DAManager clearXPCHandlers](v2);
  -[DAManager connection](v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __24__DAManager_isSupported__block_invoke_2;
  v12[3] = &unk_24C327AD8;
  v12[4] = &v13;
  objc_msgSend(v4, "isSupported:", v12);

  if (v2)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager releaseConnection]", 256, &stru_24C3287B0, v5, v6, v7, v8, v11);
    -[NSXPCConnection invalidate](v2->_clientConnection, "invalidate");
  }
  v9 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __24__DAManager_isSupported__block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"+[DAManager isSupported]_block_invoke_2", 85, CFSTR("%@"), a5, a6, a7, a8, a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"+[DAManager isSupported]_block_invoke_2", 88, CFSTR("%d"), a5, a6, a7, a8, a3);
}

- (void)establishXpcConnection
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (v1[2])
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager establishXpcConnection]", 269, CFSTR("DAKeyManager: XPC connection already established"), v2, v3, v4, v5, v17);
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x24BDD1988]);
      v7 = v1[3];
      v8 = objc_msgSend(v6, "initWithMachServiceName:options:", v7, 4096);
      v9 = v1[2];
      v1[2] = (id)v8;

      +[KmlManagerInterface interface](KmlManagerInterface, "interface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1[2], "setRemoteObjectInterface:", v10);

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254615CD0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1[2], "setExportedInterface:", v11);

      objc_msgSend(v1[2], "setExportedObject:", v1);
      objc_initWeak(&location, v1);
      v12 = MEMORY[0x24BDAC760];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __35__DAManager_establishXpcConnection__block_invoke;
      v20[3] = &unk_24C327A68;
      objc_copyWeak(&v21, &location);
      objc_msgSend(v1[2], "setInterruptionHandler:", v20);
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __35__DAManager_establishXpcConnection__block_invoke_2;
      v18[3] = &unk_24C327A68;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v1[2], "setInvalidationHandler:", v18);
      objc_msgSend(v1[2], "resume");
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager establishXpcConnection]", 302, CFSTR("XPC Connection created"), v13, v14, v15, v16, v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
}

- (DAManager)init
{
  DAManager *v2;
  NSMutableSet *v3;
  NSMutableSet *activeSessions;
  NSString *serviceName;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DAManager;
  v2 = -[DAManager init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    activeSessions = v2->_activeSessions;
    v2->_activeSessions = v3;

    serviceName = v2->_serviceName;
    v2->_serviceName = (NSString *)CFSTR("com.apple.seserviced.kmlXpcService");

  }
  return v2;
}

+ (id)createHydraKey:(id)a3 seid:(id)a4 serverParameters:(id)a5 outError:(id *)a6
{
  void *v6;
  DAKeyInformation *v7;

  SESEndPointCreateForHydraWithSession();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[DAKeyInformation initWithEndpoint:]([DAKeyInformation alloc], "initWithEndpoint:", v6);
  else
    v7 = 0;

  return v7;
}

+ (id)getHydraEncryptionCert:(id)a3 session:(id)a4 seid:(id)a5 outError:(id *)a6
{
  return (id)SESEndPointCreateEncryptionKeyWithSession();
}

+ (BOOL)updateHydraKey:(id)a3 session:(id)a4 seid:(id)a5 encryptedSEData:(id)a6 outError:(id *)a7
{
  return SESEndPointUpdateHydraMailboxes();
}

- (void)setServiceName:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  return (id)sharedManager__keyManager;
}

void __26__DAManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager__keyManager;
  sharedManager__keyManager = v0;

}

- (void)clearXPCHandlers
{
  id *obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    objc_msgSend(obj[2], "setInvalidationHandler:", 0);
    objc_msgSend(obj[2], "setInterruptionHandler:", 0);
    objc_sync_exit(obj);

  }
}

void __24__DAManager_isSupported__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"+[DAManager isSupported]_block_invoke", 82, CFSTR("%@"), a5, a6, a7, a8, a2);
}

+ (BOOL)isCarKeySupportedForManufacturer:(id)a3 brand:(id)a4 ppid:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v11)
  {
    kmlUtilDataForHexString(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  SESEndPointIsCarKeySupported();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if (v12)

  if (a6 && v15)
  {
    sesErrorToKmlError(v15, 0xD6u);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    kmlErrorToDAError(v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v16;
  }
  v17 = objc_msgSend(v14, "BOOLValue");

  return v17;
}

+ (void)listKeysWithSession:(id)a3 seid:(id)a4 callback:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  DAKeyInformation *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (**v43)(id, _QWORD, void *);
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"+[DAManager listKeysWithSession:seid:callback:]", 119, &stru_24C3287B0, v10, v11, v12, v13, v42);
  if (v7 && v8)
  {
    v49 = 0;
    SESEndPointListWithSession();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v18, "count"));
    if (v19)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v19, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 209, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v9[2](v9, 0, v23);
    }
    else
    {
      v43 = v9;
      v44 = v8;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v18 = v18;
      v26 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v46 != v28)
              objc_enumerationMutation(v18);
            v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v30, "publicKeyIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[DAManager listKeysWithSession:seid:callback:]", 132, CFSTR("Key id = %@"), v32, v33, v34, v35, (uint64_t)v31);

            v36 = -[DAKeyInformation initWithEndpoint:]([DAKeyInformation alloc], "initWithEndpoint:", v30);
            objc_msgSend(v20, "addObject:", v36);

          }
          v27 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        }
        while (v27);
      }

      v37 = objc_msgSend(v20, "count");
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[DAManager listKeysWithSession:seid:callback:]", 136, CFSTR("key count = %lu"), v38, v39, v40, v41, v37);
      v9 = v43;
      ((void (**)(id, void *, void *))v43)[2](v43, v20, 0);
      v8 = v44;
    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"+[DAManager listKeysWithSession:seid:callback:]", 121, CFSTR("Null arguments provided. Session : %@, seid : %@"), v14, v15, v16, v17, (uint64_t)v7);
    v24 = (void *)MEMORY[0x24BDD1540];
    v51 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v52[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v25);

  }
}

+ (void)handleSharingMessage:(id)a3 forInvitationIdentifier:(id)a4 fromMailboxIdentifier:(id)a5 completionHandler:(id)a6
{
  void (**v9)(id, void *);
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;

  v9 = (void (**)(id, void *))a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"+[DAManager handleSharingMessage:forInvitationIdentifier:fromMailboxIdentifier:completionHandler:]", 149, &stru_24C3287B0, v13, v14, v15, v16, v18);
  +[DAManager sharedManager](DAManager, "sharedManager");
  v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[DAManager handleSharingMessage:forInvitationIdentifier:fromMailboxIdentifier:](v19, v12, v11, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v9[2](v9, v17);
}

- (_QWORD)handleSharingMessage:(void *)a3 forInvitationIdentifier:(void *)a4 fromMailboxIdentifier:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18[5];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a2;
  v8 = a3;
  v13 = a4;
  if (a1)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager handleSharingMessage:forInvitationIdentifier:fromMailboxIdentifier:]", 400, &stru_24C3287B0, v9, v10, v11, v12, v18[0]);
    -[DAManager establishXpcConnection](a1);
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__2;
    v24 = __Block_byref_object_dispose__2;
    v25 = 0;
    v14 = MEMORY[0x24BDAC760];
    v15 = (void *)a1[2];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __80__DAManager_handleSharingMessage_forInvitationIdentifier_fromMailboxIdentifier___block_invoke;
    v19[3] = &unk_24C327380;
    v19[4] = &v20;
    objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = (uint64_t)__80__DAManager_handleSharingMessage_forInvitationIdentifier_fromMailboxIdentifier___block_invoke_2;
    v18[3] = (uint64_t)&unk_24C327380;
    v18[4] = (uint64_t)&v20;
    objc_msgSend(v16, "queueCrossPlatformSharingMessage:forInvitationIdentifier:fromMailboxIdentifier:callback:", v7, v8, v13, v18);

    a1 = (id)v21[5];
    _Block_object_dispose(&v20, 8);

  }
  return a1;
}

+ (void)rejectSharingInvitation:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, void *, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  DACarKeyGenericCrossPlatformSharingData *v27;
  void *v28;
  void *v29;
  DACarKeyGenericCrossPlatformSharingData *v30;
  DACarKeySharingMessage *v31;
  void *v32;
  DACarKeySharingMessage *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"+[DAManager rejectSharingInvitation:completionHandler:]", 158, &stru_24C3287B0, v7, v8, v9, v10, v38);
  objc_msgSend(v5, "genericData");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_4;
  v16 = (void *)v11;
  objc_msgSend(v5, "genericData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sharingIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v5, "genericData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sharingIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[DAManager rejectSharingInvitation:completionHandler:]", 163, CFSTR("Cancel invite with id : %@"), v21, v22, v23, v24, (uint64_t)v20);

    v25 = -[KmlCancelMessage initWithCCCErrorCode:]([KmlCancelMessage alloc], 34);
    -[KmlCancelMessage asData]((uint64_t)v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = [DACarKeyGenericCrossPlatformSharingData alloc];
    objc_msgSend(v5, "genericData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sharingIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[DACarKeyGenericCrossPlatformSharingData initWithSharingIdentifier:friendKeyIdentifier:sharingMessageType:message:](v27, "initWithSharingIdentifier:friendKeyIdentifier:sharingMessageType:message:", v29, 0, 5, v26);

    v31 = [DACarKeySharingMessage alloc];
    objc_msgSend(v5, "additionalData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[DACarKeySharingMessage initWithGenericCrossPlatformSharingData:additionalData:privateData:](v31, "initWithGenericCrossPlatformSharingData:additionalData:privateData:", v30, v32, 0);

    v34 = 0;
  }
  else
  {
LABEL_4:
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[DAManager rejectSharingInvitation:completionHandler:]", 182, CFSTR("Can't cancel invite missing invitationIdentifier"), v12, v13, v14, v15, v39);
    v35 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(109));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v36;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 109, v37);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0;
  }
  v6[2](v6, v33, v34);

}

+ (id)createHomeKey:(id)a3 seid:(id)a4 readerIdentifier:(id)a5 readerPublicKey:(id)a6 outError:(id *)a7
{
  void *v7;
  DAKeyInformation *v8;

  MEMORY[0x20BD26FBC](a3, a4, a5, a6, a7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = -[DAKeyInformation initWithEndpoint:]([DAKeyInformation alloc], "initWithEndpoint:", v7);
  else
    v8 = 0;

  return v8;
}

- (void)registerSession:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableSet *v8;
  id v9;

  v9 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAManager registerSession:]", 201, CFSTR("%@"), v4, v5, v6, v7, (uint64_t)v9);
  v8 = self->_activeSessions;
  objc_sync_enter(v8);
  -[NSMutableSet addObject:](self->_activeSessions, "addObject:", v9);
  objc_sync_exit(v8);

}

- (void)unregisterSession:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableSet *v8;
  id v9;

  v9 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAManager unregisterSession:]", 209, CFSTR("%@"), v4, v5, v6, v7, (uint64_t)v9);
  v8 = self->_activeSessions;
  objc_sync_enter(v8);
  -[NSMutableSet removeObject:](self->_activeSessions, "removeObject:", v9);
  objc_sync_exit(v8);

}

- (void)invalidateSessions
{
  id v2;
  id v3;

  if (a1)
  {
    v2 = *(id *)(a1 + 8);
    objc_sync_enter(v2);
    v3 = (id)objc_msgSend(*(id *)(a1 + 8), "copy");
    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects");
    objc_sync_exit(v2);

    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_39);
  }
}

void __31__DAManager_invalidateSessions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAManager invalidateSessions]_block_invoke", 226, CFSTR("%@"), v3, v4, v5, v6, (uint64_t)v2);
  v7 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(216));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 216, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "didEnd:", v10);
}

- (void)cleanup
{
  void *v9;
  uint64_t v10;
  _QWORD *obj;

  if (a1)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager cleanup]", 239, &stru_24C3287B0, a5, a6, a7, a8, v10);
    -[DAManager invalidateSessions]((uint64_t)a1);
    obj = a1;
    objc_sync_enter(obj);
    v9 = (void *)obj[2];
    obj[2] = 0;

    objc_sync_exit(obj);
  }
}

- (id)connection
{
  return self->_clientConnection;
}

void __35__DAManager_establishXpcConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager establishXpcConnection]_block_invoke", 286, &stru_24C3287B0, v1, v2, v3, v4, v9);
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager releaseConnection]", 256, &stru_24C3287B0, v5, v6, v7, v8, v10);
    objc_msgSend(WeakRetained[2], "invalidate");
  }

}

void __35__DAManager_establishXpcConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager establishXpcConnection]_block_invoke_2", 295, &stru_24C3287B0, v1, v2, v3, v4, v12);
    -[DAManager cleanup](WeakRetained, v5, v6, v7, v8, v9, v10, v11);
  }

}

- (id)createPairingSessionWithDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSXPCConnection *clientConnection;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  DAKeyPairingSession *v22;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager createPairingSessionWithDelegate:]", 308, &stru_24C3287B0, v5, v6, v7, v8, v15[0]);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = -[DAKeyPairingSession initWithDelegate:]([DAKeyPairingSession alloc], "initWithDelegate:", v4);
  -[DAManager establishXpcConnection](self);
  -[DAManager registerSession:](self, "registerSession:", v18[5]);
  clientConnection = self->_clientConnection;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __46__DAManager_createPairingSessionWithDelegate___block_invoke;
  v16[3] = &unk_24C327B40;
  v16[4] = self;
  v16[5] = &v17;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](clientConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18[5];
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = (uint64_t)__46__DAManager_createPairingSessionWithDelegate___block_invoke_2;
  v15[3] = (uint64_t)&unk_24C327B68;
  v15[4] = (uint64_t)self;
  v15[5] = (uint64_t)&v17;
  objc_msgSend(v11, "queueOwnerPairingSession:callback:", v12, v15);

  v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __46__DAManager_createPairingSessionWithDelegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;

  if (a2)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager createPairingSessionWithDelegate:]_block_invoke", 317, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
    objc_msgSend(*(id *)(a1 + 32), "unregisterSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
}

void __46__DAManager_createPairingSessionWithDelegate___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;

  if (a4)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager createPairingSessionWithDelegate:]_block_invoke_2", 325, CFSTR("proxyError: %@"), a5, a6, a7, a8, a4);
    objc_msgSend(*(id *)(a1 + 32), "unregisterSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setProxy:", a2);
  }
}

- (id)createSharingSessionWithDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSXPCConnection *clientConnection;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  DAKeySharingSession *v22;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager createSharingSessionWithDelegate:]", 338, &stru_24C3287B0, v5, v6, v7, v8, v15[0]);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = -[DAKeySharingSession initWithDelegate:]([DAKeySharingSession alloc], "initWithDelegate:", v4);
  -[DAManager establishXpcConnection](self);
  -[DAManager registerSession:](self, "registerSession:", v18[5]);
  clientConnection = self->_clientConnection;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __46__DAManager_createSharingSessionWithDelegate___block_invoke;
  v16[3] = &unk_24C327B40;
  v16[4] = self;
  v16[5] = &v17;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](clientConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18[5];
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = (uint64_t)__46__DAManager_createSharingSessionWithDelegate___block_invoke_2;
  v15[3] = (uint64_t)&unk_24C327B90;
  v15[4] = (uint64_t)self;
  v15[5] = (uint64_t)&v17;
  objc_msgSend(v11, "queueSharingSession:callback:", v12, v15);

  v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __46__DAManager_createSharingSessionWithDelegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;

  if (a2)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager createSharingSessionWithDelegate:]_block_invoke", 347, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
    objc_msgSend(*(id *)(a1 + 32), "unregisterSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
}

void __46__DAManager_createSharingSessionWithDelegate___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;

  if (a4)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager createSharingSessionWithDelegate:]_block_invoke_2", 355, CFSTR("proxyError: %@"), a5, a6, a7, a8, a4);
    objc_msgSend(*(id *)(a1 + 32), "unregisterSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setProxy:", a2);
  }
}

- (id)createManagementSessionWithDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSXPCConnection *clientConnection;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  DAKeyManagementSession *v22;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager createManagementSessionWithDelegate:]", 368, &stru_24C3287B0, v5, v6, v7, v8, v15[0]);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = -[DAKeyManagementSession initWithDelegate:]([DAKeyManagementSession alloc], "initWithDelegate:", v4);
  -[DAManager establishXpcConnection](self);
  -[DAManager registerSession:](self, "registerSession:", v18[5]);
  clientConnection = self->_clientConnection;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __49__DAManager_createManagementSessionWithDelegate___block_invoke;
  v16[3] = &unk_24C327B40;
  v16[4] = self;
  v16[5] = &v17;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](clientConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18[5];
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = (uint64_t)__49__DAManager_createManagementSessionWithDelegate___block_invoke_2;
  v15[3] = (uint64_t)&unk_24C327BB8;
  v15[4] = (uint64_t)self;
  v15[5] = (uint64_t)&v17;
  objc_msgSend(v11, "queueManagementSession:callback:", v12, v15);

  v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __49__DAManager_createManagementSessionWithDelegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;

  if (a2)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager createManagementSessionWithDelegate:]_block_invoke", 377, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
    objc_msgSend(*(id *)(a1 + 32), "unregisterSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
}

void __49__DAManager_createManagementSessionWithDelegate___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;

  if (a4)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager createManagementSessionWithDelegate:]_block_invoke_2", 385, CFSTR("proxyError: %@"), a5, a6, a7, a8, a4);
    objc_msgSend(*(id *)(a1 + 32), "unregisterSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setProxy:", a2);
  }
}

void __80__DAManager_handleSharingMessage_forInvitationIdentifier_fromMailboxIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a2;
  if (v4)
  {
    v9 = v4;
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAManager handleSharingMessage:forInvitationIdentifier:fromMailboxIdentifier:]_block_invoke", 406, CFSTR("proxyError: %@"), v5, v6, v7, v8, (uint64_t)v4);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v9;
  }

}

void __80__DAManager_handleSharingMessage_forInvitationIdentifier_fromMailboxIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)registerOwnerSideSharingTestInvitations:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerOwnerSideSharingTestInvitations:callback:]", 420, &stru_24C3287B0, v8, v9, v10, v11, v17);
  -[DAManager establishXpcConnection](self);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_clientConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_96);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerOwnerSideSharingTestInvitations:callback:", v7, v6);

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerOwnerSideSharingTestInvitations:callback:]", 426, &stru_24C3287B0, v13, v14, v15, v16, v18);
}

void __62__DAManager_registerOwnerSideSharingTestInvitations_callback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerOwnerSideSharingTestInvitations:callback:]_block_invoke", 424, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
}

- (void)registerOwnerSideInvitationRequestHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerOwnerSideInvitationRequestHandler:]", 431, &stru_24C3287B0, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_clientConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_97);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerOwnerSideInvitationRequestHandler:", v4);

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerOwnerSideInvitationRequestHandler:]", 437, &stru_24C3287B0, v10, v11, v12, v13, v15);
}

void __55__DAManager_registerOwnerSideInvitationRequestHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerOwnerSideInvitationRequestHandler:]_block_invoke", 435, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
}

- (void)registerFriendSideSharingTestCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideSharingTestCompletion:]", 442, &stru_24C3287B0, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_clientConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_98);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerFriendSideSharingTestCompletion:", v4);

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideSharingTestCompletion:]", 448, &stru_24C3287B0, v10, v11, v12, v13, v15);
}

void __53__DAManager_registerFriendSideSharingTestCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideSharingTestCompletion:]_block_invoke", 446, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
}

- (void)registerFriendSideSharingTestInvitationUUIDHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideSharingTestInvitationUUIDHandler:]", 453, &stru_24C3287B0, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_clientConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_99);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerFriendSideSharingTestInvitationUUIDHandler:", v4);

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideSharingTestInvitationUUIDHandler:]", 459, &stru_24C3287B0, v10, v11, v12, v13, v15);
}

void __64__DAManager_registerFriendSideSharingTestInvitationUUIDHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideSharingTestInvitationUUIDHandler:]_block_invoke", 457, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
}

- (void)registerFriendSideInvitationUnusableHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideInvitationUnusableHandler:]", 464, &stru_24C3287B0, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_clientConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_100);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerFriendSideInvitationUnusableHandler:", v4);

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideInvitationUnusableHandler:]", 470, &stru_24C3287B0, v10, v11, v12, v13, v15);
}

void __57__DAManager_registerFriendSideInvitationUnusableHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSideInvitationUnusableHandler:]_block_invoke", 468, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
}

- (void)registerCrossPlatformTestMessageOverIDSHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerCrossPlatformTestMessageOverIDSHandler:]", 475, &stru_24C3287B0, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_clientConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_101);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerCrossPlatformTestMessageOverIDSHandler:", v4);

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerCrossPlatformTestMessageOverIDSHandler:]", 481, &stru_24C3287B0, v10, v11, v12, v13, v15);
}

void __60__DAManager_registerCrossPlatformTestMessageOverIDSHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerCrossPlatformTestMessageOverIDSHandler:]_block_invoke", 479, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
}

- (void)registerCrossPlatformTestMessageSendHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerCrossPlatformTestMessageSendHandler:]", 486, &stru_24C3287B0, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_clientConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_102);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerCrossPlatformTestMessageSendHandler:", v4);

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerCrossPlatformTestMessageSendHandler:]", 492, &stru_24C3287B0, v10, v11, v12, v13, v15);
}

void __57__DAManager_registerCrossPlatformTestMessageSendHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerCrossPlatformTestMessageSendHandler:]_block_invoke", 490, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
}

- (void)sendCrossPlatformTestData:(id)a3 toIdsIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a4;
  v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager sendCrossPlatformTestData:toIdsIdentifier:]", 497, &stru_24C3287B0, v8, v9, v10, v11, v17);
  -[DAManager establishXpcConnection](self);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_clientConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_103);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendCrossPlatformTestData:toIdsIdentifier:", v7, v6);

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager sendCrossPlatformTestData:toIdsIdentifier:]", 503, &stru_24C3287B0, v13, v14, v15, v16, v18);
}

void __55__DAManager_sendCrossPlatformTestData_toIdsIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager sendCrossPlatformTestData:toIdsIdentifier:]_block_invoke", 501, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
}

- (void)registerFriendSidePasscodeRetryRequestTestHandler:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSidePasscodeRetryRequestTestHandler:]", 508, &stru_24C3287B0, v5, v6, v7, v8, v14);
  -[DAManager establishXpcConnection](self);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_clientConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_104);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerFriendSidePasscodeRetryRequestHandler:", v4);

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSidePasscodeRetryRequestTestHandler:]", 514, &stru_24C3287B0, v10, v11, v12, v13, v15);
}

void __63__DAManager_registerFriendSidePasscodeRetryRequestTestHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager registerFriendSidePasscodeRetryRequestTestHandler:]_block_invoke", 512, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
}

- (void)unregisterSharingTestHandlers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager unregisterSharingTestHandlers]", 519, &stru_24C3287B0, v2, v3, v4, v5, v12);
  -[DAManager establishXpcConnection](self);
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_clientConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_105);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterSharingTestHandlers");

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager unregisterSharingTestHandlers]", 525, &stru_24C3287B0, v8, v9, v10, v11, v13);
}

void __42__DAManager_unregisterSharingTestHandlers__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAManager unregisterSharingTestHandlers]_block_invoke", 523, CFSTR("proxyError: %@"), a5, a6, a7, a8, a2);
}

+ (id)createAliroHomeKey:(id)a3 seid:(id)a4 readerIdentifier:(id)a5 readerPublicKey:(id)a6 homeUUID:(id)a7 outError:(id *)a8
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  DAKeyInformation *v20;

  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "numberWithInt:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  SESEndPointCreateForLyonWithSession();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = -[DAKeyInformation initWithEndpoint:]([DAKeyInformation alloc], "initWithEndpoint:", v19);
  else
    v20 = 0;

  return v20;
}

+ (id)createAliroHydraKey:(id)a3 seid:(id)a4 serverParameters:(id)a5 outError:(id *)a6
{
  void *v6;
  DAKeyInformation *v7;

  SESEndPointCreateForLyonHydraWithSession();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[DAKeyInformation initWithEndpoint:]([DAKeyInformation alloc], "initWithEndpoint:", v6);
  else
    v7 = 0;

  return v7;
}

+ (id)updateAliroCredentialDocumentStatus:(id)a3 seid:(id)a4 keyIdentifier:(id)a5 accessDocumentPresent:(unsigned __int8)a6 accessDocumentSignedTimestamp:(id)a7 revocationDocumentPresent:(unsigned __int8)a8 revocationDocumentSignedTimestamp:(id)a9
{
  return (id)updateLyonCredentialDocumentStatusWithSession();
}

+ (id)getAliroSupportedProtocolVersions:(id *)a3
{
  return (id)SESEndpointGetSupportedLyonVersions();
}

@end
