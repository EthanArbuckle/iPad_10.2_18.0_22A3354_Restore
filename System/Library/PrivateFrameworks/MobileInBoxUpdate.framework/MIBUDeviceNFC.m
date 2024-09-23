@implementation MIBUDeviceNFC

- (MIBUDeviceNFC)init
{
  MIBUDeviceNFC *v2;
  MIBUDeviceNFC *v3;
  MIBUDeviceStatus *status;
  NSNumber *ecid;
  NSNumber *boardID;
  NSNumber *chipID;
  NSData *apNonce;
  MIBUNetworkInfo *networkInfo;
  NSNumber *sikaFuse;
  NSNumber *protocolVersion;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MIBUDeviceNFC;
  v2 = -[MIBUDeviceNFC init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MIBUDeviceNFC setNfSession:](v2, "setNfSession:", 0);
    -[MIBUDeviceNFC setReaderSession:](v3, "setReaderSession:", 0);
    status = v3->_status;
    v3->_status = 0;

    ecid = v3->_ecid;
    v3->_ecid = 0;

    boardID = v3->_boardID;
    v3->_boardID = 0;

    chipID = v3->_chipID;
    v3->_chipID = 0;

    v3->_securityDomain = 0;
    apNonce = v3->_apNonce;
    v3->_apNonce = 0;

    v3->_productionMode = 0;
    v3->_securityMode = 0;
    v3->_uidMode = 0;
    networkInfo = v3->_networkInfo;
    v3->_networkInfo = 0;

    sikaFuse = v3->_sikaFuse;
    v3->_sikaFuse = 0;

    v3->_sikaFuseExists = 1;
    protocolVersion = v3->_protocolVersion;
    v3->_protocolVersion = (NSNumber *)&unk_24EB5C390;

  }
  return v3;
}

- (BOOL)startSession
{
  MIBUNFCReaderSession *v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  MIBUDeviceNFC *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MIBUNFCReaderSession);
  -[MIBUDeviceNFC setMibureaderSession:](self, "setMibureaderSession:", v3);

  -[MIBUDeviceNFC mibureaderSession](self, "mibureaderSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_16);
    v8 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      v10 = v8;
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Failed to init MIBUreaderSession object"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_222C3F000, v10, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

    }
    return 1;
  }
  -[MIBUDeviceNFC mibureaderSession](self, "mibureaderSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "start:", &v16);
  v6 = v16;

  if (!v6)
    return 1;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_15_2);
  v12 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = v12;
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Failed to start MIBUreaderSession session"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v15;
    _os_log_impl(&dword_222C3F000, v14, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

  }
  return 0;
}

void __29__MIBUDeviceNFC_startSession__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __29__MIBUDeviceNFC_startSession__block_invoke_14()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)getDeviceInfo:(id *)a3
{
  MIBUNFCCommand *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSString *v13;
  NSString *serialNumber;
  NSNumber *v15;
  NSNumber *ecid;
  NSNumber *v17;
  NSNumber *boardID;
  NSNumber *v19;
  NSNumber *chipID;
  NSData *v21;
  NSData *apNonce;
  NSData *v23;
  NSData *sepNonce;
  NSNumber *v25;
  NSNumber *sikaFuse;
  char v27;
  id v28;
  uint8_t buf[4];
  MIBUDeviceNFC *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = -[MIBUNFCCommand initWithCommandCode:andPayload:]([MIBUNFCCommand alloc], "initWithCommandCode:andPayload:", 1, 0);
  -[MIBUDeviceNFC mibureaderSession](self, "mibureaderSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v5, "sendCommand:withError:", v4, &v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v28;

  if (v7)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_19_3);
    v8 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      v10 = v8;
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Failed at command step: %@"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = self;
      v31 = 2114;
      v32 = v11;
      _os_log_impl(&dword_222C3F000, v10, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    v12 = v6;
    objc_msgSend(v12, "serialNumber");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    serialNumber = self->_serialNumber;
    self->_serialNumber = v13;

    objc_msgSend(v12, "ecid");
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    ecid = self->_ecid;
    self->_ecid = v15;

    objc_msgSend(v12, "boardID");
    v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    boardID = self->_boardID;
    self->_boardID = v17;

    objc_msgSend(v12, "chipID");
    v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    chipID = self->_chipID;
    self->_chipID = v19;

    self->_securityDomain = (NSNumber *)(id)objc_msgSend(v12, "securityDomain");
    objc_msgSend(v12, "apNonce");
    v21 = (NSData *)objc_claimAutoreleasedReturnValue();
    apNonce = self->_apNonce;
    self->_apNonce = v21;

    self->_productionMode = objc_msgSend(v12, "productionMode");
    self->_securityMode = objc_msgSend(v12, "securityMode");
    self->_uidMode = objc_msgSend(v12, "uidMode");
    objc_msgSend(v12, "sepNonce");
    v23 = (NSData *)objc_claimAutoreleasedReturnValue();
    sepNonce = self->_sepNonce;
    self->_sepNonce = v23;

    objc_msgSend(v12, "sikaFuse");
    v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    sikaFuse = self->_sikaFuse;
    self->_sikaFuse = v25;

    v27 = objc_msgSend(v12, "sikaFuseExists");
    self->_sikaFuseExists = v27;
  }

}

void __31__MIBUDeviceNFC_getDeviceInfo___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)startDiag:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  MIBUNFCCommand *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v22;
  id v23;
  time_t v24;
  uint8_t buf[4];
  MIBUDeviceNFC *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v4 = (void *)objc_opt_new();
  v23 = 0;
  +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:](MIBUPersonalizationManager, "requestTatsuTicketForDevice:error:", self, &v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v23;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_24_2);
  v7 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = v7;
    objc_msgSend(v8, "stringWithFormat:", CFSTR("tatsu ticket: %@"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_222C3F000, v9, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

  }
  time(&v24);
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("TatsuTicket"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("TimeStamp"));

  v12 = -[MIBUNFCCommand initWithCommandCode:andPayload:]([MIBUNFCCommand alloc], "initWithCommandCode:andPayload:", 11, v4);
  -[MIBUDeviceNFC mibureaderSession](self, "mibureaderSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  objc_msgSend(v13, "sendCommand:withError:", v12, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;

  if (v15)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_29_2);
    v16 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceNFC startDiag:].cold.1((uint64_t)self, v16, (uint64_t)v15);
  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_31_1);
    v17 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = v17;
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Tatsu ticket check successful"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = self;
      v27 = 2114;
      v28 = v20;
      _os_log_impl(&dword_222C3F000, v19, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

    }
  }

  return v15 == 0;
}

void __27__MIBUDeviceNFC_startDiag___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __27__MIBUDeviceNFC_startDiag___block_invoke_28()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __27__MIBUDeviceNFC_startDiag___block_invoke_30()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)shutdown:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  MIBUNFCCommand *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  MIBUDeviceNFC *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKey:", &unk_24EB5C628, CFSTR("HeartbeatPeriod"));
  objc_msgSend(v4, "setObject:forKey:", &unk_24EB5C3A8, CFSTR("HeartbeatTimeout"));
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_36_2);
  v5 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = v5;
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Begin heartbeat with period: 0.5; timeout: 0..."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_222C3F000, v7, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

  }
  v9 = -[MIBUNFCCommand initWithCommandCode:andPayload:]([MIBUNFCCommand alloc], "initWithCommandCode:andPayload:", 7, v4);
  -[MIBUDeviceNFC mibureaderSession](self, "mibureaderSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v10, "sendCommand:withError:", v9, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;

  if (v12)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_40_0);
    v13 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceNFC startDiag:].cold.1((uint64_t)self, v13, (uint64_t)v12);
  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_42_0);
    v14 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      v16 = v14;
      objc_msgSend(v15, "stringWithFormat:", CFSTR("heartbeat successful"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_222C3F000, v16, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

    }
  }

  return v12 == 0;
}

void __26__MIBUDeviceNFC_shutdown___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __26__MIBUDeviceNFC_shutdown___block_invoke_39()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __26__MIBUDeviceNFC_shutdown___block_invoke_41()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)endSession
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  MIBUDeviceNFC *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_45_3);
  v3 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = v3;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("mibureader object disconnectTag"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_222C3F000, v5, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  -[MIBUDeviceNFC mibureaderSession](self, "mibureaderSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disconnectTag:", 0);

  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_49_1);
  v8 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = v8;
    objc_msgSend(v9, "stringWithFormat:", CFSTR("mibureader object end"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_222C3F000, v10, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  -[MIBUDeviceNFC mibureaderSession](self, "mibureaderSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "end");

  return 1;
}

void __27__MIBUDeviceNFC_endSession__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __27__MIBUDeviceNFC_endSession__block_invoke_48()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (id)serialNumber
{
  return self->_serialNumber;
}

- (id)osVersion
{
  return self->_osVersion;
}

- (id)buildVersion
{
  return self->_buildVersion;
}

- (MIBUDeviceStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (id)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
  objc_storeStrong((id *)&self->_ecid, a3);
}

- (id)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(id)a3
{
  objc_storeStrong((id *)&self->_boardID, a3);
}

- (id)chipID
{
  return self->_chipID;
}

- (void)setChipID:(id)a3
{
  objc_storeStrong((id *)&self->_chipID, a3);
}

- (id)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
  self->_securityDomain = (NSNumber *)a3;
}

- (id)apNonce
{
  return self->_apNonce;
}

- (void)setApNonce:(id)a3
{
  objc_storeStrong((id *)&self->_apNonce, a3);
}

- (id)sepNonce
{
  return self->_sepNonce;
}

- (void)setSepNonce:(id)a3
{
  objc_storeStrong((id *)&self->_sepNonce, a3);
}

- (BOOL)productionMode
{
  return self->_productionMode;
}

- (void)setProductionMode:(BOOL)a3
{
  self->_productionMode = a3;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (void)setSecurityMode:(BOOL)a3
{
  self->_securityMode = a3;
}

- (BOOL)uidMode
{
  return self->_uidMode;
}

- (void)setUidMode:(BOOL)a3
{
  self->_uidMode = a3;
}

- (MIBUNetworkInfo)networkInfo
{
  return self->_networkInfo;
}

- (void)setNetworkInfo:(id)a3
{
  objc_storeStrong((id *)&self->_networkInfo, a3);
}

- (id)sikaFuse
{
  return self->_sikaFuse;
}

- (void)setSikaFuse:(id)a3
{
  objc_storeStrong((id *)&self->_sikaFuse, a3);
}

- (BOOL)sikaFuseExists
{
  return self->_sikaFuseExists;
}

- (void)setSikaFuseExists:(BOOL)a3
{
  self->_sikaFuseExists = a3;
}

- (id)protocolVersion
{
  return self->_protocolVersion;
}

- (NFSession)nfSession
{
  return self->_nfSession;
}

- (void)setNfSession:(id)a3
{
  objc_storeStrong((id *)&self->_nfSession, a3);
}

- (NFReaderSession)readerSession
{
  return self->_readerSession;
}

- (void)setReaderSession:(id)a3
{
  objc_storeStrong((id *)&self->_readerSession, a3);
}

- (MIBUNFCReaderSession)mibureaderSession
{
  return self->_mibureaderSession;
}

- (void)setMibureaderSession:(id)a3
{
  objc_storeStrong((id *)&self->_mibureaderSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mibureaderSession, 0);
  objc_storeStrong((id *)&self->_readerSession, 0);
  objc_storeStrong((id *)&self->_nfSession, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_sikaFuse, 0);
  objc_storeStrong((id *)&self->_networkInfo, 0);
  objc_storeStrong((id *)&self->_sepNonce, 0);
  objc_storeStrong((id *)&self->_apNonce, 0);
  objc_storeStrong((id *)&self->_chipID, 0);
  objc_storeStrong((id *)&self->_boardID, 0);
  objc_storeStrong((id *)&self->_ecid, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

- (void)startDiag:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a2;
  v13 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Failed at command step: %@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2_4(&dword_222C3F000, v7, v8, "Device Error %{public}@: %{public}@", v9, v10, v11, v12, v13, v14, v15);

  OUTLINED_FUNCTION_2_3();
}

@end
