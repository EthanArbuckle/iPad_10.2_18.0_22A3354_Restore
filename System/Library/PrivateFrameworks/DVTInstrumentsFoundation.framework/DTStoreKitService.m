@implementation DTStoreKitService

+ (void)registerCapabilities:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v5 = 138543362;
    v6 = objc_opt_class();
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[%{public}@] Registering service", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.storekit"), 8, a1);

}

- (DTStoreKitService)initWithChannel:(id)a3
{
  id v4;
  DTStoreKitService *v5;
  uint64_t v6;
  NSXPCConnection *connectionToDaemon;
  void *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DTStoreKitService;
  v5 = -[DTXService initWithChannel:](&v21, sel_initWithChannel_, v4);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.storekit.configuration.xpc"), 0);
    connectionToDaemon = v5->_connectionToDaemon;
    v5->_connectionToDaemon = (NSXPCConnection *)v6;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255786048);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connectionToDaemon, "setRemoteObjectInterface:", v8);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255777740);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5->_connectionToDaemon, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](v5->_connectionToDaemon, "setExportedObject:", v5);
    objc_initWeak(&location, v5);
    v10 = v5->_connectionToDaemon;
    v11 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_222B43918;
    v18[3] = &unk_24EB28000;
    objc_copyWeak(&v19, &location);
    -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", v18);
    v12 = v5->_connectionToDaemon;
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = sub_222B439C8;
    v16[3] = &unk_24EB28000;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", v16);
    -[NSXPCConnection resume](v5->_connectionToDaemon, "resume");
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = sub_222B43A8C;
    v14[3] = &unk_24EB28000;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v4, "registerDisconnectHandler:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_disconnectServiceConnection
{
  NSXPCConnection *connectionToDaemon;

  -[NSXPCConnection invalidate](self->_connectionToDaemon, "invalidate");
  connectionToDaemon = self->_connectionToDaemon;
  self->_connectionToDaemon = 0;

}

+ (void)removeConfigurationDataForBundleID:(id)a3 connection:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v13 = 138543618;
    v14 = objc_opt_class();
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[%{public}@] Remove configuration called for %{public}@", (uint8_t *)&v13, 0x16u);
  }
  if ((int)objc_msgSend(v9, "remoteCapabilityVersion:", CFSTR("com.apple.instruments.server.services.storekit")) <= 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v12 = objc_opt_class();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[%{public}@] Unsupported device, cannot remove configuration", (uint8_t *)&v13, 0xCu);
    }
    v10[2](v10, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2A960], "messageWithObject:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInteger:forMessageKey:", 5, CFSTR("serviceCommand"));
    objc_msgSend(a1, "_sendMessage:onConnection:completion:", v11, v9, v10);

  }
}

+ (void)syncConfigurationData:(id)a3 forBundleID:(id)a4 connection:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _BYTE v26[12];
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v26 = 138543618;
    *(_QWORD *)&v26[4] = objc_opt_class();
    v27 = 2114;
    v28 = v11;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[%{public}@] Sync configuration called for %{public}@", v26, 0x16u);
  }
  if ((int)objc_msgSend(v12, "remoteCapabilityVersion:", CFSTR("com.apple.instruments.server.services.storekit")) <= 0)
  {
    DTSKServiceErrorWithDescription(8, CFSTR("Cannot sync configuration"), v14, v15, v16, v17, v18, v19, *(uint64_t *)v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v25);

  }
  else if (v10)
  {
    v20 = objc_msgSend(v12, "remoteCapabilityVersion:", CFSTR("com.apple.instruments.server.services.storekit"));
    if ((int)v20 <= 4)
    {
      v21 = v20;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_opt_class();
        *(_DWORD *)v26 = 138543362;
        *(_QWORD *)&v26[4] = v22;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "[%{public}@] Using compatibility time rate to sync configuration", v26, 0xCu);
      }
      objc_msgSend(a1, "_dataUsingCompatibilityTimeRateFrom:currentVersion:", v10, v21);
      v23 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v23;
    }
    objc_msgSend(MEMORY[0x24BE2A960], "messageWithObject:", v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setInteger:forMessageKey:", 6, CFSTR("serviceCommand"));
    objc_msgSend(v24, "setData:forMessageKey:", v10, CFSTR("configurationFile"));
    objc_msgSend(a1, "_sendMessage:onConnection:completion:", v24, v12, v13);

  }
  else
  {
    DTSKServiceErrorWithDescription(2, CFSTR("Missing configuration file data"), v14, v15, v16, v17, v18, v19, *(uint64_t *)v26);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v10);
  }

}

+ (void)syncConfigurationAssetData:(id)a3 fileName:(id)a4 forBundleID:(id)a5 connection:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  void *v26;
  _BYTE v27[12];
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *))a7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v27 = 138543618;
    *(_QWORD *)&v27[4] = objc_opt_class();
    v28 = 2114;
    v29 = v14;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[%{public}@] Sync configuration asset called for %{public}@", v27, 0x16u);
  }
  if ((int)objc_msgSend(v15, "remoteCapabilityVersion:", CFSTR("com.apple.instruments.server.services.storekit")) > 7)
  {
    if (v12)
    {
      if (v13 && objc_msgSend(v13, "length"))
      {
        objc_msgSend(MEMORY[0x24BE2A960], "messageWithObject:", v14);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setInteger:forMessageKey:", 13, CFSTR("serviceCommand"));
        objc_msgSend(v24, "setData:forMessageKey:", v12, CFSTR("configurationAsset"));
        objc_msgSend(v24, "setString:forMessageKey:", v13, CFSTR("configurationAssetFileName"));
        objc_msgSend(a1, "_sendMessage:onConnection:completion:", v24, v15, v16);

        goto LABEL_14;
      }
      v25 = CFSTR("Empty asset file name");
    }
    else
    {
      v25 = CFSTR("Missing configuration asset data");
    }
    DTSKServiceErrorWithDescription(7, v25, v17, v18, v19, v20, v21, v22, *(uint64_t *)v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v26);

    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v23 = objc_opt_class();
    *(_DWORD *)v27 = 138543874;
    *(_QWORD *)&v27[4] = v23;
    v28 = 2114;
    v29 = v13;
    v30 = 2114;
    v31 = v14;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[%{public}@] Will not sync StoreKit asset %{public}@ for %{public}@. Unsupported device.", v27, 0x20u);
  }
  v16[2](v16, 0);
LABEL_14:

}

+ (void)_sendMessage:(id)a3 onConnection:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "makeChannelWithIdentifier:", CFSTR("com.apple.instruments.server.services.storekit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  if (v9)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = (uint64_t)sub_222B442E0;
    v18[3] = (uint64_t)&unk_24EB293A0;
    v19 = v9;
    v20 = v8;
    objc_msgSend(v19, "sendControlAsync:replyHandler:", v7, v18);

  }
  else
  {
    DTSKServiceErrorWithDescription(4, CFSTR("DTStoreKitService is unavailable."), v10, v11, v12, v13, v14, v15, v18[0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v17);

  }
}

- (void)messageReceived:(id)a3
{
  id v5;
  BOOL v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v15 = objc_opt_class();
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[%{public}@] Message received: %{public}@", buf, 0x16u);
  }
  if ((id)*MEMORY[0x24BE2A988] != v5)
  {
    v13 = 0;
    v6 = -[DTStoreKitService _processMessage:error:](self, "_processMessage:error:", v5, &v13);
    v7 = v13;
    v8 = v7;
    if (!v6)
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTStoreKitService.m"), 234, CFSTR("rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"));

      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v9 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v15 = v9;
        v16 = 2114;
        v17 = v5;
        v18 = 2114;
        v19 = v8;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[%{public}@] Error processing message %{public}@: %{public}@", buf, 0x20u);
      }
      v10 = (void *)objc_msgSend(v5, "newReplyWithError:", v8);
      -[DTXService channel](self, "channel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendMessage:replyHandler:", v10, 0);

    }
  }

}

- (void)transactionDeleted:(unint64_t)a3 forBundleID:(id)a4
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE2A960], "messageWithObject:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteger:forMessageKey:", 7, CFSTR("serviceCommand"));
  objc_msgSend(v7, "setInteger:forMessageKey:", 2, CFSTR("action"));
  objc_msgSend(v7, "setInteger:forMessageKey:", a3, CFSTR("transactionID"));
  -[DTXService channel](self, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendMessageAsync:replyHandler:", v7, 0);

}

- (void)transactionUpdated:(id)a3 forBundleID:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BE2A960];
  v7 = a3;
  objc_msgSend(v6, "messageWithObject:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInteger:forMessageKey:", 7, CFSTR("serviceCommand"));
  objc_msgSend(v9, "setData:forMessageKey:", v7, CFSTR("transactionData"));

  -[DTXService channel](self, "channel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendMessageAsync:replyHandler:", v9, 0);

}

- (BOOL)_handleBuyProductMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  DTStoreKitService *v32;
  id v33;
  uint64_t *v34;
  id obj;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v8 = a3;
  v9 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_222B448A8;
  v40 = sub_222B448B8;
  v41 = 0;
  objc_msgSend(v8, "dataForMessageKey:", CFSTR("purchaseConfiguration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (id *)(v37 + 5);
    obj = (id)v37[5];
    -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v17, obj);
    v28 = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = sub_222B448C0;
    v31 = &unk_24EB293C8;
    v34 = &v36;
    v32 = self;
    v33 = v9;
    objc_msgSend(v18, "buyProductWithConfiguration:bundleID:completion:", v16, v33, &v28);

  }
  else
  {
    DTSKServiceErrorWithDescription(6, CFSTR("Missing purchase configuration data required to complete buy"), v10, v11, v12, v13, v14, v15, v28);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v37[5];
    v37[5] = v19;

  }
  if (a5)
  {
    v21 = (void *)v37[5];
    if (v21)
      *a5 = objc_retainAutorelease(v21);
  }
  v22 = (void *)objc_msgSend(v8, "newReply", v28, v29, v30, v31, v32);
  v23 = v37[5];
  objc_msgSend(v22, "setInteger:forMessageKey:", v23 == 0, CFSTR("success"));
  v24 = (void *)v37[5];
  if (v24)
  {
    objc_msgSend(v24, "localizedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setString:forMessageKey:", v25, CFSTR("response"));

  }
  -[DTXService channel](self, "channel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sendControlAsync:replyHandler:", v22, 0);

  _Block_object_dispose(&v36, 8);
  return v23 == 0;
}

- (BOOL)_handleSendPurchaseIntentMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  id obj;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_222B448A8;
  v33 = sub_222B448B8;
  v34 = 0;
  objc_msgSend(v8, "stringForMessageKey:", CFSTR("productID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (id *)(v30 + 5);
    obj = (id)v30[5];
    -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v17, obj);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_222B44BE4;
    v24[3] = &unk_24EB293F0;
    v27 = &v29;
    v24[4] = self;
    v25 = v16;
    v26 = v9;
    objc_msgSend(v18, "sendPurchaseIntentForProductIdentifier:bundleID:completion:", v25, v26, v24);

  }
  else
  {
    DTSKServiceErrorWithDescription(3, CFSTR("Missing product ID"), v10, v11, v12, v13, v14, v15, v23);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v30[5];
    v30[5] = v19;

  }
  v21 = (void *)v30[5];
  if (a5 && v21)
  {
    *a5 = objc_retainAutorelease(v21);
    v21 = (void *)v30[5];
  }
  if (!v21)
    -[DTStoreKitService _sendGenericSuccessResponseForMessage:](self, "_sendGenericSuccessResponseForMessage:", v8);

  _Block_object_dispose(&v29, 8);
  return v21 == 0;
}

- (BOOL)_handleChangeAutoRenewStatusMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_222B448A8;
  v26 = sub_222B448B8;
  v27 = 0;
  v10 = objc_msgSend(v8, "integerForMessageKey:", CFSTR("response"));
  v11 = objc_msgSend(v8, "integerForMessageKey:", CFSTR("transactionID"));
  v12 = (id *)(v23 + 5);
  obj = (id)v23[5];
  -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v12, obj);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_222B44EFC;
  v17[3] = &unk_24EB29418;
  v19 = &v22;
  v20 = v11;
  v17[4] = self;
  v14 = v9;
  v18 = v14;
  objc_msgSend(v13, "changeAutoRenewStatus:transactionID:bundleID:completion:", v10 != 0, v11, v14, v17);

  v15 = (void *)v23[5];
  if (a5 && v15)
  {
    *a5 = objc_retainAutorelease(v15);
    v15 = (void *)v23[5];
  }
  if (!v15)
    -[DTStoreKitService _sendGenericSuccessResponseForMessage:](self, "_sendGenericSuccessResponseForMessage:", v8);

  _Block_object_dispose(&v22, 8);
  return v15 == 0;
}

- (BOOL)_handleCompleteAskToBuyTransactionMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_222B448A8;
  v26 = sub_222B448B8;
  v27 = 0;
  v10 = objc_msgSend(v8, "integerForMessageKey:", CFSTR("response"));
  v11 = objc_msgSend(v8, "integerForMessageKey:", CFSTR("transactionID"));
  v12 = (id *)(v23 + 5);
  obj = (id)v23[5];
  -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v12, obj);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_222B45224;
  v17[3] = &unk_24EB29418;
  v19 = &v22;
  v20 = v11;
  v17[4] = self;
  v14 = v9;
  v18 = v14;
  objc_msgSend(v13, "completeAskToBuyRequestWithResponse:transactionID:bundleID:completion:", v10 != 0, v11, v14, v17);

  v15 = (void *)v23[5];
  if (a5 && v15)
  {
    *a5 = objc_retainAutorelease(v15);
    v15 = (void *)v23[5];
  }
  if (!v15)
    -[DTStoreKitService _sendGenericSuccessResponseForMessage:](self, "_sendGenericSuccessResponseForMessage:", v8);

  _Block_object_dispose(&v22, 8);
  return v15 == 0;
}

- (BOOL)_handleDeleteAllTransactionsMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  DTStoreKitService *v18;
  id v19;
  uint64_t *v20;
  id obj;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_222B448A8;
  v26 = sub_222B448B8;
  v27 = 0;
  obj = 0;
  -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v27, obj);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = sub_222B454F8;
  v17 = &unk_24EB29440;
  v20 = &v22;
  v18 = self;
  v11 = v9;
  v19 = v11;
  objc_msgSend(v10, "deleteAllTransactionsForBundleID:completion:", v11, &v14);

  v12 = (void *)v23[5];
  if (a5 && v12)
  {
    *a5 = objc_retainAutorelease(v12);
    v12 = (void *)v23[5];
  }
  if (!v12)
    -[DTStoreKitService _sendGenericSuccessResponseForMessage:](self, "_sendGenericSuccessResponseForMessage:", v8, v14, v15, v16, v17, v18);

  _Block_object_dispose(&v22, 8);
  return v12 == 0;
}

- (BOOL)_handleFetchTransactionsMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  id obj;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_222B448A8;
  v31 = sub_222B448B8;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_222B448A8;
  v25 = sub_222B448B8;
  v26 = 0;
  obj = 0;
  -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v32, obj);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_222B45818;
  v16[3] = &unk_24EB29468;
  v18 = &v27;
  v19 = &v21;
  v16[4] = self;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v10, "getTransactionDataForBundleID:completion:", v11, v16);

  v12 = (void *)v28[5];
  if (a5 && v12)
  {
    *a5 = objc_retainAutorelease(v12);
    v12 = (void *)v28[5];
  }
  if (!v12)
  {
    v13 = (void *)objc_msgSend(v8, "newReplyWithObject:", v22[5]);
    -[DTXService channel](self, "channel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendControlAsync:replyHandler:", v13, 0);

  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v12 == 0;
}

- (BOOL)_handleRemoveConfigurationMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  DTStoreKitService *v18;
  id v19;
  uint64_t *v20;
  id obj;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_222B448A8;
  v26 = sub_222B448B8;
  v27 = 0;
  obj = 0;
  -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v27, obj);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = sub_222B45AF8;
  v17 = &unk_24EB29440;
  v20 = &v22;
  v18 = self;
  v11 = v9;
  v19 = v11;
  objc_msgSend(v10, "removeConfigurationForBundleID:completion:", v11, &v14);

  v12 = (void *)v23[5];
  if (a5 && v12)
  {
    *a5 = objc_retainAutorelease(v12);
    v12 = (void *)v23[5];
  }
  if (!v12)
    -[DTStoreKitService _sendGenericSuccessResponseForMessage:](self, "_sendGenericSuccessResponseForMessage:", v8, v14, v15, v16, v17, v18);

  _Block_object_dispose(&v22, 8);
  return v12 == 0;
}

- (BOOL)_handleSyncConfigurationMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25[5];
  id obj;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "dataForMessageKey:", CFSTR("configurationFile"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_222B448A8;
    v31 = sub_222B448B8;
    v32 = 0;
    obj = 0;
    -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v32, obj);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = (uint64_t)sub_222B45F18;
    v25[3] = (uint64_t)&unk_24EB29490;
    v25[4] = (uint64_t)&v27;
    objc_msgSend(v17, "saveConfigurationData:forBundleID:completion:", v16, v9, v25);

    if (a5)
      *a5 = objc_retainAutorelease((id)v28[5]);
    v18 = v28[5];
    v19 = v18 == 0;
    v20 = MEMORY[0x24BDACB70];
    if (v18)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v21 = objc_opt_class();
        v22 = v28[5];
        *(_DWORD *)buf = 138543874;
        v34 = v21;
        v35 = 2114;
        v36 = v9;
        v37 = 2114;
        v38 = v22;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[%{public}@] Failed to save configuration file for %{public}@: %{public}@", buf, 0x20u);
      }

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v23 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v34 = v23;
        v35 = 2114;
        v36 = v9;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[%{public}@] Successfully saved configuration file for %{public}@", buf, 0x16u);
      }

      -[DTStoreKitService _sendGenericSuccessResponseForMessage:](self, "_sendGenericSuccessResponseForMessage:", v8);
    }
    _Block_object_dispose(&v27, 8);

  }
  else if (a5)
  {
    DTSKServiceErrorWithDescription(2, CFSTR("Configuration data is required"), v10, v11, v12, v13, v14, v15, v25[0]);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_handleSyncConfigurationAssetMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26[5];
  id obj;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "dataForMessageKey:", CFSTR("configurationAsset"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForMessageKey:", CFSTR("configurationAssetFileName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = sub_222B448A8;
    v32 = sub_222B448B8;
    v33 = 0;
    obj = 0;
    -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v33, obj);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = (uint64_t)sub_222B46230;
    v26[3] = (uint64_t)&unk_24EB29490;
    v26[4] = (uint64_t)&v28;
    objc_msgSend(v18, "saveConfigurationAssetData:fileName:forBundleID:completion:", v10, v17, v9, v26);

    if (a5)
      *a5 = objc_retainAutorelease((id)v29[5]);
    v19 = v29[5];
    v20 = v19 == 0;
    v21 = MEMORY[0x24BDACB70];
    if (v19)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v22 = objc_opt_class();
        v23 = v29[5];
        *(_DWORD *)buf = 138544130;
        v35 = v22;
        v36 = 2114;
        v37 = v17;
        v38 = 2114;
        v39 = v9;
        v40 = 2114;
        v41 = v23;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[%{public}@] Failed to save configuration asset %{public}@ for %{public}@: %{public}@", buf, 0x2Au);
      }

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v24 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v35 = v24;
        v36 = 2114;
        v37 = v17;
        v38 = 2114;
        v39 = v9;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[%{public}@] Successfully saved configuration asset %{public}@ for %{public}@", buf, 0x20u);
      }

      -[DTStoreKitService _sendGenericSuccessResponseForMessage:](self, "_sendGenericSuccessResponseForMessage:", v8);
    }
    _Block_object_dispose(&v28, 8);

  }
  else if (a5)
  {
    DTSKServiceErrorWithDescription(2, CFSTR("Configuration asset data is required"), v11, v12, v13, v14, v15, v16, v26[0]);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)_handleGetConfigurationMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  _QWORD v32[6];
  id obj;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_222B448A8;
  v44 = sub_222B448B8;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_222B448A8;
  v38 = sub_222B448B8;
  v39 = 0;
  obj = 0;
  -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v45, obj);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_222B465C0;
  v32[3] = &unk_24EB294B8;
  v32[4] = &v40;
  v32[5] = &v34;
  objc_msgSend(v10, "configurationDataForBundleID:completion:", v9, v32);

  v17 = v41[5];
  if (v35[5])
  {
    if (!v17)
    {
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v20 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v47 = v20;
        v48 = 2114;
        v49 = v9;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[%{public}@] Successfully received configuration file for %{public}@", buf, 0x16u);
      }

      v21 = (void *)objc_msgSend(v8, "newReplyWithObject:", v9);
      objc_msgSend(v21, "setData:forMessageKey:", v35[5], CFSTR("configurationFile"));
      -[DTXService channel](self, "channel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sendControlAsync:replyHandler:", v21, 0);

      v23 = 1;
      goto LABEL_12;
    }
  }
  else if (!v17)
  {
    DTSKServiceErrorWithDescription(2, CFSTR("Configuration data not found"), v11, v12, v13, v14, v15, v16, v31);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v41[5];
    v41[5] = v24;

    if (!v41[5])
      __assert_rtn("-[DTStoreKitService _handleGetConfigurationMessage:forBundleID:error:]", "DTStoreKitService.m", 561, "localError");
  }
  v26 = MEMORY[0x24BDACB70];
  v27 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v28 = objc_opt_class();
    v29 = v41[5];
    *(_DWORD *)buf = 138543874;
    v47 = v28;
    v48 = 2114;
    v49 = v9;
    v50 = 2114;
    v51 = v29;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get configuration file for %{public}@: %{public}@", buf, 0x20u);
  }

  v23 = 0;
  if (a5)
    *a5 = objc_retainAutorelease((id)v41[5]);
LABEL_12:
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v23;
}

- (BOOL)_handleUpdateTransactionMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_222B448A8;
  v39 = sub_222B448B8;
  v40 = 0;
  v10 = objc_msgSend(v8, "integerForMessageKey:", CFSTR("action"));
  v11 = objc_msgSend(v8, "integerForMessageKey:", CFSTR("transactionID"));
  if (v10)
  {
    v12 = v11;
    v13 = (id *)(v36 + 5);
    obj = (id)v36[5];
    -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v13, obj);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = sub_222B468E4;
    v29[3] = &unk_24EB294E0;
    v31 = &v35;
    v32 = v10;
    v29[4] = self;
    v33 = v12;
    v30 = v9;
    objc_msgSend(v14, "performAction:transactionID:bundleID:completion:", v10, v12, v30, v29);

  }
  else
  {
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v42 = v17;
      v43 = 2048;
      v44 = 0;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[%{public}@] Unknown action provided: %ld", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown action: %ld"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    DTSKServiceErrorWithDescription(5, v18, v19, v20, v21, v22, v23, v24, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v36[5];
    v36[5] = v25;

  }
  v27 = (void *)v36[5];
  if (a5 && v27)
  {
    *a5 = objc_retainAutorelease(v27);
    v27 = (void *)v36[5];
  }
  if (!v27)
    -[DTStoreKitService _sendGenericSuccessResponseForMessage:](self, "_sendGenericSuccessResponseForMessage:", v8);
  _Block_object_dispose(&v35, 8);

  return v27 == 0;
}

- (BOOL)_handleObserveTransactionsMessage:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  id obj;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_222B448A8;
  v31 = sub_222B448B8;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_222B448A8;
  v25 = sub_222B448B8;
  v26 = 0;
  obj = 0;
  -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v32, obj);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_222B46C34;
  v16[3] = &unk_24EB29468;
  v18 = &v27;
  v19 = &v21;
  v16[4] = self;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v10, "startObservingTransactionsForBundleID:completion:", v11, v16);

  v12 = (void *)v28[5];
  if (a5 && v12)
  {
    *a5 = objc_retainAutorelease(v12);
    v12 = (void *)v28[5];
  }
  if (!v12)
  {
    v13 = (void *)objc_msgSend(v8, "newReplyWithObject:", v22[5]);
    -[DTXService channel](self, "channel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendControlAsync:replyHandler:", v13, 0);

  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v12 == 0;
}

- (BOOL)_handleDiscoverAppsMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];
  id obj;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_222B448A8;
  v24 = sub_222B448B8;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_222B448A8;
  v18 = sub_222B448B8;
  v19 = 0;
  obj = 0;
  -[DTStoreKitService _synchronousRemoteObjectProxy:](self, "_synchronousRemoteObjectProxy:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v25, obj);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_222B46F50;
  v12[3] = &unk_24EB29508;
  v12[5] = &v20;
  v12[6] = &v14;
  v12[4] = self;
  objc_msgSend(v7, "testingAppsWithCompletion:", v12);

  v8 = (void *)v21[5];
  if (a4 && v8)
  {
    *a4 = objc_retainAutorelease(v8);
    v8 = (void *)v21[5];
  }
  if (!v8)
  {
    v9 = (void *)objc_msgSend(v6, "newReplyWithObject:", v15[5]);
    -[DTXService channel](self, "channel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendControlAsync:replyHandler:", v9, 0);

  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v8 == 0;
}

- (BOOL)_processMessage:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id *v25;
  BOOL v26;
  id v27;
  BOOL v28;
  void *v29;
  void *v30;
  SEL v31;
  DTStoreKitService *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = objc_msgSend(v7, "integerForMessageKey:", CFSTR("serviceCommand"));
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectWithAllowedClasses:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)objc_opt_class(), "_commandRequiresBundleID:", v8)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    DTSKServiceErrorWithDescription(1, CFSTR("No bundleID specified for message: %@"), v11, v12, v13, v14, v15, v16, (uint64_t)v7);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
LABEL_8:
      v28 = 0;
      if (!a4)
        goto LABEL_27;
      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = a2;
    v32 = self;
    v33 = 669;
LABEL_29:
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", v31, v32, CFSTR("DTStoreKitService.m"), v33, CFSTR("rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"));

    v28 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v23 = objc_opt_class();
      -[DTStoreKitService _descriptionForServiceCommand:](self, "_descriptionForServiceCommand:", v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v23;
      v50 = 2114;
      v51 = v24;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "[%{public}@] Service Command Received: \"%{public}@\", buf, 0x16u);

    }
    switch(v8)
    {
      case 1:
        v47 = 0;
        v25 = (id *)&v47;
        v26 = -[DTStoreKitService _handleChangeAutoRenewStatusMessage:forBundleID:error:](self, "_handleChangeAutoRenewStatusMessage:forBundleID:error:", v7, v10, &v47);
        break;
      case 2:
        v46 = 0;
        v25 = (id *)&v46;
        v26 = -[DTStoreKitService _handleCompleteAskToBuyTransactionMessage:forBundleID:error:](self, "_handleCompleteAskToBuyTransactionMessage:forBundleID:error:", v7, v10, &v46);
        break;
      case 3:
        v45 = 0;
        v25 = (id *)&v45;
        v26 = -[DTStoreKitService _handleDeleteAllTransactionsMessage:forBundleID:error:](self, "_handleDeleteAllTransactionsMessage:forBundleID:error:", v7, v10, &v45);
        break;
      case 4:
        v44 = 0;
        v25 = (id *)&v44;
        v26 = -[DTStoreKitService _handleFetchTransactionsMessage:forBundleID:error:](self, "_handleFetchTransactionsMessage:forBundleID:error:", v7, v10, &v44);
        break;
      case 5:
        v43 = 0;
        v25 = (id *)&v43;
        v26 = -[DTStoreKitService _handleRemoveConfigurationMessage:forBundleID:error:](self, "_handleRemoveConfigurationMessage:forBundleID:error:", v7, v10, &v43);
        break;
      case 6:
        v42 = 0;
        v25 = (id *)&v42;
        v26 = -[DTStoreKitService _handleSyncConfigurationMessage:forBundleID:error:](self, "_handleSyncConfigurationMessage:forBundleID:error:", v7, v10, &v42);
        break;
      case 7:
        v40 = 0;
        v25 = (id *)&v40;
        v26 = -[DTStoreKitService _handleUpdateTransactionMessage:forBundleID:error:](self, "_handleUpdateTransactionMessage:forBundleID:error:", v7, v10, &v40);
        break;
      case 8:
        v39 = 0;
        v25 = (id *)&v39;
        v26 = -[DTStoreKitService _handleBuyProductMessage:forBundleID:error:](self, "_handleBuyProductMessage:forBundleID:error:", v7, v10, &v39);
        break;
      case 9:
        v38 = 0;
        v25 = (id *)&v38;
        v26 = -[DTStoreKitService _handleObserveTransactionsMessage:forBundleID:error:](self, "_handleObserveTransactionsMessage:forBundleID:error:", v7, v10, &v38);
        break;
      case 10:
        v37 = 0;
        v25 = (id *)&v37;
        v26 = -[DTStoreKitService _handleDiscoverAppsMessage:error:](self, "_handleDiscoverAppsMessage:error:", v7, &v37);
        break;
      case 11:
        v41 = 0;
        v25 = (id *)&v41;
        v26 = -[DTStoreKitService _handleGetConfigurationMessage:forBundleID:error:](self, "_handleGetConfigurationMessage:forBundleID:error:", v7, v10, &v41);
        break;
      case 12:
        v36 = 0;
        v25 = (id *)&v36;
        v26 = -[DTStoreKitService _handleSendPurchaseIntentMessage:forBundleID:error:](self, "_handleSendPurchaseIntentMessage:forBundleID:error:", v7, v10, &v36);
        break;
      case 13:
        v35 = 0;
        v25 = (id *)&v35;
        v26 = -[DTStoreKitService _handleSyncConfigurationAssetMessage:forBundleID:error:](self, "_handleSyncConfigurationAssetMessage:forBundleID:error:", v7, v10, &v35);
        break;
      default:
        DTSKServiceErrorWithDescription(0, CFSTR("Unknown StoreKit service command received: \"%ld\"), v17, v18, v19, v20, v21, v22, v8);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        if (v27)
          goto LABEL_8;
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        v31 = a2;
        v32 = self;
        v33 = 716;
        goto LABEL_29;
    }
    v28 = v26;
    v27 = *v25;
    if (a4)
    {
LABEL_25:
      if (v27)
      {
        v27 = objc_retainAutorelease(v27);
        *a4 = v27;
      }
    }
  }
LABEL_27:

  return v28;
}

- (void)_sendGenericSuccessResponseForMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "newReply");
  objc_msgSend(v5, "setInteger:forMessageKey:", 1, CFSTR("success"));
  -[DTXService channel](self, "channel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendControlAsync:replyHandler:", v5, 0);

}

- (id)_synchronousRemoteObjectProxy:(id *)a3
{
  NSXPCConnection *connectionToDaemon;
  void *v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_222B448A8;
  v13 = sub_222B448B8;
  v14 = 0;
  connectionToDaemon = self->_connectionToDaemon;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_222B47618;
  v8[3] = &unk_24EB29530;
  v8[4] = self;
  v8[5] = &v9;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connectionToDaemon, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v6 = (void *)v10[5];
    if (v6)
      *a3 = objc_retainAutorelease(v6);
  }
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)_descriptionForServiceCommand:(unint64_t)a3
{
  if (a3 < 0xE)
    return off_24EB29578[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown command \"%lu\"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_dataUsingCompatibilityTimeRateFrom:(id)a3 currentVersion:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("settings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("_compatibilityTimeRate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = 0;
        v20 = &v19;
        v21 = 0x3032000000;
        v22 = sub_222B448A8;
        v23 = sub_222B448B8;
        v24 = 0;
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = sub_222B479A8;
        v17[3] = &unk_24EB29558;
        v18 = a4;
        v17[4] = &v19;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v17);
        if (v20[5])
        {
          objc_msgSend(v9, "objectForKeyedSubscript:");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v8, "mutableCopy");
          objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("_timeRate"));
          objc_msgSend(v11, "removeObjectForKey:", CFSTR("_compatibilityTimeRate"));
          objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("settings"));
          objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v7, 0, 0);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v12)
            v14 = (void *)v12;
          else
            v14 = v5;
          v15 = v14;

        }
        else
        {
          v15 = v5;
        }
        _Block_object_dispose(&v19, 8);

      }
      else
      {
        v15 = v5;
      }

    }
    else
    {
      v15 = v5;
    }

  }
  else
  {
    v15 = v5;
  }

  return v15;
}

+ (BOOL)_commandRequiresBundleID:(unint64_t)a3
{
  return a3 != 10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToDaemon, 0);
}

@end
