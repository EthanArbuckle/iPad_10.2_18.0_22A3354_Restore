@implementation CONodeController

- (CONodeController)initWithDiscoveryRecord:(id)a3 executionContext:(id)a4
{
  id v7;
  id v8;
  CONodeController *v9;
  CONodeController *v10;
  uint64_t v11;
  NSMutableArray *records;
  uint64_t v13;
  NSMutableArray *transports;
  CONode *v15;
  CONode *node;
  uint64_t v17;
  NSMutableDictionary *sentElements;
  uint64_t v19;
  NSMutableDictionary *knownDiscoveryRecords;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CONodeController;
  v9 = -[CONodeController init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalRecord, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    records = v10->_records;
    v10->_records = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    transports = v10->_transports;
    v10->_transports = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v10->_executionContext, a4);
    v15 = -[CONode initWithRecord:executionContext:delegate:]([CONode alloc], "initWithRecord:executionContext:delegate:", v7, v8, v10);
    node = v10->_node;
    v10->_node = v15;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    sentElements = v10->_sentElements;
    v10->_sentElements = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    knownDiscoveryRecords = v10->_knownDiscoveryRecords;
    v10->_knownDiscoveryRecords = (NSMutableDictionary *)v19;

  }
  return v10;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeController executionContext](self, "executionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constituentForMe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeController remote](self, "remote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeController node](self, "node");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p,/\n, %@->%@/\n, State: %ld/\n, Records:%@, Transports: %@>"), v5, self, v7, v8, objc_msgSend(v9, "state"), self->_records, self->_transports);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CONodeController executionContext](self, "executionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meshControllerDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[m:%@] <%@: %p>"), v5, v7, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)remote
{
  void *v2;
  void *v3;

  -[CONodeController node](self, "node");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (COTransportProtocol)preferredTransport
{
  COTransportProtocol *preferredTransport;
  COTransportProtocol *v4;
  COTransportProtocol *v5;

  preferredTransport = self->_preferredTransport;
  if (!preferredTransport)
  {
    -[CONodeController computePreferredTransport](self, "computePreferredTransport");
    v4 = (COTransportProtocol *)objc_claimAutoreleasedReturnValue();
    v5 = self->_preferredTransport;
    self->_preferredTransport = v4;

    preferredTransport = self->_preferredTransport;
  }
  return preferredTransport;
}

- (BOOL)isLocalNodeController
{
  void *v2;

  v2 = (void *)objc_opt_class();
  return objc_msgSend(v2, "isSubclassOfClass:", objc_opt_class());
}

- (BOOL)supportsLeaderElection
{
  return -[COTransportProtocol supportsLeaderElection](self->_preferredTransport, "supportsLeaderElection");
}

- (id)rapportTransport
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CONodeController transports](self, "transports", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;

          v5 = v9;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CODiscoveryRecord)ipDiscoveryRecord
{
  CODiscoveryRecord *ipDiscoveryRecord;
  CODiscoveryRecord *v4;
  CODiscoveryRecord *v5;

  ipDiscoveryRecord = self->_ipDiscoveryRecord;
  if (!ipDiscoveryRecord)
  {
    +[CODiscoveryRecord discoveryRecordWithNodeController:](CODiscoveryRecord, "discoveryRecordWithNodeController:", self);
    v4 = (CODiscoveryRecord *)objc_claimAutoreleasedReturnValue();
    v5 = self->_ipDiscoveryRecord;
    self->_ipDiscoveryRecord = v4;

    ipDiscoveryRecord = self->_ipDiscoveryRecord;
  }
  return ipDiscoveryRecord;
}

- (id)electionSummaryDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v26;

  -[CONodeController node](self, "node");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remote");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CONodeController preferredTransport](self, "preferredTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeController node](self, "node");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "meConstituent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeController node](self, "node");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remote");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v5;
    objc_msgSend(v26, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      objc_msgSend(v11, "localDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = CFSTR("SELF");
    }
    else
    {
      objc_msgSend(v11, "destinationDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "name");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeController node](self, "node");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "connectionType");

    if (v19 > 2)
      v16 = 0;
    else
      v16 = off_24D4B45F8[v19];
    -[CONodeController node](self, "node");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "discoveryType");

    v22 = 67;
    if ((v21 & 2) == 0)
      v22 = 99;
    v23 = 82;
    if ((v21 & 1) == 0)
      v23 = 114;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c"), v23, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
    v16 = 0;
    v14 = 0;
    v17 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[COMeshController : %p] %@ [Name] - %@ [Rapport ID] - %@ [Conn] - %@ [Disc] - %@"), self, v4, v14, v17, v16, v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)nodeAfterReconciliation
{
  void *v3;
  void *v4;

  -[CONodeController node](self, "node");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "HomeKitIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[CONodeController reconcileNode](self, "reconcileNode");
  return v3;
}

- (void)reconcileNode
{
  void *v3;
  CONodeController *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[CONodeController node](self, "node");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  -[CONodeController records](v4, "records");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "copy");

  objc_sync_exit(v4);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__CONodeController_reconcileNode__block_invoke;
  v8[3] = &unk_24D4B4398;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

void __33__CONodeController_reconcileNode__block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;
  void *v7;

  objc_msgSend(a2, "HomeKitIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = v6 != 0;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "setHomeKitIdentifier:", v6);
    v6 = v7;
  }

}

- (void)activateWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  CONodeController *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[CONodeController executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  -[CONodeController preferredTransport](self, "preferredTransport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v4[2](v4, 0);
  }
  else
  {
    v7 = self;
    objc_sync_enter(v7);
    -[CONodeController records](v7, "records");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeController originalRecord](v7, "originalRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    objc_sync_exit(v7);
    -[CONodeController originalRecord](v7, "originalRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __50__CONodeController_activateWithCompletionHandler___block_invoke;
    v11[3] = &unk_24D4B43C0;
    v12 = v4;
    -[CONodeController _createAndActivateTransportForRecord:withCompletionHandler:](v7, "_createAndActivateTransportForRecord:withCompletionHandler:", v10, v11);

  }
}

uint64_t __50__CONodeController_activateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_createAndActivateTransportForRecord:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  COTransportProtocol *v12;
  COTransportProtocol *preferredTransport;
  NSObject *v14;
  void *v15;
  COTransportProtocol *v16;
  void *v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id *v25;
  id *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  void (**v31)(_QWORD);
  id v32[2];
  _QWORD v33[4];
  void (**v34)(_QWORD);
  id v35[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id location;
  _BYTE v49[128];
  _BYTE from[12];
  __int16 v51;
  void *v52;
  __int16 v53;
  COTransportProtocol *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v6 = a4;
  -[CONodeController executionContext](self, "executionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v28, "newTransportWithExecutionContext:", v7);

  objc_initWeak(&location, v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak((id *)from, self);
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke;
    v45[3] = &unk_24D4B0A78;
    objc_copyWeak(&v46, (id *)from);
    objc_copyWeak(&v47, &location);
    objc_msgSend(v8, "setClientIsUsingOnDemandConnection:", v45);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&v46);
    objc_destroyWeak((id *)from);
  }
  COCoreLogForCategory(16);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeController shortDescription](self, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)from = 138543874;
    *(_QWORD *)&from[4] = v10;
    v51 = 2112;
    v52 = v8;
    v53 = 2112;
    v54 = (COTransportProtocol *)v28;
    _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ created new transport %@ with record %@", from, 0x20u);

  }
  objc_msgSend(v8, "setDelegate:", self);
  -[CONodeController transports](self, "transports");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v8);

  -[CONodeController computePreferredTransport](self, "computePreferredTransport");
  v12 = (COTransportProtocol *)objc_claimAutoreleasedReturnValue();
  preferredTransport = self->_preferredTransport;
  self->_preferredTransport = v12;

  COCoreLogForCategory(16);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeController shortDescription](self, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_preferredTransport;
    *(_DWORD *)from = 138543874;
    *(_QWORD *)&from[4] = v15;
    v51 = 2048;
    v52 = v8;
    v53 = 2048;
    v54 = v16;
    _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ recomputing preferred transport after addition of %p. Preferred transport = %p", from, 0x20u);

  }
  -[CONodeController originalRecord](self, "originalRecord");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeController _adjustNodeDiscoveryInformationUsingRecord:](self, "_adjustNodeDiscoveryInformationUsingRecord:", v17);

  objc_initWeak((id *)from, self);
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_46;
  v40[3] = &unk_24D4B4410;
  objc_copyWeak(&v43, (id *)from);
  objc_copyWeak(&v44, &location);
  v29 = v8;
  v41 = v29;
  v27 = v6;
  v42 = v27;
  v18 = (void (**)(_QWORD))MEMORY[0x2199F3D40](v40);
  -[CONodeController acceptableCommands](self, "acceptableCommands");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self->_expectedRegisteredCommandCount = objc_msgSend(v19, "count");

  if (!self->_expectedRegisteredCommandCount)
  {
    v18[2](v18);
    goto LABEL_22;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[CONodeController acceptableCommands](self, "acceptableCommands");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (!v21)
    goto LABEL_20;
  v22 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v37 != v22)
        objc_enumerationMutation(v20);
      v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      if (objc_msgSend(v24, "isSubclassOfClass:", objc_opt_class()))
      {
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_52;
        v33[3] = &unk_24D4B4438;
        objc_copyWeak(v35, (id *)from);
        v35[1] = v24;
        v34 = v18;
        objc_msgSend(v29, "registerRequestForClass:withCompletion:", v24, v33);
        v25 = (id *)&v34;
        v26 = v35;
      }
      else
      {
        if (!objc_msgSend(v24, "isSubclassOfClass:", objc_opt_class()))
          continue;
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_55;
        v30[3] = &unk_24D4B4438;
        objc_copyWeak(v32, (id *)from);
        v32[1] = v24;
        v31 = v18;
        objc_msgSend(v29, "registerCommandForClass:withCompletion:", v24, v30);
        v25 = (id *)&v31;
        v26 = v32;
      }

      objc_destroyWeak(v26);
    }
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  }
  while (v21);
LABEL_20:

LABEL_22:
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)from);
  objc_destroyWeak(&location);

}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertDispatchQueue");

    COCoreLogForCategory(16);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ is using an on-demand connection for transport %@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(WeakRetained, "node");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConnectionType:", 2);

    objc_msgSend(WeakRetained, "node");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDiscoveryType:", 2);

  }
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_46(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = v4;
  if (WeakRetained && v4)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assertDispatchQueue");

    objc_msgSend(WeakRetained, "setHandlersRegistered:", 1);
    COCoreLogForCategory(16);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      v16 = 2048;
      v17 = v9;
      _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Handlers registered. Activating transport %p", buf, 0x16u);

    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_47;
    v10[3] = &unk_24D4B43E8;
    objc_copyWeak(&v12, v2);
    objc_copyWeak(&v13, (id *)(a1 + 56));
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v5, "activateWithCompletion:", v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
  }

}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = v5;
  if (WeakRetained && v5)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertDispatchQueue");

    if (v3)
    {
      COCoreLogForCategory(16);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_47_cold_1();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      WeakRetained[8] = 1;
      COCoreLogForCategory(16);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "shortDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v10;
        v14 = 2048;
        v15 = v6;
        _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully activated transport %p", (uint8_t *)&v12, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      objc_msgSend(WeakRetained, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "nodeController:didAddTransport:", WeakRetained, v6);

    }
  }

}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_52(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_2;
    v6[3] = &unk_24D4B16A8;
    v5 = *(_QWORD *)(a1 + 48);
    v6[4] = v3;
    v8 = v5;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "dispatchAsync:", v6);

  }
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(16);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    v5 = 138543618;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully registered request %@", (uint8_t *)&v5, 0x16u);

  }
  if (!--*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_55(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_2_56;
    v6[3] = &unk_24D4B16A8;
    v5 = *(_QWORD *)(a1 + 48);
    v6[4] = v3;
    v8 = v5;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v4, "dispatchAsync:", v6);

  }
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_2_56(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(16);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    v5 = 138543618;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully registered command %@", (uint8_t *)&v5, 0x16u);

  }
  if (!--*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)invalidateWithReason:(int64_t)a3
{
  void *v5;
  CONodeController *v6;
  NSMutableArray *records;
  NSMutableArray *transports;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[CONodeController executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  v6 = self;
  objc_sync_enter(v6);
  records = v6->_records;
  v6->_records = 0;

  objc_sync_exit(v6);
  transports = v6->_transports;
  v6->_transports = 0;

  -[CONodeController node](v6, "node");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastElectionInfoSent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeController node](v6, "node");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastElectionInfoReceived");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](v6, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 4, v9, v11, a3);

}

- (void)stopWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  COMeshWithdrawalCommand *v16;
  uint64_t v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(_QWORD);
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CONodeController executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  -[CONodeController node](self, "node");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastElectionInfoSent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeController node](self, "node");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastElectionInfoReceived");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](self, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 3, v7, v9, 15);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[CONodeController acceptableCommands](self, "acceptableCommands");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v11)
    goto LABEL_13;
  v12 = *(_QWORD *)v29;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v29 != v12)
        objc_enumerationMutation(v10);
      v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
      if (objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()))
      {
        -[CONodeController preferredTransport](self, "preferredTransport");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "deregisterRequestForClass:", v14);
      }
      else
      {
        if (!objc_msgSend(v14, "isSubclassOfClass:", objc_opt_class()))
          goto LABEL_11;
        -[CONodeController preferredTransport](self, "preferredTransport");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "deregisterCommandForClass:", v14);
      }

LABEL_11:
      ++v13;
    }
    while (v11 != v13);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v11);
LABEL_13:

  v16 = objc_alloc_init(COMeshWithdrawalCommand);
  objc_initWeak(&location, self);
  v17 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __46__CONodeController_stopWithCompletionHandler___block_invoke;
  v24[3] = &unk_24D4B1478;
  objc_copyWeak(&v26, &location);
  v18 = v4;
  v25 = v18;
  v19 = (void (**)(_QWORD))MEMORY[0x2199F3D40](v24);
  -[CONodeController preferredTransport](self, "preferredTransport");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CONodeController preferredTransport](self, "preferredTransport");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __46__CONodeController_stopWithCompletionHandler___block_invoke_2;
    v22[3] = &unk_24D4B22C0;
    v23 = v19;
    objc_msgSend(v21, "sendCommand:withCompletionHandler:", v16, v22);

  }
  else
  {
    v19[2](v19);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __46__CONodeController_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertDispatchQueue");

    objc_msgSend(v3, "node");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastElectionInfoSent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "node");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastElectionInfoReceived");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 4, v6, v8, 16);

    objc_msgSend(v3, "setPreferredTransport:", 0);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v3[10];
    v3[10] = v9;

    v11 = v3;
    objc_sync_enter(v11);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v11[9];
    v11[9] = v12;

    objc_sync_exit(v11);
    objc_msgSend(v11, "transports");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "invalidateWithError:", 0, (_QWORD)v20);
        }
        while (v17 != v19);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v17);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __46__CONodeController_stopWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addDiscoveryRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CONodeController *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CONodeController *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CONodeController executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  -[CONodeController node](self, "node");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "discoveryRecordAdded:", v4);

  v7 = self;
  objc_sync_enter(v7);
  -[CONodeController records](v7, "records");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254E13B70))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v31;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v12), "conformsToProtocol:", &unk_254E13B70) & 1) != 0)
          {

            goto LABEL_31;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254E12EF0))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v8;
    v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v27;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v15), "conformsToProtocol:", &unk_254E12EF0) & 1) != 0)
          {

            goto LABEL_31;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
        if (v13)
          continue;
        break;
      }
    }

  }
  v16 = v7;
  objc_sync_enter(v16);
  -[CONodeController records](v16, "records");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v4);

  -[CONodeController records](v16, "records");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v16);
  COCoreLogForCategory(16);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeController shortDescription](v16, "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v19;
    v36 = 2112;
    v37 = v4;
    v38 = 2112;
    v39 = v9;
    _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding discovery record %@ to our list. New list = %@", buf, 0x20u);

  }
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254E13B70)
    && (-[CONodeController rapportTransport](v16, "rapportTransport"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v20))
  {
    COCoreLogForCategory(16);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeController shortDescription](v16, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v22;
      v36 = 2112;
      v37 = v4;
      _os_log_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ rapport transport already exists. Ignoring record %@.", buf, 0x16u);

    }
  }
  else
  {
    objc_initWeak((id *)buf, v16);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __39__CONodeController_addDiscoveryRecord___block_invoke;
    v23[3] = &unk_24D4B4460;
    objc_copyWeak(&v25, (id *)buf);
    v24 = v4;
    -[CONodeController _createAndActivateTransportForRecord:withCompletionHandler:](v16, "_createAndActivateTransportForRecord:withCompletionHandler:", v24, v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
LABEL_31:

}

void __39__CONodeController_addDiscoveryRecord___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assertDispatchQueue");

    if (v6)
    {
      COCoreLogForCategory(16);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __39__CONodeController_addDiscoveryRecord___block_invoke_cold_1(v8);

      v11 = v8;
      objc_sync_enter(v11);
      objc_msgSend(v11, "records");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObject:", *(_QWORD *)(a1 + 32));

      objc_sync_exit(v11);
    }
  }

}

- (void)removeDiscoveryRecord:(id)a3
{
  id v4;
  void *v5;
  char **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  char **v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  CONodeController *v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CONodeController executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  v6 = &selRef_setElectionStart_;
  v7 = objc_msgSend(v4, "conformsToProtocol:", &unk_254E13B70);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[CONodeController transports](self, "transports");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v24 = self;
    v10 = *(_QWORD *)v28;
    while (2)
    {
      v11 = 0;
      v25 = v9;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        objc_msgSend(v12, "record");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 & objc_msgSend(v13, "conformsToProtocol:", v6[470])) == 1)
        {
          objc_msgSend(v4, "IDSIdentifier");
          v14 = v10;
          v15 = v7;
          v16 = v4;
          v17 = v6;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "IDSIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          v6 = v17;
          v4 = v16;
          v7 = v15;
          v10 = v14;
          v9 = v25;
          if ((v20 & 1) != 0)
            goto LABEL_13;
        }
        else if (objc_msgSend(v4, "isEqual:", v13))
        {
LABEL_13:
          v21 = v12;

          goto LABEL_14;
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v9)
        continue;
      break;
    }
    v21 = 0;
LABEL_14:
    self = v24;
  }
  else
  {
    v21 = 0;
  }

  -[CONodeController node](self, "node");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "discoveryRecordRemoved:", v4);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", 0x24D4B5978, -5001, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "invalidateWithError:", v23);

}

- (void)sendCommand:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  id *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  -[CONodeController executionContext](self, "executionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDispatchQueue");

  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  -[CONodeController sentElements](self, "sentElements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x2199F3D40](v7);
  objc_msgSend(v9, "setObject:forKey:", v10, v6);

  objc_initWeak(&location, self);
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CONodeController preferredTransport](self, "preferredTransport");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "command");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __54__CONodeController_sendCommand_withCompletionHandler___block_invoke;
    v17[3] = &unk_24D4B4488;
    v13 = v17;
    v14 = &v18;
    objc_copyWeak(&v18, &location);
    v17[4] = v6;
    objc_msgSend(v11, "sendRequest:withResponseHandler:", v12, v17);
  }
  else
  {
    -[CONodeController preferredTransport](self, "preferredTransport");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "command");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __54__CONodeController_sendCommand_withCompletionHandler___block_invoke_115;
    v15[3] = &unk_24D4B26D8;
    v13 = v15;
    v14 = &v16;
    objc_copyWeak(&v16, &location);
    v15[4] = v6;
    objc_msgSend(v11, "sendCommand:withCompletionHandler:", v12, v15);
  }

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

void __54__CONodeController_sendCommand_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  COMeshNode *v9;
  void *v10;
  COMeshNode *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_14;
  if (v6)
  {
    v9 = [COMeshNode alloc];
    objc_msgSend(WeakRetained, "node");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[COMeshNode initWithNode:](v9, "initWithNode:", v10);

    objc_msgSend(v6, "_setSender:", v11);
  }
  if (v7)
  {
    COCoreLogForCategory(16);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "command");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v21;
      v25 = 2112;
      v26 = v22;
      v27 = 2112;
      v28 = v7;
      _os_log_error_impl(&dword_215E92000, v12, OS_LOG_TYPE_ERROR, "%{public}@ request %@ failed with error %@", (uint8_t *)&v23, 0x20u);

    }
    objc_msgSend(v7, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isEqualToString:", CFSTR("COMeshNodeErrorDomain")))
      goto LABEL_10;
    v14 = objc_msgSend(v7, "code");

    if (v14 == -4000)
    {
      objc_msgSend(WeakRetained, "node");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastElectionInfoSent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "node");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastElectionInfoReceived");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 2, v15, v17, 14);

LABEL_10:
    }
  }
  objc_msgSend(WeakRetained, "sentElements");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", *(_QWORD *)(a1 + 32));
  v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v19)
    ((void (**)(_QWORD, _QWORD, id, id))v19)[2](v19, *(_QWORD *)(a1 + 32), v6, v7);
  objc_msgSend(WeakRetained, "sentElements");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

LABEL_14:
}

void __54__CONodeController_sendCommand_withCompletionHandler___block_invoke_115(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      COCoreLogForCategory(16);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(WeakRetained, "shortDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "command");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543874;
        v12 = v9;
        v13 = 2112;
        v14 = v10;
        v15 = 2112;
        v16 = v3;
        _os_log_error_impl(&dword_215E92000, v5, OS_LOG_TYPE_ERROR, "%{public}@ command %@ failed with error %@", (uint8_t *)&v11, 0x20u);

      }
    }
    objc_msgSend(WeakRetained, "sentElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 32));
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v7)
      ((void (**)(_QWORD, _QWORD, _QWORD, id))v7)[2](v7, *(_QWORD *)(a1 + 32), 0, v3);
    objc_msgSend(WeakRetained, "sentElements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

  }
}

- (void)sendPing
{
  void *v3;
  id v4;

  -[CONodeController executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDispatchQueue");

  -[CONodeController preferredTransport](self, "preferredTransport");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CONodeController _sendPingUsingTransport:](self, "_sendPingUsingTransport:", v4);

}

- (void)markInactive
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(16);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeController shortDescription](self, "shortDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing remote constituent identifier to nil", (uint8_t *)&v7, 0xCu);

  }
  -[CONodeController node](self, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemote:", 0);

  -[CONodeController preferredTransport](self, "preferredTransport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemote:", 0);

}

- (id)computePreferredTransport
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[CONodeController executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDispatchQueue");

  -[CONodeController transports](self, "transports");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "count");

  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CONodeController transports](self, "transports", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v5 = v11;

      if (v5)
        return v5;
    }
    else
    {
LABEL_10:

    }
    -[CONodeController transports](self, "transports");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)updateElectionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  CONodeController *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CONodeController executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  -[CONodeController executionContext](self, "executionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "leaderElectionConfigured");

  if (v7)
  {
    -[CONodeController node](self, "node");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "state");

    if (self->_activated && v9 != 3 && v9 != 4)
    {
      switch(-[CONodeController _nodeControllerStateFromNodeState](self, "_nodeControllerStateFromNodeState"))
      {
        case 0:
          -[CONodeController _electionRequestWithElectionInfo:](self, "_electionRequestWithElectionInfo:", v4);
          v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[CONodeController preferredTransport](self, "preferredTransport");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = self;
          v13 = v10;
          v14 = 1;
          goto LABEL_8;
        case 2:
          -[CONodeController _electionRequestWithElectionInfo:](self, "_electionRequestWithElectionInfo:", v4);
          v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[CONodeController preferredTransport](self, "preferredTransport");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = self;
          v13 = v10;
          v14 = 2;
LABEL_8:
          -[CONodeController _sendProbeRequest:withState:usingTransport:](v12, "_sendProbeRequest:withState:usingTransport:", v13, v14, v11);
          break;
        case 5:
          -[CONodeController node](self, "node");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "state");

          if (v16 != 5)
            goto LABEL_10;
          -[CONodeController node](self, "node");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastElectionInfoSent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v4, "isEqual:", v18);

          if ((v19 & 1) != 0)
            goto LABEL_10;
          -[CONodeController node](self, "node");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "backoffResponse");
          v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

          COCoreLogForCategory(16);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (v10)
          {
            if (v22)
            {
              -[CONodeController shortDescription](self, "shortDescription");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = 138543618;
              v32 = v23;
              v33 = 2048;
              v34 = objc_msgSend(v4, "generation");
              _os_log_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ delayed BALLOT (%llu) response since our ballot or generation has changed", (uint8_t *)&v31, 0x16u);

            }
            -[CONodeController _ballotResponseWithElectionInfo:](self, "_ballotResponseWithElectionInfo:", v4);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, _QWORD))v10)[2](v10, v11, 0);
            -[CONodeController node](self, "node");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setBackoffResponse:", 0);
          }
          else
          {
            if (v22)
            {
              -[CONodeController shortDescription](self, "shortDescription");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = 138543618;
              v32 = v30;
              v33 = 2048;
              v34 = objc_msgSend(v4, "generation");
              _os_log_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ our ballot or generation has changed. Issuing a new election with generation (%llu)", (uint8_t *)&v31, 0x16u);

            }
            -[CONodeController _electionRequestWithElectionInfo:](self, "_electionRequestWithElectionInfo:", v4);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[CONodeController preferredTransport](self, "preferredTransport");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[CONodeController _sendElectionRequest:usingTransport:](self, "_sendElectionRequest:usingTransport:", v11, v24);
          }

          break;
        case 6:
          -[CONodeController node](self, "node");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastElectionInfoSent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v4, "hasSameGenerationAndLeader:", v26);

          if ((v27 & 1) != 0)
            goto LABEL_10;
          COCoreLogForCategory(16);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            -[CONodeController shortDescription](self, "shortDescription");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 138543618;
            v32 = v29;
            v33 = 2048;
            v34 = objc_msgSend(v4, "generation");
            _os_log_impl(&dword_215E92000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ starting ELECTION (%llu)", (uint8_t *)&v31, 0x16u);

          }
          -[CONodeController _electionRequestWithElectionInfo:](self, "_electionRequestWithElectionInfo:", v4);
          v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[CONodeController preferredTransport](self, "preferredTransport");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[CONodeController _sendElectionRequest:usingTransport:](self, "_sendElectionRequest:usingTransport:", v10, v11);
          break;
        default:
          goto LABEL_10;
      }

    }
  }
LABEL_10:

}

- (void)inquireForTransport:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _BOOL4 v8;
  _COMeshControllerPing *v9;
  CONodeController *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  CONodeController *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requiresInquiry");

  COCoreLogForCategory(16);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v14 = self;
      _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to inquire", buf, 0xCu);
    }

    v9 = -[_COMeshControllerPing initWithTimeout:listeningPort:]([_COMeshControllerPing alloc], "initWithTimeout:listeningPort:", objc_msgSend(v4, "listeningPort"), 0.0);
    if (-[CONodeController state](self, "state") != 6)
      -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](self, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 1, 0, 0, 1);
    objc_initWeak((id *)buf, self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __40__CONodeController_inquireForTransport___block_invoke;
    v11[3] = &unk_24D4B44B0;
    objc_copyWeak(&v12, (id *)buf);
    objc_msgSend(v4, "sendRequest:withResponseHandler:", v9, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (v8)
    {
      -[CONodeController shortDescription](self, "shortDescription");
      v10 = (CONodeController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ transport %@ does not require inquiry. Moving to processing", buf, 0x16u);

    }
    -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](self, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 14, 0, 0, 2);
  }

}

void __40__CONodeController_inquireForTransport___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    COCoreLogForCategory(16);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __40__CONodeController_inquireForTransport___block_invoke_cold_1();

    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "shortDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Inquiry successful", (uint8_t *)&v10, 0xCu);

      }
      objc_msgSend(WeakRetained, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 14, 0, 0, 2);
    }
  }

}

- (void)_sendProbeRequest:(id)a3 withState:(int64_t)a4 usingTransport:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  COElectionInfo *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (self->_activated)
  {
    -[CONodeController node](self, "node");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasOutstandingProbe");

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "isEqual:", v12);

      COCoreLogForCategory(16);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[CONodeController shortDescription](self, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ probing with election request %@", buf, 0x16u);

      }
      v15 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v8);
      -[CONodeController node](self, "node");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastElectionInfoReceived");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](self, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", a4, v15, v17, 0);

      -[CONodeController node](self, "node");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLastElectionInfoSent:", v15);

      -[CONodeController node](self, "node");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setOutstandingProbe:", 1);

      objc_initWeak((id *)buf, self);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __63__CONodeController__sendProbeRequest_withState_usingTransport___block_invoke;
      v20[3] = &unk_24D4B4488;
      objc_copyWeak(&v22, (id *)buf);
      v21 = v9;
      objc_msgSend(v21, "sendRequest:withResponseHandler:", v8, v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);

    }
  }

}

void __63__CONodeController__sendProbeRequest_withState_usingTransport___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "node");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOutstandingProbe:", 0);

    objc_msgSend(v10, "_handleResponseToCoreRequest:response:error:usingTransport:", v12, v7, v8, *(_QWORD *)(a1 + 32));
  }

}

- (void)_sendElectionRequest:(id)a3 usingTransport:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  COElectionInfo *v10;
  void *v11;
  void *v12;
  COElectionInfo *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  if (self->_activated)
  {
    -[CONodeController node](self, "node");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasOutstandingRequest");

    if ((v9 & 1) == 0)
    {
      v10 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v6);
      -[CONodeController node](self, "node");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastElectionInfoReceived");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](self, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 6, v10, v12, 10);

      v13 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v6);
      -[CONodeController node](self, "node");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLastElectionInfoSent:", v13);

      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __56__CONodeController__sendElectionRequest_usingTransport___block_invoke;
      v15[3] = &unk_24D4B4488;
      objc_copyWeak(&v17, &location);
      v16 = v7;
      objc_msgSend(v16, "sendRequest:withResponseHandler:", v6, v15);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);

    }
  }

}

void __56__CONodeController__sendElectionRequest_usingTransport___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleResponseToCoreRequest:response:error:usingTransport:", v11, v7, v8, *(_QWORD *)(a1 + 32));

}

- (void)_sendPingUsingTransport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_activated)
  {
    if ((objc_msgSend(v4, "conformsToProtocol:", &unk_254E121A0) & 1) != 0)
    {
      -[CONodeController node](self, "node");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasPendingPing");

      if ((v7 & 1) == 0)
      {
        -[CONodeController node](self, "node");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPendingPing:", 1);

        objc_initWeak(&location, self);
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __44__CONodeController__sendPingUsingTransport___block_invoke;
        v10[3] = &unk_24D4B4488;
        objc_copyWeak(&v12, &location);
        v11 = v5;
        objc_msgSend(v11, "pingWithCallback:", v10);

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      COCoreLogForCategory(16);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[CONodeController _sendPingUsingTransport:].cold.1(self, (uint64_t)v5, v9);

    }
  }

}

void __44__CONodeController__sendPingUsingTransport___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "node");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPendingPing:", 0);

    objc_msgSend(v10, "_handleResponseToCoreRequest:response:error:usingTransport:", v12, v7, v8, *(_QWORD *)(a1 + 32));
  }

}

- (void)_sendBallotResponse:(id)a3 usingTransport:(id)a4 callback:(id)a5
{
  void (**v7)(id, id, _QWORD);
  id v8;
  void *v9;
  void *v10;
  COElectionInfo *v11;
  void *v12;
  COElectionInfo *v13;

  if (self->_activated)
  {
    v7 = (void (**)(id, id, _QWORD))a5;
    v8 = a3;
    v13 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v8);
    -[CONodeController node](self, "node");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastElectionInfoReceived");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](self, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 7, v13, v10, 10);

    v11 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v8);
    -[CONodeController node](self, "node");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLastElectionInfoSent:", v11);

    v7[2](v7, v8, 0);
  }
}

- (void)_sendVoteRequest:(id)a3 usingTransport:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  COElectionInfo *v10;
  void *v11;
  void *v12;
  COElectionInfo *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  if (self->_activated)
  {
    -[CONodeController node](self, "node");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasOutstandingRequest");

    if ((v9 & 1) == 0)
    {
      v10 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v6);
      -[CONodeController node](self, "node");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastElectionInfoReceived");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](self, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 8, v10, v12, 10);

      v13 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v6);
      -[CONodeController node](self, "node");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLastElectionInfoSent:", v13);

      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __52__CONodeController__sendVoteRequest_usingTransport___block_invoke;
      v15[3] = &unk_24D4B4488;
      objc_copyWeak(&v17, &location);
      v16 = v7;
      objc_msgSend(v16, "sendRequest:withResponseHandler:", v6, v15);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);

    }
  }

}

void __52__CONodeController__sendVoteRequest_usingTransport___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleResponseToCoreRequest:response:error:usingTransport:", v11, v7, v8, *(_QWORD *)(a1 + 32));

}

- (void)_sendAcceptResponse:(id)a3 usingTransport:(id)a4 callback:(id)a5
{
  void (**v7)(id, id, _QWORD);
  id v8;
  void *v9;
  void *v10;
  COElectionInfo *v11;
  void *v12;
  COElectionInfo *v13;

  if (self->_activated)
  {
    v7 = (void (**)(id, id, _QWORD))a5;
    v8 = a3;
    v13 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v8);
    -[CONodeController node](self, "node");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastElectionInfoReceived");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](self, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 9, v13, v10, 10);

    v11 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v8);
    -[CONodeController node](self, "node");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLastElectionInfoSent:", v11);

    v7[2](v7, v8, 0);
  }
}

- (void)_handleElectionRequest:(id)a3 fromTransport:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  COElectionInfo *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  COElectionInfo *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  COElectionInfo *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  int v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_activated)
  {
    v30 = v10;
    v11 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v8);
    -[CONodeController node](self, "node");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastElectionInfoReceived");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[CONodeController node](self, "node");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLastElectionInfoReceived:", v11);

    objc_msgSend(v8, "ballot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeController _updateKnownDiscovery:](self, "_updateKnownDiscovery:", v14);

    objc_msgSend(v9, "remote");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[COElectionInfo generation](v11, "generation");
    v16 = objc_msgSend(v8, "variant");
    -[COElectionInfo ballot](v11, "ballot");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeController shortDescription](self, "shortDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "software");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v8, "rapportTransactionID");
      objc_msgSend(v31, "candidates");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v18, "count");
      objc_msgSend(v31, "candidates");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138545154;
      v40 = v27;
      v41 = 2048;
      v42 = v15;
      v43 = 1024;
      v44 = v16;
      v45 = 2048;
      v46 = v9;
      v47 = 2114;
      v48 = v26;
      v49 = 2048;
      v50 = v25;
      v51 = 2048;
      v52 = v24;
      v53 = 2114;
      v54 = v20;
      _os_log_impl(&dword_215E92000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ received ELECTION (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);

    }
    objc_initWeak((id *)buf, self);
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __66__CONodeController__handleElectionRequest_fromTransport_callback___block_invoke;
    v32[3] = &unk_24D4B44D8;
    objc_copyWeak(&v38, (id *)buf);
    v21 = v11;
    v33 = v21;
    v22 = v29;
    v34 = v22;
    v23 = v28;
    v35 = v23;
    v36 = v9;
    v37 = v30;
    -[CONodeController _updateDelegateWithBallotCommand:withCompletionHandler:](self, "_updateDelegateWithBallotCommand:withCompletionHandler:", v8, v32);

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);

    v10 = v30;
  }

}

void __66__CONodeController__handleElectionRequest_fromTransport_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 10, v3, *(_QWORD *)(a1 + 32), 10);
    objc_msgSend(v5, "executionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constituentForMe");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 40), "supportsBackoff") & 1) == 0
      && (unint64_t)objc_msgSend(v7, "flags") >> 31
      && objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(a1 + 48)))
    {
      COCoreLogForCategory(16);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "shortDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v9;
        _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ backed off legacy node", (uint8_t *)&v11, 0xCu);

      }
      objc_msgSend(v5, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 5, v3, *(_QWORD *)(a1 + 32), 10);
    }
    else
    {
      objc_msgSend(v5, "_ballotResponseWithElectionInfo:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_sendBallotResponse:usingTransport:callback:", v10, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

    }
  }

}

- (void)_handleBallotResponse:(id)a3 fromTransport:(id)a4
{
  id v6;
  id v7;
  COElectionInfo *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  COElectionInfo *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  COElectionInfo *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_activated)
  {
    v8 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v6);
    -[CONodeController node](self, "node");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLastElectionInfoReceived:", v8);

    objc_msgSend(v6, "ballot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeController _updateKnownDiscovery:](self, "_updateKnownDiscovery:", v10);

    objc_msgSend(v7, "remote");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "variant");
    COCoreLogForCategory(16);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeController shortDescription](self, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[COElectionInfo generation](v8, "generation");
      objc_msgSend(v22, "software");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "rapportTransactionID");
      -[COElectionInfo ballot](v8, "ballot");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "candidates");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      -[COElectionInfo leader](v8, "leader");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545154;
      v28 = v21;
      v29 = 2048;
      v30 = v19;
      v31 = 1024;
      v32 = v11;
      v33 = 2048;
      v34 = v7;
      v35 = 2114;
      v36 = v20;
      v37 = 2048;
      v38 = v18;
      v39 = 2048;
      v40 = v15;
      v41 = 2114;
      v42 = v16;
      _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ received BALLOT (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);

    }
    objc_initWeak((id *)buf, self);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __56__CONodeController__handleBallotResponse_fromTransport___block_invoke;
    v23[3] = &unk_24D4B4500;
    objc_copyWeak(&v26, (id *)buf);
    v17 = v8;
    v24 = v17;
    v25 = v7;
    -[CONodeController _updateDelegateWithBallotCommand:withCompletionHandler:](self, "_updateDelegateWithBallotCommand:withCompletionHandler:", v6, v23);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);

  }
}

void __56__CONodeController__handleBallotResponse_fromTransport___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 11, v3, *(_QWORD *)(a1 + 32), 10);
    if (objc_msgSend(v3, "hasSameGenerationAndLeader:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(v5, "_voteRequestWithElectionInfo:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_sendVoteRequest:usingTransport:", v6, *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v5, "node");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastElectionInfoSent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v3, "isEqual:", v8);

      if (v9)
      {
        objc_msgSend(v5, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 5, v3, *(_QWORD *)(a1 + 32), 10);
        COCoreLogForCategory(16);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "shortDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = *(_QWORD *)(a1 + 40);
          v12 = 138543618;
          v13 = v10;
          v14 = 2048;
          v15 = v11;
          _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ backed off %p", (uint8_t *)&v12, 0x16u);

        }
      }
      else
      {
        objc_msgSend(v5, "_electionRequestWithElectionInfo:", v3);
        v6 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_sendElectionRequest:usingTransport:", v6, *(_QWORD *)(a1 + 40));
      }
    }

  }
}

- (void)_handleVoteRequest:(id)a3 fromTransport:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  COElectionInfo *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  COElectionInfo *v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  COElectionInfo *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_activated)
  {
    v26 = v10;
    v11 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v8);
    -[CONodeController node](self, "node");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLastElectionInfoReceived:", v11);

    objc_msgSend(v8, "ballot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeController _updateKnownDiscovery:](self, "_updateKnownDiscovery:", v13);

    objc_msgSend(v9, "remote");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[COElectionInfo generation](v11, "generation");
    v23 = objc_msgSend(v8, "variant");
    -[COElectionInfo ballot](v11, "ballot");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(16);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeController shortDescription](self, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "software");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v8, "rapportTransactionID");
      objc_msgSend(v27, "candidates");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      objc_msgSend(v27, "candidates");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138545154;
      v34 = v22;
      v35 = 2048;
      v36 = v24;
      v37 = 1024;
      v38 = v23;
      v39 = 2048;
      v40 = v9;
      v41 = 2114;
      v42 = v15;
      v43 = 2048;
      v44 = v21;
      v45 = 2048;
      v46 = v17;
      v47 = 2114;
      v48 = v19;
      _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ received VOTE (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);

    }
    objc_initWeak((id *)buf, self);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __62__CONodeController__handleVoteRequest_fromTransport_callback___block_invoke;
    v28[3] = &unk_24D4B4528;
    objc_copyWeak(&v32, (id *)buf);
    v20 = v11;
    v29 = v20;
    v30 = v9;
    v31 = v26;
    -[CONodeController _updateDelegateWithBallotCommand:withCompletionHandler:](self, "_updateDelegateWithBallotCommand:withCompletionHandler:", v8, v28);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);

    v10 = v26;
  }

}

void __62__CONodeController__handleVoteRequest_fromTransport_callback___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 12, v8, *(_QWORD *)(a1 + 32), 10);
    if (objc_msgSend(v8, "hasSameGenerationAndLeader:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(v4, "_acceptResponseWithElectionInfo:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_sendAcceptResponse:usingTransport:callback:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      objc_msgSend(v4, "node");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "state");

      if (v7 != 14)
        objc_msgSend(v4, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 14, v8, *(_QWORD *)(a1 + 32), 9);
    }
    else
    {
      objc_msgSend(v4, "_ballotResponseWithElectionInfo:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_sendBallotResponse:usingTransport:callback:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }

  }
}

- (void)_handleAcceptResponse:(id)a3 fromTransport:(id)a4
{
  id v6;
  id v7;
  COElectionInfo *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  COElectionInfo *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  COElectionInfo *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (self->_activated)
  {
    v8 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v6);
    -[CONodeController node](self, "node");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLastElectionInfoReceived:", v8);

    objc_msgSend(v6, "ballot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeController _updateKnownDiscovery:](self, "_updateKnownDiscovery:", v10);

    objc_msgSend(v7, "remote");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[COElectionInfo generation](v8, "generation");
    v20 = objc_msgSend(v6, "variant");
    -[COElectionInfo ballot](v8, "ballot");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(16);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeController shortDescription](self, "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "software");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "rapportTransactionID");
      objc_msgSend(v23, "candidates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      objc_msgSend(v23, "candidates");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138545154;
      v29 = v19;
      v30 = 2048;
      v31 = v21;
      v32 = 1024;
      v33 = v20;
      v34 = 2048;
      v35 = v7;
      v36 = 2114;
      v37 = v12;
      v38 = 2048;
      v39 = v18;
      v40 = 2048;
      v41 = v14;
      v42 = 2114;
      v43 = v16;
      _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ received ACCEPT (%llu:%d) from %p (%{public}@) XID 0x%llX - (%lu, %{public}@)", buf, 0x4Eu);

    }
    objc_initWeak((id *)buf, self);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __56__CONodeController__handleAcceptResponse_fromTransport___block_invoke;
    v24[3] = &unk_24D4B4500;
    objc_copyWeak(&v27, (id *)buf);
    v17 = v8;
    v25 = v17;
    v26 = v7;
    -[CONodeController _updateDelegateWithBallotCommand:withCompletionHandler:](self, "_updateDelegateWithBallotCommand:withCompletionHandler:", v6, v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);

  }
}

void __56__CONodeController__handleAcceptResponse_fromTransport___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 13, v3, *(_QWORD *)(a1 + 32), 10);
    v6 = objc_msgSend(v3, "hasSameGenerationAndLeader:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "node");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      v9 = objc_msgSend(v7, "state");

      if (v9 != 14)
        objc_msgSend(v5, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 14, v3, *(_QWORD *)(a1 + 32), 9);
    }
    else
    {
      objc_msgSend(v7, "lastElectionInfoSent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v3, "isEqual:", v10);

      if (v11)
      {
        objc_msgSend(v5, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 5, v3, *(_QWORD *)(a1 + 32), 10);
        COCoreLogForCategory(16);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "shortDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(a1 + 40);
          v15 = 138543618;
          v16 = v13;
          v17 = 2048;
          v18 = v14;
          _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ backed off %p", (uint8_t *)&v15, 0x16u);

        }
      }
      else
      {
        objc_msgSend(v5, "_electionRequestWithElectionInfo:", v3);
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_sendElectionRequest:usingTransport:", v12, *(_QWORD *)(a1 + 40));
      }

    }
  }

}

- (void)_handleWithdraw:(id)a3 fromTransport:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_activated)
  {
    COCoreLogForCategory(16);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeController shortDescription](self, "shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received a withdraw command", (uint8_t *)&v11, 0xCu);

    }
    -[CONodeController node](self, "node");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastElectionInfoSent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeController node](self, "node");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastElectionInfoReceived");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](self, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 1, v8, v10, 17);

  }
}

- (void)_handleResponseToCoreRequest:(id)a3 response:(id)a4 error:(id)a5 usingTransport:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char isKindOfClass;
  char v15;
  char v16;
  NSObject *v17;
  id v18;
  void *v19;
  unint64_t v20;
  COElectionInfo *v21;
  COElectionInfo *v22;
  int64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  COElectionInfo *v29;
  int v30;
  COElectionInfo *v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();
  if (v12)
  {
    if ((isKindOfClass & 1) != 0)
    {
      -[CONodeController _handlePingError:fromTransport:](self, "_handlePingError:fromTransport:", v12, v13);
      goto LABEL_27;
    }
    COCoreLogForCategory(16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[CONodeController shortDescription](self, "shortDescription");
      v29 = (COElectionInfo *)objc_claimAutoreleasedReturnValue();
      v30 = 138544130;
      v31 = v29;
      v32 = 2112;
      v33 = (int64_t)v10;
      v34 = 2112;
      v35 = v12;
      v36 = 2048;
      v37 = v13;
      _os_log_error_impl(&dword_215E92000, v17, OS_LOG_TYPE_ERROR, "%{public}@ request %@ failed with error %@ on transport %p", (uint8_t *)&v30, 0x2Au);

    }
    -[CONodeController preferredTransport](self, "preferredTransport");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18 == v13)
    {
      -[CONodeController transports](self, "transports");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20 >= 2)
      {
        COCoreLogForCategory(16);
        v21 = (COElectionInfo *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v21->super, OS_LOG_TYPE_DEFAULT))
        {
LABEL_26:

          goto LABEL_27;
        }
        -[CONodeController shortDescription](self, "shortDescription");
        v22 = (COElectionInfo *)objc_claimAutoreleasedReturnValue();
        v23 = -[CONodeController state](self, "state");
        v30 = 138543618;
        v31 = v22;
        v32 = 2048;
        v33 = v23;
        _os_log_impl(&dword_215E92000, &v21->super, OS_LOG_TYPE_DEFAULT, "%{public}@ alternate transport available, remaining in state %ld", (uint8_t *)&v30, 0x16u);
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {

    }
    v21 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v10);
    v22 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v11);
    objc_msgSend(v12, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BE7CC90]))
    {
      v25 = objc_msgSend(v12, "code");

      if (v25 == -6714)
      {
        v26 = 8;
LABEL_24:
        -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](self, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 1, v21, v22, v26);
        goto LABEL_25;
      }
    }
    else
    {

    }
    objc_msgSend(v12, "domain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isEqualToString:", CFSTR("COMeshNodeErrorDomain")))
    {
      v28 = objc_msgSend(v12, "code");

      if (v28 == -4000)
      {
        v26 = 7;
        goto LABEL_24;
      }
    }
    else
    {

    }
    v26 = 6;
    goto LABEL_24;
  }
  if ((v15 & 1) != 0)
  {
    -[CONodeController _handleBallotResponse:fromTransport:](self, "_handleBallotResponse:fromTransport:", v11, v13);
  }
  else if ((v16 & 1) != 0)
  {
    -[CONodeController _handleAcceptResponse:fromTransport:](self, "_handleAcceptResponse:fromTransport:", v11, v13);
  }
LABEL_27:

}

- (void)_handlePingError:(id)a3 fromTransport:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  CONodeController *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CONodeController executionContext](self, "executionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDispatchQueue");

  COCoreLogForCategory(16);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[CONodeController shortDescription](self, "shortDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543874;
    v28 = v26;
    v29 = 2112;
    v30 = v6;
    v31 = 2048;
    v32 = v7;
    _os_log_error_impl(&dword_215E92000, v9, OS_LOG_TYPE_ERROR, "%{public}@ ping error %@ on transport %p", (uint8_t *)&v27, 0x20u);

  }
  objc_msgSend(v6, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE7CC90]))
  {
    if (objc_msgSend(v6, "code") == -6722)
    {

LABEL_8:
      COCoreLogForCategory(16);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[CONodeController shortDescription](self, "shortDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v13;
        _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Going dormant", (uint8_t *)&v27, 0xCu);

      }
      -[CONodeController node](self, "node");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastElectionInfoSent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CONodeController node](self, "node");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastElectionInfoReceived");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "code") == -6722)
        v18 = 11;
      else
        v18 = 12;
      v19 = self;
      v20 = 2;
      v21 = v15;
      v22 = v17;
LABEL_19:
      -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](v19, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", v20, v21, v22, v18);

      goto LABEL_20;
    }
    v11 = objc_msgSend(v6, "code");

    if (v11 == -6714)
      goto LABEL_8;
  }
  else
  {

  }
  objc_msgSend(v6, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("COMeshNodeErrorDomain")))
  {
LABEL_20:

    goto LABEL_21;
  }
  v23 = objc_msgSend(v6, "code");

  if (v23 == -4000)
  {
    COCoreLogForCategory(16);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeController shortDescription](self, "shortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v25;
      _os_log_impl(&dword_215E92000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ ping failed with a framing error. Marking node as discovered", (uint8_t *)&v27, 0xCu);

    }
    -[CONodeController node](self, "node");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastElectionInfoSent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeController node](self, "node");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastElectionInfoReceived");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self;
    v20 = 1;
    v21 = v15;
    v22 = v17;
    v18 = 13;
    goto LABEL_19;
  }
LABEL_21:

}

- (void)_updateDelegateWithBallotCommand:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  COElectionInfo *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  -[CONodeController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __75__CONodeController__updateDelegateWithBallotCommand_withCompletionHandler___block_invoke;
    v10[3] = &unk_24D4B4550;
    v11 = v7;
    objc_msgSend(v8, "nodeController:didReceiveElectionCmd:withCompletionHandler:", self, v6, v10);

  }
  else
  {
    v9 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v6);
    (*((void (**)(id, COElectionInfo *))v7 + 2))(v7, v9);

  }
}

uint64_t __75__CONodeController__updateDelegateWithBallotCommand_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)_nodeControllerStateFromNodeState
{
  if (-[CONode state](self->_node, "state") < 1)
    return 0;
  if (-[CONode state](self->_node, "state") < 2)
    return 1;
  if (-[CONode state](self->_node, "state") < 3)
    return 2;
  if (-[CONode state](self->_node, "state") < 4)
    return 3;
  if (-[CONode state](self->_node, "state") < 5)
    return 4;
  if (-[CONode state](self->_node, "state") < 14)
    return 5;
  return 6;
}

- (BOOL)_isActiveState:(int64_t)a3
{
  return a3 > 4;
}

- (void)_updateNodeState:(int64_t)a3 currentElectionInfo:(id)a4 incomingElectionInfo:(id)a5 reason:(int64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  int64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  int64_t v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  dispatch_time_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  _QWORD handler[4];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  int64_t v51;
  __int16 v52;
  int64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v45 = a4;
  v9 = a5;
  -[CONodeController transports](self, "transports");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      a3 = 14;
  }
  v13 = -[CONodeController _nodeControllerStateFromNodeState](self, "_nodeControllerStateFromNodeState");
  if (!-[CONodeController _isActiveState:](self, "_isActiveState:", a3)
    || v13 != 6
    || (objc_msgSend(v45, "hasSameGenerationAndLeader:", v9) & 1) == 0)
  {
    -[CONodeController node](self, "node");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isInElectionState");

    -[CONodeController node](self, "node");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setState:", a3);

    -[CONodeController node](self, "node");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isInElectionState");

    v19 = -[CONodeController _nodeControllerStateFromNodeState](self, "_nodeControllerStateFromNodeState");
    if (v13 != v19)
    {
      COCoreLogForCategory(16);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        -[CONodeController shortDescription](self, "shortDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v43;
        v50 = 2048;
        v51 = v13;
        v52 = 2048;
        v53 = v19;
        _os_log_debug_impl(&dword_215E92000, v20, OS_LOG_TYPE_DEBUG, "%{public}@ moving from state %lu to state %lu", buf, 0x20u);

      }
    }
    if (((v15 ^ 1 | v18) & 1) == 0)
    {
      -[CONodeController node](self, "node");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "backoffBucket") == 0;

      if (!v22)
      {
        -[CONodeController delegate](self, "delegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v23, "backedOffNodeMovedOutOfElection:", self);

      }
    }
    if ((v18 & 1) != 0)
    {
      if ((v15 & 1) != 0)
        goto LABEL_21;
      -[CONodeController node](self, "node");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTotalBackedOffTime:", 0);

      -[CONodeController knownDiscoveryRecords](self, "knownDiscoveryRecords");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeAllObjects");
    }
    else
    {
      -[CONodeController node](self, "node");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBackoffTimer:", 0);

      -[CONodeController node](self, "node");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBackoffResponse:", 0);

      -[CONodeController node](self, "node");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBackoffBucket:", 0);
    }

LABEL_21:
    if (a3 == 5)
    {
      -[CONodeController node](self, "node");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "backoffTimer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29 == 0;

      if (v30)
      {
        COCoreLogForCategory(16);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          -[CONodeController shortDescription](self, "shortDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v49 = v32;
          _os_log_impl(&dword_215E92000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ creating a backoff timer for bucket 0", buf, 0xCu);

        }
        -[CONodeController executionContext](self, "executionContext");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "dispatchQueue");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v34);

        if (v35)
        {
          v36 = dispatch_walltime(0, 100000000);
          dispatch_source_set_timer(v35, v36, 0x5F5E100uLL, 0);
          objc_initWeak((id *)buf, self);
          handler[0] = MEMORY[0x24BDAC760];
          handler[1] = 3221225472;
          handler[2] = __85__CONodeController__updateNodeState_currentElectionInfo_incomingElectionInfo_reason___block_invoke;
          handler[3] = &unk_24D4B0CD8;
          objc_copyWeak(&v47, (id *)buf);
          dispatch_source_set_event_handler(v35, handler);
          -[CONodeController node](self, "node");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setBackoffBucket:", 0);

          -[CONodeController node](self, "node");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setBackoffTimer:", v35);

          objc_destroyWeak(&v47);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          COCoreLogForCategory(16);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            -[COMeshNodeStateTracker setElectionStage:].cold.1(v39);

        }
      }
    }
    if (v13 != v19)
    {
      -[CONodeController delegate](self, "delegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[CONodeController node](self, "node");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "lastElectionInfoSent");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "nodeController:didUpdateState:to:reason:withLastSentElectionInfo:", self, v13, v19, a6, v42);

      }
    }
  }

}

void __85__CONodeController__updateNodeState_currentElectionInfo_incomingElectionInfo_reason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "didFireBackoffTimer");
    WeakRetained = v2;
  }

}

- (void)didFireBackoffTimer
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  dispatch_time_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[CONodeController node](self, "node");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "backoffBucket");

  -[CONodeController node](self, "node");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "totalBackedOffTime");

  v7 = CONodeStateBackoffSeries[v4];
  -[CONodeController node](self, "node");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTotalBackedOffTime:", v7 + v6);

  if (v4 <= 0xC)
  {
    -[CONodeController node](self, "node");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackoffBucket:", ++v4);

    v7 = CONodeStateBackoffSeries[v4];
  }
  v10 = 1000000 * v7;
  v11 = dispatch_walltime(0, 1000000 * v7);
  -[CONodeController node](self, "node");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backoffTimer");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v13, v11, v10, 0);

  COCoreLogForCategory(16);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeController shortDescription](self, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v15;
    v31 = 2048;
    v32 = v4;
    _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%@ back off (%ld) firing", buf, 0x16u);

  }
  -[CONodeController node](self, "node");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "backoffResponse");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CONodeController node](self, "node");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastElectionInfoReceived");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[CONodeController _electionRequestWithElectionInfo:](self, "_electionRequestWithElectionInfo:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    COCoreLogForCategory(16);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeController shortDescription](self, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "generation");
      *(_DWORD *)buf = 138543618;
      v30 = v22;
      v31 = 2048;
      v32 = v23;
      _os_log_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ delayed BALLOT (%llu) response", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __39__CONodeController_didFireBackoffTimer__block_invoke;
    v26[3] = &unk_24D4B4578;
    objc_copyWeak(&v28, (id *)buf);
    v27 = v17;
    -[CONodeController _updateDelegateWithBallotCommand:withCompletionHandler:](self, "_updateDelegateWithBallotCommand:withCompletionHandler:", v20, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[CONodeController _ballotResponseWithElectionInfo:](self, "_ballotResponseWithElectionInfo:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __39__CONodeController_didFireBackoffTimer__block_invoke_2;
    v24[3] = &unk_24D4B45A0;
    objc_copyWeak(&v25, (id *)buf);
    v24[4] = self;
    -[CONodeController _updateDelegateWithBallotCommand:withCompletionHandler:](self, "_updateDelegateWithBallotCommand:withCompletionHandler:", v20, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }

}

void __39__CONodeController_didFireBackoffTimer__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_ballotResponseWithElectionInfo:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(v4, "node");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackoffResponse:", 0);

    objc_msgSend(v4, "node");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLastElectionInfoSent:", v8);

  }
}

void __39__CONodeController_didFireBackoffTimer__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "node");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasOutstandingRequest");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_electionRequestWithElectionInfo:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "preferredTransport");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_sendElectionRequest:usingTransport:", v6, v8);

    }
  }

}

- (id)_electionRequestWithElectionInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  COMeshElectionRequest *v8;
  void *v9;
  COMeshElectionRequest *v10;

  v4 = a3;
  -[CONodeController preferredTransport](self, "preferredTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "listeningPort");
  else
    v6 = 0;
  -[CONodeController _electionInfoByDiffingCurrentElectionInfo:](self, "_electionInfoByDiffingCurrentElectionInfo:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [COMeshElectionRequest alloc];
  objc_msgSend(v7, "ballot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[COMeshElectionRequest initWithBallot:generation:listeningPort:](v8, "initWithBallot:generation:listeningPort:", v9, objc_msgSend(v7, "generation"), v6);

  return v10;
}

- (id)_ballotResponseWithElectionInfo:(id)a3
{
  void *v3;
  COMeshBallotResponse *v4;
  void *v5;
  COMeshBallotResponse *v6;

  -[CONodeController _electionInfoByDiffingCurrentElectionInfo:](self, "_electionInfoByDiffingCurrentElectionInfo:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [COMeshBallotResponse alloc];
  objc_msgSend(v3, "ballot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[COMeshBaseBallotResponse initWithBallot:generation:](v4, "initWithBallot:generation:", v5, objc_msgSend(v3, "generation"));

  return v6;
}

- (id)_voteRequestWithElectionInfo:(id)a3
{
  void *v3;
  COMeshVoteRequest *v4;
  void *v5;
  COMeshVoteRequest *v6;

  -[CONodeController _electionInfoByDiffingCurrentElectionInfo:](self, "_electionInfoByDiffingCurrentElectionInfo:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [COMeshVoteRequest alloc];
  objc_msgSend(v3, "ballot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[COMeshBaseBallotRequest initWithBallot:generation:](v4, "initWithBallot:generation:", v5, objc_msgSend(v3, "generation"));

  return v6;
}

- (id)_acceptResponseWithElectionInfo:(id)a3
{
  void *v3;
  COMeshAcceptResponse *v4;
  void *v5;
  COMeshAcceptResponse *v6;

  -[CONodeController _electionInfoByDiffingCurrentElectionInfo:](self, "_electionInfoByDiffingCurrentElectionInfo:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [COMeshAcceptResponse alloc];
  objc_msgSend(v3, "ballot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[COMeshBaseBallotResponse initWithBallot:generation:](v4, "initWithBallot:generation:", v5, objc_msgSend(v3, "generation"));

  return v6;
}

- (void)_updateKnownDiscovery:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(MEMORY[0x24BE19E30], "isIPDiscoveryDiffingEnabled");
  v5 = v8;
  if (v4)
  {
    objc_msgSend(v8, "discovery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[CONodeController knownDiscoveryRecords](self, "knownDiscoveryRecords");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addEntriesFromDictionary:", v6);

    }
    v5 = v8;
  }

}

- (id)_electionInfoByDiffingCurrentElectionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  COElectionInfo *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BE19E30], "isIPDiscoveryDiffingEnabled") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v4;
    objc_msgSend(v4, "ballot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "discovery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12);
          -[CONodeController knownDiscoveryRecords](self, "knownDiscoveryRecords");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "objectForKey:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (!v15 || (objc_msgSend(v16, "isEqualToDiscoveryRecord:", v15) & 1) == 0)
            objc_msgSend(v5, "setObject:forKey:", v17, v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    -[CONodeController knownDiscoveryRecords](self, "knownDiscoveryRecords");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEntriesFromDictionary:", v5);

    v4 = v23;
    objc_msgSend(v23, "ballot");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    objc_msgSend(v20, "setDiscovery:", v5);
    v21 = objc_alloc_init(COElectionInfo);
    -[COElectionInfo setGeneration:](v21, "setGeneration:", objc_msgSend(v23, "generation"));
    -[COElectionInfo setBallot:](v21, "setBallot:", v20);

  }
  else
  {
    v21 = (COElectionInfo *)v4;
  }

  return v21;
}

- (void)_adjustNodeDiscoveryInformationUsingRecord:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CONodeController node](self, "node");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "discoveryType");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 |= 2uLL;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 |= 1uLL;
      -[CONodeController node](self, "node");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "connectionType");

      if (!v7)
      {
        -[CONodeController node](self, "node");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setConnectionType:", 1);

      }
    }
  }
  -[CONodeController node](self, "node");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDiscoveryType:", v5);

}

- (void)transport:(id)a3 didReceiveCommand:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  -[CONodeController executionContext](self, "executionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDispatchQueue");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CONodeController _handleWithdraw:fromTransport:](self, "_handleWithdraw:fromTransport:", v7, v6);
  }
  else
  {
    -[CONodeController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "nodeController:didReceiveCommand:", self, v7);
    }
    else
    {
      COCoreLogForCategory(16);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CONodeManager nodeController:didReceiveCommand:].cold.1();

    }
  }

}

- (void)transport:(id)a3 didReceiveRequest:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  COMeshResponse *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  -[CONodeController executionContext](self, "executionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDispatchQueue");

  if (!-[CONodeController handlersRegistered](self, "handlersRegistered"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE7CC90], -6714, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(16);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      v10[2](v10, 0, v17);
LABEL_14:

      goto LABEL_15;
    }
    -[CONodeController shortDescription](self, "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v19;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v17;
    v20 = "%{public}@ acceptable commands not registered. Responding to %@ with error %@";
    v21 = v18;
    v22 = 32;
LABEL_24:
    _os_log_error_impl(&dword_215E92000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v24, v22);

    goto LABEL_13;
  }
  if (!self->_activated)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE7CC90], -6714, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(16);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    -[CONodeController shortDescription](self, "shortDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544130;
    v25 = v19;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v17;
    v20 = "%{public}@ transport %@ has not finished activating. Responding to %@ with error %@";
    v21 = v18;
    v22 = 42;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CONodeController _handleElectionRequest:fromTransport:callback:](self, "_handleElectionRequest:fromTransport:callback:", v9, v8, v10);
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CONodeController _handleVoteRequest:fromTransport:callback:](self, "_handleVoteRequest:fromTransport:callback:", v9, v8, v10);
      goto LABEL_15;
    }
    -[CONodeController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v17, "nodeController:didReceiveRequest:callback:", self, v9, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v23);

    }
    goto LABEL_14;
  }
  -[CONodeController executionContext](self, "executionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "leaderElectionConfigured");

  if ((v13 & 1) == 0 && -[CONodeController state](self, "state") == 1)
  {
    COCoreLogForCategory(16);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeController shortDescription](self, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v15;
      _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ discovered node with an incoming ping will move to processing", (uint8_t *)&v24, 0xCu);

    }
    -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](self, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 14, 0, 0, 2);
  }
  v16 = objc_alloc_init(COMeshResponse);
  ((void (**)(id, COMeshResponse *, void *))v10)[2](v10, v16, 0);

LABEL_15:
}

- (void)transport:(id)a3 didReceiveError:(id)a4 forCommand:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[CONodeController executionContext](self, "executionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertDispatchQueue");

  -[CONodeController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "nodeController:didReceiveError:forCommand:", self, v7, v8);
  }
  else
  {
    COCoreLogForCategory(16);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[CONodeController shortDescription](self, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v12;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v7;
      _os_log_error_impl(&dword_215E92000, v11, OS_LOG_TYPE_ERROR, "%{public}@ failed to send a command %@ with error %@", (uint8_t *)&v13, 0x20u);

    }
  }

}

- (void)transport:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  CONodeController *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  COCoreLogForCategory(16);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CONodeController transport:didInvalidateWithError:].cold.1(self);

  -[CONodeController executionContext](self, "executionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertDispatchQueue");

  objc_msgSend(v6, "record");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CONodeController acceptableCommands](self, "acceptableCommands");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self->_expectedRegisteredCommandCount = objc_msgSend(v12, "count");
  }
  else
  {
    v13 = self;
    objc_sync_enter(v13);
    -[CONodeController records](v13, "records");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "record");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", v15);

    objc_sync_exit(v13);
    -[CONodeController transports](v13, "transports");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v6);

    -[CONodeController computePreferredTransport](v13, "computePreferredTransport");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeController shortDescription](v13, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v18;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_215E92000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ recomputing preferred transport %@", (uint8_t *)&v24, 0x16u);

    }
    -[CONodeController setPreferredTransport:](v13, "setPreferredTransport:", v12);
    -[CONodeController delegate](v13, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v19, "nodeController:didRemoveTransport:withError:", v13, v6, v7);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CONodeController node](v13, "node");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastElectionInfoSent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CONodeController node](v13, "node");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastElectionInfoReceived");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CONodeController _updateNodeState:currentElectionInfo:incomingElectionInfo:reason:](v13, "_updateNodeState:currentElectionInfo:incomingElectionInfo:reason:", 14, v21, v23, 21);

    }
  }

}

- (void)transport:(id)a3 shouldUpdateRemoteConstituent:(id)a4 to:(id)a5 forCommand:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  id v16;
  void *v17;
  void *v18;
  char v19;
  char isKindOfClass;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  CODiscoveryRecord *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD))a7;
  v16 = a6;
  -[CONodeController executionContext](self, "executionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "assertDispatchQueue");

  -[CONodeController executionContext](self, "executionContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "leaderElectionConfigured");

  if ((v19 & 1) != 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      COCoreLogForCategory(16);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[CONodeController shortDescription](self, "shortDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138544130;
        v30 = v22;
        v31 = 2112;
        v32 = v13;
        v33 = 2112;
        v34 = v14;
        v35 = 2048;
        v36 = v12;
        _os_log_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ remote constituent will change from %@ to %@ on transport %p", (uint8_t *)&v29, 0x2Au);

      }
      -[CONodeController node](self, "node");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRemote:", v14);

      -[CONodeController ipDiscoveryRecord](self, "ipDiscoveryRecord");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSObject constituent](v24, "constituent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v25, "isEqual:", v14) & 1) == 0)
          {
            v26 = -[NSObject mutableCopy](v24, "mutableCopy");
            objc_msgSend(v26, "rollConstituent:", v14);
            v27 = -[CODiscoveryRecord initWithDiscoveryRecord:]([CODiscoveryRecord alloc], "initWithDiscoveryRecord:", v26);
            -[CONodeController setIpDiscoveryRecord:](self, "setIpDiscoveryRecord:", v27);
            objc_msgSend(v12, "setRecord:", v27);

          }
        }
      }
LABEL_13:

    }
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      COCoreLogForCategory(16);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        -[CONodeController shortDescription](self, "shortDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138544130;
        v30 = v28;
        v31 = 2112;
        v32 = v13;
        v33 = 2112;
        v34 = v14;
        v35 = 2048;
        v36 = v12;
        _os_log_impl(&dword_215E92000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ remote constituent will change from %@ to %@ on transport %p", (uint8_t *)&v29, 0x2Au);

      }
      goto LABEL_13;
    }
  }
  v15[2](v15, isKindOfClass & 1);

}

- (void)transport:(id)a3 willUpdateRemoteConstituent:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CODiscoveryRecord *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CONodeController executionContext](self, "executionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDispatchQueue");

  COCoreLogForCategory(16);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeController shortDescription](self, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544130;
    v20 = v13;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    v25 = 2048;
    v26 = v8;
    _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ remote constituent will change from %@ to %@ on transport %p", (uint8_t *)&v19, 0x2Au);

  }
  -[CONodeController node](self, "node");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRemote:", v10);

  -[CONodeController ipDiscoveryRecord](self, "ipDiscoveryRecord");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "constituent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqual:", v10) & 1) == 0)
      {
        v17 = (void *)objc_msgSend(v15, "mutableCopy");
        objc_msgSend(v17, "rollConstituent:", v10);
        v18 = -[CODiscoveryRecord initWithDiscoveryRecord:]([CODiscoveryRecord alloc], "initWithDiscoveryRecord:", v17);
        -[CONodeController setIpDiscoveryRecord:](self, "setIpDiscoveryRecord:", v18);
        objc_msgSend(v8, "setRecord:", v18);

      }
    }
  }

}

- (void)transport:(id)a3 didUpdateRemoteConstituent:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CONodeController executionContext](self, "executionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDispatchQueue");

  COCoreLogForCategory(16);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeController shortDescription](self, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v13;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2048;
    v22 = v8;
    _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ remote constituent has changed from %@ to %@ on transport %p", (uint8_t *)&v15, 0x2Au);

  }
  if (v9)
  {
    -[CONodeController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "nodeController:didUpdateRemoteConstituent:to:", self, v9, v10);

  }
}

- (void)transport:(id)a3 didReceiveUnhandledRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);

  v5 = a4;
  -[CONodeController executionContext](self, "executionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDispatchQueue");

  objc_msgSend(v5, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeController executionContext](self, "executionContext");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "leaderElectionConfigured");

  objc_opt_class();
  LODWORD(v8) = objc_opt_isKindOfClass();
  v9 = objc_msgSend(v7, "conformsToProtocol:", &unk_254E1B9B0) & v8;
  COCoreLogForCategory(16);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CONodeController transport:didReceiveUnhandledRequest:].cold.1();

  -[CONodeController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "nodeController:didReceiveOnDemandNodeCreationRequest:", self, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v13)[2](v13, 0, 0, v12);

  }
}

- (CONode)node
{
  return self->_node;
}

- (COExecutionContext)executionContext
{
  return self->_executionContext;
}

- (CONodeControllerDelegate)delegate
{
  return (CONodeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)acceptableCommands
{
  return self->_acceptableCommands;
}

- (void)setAcceptableCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setIpDiscoveryRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSMutableArray)records
{
  return self->_records;
}

- (NSMutableArray)transports
{
  return self->_transports;
}

- (NSMutableDictionary)sentElements
{
  return self->_sentElements;
}

- (void)setSentElements:(id)a3
{
  objc_storeStrong((id *)&self->_sentElements, a3);
}

- (CODiscoveryRecordProtocol)originalRecord
{
  return self->_originalRecord;
}

- (void)setOriginalRecord:(id)a3
{
  objc_storeStrong((id *)&self->_originalRecord, a3);
}

- (void)setPreferredTransport:(id)a3
{
  objc_storeStrong((id *)&self->_preferredTransport, a3);
}

- (COConstituent)leader
{
  return self->_leader;
}

- (void)setLeader:(id)a3
{
  objc_storeStrong((id *)&self->_leader, a3);
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BOOL)handlersRegistered
{
  return self->_handlersRegistered;
}

- (void)setHandlersRegistered:(BOOL)a3
{
  self->_handlersRegistered = a3;
}

- (NSMutableDictionary)knownDiscoveryRecords
{
  return self->_knownDiscoveryRecords;
}

- (void)setKnownDiscoveryRecords:(id)a3
{
  objc_storeStrong((id *)&self->_knownDiscoveryRecords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownDiscoveryRecords, 0);
  objc_storeStrong((id *)&self->_leader, 0);
  objc_storeStrong((id *)&self->_preferredTransport, 0);
  objc_storeStrong((id *)&self->_originalRecord, 0);
  objc_storeStrong((id *)&self->_sentElements, 0);
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_ipDiscoveryRecord, 0);
  objc_storeStrong((id *)&self->_acceptableCommands, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

void __79__CONodeController__createAndActivateTransportForRecord_withCompletionHandler___block_invoke_47_cold_1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_215E92000, v2, v3, "%{public}@ failed activation with error %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_11();
}

void __39__CONodeController_addDiscoveryRecord___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_215E92000, v2, v3, "%{public}@ failed to create a transport with record %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_11();
}

void __40__CONodeController_inquireForTransport___block_invoke_cold_1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_0_4(&dword_215E92000, v2, v3, "%{public}@ Failed inquiry with error %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

- (void)_sendPingUsingTransport:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_215E92000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ transport %@ doesn't support pings", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_11();
}

- (void)transport:(void *)a1 didInvalidateWithError:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_215E92000, v2, v3, "%{public}@ transport %p reported as invalidated", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_11();
}

- (void)transport:didReceiveUnhandledRequest:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v1, "shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_sendingConstituent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_215E92000, v3, v4, "%{public}@ received a request from an unknown node %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_11();
}

@end
