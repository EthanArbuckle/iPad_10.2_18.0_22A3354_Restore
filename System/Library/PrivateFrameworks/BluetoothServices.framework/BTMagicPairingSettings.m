@implementation BTMagicPairingSettings

+ (id)magicSettingsWithBluetoothAddress:(id)a3
{
  id v3;
  BTMagicPairingSettings *v4;

  v3 = a3;
  v4 = -[BTMagicPairingSettings initWithBluetoothAddress:]([BTMagicPairingSettings alloc], "initWithBluetoothAddress:", v3);

  return v4;
}

- (BTMagicPairingSettings)initWithBluetoothAddress:(id)a3
{
  id v4;
  BTMagicPairingSettings *v5;
  BTMagicPairingSettings *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BTMagicPairingSettings;
  v5 = -[BTMagicPairingSettings init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[BTMagicPairingSettings setBluetoothAddress:](v5, "setBluetoothAddress:", v4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v29;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;

  v4 = a3;
  -[BTMagicPairingSettings bluetoothAddress](self, "bluetoothAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bluetoothAddress);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[BTMagicPairingSettings name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[BTMagicPairingSettings masterHint](self, "masterHint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_masterHint);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[BTMagicPairingSettings masterKey](self, "masterKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_masterKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[BTMagicPairingSettings accessoryHint](self, "accessoryHint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accessoryHint);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[BTMagicPairingSettings accessoryKey](self, "accessoryKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accessoryKey);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[BTMagicPairingSettings buttonModes](self, "buttonModes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_buttonModes);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  -[BTMagicPairingSettings color](self, "color");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_color);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v20);

  -[BTMagicPairingSettings deviceIDFeatureBitsV1](self, "deviceIDFeatureBitsV1");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deviceIDFeatureBitsV1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, v22);

  -[BTMagicPairingSettings deviceIDFeatureBitsV2](self, "deviceIDFeatureBitsV2");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deviceIDFeatureBitsV2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, v24);

  -[BTMagicPairingSettings encryptionKey](self, "encryptionKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_encryptionKey);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

  -[BTMagicPairingSettings irk](self, "irk");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector("irk");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, v28);

  -[BTMagicPairingSettings listeningServices](self, "listeningServices");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_listeningServices);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, v30);

  -[BTMagicPairingSettings listeningServicesV2](self, "listeningServicesV2");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_listeningServicesV2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, v32);

  -[BTMagicPairingSettings optimizedBatteryCharging](self, "optimizedBatteryCharging");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_optimizedBatteryCharging);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, v34);

  -[BTMagicPairingSettings optimizedBatteryFullChargeDeadline](self, "optimizedBatteryFullChargeDeadline");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_optimizedBatteryFullChargeDeadline);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v35, v36);

  -[BTMagicPairingSettings ratchet](self, "ratchet");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ratchet);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v37, v38);

  -[BTMagicPairingSettings reserved](self, "reserved");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_reserved);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v39, v40);

  -[BTMagicPairingSettings settingsMask](self, "settingsMask");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_settingsMask);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v41, v42);

  -[BTMagicPairingSettings supportedServices](self, "supportedServices");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_supportedServices);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v43, v44);

  -[BTMagicPairingSettings version](self, "version");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_version);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v45, v46);

  -[BTMagicPairingSettings vendorID](self, "vendorID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_vendorID);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v47, v48);

  -[BTMagicPairingSettings productID](self, "productID");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_productID);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v50, v49);

}

- (BTMagicPairingSettings)initWithCoder:(id)a3
{
  id v4;
  BTMagicPairingSettings *v5;
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
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  BTMagicPairingSettings *v75;
  objc_super v77;

  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)BTMagicPairingSettings;
  v5 = -[BTMagicPairingSettings init](&v77, sel_init);
  if (!v5)
    goto LABEL_4;
  v6 = objc_opt_class();
  NSStringFromSelector(sel_bluetoothAddress);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BTMagicPairingSettings setBluetoothAddress:](v5, "setBluetoothAddress:", v8);
    v9 = objc_opt_class();
    NSStringFromSelector(sel_name);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setName:](v5, "setName:", v11);

    v12 = objc_opt_class();
    NSStringFromSelector(sel_masterHint);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setMasterHint:](v5, "setMasterHint:", v14);

    v15 = objc_opt_class();
    NSStringFromSelector(sel_masterKey);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setMasterKey:](v5, "setMasterKey:", v17);

    v18 = objc_opt_class();
    NSStringFromSelector(sel_accessoryHint);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setAccessoryHint:](v5, "setAccessoryHint:", v20);

    v21 = objc_opt_class();
    NSStringFromSelector(sel_accessoryKey);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setAccessoryKey:](v5, "setAccessoryKey:", v23);

    v24 = objc_opt_class();
    NSStringFromSelector(sel_buttonModes);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setButtonModes:](v5, "setButtonModes:", v26);

    v27 = objc_opt_class();
    NSStringFromSelector(sel_color);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setColor:](v5, "setColor:", v29);

    v30 = objc_opt_class();
    NSStringFromSelector(sel_deviceIDFeatureBitsV1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setDeviceIDFeatureBitsV1:](v5, "setDeviceIDFeatureBitsV1:", v32);

    v33 = objc_opt_class();
    NSStringFromSelector(sel_deviceIDFeatureBitsV2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setDeviceIDFeatureBitsV2:](v5, "setDeviceIDFeatureBitsV2:", v35);

    v36 = objc_opt_class();
    NSStringFromSelector(sel_encryptionKey);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setEncryptionKey:](v5, "setEncryptionKey:", v38);

    v39 = objc_opt_class();
    NSStringFromSelector("irk");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setIrk:](v5, "setIrk:", v41);

    v42 = objc_opt_class();
    NSStringFromSelector(sel_listeningServices);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setListeningServices:](v5, "setListeningServices:", v44);

    v45 = objc_opt_class();
    NSStringFromSelector(sel_listeningServicesV2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setListeningServicesV2:](v5, "setListeningServicesV2:", v47);

    v48 = objc_opt_class();
    NSStringFromSelector(sel_optimizedBatteryCharging);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setOptimizedBatteryCharging:](v5, "setOptimizedBatteryCharging:", v50);

    v51 = objc_opt_class();
    NSStringFromSelector(sel_optimizedBatteryFullChargeDeadline);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setOptimizedBatteryFullChargeDeadline:](v5, "setOptimizedBatteryFullChargeDeadline:", v53);

    v54 = objc_opt_class();
    NSStringFromSelector(sel_ratchet);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setRatchet:](v5, "setRatchet:", v56);

    v57 = objc_opt_class();
    NSStringFromSelector(sel_reserved);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setReserved:](v5, "setReserved:", v59);

    v60 = objc_opt_class();
    NSStringFromSelector(sel_settingsMask);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setSettingsMask:](v5, "setSettingsMask:", v62);

    v63 = objc_opt_class();
    NSStringFromSelector(sel_supportedServices);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setSupportedServices:](v5, "setSupportedServices:", v65);

    v66 = objc_opt_class();
    NSStringFromSelector(sel_version);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setVersion:](v5, "setVersion:", v68);

    v69 = objc_opt_class();
    NSStringFromSelector(sel_vendorID);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setVendorID:](v5, "setVendorID:", v71);

    v72 = objc_opt_class();
    NSStringFromSelector(sel_productID);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings setProductID:](v5, "setProductID:", v74);

LABEL_4:
    v75 = v5;
    goto LABEL_10;
  }
  if (gLogCategory_BTCloudDevice <= 90 && (gLogCategory_BTCloudDevice != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v75 = 0;
LABEL_10:

  return v75;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v3 = IsAppleInternalBuild();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[BTMagicPairingSettings bluetoothAddress](self, "bluetoothAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTMagicPairingSettings name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  if (v3)
  {
    -[BTMagicPairingSettings name](self, "name");
    v26 = objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings productID](self, "productID");
    v24 = objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings vendorID](self, "vendorID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings masterKey](self, "masterKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings accessoryKey](self, "accessoryKey");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings masterHint](self, "masterHint");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings accessoryHint](self, "accessoryHint");
    v22 = v7;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings irk](self, "irk");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings encryptionKey](self, "encryptionKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings version](self, "version");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings color](self, "color");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings ratchet](self, "ratchet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings buttonModes](self, "buttonModes");
    v36 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings deviceIDFeatureBitsV1](self, "deviceIDFeatureBitsV1");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings deviceIDFeatureBitsV2](self, "deviceIDFeatureBitsV2");
    v27 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings listeningServices](self, "listeningServices");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings listeningServicesV2](self, "listeningServicesV2");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings settingsMask](self, "settingsMask");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings supportedServices](self, "supportedServices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings optimizedBatteryCharging](self, "optimizedBatteryCharging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings optimizedBatteryFullChargeDeadline](self, "optimizedBatteryFullChargeDeadline");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)v24;
    v16 = (void *)v26;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("BTMagicPairingSettings[%@]: Name(%ld): %@, PID: %@, VID: %@, MainKey: %@, AccKey: %@, MainHint: %@, AccHint: %@, IRK: %@, Enc: %@, V: %@, C: %@, R: %@, BM: %@, DID1: %@, DID2: %@, LS: %@, LSv2: %@, S: %@, SS: %@, OBC: %@-%@"), v36, v22, v26, v24, v35, v23, v34, v33, v32, v31, v30, v29, v28, v21, v8, v20,
      v9,
      v19,
      v10,
      v11,
      v12,
      v13,
      v14);
    v25 = objc_claimAutoreleasedReturnValue();

    v6 = v27;
    v5 = v36;

    v17 = (void *)v25;
  }
  else
  {
    -[BTMagicPairingSettings productID](self, "productID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTMagicPairingSettings vendorID](self, "vendorID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("BTMagicPairingSettings[%@]: Name(%ld), PID: %@, VID: %@"), v5, v7, v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothAddress, a3);
}

- (NSData)masterKey
{
  return self->_masterKey;
}

- (void)setMasterKey:(id)a3
{
  objc_storeStrong((id *)&self->_masterKey, a3);
}

- (NSData)masterHint
{
  return self->_masterHint;
}

- (void)setMasterHint:(id)a3
{
  objc_storeStrong((id *)&self->_masterHint, a3);
}

- (NSData)accessoryKey
{
  return self->_accessoryKey;
}

- (void)setAccessoryKey:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryKey, a3);
}

- (NSData)accessoryHint
{
  return self->_accessoryHint;
}

- (void)setAccessoryHint:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryHint, a3);
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionKey, a3);
}

- (NSData)irk
{
  return self->_irk;
}

- (void)setIrk:(id)a3
{
  objc_storeStrong((id *)&self->_irk, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
  objc_storeStrong((id *)&self->_productID, a3);
}

- (NSString)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
  objc_storeStrong((id *)&self->_vendorID, a3);
}

- (NSString)buttonModes
{
  return self->_buttonModes;
}

- (void)setButtonModes:(id)a3
{
  objc_storeStrong((id *)&self->_buttonModes, a3);
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (NSString)deviceIDFeatureBitsV1
{
  return self->_deviceIDFeatureBitsV1;
}

- (void)setDeviceIDFeatureBitsV1:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIDFeatureBitsV1, a3);
}

- (NSString)deviceIDFeatureBitsV2
{
  return self->_deviceIDFeatureBitsV2;
}

- (void)setDeviceIDFeatureBitsV2:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIDFeatureBitsV2, a3);
}

- (NSString)listeningServices
{
  return self->_listeningServices;
}

- (void)setListeningServices:(id)a3
{
  objc_storeStrong((id *)&self->_listeningServices, a3);
}

- (NSString)listeningServicesV2
{
  return self->_listeningServicesV2;
}

- (void)setListeningServicesV2:(id)a3
{
  objc_storeStrong((id *)&self->_listeningServicesV2, a3);
}

- (NSString)spatialAudio
{
  return self->_spatialAudio;
}

- (void)setSpatialAudio:(id)a3
{
  objc_storeStrong((id *)&self->_spatialAudio, a3);
}

- (NSString)optimizedBatteryCharging
{
  return self->_optimizedBatteryCharging;
}

- (void)setOptimizedBatteryCharging:(id)a3
{
  objc_storeStrong((id *)&self->_optimizedBatteryCharging, a3);
}

- (NSString)optimizedBatteryFullChargeDeadline
{
  return self->_optimizedBatteryFullChargeDeadline;
}

- (void)setOptimizedBatteryFullChargeDeadline:(id)a3
{
  objc_storeStrong((id *)&self->_optimizedBatteryFullChargeDeadline, a3);
}

- (NSString)ratchet
{
  return self->_ratchet;
}

- (void)setRatchet:(id)a3
{
  objc_storeStrong((id *)&self->_ratchet, a3);
}

- (NSString)reserved
{
  return self->_reserved;
}

- (void)setReserved:(id)a3
{
  objc_storeStrong((id *)&self->_reserved, a3);
}

- (NSString)settingsMask
{
  return self->_settingsMask;
}

- (void)setSettingsMask:(id)a3
{
  objc_storeStrong((id *)&self->_settingsMask, a3);
}

- (NSString)supportedServices
{
  return self->_supportedServices;
}

- (void)setSupportedServices:(id)a3
{
  objc_storeStrong((id *)&self->_supportedServices, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_supportedServices, 0);
  objc_storeStrong((id *)&self->_settingsMask, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_ratchet, 0);
  objc_storeStrong((id *)&self->_optimizedBatteryFullChargeDeadline, 0);
  objc_storeStrong((id *)&self->_optimizedBatteryCharging, 0);
  objc_storeStrong((id *)&self->_spatialAudio, 0);
  objc_storeStrong((id *)&self->_listeningServicesV2, 0);
  objc_storeStrong((id *)&self->_listeningServices, 0);
  objc_storeStrong((id *)&self->_deviceIDFeatureBitsV2, 0);
  objc_storeStrong((id *)&self->_deviceIDFeatureBitsV1, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_buttonModes, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_irk, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_accessoryHint, 0);
  objc_storeStrong((id *)&self->_accessoryKey, 0);
  objc_storeStrong((id *)&self->_masterHint, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end
