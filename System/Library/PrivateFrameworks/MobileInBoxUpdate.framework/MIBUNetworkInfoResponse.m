@implementation MIBUNetworkInfoResponse

- (MIBUNetworkInfoResponse)init
{
  MIBUNetworkInfoResponse *v2;
  MIBUNetworkInfoResponse *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUNetworkInfoResponse;
  v2 = -[MIBUNFCResponse init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MIBUNetworkInfoResponse setNetworkInfo:](v2, "setNetworkInfo:", 0);
  return v3;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[15];

  v76[13] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!-[MIBUNFCResponse rejected](self, "rejected"))
    {
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "networkName");
      v74 = v5;
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (v73)
      {
        -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "networkName");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = objc_opt_new();
        v72 = (void *)v6;
      }
      v48 = (void *)v6;
      v76[0] = v6;
      v7 = (void *)MEMORY[0x24BDD16E0];
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "RSSI"));
      v9 = objc_claimAutoreleasedReturnValue();
      v76[1] = v9;
      v10 = (void *)MEMORY[0x24BDD16E0];
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "noise"));
      v12 = objc_claimAutoreleasedReturnValue();
      v76[2] = v12;
      v13 = (void *)MEMORY[0x24BDD16E0];
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "channel"));
      v15 = objc_claimAutoreleasedReturnValue();
      v76[3] = v15;
      v16 = (void *)MEMORY[0x24BDD16E0];
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v65, "channelWidth"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v76[4] = v64;
      v17 = (void *)MEMORY[0x24BDD16E0];
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v63, "channelBand"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v76[5] = v62;
      v18 = (void *)MEMORY[0x24BDD16E0];
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v61, "PHYMode"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v76[6] = v60;
      v19 = (void *)MEMORY[0x24BDD16E0];
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v59, "numberOfSpatialStreams"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v76[7] = v58;
      v20 = (void *)MEMORY[0x24BDD16E0];
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "MCSIndex"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v76[8] = v56;
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "MACAddress");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (v75)
      {
        -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "MACAddress");
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = objc_opt_new();
        v54 = (void *)v22;
      }
      v47 = (void *)v22;
      v76[9] = v22;
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "iPV4Address");
      v23 = objc_claimAutoreleasedReturnValue();
      v66 = (void *)v15;
      v67 = v14;
      if (v23)
      {
        -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "iPV4Address");
        v24 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = objc_opt_new();
        v51 = (void *)v24;
      }
      v52 = (void *)v23;
      v46 = (void *)v24;
      v76[10] = v24;
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "iPV6Address");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = (void *)v9;
      v71 = v8;
      v68 = (void *)v12;
      v69 = v11;
      v26 = v3;
      if (v25)
      {
        -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "iPV6Address");
        v28 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = objc_opt_new();
        v27 = (void *)v28;
      }
      v29 = (void *)v28;
      v76[11] = v28;
      -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "BSSID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v21;
      if (v31)
      {
        -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "BSSID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = (void *)objc_opt_new();
      }
      v76[12] = v32;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 13);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v26, "serialize:withValue:", &unk_24EB5C550, v33);

      if (v31)
      {

        v32 = v8;
      }

      if (v25)
      v3 = v26;
      if (v52)

      if (v75)
      if (v73)

      if ((v50 & 1) != 0)
      {
        -[MIBUNFCResponse error](self, "error");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v26, "serializeResponseError:", v34);

        if ((v35 & 1) != 0)
        {
          objc_msgSend(v26, "serializedData");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_20_0);
        v45 = (void *)MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
          -[MIBUDeviceInfoResponse serialize].cold.1(v45, self);
      }
      else
      {
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_6);
        v37 = MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
          -[MIBUNetworkInfoResponse serialize].cold.2(v37, v38, v39, v40, v41, v42, v43, v44);
      }
    }
    v4 = 0;
  }
LABEL_31:

  return v4;
}

void __36__MIBUNetworkInfoResponse_serialize__block_invoke()
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

void __36__MIBUNetworkInfoResponse_serialize__block_invoke_19()
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MIBUNetworkInfo *v12;
  void *v13;
  uint64_t v14;
  MIBUDeserializer *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;

  v4 = a3;
  v5 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", v4);

  -[MIBUDeserializer deserialize](v5, "deserialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_22_0);
    v42 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNetworkInfoResponse _deserialize:].cold.1(v42, v43, v44, v45, v46, v47, v48, v49);
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v66 = 0;
    v67 = 0;
    v63 = 0;
    v64 = 0;
    v34 = 0;
    v33 = 0;
    v37 = 0;
    v39 = 0;
    v31 = 0;
    v65 = 0;
    goto LABEL_15;
  }
  v72 = 0;
  v7 = -[MIBUDeserializer deserializeResponseError:](v5, "deserializeResponseError:", &v72);
  v65 = v72;
  if (!v7)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_24);
    v50 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNetworkInfoResponse _deserialize:].cold.2(v50, v51, v52, v53, v54, v55, v56, v57);
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v66 = 0;
    v67 = 0;
    v63 = 0;
    v64 = 0;
    v34 = 0;
    v33 = 0;
    v37 = 0;
    v39 = 0;
    v31 = 0;
LABEL_15:
    v40 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C0A8);
  v58 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C0C0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C0D8);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C0F0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C108);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C120);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C138);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C150);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C168);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C180);
  v60 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C198);
  v59 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C1B0);
  v61 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", &unk_24EB5C1C8);
  v62 = objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MIBUNetworkInfo);
  -[MIBUNetworkInfoResponse setNetworkInfo:](self, "setNetworkInfo:", v12);

  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNetworkName:", v58);

  v14 = objc_msgSend(v63, "longValue");
  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v15 = v5;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRSSI:", v14);

  v17 = objc_msgSend(v71, "longValue");
  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNoise:", v17);

  v19 = objc_msgSend(v70, "longValue");
  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setChannel:", v19);

  v21 = (int)objc_msgSend(v69, "intValue");
  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setChannelWidth:", v21);

  v67 = v8;
  v23 = (int)objc_msgSend(v8, "intValue");
  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setChannelBand:", v23);

  v66 = v9;
  v25 = (int)objc_msgSend(v9, "intValue");
  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPHYMode:", v25);

  v68 = v10;
  v27 = objc_msgSend(v10, "unsignedLongValue");
  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNumberOfSpatialStreams:", v27);

  v64 = v11;
  v29 = objc_msgSend(v11, "unsignedLongValue");
  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setMCSIndex:", v29);

  v5 = v15;
  v31 = (void *)v58;
  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v59;
  v34 = (void *)v60;
  objc_msgSend(v32, "setMACAddress:");

  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setIPV4Address:", v59);

  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)v61;
  objc_msgSend(v36, "setIPV6Address:");

  -[MIBUNetworkInfoResponse networkInfo](self, "networkInfo");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v62;
  objc_msgSend(v38, "setBSSID:");

  v40 = 1;
LABEL_4:
  -[MIBUNFCResponse setError:](self, "setError:", v65);

  return v40;
}

void __40__MIBUNetworkInfoResponse__deserialize___block_invoke()
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

void __40__MIBUNetworkInfoResponse__deserialize___block_invoke_23()
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

- (MIBUNetworkInfo)networkInfo
{
  return self->_networkInfo;
}

- (void)setNetworkInfo:(id)a3
{
  objc_storeStrong((id *)&self->_networkInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkInfo, 0);
}

- (void)serialize
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, a1, a3, "Failed to serialize network info", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, a1, a3, "Failed to deserialize payload for NetworkInfo command", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_deserialize:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, a1, a3, "Failed to deserialize response error for NetworkInfo command", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
