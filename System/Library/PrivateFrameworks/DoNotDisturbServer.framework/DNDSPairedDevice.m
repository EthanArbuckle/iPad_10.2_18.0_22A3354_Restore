@implementation DNDSPairedDevice

- (BOOL)supportsKettle
{
  return -[DNDSPairedDevice assertionSyncProtocolVersion](self, "assertionSyncProtocolVersion") > 8;
}

- (DNDSPairedDevice)initWithLocalDeviceIdentifier:(id)a3 deviceClass:(unint64_t)a4 assertionSyncProtocolVersion:(unint64_t)a5 configurationSyncProtocolVersion:(unint64_t)a6 iOS14EraOS:(BOOL)a7 supportsSilenceLists:(BOOL)a8 pairingIdentifier:(id)a9 pairingDataStore:(id)a10
{
  id v16;
  id v17;
  id v18;
  DNDSPairedDevice *v19;
  uint64_t v20;
  NSString *deviceIdentifier;
  uint64_t v22;
  NSUUID *pairingIdentifier;
  uint64_t v24;
  NSString *pairingDataStore;
  objc_super v27;

  v16 = a3;
  v17 = a9;
  v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)DNDSPairedDevice;
  v19 = -[DNDSPairedDevice init](&v27, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v16, "copy");
    deviceIdentifier = v19->_deviceIdentifier;
    v19->_deviceIdentifier = (NSString *)v20;

    v19->_deviceClass = a4;
    v19->_assertionSyncProtocolVersion = a5;
    v19->_configurationSyncProtocolVersion = a6;
    v19->_iOS14EraOS = a7;
    v19->_supportsSilenceLists = a8;
    v19->_iCloudEnabled = 0;
    v19->_syncServiceType = 1;
    v22 = objc_msgSend(v17, "copy");
    pairingIdentifier = v19->_pairingIdentifier;
    v19->_pairingIdentifier = (NSUUID *)v22;

    v24 = objc_msgSend(v18, "copy");
    pairingDataStore = v19->_pairingDataStore;
    v19->_pairingDataStore = (NSString *)v24;

  }
  return v19;
}

- (DNDSPairedDevice)initWithCloudDeviceIdentifier:(id)a3 deviceClass:(unint64_t)a4 assertionSyncProtocolVersion:(unint64_t)a5 configurationSyncProtocolVersion:(unint64_t)a6 supportsSilenceLists:(BOOL)a7
{
  id v12;
  DNDSPairedDevice *v13;
  uint64_t v14;
  NSString *deviceIdentifier;
  objc_super v17;

  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DNDSPairedDevice;
  v13 = -[DNDSPairedDevice init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    deviceIdentifier = v13->_deviceIdentifier;
    v13->_deviceIdentifier = (NSString *)v14;

    v13->_deviceClass = a4;
    v13->_assertionSyncProtocolVersion = a5;
    v13->_configurationSyncProtocolVersion = a6;
    v13->_iOS14EraOS = 0;
    v13->_supportsSilenceLists = a7;
    v13->_iCloudEnabled = 1;
    v13->_syncServiceType = 2;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  -[DNDSPairedDevice deviceIdentifier](self, "deviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[DNDSPairedDevice deviceClass](self, "deviceClass");
  v6 = v5 ^ -[DNDSPairedDevice assertionSyncProtocolVersion](self, "assertionSyncProtocolVersion") ^ v4;
  v7 = v6 ^ -[DNDSPairedDevice configurationSyncProtocolVersion](self, "configurationSyncProtocolVersion");
  v8 = -[DNDSPairedDevice isIOS14EraOS](self, "isIOS14EraOS");
  v9 = v7 ^ v8 ^ -[DNDSPairedDevice supportsSilenceLists](self, "supportsSilenceLists");
  v10 = -[DNDSPairedDevice isICloudEnabled](self, "isICloudEnabled");
  v11 = v10 ^ -[DNDSPairedDevice syncServiceType](self, "syncServiceType");
  -[DNDSPairedDevice pairingIdentifier](self, "pairingIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ objc_msgSend(v12, "hash");
  -[DNDSPairedDevice pairingDataStore](self, "pairingDataStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DNDSPairedDevice *v8;
  DNDSPairedDevice *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v8 = (DNDSPairedDevice *)a3;
  if (self == v8)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      -[DNDSPairedDevice deviceIdentifier](self, "deviceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSPairedDevice deviceIdentifier](v9, "deviceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[DNDSPairedDevice deviceIdentifier](self, "deviceIdentifier");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v14 = 0;
          goto LABEL_37;
        }
        v3 = (void *)v12;
        -[DNDSPairedDevice deviceIdentifier](v9, "deviceIdentifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v4)
        {
          v13 = 0;
LABEL_36:

          v14 = v13;
          goto LABEL_37;
        }
        -[DNDSPairedDevice deviceIdentifier](self, "deviceIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSPairedDevice deviceIdentifier](v9, "deviceIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "isEqual:", v6))
        {
          v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
      }
      v15 = -[DNDSPairedDevice deviceClass](self, "deviceClass");
      if (v15 == -[DNDSPairedDevice deviceClass](v9, "deviceClass"))
      {
        v16 = -[DNDSPairedDevice assertionSyncProtocolVersion](self, "assertionSyncProtocolVersion");
        if (v16 == -[DNDSPairedDevice assertionSyncProtocolVersion](v9, "assertionSyncProtocolVersion"))
        {
          v17 = -[DNDSPairedDevice configurationSyncProtocolVersion](self, "configurationSyncProtocolVersion");
          if (v17 == -[DNDSPairedDevice configurationSyncProtocolVersion](v9, "configurationSyncProtocolVersion"))
          {
            v18 = -[DNDSPairedDevice isIOS14EraOS](self, "isIOS14EraOS");
            if (v18 == -[DNDSPairedDevice isIOS14EraOS](v9, "isIOS14EraOS"))
            {
              v19 = -[DNDSPairedDevice supportsSilenceLists](self, "supportsSilenceLists");
              if (v19 == -[DNDSPairedDevice supportsSilenceLists](v9, "supportsSilenceLists"))
              {
                v20 = -[DNDSPairedDevice isICloudEnabled](self, "isICloudEnabled");
                if (v20 == -[DNDSPairedDevice isICloudEnabled](v9, "isICloudEnabled"))
                {
                  v21 = -[DNDSPairedDevice syncServiceType](self, "syncServiceType");
                  if (v21 == -[DNDSPairedDevice syncServiceType](v9, "syncServiceType"))
                  {
                    -[DNDSPairedDevice pairingIdentifier](self, "pairingIdentifier");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDSPairedDevice pairingIdentifier](v9, "pairingIdentifier");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v22 == v41)
                    {
                      v40 = v22;
                      goto LABEL_25;
                    }
                    -[DNDSPairedDevice pairingIdentifier](self, "pairingIdentifier");
                    v23 = objc_claimAutoreleasedReturnValue();
                    if (v23)
                    {
                      v39 = (void *)v23;
                      -[DNDSPairedDevice pairingIdentifier](v9, "pairingIdentifier");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v24)
                      {
                        v37 = v24;
                        -[DNDSPairedDevice pairingIdentifier](self, "pairingIdentifier");
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        -[DNDSPairedDevice pairingIdentifier](v9, "pairingIdentifier");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend(v38, "isEqual:") & 1) != 0)
                        {
                          v40 = v22;
LABEL_25:
                          -[DNDSPairedDevice pairingDataStore](self, "pairingDataStore");
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          -[DNDSPairedDevice pairingDataStore](v9, "pairingDataStore");
                          v26 = objc_claimAutoreleasedReturnValue();
                          if (v25 == (void *)v26)
                          {

                            v13 = 1;
                          }
                          else
                          {
                            v35 = (void *)v26;
                            -[DNDSPairedDevice pairingDataStore](self, "pairingDataStore");
                            v27 = objc_claimAutoreleasedReturnValue();
                            if (v27)
                            {
                              v34 = (void *)v27;
                              -[DNDSPairedDevice pairingDataStore](v9, "pairingDataStore");
                              v28 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v28)
                              {
                                v33 = v28;
                                -[DNDSPairedDevice pairingDataStore](self, "pairingDataStore");
                                v32 = (void *)objc_claimAutoreleasedReturnValue();
                                -[DNDSPairedDevice pairingDataStore](v9, "pairingDataStore");
                                v31 = (void *)objc_claimAutoreleasedReturnValue();
                                v13 = objc_msgSend(v32, "isEqual:", v31);

                                v28 = v33;
                              }
                              else
                              {
                                v13 = 0;
                              }

                            }
                            else
                            {

                              v13 = 0;
                            }
                          }
                          v30 = v41;
                          if (v40 != v41)
                          {

                            v30 = v41;
                          }

                          v14 = v13;
LABEL_34:
                          if (v10 != v11)
                            goto LABEL_35;
LABEL_37:

                          goto LABEL_38;
                        }

                        v24 = v37;
                      }

                    }
                  }
                }
              }
            }
          }
        }
      }
      v13 = 0;
      v14 = 0;
      goto LABEL_34;
    }
    v14 = 0;
  }
LABEL_38:

  return v14;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;

  v27 = (void *)MEMORY[0x1E0CB3940];
  v25 = objc_opt_class();
  -[DNDSPairedDevice deviceName](self, "deviceName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[DNDSPairedDevice deviceName](self, "deviceName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("; deviceName: '%@'"), v22);
    v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E86A90B0;
  }
  -[DNDSPairedDevice osBuild](self, "osBuild");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[DNDSPairedDevice osBuild](self, "osBuild");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("; build: %@"), v21);
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E86A90B0;
  }
  v24 = (__CFString *)v6;
  v28 = (__CFString *)v4;
  -[DNDSPairedDevice deviceIdentifier](self, "deviceIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DNDSPairedDevice deviceClass](self, "deviceClass");
  v8 = CFSTR("<unhandled>");
  if (v7 <= 4)
    v8 = off_1E86A7338[v7];
  v9 = -[DNDSPairedDevice assertionSyncProtocolVersion](self, "assertionSyncProtocolVersion");
  v10 = -[DNDSPairedDevice configurationSyncProtocolVersion](self, "configurationSyncProtocolVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSPairedDevice isIOS14EraOS](self, "isIOS14EraOS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSPairedDevice supportsSilenceLists](self, "supportsSilenceLists"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSPairedDevice isICloudEnabled](self, "isICloudEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[DNDSPairedDevice syncServiceType](self, "syncServiceType");
  v15 = CFSTR("cloud");
  if (v14 != 2)
    v15 = CFSTR("<unhandled>");
  if (v14 == 1)
    v15 = CFSTR("local");
  v16 = v15;
  -[DNDSPairedDevice pairingIdentifier](self, "pairingIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSPairedDevice pairingDataStore](self, "pairingDataStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@: %p%@%@; deviceIdentifier: '%@'; deviceClass: %@; assertionSyncProtocolVersion: %lu; configurationSyncProtocolVersion: %lu; iOS14EraOS: %@; supportsSilenceLists: %@; iCloudEnabled: %@; syncServiceType: %@; pairingIdentifier: %@; pairingDataStore: %@>"),
    v25,
    self,
    v28,
    v24,
    v23,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13,
    v16,
    v17,
    v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {

  }
  if (v29)
  {

  }
  return v19;
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (void)setOsBuild:(id)a3
{
  id v5;

  v5 = a3;
  if (os_variant_has_internal_diagnostics())
    objc_storeStrong((id *)&self->_osBuild, a3);

}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  id v5;

  v5 = a3;
  if (os_variant_has_internal_diagnostics())
    objc_storeStrong((id *)&self->_deviceName, a3);

}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (unint64_t)deviceClass
{
  return self->_deviceClass;
}

- (unint64_t)assertionSyncProtocolVersion
{
  return self->_assertionSyncProtocolVersion;
}

- (unint64_t)configurationSyncProtocolVersion
{
  return self->_configurationSyncProtocolVersion;
}

- (BOOL)isIOS14EraOS
{
  return self->_iOS14EraOS;
}

- (BOOL)supportsSilenceLists
{
  return self->_supportsSilenceLists;
}

- (BOOL)isICloudEnabled
{
  return self->_iCloudEnabled;
}

- (void)setICloudEnabled:(BOOL)a3
{
  self->_iCloudEnabled = a3;
}

- (unint64_t)syncServiceType
{
  return self->_syncServiceType;
}

- (NSUUID)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (NSString)pairingDataStore
{
  return self->_pairingDataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingDataStore, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
