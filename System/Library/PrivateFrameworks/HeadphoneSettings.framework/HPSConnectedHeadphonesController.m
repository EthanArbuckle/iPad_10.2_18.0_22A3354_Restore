@implementation HPSConnectedHeadphonesController

- (HPSConnectedHeadphonesController)init
{
  HPSConnectedHeadphonesController *v2;
  HPSConnectedHeadphonesController *v3;
  id deviceChangeHandler;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HPSConnectedHeadphonesController;
  v2 = -[HPSConnectedHeadphonesController init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    deviceChangeHandler = v2->_deviceChangeHandler;
    v2->_deviceChangeHandler = 0;

    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x24BE3F4F0], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addDelegate:", v3);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_deviceConnectionHandler_, *MEMORY[0x24BE0F948], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel_deviceConnectionHandler_, *MEMORY[0x24BE0F940], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel_deviceConnectionHandler_, *MEMORY[0x24BE0F958], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v3, sel_deviceConnectionHandler_, *MEMORY[0x24BE0F950], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v3, sel_deviceConnectionHandler_, *MEMORY[0x24BE0F988], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel_deviceConnectionHandler_, *MEMORY[0x24BE0F928], 0);

  }
  return v3;
}

- (id)topLevelSpecifiers
{
  if (_os_feature_enabled_impl())
    -[HPSConnectedHeadphonesController topLevelSpecifiersRedesign](self, "topLevelSpecifiersRedesign");
  else
    -[HPSConnectedHeadphonesController topLevelSpecifiersLegacey](self, "topLevelSpecifiersLegacey");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDeviceChangeHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id deviceChangeHandler;
  uint8_t v8[16];

  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22E158000, v5, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Setting Device Change Handler", v8, 2u);
  }

  v6 = (void *)MEMORY[0x22E32783C](v4);
  deviceChangeHandler = self->_deviceChangeHandler;
  self->_deviceChangeHandler = v6;

}

- (void)dealloc
{
  id deviceChangeHandler;
  void *v4;
  objc_super v5;

  deviceChangeHandler = self->_deviceChangeHandler;
  self->_deviceChangeHandler = 0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HPSConnectedHeadphonesController;
  -[HPSConnectedHeadphonesController dealloc](&v5, sel_dealloc);
}

- (id)topLevelSpecifiersLegacey
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  HPSConnectedHeadphonesController *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  _QWORD v43[4];
  uint8_t buf[4];
  __CFString *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v37 = self;
  if (!-[HPSConnectedHeadphonesController _BTMAvailable](self, "_BTMAvailable"))
  {
    sharedBluetoothSettingsLogComponent();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[HPSConnectedHeadphonesController topLevelSpecifiersLegacey].cold.1();
    goto LABEL_29;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[HPSConnectedHeadphonesController _BTMPairedDevices](self, "_BTMPairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v39;
    v35 = *MEMORY[0x24BE75948];
    v34 = *MEMORY[0x24BE759F8];
    v33 = *MEMORY[0x24BE75C60];
    v32 = *MEMORY[0x24BE75D08];
    v31 = *MEMORY[0x24BE75D50];
    v7 = 0x24F9F3000uLL;
    v30 = *MEMORY[0x24BE75AC0];
    v29 = *MEMORY[0x24BE75AC8];
    v28 = v3;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v9, "connected")
          && objc_msgSend(*(id *)(v7 + 320), "isAppleHeadphone:", v9)
          && (objc_msgSend(v9, "isTemporaryPaired") & 1) == 0
          && objc_msgSend(v9, "isGenuineAirPods"))
        {
          +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "productName");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (-[HPSConnectedHeadphonesController nicknameEnabled](v37, "nicknameEnabled"))
          {
            objc_msgSend(v10, "name");
            v12 = objc_claimAutoreleasedReturnValue();

            v11 = (__CFString *)v12;
          }
          objc_msgSend(v10, "classicDevice");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            objc_msgSend(v10, "classicDevice");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "magicPaired");

            if (v16)
            {
              objc_msgSend(v10, "name");
              v17 = objc_claimAutoreleasedReturnValue();

              v11 = (__CFString *)v17;
            }
            v3 = v28;
          }
          if (!v11 || -[__CFString isEqualToString:](v11, "isEqualToString:", &stru_24F9F3620))
          {

            v11 = CFSTR(" ");
          }
          sharedBluetoothSettingsLogComponent();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v11;
            _os_log_impl(&dword_22E158000, v18, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Adding device to specifiers: %@", buf, 0xCu);
          }

          v19 = objc_alloc(MEMORY[0x24BDBCED8]);
          v42[0] = v35;
          v43[0] = objc_opt_class();
          v43[1] = CFSTR("BTSPairSetup");
          v42[1] = v34;
          v42[2] = v33;
          v42[3] = v32;
          v43[2] = CFSTR("BTSPairController");
          v43[3] = CFSTR("PSLinkCell");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v19, "initWithDictionary:", v20);

          objc_msgSend(v21, "setObject:forKey:", v11, v31);
          objc_msgSend(v10, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v22, v30);

          objc_msgSend(v21, "setObject:forKey:", CFSTR("BTSDeviceConfigController"), v34);
          -[HPSConnectedHeadphonesController getDeviceIcon:](v37, "getDeviceIcon:", objc_msgSend(v9, "productId"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v23, v29);

          v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v24, "setObject:forKey:", v10, CFSTR("bt-device"));
          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, v37, 0, 0, objc_opt_class(), 2, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setName:", v11);
          objc_msgSend(v25, "setProperties:", v21);
          objc_msgSend(v25, "setUserInfo:", v24);
          objc_msgSend(v36, "addObject:", v25);

          v7 = 0x24F9F3000;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v36, "count"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DEVICE_TYPE_GROUP_ID"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "insertObject:atIndex:", v26, 0);
LABEL_29:

  }
  return v36;
}

- (id)topLevelSpecifiersRedesign
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __CFString *v18;
  int v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
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
  objc_class *v44;
  void *v45;
  int v46;
  NSObject *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  id v52;
  id obj;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  __CFString *v63;
  __CFString *v64;
  __CFString *v65;
  void *v67;
  void *v68;
  id v69;
  __CFString *v70;
  void *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  uint8_t v79[4];
  uint64_t v80;
  uint8_t buf[4];
  __CFString *v82;
  __int16 v83;
  void *v84;
  _QWORD v85[4];
  _QWORD v86[4];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[HPSConnectedHeadphonesController _BTMAvailable](self, "_BTMAvailable"))
  {
    sharedBluetoothSettingsLogComponent();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[HPSConnectedHeadphonesController topLevelSpecifiersLegacey].cold.1();

  }
  -[HPSConnectedHeadphonesController _BTMPairedDevices](self, "_BTMPairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  objc_msgSend(v3, "bs_reduce:block:", v4, &__block_literal_global);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE3F578], "shared");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BE3F578], "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectedHeadphones");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = MEMORY[0x24BDAC760];
  v77[1] = 3221225472;
  v77[2] = __62__HPSConnectedHeadphonesController_topLevelSpecifiersRedesign__block_invoke_2;
  v77[3] = &unk_24F9F3408;
  v52 = v5;
  v78 = v52;
  objc_msgSend(v8, "bs_map:", v77);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v69 = v9;
  v10 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
  if (v10)
  {
    v72 = *(_QWORD *)v74;
    v60 = *MEMORY[0x24BE75948];
    v62 = *MEMORY[0x24BE759F8];
    v58 = *MEMORY[0x24BE75D08];
    v59 = *MEMORY[0x24BE75C60];
    v56 = *MEMORY[0x24BE75AC0];
    v57 = *MEMORY[0x24BE75D50];
    v55 = *MEMORY[0x24BE75AC8];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v74 != v72)
          objc_enumerationMutation(v69);
        v12 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        if (objc_msgSend(v12, "connected")
          && +[HPSProductUtils isAppleHeadphone:](HPSProductUtils, "isAppleHeadphone:", v12)
          && (objc_msgSend(v12, "isTemporaryPaired") & 1) == 0
          && (objc_msgSend(v12, "isGenuineAirPods") & 1) != 0)
        {
          objc_msgSend(v12, "classicDevice");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "productName");
          v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (-[HPSConnectedHeadphonesController nicknameEnabled](self, "nicknameEnabled"))
          {
            objc_msgSend(v71, "name");
            v13 = objc_claimAutoreleasedReturnValue();

            v70 = (__CFString *)v13;
          }
          objc_msgSend(v71, "classicDevice");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v71, "classicDevice");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "magicPaired");

            if (v16)
            {
              objc_msgSend(v71, "name");
              v17 = objc_claimAutoreleasedReturnValue();

              v70 = (__CFString *)v17;
            }
          }
          v18 = v70;
          if (!v70 || (v19 = -[__CFString isEqualToString:](v70, "isEqualToString:", &stru_24F9F3620), v18 = v70, v19))
          {

            v70 = CFSTR(" ");
          }
          sharedBluetoothSettingsLogComponent();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v82 = v70;
            _os_log_impl(&dword_22E158000, v20, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Adding device to specifiers: %@", buf, 0xCu);
          }

          v21 = objc_alloc(MEMORY[0x24BDBCED8]);
          v85[0] = v60;
          v86[0] = objc_opt_class();
          v86[1] = CFSTR("BTSPairSetup");
          v85[1] = v62;
          v85[2] = v59;
          v85[3] = v58;
          v86[2] = CFSTR("BTSPairController");
          v86[3] = CFSTR("PSLinkCell");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = (void *)objc_msgSend(v21, "initWithDictionary:", v22);

          objc_msgSend(v68, "setObject:forKey:", v70, v57);
          objc_msgSend(v71, "btsDevice");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "classicDevice");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v71, "btsDevice");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "classicDevice");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("%p"), v27);
            v65 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v65 = CFSTR("none");
          }

          v28 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v71, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@-%@"), v29, v65);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v68, "setObject:forKey:", v67, v56);
          objc_msgSend(v68, "setObject:forKey:", CFSTR("BTSDeviceConfigController"), v62);
          -[HPSConnectedHeadphonesController getDeviceIcon:](self, "getDeviceIcon:", objc_msgSend(v12, "productId"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setObject:forKey:", v30, v55);

          v31 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v71, "btsDevice");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(v71, "btsDevice");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKey:", v33, CFSTR("bt-device"));

          }
          objc_msgSend(MEMORY[0x24BE3F4E0], "deviceKey");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKey:", v71, v34);

          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("bt-device"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("bt-device"));
            v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v64 = CFSTR("NIL");
          }

          objc_msgSend(MEMORY[0x24BE3F4E0], "deviceKey");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            objc_msgSend(MEMORY[0x24BE3F4E0], "deviceKey");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKeyedSubscript:", v38);
            v63 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v63 = CFSTR("NIL");
          }

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DEVICE_KEY %@, HPS_DEVICE_KEY: %@, PS_IDENTIFIER %@"), v64, v63, v67);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKey:", v39, CFSTR("HPS_DeviceInfo"));
          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v70, self, 0, 0, objc_opt_class(), 2, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setName:", v70);
          objc_msgSend(v40, "setProperties:", v68);
          objc_msgSend(v40, "setUserInfo:", v31);
          objc_msgSend(v71, "headphoneDevice");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            objc_msgSend(v71, "btsDevice");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = v42;
            if (v42)
            {

LABEL_41:
              objc_msgSend(v54, "addObject:", v40);
              sharedBluetoothSettingsLogComponent();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v40, "debugDescription");
                v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v82 = v48;
                v83 = 2112;
                v84 = v39;
                _os_log_impl(&dword_22E158000, v47, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Adding specifier %@ with connected devices %@", buf, 0x16u);

              }
              goto LABEL_46;
            }
            v61 = 0;
          }
          objc_msgSend(v71, "headphoneDevice");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (objc_class *)objc_opt_class();
          NSStringFromClass(v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("HeadphoneManager.HeadphoneReplayDevice"));

          if (v41)
          {

            if ((v46 & 1) != 0)
              goto LABEL_41;
          }
          else if (v46)
          {
            goto LABEL_41;
          }
          sharedBluetoothSettingsLogComponent();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v71, "debugDescription");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[HPSConnectedHeadphonesController topLevelSpecifiersRedesign].cold.1(v49, v79, &v80, v47);
          }
LABEL_46:

          continue;
        }
      }
      v10 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v73, v87, 16);
    }
    while (v10);
  }

  objc_sync_exit(obj);
  if (objc_msgSend(v54, "count"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DEVICE_TYPE_GROUP_ID"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "insertObject:atIndex:", v50, 0);

  }
  return v54;
}

id __62__HPSConnectedHeadphonesController_topLevelSpecifiersRedesign__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a2;
  v5 = a3;
  +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v6, v7);
  return v4;
}

id __62__HPSConnectedHeadphonesController_topLevelSpecifiersRedesign__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "btAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR(":"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE3F4E0]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithHeadphoneDevice:btsDevice:", v3, v7);

  return v8;
}

- (id)connectedHeadphoneInfo
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  -[HPSConnectedHeadphonesController topLevelSpecifiers](self, "topLevelSpecifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__HPSConnectedHeadphonesController_connectedHeadphoneInfo__block_invoke;
  v6[3] = &unk_24F9F3430;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

void __58__HPSConnectedHeadphonesController_connectedHeadphoneInfo__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HPSConnectedHeadphoneInfo *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a2;
    objc_msgSend(v4, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE75D50]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE75AC0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE75AC8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[HPSConnectedHeadphoneInfo initWithID:name:image:specifier:]([HPSConnectedHeadphoneInfo alloc], "initWithID:name:image:specifier:", v8, v6, v10, v4);
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSConnectedHeadphoneInfo deviceID](v11, "deviceID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSConnectedHeadphoneInfo deviceName](v11, "deviceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_22E158000, v12, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Adding device, ID: %@, Name: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

  }
}

- (void)deviceConnectionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id deviceChangeHandler;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_22E158000, v5, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Notification received: %@", (uint8_t *)&v10, 0xCu);

  }
  deviceChangeHandler = self->_deviceChangeHandler;
  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (deviceChangeHandler)
  {
    if (v9)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_22E158000, v8, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Calling Device Change Handler", (uint8_t *)&v10, 2u);
    }

    (*((void (**)(void))self->_deviceChangeHandler + 2))();
  }
  else
  {
    if (v9)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_22E158000, v8, OS_LOG_TYPE_DEFAULT, "Connected Headphones: No Valid Device Change Handler", (uint8_t *)&v10, 2u);
    }

  }
}

- (id)getDeviceIcon:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  +[HPSConnectedHeadphonesController getDeviceIconSymbolString:](HPSConnectedHeadphonesController, "getDeviceIconSymbolString:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)getDeviceIconSymbolString:(unsigned int)a3
{
  const __CFString *v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a3 - 8194 > 0x24)
    v3 = CFSTR("beats.headphones");
  else
    v3 = off_24F9F34A0[a3 - 8194];
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_22E158000, v4, OS_LOG_TYPE_DEFAULT, "Connected Headphones: Icon Name: %@", (uint8_t *)&v6, 0xCu);
  }

  return (id)v3;
}

- (BOOL)_BTMAvailable
{
  NSObject *v2;
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  char v6;
  _QWORD block[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__HPSConnectedHeadphonesController__BTMAvailable__block_invoke;
  block[3] = &unk_24F9F3458;
  v10 = &v16;
  v11 = &v12;
  v3 = v2;
  v9 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v4 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v3, v4);
  if (*((_BYTE *)v13 + 24))
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[HPSConnectedHeadphonesController _BTMAvailable].cold.1();

  }
  v6 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void __49__HPSConnectedHeadphonesController__BTMAvailable__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "available");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_BTMPairedDevices
{
  NSObject *v2;
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__HPSConnectedHeadphonesController__BTMPairedDevices__block_invoke;
  block[3] = &unk_24F9F3458;
  v10 = &v16;
  v11 = &v12;
  v3 = v2;
  v9 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v4 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v3, v4);
  if (*((_BYTE *)v13 + 24))
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[HPSConnectedHeadphonesController _BTMPairedDevices].cold.1();

  }
  v6 = (id)v17[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v6;
}

void __53__HPSConnectedHeadphonesController__BTMPairedDevices__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedDevices");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)BOOLFromBluetoothPreferences:(id)a3
{
  __CFString *v3;
  int AppBooleanValue;
  BOOL v5;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v3 = (__CFString *)a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.BTServer"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, CFSTR("com.apple.BTServer"), &keyExistsAndHasValidFormat);

  if (keyExistsAndHasValidFormat)
    v5 = AppBooleanValue == 0;
  else
    v5 = 1;
  return !v5;
}

- (BOOL)nicknameEnabled
{
  return !-[HPSConnectedHeadphonesController BOOLFromBluetoothPreferences:](self, "BOOLFromBluetoothPreferences:", CFSTR("nicknamingDisabled"));
}

- (void)addTopLevelEntryWithHpDevice:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HPSConnectedHeadphonesController_addTopLevelEntryWithHpDevice___block_invoke;
  block[3] = &unk_24F9F3480;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __65__HPSConnectedHeadphonesController_addTopLevelEntryWithHpDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deviceConnectionHandler:", 0);
}

- (void)removeTopLevelEntryWithHpDevice:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HPSConnectedHeadphonesController_removeTopLevelEntryWithHpDevice___block_invoke;
  block[3] = &unk_24F9F3480;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __68__HPSConnectedHeadphonesController_removeTopLevelEntryWithHpDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deviceConnectionHandler:", 0);
}

- (void)updateTopLevelEntryWithHpDevice:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HPSConnectedHeadphonesController_updateTopLevelEntryWithHpDevice___block_invoke;
  block[3] = &unk_24F9F3480;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __68__HPSConnectedHeadphonesController_updateTopLevelEntryWithHpDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deviceConnectionHandler:", 0);
}

- (void)updateTitleBar
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__HPSConnectedHeadphonesController_updateTitleBar__block_invoke;
  block[3] = &unk_24F9F3480;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __50__HPSConnectedHeadphonesController_updateTitleBar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deviceConnectionHandler:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceChangeHandler, 0);
}

- (void)topLevelSpecifiersLegacey
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E158000, v0, v1, "Connected Headphones: Bluetooth Manager not Available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)topLevelSpecifiersRedesign
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl(&dword_22E158000, log, OS_LOG_TYPE_ERROR, "Connected Headphones: Refusing to add device without both headphone and btsdevice %@", buf, 0xCu);

}

- (void)_BTMAvailable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E158000, v0, v1, "Connected Headphones: _BTMAvailable call timed out seems like available never returned", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_BTMPairedDevices
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E158000, v0, v1, "Connected Headphones: _pairedDevices call timed out seems like pairedDevices never returned", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
