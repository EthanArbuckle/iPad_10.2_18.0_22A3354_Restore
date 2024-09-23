@implementation BTSDevicesController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BTSDevicesController;
  -[BTSDevicesController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  if (!self->_bluetoothInitialized)
  {
    -[BTSDevicesController allowBluetoothConnections:](self, "allowBluetoothConnections:", 1);
    self->_bluetoothInitialized = 1;
  }
  if (self->_mainFooterNeedsUpdate)
  {
    -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
    self->_mainFooterNeedsUpdate = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Bluetooth"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("Bluetooth"), 0, v6, v8);

  -[BTSDevicesController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.bluetooth"), v9, MEMORY[0x24BDBD1A8], v4);
}

- (void)allowBluetoothConnections:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFDiagnostics *sharingClient;
  SFDiagnostics *v12;
  SFDiagnostics *v13;
  SFDiagnostics *v14;

  v3 = a3;
  if (!a3
    || (objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "applicationState"),
        v5,
        !v6))
  {
    self->_allowScanning = v3;
    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDiscoverable:", v3);

    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConnectable:", v3);

    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDeviceScanningEnabled:", v3);

    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resetDeviceScanning");

    }
    -[BTSDevicesController _setupCentralScanning](self, "_setupCentralScanning");
  }
  sharingClient = self->_sharingClient;
  if (self->_allowScanning)
  {
    if (!sharingClient)
    {
      v13 = (SFDiagnostics *)objc_alloc_init(MEMORY[0x24BE90160]);
      v14 = self->_sharingClient;
      self->_sharingClient = v13;

      -[SFDiagnostics bluetoothUserInteraction](self->_sharingClient, "bluetoothUserInteraction");
    }
  }
  else
  {
    -[SFDiagnostics invalidate](sharingClient, "invalidate");
    v12 = self->_sharingClient;
    self->_sharingClient = 0;

  }
}

- (id)specifiers
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  NSString *invokingClientID;
  void *v11;
  NSString *v12;
  NSString *customTitle;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSString *v27;
  NSString *v28;
  const char *v29;
  _BOOL4 showCarStereoDevices;
  _BOOL4 showSpeakerDevices;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  unint64_t v38;
  void *v39;
  BTSDevicesController *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  PSSpecifier *v46;
  PSSpecifier *myDevicesGroupSpec;
  id *v48;
  PSSpecifier *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSString *v55;
  NSString *restrictionDetail;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
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
  PSSpecifier *v73;
  PSSpecifier *otherDevicesGroupSpec;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  unint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  PSSpecifier *v84;
  objc_class *v85;
  void *v86;
  PSSpecifier *v87;
  void *v88;
  void *v89;
  void *v90;
  PSSpecifier *v91;
  void *v92;
  uint64_t v93;
  PSSpecifier *sharingDevicesGroupSpec;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t j;
  void *v102;
  PSSpecifier *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t k;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  NSMutableDictionary *ctkdCounterpartDevicesDict;
  void *v133;
  void *v134;
  void *v135;
  NSString *pendingSetupDeviceID;
  void *v138;
  void *v139;
  id *v140;
  id v141;
  BTSDevicesController *v142;
  id v143;
  id obj;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  uint64_t v160;
  uint8_t buf[4];
  const char *v162;
  __int16 v163;
  uint64_t v164;
  __int16 v165;
  const char *v166;
  __int16 v167;
  const char *v168;
  __int16 v169;
  const char *v170;
  __int16 v171;
  const char *v172;
  uint64_t v173;
  NSRange v174;

  v173 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_bluetoothRestricted = objc_msgSend(v3, "isBluetoothModificationAllowed") ^ 1;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (v4)
    return v4;
  v140 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v5 = (id)objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_denylistEnabled = objc_msgSend(v6, "denylistEnabled");

  v7 = (int)*MEMORY[0x24BE757A8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("invoking-client-id"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  invokingClientID = self->_invokingClientID;
  self->_invokingClientID = v9;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("custom-localized-title"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  customTitle = self->_customTitle;
  self->_customTitle = v12;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("show-apple-devices"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_showAppleDevices = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("show-audio-devices-only"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_showAudioDevicesOnly = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("show-car-stereo-devices"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self->_showCarStereoDevices = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "userInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("show-speaker-devices"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  self->_showSpeakerDevices = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "userInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("show-le-devices"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  self->_showLEDevices = objc_msgSend(v23, "BOOLValue");

  v142 = self;
  v24 = self->_invokingClientID;
  sharedBluetoothSettingsLogComponent();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    if (!v26)
      goto LABEL_20;
    v27 = self->_invokingClientID;
    v28 = self->_customTitle;
    if (self->_showAppleDevices)
      v29 = "yes";
    else
      v29 = "no";
    showCarStereoDevices = self->_showCarStereoDevices;
    showSpeakerDevices = self->_showSpeakerDevices;
    if (self->_showAudioDevicesOnly)
      v32 = "yes";
    else
      v32 = "no";
    *(_DWORD *)buf = 138413570;
    if (showCarStereoDevices)
      v33 = "yes";
    else
      v33 = "no";
    v162 = (const char *)v27;
    v163 = 2112;
    if (showSpeakerDevices)
      v34 = "yes";
    else
      v34 = "no";
    v164 = (uint64_t)v28;
    v165 = 2080;
    v166 = v29;
    v167 = 2080;
    v168 = v32;
    v169 = 2080;
    v170 = v33;
    v171 = 2080;
    v172 = v34;
    v35 = "BTSettings invoked from a client that is not the main Settings, ID: %@, customTitle: %@, showAppleDevices: %s,"
          " showAudioOnly: %s, showCarStereos: %s showSpeakers: %s";
    v36 = v25;
    v37 = 62;
  }
  else
  {
    if (!v26)
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v35 = "BTSettings invoked from main settings page";
    v36 = v25;
    v37 = 2;
  }
  _os_log_impl(&dword_22F721000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
LABEL_20:

  v38 = 0x24BDBC000uLL;
  v39 = (void *)MEMORY[0x24BDBCEB8];
  v40 = self;
  -[BTSDevicesController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("Devices"), self);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "arrayWithArray:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v143 = (id)objc_claimAutoreleasedReturnValue();
  if (-[BTSDevicesController isMainSettingsPane](self, "isMainSettingsPane") || !self->_power)
  {
    objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "addObject:", v43);

    -[BTSDevicesController _heroPlacardSpecifiers](self, "_heroPlacardSpecifiers");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "addObjectsFromArray:", v44);

    objc_msgSend(v42, "objectAtIndexedSubscript:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "addObject:", v45);

  }
  objc_msgSend(v42, "objectAtIndexedSubscript:", 3);
  v46 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  myDevicesGroupSpec = self->_myDevicesGroupSpec;
  self->_myDevicesGroupSpec = v46;

  v48 = v140;
  if (-[NSMutableDictionary count](self->_pendingOtherRadioDevicesDict, "count"))
  {
    v49 = self->_myDevicesGroupSpec;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("FOLLOW_PAIR_INSTRUCTION_FOOTER"), &stru_24FCCE738, CFSTR("Devices"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v49, "setProperty:forKey:", v51, *MEMORY[0x24BE75A68]);

  }
  if (self->_bluetoothRestricted)
  {
    if (self->_power)
    {
      -[BTSDevicesController _knownDevicesSpecifiers](self, "_knownDevicesSpecifiers");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v52, "count"))
      {
        objc_msgSend(v143, "addObject:", self->_myDevicesGroupSpec);
        objc_msgSend(v143, "addObjectsFromArray:", v52);
      }

    }
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = *MEMORY[0x24BE63820];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v160, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "localizedRestrictionSourceDescriptionForFeatures:", v54);
    v55 = (NSString *)objc_claimAutoreleasedReturnValue();
    restrictionDetail = self->_restrictionDetail;
    self->_restrictionDetail = v55;

    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    obj = v143;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v159, 16);
    if (v57)
    {
      v58 = v57;
      v59 = v42;
      v60 = *(_QWORD *)v154;
      v61 = *MEMORY[0x24BE75A18];
      do
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v154 != v60)
            objc_enumerationMutation(obj);
          v63 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setProperty:forKey:", v64, v61);

        }
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v153, v159, 16);
      }
      while (v58);
      v42 = v59;
    }
  }
  else
  {
    if (self->_denylistEnabled && self->_power)
    {
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DENYLIST_ACTION_GROUP_ID"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("DENYLIST_FOOTER"), &stru_24FCCE738, CFSTR("Devices"));
      v67 = v42;
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setProperty:forKey:", v68, *MEMORY[0x24BE75A68]);

      objc_msgSend(v143, "addObject:", v65);
      v69 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0x24BDBC000;
      objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("ALLOW_NEW_CONNECTIONS"), &stru_24FCCE738, CFSTR("Devices"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v71, self, 0, 0, 0, 13, 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = v67;
      objc_msgSend(v72, "setIdentifier:", CFSTR("DENYLIST_ACTION_ID"));
      objc_msgSend(v143, "addObject:", v72);

    }
    objc_msgSend(v42, "objectAtIndexedSubscript:", 4);
    v73 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    otherDevicesGroupSpec = self->_otherDevicesGroupSpec;
    self->_otherDevicesGroupSpec = v73;

    if (MGGetBoolAnswer())
    {
      objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "isPaired");

      if ((v76 & 1) == 0)
      {
        v77 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v138 = v42;
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v38;
        objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("APPLE_WATCH_FOOTER_TEXT"), &stru_24FCCE738, CFSTR("Devices"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "localizedStringForKey:value:table:", CFSTR("APPLE_WATCH_APP_LINK"), &stru_24FCCE738, CFSTR("Devices"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "stringWithFormat:", v80, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = self;
        v48 = v140;

        v84 = self->_otherDevicesGroupSpec;
        v85 = (objc_class *)objc_opt_class();
        NSStringFromClass(v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setProperty:forKey:](v84, "setProperty:forKey:", v86, *MEMORY[0x24BE75A30]);

        -[PSSpecifier setProperty:forKey:](self->_otherDevicesGroupSpec, "setProperty:forKey:", v83, *MEMORY[0x24BE75A58]);
        v87 = self->_otherDevicesGroupSpec;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("APPLE_WATCH_APP_LINK"), &stru_24FCCE738, CFSTR("Devices"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v174.location = objc_msgSend(v83, "rangeOfString:", v89);
        NSStringFromRange(v174);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setProperty:forKey:](v87, "setProperty:forKey:", v90, *MEMORY[0x24BE75A40]);

        v38 = v79;
        v42 = v138;
        v91 = self->_otherDevicesGroupSpec;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setProperty:forKey:](v91, "setProperty:forKey:", v92, *MEMORY[0x24BE75A50]);

        -[PSSpecifier setProperty:forKey:](self->_otherDevicesGroupSpec, "setProperty:forKey:", CFSTR("userDidTapWatchLink:"), *MEMORY[0x24BE75A38]);
      }
    }
    if (v40->_power)
    {
      -[BTSDevicesController _shareDevicesSpecifiers](v40, "_shareDevicesSpecifiers");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v139 = v42;
      if (objc_msgSend(obj, "count"))
      {
        objc_msgSend(v42, "objectAtIndexedSubscript:", 2);
        v93 = objc_claimAutoreleasedReturnValue();
        sharingDevicesGroupSpec = v40->_sharingDevicesGroupSpec;
        v40->_sharingDevicesGroupSpec = (PSSpecifier *)v93;

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "localizedStringForKey:value:table:", CFSTR("SHARING_WITH"), &stru_24FCCE738, CFSTR("Devices"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setName:](v40->_sharingDevicesGroupSpec, "setName:", v96);

        v151 = 0u;
        v152 = 0u;
        v149 = 0u;
        v150 = 0u;
        v141 = obj;
        v97 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v149, v158, 16);
        if (v97)
        {
          v98 = v97;
          v99 = *(_QWORD *)v150;
          v100 = *MEMORY[0x24BE75A68];
          do
          {
            for (j = 0; j != v98; ++j)
            {
              if (*(_QWORD *)v150 != v99)
                objc_enumerationMutation(v141);
              v102 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * j);
              v103 = v142->_sharingDevicesGroupSpec;
              v104 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "localizedStringForKey:value:table:", CFSTR("SHARING_NOW"), &stru_24FCCE738, CFSTR("Devices"));
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "name");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "stringWithFormat:", v106, v107);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              -[PSSpecifier setProperty:forKey:](v103, "setProperty:forKey:", v108, v100);

            }
            v98 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v149, v158, 16);
          }
          while (v98);
        }

        v40 = v142;
        objc_msgSend(v143, "addObject:", v142->_sharingDevicesGroupSpec);
        objc_msgSend(v143, "addObjectsFromArray:", v141);
        v48 = v140;
        v42 = v139;
        v38 = 0x24BDBC000uLL;
      }
      -[BTSDevicesController _knownDevicesSpecifiers](v40, "_knownDevicesSpecifiers");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v109, "count"))
      {
        objc_msgSend(v143, "addObject:", v40->_myDevicesGroupSpec);
        objc_msgSend(v143, "addObjectsFromArray:", v109);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "localizedStringForKey:value:table:", CFSTR("OTHER_DEVICES"), &stru_24FCCE738, CFSTR("Devices"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setName:](v40->_otherDevicesGroupSpec, "setName:", v111);

        v112 = *(void **)(v38 + 3768);
        objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "connectingDevices");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "arrayWithArray:", v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();

        sharedBluetoothSettingsLogComponent();
        v116 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
        {
          v117 = objc_msgSend(v115, "count");
          *(_DWORD *)buf = 136315650;
          v162 = "-[BTSDevicesController specifiers]";
          v163 = 2048;
          v164 = v117;
          v165 = 2112;
          v166 = (const char *)v115;
          _os_log_impl(&dword_22F721000, v116, OS_LOG_TYPE_INFO, "%s found %lu connecting devices - %@", buf, 0x20u);
        }

        v147 = 0u;
        v148 = 0u;
        v145 = 0u;
        v146 = 0u;
        v118 = v115;
        v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v145, v157, 16);
        if (v119)
        {
          v120 = v119;
          v121 = *(_QWORD *)v146;
          do
          {
            for (k = 0; k != v120; ++k)
            {
              if (*(_QWORD *)v146 != v121)
                objc_enumerationMutation(v118);
              objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * k), "address");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v143, "specifierForID:", v123);
              v124 = (void *)objc_claimAutoreleasedReturnValue();

              if (v124)
              {
                -[BTSDevicesController setBluetoothIsBusy:](v40, "setBluetoothIsBusy:", 1);
                objc_storeStrong((id *)&v40->_currentDeviceSpecifier, v124);
              }

            }
            v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v145, v157, 16);
          }
          while (v120);
        }

        v42 = v139;
      }
      objc_msgSend(v143, "addObject:", v40->_otherDevicesGroupSpec);
    }
    else
    {
      -[BTSDevicesController powerOffWarningString](v40, "powerOffWarningString");
      v125 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "objectAtIndexedSubscript:", 0);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      obj = (id)v125;
      objc_msgSend(v109, "setProperty:forKey:", v125, *MEMORY[0x24BE75A68]);
    }

  }
  objc_storeStrong(v48, v143);
  if (v40->_pendingSetupDeviceID)
  {
    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v40->_pendingSetupDeviceID);
    objc_msgSend(v126, "deviceFromIdentifier:", v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v128, "address");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v40->_devicesDict, "objectForKeyedSubscript:", v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();

    if (v130)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v40->_devicesDict, "objectForKeyedSubscript:", v129);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      ctkdCounterpartDevicesDict = v40->_ctkdCounterpartDevicesDict;
      objc_msgSend(v131, "identifier");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](ctkdCounterpartDevicesDict, "objectForKeyedSubscript:", v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      if (v134)
      {
        objc_msgSend(v134, "underlyingDADevice");
        v135 = (void *)objc_claimAutoreleasedReturnValue();

        if (v135)
        {
          -[BTSDevicesController forcePushDetailViewForDevice:](v40, "forcePushDetailViewForDevice:", v131);
          pendingSetupDeviceID = v40->_pendingSetupDeviceID;
          v40->_pendingSetupDeviceID = 0;

        }
      }

    }
  }

  v4 = *v48;
  return v4;
}

- (id)_knownDevicesSpecifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  CBCentralManager *centralManager;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  const char *v51;
  void *v52;
  NSObject *v53;
  NSMutableDictionary *pendingOtherRadioDevicesDict;
  void *v55;
  void *v56;
  NSMutableDictionary *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t m;
  void *v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t n;
  void *v78;
  NSMutableDictionary *devicesDict;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t ii;
  void *v87;
  NSMutableDictionary *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t jj;
  uint64_t v97;
  void *v98;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *obj;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;
  _BYTE v152[128];
  uint8_t v153[128];
  uint8_t buf[4];
  void *v155;
  _BYTE v156[128];
  _BYTE v157[128];
  uint64_t v158;

  v158 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v142, v157, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v143;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v143 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * i);
        +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "classicDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "address");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKey:](self->managedByWalletDictionary, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v10, "setManagedByWallet:", 1);
          objc_msgSend(v10, "setManagedByAliroWallet:", 1);
        }
        -[NSMutableDictionary objectForKey:](self->supportsBackgroundNIDictionary, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v10, "setSupportsBackgroundNI:", 1);
        if ((objc_msgSend(v9, "isTemporaryPaired") & 1) == 0)
        {
          objc_msgSend(v107, "addObject:", v10);
          objc_msgSend(v105, "setObject:forKeyedSubscript:", v10, v12);
          if (objc_msgSend(v10, "connected"))
          {
            if (objc_msgSend(v10, "isLimitedConnectivityDevice"))
            {
              -[NSMutableSet addObject:](self->_connectedPoorBehaviorDevices, "addObject:", v10);
              self->_mainFooterNeedsUpdate = 1;
            }
            if (objc_msgSend(v10, "isHIDDevice"))
            {
              -[NSMutableSet addObject:](self->_connectedHIDDevices, "addObject:", v10);
              self->_mainFooterNeedsUpdate = 1;
            }
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v142, v157, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v15;
  if (self->_power)
  {
    v140 = 0u;
    v141 = 0u;
    v138 = 0u;
    v139 = 0u;
    -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "retrievePairedPeers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v138, v156, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v139;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v139 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * j);
          -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v22, "setDelegate:", self);
            if (objc_msgSend(v23, "isManagedByDeviceAccess"))
            {
              sharedBluetoothSettingsLogComponent();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v155 = v23;
                _os_log_impl(&dword_22F721000, v24, OS_LOG_TYPE_DEFAULT, "This device needs to be coalesced with a DADevice before being displayed: %@", buf, 0xCu);
              }

              objc_msgSend(v22, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "setObject:forKeyedSubscript:", v22, v25);

            }
            else
            {
              objc_msgSend(v107, "addObject:", v23);
              if (objc_msgSend(v23, "connected"))
              {
                if (objc_msgSend(v23, "isLimitedConnectivityDevice"))
                {
                  -[NSMutableSet addObject:](self->_connectedPoorBehaviorDevices, "addObject:", v23);
                  self->_mainFooterNeedsUpdate = 1;
                }
                if (objc_msgSend(v23, "isFirmwareUpdateRequiredDevice"))
                {
                  -[NSMutableSet addObject:](self->_connectedFirmwareUpdateRequiredDevices, "addObject:", v23);
                  self->_mainFooterNeedsUpdate = 1;
                }
                if (objc_msgSend(v23, "isHIDDevice"))
                {
                  -[NSMutableSet addObject:](self->_connectedHIDDevices, "addObject:", v23);
                  self->_mainFooterNeedsUpdate = 1;
                }
              }
            }
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v138, v156, 16);
      }
      while (v19);
    }

    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    -[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:](self->_centralManager, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v134, v153, 16);
    v15 = v106;
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v135;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v135 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * k);
          if (objc_msgSend(v31, "connectedTransport") == 2)
          {
            -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              if (objc_msgSend(v31, "visibleInSettings"))
              {
                objc_msgSend(v31, "setDelegate:", self);
                if (objc_msgSend(v32, "isManagedByDeviceAccess"))
                {
                  sharedBluetoothSettingsLogComponent();
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v155 = v32;
                    _os_log_impl(&dword_22F721000, v33, OS_LOG_TYPE_DEFAULT, "This device needs to be coalesced with a DADevice before being displayed: %@", buf, 0xCu);
                  }

                  objc_msgSend(v31, "identifier");
                  v34 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v106, "setObject:forKeyedSubscript:", v31, v34);
                  goto LABEL_52;
                }
                objc_msgSend(v107, "addObject:", v32);
              }
              else
              {
                sharedBluetoothSettingsLogComponent();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v155 = v31;
                  _os_log_impl(&dword_22F721000, v34, OS_LOG_TYPE_DEFAULT, "Peripheral %@ should not be visible in Settings. Ignoring.", buf, 0xCu);
                }
LABEL_52:

              }
            }

            v15 = v106;
            continue;
          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v134, v153, 16);
      }
      while (v28);
    }

    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    -[NSMutableDictionary allKeys](self->_knownDADevices, "allKeys");
    v100 = (id)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v130, v152, 16);
    if (!v102)
      goto LABEL_92;
    v101 = *(_QWORD *)v131;
LABEL_59:
    v35 = 0;
    while (1)
    {
      if (*(_QWORD *)v131 != v101)
        objc_enumerationMutation(v100);
      v103 = v35;
      v36 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * v35);
      -[NSMutableDictionary objectForKey:](self->_knownDADevices, "objectForKey:", v36);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      centralManager = self->_centralManager;
      v151 = v36;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v151, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBCentralManager retrievePeripheralsWithIdentifiers:](centralManager, "retrievePeripheralsWithIdentifiers:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      v40 = v39;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v126, v150, 16);
      if (v41)
        break;
LABEL_90:

      v35 = v103 + 1;
      if (v103 + 1 == v102)
      {
        v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v130, v152, 16);
        if (!v102)
        {
LABEL_92:

          goto LABEL_93;
        }
        goto LABEL_59;
      }
    }
    v42 = v41;
    v43 = *(_QWORD *)v127;
LABEL_64:
    v44 = 0;
    while (1)
    {
      if (*(_QWORD *)v127 != v43)
        objc_enumerationMutation(v40);
      v45 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v44);
      objc_msgSend(v45, "setDelegate:", self);
      objc_msgSend(v45, "identifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v46);

      +[BTSDeviceLE deviceWithPeripheral:manager:](BTSDeviceLE, "deviceWithPeripheral:manager:", v45, self->_centralManager);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v47)
      {
        if (objc_msgSend(v47, "supportsCTKD"))
        {
          sharedBluetoothSettingsLogComponent();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v155 = v45;
            v50 = v49;
            v51 = "Not showing peripheral because it's CTKD and will be shown with the classic device instead: %@";
LABEL_73:
            _os_log_impl(&dword_22F721000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v48, "relatedFutureRadioAddress");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (v52)
          {
            sharedBluetoothSettingsLogComponent();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v155 = v45;
              _os_log_impl(&dword_22F721000, v53, OS_LOG_TYPE_DEFAULT, "Peripheral is waiting to link to a classic radio that is yet to be paired, showing LE first: %@", buf, 0xCu);
            }

            objc_msgSend(v48, "setUnderlyingDADevice:", v108);
            objc_msgSend(v107, "addObject:", v48);
            pendingOtherRadioDevicesDict = self->_pendingOtherRadioDevicesDict;
            objc_msgSend(v48, "relatedFutureRadioAddress");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](pendingOtherRadioDevicesDict, "setObject:forKey:", v48, v55);

            goto LABEL_88;
          }
          objc_msgSend(v48, "linkedRadioAddress");
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v56)
            goto LABEL_87;
          v57 = self->_pendingOtherRadioDevicesDict;
          objc_msgSend(v48, "linkedRadioAddress");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v57, "setObject:forKeyedSubscript:", 0, v58);

          objc_msgSend(v48, "linkedRadioAddress");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "objectForKeyedSubscript:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          sharedBluetoothSettingsLogComponent();
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = v61;
          if (!v60)
          {
            v15 = v106;
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v155 = v45;
              _os_log_error_impl(&dword_22F721000, v62, OS_LOG_TYPE_ERROR, "Peripheral has linked classic radio but we don't see the classic device with this address. Showing LE device %@", buf, 0xCu);
            }

LABEL_87:
            objc_msgSend(v48, "setUnderlyingDADevice:", v108);
            objc_msgSend(v107, "addObject:", v48);
            goto LABEL_88;
          }
          v15 = v106;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v155 = v45;
            _os_log_impl(&dword_22F721000, v62, OS_LOG_TYPE_DEFAULT, "Not showing peripheral because it's linked to another classic radio and will be shown with the classic device instead: %@", buf, 0xCu);
          }

          objc_msgSend(v45, "identifier");
          v49 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "setObject:forKeyedSubscript:", v45, v49);
        }
      }
      else
      {
        sharedBluetoothSettingsLogComponent();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v155 = v45;
          v50 = v49;
          v51 = "unable to create BTSDeviceLE for this DA peripheral: %@";
          goto LABEL_73;
        }
      }

LABEL_88:
      if (v42 == ++v44)
      {
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v126, v150, 16);
        if (!v42)
          goto LABEL_90;
        goto LABEL_64;
      }
    }
  }
LABEL_93:
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  objc_msgSend(v15, "allValues");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v122, v149, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v123;
    do
    {
      for (m = 0; m != v65; ++m)
      {
        if (*(_QWORD *)v123 != v66)
          objc_enumerationMutation(v63);
        v68 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * m);
        sharedBluetoothSettingsLogComponent();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v155 = v68;
          _os_log_impl(&dword_22F721000, v69, OS_LOG_TYPE_DEFAULT, "Unable to fetch DADevice for DA tagged Peripheral, we should still add it to UI for user to be able to manage: %@", buf, 0xCu);
        }

        -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (v70)
        {
          if (objc_msgSend(v68, "visibleInSettings"))
          {
            objc_msgSend(v68, "setDelegate:", self);
            objc_msgSend(v107, "addObject:", v70);
          }
          else
          {
            sharedBluetoothSettingsLogComponent();
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v155 = v68;
              _os_log_impl(&dword_22F721000, v71, OS_LOG_TYPE_DEFAULT, "Peripheral %@ should not be visible in Settings. Ignoring.", buf, 0xCu);
            }

          }
        }

      }
      v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v122, v149, 16);
    }
    while (v65);
  }

  objc_msgSend(v107, "unionSet:", self->_knownHealthDevices);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v73 = v107;
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v118, v148, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v119;
    do
    {
      for (n = 0; n != v75; ++n)
      {
        if (*(_QWORD *)v119 != v76)
          objc_enumerationMutation(v73);
        v78 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * n);
        devicesDict = self->_devicesDict;
        objc_msgSend(v78, "identifier");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](devicesDict, "setObject:forKey:", v78, v80);

      }
      v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v118, v148, 16);
    }
    while (v75);
  }

  -[BTSDevicesController refreshCTKDDevices](self, "refreshCTKDDevices");
  v81 = v104;
  if (objc_msgSend(v104, "count"))
  {
    obj = v72;
    -[BTSDevicesController mergeDualRadioDevices:](self, "mergeDualRadioDevices:", v104);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v114, v147, 16);
    if (v83)
    {
      v84 = v83;
      v85 = *(_QWORD *)v115;
      do
      {
        for (ii = 0; ii != v84; ++ii)
        {
          if (*(_QWORD *)v115 != v85)
            objc_enumerationMutation(v82);
          v87 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * ii);
          objc_msgSend(v73, "addObject:", v87);
          v88 = self->_devicesDict;
          objc_msgSend(v87, "identifier");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v88, "setObject:forKey:", v87, v89);

        }
        v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v114, v147, 16);
      }
      while (v84);
    }

    v81 = v104;
    v72 = obj;
  }
  else
  {
    -[NSMutableDictionary removeAllObjects](self->_dualRadioCounterpartDevicesDict, "removeAllObjects");
  }
  objc_msgSend(v73, "allObjects");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "sortedArrayUsingComparator:", &__block_literal_global);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v92 = v91;
  v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v110, v146, 16);
  if (v93)
  {
    v94 = v93;
    v95 = *(_QWORD *)v111;
    do
    {
      for (jj = 0; jj != v94; ++jj)
      {
        if (*(_QWORD *)v111 != v95)
          objc_enumerationMutation(v92);
        v97 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * jj);
        if (-[BTSDevicesController shouldDisplayDevice:](self, "shouldDisplayDevice:", v97))
        {
          -[BTSDevicesController _specifierForDevice:](self, "_specifierForDevice:", v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "addObject:", v98);

        }
      }
      v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v110, v146, 16);
    }
    while (v94);
  }

  return v72;
}

- (void)refreshCTKDDevices
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSMutableDictionary *devicesDict;
  void *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *knownDADevices;
  void *v26;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  int v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  if (self->_power)
  {
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F721000, v3, OS_LOG_TYPE_DEFAULT, "CTKD : Update CTKD device properties", buf, 2u);
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "retrievePairedPeers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v5;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v44;
      v10 = 0x24FCCD000uLL;
      *(_QWORD *)&v7 = 138412546;
      v38 = v7;
      v39 = *(_QWORD *)v44;
      do
      {
        v11 = 0;
        v40 = v8;
        do
        {
          if (*(_QWORD *)v44 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v11);
          objc_msgSend(*(id *)(v10 + 2224), "deviceWithPeripheral:manager:", v12, self->_centralManager, v38);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13 && objc_msgSend(v13, "supportsCTKD"))
          {
            objc_msgSend(v12, "setDelegate:", self);
            sharedBluetoothSettingsLogComponent();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v12, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v48 = v16;
              _os_log_impl(&dword_22F721000, v15, OS_LOG_TYPE_DEFAULT, "Get derived device for CTKD device: %@", buf, 0xCu);

            }
            objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "deviceFromIdentifier:", v18);
            v19 = objc_claimAutoreleasedReturnValue();

            v42 = (void *)v19;
            +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            devicesDict = self->_devicesDict;
            objc_msgSend(v20, "classicDevice");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "address");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](devicesDict, "objectForKey:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v24, "setCtkdDevice:", 1);
              if (objc_msgSend(v14, "isManagedByDeviceAccess"))
              {
                knownDADevices = self->_knownDADevices;
                objc_msgSend(v12, "identifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKeyedSubscript:](knownDADevices, "objectForKeyedSubscript:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setUnderlyingDADevice:", v27);

                objc_msgSend(v14, "name");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setAccessorySetupKitDisplayName:", v28);

                objc_msgSend(v24, "setDenyIncomingClassicConnection:", objc_msgSend(v14, "shouldDenyIncomingClassicConnection"));
              }
              v29 = self->_devicesDict;
              objc_msgSend(v20, "classicDevice");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "address");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v24, v31);

              sharedBluetoothSettingsLogComponent();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v14, "name");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v24, "isCTKDDevice");
                *(_DWORD *)buf = v38;
                v48 = v36;
                v49 = 1024;
                v50 = v37;
                _os_log_debug_impl(&dword_22F721000, v32, OS_LOG_TYPE_DEBUG, "CTKD : classic device found in list %@ with CTKD : %d", buf, 0x12u);

              }
              objc_msgSend(v12, "identifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "UUIDString");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
                -[NSMutableDictionary objectForKey:](self->_ctkdLeDevicesDict, "objectForKey:", v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v35)
                {
                  objc_msgSend(v14, "setCtkdDevice:", 1);
                  -[NSMutableDictionary setObject:forKey:](self->_ctkdLeDevicesDict, "setObject:forKey:", v14, v34);
                }
              }
              -[BTSDevicesController updateCTKDCounterparts:leDevice:](self, "updateCTKDCounterparts:leDevice:", v24, v14);

            }
            v9 = v39;
            v10 = 0x24FCCD000;
            v8 = v40;
          }

          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v8);
    }

  }
}

- (id)_getDeviceForPeripheral:(id)a3
{
  id v4;
  NSMutableDictionary *devicesDict;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *knownDADevices;
  void *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  int v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  devicesDict = self->_devicesDict;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](devicesDict, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[BTSDeviceLE deviceWithPeripheral:manager:](BTSDeviceLE, "deviceWithPeripheral:manager:", v4, self->_centralManager);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[BTSDevicesController shouldHideDevice:](self, "shouldHideDevice:", v8))
    {
      if (objc_msgSend(v4, "hasTag:", CFSTR("_MANAGED_BY_WALLET_")))
      {
        objc_msgSend(v8, "setManagedByWallet:", 1);
        sharedBluetoothSettingsLogComponent();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v38) = 0;
          _os_log_impl(&dword_22F721000, v11, OS_LOG_TYPE_DEFAULT, "DCK : Digital Car Key are special", (uint8_t *)&v38, 2u);
        }

      }
      if (objc_msgSend(v4, "hasTag:", CFSTR("_MANAGED_BY_ALIRO_WALLET_")))
      {
        objc_msgSend(v8, "setManagedByAliroWallet:", 1);
        sharedBluetoothSettingsLogComponent();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v38) = 0;
          _os_log_impl(&dword_22F721000, v12, OS_LOG_TYPE_DEFAULT, "Aliro : Home Key are special", (uint8_t *)&v38, 2u);
        }

      }
      objc_msgSend(v4, "customProperty:", CFSTR("Fitness"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_msgSend(v8, "setHealthDevice:", 1);
      if (!objc_msgSend(v8, "supportsCTKD"))
      {
        sharedBluetoothSettingsLogComponent();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "name");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138412290;
          v39 = v33;
          _os_log_impl(&dword_22F721000, v9, OS_LOG_TYPE_DEFAULT, "CTKD : Device %@ does not support CTKD", (uint8_t *)&v38, 0xCu);

        }
        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "deviceFromIdentifier:", v15);
      v9 = objc_claimAutoreleasedReturnValue();

      +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = self->_devicesDict;
      objc_msgSend(v16, "classicDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "address");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v17, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v20, "setCtkdDevice:", 1);
        if (objc_msgSend(v8, "isManagedByDeviceAccess"))
        {
          knownDADevices = self->_knownDADevices;
          objc_msgSend(v4, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](knownDADevices, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setUnderlyingDADevice:", v23);

          objc_msgSend(v8, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setAccessorySetupKitDisplayName:", v24);

          objc_msgSend(v20, "setDenyIncomingClassicConnection:", objc_msgSend(v8, "shouldDenyIncomingClassicConnection"));
        }
        v25 = self->_devicesDict;
        objc_msgSend(v16, "classicDevice");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "address");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v20, v27);

        sharedBluetoothSettingsLogComponent();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[BTSDevicesController _getDeviceForPeripheral:].cold.2();

        objc_msgSend(v4, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "UUIDString");
        v30 = objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          -[NSMutableDictionary objectForKey:](self->_ctkdLeDevicesDict, "objectForKey:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            objc_msgSend(v8, "setCtkdDevice:", 1);
            -[NSMutableDictionary setObject:forKey:](self->_ctkdLeDevicesDict, "setObject:forKey:", v8, v30);
            -[BTSDevicesController updateCTKDCounterparts:leDevice:](self, "updateCTKDCounterparts:leDevice:", v20, v8);
          }
        }
      }
      else
      {
        v34 = objc_msgSend(v4, "hasTag:", CFSTR("HasTS"));
        sharedBluetoothSettingsLogComponent();
        v35 = objc_claimAutoreleasedReturnValue();
        v30 = v35;
        if (v34)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            -[BTSDevicesController _getDeviceForPeripheral:].cold.1(v30);

          goto LABEL_29;
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138412290;
          v39 = v36;
          _os_log_impl(&dword_22F721000, v30, OS_LOG_TYPE_INFO, "CTKD : Device %@ missing from list of classic paired devices", (uint8_t *)&v38, 0xCu);

        }
      }

    }
    v32 = 0;
    goto LABEL_41;
  }
  if (objc_msgSend(v4, "hasTag:", CFSTR("_MANAGED_BY_WALLET_")))
  {
    objc_msgSend(v8, "setManagedByWallet:", 1);
    sharedBluetoothSettingsLogComponent();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v38) = 0;
      v10 = "DCK : Digital Car Key are special";
LABEL_28:
      _os_log_impl(&dword_22F721000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v38, 2u);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  if (objc_msgSend(v4, "hasTag:", CFSTR("_MANAGED_BY_ALIRO_WALLET_")))
  {
    objc_msgSend(v8, "setManagedByAliroWallet:", 1);
    sharedBluetoothSettingsLogComponent();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v38) = 0;
      v10 = "Alire : Home Key are special";
      goto LABEL_28;
    }
LABEL_29:

  }
  v32 = v8;
  v8 = v32;
LABEL_41:

  return v32;
}

- (id)_specifierForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  CBCentralManager *centralManager;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *knownDADevices;
  void *v28;
  void *v29;
  const __CFString *v30;
  NSMutableDictionary *dualRadioCounterpartDevicesDict;
  void *v32;
  void *v33;
  NSMutableDictionary *v34;
  _QWORD v36[4];
  _QWORD v37[4];
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v4;
    _os_log_impl(&dword_22F721000, v5, OS_LOG_TYPE_DEFAULT, "Creating specifier for device: %@.", buf, 0xCu);
  }

  objc_msgSend(v4, "productName");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[BTSDevicesController nicknameEnabled](self, "nicknameEnabled"))
  {
    objc_msgSend(v4, "name");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v7;
  }
  objc_msgSend(v4, "classicDevice");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v4, "classicDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "magicPaired");

    if (v11)
    {
      objc_msgSend(v4, "name");
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (__CFString *)v12;
    }
  }
  if (!v6 || -[__CFString isEqualToString:](v6, "isEqualToString:", &stru_24FCCE738))
  {

    v6 = CFSTR(" ");
  }
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, objc_opt_class(), 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDBCED8]);
  v36[0] = *MEMORY[0x24BE75948];
  v15 = objc_opt_class();
  v16 = *MEMORY[0x24BE759F8];
  v37[0] = v15;
  v37[1] = CFSTR("BTSPairSetup");
  v17 = *MEMORY[0x24BE75C60];
  v36[1] = v16;
  v36[2] = v17;
  v36[3] = *MEMORY[0x24BE75D08];
  v37[2] = CFSTR("BTSPairController");
  v37[3] = CFSTR("PSLinkCell");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v14, "initWithDictionary:", v18);

  objc_msgSend(v13, "setName:", v6);
  objc_msgSend(v19, "setObject:forKey:", v6, *MEMORY[0x24BE75D50]);
  objc_msgSend(v4, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v20, *MEMORY[0x24BE75AC0]);

  objc_msgSend(v19, "setObject:forKey:", CFSTR("BTSDeviceConfigController"), v16);
  objc_msgSend(v13, "setProperties:", v19);
  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v21, "setObject:forKey:", v4, CFSTR("bt-device"));
  if (objc_msgSend(v4, "isCTKDDevice"))
  {
    centralManager = self->_centralManager;
    objc_msgSend(v4, "classicDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "address");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager retrievePeripheralWithAddress:](centralManager, "retrievePeripheralWithAddress:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[BTSDeviceLE deviceWithPeripheral:manager:](BTSDeviceLE, "deviceWithPeripheral:manager:", v25, self->_centralManager);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isManagedByDeviceAccess"))
    {
      knownDADevices = self->_knownDADevices;
      objc_msgSend(v25, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](knownDADevices, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setUnderlyingDADevice:", v29);

    }
    v30 = CFSTR("ctkd-device");
    goto LABEL_17;
  }
  dualRadioCounterpartDevicesDict = self->_dualRadioCounterpartDevicesDict;
  objc_msgSend(v4, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](dualRadioCounterpartDevicesDict, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = self->_dualRadioCounterpartDevicesDict;
    objc_msgSend(v4, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CFSTR("linked-le-device");
LABEL_17:
    objc_msgSend(v21, "setObject:forKey:", v26, v30);

  }
  objc_msgSend(v13, "setUserInfo:", v21);

  return v13;
}

- (BOOL)nicknameEnabled
{
  return !-[BTSDevicesController BOOLFromBluetoothPreferences:](self, "BOOLFromBluetoothPreferences:", CFSTR("nicknamingDisabled"));
}

- (BOOL)shouldHideDevice:(id)a3
{
  return objc_msgSend(a3, "cloudPaired");
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

- (id)_shareDevicesSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  NSMutableDictionary *sharingDevicesDict;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v10, "isTemporaryPaired"))
        {
          +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v3;
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        if (-[BTSDevicesController shouldDisplayDevice:](self, "shouldDisplayDevice:", v21))
        {
          -[BTSDevicesController _specifierForSharingDevice:](self, "_specifierForSharingDevice:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v22);

          sharingDevicesDict = self->_sharingDevicesDict;
          objc_msgSend(v21, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](sharingDevicesDict, "setObject:forKey:", v21, v24);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v18);
  }

  return v15;
}

- (void)_updateHealthDevices
{
  NSMutableSet *v3;
  NSMutableSet *knownHealthDevices;
  CBCentralManager *centralManager;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSMutableSet *v15;
  NSMutableSet *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint8_t buf[4];
  NSMutableSet *v24;
  _BYTE v25[128];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableSet *)objc_opt_new();
  knownHealthDevices = self->_knownHealthDevices;
  self->_knownHealthDevices = v3;

  if (_os_feature_enabled_impl())
  {
    centralManager = self->_centralManager;
    v26[0] = CFSTR("Fitness");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __44__BTSDevicesController__updateHealthDevices__block_invoke;
    v22[3] = &unk_24FCCDFB8;
    v22[4] = self;
    -[CBCentralManager retrievePeripheralsWithCustomProperties:completion:](centralManager, "retrievePeripheralsWithCustomProperties:completion:", v6, v22);

  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[CBCentralManager retrievePeripheralsWithIdentifiers:](self->_centralManager, "retrievePeripheralsWithIdentifiers:", self->_retrievedHealthServices);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "setHealthDevice:", 1);
            -[NSMutableSet addObject:](self->_knownHealthDevices, "addObject:", v13);
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v9);
    }

    sharedBluetoothSettingsLogComponent();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = self->_knownHealthDevices;
      *(_DWORD *)buf = 138412290;
      v24 = v15;
      _os_log_impl(&dword_22F721000, v14, OS_LOG_TYPE_INFO, "Found known health devices %@", buf, 0xCu);
    }

    if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
    {
      v16 = self->_knownHealthDevices;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __44__BTSDevicesController__updateHealthDevices__block_invoke_408;
      v17[3] = &unk_24FCCE138;
      v17[4] = self;
      -[NSMutableSet enumerateObjectsUsingBlock:](v16, "enumerateObjectsUsingBlock:", v17);
    }
  }
}

- (void)_setupCentralScanning
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CBCentralManager *centralManager;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  if (self->_power)
  {
    if (self->_allowScanning)
    {
      v3 = (void *)-[NSArray mutableCopy](self->_healthServices, "mutableCopy");
      objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *MEMORY[0x24BDBB208]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v4);

      if (-[BTSDevicesController isiPhone](self, "isiPhone"))
      {
        if (-[BTSDevicesController isLECarPlayEnabled](self, "isLECarPlayEnabled"))
        {
          objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *MEMORY[0x24BDBB210]);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v5);

        }
      }
      objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *MEMORY[0x24BDBB1E8]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v6;
      objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *MEMORY[0x24BDBB1F0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v7;
      objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *MEMORY[0x24BDBB1E0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      centralManager = self->_centralManager;
      v12 = *MEMORY[0x24BDBB0E8];
      v13 = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBCentralManager scanForPeripheralsWithServices:options:](centralManager, "scanForPeripheralsWithServices:options:", v3, v11);

    }
    else
    {
      -[CBCentralManager stopScan](self->_centralManager, "stopScan");
    }
  }
}

- (id)_getDeviceForCTKDPeripheral:(id)a3
{
  id v4;
  NSMutableDictionary *ctkdLeDevicesDict;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;

  v4 = a3;
  ctkdLeDevicesDict = self->_ctkdLeDevicesDict;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](ctkdLeDevicesDict, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceFromIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "classicDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_devicesDict, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isManagedByWallet") & 1) != 0 || objc_msgSend(v8, "isManagedByAliroWallet"))
  {
    -[NSMutableDictionary objectForKey:](self->managedByWalletDictionary, "objectForKey:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      -[NSMutableDictionary setValue:forKey:](self->managedByWalletDictionary, "setValue:forKey:", MEMORY[0x24BDBD1C8], v14);
  }
  if (objc_msgSend(v8, "doesSupportBackgroundNI")
    && (-[NSMutableDictionary objectForKey:](self->supportsBackgroundNIDictionary, "objectForKey:", v14),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        !v17))
  {
    -[NSMutableDictionary setValue:forKey:](self->supportsBackgroundNIDictionary, "setValue:forKey:", MEMORY[0x24BDBD1C8], v14);
    if (v15)
      goto LABEL_9;
  }
  else if (v15)
  {
LABEL_9:
    v18 = v15;
    goto LABEL_14;
  }
  sharedBluetoothSettingsLogComponent();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[BTSDevicesController _getDeviceForCTKDPeripheral:].cold.1();

LABEL_14:
  if (!v15)
LABEL_15:
    v15 = 0;

  return v15;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  CBCentralManager *centralManager;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSMutableDictionary *dualRadioCounterpartDevicesDict;
  void *v22;
  void *v23;
  uint64_t v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSMutableDictionary *ctkdCounterpartDevicesDict;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v39;
  int v40;
  objc_super v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)BTSDevicesController;
  v6 = a4;
  -[BTSDevicesController tableView:cellForRowAtIndexPath:](&v41, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BTSDevicesController indexForIndexPath:](self, "indexForIndexPath:", v6);

  if (objc_msgSend(v7, "tag") != 1)
    return v7;
  v9 = objc_opt_class();
  if (v9 != objc_opt_class())
    return v7;
  v10 = v7;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndexedSubscript:", v8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bt-device"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "paired") & 1) != 0 || (objc_msgSend(v12, "isHealthDevice") & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v12, "isManagedByDeviceAccess");
  v14 = objc_msgSend(v12, "connected");
  if (objc_msgSend(v12, "isCTKDDevice"))
  {
    centralManager = self->_centralManager;
    objc_msgSend(v12, "classicDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "address");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager retrievePeripheralWithAddress:](centralManager, "retrievePeripheralWithAddress:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "connected") & 1) != 0)
      v14 = 1;
    else
      v14 = objc_msgSend(v18, "isConnectedToSystem");
    sharedBluetoothSettingsLogComponent();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v20;
      v44 = 1024;
      v45 = v14;
      _os_log_impl(&dword_22F721000, v19, OS_LOG_TYPE_DEFAULT, "CTKD : cell \"%@\" is connected %d", buf, 0x12u);

    }
  }
  dualRadioCounterpartDevicesDict = self->_dualRadioCounterpartDevicesDict;
  objc_msgSend(v12, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](dualRadioCounterpartDevicesDict, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    v24 = 1;
  else
    v24 = v14;
  if (v23 && (v14 & 1) == 0)
  {
    v25 = self->_dualRadioCounterpartDevicesDict;
    objc_msgSend(v12, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v27, "connected");

  }
  v40 = 0;
  if (objc_msgSend(v12, "isMyDevice")
    && (objc_msgSend(v12, "isApplePencil:", &v40) & 1) == 0
    && objc_msgSend(v12, "isLimitedConnectivityDevice"))
  {
    objc_msgSend(v10, "setHasLimitedConnectivity:", 1);
  }
  sharedBluetoothSettingsLogComponent();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "title");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v43 = v29;
    v44 = 1024;
    v45 = v13;
    v46 = 1024;
    v47 = v24;
    v48 = 2112;
    v49 = v12;
    _os_log_impl(&dword_22F721000, v28, OS_LOG_TYPE_INFO, "Setting cell \"%@\" paired %d and connected %d, device:%@", buf, 0x22u);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    ctkdCounterpartDevicesDict = self->_ctkdCounterpartDevicesDict;
    objc_msgSend(v12, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](ctkdCounterpartDevicesDict, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v32, "shouldDenyIncomingClassicConnection");
  }
  else
  {
    if ((objc_msgSend(v12, "shouldDenyIncomingClassicConnection") & 1) != 0)
    {
      v33 = 1;
      goto LABEL_32;
    }
    objc_msgSend(v12, "relatedFutureRadioAddress");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 != 0;
  }

LABEL_32:
  objc_msgSend(v10, "setDeviceStatePaired:andConnected:andPendingSetup:", v13, v24, v33);
  if (self->_bluetoothIsBusy)
  {
    objc_msgSend(v12, "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier identifier](self->_currentDeviceSpecifier, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqualToString:", v35);

    if (v36)
    {
      if ((_DWORD)v13)
        v37 = 4;
      else
        v37 = 1;
      objc_msgSend(v10, "setDeviceState:", v37);
    }
  }

  return v7;
}

- (BTSDevicesController)init
{
  BTSDevicesController *v2;
  void *v3;
  double v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *ctkdCounterpartDevicesDict;
  NSMutableDictionary *v7;
  NSMutableDictionary *dualRadioCounterpartDevicesDict;
  NSMutableDictionary *v9;
  NSMutableDictionary *pendingOtherRadioDevicesDict;
  NSMutableDictionary *v11;
  NSMutableDictionary *devicesDict;
  NSMutableDictionary *v13;
  NSMutableDictionary *sharingDevicesDict;
  NSMutableDictionary *v15;
  NSMutableDictionary *ctkdLeDevicesDict;
  NSMutableDictionary *v17;
  NSMutableDictionary *deviceAccessDevicesDict;
  NSMutableDictionary *v19;
  NSMutableDictionary *pendingDAInfoDevicesDict;
  NSMutableArray *v21;
  NSMutableArray *retrievedHealthServices;
  NSMutableSet *v23;
  NSMutableSet *connectedPoorBehaviorDevices;
  NSMutableSet *v25;
  NSMutableSet *connectedFirmwareUpdateRequiredDevices;
  NSMutableSet *v27;
  NSMutableSet *connectedHIDDevices;
  int v29;
  int v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSArray *healthServices;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  CBCentralManager *centralManager;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  HKHealthStore *healthKitStore;
  HKHealthStore *v47;
  DASession *v48;
  DASession *deviceAccessSession;
  NSObject *v50;
  NSObject *v51;
  CARSessionStatus *v52;
  CARSessionStatus *carplayStatus;
  void *v54;
  const void *v55;
  ENManager *v56;
  ENManager *exposureNotificationManager;
  ENManager *v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v68[4];
  BTSDevicesController *v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  BTSDevicesController *v73;
  Boolean keyExistsAndHasValidFormat;
  objc_super v75;
  _BYTE buf[24];
  _QWORD v77[2];
  _QWORD v78[3];

  v78[2] = *MEMORY[0x24BDAC8D0];
  v75.receiver = self;
  v75.super_class = (Class)BTSDevicesController;
  v2 = -[BTSDevicesController init](&v75, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSince1970");
    srandom(v4);

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    ctkdCounterpartDevicesDict = v2->_ctkdCounterpartDevicesDict;
    v2->_ctkdCounterpartDevicesDict = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dualRadioCounterpartDevicesDict = v2->_dualRadioCounterpartDevicesDict;
    v2->_dualRadioCounterpartDevicesDict = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingOtherRadioDevicesDict = v2->_pendingOtherRadioDevicesDict;
    v2->_pendingOtherRadioDevicesDict = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    devicesDict = v2->_devicesDict;
    v2->_devicesDict = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sharingDevicesDict = v2->_sharingDevicesDict;
    v2->_sharingDevicesDict = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    ctkdLeDevicesDict = v2->_ctkdLeDevicesDict;
    v2->_ctkdLeDevicesDict = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    deviceAccessDevicesDict = v2->_deviceAccessDevicesDict;
    v2->_deviceAccessDevicesDict = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingDAInfoDevicesDict = v2->_pendingDAInfoDevicesDict;
    v2->_pendingDAInfoDevicesDict = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    retrievedHealthServices = v2->_retrievedHealthServices;
    v2->_retrievedHealthServices = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    connectedPoorBehaviorDevices = v2->_connectedPoorBehaviorDevices;
    v2->_connectedPoorBehaviorDevices = v23;

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    connectedFirmwareUpdateRequiredDevices = v2->_connectedFirmwareUpdateRequiredDevices;
    v2->_connectedFirmwareUpdateRequiredDevices = v25;

    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    connectedHIDDevices = v2->_connectedHIDDevices;
    v2->_connectedHIDDevices = v27;

    v2->_mainFooterNeedsUpdate = 0;
    v2->_shouldRestorePreviousScanningState = 0;
    keyExistsAndHasValidFormat = 0;
    LODWORD(v3) = CFPreferencesGetAppBooleanValue(CFSTR("enableHealthDevices"), CFSTR("com.apple.bluetooth"), &keyExistsAndHasValidFormat);
    v29 = _os_feature_enabled_impl();
    if ((_DWORD)v3)
      v30 = v29;
    else
      v30 = 0;
    if (keyExistsAndHasValidFormat)
      v31 = v30;
    else
      v31 = 0;
    v32 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *MEMORY[0x24BDBB200]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *MEMORY[0x24BDBB1F8]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "arrayWithObjects:", v33, v34, 0);
      v35 = objc_claimAutoreleasedReturnValue();
      healthServices = v2->_healthServices;
      v2->_healthServices = (NSArray *)v35;

    }
    else
    {
      objc_msgSend(v32, "arrayWithObjects:", v33, 0);
      v37 = objc_claimAutoreleasedReturnValue();
      v34 = v2->_healthServices;
      v2->_healthServices = (NSArray *)v37;
    }

    -[BTSDevicesController registerForNotifications](v2, "registerForNotifications");
    v38 = objc_alloc(MEMORY[0x24BDBB220]);
    v39 = *MEMORY[0x24BDBB198];
    v77[0] = *MEMORY[0x24BDBB038];
    v77[1] = v39;
    v78[0] = MEMORY[0x24BDBD1C8];
    v78[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v38, "initWithDelegate:queue:options:", v2, MEMORY[0x24BDAC9B8], v40);
    centralManager = v2->_centralManager;
    v2->_centralManager = (CBCentralManager *)v41;

    -[CBCentralManager sharedPairingAgent](v2->_centralManager, "sharedPairingAgent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setDelegate:", v2);

    if (objc_msgSend(MEMORY[0x24BDD3C40], "isHealthDataAvailable"))
    {
      sharedBluetoothSettingsLogComponent();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F721000, v44, OS_LOG_TYPE_INFO, "HealthKit is supported", buf, 2u);
      }

      v45 = objc_opt_new();
      healthKitStore = v2->_healthKitStore;
      v2->_healthKitStore = (HKHealthStore *)v45;

      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        v47 = v2->_healthKitStore;
        v72[0] = MEMORY[0x24BDAC760];
        v72[1] = 3221225472;
        v72[2] = __28__BTSDevicesController_init__block_invoke;
        v72[3] = &unk_24FCCDFB8;
        v73 = v2;
        -[HKHealthStore healthServicePairingsWithHandler:](v47, "healthServicePairingsWithHandler:", v72);

      }
    }
    if (_os_feature_enabled_impl())
    {
      v48 = (DASession *)objc_alloc_init(MEMORY[0x24BE2BEF8]);
      deviceAccessSession = v2->_deviceAccessSession;
      v2->_deviceAccessSession = v48;

      -[DASession setDispatchQueue:](v2->_deviceAccessSession, "setDispatchQueue:", MEMORY[0x24BDAC9B8]);
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, v2);
      v70[0] = MEMORY[0x24BDAC760];
      v70[1] = 3221225472;
      v70[2] = __28__BTSDevicesController_init__block_invoke_2;
      v70[3] = &unk_24FCCDFE0;
      objc_copyWeak(&v71, (id *)buf);
      -[DASession setEventHandler:](v2->_deviceAccessSession, "setEventHandler:", v70);
      -[DASession activate](v2->_deviceAccessSession, "activate");
      objc_destroyWeak(&v71);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      sharedBluetoothSettingsLogComponent();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F721000, v50, OS_LOG_TYPE_DEFAULT, "AccessorySetupKit feature flag not enabled", buf, 2u);
      }

    }
    sharedBluetoothSettingsLogComponent();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[BTSDevicesController init]";
      _os_log_impl(&dword_22F721000, v51, OS_LOG_TYPE_DEFAULT, "%s exposure notification init", buf, 0xCu);
    }

    v52 = (CARSessionStatus *)objc_alloc_init(MEMORY[0x24BE15240]);
    carplayStatus = v2->_carplayStatus;
    v2->_carplayStatus = v52;

    -[CARSessionStatus setSessionObserver:](v2->_carplayStatus, "setSessionObserver:", v2);
    v2->_scanningPausedForCarPlay = 0;
    v54 = (void *)MGGetStringAnswer();
    v55 = v54;
    if (v54 && objc_msgSend(v54, "isEqualToString:", CFSTR("iPhone")))
    {
      v56 = (ENManager *)objc_alloc_init(MEMORY[0x24BDC76A8]);
      exposureNotificationManager = v2->_exposureNotificationManager;
      v2->_exposureNotificationManager = v56;

      v58 = v2->_exposureNotificationManager;
      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = __28__BTSDevicesController_init__block_invoke_199;
      v68[3] = &unk_24FCCE008;
      v69 = v2;
      -[ENManager activateWithCompletionHandler:](v58, "activateWithCompletionHandler:", v68);
      CFRelease(v55);

    }
    if (notify_register_check("com.apple.bluetooth.settings.app-state", &v2->_bluetoothSettingsAppStateNotifyToken))
    {
      sharedBluetoothSettingsLogComponent();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        -[BTSDevicesController init].cold.1(v59, v60, v61, v62, v63, v64, v65, v66);

    }
    -[BTSDevicesController notifyBluetoothSettingsAppStateIsActive:](v2, "notifyBluetoothSettingsAppStateIsActive:", 1);
  }
  return v2;
}

void __28__BTSDevicesController_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  id v10;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __28__BTSDevicesController_init__block_invoke_cold_1();
  }
  else if (objc_msgSend(v5, "count"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __28__BTSDevicesController_init__block_invoke_186;
    v8[3] = &unk_24FCCDF90;
    v9 = *(id *)(a1 + 32);
    v10 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

    v7 = v9;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F721000, v7, OS_LOG_TYPE_DEFAULT, "Found no known health devices", buf, 2u);
    }
  }

}

uint64_t __28__BTSDevicesController_init__block_invoke_186(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retrievedRegisteredHealthDevices:", *(_QWORD *)(a1 + 40));
}

void __28__BTSDevicesController_init__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleDASessionEvent:", v3);

}

uint64_t __28__BTSDevicesController_init__block_invoke_199(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1522) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1648), "exposureNotificationEnabled");
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  DASession *deviceAccessSession;
  ENManager *exposureNotificationManager;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[BTSDevicesController allowBluetoothConnections:](self, "allowBluetoothConnections:", 0);
  -[BTAlert dismiss](self->_alert, "dismiss");
  -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[CBCentralManager setDelegate:](self->_centralManager, "setDelegate:", 0);
  -[DASession invalidate](self->_deviceAccessSession, "invalidate");
  deviceAccessSession = self->_deviceAccessSession;
  self->_deviceAccessSession = 0;

  -[CARSessionStatus setSessionObserver:](self->_carplayStatus, "setSessionObserver:", 0);
  if (self->_netClient)
    _NETRBClientDestroy();
  -[ENManager invalidate](self->_exposureNotificationManager, "invalidate");
  exposureNotificationManager = self->_exposureNotificationManager;
  self->_exposureNotificationManager = 0;

  -[BTSDevicesController notifyBluetoothSettingsAppStateIsActive:](self, "notifyBluetoothSettingsAppStateIsActive:", 0);
  notify_cancel(self->_bluetoothSettingsAppStateNotifyToken);
  v8.receiver = self;
  v8.super_class = (Class)BTSDevicesController;
  -[BTSDevicesController dealloc](&v8, sel_dealloc);
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  NSString *v9;
  NSString *pendingSetupDeviceID;
  id v11;

  v11 = a3;
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(v11, "objectForKey:", CFSTR("path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("root"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("AccessoryDetail")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("identifier"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      pendingSetupDeviceID = self->_pendingSetupDeviceID;
      self->_pendingSetupDeviceID = v9;

      -[BTSDevicesController fetchDADevices](self, "fetchDADevices");
LABEL_5:
      -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
      goto LABEL_6;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("AwaitIncomingConnection")))
      goto LABEL_5;
  }
LABEL_6:
  v6[2](v6);

}

- (void)viewDidLoad
{
  NSMutableDictionary *v3;
  NSMutableDictionary *managedByWalletDictionary;
  NSMutableDictionary *v5;
  NSMutableDictionary *supportsBackgroundNIDictionary;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BTSDevicesController;
  -[BTSDevicesController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("MainGroupFooterId"));
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  managedByWalletDictionary = self->managedByWalletDictionary;
  self->managedByWalletDictionary = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  supportsBackgroundNIDictionary = self->supportsBackgroundNIDictionary;
  self->supportsBackgroundNIDictionary = v5;

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BTSDevicesController;
  -[BTSDevicesController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (self->_shouldRestorePreviousScanningState)
  {
    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeviceScanningEnabled:", self->_allowScanning);

    self->_shouldRestorePreviousScanningState = 0;
  }
  if (_os_feature_enabled_impl())
  {
    -[BTSDevicesController fetchDADevices](self, "fetchDADevices");
    if (self->_power)
      -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  BTSDevicesController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = self;
      _os_log_impl(&dword_22F721000, v4, OS_LOG_TYPE_DEFAULT, "Unsubscribing from notifications because view controller is being popped from the stack: BTSDevicesController instance %p", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  NSString *pendingSetupDeviceID;

  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceScanningEnabled:", 0);

  self->_shouldRestorePreviousScanningState = 1;
  pendingSetupDeviceID = self->_pendingSetupDeviceID;
  self->_pendingSetupDeviceID = 0;

}

- (void)applicationWillTerminate:(id)a3
{
  -[BTSDevicesController allowBluetoothConnections:](self, "allowBluetoothConnections:", 0);
}

- (void)applicationWillResignActive:(id)a3
{
  -[BTSDevicesController notifyBluetoothSettingsAppStateIsActive:](self, "notifyBluetoothSettingsAppStateIsActive:", 0);
  -[BTSDevicesController allowBluetoothConnections:](self, "allowBluetoothConnections:", 0);
  self->_togglingPower = 0;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "setEnabled:", 1);
  -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 0);
  -[BTSDevicesController cleanupPairing](self, "cleanupPairing");
  -[BTSDevicesController cleanupAlerts](self, "cleanupAlerts");
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (void)applicationDidBecomeActive:(id)a3
{
  -[BTSDevicesController notifyBluetoothSettingsAppStateIsActive:](self, "notifyBluetoothSettingsAppStateIsActive:", 1);
  -[BTSDevicesController allowBluetoothConnections:](self, "allowBluetoothConnections:", 1);
}

- (void)applicationWillEnterForeground:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22F721000, v4, OS_LOG_TYPE_DEFAULT, "applicationWillEnterForeground. Re-register for bluetooth notifications", v5, 2u);
  }

  -[BTSDevicesController notifyBluetoothSettingsAppStateIsActive:](self, "notifyBluetoothSettingsAppStateIsActive:", 1);
  if (!self->_uiRefreshed)
    -[BTSDevicesController refreshUI](self, "refreshUI");
}

- (void)applicationDidEnterBackground:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_22F721000, v4, OS_LOG_TYPE_DEFAULT, "applicationDidEnterBackground. Deregister for bluetooth notifications", v12, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x24BEBE010], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_applicationWillTerminate_, *MEMORY[0x24BEBE018], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x24BEBDF88], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground_, *MEMORY[0x24BEBE008], 0);

  -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", 0);

  -[CBCentralManager setDelegate:](self->_centralManager, "setDelegate:", 0);
  self->_uiRefreshed = 0;
}

- (void)notifyBluetoothSettingsAppStateIsActive:(BOOL)a3
{
  notify_set_state(-[BTSDevicesController bluetoothSettingsAppStateNotifyToken](self, "bluetoothSettingsAppStateNotifyToken"), a3);
  notify_post("com.apple.bluetooth.settings.app-state");
}

- (BOOL)isMainSettingsPane
{
  return self->_invokingClientID == 0;
}

- (unsigned)connectedLEAudio1DeviceCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:](self->_centralManager, "retrieveConnectedPeripheralsWithServices:allowAll:", MEMORY[0x24BDBD1A8], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasTag:", CFSTR("IsHearingAid")))
        {
          objc_msgSend(v8, "customProperty:", CFSTR("LEAVersion"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (!v9 || objc_msgSend(v9, "isEqualToString:", CFSTR("1")))
            ++v5;

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldDisplayDevice:(id)a3
{
  return 1;
}

- (BOOL)classicDeviceIsApple:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = !objc_msgSend(v3, "vendorIdSrc")
    && (objc_msgSend(v3, "vendorId") == 1452 || objc_msgSend(v3, "vendorId") == 76)
    || objc_msgSend(v3, "vendorIdSrc") == 2 && objc_msgSend(v3, "vendorId") == 1452
    || objc_msgSend(v3, "vendorIdSrc") == 1 && objc_msgSend(v3, "vendorId") == 76;

  return v4;
}

- (BOOL)isClassicAudioDevice:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "type") == 16
    || objc_msgSend(v3, "type") == 17
    || objc_msgSend(v3, "type") == 19
    || objc_msgSend(v3, "type") == 20
    || objc_msgSend(v3, "type") == 47
    || objc_msgSend(v3, "type") == 22
    || objc_msgSend(v3, "type") == 21
    || objc_msgSend(v3, "type") == 23;

  return v4;
}

- (void)powerChanged
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  const char *v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enabled");

  if (-[CBCentralManager state](self->_centralManager, "state") == 5)
  {
    if ((v4 & 1) == 0)
      goto LABEL_8;
  }
  else if (((v4 ^ (-[CBCentralManager state](self->_centralManager, "state") == 10)) & 1) != 0)
  {
    goto LABEL_8;
  }
  if (self->_power != v4)
  {
    self->_power = v4;
    self->_togglingPower = 0;
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "setEnabled:", 1);
    -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 0);
    self->_mainFooterNeedsUpdate = 1;
    -[BTSDevicesController updateUI:](self, "updateUI:", self->_power);
    if (self->_bluetoothInitialized)
      -[BTSDevicesController allowBluetoothConnections:](self, "allowBluetoothConnections:", self->_power);
  }
LABEL_8:
  -[BTSDevicesController specifierForID:](self, "specifierForID:", CFSTR("BLUETOOTH"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSDevicesController reloadSpecifier:](self, "reloadSpecifier:", v5);

  if (self->_power && *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "retrievePairedPeers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v8)
    {
      v9 = v8;
      v30 = 0;
      v10 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          sharedBluetoothSettingsLogComponent();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v12;
            _os_log_impl(&dword_22F721000, v13, OS_LOG_TYPE_DEFAULT, "Paired Peripheral: %@", buf, 0xCu);
          }

          -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v12, "setDelegate:", self);
            if (objc_msgSend(v14, "isManagedByDeviceAccess"))
            {
              sharedBluetoothSettingsLogComponent();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v14;
                _os_log_impl(&dword_22F721000, v15, OS_LOG_TYPE_DEFAULT, "We're waiting for DADevices from DADaemon, delay display of these DA managed peripherals until we have the DADevice: %@", buf, 0xCu);
              }

            }
            else
            {
              -[BTSDevicesController _addDevice:](self, "_addDevice:", v14);
              if (objc_msgSend(v14, "connected"))
              {
                if (objc_msgSend(v14, "isLimitedConnectivityDevice"))
                {
                  -[NSMutableSet addObject:](self->_connectedPoorBehaviorDevices, "addObject:", v14);
                  self->_mainFooterNeedsUpdate = 1;
                }
                if (objc_msgSend(v14, "isFirmwareUpdateRequiredDevice"))
                {
                  -[NSMutableSet addObject:](self->_connectedFirmwareUpdateRequiredDevices, "addObject:", v14);
                  self->_mainFooterNeedsUpdate = 1;
                }
                if (objc_msgSend(v14, "isHIDDevice"))
                {
                  -[NSMutableSet addObject:](self->_connectedHIDDevices, "addObject:", v14);
                  self->_mainFooterNeedsUpdate = 1;
                }
              }
            }
          }
          else
          {
            -[BTSDevicesController _getDeviceForCTKDPeripheral:](self, "_getDeviceForCTKDPeripheral:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            sharedBluetoothSettingsLogComponent();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v12;
              _os_log_impl(&dword_22F721000, v17, OS_LOG_TYPE_DEFAULT, "CTKD Paired device : %@", buf, 0xCu);
            }

            if (v16)
            {
              objc_msgSend(v12, "setDelegate:", self);
              v30 = 1;
            }

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v9);
    }
    else
    {
      v30 = 0;
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:](self->_centralManager, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          if (objc_msgSend(v23, "connectedTransport") == 2)
          {
            -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              if (objc_msgSend(v23, "visibleInSettings"))
              {
                objc_msgSend(v23, "setDelegate:", self);
                v25 = objc_msgSend(v24, "isManagedByDeviceAccess");
                sharedBluetoothSettingsLogComponent();
                v26 = objc_claimAutoreleasedReturnValue();
                v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
                if (v25)
                {
                  if (v27)
                  {
                    *(_DWORD *)buf = 138412290;
                    v41 = v24;
                    v28 = v26;
                    v29 = "We're waiting for DADevices from DADaemon, delay display of these DA managed peripherals until"
                          " we have the DADevice: %@";
                    goto LABEL_51;
                  }
                  goto LABEL_52;
                }
                if (v27)
                {
                  *(_DWORD *)buf = 138412290;
                  v41 = v23;
                  _os_log_impl(&dword_22F721000, v26, OS_LOG_TYPE_DEFAULT, "Peripheral %@ will be added to Settings.", buf, 0xCu);
                }

                -[BTSDevicesController _addDevice:](self, "_addDevice:", v24);
              }
              else
              {
                sharedBluetoothSettingsLogComponent();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v41 = v23;
                  v28 = v26;
                  v29 = "Peripheral %@ should not be visible in Settings. Ignoring.";
LABEL_51:
                  _os_log_impl(&dword_22F721000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
                }
LABEL_52:

              }
            }

            continue;
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v20);
    }

    -[BTSDevicesController _updateHealthDevices](self, "_updateHealthDevices");
    -[BTSDevicesController _setupCentralScanning](self, "_setupCentralScanning");
    if (self->_mainFooterNeedsUpdate | v30 & 1)
      -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

- (void)powerChangedHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enabled");

  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = "off";
    if (v6)
      v10 = "on";
    v11 = 138412546;
    v12 = v8;
    v13 = 2080;
    v14 = v10;
    _os_log_impl(&dword_22F721000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ with power state %s", (uint8_t *)&v11, 0x16u);

  }
  -[BTSDevicesController powerChanged](self, "powerChanged");

}

- (void)deviceDiscoveredHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *devicesDict;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315650;
    v18 = "-[BTSDevicesController deviceDiscoveredHandler:]";
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_INFO, "%s received %@ for device %@", (uint8_t *)&v17, 0x20u);

  }
  if (self->_power && !self->_togglingPower)
  {
    +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    devicesDict = self->_devicesDict;
    objc_msgSend(v5, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](devicesDict, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v9, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDevicesController specifierForID:](self, "specifierForID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        sharedBluetoothSettingsLogComponent();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_22F721000, v15, OS_LOG_TYPE_INFO, "Device exists in our list without a specifier. Add the specifier", (uint8_t *)&v17, 2u);
        }

        -[BTSDevicesController _specifierForDevice:](self, "_specifierForDevice:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[BTSDevicesController _addDeviceSpecifier:withDevice:](self, "_addDeviceSpecifier:withDevice:", v16, v9);

      }
    }
    else
    {
      -[BTSDevicesController _addDevice:](self, "_addDevice:", v9);
    }

  }
}

- (void)devicePairedHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *pendingOtherRadioDevicesDict;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  BTAlert *v23;
  void *v24;
  BTAlert *v25;
  BTAlert *alert;
  NSObject *v27;
  BTAlert *v28;
  BTSSPPairingRequest *sspAlert;
  void *v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  uint64_t v34;
  NSMutableDictionary *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  int v42;
  unsigned int v43;
  NSObject *v44;
  const char *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t);
  void *v55;
  BTSDevicesController *v56;
  id v57;
  uint8_t buf[4];
  _BYTE v59[18];
  __int16 v60;
  void *v61;
  __int16 v62;
  BTSDevicesController *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)v59 = "-[BTSDevicesController devicePairedHandler:]";
    *(_WORD *)&v59[8] = 2112;
    *(_QWORD *)&v59[10] = v7;
    v60 = 2112;
    v61 = v8;
    v62 = 2048;
    v63 = self;
    _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@ for BTSDeviceController instance %p", buf, 0x2Au);

  }
  -[PSSpecifier userInfo](self->_currentDeviceSpecifier, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("PIN-ended"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_power && !self->_togglingPower)
  {
    objc_msgSend(v5, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier identifier](self->_currentDeviceSpecifier, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", v12))
    {

    }
    else
    {
      pendingOtherRadioDevicesDict = self->_pendingOtherRadioDevicesDict;
      objc_msgSend(v5, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](pendingOtherRadioDevicesDict, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[BTSDevicesController _addDevice:](self, "_addDevice:", v16);

        +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BTSDevicesController _updateDevicePosition:](self, "_updateDevicePosition:", v17);
        goto LABEL_54;
      }
    }
    -[BTSDevicesController cleanupPairing](self, "cleanupPairing");
    -[PSSpecifier userInfo](self->_currentDeviceSpecifier, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("reverse-pairing"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if (v20)
      -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 0);
    objc_msgSend(v4, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BE0F9A0]);

    if (v22)
    {
      if (self->_alert || (objc_msgSend(v10, "isEqualToString:", CFSTR("cancelled")) & 1) != 0)
      {
LABEL_49:
        objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance", v52, v53, v54, v55, v56);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v50, "wasDeviceDiscovered:", v5) & 1) != 0)
        {

        }
        else
        {
          v51 = objc_msgSend(v5, "paired");

          if ((v51 & 1) == 0)
          {
            +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[BTSDevicesController _removeDevice:](self, "_removeDevice:", v17);
            goto LABEL_54;
          }
        }
        objc_msgSend(v5, "address");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[BTSDevicesController reloadSpecifierID:](self, "reloadSpecifierID:", v17);
LABEL_54:

        goto LABEL_55;
      }
      v23 = [BTAlert alloc];
      +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[BTAlert initWithDevice:](v23, "initWithDevice:", v24);
      alert = self->_alert;
      self->_alert = v25;

      sharedBluetoothSettingsLogComponent();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = self->_alert;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v59 = v28;
        _os_log_impl(&dword_22F721000, v27, OS_LOG_TYPE_DEFAULT, "Pairing failed BTAlert : %@", buf, 0xCu);
      }

      -[BTAlert setDelegate:](self->_alert, "setDelegate:", self);
      if (v10)
        goto LABEL_39;
      sspAlert = self->_sspAlert;
      if (sspAlert
        && -[BTSSPPairingRequest pairingStyle](sspAlert, "pairingStyle") != 2
        && -[BTSSPPairingRequest pairingStyle](self->_sspAlert, "pairingStyle") != 3)
      {
        goto LABEL_21;
      }
      -[BTSDevicesController rootController](self, "rootController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "visibleViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_39:
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("entered")))
        {
          objc_msgSend(v4, "userInfo");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKey:", *MEMORY[0x24BE0F980]);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_43;
        }
        v33 = (void *)MEMORY[0x24BDD16E0];
        v34 = 156;
      }
      else
      {
LABEL_21:
        v33 = (void *)MEMORY[0x24BDD16E0];
        v34 = 1;
      }
      objc_msgSend(v33, "numberWithUnsignedInt:", v34);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:
      -[BTSDevicesController transitionCoordinator](self, "transitionCoordinator");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        sharedBluetoothSettingsLogComponent();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22F721000, v49, OS_LOG_TYPE_DEFAULT, "UIViewController is currently displaying or dismissing an UIAlertCOntroller", buf, 2u);
        }

        v52 = MEMORY[0x24BDAC760];
        v53 = 3221225472;
        v54 = __44__BTSDevicesController_devicePairedHandler___block_invoke;
        v55 = &unk_24FCCE030;
        v56 = self;
        v57 = v46;
        objc_msgSend(v48, "animateAlongsideTransition:completion:", 0, &v52);

      }
      else
      {
        -[BTAlert showAlertWithResult:](self->_alert, "showAlertWithResult:", v46);
      }

      goto LABEL_49;
    }
    v35 = self->_pendingOtherRadioDevicesDict;
    objc_msgSend(v5, "address");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v35, "objectForKeyedSubscript:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
      goto LABEL_24;
    +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDevicesController _updateDevicePosition:](self, "_updateDevicePosition:", v38);

    objc_msgSend(v4, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x24BE0F9A8]);

    if (v40)
LABEL_24:
      -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
    v41 = objc_msgSend(v5, "type");
    v42 = objc_msgSend(v5, "isServiceSupported:", 2);
    v43 = objc_msgSend(v5, "syncSettings");
    if (-[BTSDevicesController isiPhone](self, "isiPhone")
      && (objc_msgSend(v5, "isServiceSupported:", 0x40000) & 1) == 0
      && (objc_msgSend(v5, "type") == 22 || objc_msgSend(v5, "type") == 17))
    {
      objc_msgSend(v5, "setSyncSettings:", v43 & 0xFFFF00FF);
      -[BTSDevicesController showSyncContactsPrivacyPopup:](self, "showSyncContactsPrivacyPopup:", v5);
    }
    else
    {
      sharedBluetoothSettingsLogComponent();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = "not";
        if (v42)
          v45 = "";
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v59 = v41;
        *(_WORD *)&v59[4] = 2080;
        *(_QWORD *)&v59[6] = v45;
        _os_log_impl(&dword_22F721000, v44, OS_LOG_TYPE_DEFAULT, "Contact privacy alert ignored for device type : %x with phonebook service %s supported", buf, 0x12u);
      }

      objc_msgSend(v5, "setSyncSettings:", v43 | 0x100000000);
    }
    if (objc_msgSend(v5, "vendorId") == 76
      && objc_msgSend(v5, "productId") >= 0x2007
      && objc_msgSend(v5, "productId") <= 0x2008)
    {
      -[BTSDevicesController showUpgradeOSPopup:](self, "showUpgradeOSPopup:", v5);
    }
  }
LABEL_55:

}

uint64_t __44__BTSDevicesController_devicePairedHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1552), "showAlertWithResult:", *(_QWORD *)(a1 + 40));
}

- (void)deviceUpdatedHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *devicesDict;
  void *v11;
  void *v12;
  void *v13;
  PSSpecifier *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315650;
    v18 = "-[BTSDevicesController deviceUpdatedHandler:]";
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_INFO, "%s received %@ for device %@", (uint8_t *)&v17, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("BluetoothDeviceUpdatedNotificationConfig"), v5);

  if (self->_power && !self->_togglingPower)
  {
    devicesDict = self->_devicesDict;
    objc_msgSend(v5, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](devicesDict, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v5, "address");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDevicesController specifierForID:](self, "specifierForID:", v13);
      v14 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setName:](v14, "setName:", v15);
      -[PSSpecifier setProperty:forKey:](v14, "setProperty:forKey:", v15, *MEMORY[0x24BE75D50]);
      if (self->_bluetoothIsBusy && v14 == self->_currentDeviceSpecifier && objc_msgSend(v5, "paired"))
        -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 0);
      +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDevicesController _updateDevicePosition:](self, "_updateDevicePosition:", v16);

    }
  }

}

- (void)deviceConnectedHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BTAlert *v16;
  void *v17;
  BTAlert *v18;
  BTAlert *alert;
  NSObject *v20;
  BTAlert *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BTAlert *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  BTSDevicesController *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 136315906;
    v30 = "-[BTSDevicesController deviceConnectedHandler:]";
    v31 = 2112;
    v32 = v7;
    v33 = 2112;
    v34 = v8;
    v35 = 2048;
    v36 = self;
    _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@ for BTSDeviceController instance %p", (uint8_t *)&v29, 0x2Au);

  }
  if (self->_power && !self->_togglingPower)
  {
    objc_msgSend(v5, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier identifier](self->_currentDeviceSpecifier, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v11)
      goto LABEL_15;
    -[BTSDevicesController cleanupPairing](self, "cleanupPairing");
    -[PSSpecifier userInfo](self->_currentDeviceSpecifier, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("PIN-ended"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE0F940])
      && !self->_alert
      && (objc_msgSend(v13, "isEqualToString:", CFSTR("cancelled")) & 1) == 0)
    {
      v15 = objc_msgSend(v5, "connected");

      if ((v15 & 1) != 0)
      {
LABEL_14:
        -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 0);
        -[BTSDevicesController allowBluetoothScans:](self, "allowBluetoothScans:", 1);

LABEL_15:
        if (objc_msgSend(v5, "isTemporaryPaired"))
        {
          -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
        }
        else
        {
          objc_msgSend(v5, "address");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[BTSDevicesController reloadSpecifierID:](self, "reloadSpecifierID:", v27);

          +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "connected"))
          {
            if (objc_msgSend(v28, "isLimitedConnectivityDevice"))
            {
              -[NSMutableSet addObject:](self->_connectedPoorBehaviorDevices, "addObject:", v28);
              self->_mainFooterNeedsUpdate = 1;
              -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
            }
            if (objc_msgSend(v28, "isHIDDevice"))
            {
              -[NSMutableSet addObject:](self->_connectedHIDDevices, "addObject:", v28);
              self->_mainFooterNeedsUpdate = 1;
              -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
            }
          }

        }
        goto LABEL_23;
      }
      v16 = [BTAlert alloc];
      +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[BTAlert initWithDevice:](v16, "initWithDevice:", v17);
      alert = self->_alert;
      self->_alert = v18;

      sharedBluetoothSettingsLogComponent();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_alert;
        v29 = 138412290;
        v30 = (const char *)v21;
        _os_log_impl(&dword_22F721000, v20, OS_LOG_TYPE_DEFAULT, "deviceConnected BTAlert : %@", (uint8_t *)&v29, 0xCu);
      }

      -[BTAlert setDelegate:](self->_alert, "setDelegate:", self);
      objc_msgSend(v4, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *MEMORY[0x24BE0F980];
      objc_msgSend(v22, "objectForKey:", *MEMORY[0x24BE0F980]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "unsignedIntValue");

      v25 = self->_alert;
      objc_msgSend(v4, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTAlert showAlertWithResult:](v25, "showAlertWithResult:", v26);

    }
    goto LABEL_14;
  }
LABEL_23:

}

- (void)deviceDisconnectedHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[BTSDevicesController deviceDisconnectedHandler:]";
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@", (uint8_t *)&v11, 0x20u);

  }
  if (self->_power && !self->_togglingPower)
  {
    if (objc_msgSend(v5, "isTemporaryPaired"))
    {
      -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
    }
    else
    {
      objc_msgSend(v5, "address");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDevicesController reloadSpecifierID:](self, "reloadSpecifierID:", v9);

      +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableSet containsObject:](self->_connectedPoorBehaviorDevices, "containsObject:", v10))
      {
        -[NSMutableSet removeObject:](self->_connectedPoorBehaviorDevices, "removeObject:", v10);
        self->_mainFooterNeedsUpdate = 1;
        -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
      }
      if (-[NSMutableSet containsObject:](self->_connectedHIDDevices, "containsObject:", v10))
      {
        -[NSMutableSet removeObject:](self->_connectedHIDDevices, "removeObject:", v10);
        self->_mainFooterNeedsUpdate = 1;
        -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
      }

    }
  }

}

- (void)deviceRemovedHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[BTSDevicesController deviceRemovedHandler:]";
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@", (uint8_t *)&v13, 0x20u);

  }
  if (self->_power && !self->_togglingPower && (objc_msgSend(v5, "paired") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "connectingDevices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v5);

    if ((v11 & 1) == 0)
    {
      +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDevicesController _removeDevice:](self, "_removeDevice:", v12);

    }
  }

}

- (void)deviceUnpairedHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[BTSDevicesController deviceUnpairedHandler:]";
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "wasDeviceDiscovered:", v5);

  sharedBluetoothSettingsLogComponent();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if ((v10 & 1) != 0)
  {
    if (v12)
    {
      v14 = 138412290;
      v15 = (const char *)v5;
      _os_log_impl(&dword_22F721000, v11, OS_LOG_TYPE_INFO, "Device %@ was unpaired and was discovered - updating position", (uint8_t *)&v14, 0xCu);
    }

    +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDevicesController _updateDevicePosition:](self, "_updateDevicePosition:", v13);
  }
  else
  {
    if (v12)
    {
      v14 = 138412290;
      v15 = (const char *)v5;
      _os_log_impl(&dword_22F721000, v11, OS_LOG_TYPE_INFO, "Device %@ was unpaired and wasn't discovered - removing", (uint8_t *)&v14, 0xCu);
    }

    +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDevicesController _removeDevice:](self, "_removeDevice:", v13);
  }

}

- (void)authenticationRequestHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  UIAlertController *syncContactsCarplayAlert;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  PSSpecifier **p_currentDeviceSpecifier;
  PSSpecifier *currentDeviceSpecifier;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  PSSpecifier *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  void *v38;
  BTSSPPairingRequest *v39;
  BTSSPPairingRequest *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  void *v45;
  uint64_t v46;
  int v47;
  NSObject *v48;
  BTSSPPairingRequest *v49;
  BTSSPPairingRequest *sspAlert;
  void *v51;
  int v52;
  void *v53;
  int v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  int v65;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  BTSDevicesController *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_power && !self->_togglingPower)
  {
    -[BTSDevicesController rootController](self, "rootController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visibleViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || self->_sspAlert || self->_alert)
    {

      goto LABEL_7;
    }
    syncContactsCarplayAlert = self->_syncContactsCarplayAlert;

    if (syncContactsCarplayAlert)
    {
LABEL_7:
      sharedBluetoothSettingsLogComponent();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[BTSDevicesController authenticationRequestHandler:].cold.1();
      goto LABEL_9;
    }
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BE0F9C0];
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE0F9C0]))
    {

    }
    else
    {
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE0F9B0]);

      if (!v12)
      {
        objc_msgSend(v4, "object");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        sharedBluetoothSettingsLogComponent();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject name](v7, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v67 = "-[BTSDevicesController authenticationRequestHandler:]";
          v68 = 2112;
          v69 = v15;
          v70 = 2112;
          v71 = v16;
          v72 = 2048;
          v73 = self;
          _os_log_impl(&dword_22F721000, v14, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@ for BTSDeviceController instance %p", buf, 0x2Au);

        }
        -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 1);
        p_currentDeviceSpecifier = &self->_currentDeviceSpecifier;
        currentDeviceSpecifier = self->_currentDeviceSpecifier;
        if (currentDeviceSpecifier)
        {
          -[PSSpecifier userInfo](currentDeviceSpecifier, "userInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObjectForKey:", CFSTR("reverse-pairing"));
        }
        else
        {
          if (-[NSObject majorClass](v7, "majorClass") == 256)
          {
            objc_msgSend(v4, "userInfo");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "valueForKey:", CFSTR("delayedPairingForNR"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v21)
            {
              sharedBluetoothSettingsLogComponent();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22F721000, v55, OS_LOG_TYPE_INFO, "Delaying incoming pairing attempt from computer to try to retrieve the name…", buf, 2u);
              }

              v56 = (void *)MEMORY[0x24BDBCED8];
              objc_msgSend(v4, "userInfo");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "dictionaryWithDictionary:", v57);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v37, "setValue:forKey:", &stru_24FCCE738, CFSTR("delayedPairingForNR"));
              v58 = (void *)MEMORY[0x24BDD16C8];
              objc_msgSend(v4, "name");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "object");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "notificationWithName:object:userInfo:", v59, v60, v37);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              -[BTSDevicesController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_authenticationRequestHandler_, v61, 1.0);

LABEL_55:
LABEL_9:

              goto LABEL_10;
            }
          }
          -[NSObject address](v7, "address");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[BTSDevicesController specifierForID:](self, "specifierForID:", v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          sharedBluetoothSettingsLogComponent();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (v19)
          {
            if (v24)
            {
              *(_DWORD *)buf = 136315394;
              v67 = "-[BTSDevicesController authenticationRequestHandler:]";
              v68 = 2112;
              v69 = v19;
              _os_log_impl(&dword_22F721000, v23, OS_LOG_TYPE_DEFAULT, "%s reverse-pairing attempt from %@", buf, 0x16u);
            }

            objc_storeStrong((id *)&self->_currentDeviceSpecifier, v19);
            -[BTSDevicesController reloadSpecifier:](self, "reloadSpecifier:", *p_currentDeviceSpecifier);
          }
          else
          {
            if (v24)
            {
              *(_DWORD *)buf = 136315138;
              v67 = "-[BTSDevicesController authenticationRequestHandler:]";
              _os_log_impl(&dword_22F721000, v23, OS_LOG_TYPE_DEFAULT, "%s reverse-pairing attempt from previously unknown device", buf, 0xCu);
            }

            +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v7);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[BTSDevicesController _specifierForDevice:](self, "_specifierForDevice:", v25);
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = *p_currentDeviceSpecifier;
            *p_currentDeviceSpecifier = (PSSpecifier *)v26;

            +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", v7);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[BTSDevicesController _addDevice:](self, "_addDevice:", v28);

          }
          -[PSSpecifier userInfo](*p_currentDeviceSpecifier, "userInfo");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKey:", *MEMORY[0x24BDBD270], CFSTR("reverse-pairing"));

        }
        -[PSSpecifier userInfo](*p_currentDeviceSpecifier, "userInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeObjectForKey:", CFSTR("PIN-ended"));

        if (!*p_currentDeviceSpecifier
          || (-[NSObject address](v7, "address"),
              v31 = (void *)objc_claimAutoreleasedReturnValue(),
              -[PSSpecifier identifier](*p_currentDeviceSpecifier, "identifier"),
              v32 = (void *)objc_claimAutoreleasedReturnValue(),
              v33 = objc_msgSend(v31, "isEqualToString:", v32),
              v32,
              v31,
              !v33))
        {
          sharedBluetoothSettingsLogComponent();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            -[BTSDevicesController authenticationRequestHandler:].cold.2(v41, v42, v43);

          goto LABEL_9;
        }
        if (-[NSObject type](v7, "type") != 24
          || (objc_msgSend(v4, "name"),
              v34 = (void *)objc_claimAutoreleasedReturnValue(),
              v35 = objc_msgSend(v34, "isEqualToString:", *MEMORY[0x24BE0F998]),
              v34,
              !v35))
        {
          v44 = -[NSObject type](v7, "type");
          if (-[BTSDevicesController isiPad](self, "isiPad") && (v44 & 0xFFFFFFFB) == 0x19)
          {
            objc_msgSend(v4, "name");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = *MEMORY[0x24BE0F998];
            v47 = objc_msgSend(v45, "isEqualToString:", *MEMORY[0x24BE0F998]);

            if (v47)
            {
              sharedBluetoothSettingsLogComponent();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22F721000, v48, OS_LOG_TYPE_DEFAULT, "Entering pairing flow for 2.0 mouses/trackpads", buf, 2u);
              }

              v49 = -[BTSSPPairingRequest initWithDevice:andSpecifier:]([BTSSPPairingRequest alloc], "initWithDevice:andSpecifier:", v7, *p_currentDeviceSpecifier);
              sspAlert = self->_sspAlert;
              self->_sspAlert = v49;

              -[BTSSPPairingRequest setPairingStyle:andPasskey:](self->_sspAlert, "setPairingStyle:andPasskey:", 4, 0);
              -[BTSSPPairingRequest setDelegate:](self->_sspAlert, "setDelegate:", self);
              -[BTSSPPairingRequest show](self->_sspAlert, "show");
              goto LABEL_9;
            }
          }
          else
          {
            v46 = *MEMORY[0x24BE0F998];
          }
          objc_msgSend(v4, "name");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "isEqualToString:", v46);

          if (v52)
          {
            -[BTSDevicesController pinRequestHandler:](self, "pinRequestHandler:", v4);
          }
          else
          {
            objc_msgSend(v4, "name");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "isEqualToString:", *MEMORY[0x24BE0F9B8]);

            if (v54)
            {
              -[BTSDevicesController sspConfirmationHandler:](self, "sspConfirmationHandler:", v4);
            }
            else
            {
              objc_msgSend(v4, "name");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend(v62, "isEqualToString:", v10);

              if (v63)
              {
                -[BTSDevicesController sspNumericComparisonHandler:](self, "sspNumericComparisonHandler:", v4);
              }
              else
              {
                objc_msgSend(v4, "name");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = objc_msgSend(v64, "isEqualToString:", *MEMORY[0x24BE0F9B0]);

                if (v65)
                  -[BTSDevicesController sspPasskeyDisplayHandler:](self, "sspPasskeyDisplayHandler:", v4);
              }
            }
          }
          goto LABEL_9;
        }
        sharedBluetoothSettingsLogComponent();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22F721000, v36, OS_LOG_TYPE_DEFAULT, "Entering pairing flow for 2.0 HID device", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", ((int)random() % 10000));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%04u"), objc_msgSend(v37, "unsignedIntValue"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setPIN:](v7, "setPIN:", v38);

        v39 = -[BTSSPPairingRequest initWithDevice:andSpecifier:]([BTSSPPairingRequest alloc], "initWithDevice:andSpecifier:", v7, *p_currentDeviceSpecifier);
        v40 = self->_sspAlert;
        self->_sspAlert = v39;

        -[BTSSPPairingRequest setPairingStyle:andPasskey:](self->_sspAlert, "setPairingStyle:andPasskey:", 3, v37);
        -[BTSSPPairingRequest setDelegate:](self->_sspAlert, "setDelegate:", self);
        -[BTSSPPairingRequest show](self->_sspAlert, "show");
        goto LABEL_55;
      }
    }
    objc_msgSend(v4, "object");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("device"));
    v7 = objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
LABEL_10:

}

- (void)pinRequestHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BTSPairSetup *v9;
  id WeakRetained;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[BTSDevicesController pinRequestHandler:]";
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@", (uint8_t *)&v11, 0x20u);

  }
  v9 = objc_alloc_init(BTSPairSetup);
  *((_BYTE *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756D8]) = 1;
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE757A0]));
  -[PSRootController setRootController:](v9, "setRootController:", WeakRetained);

  -[PSSetupController setParentController:](v9, "setParentController:", self);
  -[PSRootController setSpecifier:](v9, "setSpecifier:", self->_currentDeviceSpecifier);
  objc_storeWeak((id *)((char *)self->_currentDeviceSpecifier + (int)*MEMORY[0x24BE75768]), self);
  -[BTSDevicesController showController:](self, "showController:", v9);

}

- (void)sspConfirmationHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BTSSPPairingRequest *v9;
  BTSSPPairingRequest *sspAlert;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[BTSDevicesController sspConfirmationHandler:]";
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@", (uint8_t *)&v11, 0x20u);

  }
  v9 = -[BTSSPPairingRequest initWithDevice:andSpecifier:]([BTSSPPairingRequest alloc], "initWithDevice:andSpecifier:", v5, self->_currentDeviceSpecifier);
  sspAlert = self->_sspAlert;
  self->_sspAlert = v9;

  -[BTSSPPairingRequest setPairingStyle:andPasskey:](self->_sspAlert, "setPairingStyle:andPasskey:", 0, 0);
  -[BTSSPPairingRequest setDelegate:](self->_sspAlert, "setDelegate:", self);
  -[BTSSPPairingRequest show](self->_sspAlert, "show");

}

- (void)sspNumericComparisonHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BTSSPPairingRequest *v11;
  BTSSPPairingRequest *sspAlert;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  BTSDevicesController *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[BTSDevicesController sspNumericComparisonHandler:]";
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2048;
    v20 = self;
    _os_log_impl(&dword_22F721000, v8, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@ for BTSDeviceController instance %p", (uint8_t *)&v13, 0x2Au);

  }
  if (objc_msgSend(v6, "isServiceSupported:", 0x40000)
    && -[BTSDevicesController isiPhone](self, "isiPhone")
    && -[BTSDevicesController isCarPlaySetupEnabled](self, "isCarPlaySetupEnabled"))
  {
    -[BTSDevicesController startIncomingCarPlaySetup:andPasskey:](self, "startIncomingCarPlaySetup:andPasskey:", v6, v7);
  }
  else
  {
    v11 = -[BTSSPPairingRequest initWithDevice:andSpecifier:]([BTSSPPairingRequest alloc], "initWithDevice:andSpecifier:", v6, self->_currentDeviceSpecifier);
    sspAlert = self->_sspAlert;
    self->_sspAlert = v11;

    -[BTSSPPairingRequest setPairingStyle:andPasskey:](self->_sspAlert, "setPairingStyle:andPasskey:", 1, v7);
    -[BTSSPPairingRequest setDelegate:](self->_sspAlert, "setDelegate:", self);
    -[BTSSPPairingRequest show](self->_sspAlert, "show");
  }

}

- (void)sspPasskeyDisplayHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BTSSPPairingRequest *v11;
  BTSSPPairingRequest *sspAlert;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[BTSDevicesController sspPasskeyDisplayHandler:]";
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_22F721000, v8, OS_LOG_TYPE_DEFAULT, "%s received %@ for device %@", (uint8_t *)&v13, 0x20u);

  }
  v11 = -[BTSSPPairingRequest initWithDevice:andSpecifier:]([BTSSPPairingRequest alloc], "initWithDevice:andSpecifier:", v6, self->_currentDeviceSpecifier);
  sspAlert = self->_sspAlert;
  self->_sspAlert = v11;

  -[BTSSPPairingRequest setPairingStyle:andPasskey:](self->_sspAlert, "setPairingStyle:andPasskey:", 2, v7);
  -[BTSSPPairingRequest setDelegate:](self->_sspAlert, "setDelegate:", self);
  -[BTSSPPairingRequest show](self->_sspAlert, "show");

}

- (void)bluetoothDenylistChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__BTSDevicesController_bluetoothDenylistChanged___block_invoke;
  block[3] = &unk_24FCCE058;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __49__BTSDevicesController_bluetoothDenylistChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  void *v7;
  NSMutableDictionary *devicesDict;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v19, "setDelegate:", self);
    devicesDict = self->_devicesDict;
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](devicesDict, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDevicesController specifierForID:](self, "specifierForID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if ((v15 & 1) == 0)
      {
        objc_msgSend(v7, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setName:", v16);

        objc_msgSend(v7, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setProperty:forKey:", v17, *MEMORY[0x24BE75D50]);

      }
      -[BTSDevicesController _updateDevicePosition:](self, "_updateDevicePosition:", v7);
      objc_msgSend(v7, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDevicesController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", v18, 0);

    }
    else
    {
      -[BTSDevicesController _addDevice:](self, "_addDevice:", v7);
    }
  }

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11 = v6;
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier identifier](self->_currentDeviceSpecifier, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
      -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 0);
    objc_msgSend(v11, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDevicesController reloadSpecifierID:](self, "reloadSpecifierID:", v10);

    v6 = v11;
  }

}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSArray *healthServices;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "connected"))
    {
      sharedBluetoothSettingsLogComponent();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v5;
        _os_log_impl(&dword_22F721000, v8, OS_LOG_TYPE_INFO, "Discovering services for device %@", (uint8_t *)&v20, 0xCu);
      }

      objc_msgSend(v5, "setDelegate:", self);
      healthServices = self->_healthServices;
      objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *MEMORY[0x24BDBB208]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray arrayByAddingObject:](healthServices, "arrayByAddingObject:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "discoverServices:", v11);
      if (objc_msgSend(v7, "connected"))
      {
        if (objc_msgSend(v7, "isLimitedConnectivityDevice"))
        {
          -[NSMutableSet addObject:](self->_connectedPoorBehaviorDevices, "addObject:", v7);
          self->_mainFooterNeedsUpdate = 1;
          -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
        }
        if (objc_msgSend(v7, "isFirmwareUpdateRequiredDevice"))
        {
          -[NSMutableSet addObject:](self->_connectedFirmwareUpdateRequiredDevices, "addObject:", v7);
          self->_mainFooterNeedsUpdate = 1;
          -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
        }
        if (objc_msgSend(v7, "isHIDDevice"))
        {
          -[NSMutableSet addObject:](self->_connectedHIDDevices, "addObject:", v7);
          self->_mainFooterNeedsUpdate = 1;
          -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
        }
      }

    }
    else
    {
      objc_msgSend(v7, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier identifier](self->_currentDeviceSpecifier, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (v18)
        -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 0);
    }
    -[BTSDevicesController _updateDevicePosition:](self, "_updateDevicePosition:", v7);
    objc_msgSend(v7, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDevicesController reloadSpecifierID:](self, "reloadSpecifierID:", v19);

    if ((objc_msgSend(v7, "connected") & 1) == 0)
    {
      if (-[NSMutableSet containsObject:](self->_connectedPoorBehaviorDevices, "containsObject:", v7))
      {
        -[NSMutableSet removeObject:](self->_connectedPoorBehaviorDevices, "removeObject:", v7);
        self->_mainFooterNeedsUpdate = 1;
        -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
      }
      if (-[NSMutableSet containsObject:](self->_connectedFirmwareUpdateRequiredDevices, "containsObject:", v7))
      {
        -[NSMutableSet removeObject:](self->_connectedFirmwareUpdateRequiredDevices, "removeObject:", v7);
        self->_mainFooterNeedsUpdate = 1;
        -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
      }
      if (-[NSMutableSet containsObject:](self->_connectedHIDDevices, "containsObject:", v7))
      {
        -[NSMutableSet removeObject:](self->_connectedHIDDevices, "removeObject:", v7);
        self->_mainFooterNeedsUpdate = 1;
        -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
      }
    }
  }
  else
  {
    -[BTSDevicesController _getDeviceForCTKDPeripheral:](self, "_getDeviceForCTKDPeripheral:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      sharedBluetoothSettingsLogComponent();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v5;
        _os_log_impl(&dword_22F721000, v13, OS_LOG_TYPE_DEFAULT, "CTKD device %@ connection state updated", (uint8_t *)&v20, 0xCu);
      }

      -[BTSDevicesController _updateDevicePosition:](self, "_updateDevicePosition:", v12);
      objc_msgSend(v12, "classicDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "address");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDevicesController reloadSpecifierID:](self, "reloadSpecifierID:", v15);

    }
  }

}

- (void)_peripheralDidCompletePairing:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier identifier](self->_currentDeviceSpecifier, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 0);
  -[BTSDevicesController _updateDevicePosition:](self, "_updateDevicePosition:", v8);
  objc_msgSend(v8, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSDevicesController reloadSpecifierID:](self, "reloadSpecifierID:", v7);

  if (objc_msgSend(v8, "connected"))
  {
    if (objc_msgSend(v8, "isLimitedConnectivityDevice"))
    {
      -[NSMutableSet addObject:](self->_connectedPoorBehaviorDevices, "addObject:", v8);
      self->_mainFooterNeedsUpdate = 1;
      -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
    }
    if (objc_msgSend(v8, "isFirmwareUpdateRequiredDevice"))
    {
      -[NSMutableSet addObject:](self->_connectedFirmwareUpdateRequiredDevices, "addObject:", v8);
      self->_mainFooterNeedsUpdate = 1;
      -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
    }
    if (objc_msgSend(v8, "isHIDDevice"))
    {
      -[NSMutableSet addObject:](self->_connectedHIDDevices, "addObject:", v8);
      self->_mainFooterNeedsUpdate = 1;
      -[BTSDevicesController updateMainGroupFooter](self, "updateMainGroupFooter");
    }
  }

}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  void *v5;
  int AppBooleanValue;
  void *v7;
  Boolean keyExistsAndHasValidFormat;

  -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[BTSDevicesController _peripheralDidCompletePairing:](self, "_peripheralDidCompletePairing:", v5);
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("enableHealthDevices"), CFSTR("com.apple.bluetooth"), &keyExistsAndHasValidFormat);
    if (_os_feature_enabled_impl())
    {
      if (AppBooleanValue)
      {
        if (keyExistsAndHasValidFormat)
        {
          objc_msgSend(v5, "healthDeviceType");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
            objc_msgSend(v5, "setUserSelectedHealthDataSyncConfig:", 0);
        }
      }
    }
  }

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BTAlert *v11;
  BTAlert *alert;
  NSObject *v13;
  BTAlert *v14;
  int v15;
  BTAlert *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "state"))
    -[CBCentralManager cancelPeripheralConnection:](self->_centralManager, "cancelPeripheralConnection:", v6);
  if (v7)
  {
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier identifier](self->_currentDeviceSpecifier, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      v11 = -[BTAlert initWithDevice:]([BTAlert alloc], "initWithDevice:", v7);
      alert = self->_alert;
      self->_alert = v11;

      sharedBluetoothSettingsLogComponent();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = self->_alert;
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_22F721000, v13, OS_LOG_TYPE_DEFAULT, "Pairing failed BTAlert : %@", (uint8_t *)&v15, 0xCu);
      }

      -[BTAlert setDelegate:](self->_alert, "setDelegate:", self);
      -[BTAlert showAlertWithResult:](self->_alert, "showAlertWithResult:", &unk_24FCD3680);
    }
    if (objc_msgSend(v7, "isHealthDevice"))
      objc_msgSend(v7, "setHealthDevice:", 0);
    -[BTSDevicesController _peripheralDidCompletePairing:](self, "_peripheralDidCompletePairing:", v7);
  }

}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  void *v5;
  void *v6;
  HKHealthStore *healthKitStore;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isHealthDevice"))
    {
      objc_msgSend(v6, "setHealthDevice:", 0);
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        healthKitStore = self->_healthKitStore;
        v8 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v6, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __51__BTSDevicesController_pairingAgent_peerDidUnpair___block_invoke;
        v12[3] = &unk_24FCCE080;
        v13 = v6;
        -[HKHealthStore unregisterPeripheralIdentifier:withCompletion:](healthKitStore, "unregisterPeripheralIdentifier:withCompletion:", v10, v12);

      }
    }
    -[BTSDevicesController _updateDevicePosition:](self, "_updateDevicePosition:", v6);
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDevicesController reloadSpecifierID:](self, "reloadSpecifierID:", v11);

  }
}

void __51__BTSDevicesController_pairingAgent_peerDidUnpair___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __51__BTSDevicesController_pairingAgent_peerDidUnpair___block_invoke_cold_1();

  }
}

- (void)peripheralDidUpdateName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = v4;
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDevicesController specifierForID:](self, "specifierForID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v7);

    objc_msgSend(v9, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v8, *MEMORY[0x24BE75D50]);

    -[BTSDevicesController _updateDevicePosition:](self, "_updateDevicePosition:", v9);
    v4 = v9;
  }

}

- (void)peripheralConnectionTimeout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BTAlert *v8;
  BTAlert *alert;
  NSObject *v10;
  BTAlert *v11;
  void *v12;
  int v13;
  BTAlert *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier identifier](self->_currentDeviceSpecifier, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    if ((objc_msgSend(v4, "connected") & 1) == 0)
    {
      v8 = -[BTAlert initWithDevice:]([BTAlert alloc], "initWithDevice:", v4);
      alert = self->_alert;
      self->_alert = v8;

      sharedBluetoothSettingsLogComponent();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_alert;
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_22F721000, v10, OS_LOG_TYPE_DEFAULT, "Connection timeout BTAlert : %@", (uint8_t *)&v13, 0xCu);
      }

      -[BTAlert setDelegate:](self->_alert, "setDelegate:", self);
      -[BTAlert showAlertWithResult:](self->_alert, "showAlertWithResult:", &unk_24FCD3698);
      objc_msgSend(v4, "disconnect");
    }
    -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 0);
    objc_msgSend(v4, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDevicesController reloadSpecifierID:](self, "reloadSpecifierID:", v12);

  }
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  HKHealthStore *healthKitStore;
  void *v34;
  void *v35;
  void *v36;
  BTSDevicesController *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BTSDevicesController peripheral:didDiscoverServices:].cold.3();
  }
  else
  {
    -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (v9)
    {
      v38 = v9;
      sharedBluetoothSettingsLogComponent();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "services");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v50 = v6;
        v51 = 2112;
        v52 = v11;
        _os_log_impl(&dword_22F721000, v10, OS_LOG_TYPE_INFO, "Device %@ supports services %@", buf, 0x16u);

      }
      v37 = self;
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", self->_healthServices);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      objc_msgSend(v6, "services");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v45;
        v17 = *MEMORY[0x24BDBB208];
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v45 != v16)
              objc_enumerationMutation(v12);
            v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v19, "UUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v40, "containsObject:", v20);

            if (v21)
            {
              objc_msgSend(v19, "UUID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "UUIDString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "addObject:", v23);

            }
            objc_msgSend(v19, "UUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", v17);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "isEqual:", v25);

            v15 |= v26;
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v14);
      }
      else
      {
        v15 = 0;
      }

      objc_msgSend(MEMORY[0x24BDBB2A8], "UUIDWithString:", *MEMORY[0x24BDBB200]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v39, "containsObject:", v28);

      v8 = v38;
      if ((v15 & 1) != 0
        && (-[NSMutableSet containsObject:](v37->_connectedHIDDevices, "containsObject:", v38) & 1) == 0)
      {
        -[NSMutableSet addObject:](v37->_connectedHIDDevices, "addObject:", v38);
        v37->_mainFooterNeedsUpdate = 1;
        -[BTSDevicesController updateMainGroupFooter](v37, "updateMainGroupFooter");
      }
      v7 = 0;
      if (objc_msgSend(v39, "count"))
      {
        sharedBluetoothSettingsLogComponent();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[BTSDevicesController peripheral:didDiscoverServices:].cold.2();

        -[NSObject setHealthDevice:](v38, "setHealthDevice:", 1);
        if (v29)
        {
          if (_os_feature_enabled_impl())
          {
            sharedBluetoothSettingsLogComponent();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              -[BTSDevicesController peripheral:didDiscoverServices:].cold.1();

            objc_msgSend(v6, "setCustomProperty:value:", CFSTR("Fitness"), CFSTR("1"));
            objc_msgSend(v6, "customProperty:", CFSTR("UpdateHealth"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v32)
              objc_msgSend(v6, "setCustomProperty:value:", CFSTR("UpdateHealth"), CFSTR("1"));
            objc_msgSend(v6, "tag:", *MEMORY[0x24BDD35B8]);
            notify_post("BTSettingsHRMConnectedNotification");
          }
          else
          {
            healthKitStore = v37->_healthKitStore;
            objc_msgSend(v6, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "name");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "allObjects");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = MEMORY[0x24BDAC760];
            v41[1] = 3221225472;
            v41[2] = __55__BTSDevicesController_peripheral_didDiscoverServices___block_invoke;
            v41[3] = &unk_24FCCE0A8;
            v42 = v6;
            v43 = v39;
            -[HKHealthStore registerPeripheralIdentifier:name:services:withCompletion:](healthKitStore, "registerPeripheralIdentifier:name:services:withCompletion:", v34, v35, v36, v41);

          }
        }
        -[BTSDevicesController _updateDevicePosition:](v37, "_updateDevicePosition:", v38);
      }

    }
  }

}

void __55__BTSDevicesController_peripheral_didDiscoverServices___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__BTSDevicesController_peripheral_didDiscoverServices___block_invoke_cold_1();

  }
}

- (void)fetchDADevices
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22F721000, v0, v1, "Error fetching DADevices: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (BOOL)updateDADevices
{
  return 0;
}

- (void)handleDASessionEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];
  uint8_t v16[16];
  uint8_t v17[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "eventType");
  if (v5 <= 40)
  {
    if (v5 != 10)
    {
      if (v5 == 20)
      {
        sharedBluetoothSettingsLogComponent();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_INFO, "DAEventTypeInvalidated for BTSettings", v14, 2u);
        }
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_22F721000, v8, OS_LOG_TYPE_INFO, "DASession from BTSettings activated", v17, 2u);
    }

    -[BTSDevicesController fetchDADevices](self, "fetchDADevices");
LABEL_14:
    if (self->_power && *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
      -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
    goto LABEL_23;
  }
  if (v5 != 41)
  {
    if (v5 != 42)
      goto LABEL_23;
    -[BTSDevicesController fetchDADevices](self, "fetchDADevices");
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F721000, v7, OS_LOG_TYPE_INFO, "DeviceChanged for BTSettings", buf, 2u);
    }

    goto LABEL_14;
  }
  sharedBluetoothSettingsLogComponent();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_22F721000, v9, OS_LOG_TYPE_INFO, "DeviceLost for BTSettings", v16, 2u);
  }

  -[BTSDevicesController fetchDADevices](self, "fetchDADevices");
  if (self->_power && *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
  {
    -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
    v10 = (void *)MEMORY[0x24BDD16D0];
    v11 = v4;
    objc_msgSend(v10, "defaultCenter");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v6, "postNotificationName:object:", CFSTR("DADeviceLost"), v13);

LABEL_22:
  }
LABEL_23:

}

- (void)setSSPConfirmation:(int64_t)a3 forDevice:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  if (a3)
  {
    -[PSSpecifier userInfo](self->_currentDeviceSpecifier, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", CFSTR("cancelled"), CFSTR("PIN-ended"));

    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = a3;
LABEL_7:
    objc_msgSend(v7, "acceptSSP:forDevice:", v9, v11);

    goto LABEL_8;
  }
  if (!-[BTSDevicesController isiPhone](self, "isiPhone")
    || !objc_msgSend(v11, "isServiceSupported:", 0x40000))
  {
    -[PSSpecifier userInfo](self->_currentDeviceSpecifier, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", CFSTR("accepted"), CFSTR("PIN-ended"));

    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v11, "setSyncSettings:", objc_msgSend(v11, "syncSettings") & 0xFFFF00FFLL);
  -[BTSDevicesController showSyncContactsPopup:](self, "showSyncContactsPopup:", v11);
LABEL_8:

}

- (void)showPairingAlert:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v7 = a3;
  -[BTSDevicesController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BEBDB08];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __41__BTSDevicesController_showPairingAlert___block_invoke;
    v8[3] = &unk_24FCCDF90;
    v8[4] = self;
    v9 = v7;
    objc_msgSend(v6, "_performWithoutDeferringTransitions:", v8);

  }
}

uint64_t __41__BTSDevicesController_showPairingAlert___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)dismissPairingAlert:(id)a3
{
  -[BTSDevicesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_addDevice:(id)a3
{
  uint64_t v4;
  void *v5;
  NSMutableDictionary *devicesDict;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[BTSDevicesController shouldDisplayDevice:](self, "shouldDisplayDevice:"))
  {
    objc_msgSend(v12, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      devicesDict = self->_devicesDict;
      objc_msgSend(v12, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](devicesDict, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v9 = self->_devicesDict;
        objc_msgSend(v12, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v12, v10);

        -[BTSDevicesController _specifierForDevice:](self, "_specifierForDevice:", v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[BTSDevicesController _addDeviceSpecifier:withDevice:](self, "_addDeviceSpecifier:withDevice:", v11, v12);

      }
    }
  }

}

- (void)_addDeviceSpecifier:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[BTSDevicesController specifierForID:](self, "specifierForID:", CFSTR("MY_DEVICES"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_7:
    v25 = v6;
    if (objc_msgSend(v7, "isMyDevice"))
      v15 = CFSTR("MY_DEVICES");
    else
      v15 = CFSTR("DEVICES");
    v16 = -[BTSDevicesController indexOfSpecifierID:](self, "indexOfSpecifierID:", v15);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (int)*MEMORY[0x24BE756E0];
    if (v16 + 1 < (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v17), "count"))
    {
      v18 = v16 + 1;
      do
      {
        -[BTSDevicesController specifierAtIndex:](self, "specifierAtIndex:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "userInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", CFSTR("bt-device"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          break;
        v22 = objc_msgSend(v7, "isMyDevice");
        if (v22 == objc_msgSend(v21, "isMyDevice"))
          objc_msgSend(v12, "addObject:", v21);

        ++v18;
      }
      while (v18 < objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v17), "count"));
    }
    objc_msgSend(v12, "addObject:", v7);
    objc_msgSend(v12, "sortUsingSelector:", sel_compare_);
    v23 = v16 + 1 + objc_msgSend(v12, "indexOfObject:", v7);
    sharedBluetoothSettingsLogComponent();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[BTSDevicesController _addDeviceSpecifier:withDevice:].cold.1();

    v6 = v25;
    -[BTSDevicesController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v25, v23, 1);
    goto LABEL_19;
  }
  if (!objc_msgSend(v7, "isMyDevice"))
    goto LABEL_7;
  sharedBluetoothSettingsLogComponent();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v10;
    _os_log_impl(&dword_22F721000, v9, OS_LOG_TYPE_INFO, "Adding first \"known\" device %@", buf, 0xCu);

  }
  v26[0] = self->_myDevicesGroupSpec;
  v26[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSDevicesController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v11, CFSTR("BLUETOOTH"), 1);

  -[PSSpecifier propertyForKey:](self->_otherDevicesGroupSpec, "propertyForKey:", *MEMORY[0x24BE75AB0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OTHER_DEVICES"), &stru_24FCCE738, CFSTR("Devices"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", v14);

LABEL_19:
}

- (void)_removeDeviceSpecifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  _BYTE v17[12];
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BTSDevicesController beginUpdates](self, "beginUpdates");
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v17 = 138412546;
    *(_QWORD *)&v17[4] = v4;
    v18 = 2048;
    v19 = -[BTSDevicesController indexOfSpecifier:](self, "indexOfSpecifier:", v4);
    _os_log_impl(&dword_22F721000, v5, OS_LOG_TYPE_INFO, "Removing specifier %@ at index %lu", v17, 0x16u);
  }

  -[BTSDevicesController removeSpecifier:animated:](self, "removeSpecifier:animated:", v4, 1);
  -[BTSDevicesController specifierForID:](self, "specifierForID:", CFSTR("MY_DEVICES"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[BTSDevicesController rowsForGroup:](self, "rowsForGroup:", 1);

    if (!v8)
    {
      sharedBluetoothSettingsLogComponent();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_22F721000, v9, OS_LOG_TYPE_INFO, "Removing \"known\" device section", v17, 2u);
      }

      v10 = -[BTSDevicesController isMainSettingsPane](self, "isMainSettingsPane");
      -[BTSDevicesController table](self, "table");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[BTSDevicesController tableView:viewForHeaderInSection:](self, "tableView:viewForHeaderInSection:", v11, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        sharedBluetoothSettingsLogComponent();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v17 = 0;
          v14 = "Removing in BT pane";
LABEL_12:
          _os_log_impl(&dword_22F721000, v13, OS_LOG_TYPE_INFO, v14, v17, 2u);
        }
      }
      else
      {
        -[BTSDevicesController tableView:viewForHeaderInSection:](self, "tableView:viewForHeaderInSection:", v11, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        sharedBluetoothSettingsLogComponent();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v17 = 0;
          v14 = "Removing in AX pane";
          goto LABEL_12;
        }
      }

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DEVICES"), &stru_24FCCE738, CFSTR("Devices"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setName:", v16);

      -[BTSDevicesController removeSpecifier:animated:](self, "removeSpecifier:animated:", self->_myDevicesGroupSpec, 1);
    }
  }
  -[BTSDevicesController endUpdates](self, "endUpdates", *(_QWORD *)v17);

}

- (void)_removeDevice:(id)a3
{
  id v4;
  NSMutableDictionary *devicesDict;
  void *v6;
  void *v7;
  void *v8;
  PSSpecifier *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v4 = a3;
  devicesDict = self->_devicesDict;
  v12 = v4;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](devicesDict, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v12, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDevicesController specifierForID:](self, "specifierForID:", v8);
    v9 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();

    if (v9 && v9 == self->_currentDeviceSpecifier)
    {
      objc_msgSend(v12, "disconnect");
      -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 0);
    }
    v10 = self->_devicesDict;
    objc_msgSend(v12, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

    -[BTSDevicesController _removeDeviceSpecifier:](self, "_removeDeviceSpecifier:", v9);
  }

}

- (void)allowBluetoothScans:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (!a3)
  {
    self->_allowScanning = 0;
    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeviceScanningEnabled:", 0);

    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetDeviceScanning");
LABEL_6:

    -[BTSDevicesController _setupCentralScanning](self, "_setupCentralScanning");
    return;
  }
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "applicationState");

  if (!v6)
  {
    self->_allowScanning = a3;
    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDeviceScanningEnabled:", 1);
    goto LABEL_6;
  }
}

- (void)healthDeviceUnregisteredHandler:(id)a3
{
  void *v4;
  NSObject *v5;
  HKHealthStore *healthKitStore;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BTSDevicesController healthDeviceUnregisteredHandler:].cold.1();

  if (objc_msgSend(v4, "isHealthDevice"))
  {
    objc_msgSend(v4, "setHealthDevice:", 0);
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v4, "unpair");
    }
    else
    {
      healthKitStore = self->_healthKitStore;
      v7 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __56__BTSDevicesController_healthDeviceUnregisteredHandler___block_invoke;
      v10[3] = &unk_24FCCE080;
      v11 = v4;
      -[HKHealthStore unregisterPeripheralIdentifier:withCompletion:](healthKitStore, "unregisterPeripheralIdentifier:withCompletion:", v9, v10);

    }
    -[BTSDevicesController _updateDevicePosition:](self, "_updateDevicePosition:", v4);
  }

}

void __56__BTSDevicesController_healthDeviceUnregisteredHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __51__BTSDevicesController_pairingAgent_peerDidUnpair___block_invoke_cold_1();

  }
}

- (void)userDidTapWatchLink:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("bridge:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)userDidTapWalletLink:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("wallet:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (id)_heroPlacardSpecifiers
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24FCCE738, self, 0, 0, 0, 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("BluetoothSettings.BTSettingsPlacardView")), *MEMORY[0x24BE75948]);
  objc_msgSend(v2, "setIdentifier:", CFSTR("BLUETOOH_PLACARD"));
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)powerOffWarningString
{
  int v3;
  _BOOL4 exposureNotificationManagerEnabled;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  if (-[BTSDevicesController isMainSettingsPane](self, "isMainSettingsPane"))
  {
    self->_exposureNotificationManagerEnabled = -[ENManager exposureNotificationEnabled](self->_exposureNotificationManager, "exposureNotificationEnabled");
    v3 = objc_msgSend(MEMORY[0x24BE900E0], "autoUnlockEnabled");
    exposureNotificationManagerEnabled = self->_exposureNotificationManagerEnabled;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (exposureNotificationManagerEnabled)
    {
      if (v3)
        v7 = CFSTR("POWER_OFF_WARNING_WITH_EN_PAU");
      else
        v7 = CFSTR("POWER_OFF_WARNING_WITH_EN");
    }
    else if (v3)
    {
      v7 = CFSTR("POWER_OFF_WARNING_WITH_PAU");
    }
    else
    {
      v7 = CFSTR("POWER_OFF_WARNING");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("POWER_OFF_WARNING_IN_AX");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24FCCE738, CFSTR("Devices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)namesOfDevices:(id)a3 displayableOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = v6;
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    v12 = !v4;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "name");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          v17 = -[BTSDevicesController shouldDisplayDevice:](self, "shouldDisplayDevice:", v14) | v12;

          if (v17 == 1)
          {
            objc_msgSend(v14, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v18);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v19 = (void *)objc_msgSend(v7, "copy");
  return v19;
}

- (id)connectedPoorBehaviorDeviceNames
{
  return -[BTSDevicesController namesOfDevices:displayableOnly:](self, "namesOfDevices:displayableOnly:", self->_connectedPoorBehaviorDevices, 1);
}

- (id)connectedFirmwareUpdateRequiredDeviceNames
{
  return -[BTSDevicesController namesOfDevices:displayableOnly:](self, "namesOfDevices:displayableOnly:", self->_connectedFirmwareUpdateRequiredDevices, 1);
}

- (id)localizedList:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("QUOTED_DEVICE_NAME"), &stru_24FCCE738, CFSTR("Devices"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithFormat:", v12, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v13);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)makeWarningAttributedString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n\n %@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v3);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithRenderingMode:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB4B8], "textAttachmentWithImage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertAttributedString:atIndex:", v8, 2);

  return v4;
}

- (id)currentSpecifier
{
  return self->_currentDeviceSpecifier;
}

- (id)_specifierForSharingDevice:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || -[__CFString isEqualToString:](v5, "isEqualToString:", &stru_24FCCE738))
  {

    v6 = CFSTR(" ");
  }
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, -1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v7, "setName:", v6);
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v8, "setObject:forKey:", v4, CFSTR("bt-device"));

  objc_msgSend(v7, "setUserInfo:", v8);
  return v7;
}

uint64_t __47__BTSDevicesController__knownDevicesSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_retrievedRegisteredHealthDevices:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__BTSDevicesController__retrievedRegisteredHealthDevices___block_invoke;
  v6[3] = &unk_24FCCE110;
  v6[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_22F721000, v5, OS_LOG_TYPE_DEFAULT, "Received registered health devices %@", buf, 0xCu);
  }

}

void __58__BTSDevicesController__retrievedRegisteredHealthDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1624);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __44__BTSDevicesController__updateHealthDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD block[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __44__BTSDevicesController__updateHealthDevices__block_invoke_cold_1(v6, v7);

  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v12, "hasTag:", CFSTR("FitnessClassic")) & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "_getDeviceForPeripheral:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
            {
              objc_msgSend(v13, "setHealthDevice:", 1);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1616), "addObject:", v14);
            }

          }
        }
        v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v9);
    }
    sharedBluetoothSettingsLogComponent();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1616);
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_22F721000, v15, OS_LOG_TYPE_INFO, "Found known health devices %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__BTSDevicesController__updateHealthDevices__block_invoke_406;
    block[3] = &unk_24FCCE058;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __44__BTSDevicesController__updateHealthDevices__block_invoke_406(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)((char *)v2 + (int)*MEMORY[0x24BE756E0]))
  {
    v3 = (void *)v2[202];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __44__BTSDevicesController__updateHealthDevices__block_invoke_2;
    v5[3] = &unk_24FCCE138;
    v5[4] = v2;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "migrateHKPairedHealthDevices");
}

void __44__BTSDevicesController__updateHealthDevices__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1440);
  v7 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "_addDevice:", v7);

}

void __44__BTSDevicesController__updateHealthDevices__block_invoke_408(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1440);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22F721000, v7, OS_LOG_TYPE_DEFAULT, "Found a health device that's already added - rearrange here.", v8, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_addDevice:", v3);
  }

}

- (void)_updateDevicePosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PSSpecifier *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  int v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSDevicesController specifierForID:](self, "specifierForID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_34;
  v27 = 0x7FFFFFFFFFFFFFFFLL;
  -[BTSDevicesController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", &v27, 0, v6);
  if (v27 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BTSDevicesController specifierAtIndex:](self, "specifierAtIndex:", -[BTSDevicesController indexOfGroup:](self, "indexOfGroup:"));
    v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isMyDevice") && v7 == self->_myDevicesGroupSpec
      || (objc_msgSend(v4, "isMyDevice") & 1) == 0 && v7 == self->_otherDevicesGroupSpec)
    {
      v8 = -[BTSDevicesController indexOfSpecifier:](self, "indexOfSpecifier:", v6);
      -[BTSDevicesController specifierAtIndex:](self, "specifierAtIndex:", v8 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("bt-device"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[BTSDevicesController specifierAtIndex:](self, "specifierAtIndex:", v8 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("bt-device"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v12) = objc_msgSend(v11, "isMyDevice");
      if ((_DWORD)v12 == objc_msgSend(v4, "isMyDevice"))
      {
        objc_msgSend(v11, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v16, "caseInsensitiveCompare:", v17) == -1 || v11 == 0;

      }
      else
      {
        v15 = v11 == 0;
      }
      v19 = objc_msgSend(v14, "isMyDevice");
      if (v19 == objc_msgSend(v4, "isMyDevice"))
      {
        objc_msgSend(v14, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v21, "caseInsensitiveCompare:", v22) == -1 || v14 == 0;

      }
      else
      {
        v20 = v14 == 0;
      }
      if (v15 && v20)
      {
        sharedBluetoothSettingsLogComponent();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v29 = v25;
          _os_log_impl(&dword_22F721000, v24, OS_LOG_TYPE_INFO, "Reloading correctly located device %@", buf, 0xCu);

        }
        -[BTSDevicesController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v6, 0);

        goto LABEL_34;
      }

    }
  }
  sharedBluetoothSettingsLogComponent();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[BTSDevicesController _updateDevicePosition:].cold.1(v4, v26);

  -[BTSDevicesController beginUpdates](self, "beginUpdates");
  -[BTSDevicesController _removeDeviceSpecifier:](self, "_removeDeviceSpecifier:", v6);
  -[BTSDevicesController _addDeviceSpecifier:withDevice:](self, "_addDeviceSpecifier:withDevice:", v6, v4);
  -[BTSDevicesController endUpdates](self, "endUpdates");
LABEL_34:

}

- (void)updateUI:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PSSpecifier *sharingDevicesGroupSpec;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[BTSDevicesController specifierForID:](self, "specifierForID:", CFSTR("MAIN_GROUP"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v6 = (void *)MEMORY[0x24BDBCEB8];
    -[BTSDevicesController _shareDevicesSpecifiers](self, "_shareDevicesSpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDBCEB8];
    -[BTSDevicesController _knownDevicesSpecifiers](self, "_knownDevicesSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      sharingDevicesGroupSpec = self->_sharingDevicesGroupSpec;
      if (sharingDevicesGroupSpec)
        objc_msgSend(v8, "insertObject:atIndex:", sharingDevicesGroupSpec, 0);
    }
    if (objc_msgSend(v11, "count"))
    {
      v29 = v5;
      objc_msgSend(v11, "insertObject:atIndex:", self->_myDevicesGroupSpec, 0);
      v13 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "connectingDevices");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      sharedBluetoothSettingsLogComponent();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "-[BTSDevicesController updateUI:]";
        v37 = 2048;
        v38 = objc_msgSend(v16, "count");
        v39 = 2112;
        v40 = v16;
        _os_log_impl(&dword_22F721000, v17, OS_LOG_TYPE_INFO, "%s found %lu connecting devices - %@", buf, 0x20u);
      }

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v31 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "address");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "specifierForID:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 1);
              objc_storeStrong((id *)&self->_currentDeviceSpecifier, v24);
            }

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v20);
      }

      v5 = v29;
    }
    if (!self->_bluetoothRestricted)
      objc_msgSend(v11, "addObject:", self->_otherDevicesGroupSpec);
    -[BTSDevicesController beginUpdates](self, "beginUpdates");
    if (objc_msgSend(v8, "count"))
      -[BTSDevicesController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", v8, 1);
    -[BTSDevicesController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", v11, 1);
    -[BTSDevicesController endUpdates](self, "endUpdates");
    -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 0);
    goto LABEL_27;
  }
  -[NSMutableDictionary removeAllObjects](self->_devicesDict, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_sharingDevicesDict, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_ctkdLeDevicesDict, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_connectedPoorBehaviorDevices, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_connectedFirmwareUpdateRequiredDevices, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_connectedHIDDevices, "removeAllObjects");
  -[BTSDevicesController cleanupPairing](self, "cleanupPairing");
  -[BTSDevicesController cleanupAlerts](self, "cleanupAlerts");
  if (-[BTSDevicesController numberOfGroups](self, "numberOfGroups") >= 2)
  {
    v25 = -[BTSDevicesController indexOfGroup:](self, "indexOfGroup:", 1);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "subarrayWithRange:", v25, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "count") - v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDevicesController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v26, 1);

  }
  -[BTSDevicesController powerOffWarningString](self, "powerOffWarningString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v8, *MEMORY[0x24BE75A68]);
  -[BTSDevicesController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v5, 1);
  -[BTSDevicesController parentViewController](self, "parentViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[BTSDevicesController rootController](self, "rootController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend(v11, "popToViewController:animated:", self, 1);
LABEL_27:

  }
}

- (void)updatePoorConnectedDevicesList:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  int v19;
  NSMutableSet *connectedPoorBehaviorDevices;
  _QWORD block[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[8];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F721000, v4, OS_LOG_TYPE_DEFAULT, "Received 'le hid device behavior changed' notification", buf, 2u);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:](self->_centralManager, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v10, "connectedTransport") == 2)
        {
          -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 && objc_msgSend(v10, "visibleInSettings"))
          {
            if ((objc_msgSend(v11, "connected") & 1) != 0
              && objc_msgSend(v11, "isLimitedConnectivityDevice"))
            {
              -[NSMutableSet addObject:](self->_connectedPoorBehaviorDevices, "addObject:", v11);
              goto LABEL_16;
            }
            if (-[NSMutableSet containsObject:](self->_connectedPoorBehaviorDevices, "containsObject:", v11))
            {
              -[NSMutableSet removeObject:](self->_connectedPoorBehaviorDevices, "removeObject:", v11);
LABEL_16:
              self->_mainFooterNeedsUpdate = 1;
            }
          }

          continue;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v7);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connectedDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (!v14)
    goto LABEL_32;
  v15 = v14;
  v16 = *(_QWORD *)v23;
  do
  {
    for (j = 0; j != v15; ++j)
    {
      if (*(_QWORD *)v23 != v16)
        objc_enumerationMutation(v13);
      +[BTSDeviceClassic deviceWithDevice:](BTSDeviceClassic, "deviceWithDevice:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isLimitedConnectivityDevice");
      connectedPoorBehaviorDevices = self->_connectedPoorBehaviorDevices;
      if (v19)
      {
        -[NSMutableSet addObject:](connectedPoorBehaviorDevices, "addObject:", v18);
      }
      else
      {
        if (!-[NSMutableSet containsObject:](connectedPoorBehaviorDevices, "containsObject:", v18))
          goto LABEL_30;
        -[NSMutableSet removeObject:](self->_connectedPoorBehaviorDevices, "removeObject:", v18);
      }
      self->_mainFooterNeedsUpdate = 1;
LABEL_30:

    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  }
  while (v15);
LABEL_32:

  if (self->_mainFooterNeedsUpdate)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__BTSDevicesController_updatePoorConnectedDevicesList___block_invoke;
    block[3] = &unk_24FCCE058;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    self->_mainFooterNeedsUpdate = 0;
  }
}

uint64_t __55__BTSDevicesController_updatePoorConnectedDevicesList___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)updateFirmwareUpdateRequiredDevicesList:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _QWORD block[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[16];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F721000, v4, OS_LOG_TYPE_DEFAULT, "Received 'le device firmware update required changed' notification", buf, 2u);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CBCentralManager retrieveConnectedPeripheralsWithServices:allowAll:](self->_centralManager, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "connectedTransport") == 2)
        {
          -[BTSDevicesController _getDeviceForPeripheral:](self, "_getDeviceForPeripheral:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11
            && objc_msgSend(v10, "visibleInSettings")
            && objc_msgSend(v11, "connected")
            && objc_msgSend(v11, "isFirmwareUpdateRequiredDevice"))
          {
            -[NSMutableSet addObject:](self->_connectedFirmwareUpdateRequiredDevices, "addObject:", v11);
            self->_mainFooterNeedsUpdate = 1;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

  if (self->_mainFooterNeedsUpdate)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__BTSDevicesController_updateFirmwareUpdateRequiredDevicesList___block_invoke;
    block[3] = &unk_24FCCE058;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    self->_mainFooterNeedsUpdate = 0;
  }
}

uint64_t __64__BTSDevicesController_updateFirmwareUpdateRequiredDevicesList___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)updateMainGroupFooter
{
  if (self->_mainFooterNeedsUpdate)
  {
    -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
    self->_mainFooterNeedsUpdate = 0;
  }
}

- (BOOL)isiPhone
{
  void *v2;
  char v3;

  MGGetStringAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone"));

  return v3;
}

- (BOOL)isiPad
{
  void *v2;
  char v3;

  MGGetStringAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));

  return v3;
}

- (id)bluetoothEnabled:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BYTE v22[22];
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "powerState");
  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = !self->_togglingPower;
    *(_DWORD *)v22 = 136315650;
    *(_QWORD *)&v22[4] = "-[BTSDevicesController bluetoothEnabled:]";
    if (v8)
      v9 = "no";
    else
      v9 = "yes";
    *(_WORD *)&v22[12] = 2080;
    *(_QWORD *)&v22[14] = v9;
    v23 = 1024;
    v24 = v6;
    _os_log_impl(&dword_22F721000, v7, OS_LOG_TYPE_INFO, "%s - toggling: %s, powerstate: %d", v22, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x24BE676A8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isStoreDemoModeEnabled:", 0))
  {
    objc_msgSend(MEMORY[0x24BE676B8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isBetterTogetherDemoDevice") ^ 1;

  }
  else
  {
    v12 = 1;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BE75A18];
  objc_msgSend(v4, "setProperty:forKey:", v13, *MEMORY[0x24BE75A18]);

  v15 = v6 == 1 || self->_togglingPower;
  v16 = objc_msgSend(v5, "available", *(_OWORD *)v22);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15 & v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v17, *MEMORY[0x24BE75998]);

  if (self->_bluetoothRestricted)
    v18 = 0;
  else
    v18 = objc_msgSend(v5, "available");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v19, v14);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6 == 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)setBluetoothEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  BTSDevicesController *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;

  v6 = a4;
  v7 = objc_msgSend(a3, "BOOLValue");
  if (self->_power != (_DWORD)v7)
  {
    v8 = v7;
    if ((v7 & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistentDomainForName:", CFSTR("com.apple.bluetooth.settings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("HideGizmoPowerWarning"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_4:
      -[BTSDevicesController updatePowerState:powerSpec:](self, "updatePowerState:powerSpec:", v8, v6);
    }
    else
    {
      v12 = (void *)MEMORY[0x24BEBD3B0];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("POWER_WARNING_TITLE"), &stru_24FCCE738, CFSTR("Devices"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDevicesController powerOffWarningString](self, "powerOffWarningString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24FCCE738, CFSTR("Devices"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x24BDAC760];
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __54__BTSDevicesController_setBluetoothEnabled_specifier___block_invoke_2;
      v34[3] = &unk_24FCCE1A0;
      v36 = &__block_literal_global_423;
      v34[4] = self;
      v21 = v6;
      v35 = v21;
      objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, v34);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAction:", v22);

      v23 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("TURN_OFF"), &stru_24FCCE738, CFSTR("Devices"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v20;
      v28 = 3221225472;
      v29 = __54__BTSDevicesController_setBluetoothEnabled_specifier___block_invoke_3;
      v30 = &unk_24FCCE1C8;
      v31 = self;
      v32 = v21;
      v33 = &__block_literal_global_423;
      objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, &v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAction:", v26, v27, v28, v29, v30, v31);

      -[BTSDevicesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
    }
  }

}

void __54__BTSDevicesController_setBluetoothEnabled_specifier___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "persistentDomainForName:", CFSTR("com.apple.bluetooth.settings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithDictionary:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("HideGizmoPowerWarning"));
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentDomain:forName:", v4, CFSTR("com.apple.bluetooth.settings"));

}

uint64_t __54__BTSDevicesController_setBluetoothEnabled_specifier___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__BTSDevicesController_setBluetoothEnabled_specifier___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updatePowerState:powerSpec:", 0, *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)updatePowerState:(BOOL)a3 powerSpec:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "setEnabled:", v4);

  if ((_DWORD)v4)
  {
    self->_togglingPower = 1;
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "setEnabled:", 0);
  }
  -[BTSDevicesController reloadSpecifier:](self, "reloadSpecifier:", v7);

}

- (void)setBluetoothIsBusy:(BOOL)a3
{
  BOOL v4;
  PSSpecifier *currentDeviceSpecifier;
  NSTimer *currentDeviceConnectionTimer;

  if (a3)
  {
    v4 = 1;
  }
  else
  {
    currentDeviceSpecifier = self->_currentDeviceSpecifier;
    self->_currentDeviceSpecifier = 0;

    -[NSTimer invalidate](self->_currentDeviceConnectionTimer, "invalidate");
    currentDeviceConnectionTimer = self->_currentDeviceConnectionTimer;
    self->_currentDeviceConnectionTimer = 0;

    v4 = 0;
  }
  self->_bluetoothIsBusy = v4;
}

- (void)alertSheetDismissed:(id)a3
{
  NSObject *v4;
  BTAlert *alert;
  BTAlert *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BTAlert *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    alert = self->_alert;
    v13 = 138412290;
    v14 = alert;
    _os_log_impl(&dword_22F721000, v4, OS_LOG_TYPE_DEFAULT, "Dismiss BTAlert : %@", (uint8_t *)&v13, 0xCu);
  }

  v6 = self->_alert;
  self->_alert = 0;

  -[BTSDevicesController rootController](self, "rootController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[BTSDevicesController rootController](self, "rootController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "visibleViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismiss");

  }
}

- (void)showAlert:(id)a3
{
  -[BTSDevicesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, 0);
}

- (void)cleanupPairing
{
  BTSSPPairingRequest *sspAlert;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  UIAlertController *syncContactsCarplayAlert;
  void *v11;
  UIAlertController *v12;

  -[BTSSPPairingRequest dismiss](self->_sspAlert, "dismiss");
  sspAlert = self->_sspAlert;
  self->_sspAlert = 0;

  -[BTSDevicesController rootController](self, "rootController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[BTSDevicesController rootController](self, "rootController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visibleViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismiss");

  }
  syncContactsCarplayAlert = self->_syncContactsCarplayAlert;
  if (syncContactsCarplayAlert)
  {
    -[UIAlertController dismissViewControllerAnimated:completion:](syncContactsCarplayAlert, "dismissViewControllerAnimated:completion:", 1, 0);
    -[PSSpecifier userInfo](self->_currentDeviceSpecifier, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", CFSTR("cancelled"), CFSTR("PIN-ended"));

    v12 = self->_syncContactsCarplayAlert;
    self->_syncContactsCarplayAlert = 0;

  }
}

- (void)cleanupAlerts
{
  UIAlertController *syncContactsPrivacyAlert;
  void *v4;
  void *v5;
  id v6;

  if (self->_syncContactsPrivacyAlert)
  {
    -[BTSDevicesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    v6 = (id)_currentDevice;
    objc_msgSend(v6, "setSyncSettings:", objc_msgSend(v6, "syncSettings") & 0xFFFF00FFLL | 0x100000000);
    syncContactsPrivacyAlert = self->_syncContactsPrivacyAlert;
    self->_syncContactsPrivacyAlert = 0;

    v4 = (void *)_currentDevice;
    _currentDevice = 0;

    v5 = (void *)_currentBTSDevice;
    _currentBTSDevice = 0;

  }
}

- (void)registerForNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x24BEBE010], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_applicationWillTerminate_, *MEMORY[0x24BEBE018], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x24BEBDF88], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_applicationDidEnterBackground_, *MEMORY[0x24BEBDF98], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_healthDeviceUnregisteredHandler_, CFSTR("BTSUnregisterHealthDeviceNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_powerChangedHandler_, *MEMORY[0x24BE0F928], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_powerChangedHandler_, *MEMORY[0x24BE0F9C8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_deviceDiscoveredHandler_, *MEMORY[0x24BE0F960], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_deviceUpdatedHandler_, *MEMORY[0x24BE0F978], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_deviceRemovedHandler_, *MEMORY[0x24BE0F968], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_deviceUnpairedHandler_, *MEMORY[0x24BE0F970], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_devicePairedStatusChangedHandler_, *MEMORY[0x24BE0F990], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_deviceConnectedHandler_, *MEMORY[0x24BE0F948], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_deviceConnectedHandler_, *MEMORY[0x24BE0F940], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_deviceDisconnectedHandler_, *MEMORY[0x24BE0F958], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_devicePairedHandler_, *MEMORY[0x24BE0F9A0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_devicePairedHandler_, *MEMORY[0x24BE0F9A8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_authenticationRequestHandler_, *MEMORY[0x24BE0F998], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_authenticationRequestHandler_, *MEMORY[0x24BE0F9B8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObserver:selector:name:object:", self, sel_authenticationRequestHandler_, *MEMORY[0x24BE0F9C0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel_authenticationRequestHandler_, *MEMORY[0x24BE0F9B0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_effectiveMCSettingsDidChange_, *MEMORY[0x24BE63740], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:name:object:", self, sel_deviceUpdatedHandler_, *MEMORY[0x24BE0F988], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", self, sel_bluetoothDenylistChanged_, *MEMORY[0x24BE0F938], 0);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_updatePoorConnectedDevicesList_, CFSTR("com.apple.bluetooth.leHIDBehaviorKnown"), 0);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", self, sel_updateFirmwareUpdateRequiredDevicesList_, CFSTR("com.apple.bluetooth.leDeviceFirmwareUpdateWarning"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:selector:name:object:", self, sel_reloadSpecifiers, *MEMORY[0x24BEBE088], 0);

}

- (void)refreshUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  -[NSMutableDictionary removeAllObjects](self->_devicesDict, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_sharingDevicesDict, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_ctkdLeDevicesDict, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_connectedPoorBehaviorDevices, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_connectedFirmwareUpdateRequiredDevices, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_connectedHIDDevices, "removeAllObjects");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE010], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBE018], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BEBDF88], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BEBE008], 0);

  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_22F721000, v7, OS_LOG_TYPE_DEFAULT, "Re-register for bluetooth notifications", v9, 2u);
  }

  -[CBCentralManager sharedPairingAgent](self->_centralManager, "sharedPairingAgent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[CBCentralManager setDelegate:](self->_centralManager, "setDelegate:", self);
  -[BTSDevicesController registerForNotifications](self, "registerForNotifications");
  -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
  self->_uiRefreshed = 1;
}

- (void)forcePushDetailViewForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  CBCentralManager *centralManager;
  void *v31;
  void *v32;
  void *v33;
  NSMutableDictionary *ctkdCounterpartDevicesDict;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  _QWORD v40[4];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[BTSDevicesController forcePushDetailViewForDevice:]";
    v43 = 2112;
    v44 = v4;
    _os_log_impl(&dword_22F721000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  -[BTSDevicesController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "childViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[BTSDevicesController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "childViewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    if (v18)
    {
      sharedBluetoothSettingsLogComponent();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v42 = (const char *)v4;
        _os_log_impl(&dword_22F721000, v19, OS_LOG_TYPE_DEFAULT, "Stop Force Push to Detail View because we're already in this page for device %@", buf, 0xCu);
      }
      goto LABEL_11;
    }

  }
  v14 = objc_alloc_init(MEMORY[0x24BE3F4D8]);
  v20 = objc_alloc_init(MEMORY[0x24BE75590]);
  objc_msgSend(v14, "setSpecifier:", v20);

  v21 = objc_alloc(MEMORY[0x24BDBCED8]);
  v39[0] = *MEMORY[0x24BE75948];
  v22 = objc_opt_class();
  v23 = *MEMORY[0x24BE759F8];
  v40[0] = v22;
  v40[1] = CFSTR("BTSPairSetup");
  v24 = *MEMORY[0x24BE75C60];
  v39[1] = v23;
  v39[2] = v24;
  v39[3] = *MEMORY[0x24BE75D08];
  v40[2] = CFSTR("BTSPairController");
  v40[3] = CFSTR("PSLinkCell");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v21, "initWithDictionary:", v25, v39[0]);

  objc_msgSend(v4, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKey:](v19, "setObject:forKey:", v26, *MEMORY[0x24BE75D50]);

  objc_msgSend(v4, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKey:](v19, "setObject:forKey:", v27, *MEMORY[0x24BE75AC0]);

  -[NSObject setObject:forKey:](v19, "setObject:forKey:", CFSTR("BTSDeviceConfigController"), v23);
  objc_msgSend(v14, "specifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setProperties:", v19);

  v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v29, "setObject:forKey:", v4, CFSTR("bt-device"));
  if (objc_msgSend(v4, "isCTKDDevice"))
  {
    centralManager = self->_centralManager;
    objc_msgSend(v4, "classicDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "address");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager retrievePeripheralWithAddress:](centralManager, "retrievePeripheralWithAddress:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    ctkdCounterpartDevicesDict = self->_ctkdCounterpartDevicesDict;
    objc_msgSend(v4, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](ctkdCounterpartDevicesDict, "objectForKeyedSubscript:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setObject:forKey:", v36, CFSTR("ctkd-device"));
  }
  objc_msgSend(v14, "specifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setUserInfo:", v29);

  -[BTSDevicesController navigationController](self, "navigationController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "pushViewController:animated:", v14, 1);

LABEL_11:
}

- (id)mergeDualRadioDevices:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  NSMutableDictionary *knownDADevices;
  void *v18;
  void *v19;
  NSMutableDictionary *ctkdCounterpartDevicesDict;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSMutableDictionary *dualRadioCounterpartDevicesDict;
  void *v30;
  NSMutableDictionary *v31;
  id v32;
  void *v33;
  uint64_t v34;
  BTSDevicesController *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  NSObject *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F721000, v5, OS_LOG_TYPE_DEFAULT, "Merging dual radio devices from AccessorySetupKit", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v31 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v30 = v4;
  objc_msgSend(v4, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v34)
  {
    v7 = *(_QWORD *)v37;
    v8 = 0x255E07000uLL;
    v33 = v6;
    v35 = self;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(v6);
        v10 = *(NSObject **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        +[BTSDeviceLE deviceWithPeripheral:manager:](BTSDeviceLE, "deviceWithPeripheral:manager:", v10, *(Class *)((char *)&self->super.super.super.super.super.isa + *(int *)(v8 + 2692)));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "linkedRadioAddress");
        v12 = objc_claimAutoreleasedReturnValue();
        sharedBluetoothSettingsLogComponent();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v11)
          v15 = v12 == 0;
        else
          v15 = 1;
        if (v15)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v10;
            _os_log_error_impl(&dword_22F721000, v14, OS_LOG_TYPE_ERROR, "Peripheral does not have linked address: %@", buf, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v12;
            _os_log_impl(&dword_22F721000, v14, OS_LOG_TYPE_DEFAULT, "Device linked radio address: %@", buf, 0xCu);
          }

          -[NSMutableDictionary objectForKey:](v35->_devicesDict, "objectForKey:", v12);
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14 || !objc_msgSend(v11, "isManagedByDeviceAccess"))
            goto LABEL_23;
          knownDADevices = v35->_knownDADevices;
          -[NSObject identifier](v10, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](knownDADevices, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setUnderlyingDADevice:", v19);

          ctkdCounterpartDevicesDict = v35->_ctkdCounterpartDevicesDict;
          -[NSObject identifier](v14, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](ctkdCounterpartDevicesDict, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            sharedBluetoothSettingsLogComponent();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v14;
              _os_log_error_impl(&dword_22F721000, v23, OS_LOG_TYPE_ERROR, "We cannot link to the new classic device because it's already linked to another LE device due to CTKD %@", buf, 0xCu);
            }

            objc_msgSend(v32, "addObject:", v11);
            v6 = v33;
LABEL_23:
            v8 = 0x255E07000;
            self = v35;
            goto LABEL_24;
          }
          objc_msgSend(v11, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setAccessorySetupKitDisplayName:](v14, "setAccessorySetupKitDisplayName:", v24);

          self = v35;
          -[NSMutableDictionary setObject:forKey:](v35->_devicesDict, "setObject:forKey:", v14, v12);
          -[NSObject identifier](v14, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v11, v25);

          objc_msgSend(v11, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v14, v26);

          v6 = v33;
          v8 = 0x255E07000;
        }
LABEL_24:

        ++v9;
      }
      while (v34 != v9);
      v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      v34 = v27;
    }
    while (v27);
  }

  dualRadioCounterpartDevicesDict = self->_dualRadioCounterpartDevicesDict;
  self->_dualRadioCounterpartDevicesDict = v31;

  return v32;
}

- (void)updateCTKDCounterparts:(id)a3 leDevice:(id)a4
{
  NSMutableDictionary *ctkdCounterpartDevicesDict;
  id v7;
  id v8;
  void *v9;
  NSMutableDictionary *v10;
  id v11;

  ctkdCounterpartDevicesDict = self->_ctkdCounterpartDevicesDict;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](ctkdCounterpartDevicesDict, "setObject:forKeyedSubscript:", v7, v9);

  v10 = self->_ctkdCounterpartDevicesDict;
  objc_msgSend(v7, "identifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v8, v11);
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id WeakRetained;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = -[BTSDevicesController indexForIndexPath:](self, "indexForIndexPath:", v5);
  v7 = -[BTSDevicesController indexOfSpecifierID:](self, "indexOfSpecifierID:", CFSTR("MY_DEVICES"));
  v8 = (int)*MEMORY[0x24BE756E0];
  v9 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "count");
  if (v6 > 255 || v7 >= 256)
  {
    sharedBluetoothSettingsLogComponent();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[BTSDevicesController tableView:accessoryButtonTappedForRowWithIndexPath:].cold.1();
  }
  else
  {
    if (v6 > v9 || v6 < v7)
    {
      sharedBluetoothSettingsLogComponent();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v17 = objc_msgSend(v5, "row");
        v18 = objc_msgSend(v5, "section");
        v19 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "count");
        v23 = 134219008;
        v24 = v17;
        v25 = 2048;
        v26 = v18;
        v27 = 2048;
        v28 = v6;
        v29 = 2048;
        v30 = v7;
        v31 = 2048;
        v32 = v19;
        _os_log_error_impl(&dword_22F721000, v11, OS_LOG_TYPE_ERROR, "Invalid index %ld in section %ld; rowIndex : %ld\t myDevicesGroupIndex : %ld\ttotal specifiers count %lu",
          (uint8_t *)&v23,
          0x34u);
      }

      -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
      v6 = -[BTSDevicesController indexForIndexPath:](self, "indexForIndexPath:", v5);
      v12 = -[BTSDevicesController indexOfSpecifierID:](self, "indexOfSpecifierID:", CFSTR("MY_DEVICES"));
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "count");
      sharedBluetoothSettingsLogComponent();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_msgSend(v5, "row");
        v21 = objc_msgSend(v5, "section");
        v22 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "count");
        v23 = 134219008;
        v24 = v20;
        v25 = 2048;
        v26 = v21;
        v27 = 2048;
        v28 = v6;
        v29 = 2048;
        v30 = v12;
        v31 = 2048;
        v32 = v22;
        _os_log_error_impl(&dword_22F721000, v13, OS_LOG_TYPE_ERROR, "Refreshed index %ld in section %ld; rowIndex : %ld\t myDevicesGroupIndex : %ld\ttotal specifiers count %lu",
          (uint8_t *)&v23,
          0x34u);
      }

    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "objectAtIndex:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(*(Class *)((char *)&v14->isa + (int)*MEMORY[0x24BE75740]));
    *((_BYTE *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756D8]) = 0;
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x24BE757A0]));
    objc_msgSend(v15, "setRootController:", WeakRetained);

    objc_msgSend(v15, "setParentController:", self);
    objc_msgSend(v15, "setSpecifier:", v14);
    -[BTSDevicesController showController:](self, "showController:", v15);

  }
}

- (BOOL)isDeviceSupported:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  const char *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x24BDBB2B8], "isDeviceSupportedWithType:VIDsrc:VID:PID:", objc_msgSend(v3, "type"), objc_msgSend(v3, "vendorIdSrc"), (unsigned __int16)objc_msgSend(v3, "vendorId"), (unsigned __int16)objc_msgSend(v3, "productId"));
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(v3, "type");
    v7 = objc_msgSend(v3, "vendorIdSrc");
    v8 = objc_msgSend(v3, "vendorId");
    v9 = objc_msgSend(v3, "productId");
    v12 = 136316418;
    v13 = "-[BTSDevicesController isDeviceSupported:]";
    v10 = "UNSUPPORTED";
    v15 = v6;
    v14 = 1024;
    if (v4)
      v10 = "SUPPORTED";
    v16 = 1024;
    v17 = v7;
    v18 = 1024;
    v19 = v8;
    v20 = 1024;
    v21 = v9;
    v22 = 2080;
    v23 = v10;
    _os_log_impl(&dword_22F721000, v5, OS_LOG_TYPE_INFO, "%s - type=%d vendorSrc=%d VID=0x%04X PID=0x%04X: %s", (uint8_t *)&v12, 0x2Eu);
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  int v21;
  NETRBClient *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSMutableDictionary *sharingDevicesDict;
  void *v33;
  void *v34;
  NSMutableDictionary *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  NSTimer *v41;
  NSTimer *currentDeviceConnectionTimer;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  _DWORD v53[3];

  v6 = a3;
  v7 = a4;
  -[BTSDevicesController specifierAtIndex:](self, "specifierAtIndex:", -[BTSDevicesController indexForIndexPath:](self, "indexForIndexPath:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("bt-device"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_bluetoothIsBusy)
  {
    -[BTSDevicesController specifierForID:](self, "specifierForID:", CFSTR("DENYLIST_ACTION_ID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v8)
    {
      objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "denylistEnabled");

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDenylistEnabled:", 0);

        -[BTSDevicesController reloadSpecifiers](self, "reloadSpecifiers");
      }
    }
  }
  if (v10)
  {
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v15;
      if (objc_msgSend(v16, "state") == 6 || objc_msgSend(v16, "state") == 7)
      {
        -[BTSDevicesController forcePushDetailViewForDevice:](self, "forcePushDetailViewForDevice:", v10);
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);

LABEL_54:
        goto LABEL_55;
      }

    }
    if (self->_bluetoothIsBusy)
    {
LABEL_53:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
      goto LABEL_54;
    }
    if (objc_msgSend(v10, "connected") && (objc_msgSend(v10, "isTemporaryPairedDevice") & 1) == 0)
    {
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
      sharedBluetoothSettingsLogComponent();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[BTSDevicesController tableView:didSelectRowAtIndexPath:].cold.1(v10, v31);

      goto LABEL_54;
    }
    objc_msgSend(v10, "classicDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[BTSDevicesController isDeviceSupported:](self, "isDeviceSupported:", v17);

    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v10;
        objc_msgSend(v19, "device");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isServiceSupported:", 4096);

        if (v21 && (self->_netClient || (v22 = (NETRBClient *)_NETRBClientCreate(), (self->_netClient = v22) != 0)))
        {
          v53[0] = 0;
          v23 = 0;
          _NETRBClientGetHostCount();
        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        v23 = 0;
      }
      v53[0] = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v10, "connected") & 1) == 0
        && objc_msgSend(v10, "isApplePencil:", v53))
      {
        -[BTSDevicesController showPencilConnectionAttemptAlert:](self, "showPencilConnectionAttemptAlert:", v53[0]);
      }
      else
      {
        sharingDevicesDict = self->_sharingDevicesDict;
        objc_msgSend(v10, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](sharingDevicesDict, "objectForKey:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(v10, "unpair");
          v35 = self->_sharingDevicesDict;
          objc_msgSend(v10, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](v35, "removeObjectForKey:", v36);

          -[BTSDevicesController removeSpecifier:animated:](self, "removeSpecifier:animated:", self->_sharingDevicesGroupSpec, 1);
        }
        else
        {
          if (!-[BTSDevicesController isSupportCarPlaySetup:](self, "isSupportCarPlaySetup:", v10))
          {
            if (objc_msgSend(v10, "connect"))
            {
              objc_storeStrong((id *)&self->_currentDeviceSpecifier, v8);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_peripheralConnectionTimeout_, v10, 0, 10.0);
                v41 = (NSTimer *)objc_claimAutoreleasedReturnValue();
                currentDeviceConnectionTimer = self->_currentDeviceConnectionTimer;
                self->_currentDeviceConnectionTimer = v41;

                objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "setDenylistEnabled:", 0);

              }
              -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 1);
              -[BTSDevicesController allowBluetoothScans:](self, "allowBluetoothScans:", 0);
              objc_msgSend(v10, "identifier");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = -[BTSDevicesController indexOfSpecifierID:](self, "indexOfSpecifierID:", v44);

              if (v45 != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = 4;
                if ((objc_msgSend(v10, "paired") & 1) == 0)
                {
                  if (objc_msgSend(v10, "isHealthDevice"))
                    v47 = 4;
                  else
                    v47 = 1;
                }
                objc_msgSend(v46, "setDeviceState:", v47);

              }
            }
            goto LABEL_52;
          }
          -[BTSDevicesController setBluetoothIsBusy:](self, "setBluetoothIsBusy:", 1);
          v37 = v10;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (-[BTSDevicesController getLECarPlay:](self, "getLECarPlay:", v37),
                (v38 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v39 = v38;

            v40 = v39;
          }
          else
          {
            v40 = 0;
            v39 = v37;
          }
          -[BTSDevicesController startOutgoingCarPlaySetup:](self, "startOutgoingCarPlaySetup:", v39);
          objc_msgSend(v37, "identifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = -[BTSDevicesController indexOfSpecifierID:](self, "indexOfSpecifierID:", v48);

          if (v49 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setDeviceState:", 1);

          }
        }
        v23 = 0;
      }
    }
    else
    {
      v51 = (void *)MEMORY[0x24BEBD3B0];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("CANNOT_CONNECT_UNSUPPORTED_DEVICE_TITLE"), &stru_24FCCE738, CFSTR("Devices"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CANNOT_CONNECT_UNSUPPORTED_DEVICE_MESSAGE"), &stru_24FCCE738, CFSTR("Devices"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "alertControllerWithTitle:message:preferredStyle:", v24, v26, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24FCCE738, CFSTR("Devices"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 1, &__block_literal_global_487);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addAction:", v30);

      -[BTSDevicesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);
    }
LABEL_52:

    goto LABEL_53;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
LABEL_55:

}

void __58__BTSDevicesController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setBluetoothIsBusy:", 0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSpecifierID:animated:", v3, 1);

}

uint64_t __58__BTSDevicesController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1592))
  {
    sharedBluetoothSettingsLogComponent();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22F721000, v2, OS_LOG_TYPE_INFO, "Toggling Personal Hotspot to disconnect active clients", v4, 2u);
    }

    _NETRBClientSetGlobalServiceState();
    _NETRBClientSetGlobalServiceState();
    _NETRBClientDestroy();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1592) = 0;
  }
  return objc_msgSend(*(id *)(a1 + 40), "connect");
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  id v6;
  double v7;
  double v9;
  objc_super v10;

  v6 = a3;
  if (!a4
    || a4 == 1 && (self->_denylistEnabled || -[NSMutableDictionary count](self->_sharingDevicesDict, "count"))
    || self->_denylistEnabled)
  {
    v7 = 42.0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)BTSDevicesController;
    -[BTSDevicesController tableView:heightForFooterInSection:](&v10, sel_tableView_heightForFooterInSection_, v6, a4);
    v7 = v9;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  __CFString *v9;
  NSString *restrictionDetail;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  int v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
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
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  __CFString *v53;
  id v54;
  NSObject *v55;
  __CFString *v56;
  id v57;
  id v58;
  objc_super v59;
  _QWORD v60[3];
  _QWORD v61[4];

  v61[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!a4 && !self->_denylistEnabled)
  {
    v9 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
    if (self->_bluetoothRestricted)
    {
      restrictionDetail = self->_restrictionDetail;
      v58 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", restrictionDetail, CFSTR("%@"), &v58, v9);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v58;
      v13 = v12;
      if (v11)
      {
        v54 = v12;
        v56 = v9;
LABEL_10:
        v55 = v11;
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v11);
        v19 = MGGetBoolAnswer();
        v20 = CFSTR("WIFI");
        if (v19)
          v20 = CFSTR("WLAN");
        v21 = v20;
        -[BTSDevicesController connectedPoorBehaviorDeviceNames](self, "connectedPoorBehaviorDeviceNames");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v22;
        v53 = v21;
        if (objc_msgSend(v22, "count"))
        {
          if ((unint64_t)objc_msgSend(v22, "count") <= 1)
            v23 = CFSTR("SINGULAR");
          else
            v23 = CFSTR("PLURAL");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_DISCOVERABLE_WARNING_%@"), v21, v23, v22, v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[BTSDevicesController localizedList:](self, "localizedList:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "localizedStringForKey:value:table:", v24, &stru_24FCCE738, CFSTR("Devices"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "localizedStringWithFormat:", v28, v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          -[BTSDevicesController makeWarningAttributedString:](self, "makeWarningAttributedString:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "appendAttributedString:", v30);

        }
        -[BTSDevicesController connectedFirmwareUpdateRequiredDeviceNames](self, "connectedFirmwareUpdateRequiredDeviceNames");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "count"))
        {
          if ((unint64_t)objc_msgSend(v31, "count") <= 1)
            v32 = CFSTR("SINGULAR");
          else
            v32 = CFSTR("PLURAL");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FIRMWARE_WARNING_%@"), v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[BTSDevicesController localizedList:](self, "localizedList:", v31);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "localizedStringForKey:value:table:", v33, &stru_24FCCE738, CFSTR("Devices"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "localizedStringWithFormat:", v37, v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          -[BTSDevicesController makeWarningAttributedString:](self, "makeWarningAttributedString:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "appendAttributedString:", v39);

        }
        v40 = (void *)objc_opt_new();
        objc_msgSend(v40, "setAlignment:", 4);
        objc_msgSend(MEMORY[0x24BEBD728], "groupedFooterConfiguration");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "textProperties");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "font");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "textProperties");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "color");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = *MEMORY[0x24BEBB360];
        v60[0] = *MEMORY[0x24BEBB368];
        v60[1] = v46;
        v61[0] = v45;
        v61[1] = v43;
        v60[2] = *MEMORY[0x24BEBB3A8];
        v61[2] = v40;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addAttributes:range:", v47, 0, objc_msgSend(v18, "length"));

        objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("MainGroupFooterId"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "textLabel");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setTextAlignment:", 4);

        objc_msgSend(v7, "textLabel");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setNumberOfLines:", 0);

        objc_msgSend(v7, "textLabel");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setAttributedText:", v18);

        self->_mainFooterNeedsUpdate = 1;
        v15 = v55;
        v9 = v56;
        v13 = v54;
        goto LABEL_29;
      }
      sharedBluetoothSettingsLogComponent();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[BTSDevicesController tableView:viewForFooterInSection:].cold.2();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DISCOVERABLE"), &stru_24FCCE738, CFSTR("Devices"));
      v15 = objc_claimAutoreleasedReturnValue();

      v57 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), &v57, v9);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v57;
      v13 = v17;
      if (v16)
      {
        v54 = v17;
        v56 = v9;

        v11 = v16;
        goto LABEL_10;
      }
      sharedBluetoothSettingsLogComponent();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        -[BTSDevicesController tableView:viewForFooterInSection:].cold.1();

    }
    v7 = 0;
LABEL_29:

    goto LABEL_4;
  }
  v59.receiver = self;
  v59.super_class = (Class)BTSDevicesController;
  -[BTSDevicesController tableView:viewForFooterInSection:](&v59, sel_tableView_viewForFooterInSection_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  return v7;
}

- (void)showSyncContactsPopup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIAlertController *v11;
  UIAlertController *syncContactsCarplayAlert;
  UIAlertController *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  UIAlertController *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD aBlock[5];
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  BTSDevicesController *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v34 = "-[BTSDevicesController showSyncContactsPopup:]";
    v35 = 2048;
    v36 = self;
    v37 = 2112;
    v38 = v4;
    _os_log_impl(&dword_22F721000, v5, OS_LOG_TYPE_DEFAULT, "%s Showing Sync Contacts Popup from BTSDeviceController instance %p, for device: %@", buf, 0x20u);
  }

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__BTSDevicesController_showSyncContactsPopup___block_invoke;
  aBlock[3] = &unk_24FCCE258;
  aBlock[4] = self;
  v32 = v4;
  v26 = v4;
  v25 = _Block_copy(aBlock);
  v6 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SYNC_CONTACTS_TITLE"), &stru_24FCCE738, CFSTR("Devices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SYNC_CARPLAY_CONTACTS_MESSAGE"), &stru_24FCCE738, CFSTR("Devices"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  syncContactsCarplayAlert = self->_syncContactsCarplayAlert;
  self->_syncContactsCarplayAlert = v11;

  v13 = self->_syncContactsCarplayAlert;
  v14 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SYNC_DISALLOW_BUTTON"), &stru_24FCCE738, CFSTR("Devices"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __46__BTSDevicesController_showSyncContactsPopup___block_invoke_2;
  v29[3] = &unk_24FCCE280;
  v17 = v25;
  v30 = v17;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v13, "addAction:", v18);

  v19 = self->_syncContactsCarplayAlert;
  v20 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SYNC_ALLOW_BUTTON"), &stru_24FCCE738, CFSTR("Devices"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __46__BTSDevicesController_showSyncContactsPopup___block_invoke_3;
  v27[3] = &unk_24FCCE280;
  v28 = v17;
  v23 = v17;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 0, v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v19, "addAction:", v24);

  -[BTSDevicesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_syncContactsCarplayAlert, 1, 0);
}

void __46__BTSDevicesController_showSyncContactsPopup___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1536), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("accepted"), CFSTR("PIN-ended"));

  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acceptSSP:forDevice:", 0, *(_QWORD *)(a1 + 40));

  v6 = objc_msgSend(*(id *)(a1 + 40), "syncSettings");
  v7 = 0x100000000;
  if (a2)
    v7 = 0x100000100;
  objc_msgSend(*(id *)(a1 + 40), "setSyncSettings:", v7 | v6 & 0xFFFF00FF);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 1568);
  *(_QWORD *)(v8 + 1568) = 0;

  if (a2)
  {
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1440);
    objc_msgSend(*(id *)(a1 + 40), "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "forcePushDetailViewForDevice:", v12);
  }
}

uint64_t __46__BTSDevicesController_showSyncContactsPopup___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__BTSDevicesController_showSyncContactsPopup___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showSyncContactsPrivacyPopup:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFDictionary *v17;
  void *v18;
  NSMutableDictionary *devicesDict;
  void *v20;
  uint64_t v21;
  void *v22;
  __CFRunLoop *Main;
  __CFRunLoopSource *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UIAlertController *v30;
  UIAlertController *syncContactsPrivacyAlert;
  UIAlertController *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  UIAlertController *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  UIAlertController *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD aBlock[4];
  id v52;
  BTSDevicesController *v53;
  _QWORD v54[5];
  _QWORD v55[5];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  BTSDevicesController *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v57 = "-[BTSDevicesController showSyncContactsPrivacyPopup:]";
    v58 = 2048;
    v59 = self;
    v60 = 2112;
    v61 = v5;
    _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_DEFAULT, "%s Showing Sync Contacts Popup from BTSDeviceController instance %p, for device: %@", buf, 0x20u);
  }

  objc_storeStrong((id *)&_currentDevice, a3);
  v46 = v5;
  if ((MGGetBoolAnswer() & 1) != 0)
  {
    *(_DWORD *)buf = 0;
    v54[0] = *MEMORY[0x24BDBD6D8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SYNC_CONTACTS_TITLE"), &stru_24FCCE738, CFSTR("Devices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v8;
    v54[1] = *MEMORY[0x24BDBD6E0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SYNC_BLUETOOTH_CONTACTS_MESSAGE"), &stru_24FCCE738, CFSTR("Devices"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BDBD6E8];
    v55[1] = v10;
    v55[2] = MEMORY[0x24BDBD1C8];
    v12 = *MEMORY[0x24BDBD6F0];
    v54[2] = v11;
    v54[3] = v12;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SYNC_DISALLOW_BUTTON"), &stru_24FCCE738, CFSTR("Devices"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v14;
    v54[4] = *MEMORY[0x24BDBD6F8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SYNC_ALLOW_BUTTON"), &stru_24FCCE738, CFSTR("Devices"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v55[4] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 5);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v18 = v46;
    objc_storeStrong((id *)&_currentControllerInstance, self);
    devicesDict = self->_devicesDict;
    objc_msgSend(v46, "address");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](devicesDict, "objectForKeyedSubscript:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)_currentBTSDevice;
    _currentBTSDevice = v21;

    -[BTSDevicesController setNotification:](self, "setNotification:", CFUserNotificationCreate(0, 100.0, 3uLL, (SInt32 *)buf, v17));
    -[BTSDevicesController setRunLoopSource:](self, "setRunLoopSource:", CFUserNotificationCreateRunLoopSource(0, -[BTSDevicesController notification](self, "notification"), (CFUserNotificationCallBack)NotificationCallback, 0));
    Main = CFRunLoopGetMain();
    v24 = -[BTSDevicesController runLoopSource](self, "runLoopSource");
    CFRunLoopAddSource(Main, v24, (CFRunLoopMode)*MEMORY[0x24BDBD598]);

  }
  else
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__BTSDevicesController_showSyncContactsPrivacyPopup___block_invoke;
    aBlock[3] = &unk_24FCCE258;
    v52 = v5;
    v53 = self;
    v45 = _Block_copy(aBlock);
    v25 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SYNC_CONTACTS_TITLE"), &stru_24FCCE738, CFSTR("Devices"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("SYNC_BLUETOOTH_CONTACTS_MESSAGE"), &stru_24FCCE738, CFSTR("Devices"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "alertControllerWithTitle:message:preferredStyle:", v27, v29, 1);
    v30 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
    syncContactsPrivacyAlert = self->_syncContactsPrivacyAlert;
    self->_syncContactsPrivacyAlert = v30;

    v32 = self->_syncContactsPrivacyAlert;
    v33 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("SYNC_DISALLOW_BUTTON"), &stru_24FCCE738, CFSTR("Devices"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __53__BTSDevicesController_showSyncContactsPrivacyPopup___block_invoke_2;
    v49[3] = &unk_24FCCE280;
    v36 = v45;
    v50 = v36;
    objc_msgSend(v33, "actionWithTitle:style:handler:", v35, 1, v49);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController addAction:](v32, "addAction:", v37);

    v38 = self->_syncContactsPrivacyAlert;
    v39 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("SYNC_ALLOW_BUTTON"), &stru_24FCCE738, CFSTR("Devices"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __53__BTSDevicesController_showSyncContactsPrivacyPopup___block_invoke_3;
    v47[3] = &unk_24FCCE280;
    v48 = v36;
    v42 = v36;
    objc_msgSend(v39, "actionWithTitle:style:handler:", v41, 0, v47);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v38;
    v18 = v46;
    -[UIAlertController addAction:](v44, "addAction:", v43);

    -[BTSDevicesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_syncContactsPrivacyAlert, 1, 0);
  }

}

void __53__BTSDevicesController_showSyncContactsPrivacyPopup___block_invoke(uint64_t a1, int a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = objc_msgSend(*(id *)(a1 + 32), "syncSettings");
  v5 = 0x100000000;
  if (a2)
    v5 = 0x100000100;
  objc_msgSend(*(id *)(a1 + 32), "setSyncSettings:", v5 | v4 & 0xFFFF00FF);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 1584);
  *(_QWORD *)(v6 + 1584) = 0;

  v8 = (void *)_currentDevice;
  _currentDevice = 0;

  if (a2)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 1440);
    objc_msgSend(*(id *)(a1 + 32), "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "forcePushDetailViewForDevice:", v11);
  }
}

uint64_t __53__BTSDevicesController_showSyncContactsPrivacyPopup___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__BTSDevicesController_showSyncContactsPrivacyPopup___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showPencilConnectionAttemptAlert:(int)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = objc_alloc_init(MEMORY[0x24BDD17C8]);
  if ((a3 - 1) < 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("ATTACH_APPLE_PENCIL");
LABEL_5:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24FCCE738, CFSTR("Devices"));
    v8 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v8;
    goto LABEL_6;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("PLUG_IN_APPLE_PENCIL");
    goto LABEL_5;
  }
LABEL_6:
  v9 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("APPLE_PENCIL_NOT_CONNECTED_TITLE"), &stru_24FCCE738, CFSTR("Devices"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v11, v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CLOSE"), &stru_24FCCE738, CFSTR("Devices"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, &__block_literal_global_533);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAction:", v16);
  -[BTSDevicesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)effectiveMCSettingsDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__BTSDevicesController_effectiveMCSettingsDidChange___block_invoke;
  block[3] = &unk_24FCCE058;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __53__BTSDevicesController_effectiveMCSettingsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)startedConnectionAttemptOnTransport:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD block[7];

  if (a3 == 3)
  {
    block[5] = v3;
    block[6] = v4;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__BTSDevicesController_startedConnectionAttemptOnTransport___block_invoke;
    block[3] = &unk_24FCCE058;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __60__BTSDevicesController_startedConnectionAttemptOnTransport___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "allowBluetoothScans:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1517) = 1;
  return result;
}

- (void)cancelledConnectionAttemptOnTransport:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD block[7];

  if (a3 == 3)
  {
    block[5] = v3;
    block[6] = v4;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__BTSDevicesController_cancelledConnectionAttemptOnTransport___block_invoke;
    block[3] = &unk_24FCCE058;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

_BYTE *__62__BTSDevicesController_cancelledConnectionAttemptOnTransport___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[1517])
  {
    result = (_BYTE *)objc_msgSend(result, "allowBluetoothScans:", 1);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1517) = 0;
  }
  return result;
}

- (void)sessionDidConnect:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD block[5];

  objc_msgSend(a3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "transportType");

  if (v5 == 3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__BTSDevicesController_sessionDidConnect___block_invoke;
    block[3] = &unk_24FCCE058;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

_BYTE *__42__BTSDevicesController_sessionDidConnect___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[1517])
  {
    result = (_BYTE *)objc_msgSend(result, "allowBluetoothScans:", 1);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1517) = 0;
  }
  return result;
}

- (void)showUpgradeOSPopup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIAlertController *v9;
  UIAlertController *swUpdateAlert;
  UIAlertController *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  UIAlertController *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__BTSDevicesController_showUpgradeOSPopup___block_invoke;
  aBlock[3] = &unk_24FCCE2E8;
  aBlock[4] = self;
  v23 = _Block_copy(aBlock);
  v4 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SW_UPDATE_TITLE"), &stru_24FCCE738, CFSTR("Devices"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SW_UPDATE_MESSAGE"), &stru_24FCCE738, CFSTR("Devices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  swUpdateAlert = self->_swUpdateAlert;
  self->_swUpdateAlert = v9;

  v11 = self->_swUpdateAlert;
  v12 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SW_UPDATE_CLOSE_BUTTON"), &stru_24FCCE738, CFSTR("Devices"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __43__BTSDevicesController_showUpgradeOSPopup___block_invoke_2;
  v26[3] = &unk_24FCCE280;
  v15 = v23;
  v27 = v15;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v11, "addAction:", v16);

  v17 = self->_swUpdateAlert;
  v18 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SW_UPDATE_CHECK_BUTTON"), &stru_24FCCE738, CFSTR("Devices"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __43__BTSDevicesController_showUpgradeOSPopup___block_invoke_3;
  v24[3] = &unk_24FCCE280;
  v25 = v15;
  v21 = v15;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v17, "addAction:", v22);

  -[BTSDevicesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_swUpdateAlert, 1, 0);
}

void __43__BTSDevicesController_showUpgradeOSPopup___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1576);
  *(_QWORD *)(v3 + 1576) = 0;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=General&path=SOFTWARE_UPDATE_LINK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openSensitiveURL:withOptions:", v5, 0);

  }
}

uint64_t __43__BTSDevicesController_showUpgradeOSPopup___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __43__BTSDevicesController_showUpgradeOSPopup___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getLECarPlay:(id)a3
{
  id v4;
  CBCentralManager *centralManager;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "paired"))
  {
    centralManager = self->_centralManager;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBCentralManager retrievePeripheralWithAddress:](centralManager, "retrievePeripheralWithAddress:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "hasTag:", CFSTR("_CARPLAY_DEVICE_")))
    {
      +[BTSDeviceLE deviceWithPeripheral:manager:](BTSDeviceLE, "deviceWithPeripheral:manager:", v7, self->_centralManager);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isSupportCarPlaySetup:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  const char *v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[BTSDevicesController isiPhone](self, "isiPhone")
    || !-[BTSDevicesController isCarPlaySetupEnabled](self, "isCarPlaySetupEnabled"))
  {
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v4, "paired") & 1) == 0 && objc_msgSend(v4, "isCarPlayDevice"))
    {
      sharedBluetoothSettingsLogComponent();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_22F721000, v5, OS_LOG_TYPE_DEFAULT, "Unpaired classic CarPlay, no CarPlay setup: %@", (uint8_t *)&v10, 0xCu);
      }
      v6 = 0;
      goto LABEL_19;
    }
    if (-[BTSDevicesController isLECarPlayEnabled](self, "isLECarPlayEnabled"))
    {
      -[BTSDevicesController getLECarPlay:](self, "getLECarPlay:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        sharedBluetoothSettingsLogComponent();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 138412290;
          v11 = v4;
          v7 = "Paired classic device with LE CarPlay: %@";
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
LABEL_20:
    v6 = 0;
    goto LABEL_21;
  }
  if (!-[BTSDevicesController isLECarPlayEnabled](self, "isLECarPlayEnabled")
    || !objc_msgSend(v4, "isCarPlayDevice"))
  {
    goto LABEL_20;
  }
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    v7 = "LE only CarPlay: %@";
LABEL_17:
    _os_log_impl(&dword_22F721000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
  }
LABEL_18:
  v6 = 1;
LABEL_19:

LABEL_21:
  return v6;
}

- (BOOL)isLECarPlayEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("EnableBLE"), CFSTR("com.apple.carplay"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (BOOL)isCarPlaySetupEnabled
{
  id v2;
  void *v3;
  char v4;

  v2 = objc_alloc_init(MEMORY[0x24BE15260]);
  objc_msgSend(v2, "isCarPlaySetupEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)startOutgoingCarPlaySetup:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _BYTE buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDevicesController allowBluetoothConnections:](self, "allowBluetoothConnections:", 0);
    sharedBluetoothSettingsLogComponent();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_22F721000, v10, OS_LOG_TYPE_DEFAULT, "CarPlay setup for classic device, %@", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v8);
    objc_copyWeak(&v12, (id *)buf);
    CRStartBluetoothClassicPairing();
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_22F721000, v11, OS_LOG_TYPE_DEFAULT, "CarPlay setup for le device, UUID: %@", buf, 0xCu);
    }

    CRConnectBluetoothLE();
  }

}

void __50__BTSDevicesController_startOutgoingCarPlaySetup___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  id v5;
  _QWORD block[5];
  id v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__BTSDevicesController_startOutgoingCarPlaySetup___block_invoke_2;
  block[3] = &unk_24FCCE310;
  v8 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = WeakRetained;
  v5 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __50__BTSDevicesController_startOutgoingCarPlaySetup___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = *(unsigned __int8 *)(a1 + 48);
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F721000, v3, OS_LOG_TYPE_DEFAULT, "successfully classic CarPlay paired", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22F721000, v3, OS_LOG_TYPE_DEFAULT, "failed to pair classic CarPlay", v7, 2u);
    }

    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "address");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadSpecifierID:", v3);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setBluetoothIsBusy:", 0);
}

void __50__BTSDevicesController_startOutgoingCarPlaySetup___block_invoke_551(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __50__BTSDevicesController_startOutgoingCarPlaySetup___block_invoke_2_552;
  v2[3] = &unk_24FCCE360;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

uint64_t __50__BTSDevicesController_startOutgoingCarPlaySetup___block_invoke_2_552(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  uint8_t *v6;
  __int16 v8;
  __int16 v9;

  v2 = *(unsigned __int8 *)(a1 + 40);
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v9 = 0;
      v5 = "successfully LE CarPlay paired";
      v6 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_22F721000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    v8 = 0;
    v5 = "failed to pair LE CarPlay";
    v6 = (uint8_t *)&v8;
    goto LABEL_6;
  }

  return objc_msgSend(*(id *)(a1 + 32), "setBluetoothIsBusy:", 0);
}

- (void)startIncomingCarPlaySetup:(id)a3 andPasskey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _BYTE buf[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%06u"), objc_msgSend(v6, "unsignedIntValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sharedBluetoothSettingsLogComponent();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_22F721000, v10, OS_LOG_TYPE_DEFAULT, "CarPlay setup for classic device, %@", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, v5);
  objc_copyWeak(&v11, (id *)buf);
  CRConfirmAndContinueBluetoothClassicPairing();
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

void __61__BTSDevicesController_startIncomingCarPlaySetup_andPasskey___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  id v5;
  _QWORD block[5];
  id v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__BTSDevicesController_startIncomingCarPlaySetup_andPasskey___block_invoke_2;
  block[3] = &unk_24FCCE310;
  v8 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = WeakRetained;
  v5 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __61__BTSDevicesController_startIncomingCarPlaySetup_andPasskey___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  void *v5;
  void *v6;
  __int16 v8;
  __int16 v9;

  if (*(_BYTE *)(a1 + 48))
  {
    sharedBluetoothSettingsLogComponent();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v3 = "successfully classic CarPlay paired";
      v4 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl(&dword_22F721000, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
    }
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadSpecifierID:", v6);

    sharedBluetoothSettingsLogComponent();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 0;
      v3 = "failed to pair classic CarPlay";
      v4 = (uint8_t *)&v8;
      goto LABEL_6;
    }
  }

  return objc_msgSend(*(id *)(a1 + 32), "setBluetoothIsBusy:", 0);
}

- (void)migrateHKPairedHealthDevices
{
  void *v3;
  void *v4;
  void *v5;
  HKHealthStore *healthKitStore;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id location;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persistentDomainForName:", CFSTR("com.apple.bluetooth.settings"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("HRM_MIGRATION_COMPLETE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      if (objc_msgSend(MEMORY[0x24BDD3C40], "isHealthDataAvailable"))
      {
        location = 0;
        objc_initWeak(&location, self);
        healthKitStore = self->_healthKitStore;
        v7[0] = MEMORY[0x24BDAC760];
        v7[1] = 3221225472;
        v7[2] = __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke;
        v7[3] = &unk_24FCCE3D8;
        objc_copyWeak(&v10, &location);
        v8 = v4;
        v9 = v3;
        -[HKHealthStore healthPeripheralsWithFilter:handler:](healthKitStore, "healthPeripheralsWithFilter:handler:", 1, v7);

        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
      }
    }

  }
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_2;
  v5[3] = &unk_24FCCE3B0;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v9);
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  id obj;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  _QWORD *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  uint8_t v35[4];
  uint64_t v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = a1;
    obj = *(id *)(a1 + 32);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v30;
      v25 = *MEMORY[0x24BDD35B8];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v30 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v10 = (void *)v4[200];
          objc_msgSend(v9, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v11;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "retrievePeripheralsWithIdentifiers:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v14, "tag:", v25);
            objc_msgSend(v14, "setCustomProperty:value:", CFSTR("Fitness"), CFSTR("1"));
            v15 = (void *)v4[201];
            objc_msgSend(v9, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v26[0] = MEMORY[0x24BDAC760];
            v26[1] = 3221225472;
            v26[2] = __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_561;
            v26[3] = &unk_24FCCE388;
            v26[4] = v9;
            v27 = v14;
            v28 = v4;
            objc_msgSend(v15, "getEnabledStatusForPeripheral:withCompletion:", v16, v26);

          }
          else
          {
            sharedBluetoothSettingsLogComponent();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_2_cold_1(v35, v9, &v36, v17);

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v6);
    }

    v18 = (void *)objc_msgSend(*(id *)(v23 + 40), "mutableCopy");
    objc_msgSend(v18, "setObject:forKey:", CFSTR("1"), CFSTR("HRM_MIGRATION_COMPLETE"));
    v19 = *(void **)(v23 + 48);
    v20 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v19, "setPersistentDomain:forName:", v20, CFSTR("com.apple.bluetooth.settings"));

    sharedBluetoothSettingsLogComponent();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(*(id *)(v23 + 32), "count");
      *(_DWORD *)buf = 134217984;
      v34 = v22;
      _os_log_impl(&dword_22F721000, v21, OS_LOG_TYPE_DEFAULT, "HRM migration complete. Migrated %lu devices", buf, 0xCu);
    }

  }
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_561(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  const __CFString *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD *v11;
  id v12;

  if (a3)
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_561_cold_1(a1, v4);

    v5 = *(void **)(a1 + 40);
    v6 = CFSTR("1");
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    if (a2)
      v6 = CFSTR("1");
    else
      v6 = CFSTR("0");
  }
  objc_msgSend(v5, "setCustomProperty:value:", CFSTR("UpdateHealth"), v6);
  v7 = *(_QWORD **)(a1 + 48);
  v8 = (void *)v7[201];
  v9 = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_564;
  v10[3] = &unk_24FCCE388;
  v10[4] = v9;
  v11 = v7;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v8, "removeHealthServicePairing:withCompletion:", v9, v10);

}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_564_cold_1(a1, v6);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_DEFAULT, "Successfully migrated HRM device from HK to BT for identifier %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "_getDeviceForPeripheral:", *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setHealthDevice:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1616), "addObject:", v10);
    }
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_565;
    v11[3] = &unk_24FCCDF90;
    v12 = *(id *)(a1 + 40);
    v13 = v10;
    v6 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], v11);

  }
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_565(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + (int)*MEMORY[0x24BE756E0]))
  {
    v3 = *(void **)(v1 + 1440);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(*(id *)(a1 + 32), "_addDevice:", *(_QWORD *)(a1 + 40));
  }
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (__CFUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(__CFUserNotification *)a3
{
  self->_notification = a3;
}

- (int)bluetoothSettingsAppStateNotifyToken
{
  return self->_bluetoothSettingsAppStateNotifyToken;
}

- (void)setBluetoothSettingsAppStateNotifyToken:(int)a3
{
  self->_bluetoothSettingsAppStateNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSetupDeviceID, 0);
  objc_storeStrong((id *)&self->_knownDADevices, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_invokingClientID, 0);
  objc_storeStrong((id *)&self->_deviceAccessSession, 0);
  objc_storeStrong((id *)&self->_exposureNotificationManager, 0);
  objc_storeStrong((id *)&self->_carplayStatus, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);
  objc_storeStrong((id *)&self->_retrievedHealthServices, 0);
  objc_storeStrong((id *)&self->_knownHealthDevices, 0);
  objc_storeStrong((id *)&self->_healthKitStore, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_syncContactsPrivacyAlert, 0);
  objc_storeStrong((id *)&self->_swUpdateAlert, 0);
  objc_storeStrong((id *)&self->_syncContactsCarplayAlert, 0);
  objc_storeStrong((id *)&self->_sspAlert, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_currentDeviceConnectionTimer, 0);
  objc_storeStrong((id *)&self->_currentDeviceSpecifier, 0);
  objc_storeStrong((id *)&self->_restrictionDetail, 0);
  objc_storeStrong((id *)&self->_healthServices, 0);
  objc_storeStrong((id *)&self->_connectedHIDDevices, 0);
  objc_storeStrong((id *)&self->_connectedFirmwareUpdateRequiredDevices, 0);
  objc_storeStrong((id *)&self->_connectedPoorBehaviorDevices, 0);
  objc_storeStrong((id *)&self->_pendingDAInfoDevicesDict, 0);
  objc_storeStrong((id *)&self->_deviceAccessDevicesDict, 0);
  objc_storeStrong((id *)&self->_ctkdLeDevicesDict, 0);
  objc_storeStrong((id *)&self->_sharingDevicesDict, 0);
  objc_storeStrong((id *)&self->_devicesDict, 0);
  objc_storeStrong((id *)&self->_pendingOtherRadioDevicesDict, 0);
  objc_storeStrong((id *)&self->_dualRadioCounterpartDevicesDict, 0);
  objc_storeStrong((id *)&self->_ctkdCounterpartDevicesDict, 0);
  objc_storeStrong((id *)&self->_sharingDevicesGroupSpec, 0);
  objc_storeStrong((id *)&self->_otherDevicesGroupSpec, 0);
  objc_storeStrong((id *)&self->_myDevicesGroupSpec, 0);
  objc_storeStrong((id *)&self->supportsBackgroundNIDictionary, 0);
  objc_storeStrong((id *)&self->managedByWalletDictionary, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_11(&dword_22F721000, a1, a3, "Failed to create an BluetoothSettings App state notification token", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_14();
}

void __28__BTSDevicesController_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22F721000, v0, v1, "Failed to retrieve registered health devices with error %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)authenticationRequestHandler:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  v4 = v0;
  OUTLINED_FUNCTION_15(&dword_22F721000, v1, v2, "Ignoring authentication request as there's something pending user interaction: _sspAlert(%@), _alert(%@), _syncContactsCarplayAlert(%@)", v3);
}

- (void)authenticationRequestHandler:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[BTSDevicesController authenticationRequestHandler:]";
  OUTLINED_FUNCTION_0(&dword_22F721000, a1, a3, "%s device notification does not match current device - not forwarding pairing request", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __51__BTSDevicesController_pairingAgent_peerDidUnpair___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_13();
  objc_msgSend((id)OUTLINED_FUNCTION_12(v1), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_22F721000, v0, v3, "Failed to unregister peripheral %@ with error \"%@\", v4);

  OUTLINED_FUNCTION_5();
}

- (void)peripheral:didDiscoverServices:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_22F721000, v0, v1, "Pairing HRM device: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)peripheral:didDiscoverServices:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_22F721000, v0, OS_LOG_TYPE_DEBUG, "Device %@ supports health service(s): %@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)peripheral:didDiscoverServices:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22F721000, v0, v1, "Failed to discover services for device %@ with error \"%@\");
  OUTLINED_FUNCTION_2();
}

void __55__BTSDevicesController_peripheral_didDiscoverServices___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[24];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  v3 = v0;
  OUTLINED_FUNCTION_15(&dword_22F721000, v1, (uint64_t)v1, "Failed to register peripheral %@ for services %@ with error \"%@\", v2);
}

- (void)_getDeviceForPeripheral:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22F721000, log, OS_LOG_TYPE_DEBUG, "CTKD : Apple Watches are special", v1, 2u);
  OUTLINED_FUNCTION_14();
}

- (void)_getDeviceForPeripheral:.cold.2()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  OUTLINED_FUNCTION_13();
  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138413058;
  v5 = v3;
  v6 = 1024;
  v7 = objc_msgSend(v1, "isCTKDDevice");
  v8 = 1024;
  v9 = objc_msgSend(v1, "isManagedByWallet");
  v10 = 1024;
  v11 = objc_msgSend(v1, "isManagedByAliroWallet");
  _os_log_debug_impl(&dword_22F721000, v0, OS_LOG_TYPE_DEBUG, "CTKD : classic device found in list %@ with CTKD : %d with ManagedByWallet: %d ManagedByAliroWallet: %d", (uint8_t *)&v4, 0x1Eu);

}

- (void)_getDeviceForCTKDPeripheral:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22F721000, v0, v1, "CTKD : Classic CTKD device not found in device list : %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_addDeviceSpecifier:withDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_13();
  v3 = v2;
  v12 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(v2, "isMyDevice"))
    v4 = "known";
  else
    v4 = "other";
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315650;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  v10 = 2048;
  v11 = v1;
  _os_log_debug_impl(&dword_22F721000, v0, OS_LOG_TYPE_DEBUG, "Adding \"%s\" device %@ at index %lu", (uint8_t *)&v6, 0x20u);

}

- (void)healthDeviceUnregisteredHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_22F721000, v0, v1, "Unregistering health device %@", v2);
  OUTLINED_FUNCTION_2();
}

void __44__BTSDevicesController__updateHealthDevices__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22F721000, a2, v4, "Error retrieving Fitness peripherals: %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)_updateDevicePosition:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_22F721000, a2, v4, "Updating position of device %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)tableView:accessoryButtonTappedForRowWithIndexPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_3();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_1(&dword_22F721000, v0, v1, "Invalid rowIndex : %ld\t myDevicesGroupIndex:%ld", v2, v3);
  OUTLINED_FUNCTION_2();
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_22F721000, a2, v4, "Device %@ is already connected. No further action to be taken.", v5);

  OUTLINED_FUNCTION_8();
}

- (void)tableView:viewForFooterInSection:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22F721000, v0, v1, "bad format string for devices table view (B) (%@): %@");
  OUTLINED_FUNCTION_2();
}

- (void)tableView:viewForFooterInSection:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22F721000, v0, v1, "bad format string for devices table view (A) (%@): %@");
  OUTLINED_FUNCTION_2();
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_2_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;
  void *v8;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_error_impl(&dword_22F721000, a4, OS_LOG_TYPE_ERROR, "Failed to migrate HealthKit HRM with identifier %@. CBPeripheral does not exist", a1, 0xCu);

}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_561_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_12(a1), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22F721000, a2, v5, "Failed to get HKHealthService enabled status during HRM migration for identifier %@", v6);

  OUTLINED_FUNCTION_5();
}

void __52__BTSDevicesController_migrateHKPairedHealthDevices__block_invoke_564_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_12(a1), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22F721000, a2, v5, "Failed to remove HKHealthService pairing during HRM migration for identifier %@", v6);

  OUTLINED_FUNCTION_5();
}

@end
