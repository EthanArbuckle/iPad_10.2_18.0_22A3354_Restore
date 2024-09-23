@implementation ACCBLEPairingShim

- (ACCBLEPairingShim)initWithDelegate:(id)a3
{
  id v4;
  ACCBLEPairingShim *v5;
  void *v6;
  uint64_t v7;
  NSString *uid;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACCBLEPairingShim;
  v5 = -[ACCBLEPairingShim init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    uid = v5->_uid;
    v5->_uid = (NSString *)v7;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  NSString *uid;
  objc_super v4;

  uid = self->_uid;
  self->_uid = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)ACCBLEPairingShim;
  -[ACCBLEPairingShim dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v2;
  NSString *uid;
  id WeakRetained;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  uid = self->_uid;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<ACCBLEPairingShim>[_uid=%@ _delegate=%@]"), uid, WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)accessoryAttached:(id)a3 blePairingUUID:(id)a4 accInfoDict:(id)a5 supportedPairTypes:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (gLogObjects)
    v13 = gNumLogObjects < 1;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v15 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  else
  {
    v15 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v39 = v9;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v11;
    v44 = 2112;
    v45 = v12;
    _os_log_impl(&dword_219602000, v15, OS_LOG_TYPE_INFO, "accessoryAttached: %@, blePairingUUID=%@, accInfoDict=%@ supportedPairTypes=%@", buf, 0x2Au);
  }

  if (v9 && v10 && v12)
  {
    v34 = v11;
    v35 = v10;
    objc_msgSend(MEMORY[0x24BE00DD0], "postNotifydNotificationType:", *MEMORY[0x24BE00988]);
    objc_msgSend(v9, "iap2ShimAccessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accessoryInfoDict");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v18, "setObject:forKey:", v19, *MEMORY[0x24BE00980]);

    v20 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "iap2ShimAccessory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "connectionID"));
    v22 = objc_claimAutoreleasedReturnValue();

    v36[0] = *MEMORY[0x24BE00930];
    objc_msgSend(v9, "iap2ShimAccessory");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "manufacturer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v37[0] = v24;
    v36[1] = *MEMORY[0x24BE00938];
    objc_msgSend(v9, "iap2ShimAccessory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "model");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (!v26)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = *MEMORY[0x24BE00950];
    v37[1] = v27;
    v37[2] = v22;
    v29 = (void *)v22;
    v30 = *MEMORY[0x24BE009C0];
    v36[2] = v28;
    v36[3] = v30;
    v36[4] = *MEMORY[0x24BE009B8];
    v37[3] = v35;
    v37[4] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)

    if (!v23)
    objc_msgSend(MEMORY[0x24BE00DD0], "notifyInterestedClientsOfACCBLEAccessoryEvent:withPayload:", *MEMORY[0x24BE00958], v31);

    v11 = v34;
    v10 = v35;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v18 = MEMORY[0x24BDACB70];
      v32 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v39 = v9;
      v40 = 2112;
      v41 = v10;
      v42 = 2112;
      v43 = v12;
      _os_log_impl(&dword_219602000, v18, OS_LOG_TYPE_DEFAULT, "Invalid bleAccessory(%@) or blePairingUUID(%@) or supportedPairTypes(%@)", buf, 0x20u);
    }
  }

}

- (void)accessoryDetached:(id)a3 blePairingUUID:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_219602000, v9, OS_LOG_TYPE_INFO, "accessoryDetached: %@, blePairingUUID=%@", buf, 0x16u);
  }

  if (v5 && v6)
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "iap2ShimAccessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "connectionID"));
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = *MEMORY[0x24BE009C0];
    v16[0] = *MEMORY[0x24BE00950];
    v16[1] = v13;
    v17[0] = v12;
    v17[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE00DD0], "notifyInterestedClientsOfACCBLEAccessoryEvent:withPayload:", *MEMORY[0x24BE00960], v14);

  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_219602000, v12, OS_LOG_TYPE_DEFAULT, "Invalid bleAccessory(%@) or blePairingUUID(%@)", buf, 0x16u);
    }
  }

}

- (void)stateUpdate:(id)a3 blePairingUUID:(id)a4 validMask:(unsigned int)a5 btRadioOn:(BOOL)a6 pairingState:(int)a7 pairingModeOn:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BOOL4 v41;
  uint64_t v42;

  v8 = a8;
  v10 = a6;
  v42 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  if (gLogObjects)
    v15 = gNumLogObjects < 1;
  else
    v15 = 1;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v17 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  else
  {
    v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413570;
    v31 = v13;
    v32 = 2112;
    v33 = v14;
    v34 = 1024;
    v35 = a5;
    v36 = 1024;
    v37 = v10;
    v38 = 1024;
    v39 = a7;
    v40 = 1024;
    v41 = v8;
    _os_log_impl(&dword_219602000, v17, OS_LOG_TYPE_INFO, "stateUpdate: %@ blePairingUUID:%@ validMask:%xh btRadioOn:%d pairingState:%d pairingModeOn:%d", buf, 0x2Eu);
  }

  if (v13 && v14 && a5)
  {
    v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v13, "iap2ShimAccessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "connectionID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = *MEMORY[0x24BE009C0];
    v28[0] = *MEMORY[0x24BE00950];
    v28[1] = v22;
    v29[0] = v21;
    v29[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addEntriesFromDictionary:](v18, "addEntriesFromDictionary:", v23);

    if ((a5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v18, "setObject:forKey:", v26, *MEMORY[0x24BE009B0]);

      if ((a5 & 2) == 0)
      {
LABEL_16:
        if ((a5 & 4) == 0)
        {
LABEL_18:
          objc_msgSend(MEMORY[0x24BE00DD0], "notifyInterestedClientsOfACCBLEAccessoryEvent:withPayload:", *MEMORY[0x24BE00978], v18);

          goto LABEL_27;
        }
LABEL_17:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v18, "setObject:forKey:", v24, *MEMORY[0x24BE009A0]);

        goto LABEL_18;
      }
    }
    else if ((a5 & 2) == 0)
    {
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", (char)a7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v18, "setObject:forKey:", v27, *MEMORY[0x24BE009A8]);

    if ((a5 & 4) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v18 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v18 = MEMORY[0x24BDACB70];
    v25 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v31 = v13;
    v32 = 2112;
    v33 = v14;
    v34 = 1024;
    v35 = a5;
    _os_log_impl(&dword_219602000, v18, OS_LOG_TYPE_DEFAULT, "Invalid bleAccessory(%@) or blePairingUUID(%@) or validMask(%x)", buf, 0x1Cu);
  }
LABEL_27:

}

- (void)stateUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairInfoList:(id)a6
{
  id v9;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (gLogObjects)
    v12 = gNumLogObjects < 1;
  else
    v12 = 1;
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  else
  {
    v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    v26 = 1024;
    v27 = a5;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_219602000, v14, OS_LOG_TYPE_INFO, "stateUpdate: %@ blePairingUUID:%@ pairType:%d pairInfoList:%@", buf, 0x26u);
  }

  if (v9 && v10 && a5 <= 1)
  {
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "iap2ShimAccessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "connectionID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = *MEMORY[0x24BE009C0];
    v20[0] = *MEMORY[0x24BE00950];
    v20[1] = v18;
    v21[0] = v17;
    v21[1] = v10;
    v20[2] = *MEMORY[0x24BE00998];
    v21[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE00DD0], "notifyInterestedClientsOfACCBLEAccessoryEvent:withPayload:", *MEMORY[0x24BE00970], v19);

  }
}

- (void)dataUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairData:(id)a6
{
  id v9;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (gLogObjects)
    v12 = gNumLogObjects < 1;
  else
    v12 = 1;
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  else
  {
    v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    v26 = 1024;
    v27 = a5;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_219602000, v14, OS_LOG_TYPE_INFO, "dataUpdate: %@ blePairingUUID:%@ pairType:%d pairData:%@", buf, 0x26u);
  }

  if (v9 && v10 && a5 <= 1)
  {
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v9, "iap2ShimAccessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "connectionID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = *MEMORY[0x24BE009C0];
    v20[0] = *MEMORY[0x24BE00950];
    v20[1] = v18;
    v21[0] = v17;
    v21[1] = v10;
    v20[2] = *MEMORY[0x24BE00990];
    v21[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE00DD0], "notifyInterestedClientsOfACCBLEAccessoryEvent:withPayload:", *MEMORY[0x24BE00968], v19);

  }
}

- (id)getUID
{
  return self->_uid;
}

- (BOOL)tryProcessXPCMessage:(id)a3 connection:(id)a4 server:(id)a5
{
  id v7;
  _xpc_connection_s *v8;
  const char *string;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  char v18;
  xpc_object_t reply;
  uint64_t uint64;
  id WeakRetained;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  size_t v32;
  const void *v33;
  uint64_t v34;
  uint64_t v35;
  ACCBLEPairingShimProtocol **p_delegate;
  id v37;
  uint64_t v38;
  _BOOL8 v39;
  _BOOL8 v40;
  id v41;
  _BOOL8 v42;
  uint64_t v43;
  ACCBLEPairingShimProtocol **v44;
  id v45;
  uint64_t v46;
  _BOOL8 v47;
  _BOOL8 v48;
  _BOOL8 v49;
  _BOOL8 v50;
  _BOOL8 v51;
  uint64_t v52;
  ACCBLEPairingShimProtocol **v53;
  id v54;
  const void *data;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  ACCBLEPairingShimProtocol **v60;
  id v61;
  const void *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  ACCBLEPairingShimProtocol **v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id *v71;
  NSObject *v72;
  id v73;
  size_t v75[2];

  v7 = a3;
  v8 = (_xpc_connection_s *)a4;
  string = xpc_dictionary_get_string(v7, MEMORY[0x24BE00DF8]);
  v10 = 0x253E63000uLL;
  v11 = 0x253E63000uLL;
  if (!string)
  {
    if (gLogObjects)
      v12 = gNumLogObjects < 1;
    else
      v12 = 1;
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    else
    {
      v14 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v75[0]) = 0;
      _os_log_impl(&dword_219602000, v14, OS_LOG_TYPE_DEFAULT, "RequestType not specified in xpc message!", (uint8_t *)v75, 2u);
    }

    string = "<nil>";
  }
  if (gLogObjects)
    v15 = gNumLogObjects < 1;
  else
    v15 = 1;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v17 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  else
  {
    v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:].cold.14((uint64_t)string, v17);

  if (!strcmp(string, "IAPBluetoothDeviceGetAccessoryPairingInfo"))
  {
    reply = xpc_dictionary_create_reply(v7);
    if (reply)
    {
      uint64 = xpc_dictionary_get_uint64(v7, MEMORY[0x24BE00DF0]);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "bleAccessoryForConnectionID:", uint64);
      v22 = objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[NSObject blePairingUUID](v22, "blePairingUUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject supportedPairTypes](v22, "supportedPairTypes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject iap2ShimAccessory](v22, "iap2ShimAccessory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "manufacturer");
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_dictionary_set_string(reply, "btInfoAccessoryMfg", (const char *)objc_msgSend(v26, "UTF8String"));

        -[NSObject iap2ShimAccessory](v22, "iap2ShimAccessory");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "model");
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_dictionary_set_string(reply, "btInfoAccessoryModel", (const char *)objc_msgSend(v28, "UTF8String"));

        v11 = 0x253E63000;
        v29 = objc_retainAutorelease(v23);
        xpc_dictionary_set_data(reply, "btInfoPairUUID", (const void *)objc_msgSend(v29, "bytes"), objc_msgSend(v29, "length"));
        v30 = objc_retainAutorelease(v24);
        v31 = objc_msgSend(v30, "bytes");
        v32 = objc_msgSend(v30, "length");
        v33 = (const void *)v31;
        v10 = 0x253E63000;
        xpc_dictionary_set_data(reply, "btInfoPairTypes", v33, v32);

        v34 = 0;
      }
      else
      {
        v34 = 19;
      }
      xpc_dictionary_set_uint64(reply, MEMORY[0x24BE00DF0], uint64);
      xpc_dictionary_set_uint64(reply, MEMORY[0x24BE00E00], v34);
      xpc_connection_send_message(v8, reply);
      objc_msgSend(MEMORY[0x24BE00DD0], "markClientAsInterestedInBleNotifications:", v8);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
        v22 = MEMORY[0x24BDACB70];
        v58 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:].cold.3();
    }
    goto LABEL_102;
  }
  if (!strcmp(string, "IAPBluetoothDeviceStartBLEUpdates"))
  {
    reply = xpc_dictionary_create_reply(v7);
    if (!reply)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
        v22 = MEMORY[0x24BDACB70];
        v64 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:].cold.5();
      goto LABEL_102;
    }
    v35 = xpc_dictionary_get_uint64(v7, MEMORY[0x24BE00DF0]);
    p_delegate = &self->_delegate;
    v37 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v37, "bleAccessoryForConnectionID:", v35);
    v22 = objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      NSLog(CFSTR("ERROR: DeviceStartBLEUpdates pBTPair = nil"));
      goto LABEL_100;
    }
    v38 = xpc_dictionary_get_uint64(v7, "btParmPairType");
    v39 = xpc_dictionary_get_BOOL(v7, "btParmUpdatesRadio");
    v40 = xpc_dictionary_get_BOOL(v7, "btParmUpdatesPairInfo");
    -[NSObject setSelectedPairType:](v22, "setSelectedPairType:", v38);
    v41 = objc_loadWeakRetained((id *)p_delegate);
    v42 = v40;
    v10 = 0x253E63000;
    objc_msgSend(v41, "deviceStartBLEUpdates:pairType:btRadio:pairInfo:", v22, v38, v39, v42);
LABEL_39:

LABEL_60:
    v63 = 0;
LABEL_101:
    xpc_dictionary_set_uint64(reply, MEMORY[0x24BE00E00], v63);
    xpc_connection_send_message(v8, reply);
LABEL_102:

    v18 = 1;
    goto LABEL_103;
  }
  if (!strcmp(string, "IAPBluetoothDeviceStateUpdate"))
  {
    reply = xpc_dictionary_create_reply(v7);
    if (!reply)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
        v22 = MEMORY[0x24BDACB70];
        v68 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:].cold.7();
      goto LABEL_102;
    }
    v43 = xpc_dictionary_get_uint64(v7, MEMORY[0x24BE00DF0]);
    v44 = &self->_delegate;
    v45 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v45, "bleAccessoryForConnectionID:", v43);
    v22 = objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      NSLog(CFSTR("ERROR: DeviceStateUpdate pBTPair = nil"));
      goto LABEL_100;
    }
    v46 = xpc_dictionary_get_uint64(v7, "btParmPairStatus");
    v47 = xpc_dictionary_get_BOOL(v7, "btParmRadioOn");
    v48 = xpc_dictionary_get_BOOL(v7, "btParmPairModeOn");
    v49 = xpc_dictionary_get_BOOL(v7, "bParmForceUpdates");
    v41 = objc_loadWeakRetained((id *)v44);
    v50 = v48;
    v10 = 0x253E63000;
    v51 = v49;
    v11 = 0x253E63000;
    objc_msgSend(v41, "deviceStateUpdate:btRadio:pairStatus:pairModeOn:forceUpdates:", v22, v47, v46, v50, v51);
    goto LABEL_39;
  }
  if (!strcmp(string, "IAPBluetoothDevicePairingData"))
  {
    reply = xpc_dictionary_create_reply(v7);
    if (!reply)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
        v22 = MEMORY[0x24BDACB70];
        v69 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:].cold.9();
      goto LABEL_102;
    }
    v52 = xpc_dictionary_get_uint64(v7, MEMORY[0x24BE00DF0]);
    v53 = &self->_delegate;
    v54 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v54, "bleAccessoryForConnectionID:", v52);
    v22 = objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      NSLog(CFSTR("ERROR: DevicePairingData pBTPair = nil"));
      goto LABEL_100;
    }
    v75[0] = 0;
    data = xpc_dictionary_get_data(v7, "btParmPairData", v75);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", data, v75[0]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_loadWeakRetained((id *)v53);
    objc_msgSend(v57, "deviceSend:pairType:pairingData:", v22, -[NSObject selectedPairType](v22, "selectedPairType"), v56);
LABEL_59:

    goto LABEL_60;
  }
  if (!strcmp(string, "IAPBluetoothDevicePairingInfoUpdate"))
  {
    reply = xpc_dictionary_create_reply(v7);
    if (!reply)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
        v22 = MEMORY[0x24BDACB70];
        v70 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:].cold.11();
      goto LABEL_102;
    }
    v59 = xpc_dictionary_get_uint64(v7, MEMORY[0x24BE00DF0]);
    v60 = &self->_delegate;
    v61 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v61, "bleAccessoryForConnectionID:", v59);
    v22 = objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      NSLog(CFSTR("ERROR: DevicePairingInfoUpdate pBTPair = nil"));
      goto LABEL_100;
    }
    v75[0] = 0;
    v62 = xpc_dictionary_get_data(v7, "btParmPairInfo", v75);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v62, v75[0]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_loadWeakRetained((id *)v60);
    objc_msgSend(v57, "deviceUpdate:pairType:pairInfo:", v22, -[NSObject selectedPairType](v22, "selectedPairType"), v56);
    goto LABEL_59;
  }
  if (!strcmp(string, "IAPBluetoothDeviceStopBLEUpdates"))
  {
    reply = xpc_dictionary_create_reply(v7);
    if (!reply)
    {
      logObjectForModule();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:].cold.13();
      goto LABEL_102;
    }
    v65 = xpc_dictionary_get_uint64(v7, MEMORY[0x24BE00DF0]);
    v66 = &self->_delegate;
    v67 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v67, "bleAccessoryForConnectionID:", v65);
    v22 = objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v41 = objc_loadWeakRetained((id *)v66);
      objc_msgSend(v41, "deviceStopBLEUpdates:", v22);
      goto LABEL_39;
    }
    NSLog(CFSTR("ERROR: DeviceStopBLEUpdates pBTPair = nil"));
LABEL_100:
    v63 = 19;
    goto LABEL_101;
  }
  v18 = 0;
LABEL_103:
  v71 = *(id **)(v10 + 3520);
  if (v71 && *(int *)(v11 + 3528) >= 1)
  {
    v72 = *v71;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v72 = MEMORY[0x24BDACB70];
    v73 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:].cold.1((uint64_t)string, v18, v72);

  return v18;
}

- (ACCBLEPairingShimProtocol)delegate
{
  return (ACCBLEPairingShimProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)uid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)tryProcessXPCMessage:(uint64_t)a1 connection:(char)a2 server:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = a1;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_219602000, log, OS_LOG_TYPE_DEBUG, "tryProcessXPCMessage: messagetype=%s processed=%d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)tryProcessXPCMessage:connection:server:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_219602000, v0, v1, "tryProcessXPCMessage: ERROR: Client sent kXPCIAPBluetoothDeviceGetAccessoryPairingInfo xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)tryProcessXPCMessage:connection:server:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_219602000, v0, v1, "tryProcessXPCMessage: ERROR: Client sent kXPCIAPBluetoothDeviceStartBLEUpdatesStr xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)tryProcessXPCMessage:connection:server:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_219602000, v0, v1, "tryProcessXPCMessage: ERROR: Client sent kXPCIAPBluetoothDeviceStateUpdateStr xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)tryProcessXPCMessage:connection:server:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_219602000, v0, v1, "tryProcessXPCMessage: ERROR: Client sent kXPCIAPBluetoothDevicePairingDataStr xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)tryProcessXPCMessage:connection:server:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_219602000, v0, v1, "tryProcessXPCMessage: ERROR: Client sent kXPCIAPBluetoothDevicePairingInfoUpdateStr xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)tryProcessXPCMessage:connection:server:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_219602000, v0, v1, "tryProcessXPCMessage: ERROR: Client sent kXPCIAPBluetoothDeviceStopBLEUpdatesStr xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)tryProcessXPCMessage:(uint64_t)a1 connection:(NSObject *)a2 server:.cold.14(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_219602000, a2, OS_LOG_TYPE_DEBUG, "tryProcessXPCMessage: messagetype=%s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
