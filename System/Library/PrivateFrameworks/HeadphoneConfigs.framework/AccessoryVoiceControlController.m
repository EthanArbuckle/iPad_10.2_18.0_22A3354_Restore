@implementation AccessoryVoiceControlController

- (AccessoryVoiceControlController)init
{
  AccessoryVoiceControlController *v2;
  AccessoryVoiceControlController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AccessoryVoiceControlController;
  v2 = -[AccessoryVoiceControlController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_BYTE *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80578]) = 0;
    v2->_dismissed = 0;
    v2->_volumeControlEnabled = 0;
    v2->_setEnableVolumeControlAtStart = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_deviceRemoved_, *MEMORY[0x1E0D033E0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel_deviceDisconnectedHandler_, *MEMORY[0x1E0D033B8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_deviceDisconnectedHandler_, *MEMORY[0x1E0D033C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel_powerChangedHandler_, *MEMORY[0x1E0D03390], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  BluetoothDeviceProtocol *currentDevice;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  currentDevice = self->_currentDevice;
  self->_currentDevice = 0;

  v5.receiver = self;
  v5.super_class = (Class)AccessoryVoiceControlController;
  -[AccessoryVoiceControlController dealloc](&v5, sel_dealloc);
}

- (id)specifiers
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *volumeControlSpecifiers;
  void *v7;
  void *v8;
  BluetoothDeviceProtocol *v9;
  BluetoothDeviceProtocol *currentDevice;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  BluetoothDeviceProtocol *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  unint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  objc_class *v100;
  uint64_t v101;
  void *v102;
  id v103;
  uint64_t v105;
  uint64_t v106;
  unsigned int v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  objc_super v116;
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[2];
  void *v120;
  void *v121;
  _QWORD v122[3];

  v122[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v116.receiver = self;
  v116.super_class = (Class)AccessoryVoiceControlController;
  -[AccessoryVoiceControlController specifiers](&v116, sel_specifiers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  volumeControlSpecifiers = self->_volumeControlSpecifiers;
  self->_volumeControlSpecifiers = v5;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HPSDevice deviceKey](HPSDevice, "deviceKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (BluetoothDeviceProtocol *)objc_claimAutoreleasedReturnValue();
  currentDevice = self->_currentDevice;
  self->_currentDevice = v9;

  -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v11, "productId");

  v115 = 0;
  -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clickHoldMode:rightAction:", (char *)&v115 + 4, &v115);

  v13 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HIDWORD(v115));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v115);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, CFSTR("pressHoldLeftBudValue"), v15, CFSTR("pressHoldRightBudValue"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = (void *)v16;
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("BTAccessoryPressAndHoldModeSelected"), 0, v16);

  v18 = HIDWORD(v115);
  if (!HIDWORD(v115) || (v19 = v115) == 0)
  {
    -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setClickHoldMode:rightMode:", 5, 5);

    -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "clickHoldMode:rightAction:", (char *)&v115 + 4, &v115);

    v19 = v115;
    v18 = HIDWORD(v115);
  }
  v22 = 1;
  if ((v18 & 0xFFFFFFFE) == 6 || v19 == 6 || v19 == 7 || (v22 = 0, (v18 & 0xFFFFFFFB) == 1) || v19 == 5 || v19 == 1)
    self->_setEnableVolumeControlAtStart = v22;
  v23 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", &stru_1EA29D890, &stru_1EA29D890, CFSTR("DeviceConfig"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, self, 0, 0, 0, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("VOLUME_CONTROL_FOOTER"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = objc_msgSend(v29, "productId");

  if ((_DWORD)v24 == 8209)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("VOLUME_CONTROL_FOOTER"), &stru_1EA29D890, CFSTR("DeviceConfig-B507"));
    v31 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v31;
  }
  -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "productId");

  if (v33 == 8214)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("VOLUME_CONTROL_FOOTER"), &stru_1EA29D890, CFSTR("DeviceConfig-B607"));
    v35 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v35;
  }
  -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "productId");

  if (v37 == 8218)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("VOLUME_CONTROL_FOOTER"), &stru_1EA29D890, CFSTR("DeviceConfig-B487"));
    v39 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v39;
  }
  -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "productId");

  if (v41 == 8230)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("VOLUME_CONTROL_FOOTER"), &stru_1EA29D890, CFSTR("DeviceConfig-B463"));
    v43 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v43;
  }
  objc_msgSend(v26, "setProperty:forKey:", v28, *MEMORY[0x1E0D80848]);
  v112 = v26;
  -[NSMutableArray addObject:](self->_volumeControlSpecifiers, "addObject:", v26);
  v44 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("VOLUME_CONTROL"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v46, self, sel_setVolumeControlEnabled_specifier_, sel_getVolumeControlEnabled_, 0, 6, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "setIdentifier:", CFSTR("VOLUME_CONTROL_ID"));
  v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v49 = self->_currentDevice;
  +[HPSDevice deviceKey](HPSDevice, "deviceKey");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setObject:forKey:", v49, v50);

  v110 = v48;
  objc_msgSend(v47, "setUserInfo:", v48);
  -[AccessoryVoiceControlController reloadSpecifier:](self, "reloadSpecifier:", v47);
  -[NSMutableArray addObject:](self->_volumeControlSpecifiers, "addObject:", v47);
  v51 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "localizedStringForKey:value:table:", &stru_1EA29D890, &stru_1EA29D890, CFSTR("DeviceConfig"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v53, self, 0, 0, 0, 0, 0);
  v54 = objc_claimAutoreleasedReturnValue();

  v109 = (void *)v54;
  -[NSMutableArray addObject:](self->_volumeControlSpecifiers, "addObject:", v54);
  +[HPSProductUtils getProductSpecificString:descriptionKey:](HPSProductUtils, "getProductSpecificString:descriptionKey:", v107, CFSTR("LEFT_BUD"));
  v55 = objc_claimAutoreleasedReturnValue();
  +[HPSProductUtils getProductSpecificString:descriptionKey:](HPSProductUtils, "getProductSpecificString:descriptionKey:", v107, CFSTR("RIGHT_BUD"));
  v114 = (void *)v55;
  v111 = v28;
  v108 = objc_claimAutoreleasedReturnValue();
  if (-[AccessoryVoiceControlController isVolumeControlEnabled](self, "isVolumeControlEnabled"))
  {
    v56 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("VOLUME_UP"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("VOLUME_DOWN"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v56, "initWithObjects:", v58, v60, 0);

    v61 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)objc_msgSend(v61, "initWithObjects:", v62, v63, 0);

    v65 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("VOLUME_UP"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("VOLUME_DOWN"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)objc_msgSend(v65, "initWithObjects:", v67, v69, 0);

    v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v71, "setObject:forKey:", self->_currentDevice, CFSTR("bt-device"));
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v114, self, sel_setGestureMode_specifier_, sel_clickHoldModeLeft, objc_opt_class(), 2, 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setIdentifier:", CFSTR("LEFT_ID"));
    v73 = (void *)v105;
    objc_msgSend(v72, "setValues:titles:shortTitles:", v64, v105, v70);
    objc_msgSend(v72, "setUserInfo:", v71);
    -[NSMutableArray addObject:](self->_volumeControlSpecifiers, "addObject:", v72);
    v74 = (void *)MEMORY[0x1E0D804E8];
    v75 = 0x1E0C99000;
    v76 = objc_opt_class();
    v77 = v74;
    v78 = (void *)v108;
    objc_msgSend(v77, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v108, self, sel_setGestureMode_specifier_, sel_clickHoldModeRight, v76, 2, 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setIdentifier:", CFSTR("RIGHT_ID"));
    objc_msgSend(v79, "setValues:titles:shortTitles:", v64, v105, v70);
    objc_msgSend(v79, "setUserInfo:", v71);
  }
  else
  {
    -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "productId");

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v82;
    if (v81 == 8230)
    {
      objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("SIRI"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v122[0] = v84;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 1);
      v106 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v85;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "localizedStringForKey:value:table:", CFSTR("SIRI"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = v87;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("NOISE_CONTROL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v119[0] = v88;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("SIRI"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v119[1] = v90;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
      v106 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = v91;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v118[1] = v92;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 2);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "localizedStringForKey:value:table:", CFSTR("NOISE_CONTROL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v117[0] = v87;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "localizedStringForKey:value:table:", CFSTR("SIRI"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v117[1] = v94;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    +[HPSDevice deviceKey](HPSDevice, "deviceKey");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setObject:forKey:", v95, v96);

    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v114, self, sel_setGestureMode_specifier_, sel_clickHoldModeLeft, objc_opt_class(), 2, 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setIdentifier:", CFSTR("LEFT_ID"));
    v73 = (void *)v106;
    objc_msgSend(v72, "setValues:titles:shortTitles:", v64, v106, v70);
    objc_msgSend(v72, "setUserInfo:", v71);
    -[NSMutableArray addObject:](self->_volumeControlSpecifiers, "addObject:", v72);
    v97 = (void *)MEMORY[0x1E0D804E8];
    v98 = objc_opt_class();
    v99 = v97;
    v78 = (void *)v108;
    objc_msgSend(v99, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v108, self, sel_setGestureMode_specifier_, sel_clickHoldModeRight, v98, 2, 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setIdentifier:", CFSTR("RIGHT_ID"));
    objc_msgSend(v79, "setValues:titles:shortTitles:", v64, v106, v70);
    objc_msgSend(v79, "setUserInfo:", v71);
    v75 = 0x1E0C99000uLL;
  }
  -[NSMutableArray addObject:](self->_volumeControlSpecifiers, "addObject:", v79);

  objc_msgSend(*(id *)(v75 + 3360), "arrayWithArray:", self->_volumeControlSpecifiers);
  v100 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v101 = (int)*MEMORY[0x1E0D80590];
  v102 = *(Class *)((char *)&self->super.super.super.super.super.isa + v101);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v101) = v100;

  v103 = *(id *)((char *)&self->super.super.super.super.super.isa + v101);
  return v103;
}

- (BOOL)isVolumeControlEnabled
{
  return self->_volumeControlEnabled || self->_setEnableVolumeControlAtStart;
}

- (id)getVolumeControlEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AccessoryVoiceControlController isVolumeControlEnabled](self, "isVolumeControlEnabled", a3));
}

- (void)setVolumeControlEnabled:(id)a3 specifier:(id)a4
{
  void *v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  NSObject *v10;
  _BOOL4 volumeControlEnabled;
  int v12;
  int v13;
  BOOL v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint8_t buf[4];
  _BOOL4 v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  self->_volumeControlEnabled = objc_msgSend(a3, "BOOLValue");
  v23 = 0;
  v24 = 0;
  -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clickHoldModes:", &v23);

  v6 = v23;
  v7 = HIDWORD(v23);
  v8 = v24;
  v9 = HIDWORD(v24);
  sharedBluetoothSettingsLogComponent();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    volumeControlEnabled = self->_volumeControlEnabled;
    *(_DWORD *)buf = 67110144;
    v26 = volumeControlEnabled;
    v27 = 1024;
    v28 = v7;
    v29 = 1024;
    v30 = v6;
    v31 = 1024;
    v32 = v9;
    v33 = 1024;
    v34 = v8;
    _os_log_impl(&dword_1DB30C000, v10, OS_LOG_TYPE_DEFAULT, "Volume Control: gestures before setting : _volumeControlEnabled %d left %d, right %d prevLeft %d, prevRight %d", buf, 0x20u);
  }

  if (self->_volumeControlEnabled)
  {
    v13 = v24;
    v12 = HIDWORD(v24);
    if (HIDWORD(v24))
      v14 = (_DWORD)v24 == 0;
    else
      v14 = 1;
    if (v14)
    {
      v12 = 7;
      v13 = 6;
    }
    v23 = __PAIR64__(v12, v13);
    sharedBluetoothSettingsLogComponent();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_volumeControlEnabled;
      *(_DWORD *)buf = 67110144;
      v26 = v16;
      v27 = 1024;
      v28 = HIDWORD(v23);
      v29 = 1024;
      v30 = v23;
      v31 = 1024;
      v32 = HIDWORD(v24);
      v33 = 1024;
      v34 = v24;
      _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "Volume Control: gestures after setting : _volumeControlEnabled %d left %d, right %d prevLeft %d, prevRight %d", buf, 0x20u);
    }

    v24 = __PAIR64__(v7, v6);
  }
  else
  {
    -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "productId");

    if (v18 == 8230)
      v19 = 1;
    else
      v19 = 5;
    LODWORD(v23) = v19;
    HIDWORD(v23) = v19;
    v24 = __PAIR64__(v7, v6);
    sharedBluetoothSettingsLogComponent();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_volumeControlEnabled;
      *(_DWORD *)buf = 67110144;
      v26 = v21;
      v27 = 1024;
      v28 = HIDWORD(v23);
      v29 = 1024;
      v30 = v23;
      v31 = 1024;
      v32 = HIDWORD(v24);
      v33 = 1024;
      v34 = v24;
      _os_log_impl(&dword_1DB30C000, v20, OS_LOG_TYPE_DEFAULT, "Volume Control: gestures after setting : _volumeControlEnabled %d left %d, right %d prevLeft %d, prevRight %d", buf, 0x20u);
    }

  }
  -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClickHoldModes:", v23, v24);

  -[AccessoryVoiceControlController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_reloadSpecifiers, 0, 0.5);
}

- (id)clickHoldModeLeft
{
  void *v2;
  uint64_t v4;

  v4 = 0;
  -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clickHoldMode:rightAction:", (char *)&v4 + 4, &v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v4));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)clickHoldModeRight
{
  void *v2;
  uint64_t v4;

  v4 = 0;
  -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clickHoldMode:rightAction:", (char *)&v4 + 4, &v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setGestureMode:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clickHoldMode:rightAction:", (char *)&v18 + 4, &v18);

  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("LEFT_ID"));

  if (v10)
  {
    -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "intValue");
    v13 = v18;
    v14 = v11;
LABEL_5:
    objc_msgSend(v14, "setClickHoldMode:rightMode:", v12, v13);

    goto LABEL_6;
  }
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("RIGHT_ID"));

  if (v16)
  {
    -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HIDWORD(v18);
    v13 = objc_msgSend(v6, "intValue");
    v14 = v11;
    v12 = v17;
    goto LABEL_5;
  }
LABEL_6:
  -[AccessoryVoiceControlController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_reloadSpecifiers, 0, 0.5);

}

- (void)deviceDisconnectedHandler:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 dismissed;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDeviceProtocol identifier](self->_currentDevice, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {
    dismissed = self->_dismissed;

    if (!dismissed)
      -[AccessoryVoiceControlController dismissPressAndHold](self, "dismissPressAndHold");
  }
  else
  {

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

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
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
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "Received %@ with power state %s", (uint8_t *)&v11, 0x16u);

  }
  -[AccessoryVoiceControlController dismissPressAndHold](self, "dismissPressAndHold");

}

- (void)deviceRemoved:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 dismissed;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDeviceProtocol identifier](self->_currentDevice, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {
    dismissed = self->_dismissed;

    if (!dismissed)
      -[AccessoryVoiceControlController dismissPressAndHold](self, "dismissPressAndHold");
  }
  else
  {

  }
}

- (void)dismissPressAndHold
{
  id v2;
  id v3;

  self->_dismissed = 1;
  -[AccessoryVoiceControlController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_volumeControlSpecifiers, 0);
}

@end
