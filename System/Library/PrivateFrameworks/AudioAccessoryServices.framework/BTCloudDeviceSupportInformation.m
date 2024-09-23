@implementation BTCloudDeviceSupportInformation

+ (id)deviceSupportInformationWithBluetoothAddress:(id)a3
{
  id v3;
  BTCloudDeviceSupportInformation *v4;

  v3 = a3;
  v4 = -[BTCloudDeviceSupportInformation initWithBluetoothAddress:]([BTCloudDeviceSupportInformation alloc], "initWithBluetoothAddress:", v3);

  return v4;
}

- (BTCloudDeviceSupportInformation)initWithBluetoothAddress:(id)a3
{
  id v4;
  BTCloudDeviceSupportInformation *v5;
  BTCloudDeviceSupportInformation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BTCloudDeviceSupportInformation;
  v5 = -[BTCloudDeviceSupportInformation init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[BTCloudDeviceSupportInformation setBluetoothAddress:](v5, "setBluetoothAddress:", v4);

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
  id v22;

  v4 = a3;
  -[BTCloudDeviceSupportInformation bluetoothAddress](self, "bluetoothAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bluetoothAddress);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[BTCloudDeviceSupportInformation ancAssetVersion](self, "ancAssetVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ancAssetVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[BTCloudDeviceSupportInformation budsFirmwareVersion](self, "budsFirmwareVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_budsFirmwareVersion);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[BTCloudDeviceSupportInformation caseName](self, "caseName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_caseName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[BTCloudDeviceSupportInformation caseFirmwareVersion](self, "caseFirmwareVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_caseFirmwareVersion);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[BTCloudDeviceSupportInformation caseSerialNumber](self, "caseSerialNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_caseSerialNumber);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[BTCloudDeviceSupportInformation hardwareVersion](self, "hardwareVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hardwareVersion);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  -[BTCloudDeviceSupportInformation leftBudSerialNumber](self, "leftBudSerialNumber");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_leftBudSerialNumber);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v20);

  -[BTCloudDeviceSupportInformation rightBudSerialNumber](self, "rightBudSerialNumber");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_rightBudSerialNumber);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, v21);

}

- (BTCloudDeviceSupportInformation)initWithCoder:(id)a3
{
  id v4;
  BTCloudDeviceSupportInformation *v5;
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
  BTCloudDeviceSupportInformation *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BTCloudDeviceSupportInformation;
  v5 = -[BTCloudDeviceSupportInformation init](&v35, sel_init);
  if (!v5)
    goto LABEL_4;
  v6 = objc_opt_class();
  NSStringFromSelector(sel_bluetoothAddress);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BTCloudDeviceSupportInformation setBluetoothAddress:](v5, "setBluetoothAddress:", v8);
    v9 = objc_opt_class();
    NSStringFromSelector(sel_ancAssetVersion);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDeviceSupportInformation setAncAssetVersion:](v5, "setAncAssetVersion:", v11);

    v12 = objc_opt_class();
    NSStringFromSelector(sel_budsFirmwareVersion);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDeviceSupportInformation setBudsFirmwareVersion:](v5, "setBudsFirmwareVersion:", v14);

    v15 = objc_opt_class();
    NSStringFromSelector(sel_caseName);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDeviceSupportInformation setCaseName:](v5, "setCaseName:", v17);

    v18 = objc_opt_class();
    NSStringFromSelector(sel_caseFirmwareVersion);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDeviceSupportInformation setCaseFirmwareVersion:](v5, "setCaseFirmwareVersion:", v20);

    v21 = objc_opt_class();
    NSStringFromSelector(sel_caseSerialNumber);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDeviceSupportInformation setCaseSerialNumber:](v5, "setCaseSerialNumber:", v23);

    v24 = objc_opt_class();
    NSStringFromSelector(sel_hardwareVersion);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDeviceSupportInformation setHardwareVersion:](v5, "setHardwareVersion:", v26);

    v27 = objc_opt_class();
    NSStringFromSelector(sel_leftBudSerialNumber);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDeviceSupportInformation setLeftBudSerialNumber:](v5, "setLeftBudSerialNumber:", v29);

    v30 = objc_opt_class();
    NSStringFromSelector(sel_rightBudSerialNumber);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTCloudDeviceSupportInformation setRightBudSerialNumber:](v5, "setRightBudSerialNumber:", v32);

LABEL_4:
    v33 = v5;
    goto LABEL_10;
  }
  if (gLogCategory_BTCloudDevice <= 90 && (gLogCategory_BTCloudDevice != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v33 = 0;
LABEL_10:

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BTCloudDeviceSupportInformation bluetoothAddress](self, "bluetoothAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDeviceSupportInformation budsFirmwareVersion](self, "budsFirmwareVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDeviceSupportInformation caseFirmwareVersion](self, "caseFirmwareVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDeviceSupportInformation caseSerialNumber](self, "caseSerialNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDeviceSupportInformation hardwareVersion](self, "hardwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDeviceSupportInformation leftBudSerialNumber](self, "leftBudSerialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDeviceSupportInformation rightBudSerialNumber](self, "rightBudSerialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDeviceSupportInformation caseName](self, "caseName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTCloudDeviceSupportInformation ancAssetVersion](self, "ancAssetVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("BTCloudDeviceInformation: %@, %@, %@, %@, %@, %@, %@, %@, %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothAddress, a3);
}

- (NSString)budsFirmwareVersion
{
  return self->_budsFirmwareVersion;
}

- (void)setBudsFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_budsFirmwareVersion, a3);
}

- (NSString)caseName
{
  return self->_caseName;
}

- (void)setCaseName:(id)a3
{
  objc_storeStrong((id *)&self->_caseName, a3);
}

- (NSString)caseFirmwareVersion
{
  return self->_caseFirmwareVersion;
}

- (void)setCaseFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_caseFirmwareVersion, a3);
}

- (NSString)caseSerialNumber
{
  return self->_caseSerialNumber;
}

- (void)setCaseSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_caseSerialNumber, a3);
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (void)setHardwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareVersion, a3);
}

- (NSString)leftBudSerialNumber
{
  return self->_leftBudSerialNumber;
}

- (void)setLeftBudSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_leftBudSerialNumber, a3);
}

- (NSString)rightBudSerialNumber
{
  return self->_rightBudSerialNumber;
}

- (void)setRightBudSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_rightBudSerialNumber, a3);
}

- (NSString)ancAssetVersion
{
  return self->_ancAssetVersion;
}

- (void)setAncAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_ancAssetVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ancAssetVersion, 0);
  objc_storeStrong((id *)&self->_rightBudSerialNumber, 0);
  objc_storeStrong((id *)&self->_leftBudSerialNumber, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_caseSerialNumber, 0);
  objc_storeStrong((id *)&self->_caseFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_caseName, 0);
  objc_storeStrong((id *)&self->_budsFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end
