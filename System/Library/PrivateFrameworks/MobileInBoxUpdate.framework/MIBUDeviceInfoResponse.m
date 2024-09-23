@implementation MIBUDeviceInfoResponse

- (MIBUDeviceInfoResponse)init
{
  MIBUDeviceInfoResponse *v2;
  MIBUDeviceInfoResponse *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUDeviceInfoResponse;
  v2 = -[MIBUNFCResponse init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MIBUDeviceInfoResponse setSerialNumber:](v2, "setSerialNumber:", 0);
    -[MIBUDeviceInfoResponse setEcid:](v3, "setEcid:", 0);
    -[MIBUDeviceInfoResponse setBoardID:](v3, "setBoardID:", 0);
    -[MIBUDeviceInfoResponse setChipID:](v3, "setChipID:", 0);
    -[MIBUDeviceInfoResponse setApNonce:](v3, "setApNonce:", 0);
    -[MIBUDeviceInfoResponse setSepNonce:](v3, "setSepNonce:", 0);
    -[MIBUDeviceInfoResponse setSecurityDomain:](v3, "setSecurityDomain:", 0);
    -[MIBUDeviceInfoResponse setProductionMode:](v3, "setProductionMode:", 0);
    -[MIBUDeviceInfoResponse setSecurityMode:](v3, "setSecurityMode:", 0);
    -[MIBUDeviceInfoResponse setUidMode:](v3, "setUidMode:", 0);
    -[MIBUDeviceInfoResponse setSikaFuse:](v3, "setSikaFuse:", 0);
    -[MIBUDeviceInfoResponse setSikaFuseExists:](v3, "setSikaFuseExists:", 1);
  }
  return v3;
}

- (id)serialize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[14];

  v35[12] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (-[MIBUNFCResponse rejected](self, "rejected"))
  {
LABEL_20:
    v23 = 0;
    goto LABEL_11;
  }
  -[MIBUDeviceInfoResponse serialNumber](self, "serialNumber");
  v4 = objc_claimAutoreleasedReturnValue();
  v35[0] = v4;
  -[MIBUDeviceInfoResponse ecid](self, "ecid");
  v5 = objc_claimAutoreleasedReturnValue();
  v35[1] = v5;
  -[MIBUDeviceInfoResponse boardID](self, "boardID");
  v6 = objc_claimAutoreleasedReturnValue();
  v35[2] = v6;
  -[MIBUDeviceInfoResponse chipID](self, "chipID");
  v7 = objc_claimAutoreleasedReturnValue();
  v35[3] = v7;
  -[MIBUDeviceInfoResponse securityDomain](self, "securityDomain");
  v8 = objc_claimAutoreleasedReturnValue();
  v35[4] = v8;
  -[MIBUDeviceInfoResponse apNonce](self, "apNonce");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MIBUDeviceInfoResponse apNonce](self, "apNonce");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v35[5] = v10;
  -[MIBUDeviceInfoResponse sepNonce](self, "sepNonce");
  v33 = (void *)v5;
  v34 = (void *)v4;
  v31 = (void *)v7;
  v32 = (void *)v6;
  v29 = (void *)v9;
  v30 = (void *)v8;
  v26 = objc_claimAutoreleasedReturnValue();
  v28 = v11;
  if (v26)
  {
    -[MIBUDeviceInfoResponse sepNonce](self, "sepNonce", v26, v11, v9, v8, v7, v6, v5, v4);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v13 = (void *)v12;
  v35[6] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MIBUDeviceInfoResponse productionMode](self, "productionMode", v26));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MIBUDeviceInfoResponse securityMode](self, "securityMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MIBUDeviceInfoResponse uidMode](self, "uidMode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v16;
  -[MIBUDeviceInfoResponse sikaFuse](self, "sikaFuse");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v17;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[MIBUDeviceInfoResponse sikaFuseExists](self, "sikaFuseExists"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[11] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v3, "serialize:withValue:", &unk_24EB5C520, v19);

  if ((v20 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_4);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse serialize].cold.2();
    goto LABEL_20;
  }
  -[MIBUNFCResponse error](self, "error");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v3, "serializeResponseError:", v21);

  if ((v22 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_19);
    v25 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse serialize].cold.1(v25, self);
    goto LABEL_20;
  }
  objc_msgSend(v3, "serializedData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v23;
}

void __35__MIBUDeviceInfoResponse_serialize__block_invoke()
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

void __35__MIBUDeviceInfoResponse_serialize__block_invoke_18()
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

- (BOOL)_deserialize:(id)a3
{
  id v4;
  MIBUDeserializer *v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  MIBUDeserializer *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  v4 = a3;
  v5 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", v4);

  -[MIBUDeserializer deserialize](v5, "deserialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v5;
  if (!v6)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_21);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse _deserialize:].cold.1();
    goto LABEL_38;
  }
  v49 = 0;
  v7 = -[MIBUDeserializer deserializeResponseError:](v5, "deserializeResponseError:", &v49);
  v8 = v49;
  v9 = v8;
  if (!v7)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_23);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUStatusResponse _deserialize:].cold.7();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_45;
  }
  if (v8)
  {
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v6, "objectForKey:", &unk_24EB5BF70);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_25);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse _deserialize:].cold.2();
LABEL_38:
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
LABEL_44:
    v9 = 0;
LABEL_45:
    v31 = 0;
    goto LABEL_23;
  }
  v11 = (void *)v10;
  objc_msgSend(v6, "objectForKey:", &unk_24EB5BF88);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_27);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse _deserialize:].cold.3();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    goto LABEL_44;
  }
  v13 = (void *)v12;
  objc_msgSend(v6, "objectForKey:", &unk_24EB5BFA0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v39 = v13;
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_29);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse _deserialize:].cold.4();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    v27 = 0;
    v28 = 0;
    goto LABEL_56;
  }
  v15 = (void *)v14;
  objc_msgSend(v6, "objectForKey:", &unk_24EB5BFB8);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v39 = v13;
    v28 = v15;
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_31);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse _deserialize:].cold.5();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    v27 = 0;
LABEL_56:
    v9 = 0;
    v31 = 0;
    v29 = v39;
    goto LABEL_23;
  }
  v17 = (void *)v16;
  objc_msgSend(v6, "objectForKey:", &unk_24EB5BFD0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v37 = v17;
    v40 = v13;
    v28 = v15;
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_33);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse _deserialize:].cold.6();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    goto LABEL_67;
  }
  v19 = (void *)v18;
  objc_msgSend(v6, "objectForKey:", &unk_24EB5BFE8);
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v32 = v19;
    v37 = v17;
    v40 = v13;
    v28 = v15;
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_35);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse _deserialize:].cold.7();
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
LABEL_67:
    v9 = 0;
    v31 = 0;
    v27 = v37;
    v29 = v40;
    goto LABEL_23;
  }
  v21 = (void *)v20;
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C000);
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C018);
  v23 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v22;
  if (!v23)
  {
    v36 = v21;
    v32 = v19;
    v38 = v17;
    v41 = v13;
    v28 = v15;
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_39_0);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse _deserialize:].cold.8();
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v9 = 0;
    v31 = 0;
    v29 = v41;
    goto LABEL_83;
  }
  v46 = (void *)v23;
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C030);
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    v36 = v21;
    v38 = v17;
    v35 = v15;
    v32 = v19;
    v29 = v13;
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_41_0);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse _deserialize:].cold.9();
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v9 = 0;
    v31 = 0;
    v28 = v35;
    goto LABEL_83;
  }
  v47 = (void *)v24;
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C048);
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v36 = v21;
    v38 = v17;
    v32 = v19;
    v28 = v15;
    v29 = v13;
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_43);
    v30 = v11;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeviceInfoResponse _deserialize:].cold.10();
    v43 = 0;
    v48 = 0;
    v45 = 0;
    v9 = 0;
    v31 = 0;
LABEL_83:
    v21 = v36;
    v27 = v38;
    goto LABEL_23;
  }
  v45 = (void *)v25;
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C078);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v26;
  if (!v26)
  {
    v48 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C060);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
LABEL_21:
    -[MIBUDeviceInfoResponse setSerialNumber:](self, "setSerialNumber:", v11);
    -[MIBUDeviceInfoResponse setEcid:](self, "setEcid:", v13);
    -[MIBUDeviceInfoResponse setBoardID:](self, "setBoardID:", v15);
    -[MIBUDeviceInfoResponse setChipID:](self, "setChipID:", v17);
    -[MIBUDeviceInfoResponse setSecurityDomain:](self, "setSecurityDomain:", v19);
    -[MIBUDeviceInfoResponse setApNonce:](self, "setApNonce:", v21);
    -[MIBUDeviceInfoResponse setSepNonce:](self, "setSepNonce:", v22);
    -[MIBUDeviceInfoResponse setProductionMode:](self, "setProductionMode:", objc_msgSend(v46, "BOOLValue"));
    -[MIBUDeviceInfoResponse setSecurityMode:](self, "setSecurityMode:", objc_msgSend(v47, "BOOLValue"));
    -[MIBUDeviceInfoResponse setUidMode:](self, "setUidMode:", objc_msgSend(v45, "BOOLValue"));
    -[MIBUDeviceInfoResponse setSikaFuse:](self, "setSikaFuse:", v48);
    -[MIBUDeviceInfoResponse setSikaFuseExists:](self, "setSikaFuseExists:", objc_msgSend(v26, "BOOLValue"));
    v27 = v17;
    v29 = v13;
    v32 = v19;
    v28 = v15;
    v30 = v11;
    v9 = 0;
LABEL_22:
    v31 = 1;
    goto LABEL_23;
  }
  v34 = v19;
  v27 = v17;
  v28 = v15;
  v29 = v13;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_45_0);
  v30 = v11;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
    -[MIBUDeviceInfoResponse _deserialize:].cold.11();
  v48 = 0;
  v9 = 0;
  v31 = 0;
  v32 = v34;
LABEL_23:
  -[MIBUNFCResponse setError:](self, "setError:", v9);

  return v31;
}

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_22()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_24()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_26()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_28()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_30()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_32()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_34()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_38()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_40()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_42()
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

void __39__MIBUDeviceInfoResponse__deserialize___block_invoke_44()
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

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSNumber)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
  objc_storeStrong((id *)&self->_ecid, a3);
}

- (NSNumber)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(id)a3
{
  objc_storeStrong((id *)&self->_boardID, a3);
}

- (NSNumber)chipID
{
  return self->_chipID;
}

- (void)setChipID:(id)a3
{
  objc_storeStrong((id *)&self->_chipID, a3);
}

- (NSNumber)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
  self->_securityDomain = (NSNumber *)a3;
}

- (NSData)apNonce
{
  return self->_apNonce;
}

- (void)setApNonce:(id)a3
{
  objc_storeStrong((id *)&self->_apNonce, a3);
}

- (NSData)sepNonce
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

- (NSNumber)sikaFuse
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sikaFuse, 0);
  objc_storeStrong((id *)&self->_sepNonce, 0);
  objc_storeStrong((id *)&self->_apNonce, 0);
  objc_storeStrong((id *)&self->_chipID, 0);
  objc_storeStrong((id *)&self->_boardID, 0);
  objc_storeStrong((id *)&self->_ecid, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

- (void)serialize
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to serialize serial number & nonce", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize payload for DeviceInfo command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize serial number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize ecid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize board ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize chip ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize security domain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize ap nonce", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize production mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize security mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize UID mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize sikaFuse", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
