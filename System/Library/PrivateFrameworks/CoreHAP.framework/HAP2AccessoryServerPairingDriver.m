@implementation HAP2AccessoryServerPairingDriver

- (HAP2AccessoryServerPairingDriver)initWithTransport:(id)a3 secureTransportFactory:(id)a4 encoding:(id)a5 featureFlags:(unint64_t)a6 workItems:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HAP2AccessoryServerPairingDriver *v17;
  uint64_t v18;
  HAP2PropertyLock *propertyLock;
  uint64_t v20;
  HAP2AccessoryServerPairingDriver *v21;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HAP2AccessoryServerPairingDriver;
  v17 = -[HAP2AccessoryServerPairingDriver init](&v23, sel_init);
  if (v17)
  {
    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAP2AccessoryServerPairingDriver.propertyLock"));
    v18 = objc_claimAutoreleasedReturnValue();
    propertyLock = v17->_propertyLock;
    v17->_propertyLock = (HAP2PropertyLock *)v18;

    objc_storeStrong((id *)&v17->_transport, a3);
    objc_storeStrong((id *)&v17->_secureTransportFactory, a4);
    objc_storeStrong((id *)&v17->_encoding, a5);
    v17->_featureFlags = a6;
    if ((_BYTE)a6)
    {
      if ((a6 & 1) != 0)
      {
        v20 = 1;
      }
      else if ((a6 & 2) != 0)
      {
        v20 = 2;
      }
      else if ((a6 & 8) != 0)
      {
        v20 = 4;
      }
      else
      {
        v20 = 5;
        if ((a6 & 0x10) != 0)
          v20 = 6;
      }
    }
    else
    {
      v20 = 0;
    }
    v17->_authMethod = v20;
    objc_storeStrong((id *)&v17->_workItems, a7);
    v21 = v17;
  }

  return v17;
}

- (HAP2AccessoryServerPairingDriver)initWithTransport:(id)a3 secureTransportFactory:(id)a4 encoding:(id)a5 featureFlags:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  HAP2AccessoryServerPairingDriver *v20;
  HAP2AccessoryServerPairingDriver *v21;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_class();
  v14 = 1;
  v15 = 2;
  v16 = 4;
  v17 = 5;
  if ((a6 & 0x10) != 0)
    v17 = 6;
  if ((a6 & 8) == 0)
    v16 = v17;
  if ((a6 & 2) == 0)
    v15 = v16;
  if ((a6 & 1) == 0)
    v14 = v15;
  if ((_BYTE)a6)
    v18 = v14;
  else
    v18 = 0;
  objc_msgSend(v13, "_generateWorkItemsForAuthMethod:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HAP2AccessoryServerPairingDriver initWithTransport:secureTransportFactory:encoding:featureFlags:workItems:](self, "initWithTransport:secureTransportFactory:encoding:featureFlags:workItems:", v12, v11, v10, a6, v19);

  if (v20)
    v21 = v20;

  return v20;
}

- (HAP2SerializedOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (HAPPairSetupSession)pairingSession
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17805;
  v11 = __Block_byref_object_dispose__17806;
  v12 = 0;
  -[HAP2AccessoryServerPairingDriver propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__HAP2AccessoryServerPairingDriver_pairingSession__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAPPairSetupSession *)v4;
}

- (void)setPairingSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2AccessoryServerPairingDriver propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HAP2AccessoryServerPairingDriver_setPairingSession___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (HAP2AccessoryServerTransport)transport
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17805;
  v11 = __Block_byref_object_dispose__17806;
  v12 = 0;
  -[HAP2AccessoryServerPairingDriver propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__HAP2AccessoryServerPairingDriver_transport__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerTransport *)v4;
}

- (HAP2AccessoryServerEncoding)encoding
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17805;
  v11 = __Block_byref_object_dispose__17806;
  v12 = 0;
  -[HAP2AccessoryServerPairingDriver propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__HAP2AccessoryServerPairingDriver_encoding__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerEncoding *)v4;
}

- (HAP2UnpairedAccessoryServer)accessoryServer
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17805;
  v11 = __Block_byref_object_dispose__17806;
  v12 = 0;
  -[HAP2AccessoryServerPairingDriver propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HAP2AccessoryServerPairingDriver_accessoryServer__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2UnpairedAccessoryServer *)v4;
}

- (void)setAccessoryServer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2AccessoryServerPairingDriver propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HAP2AccessoryServerPairingDriver_setAccessoryServer___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (HAP2AccessoryServerPairingDriverDelegate)delegate
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17805;
  v11 = __Block_byref_object_dispose__17806;
  v12 = 0;
  -[HAP2AccessoryServerPairingDriver propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__HAP2AccessoryServerPairingDriver_delegate__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerPairingDriverDelegate *)v4;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2AccessoryServerPairingDriver propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HAP2AccessoryServerPairingDriver_setDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (NSError)cancelError
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17805;
  v11 = __Block_byref_object_dispose__17806;
  v12 = 0;
  -[HAP2AccessoryServerPairingDriver propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HAP2AccessoryServerPairingDriver_cancelError__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSError *)v4;
}

- (void)setCancelError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2AccessoryServerPairingDriver propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HAP2AccessoryServerPairingDriver_setCancelError___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (id)pairAccessory:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v7 = a3;
  v8 = a4;
  -[HAP2AccessoryServerPairingDriver accessoryServer](self, "accessoryServer");

  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EFA376F0))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;
  v11 = objc_alloc(MEMORY[0x1E0D28540]);
  v12 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B692C](self, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@, %s:%ld"), v13, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/CoreHAP/HAP2/Pairing/HAP2AccessoryServerPairingDriver.m", 296);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithName:", v14);

  -[HAP2AccessoryServerPairingDriver setAccessoryServer:](self, "setAccessoryServer:", v10);
  -[HAP2AccessoryServerPairingDriver setDelegate:](self, "setDelegate:", v8);
  -[HAP2AccessoryServerPairingDriver setPairingActivity:](self, "setPairingActivity:", v15);
  if (!self->_operationQueue)
  {
    objc_msgSend(v10, "operationQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerPairingDriver setOperationQueue:](self, "setOperationQueue:", v16);

  }
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriver operationQueue](self, "operationQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __59__HAP2AccessoryServerPairingDriver_pairAccessory_delegate___block_invoke;
  v20[3] = &unk_1E894DF38;
  objc_copyWeak(&v22, &location);
  v18 = v15;
  v21 = v18;
  objc_msgSend(v17, "addBlock:", v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return self;
}

- (id)moveToNextWorkItem
{
  void *v3;

  -[HAP2AccessoryServerPairingDriver operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  -[HAP2AccessoryServerPairingDriver setCurrentWorkItemIndex:](self, "setCurrentWorkItemIndex:", -[HAP2AccessoryServerPairingDriver currentWorkItemIndex](self, "currentWorkItemIndex") + 1);
  return -[HAP2AccessoryServerPairingDriver currentWorkItem](self, "currentWorkItem");
}

- (id)currentWorkItem
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[HAP2AccessoryServerPairingDriver operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  v4 = -[HAP2AccessoryServerPairingDriver currentWorkItemIndex](self, "currentWorkItemIndex");
  -[HAP2AccessoryServerPairingDriver workItems](self, "workItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 >= v6)
  {
    v8 = 0;
  }
  else
  {
    -[HAP2AccessoryServerPairingDriver workItems](self, "workItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriver operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HAP2AccessoryServerPairingDriver_cancelWithError___block_invoke;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_cancelWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HAP2AccessoryServerPairingDriver operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertCurrentQueue");

  -[HAP2AccessoryServerPairingDriver cancelError](self, "cancelError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HAP2AccessoryServerPairingDriver setCancelError:](self, "setCancelError:", v8);
    -[HAP2AccessoryServerPairingDriver currentWorkItem](self, "currentWorkItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "cancelWithError:", v8);
    else
      -[HAP2AccessoryServerPairingDriver _pairingFinishedWithError:](self, "_pairingFinishedWithError:", v8);

  }
}

- (void)_pairingFinishedWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  BOOL v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  HAP2AccessoryServerPairingDriver *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2AccessoryServerPairingDriver operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v6 = hap2Log_accessory;
  v7 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v7)
      goto LABEL_9;
    *(_DWORD *)buf = 138412546;
    v23 = self;
    v24 = 2112;
    v25 = v4;
    v8 = "%@ Finished with error: %@";
    v9 = v6;
    v10 = 22;
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v23 = self;
    v8 = "%@ Finished successfully";
    v9 = v6;
    v10 = 12;
  }
  _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_9:
  v11 = v4 == 0;
  -[HAP2AccessoryServerPairingDriver setPairingSession:](self, "setPairingSession:", 0);
  objc_initWeak((id *)buf, self);
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__HAP2AccessoryServerPairingDriver__pairingFinishedWithError___block_invoke;
  v19[3] = &unk_1E894DF38;
  objc_copyWeak(&v21, (id *)buf);
  v13 = v4;
  v20 = v13;
  v14 = MEMORY[0x1D17B7400](v19);
  v15 = (void *)v14;
  if (v11)
  {
    (*(void (**)(uint64_t))(v14 + 16))(v14);
  }
  else
  {
    -[HAP2AccessoryServerPairingDriver transport](self, "transport");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __62__HAP2AccessoryServerPairingDriver__pairingFinishedWithError___block_invoke_2;
    v17[3] = &unk_1E894CC98;
    v17[4] = self;
    v18 = v15;
    objc_msgSend(v16, "closeWithError:completion:", 0, v17);

  }
  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

}

- (void)workItem:(id)a3 finishedWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[HAP2AccessoryServerPairingDriver operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertCurrentQueue");

  -[HAP2AccessoryServerPairingDriver currentWorkItem](self, "currentWorkItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", v9);

  if (v10)
  {
    -[HAP2AccessoryServerPairingDriver pairingActivity](self, "pairingActivity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HAP2AccessoryServerPairingDriver currentWorkItemIndex](self, "currentWorkItemIndex"));
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[HAP2AccessoryServerPairingDriver workItems](self, "workItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));

    objc_msgSend(v7, "domain");
    objc_msgSend(v7, "code");
    if (v7)
    {
      -[HAP2AccessoryServerPairingDriver _pairingFinishedWithError:](self, "_pairingFinishedWithError:", v7);
    }
    else
    {
      -[HAP2AccessoryServerPairingDriver moveToNextWorkItem](self, "moveToNextWorkItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v11, "begin");
        v17 = v11;
        objc_msgSend(v16, "startWithPairingDriver:", self);
        __HMFActivityScopeLeave();

      }
      else
      {
        -[HAP2AccessoryServerPairingDriver _pairingFinishedWithError:](self, "_pairingFinishedWithError:", 0);
      }

    }
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[HAP2AccessoryServerPairingDriver accessoryServer](self, "accessoryServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)HAP2AccessoryServerPairingDriver;
  -[HAP2LoggingObject description](&v10, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ [%@/%@]"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (unint64_t)authMethod
{
  return self->_authMethod;
}

- (HAP2AccessoryServerSecureTransportFactory)secureTransportFactory
{
  return self->_secureTransportFactory;
}

- (unint64_t)currentWorkItemIndex
{
  return self->_currentWorkItemIndex;
}

- (void)setCurrentWorkItemIndex:(unint64_t)a3
{
  self->_currentWorkItemIndex = a3;
}

- (unint64_t)featureFlags
{
  return self->_featureFlags;
}

- (NSArray)workItems
{
  return self->_workItems;
}

- (HMFActivity)pairingActivity
{
  return (HMFActivity *)objc_loadWeakRetained((id *)&self->_pairingActivity);
}

- (void)setPairingActivity:(id)a3
{
  objc_storeWeak((id *)&self->_pairingActivity, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairingActivity);
  objc_storeStrong((id *)&self->_workItems, 0);
  objc_storeStrong((id *)&self->_cancelError, 0);
  objc_destroyWeak((id *)&self->_accessoryServer);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_storeStrong((id *)&self->_secureTransportFactory, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
}

void __62__HAP2AccessoryServerPairingDriver__pairingFinishedWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "pairingDriver:didCompleteWithError:", WeakRetained, *(_QWORD *)(a1 + 32));

}

void __62__HAP2AccessoryServerPairingDriver__pairingFinishedWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__HAP2AccessoryServerPairingDriver__pairingFinishedWithError___block_invoke_3;
  v3[3] = &unk_1E894D498;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "addBlock:", v3);

}

uint64_t __62__HAP2AccessoryServerPairingDriver__pairingFinishedWithError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__HAP2AccessoryServerPairingDriver_cancelWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_cancelWithError:", *(_QWORD *)(a1 + 32));

}

void __59__HAP2AccessoryServerPairingDriver_pairAccessory_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCurrentWorkItemIndex:", 0);
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v4 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "currentWorkItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startWithPairingDriver:", WeakRetained);

  __HMFActivityScopeLeave();
}

void __51__HAP2AccessoryServerPairingDriver_setCancelError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

void __47__HAP2AccessoryServerPairingDriver_cancelError__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

id __48__HAP2AccessoryServerPairingDriver_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

void __44__HAP2AccessoryServerPairingDriver_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

id __55__HAP2AccessoryServerPairingDriver_setAccessoryServer___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

void __51__HAP2AccessoryServerPairingDriver_accessoryServer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __44__HAP2AccessoryServerPairingDriver_encoding__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __45__HAP2AccessoryServerPairingDriver_transport__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

void __54__HAP2AccessoryServerPairingDriver_setPairingSession___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

void __50__HAP2AccessoryServerPairingDriver_pairingSession__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

+ (id)_generateWorkItemsForAuthMethod:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  id result;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[7];
  _QWORD v19[4];
  _QWORD v20[8];

  v20[7] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0uLL:
    case 5uLL:
      +[HAP2AccessoryServerPairingDriverAuthPromptWorkItem promptForType:](HAP2AccessoryServerPairingDriverAuthPromptWorkItem, "promptForType:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v3;
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "openConnection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v4;
      +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:](HAP2AccessoryServerPairingDriverPairSetupWorkItem, "pairSetupWithType:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2] = v5;
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "closeConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17[3] = v6;
      v7 = (void *)MEMORY[0x1E0C99D20];
      v8 = v17;
      goto LABEL_7;
    case 1uLL:
    case 3uLL:
      +[HAP2AccessoryServerPairingDriverAuthPromptWorkItem promptForType:](HAP2AccessoryServerPairingDriverAuthPromptWorkItem, "promptForType:", 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v3;
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "openConnection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v4;
      +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:](HAP2AccessoryServerPairingDriverPairSetupWorkItem, "pairSetupWithType:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v5;
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "closeConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16[3] = v6;
      v7 = (void *)MEMORY[0x1E0C99D20];
      v8 = v16;
      goto LABEL_7;
    case 2uLL:
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "openConnection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v3;
      +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:](HAP2AccessoryServerPairingDriverPairSetupWorkItem, "pairSetupWithType:", 3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v4;
      +[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem doSoftwareAuth](HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem, "doSoftwareAuth");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v5;
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "closeConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v20[3] = v6;
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "openConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[4] = v10;
      +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:](HAP2AccessoryServerPairingDriverPairSetupWorkItem, "pairSetupWithType:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[5] = v11;
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "closeConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[6] = v12;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = v20;
      goto LABEL_9;
    case 4uLL:
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "openConnection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v3;
      +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:](HAP2AccessoryServerPairingDriverPairSetupWorkItem, "pairSetupWithType:", 5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v4;
      +[HAP2AccessoryServerPairingDriverMFiCertWorkItem checkCertificate](HAP2AccessoryServerPairingDriverMFiCertWorkItem, "checkCertificate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2] = v5;
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "closeConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19[3] = v6;
      v7 = (void *)MEMORY[0x1E0C99D20];
      v8 = v19;
LABEL_7:
      objc_msgSend(v7, "arrayWithObjects:count:", v8, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6uLL:
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "openConnection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v3;
      +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:](HAP2AccessoryServerPairingDriverPairSetupWorkItem, "pairSetupWithType:", 6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v4;
      +[HAP2AccessoryServerPairingDriverMFiCertWorkItem checkCertificate](HAP2AccessoryServerPairingDriverMFiCertWorkItem, "checkCertificate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v5;
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "closeConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18[3] = v6;
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem openConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "openConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[4] = v10;
      +[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupWithType:](HAP2AccessoryServerPairingDriverPairSetupWorkItem, "pairSetupWithType:", 7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[5] = v11;
      +[HAP2AccessoryServerPairingDriverTransportControlWorkItem closeConnection](HAP2AccessoryServerPairingDriverTransportControlWorkItem, "closeConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[6] = v12;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = v18;
LABEL_9:
      objc_msgSend(v13, "arrayWithObjects:count:", v14, 7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      result = v15;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

@end
