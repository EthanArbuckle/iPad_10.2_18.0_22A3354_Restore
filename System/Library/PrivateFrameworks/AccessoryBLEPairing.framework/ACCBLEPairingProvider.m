@implementation ACCBLEPairingProvider

- (ACCBLEPairingProvider)initWithDelegate:(id)a3
{
  id v4;
  ACCBLEPairingProvider *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *delegateUUID;
  NSObject *v10;
  id v11;
  NSString *v12;
  id v13;
  objc_super v15;
  uint8_t buf[4];
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  init_logging();
  v15.receiver = self;
  v15.super_class = (Class)ACCBLEPairingProvider;
  v5 = -[ACCBLEPairingProvider init](&v15, sel_init);
  if (v5)
  {
    +[ACCBLEPairingProviderInternal SharedInstance](ACCBLEPairingProviderInternal, "SharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    delegateUUID = v5->_delegateUUID;
    v5->_delegateUUID = (NSString *)v8;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v5->_delegateUUID;
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_215447000, v10, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider init, %@", buf, 0xCu);
    }

    v13 = objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(v6, "registerDelegate:provider:forUUID:", v4, v5, v5->_delegateUUID);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  NSString *delegateUUID;
  objc_super v8;
  uint8_t buf[4];
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[ACCBLEPairingProviderInternal SharedInstance](ACCBLEPairingProviderInternal, "SharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    delegateUUID = self->_delegateUUID;
    *(_DWORD *)buf = 138412290;
    v10 = delegateUUID;
    _os_log_impl(&dword_215447000, v6, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider dealloc, %@", buf, 0xCu);
  }

  objc_msgSend(v3, "unregisterDelegateForUUID:", self->_delegateUUID);
  objc_storeWeak((id *)&self->_delegate, 0);

  v8.receiver = self;
  v8.super_class = (Class)ACCBLEPairingProvider;
  -[ACCBLEPairingProvider dealloc](&v8, sel_dealloc);
}

- (int)lastScorpiusDetectType
{
  void *v2;
  int v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[ACCBLEPairingProviderInternal SharedInstance](ACCBLEPairingProviderInternal, "SharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lastScorpiusDetectType");

  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[ACCBLEPairingProvider lastScorpiusDetectType]";
    v10 = 1024;
    v11 = 1025;
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_215447000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d result %d ", (uint8_t *)&v8, 0x18u);
  }

  return v3;
}

- (void)setLastScorpiusDetectType:(int)a3
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  +[ACCBLEPairingProviderInternal SharedInstance](ACCBLEPairingProviderInternal, "SharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lastScorpiusDetectType");

  +[ACCBLEPairingProviderInternal SharedInstance](ACCBLEPairingProviderInternal, "SharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLastScorpiusDetectType:", v3);

  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315906;
    v11 = "-[ACCBLEPairingProvider setLastScorpiusDetectType:]";
    v12 = 1024;
    v13 = 1033;
    v14 = 1024;
    v15 = v5;
    v16 = 1024;
    v17 = v3;
    _os_log_impl(&dword_215447000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d  %d -> %d ", (uint8_t *)&v10, 0x1Eu);
  }

}

- (void)startBLEUpdates:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 bRadioUpdatesOn:(BOOL)a6 bPairInfoUpdatesOn:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  NSString *delegateUUID;
  int v19;
  const char *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v7 = a7;
  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  +[ACCBLEPairingProviderInternal SharedInstance](ACCBLEPairingProviderInternal, "SharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v15 = gNumLogObjects < 1;
  else
    v15 = 1;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v17 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  else
  {
    v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    delegateUUID = self->_delegateUUID;
    v19 = 136316674;
    v20 = "-[ACCBLEPairingProvider startBLEUpdates:blePairingUUID:pairType:bRadioUpdatesOn:bPairInfoUpdatesOn:]";
    v21 = 2112;
    v22 = delegateUUID;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 1024;
    v28 = v9;
    v29 = 1024;
    v30 = v8;
    v31 = 1024;
    v32 = v7;
    _os_log_impl(&dword_215447000, v17, OS_LOG_TYPE_DEFAULT, "%s: delegateUUID %@, startBLEUpdates: %@, blePairingUUID %@, pairType=%d bRadioUpdatesOn=%d bPairInfoUpdatesOn=%d", (uint8_t *)&v19, 0x3Cu);
  }

  objc_msgSend(v14, "startBLEUpdates:blePairingUUID:pairType:bRadioUpdatesOn:bPairInfoUpdatesOn:", v12, v13, v9, v8, v7);
}

- (void)deviceStateUpdate:(id)a3 blePairingUUID:(id)a4 bRadioOn:(BOOL)a5 pairState:(int)a6 bPairModeOn:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  NSString *delegateUUID;
  int v19;
  const char *v20;
  __int16 v21;
  NSString *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v9 = a5;
  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  +[ACCBLEPairingProviderInternal SharedInstance](ACCBLEPairingProviderInternal, "SharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v15 = gNumLogObjects < 1;
  else
    v15 = 1;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v17 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  else
  {
    v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    delegateUUID = self->_delegateUUID;
    v19 = 136316674;
    v20 = "-[ACCBLEPairingProvider deviceStateUpdate:blePairingUUID:bRadioOn:pairState:bPairModeOn:]";
    v21 = 2112;
    v22 = delegateUUID;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 1024;
    v28 = v9;
    v29 = 1024;
    v30 = v8;
    v31 = 1024;
    v32 = v7;
    _os_log_impl(&dword_215447000, v17, OS_LOG_TYPE_DEFAULT, "%s: delegateUUID %@, deviceStateUpdate: %@, blePairingUUID %@, bRadioOn=%d pairState=%d bPairModeOn=%d", (uint8_t *)&v19, 0x3Cu);
  }

  objc_msgSend(v14, "deviceStateUpdate:blePairingUUID:bRadioOn:pairState:bPairModeOn:", v12, v13, v9, v8, v7);
}

- (void)devicePairingData:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairData:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  NSString *delegateUUID;
  int v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v7 = *(_QWORD *)&a5;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  +[ACCBLEPairingProviderInternal SharedInstance](ACCBLEPairingProviderInternal, "SharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v14 = gNumLogObjects < 1;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    delegateUUID = self->_delegateUUID;
    v18 = 136316418;
    v19 = "-[ACCBLEPairingProvider devicePairingData:blePairingUUID:pairType:pairData:]";
    v20 = 2112;
    v21 = delegateUUID;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    v26 = 1024;
    v27 = v7;
    v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_215447000, v16, OS_LOG_TYPE_DEFAULT, "%s: delegateUUID %@, devicePairingData: %@, blePairingUUID %@, pairType=%d pairData=%@", (uint8_t *)&v18, 0x3Au);
  }

  objc_msgSend(v13, "devicePairingData:blePairingUUID:pairType:pairData:", v10, v11, v7, v12);
}

- (void)deviceUpdatePairingInfo:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairInfo:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  NSString *delegateUUID;
  int v18;
  const char *v19;
  __int16 v20;
  NSString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v7 = *(_QWORD *)&a5;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  +[ACCBLEPairingProviderInternal SharedInstance](ACCBLEPairingProviderInternal, "SharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v14 = gNumLogObjects < 1;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    delegateUUID = self->_delegateUUID;
    v18 = 136316418;
    v19 = "-[ACCBLEPairingProvider deviceUpdatePairingInfo:blePairingUUID:pairType:pairInfo:]";
    v20 = 2112;
    v21 = delegateUUID;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    v26 = 1024;
    v27 = v7;
    v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_215447000, v16, OS_LOG_TYPE_DEFAULT, "%s: delegateUUID %@, deviceUpdatePairingInfo: %@, blePairingUUID %@, pairType=%d pairInfo=%@", (uint8_t *)&v18, 0x3Au);
  }

  objc_msgSend(v13, "deviceUpdatePairingInfo:blePairingUUID:pairType:pairInfo:", v10, v11, v7, v12);
}

- (void)stopBLEUpdates:(id)a3 blePairingUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSString *delegateUUID;
  int v13;
  const char *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[ACCBLEPairingProviderInternal SharedInstance](ACCBLEPairingProviderInternal, "SharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v9 = gNumLogObjects < 1;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    delegateUUID = self->_delegateUUID;
    v13 = 136315906;
    v14 = "-[ACCBLEPairingProvider stopBLEUpdates:blePairingUUID:]";
    v15 = 2112;
    v16 = delegateUUID;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_215447000, v11, OS_LOG_TYPE_DEFAULT, "%s: delegateUUID %@, stopBLEUpdates: %@, blePairingUUID %@", (uint8_t *)&v13, 0x2Au);
  }

  objc_msgSend(v8, "stopBLEUpdates:blePairingUUID:", v6, v7);
}

- (ACCBLEPairingProviderProtocol)delegate
{
  return (ACCBLEPairingProviderProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)delegateUUID
{
  return self->_delegateUUID;
}

- (void)setDelegateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_delegateUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
