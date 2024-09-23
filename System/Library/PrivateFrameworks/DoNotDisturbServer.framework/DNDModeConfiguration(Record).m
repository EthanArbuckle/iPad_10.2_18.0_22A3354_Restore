@implementation DNDModeConfiguration(Record)

+ (id)modeConfigurationForRecord:()Record
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _BYTE v23[24];

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0D1D708];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    v6 = (void *)MEMORY[0x1E0D1D5B8];
    objc_msgSend(v4, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secureConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationForRecord:secureRecord:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConfiguration:", v9);

    v10 = (void *)MEMORY[0x1E0D1D5F0];
    objc_msgSend(v4, "mode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "modeForRecord:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMode:", v12);

    objc_msgSend(v4, "triggers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "triggers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTriggers:", v14);

    objc_msgSend(v5, "setImpactsAvailability:", objc_msgSend(v4, "impactsAvailability"));
    v15 = objc_msgSend(v4, "dimsLockScreen");
    objc_msgSend(v5, "mode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "semanticType");

    if (v17 == 1)
      v18 = 2;
    else
      v18 = v15;
    objc_msgSend(v5, "setDimsLockScreen:", v18);
    objc_msgSend(v4, "created");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCreated:", v19);

    objc_msgSend(v4, "lastModified");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLastModified:", v20);

    objc_msgSend(v5, "setCompatibilityVersion:", objc_msgSend(v4, "compatibilityVersion"));
    objc_msgSend(v5, "setAutomaticallyGenerated:", objc_msgSend(v4, "isAutomaticallyGenerated"));
    objc_msgSend(v4, "lastModifiedByVersion");
    objc_msgSend(v5, "setLastModifiedByVersion:", v23);
    objc_msgSend(v4, "lastModifiedByDeviceID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setLastModifiedByDeviceID:", v21);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (DNDSMutableModeConfigurationRecord)makeRecord
{
  DNDSMutableModeConfigurationRecord *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DNDSModeConfigurationTriggersRecord *v9;
  void *v10;
  DNDSModeConfigurationTriggersRecord *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _BYTE v20[24];

  v2 = objc_alloc_init(DNDSMutableModeConfigurationRecord);
  objc_msgSend(a1, "mode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeConfigurationRecord setMode:](v2, "setMode:", v4);

  objc_msgSend(a1, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeConfigurationRecord setConfiguration:](v2, "setConfiguration:", v6);

  objc_msgSend(a1, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "makeSecureRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeConfigurationRecord setSecureConfiguration:](v2, "setSecureConfiguration:", v8);

  v9 = [DNDSModeConfigurationTriggersRecord alloc];
  objc_msgSend(a1, "triggers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[DNDSModeConfigurationTriggersRecord initWithTriggers:](v9, "initWithTriggers:", v10);
  -[DNDSMutableModeConfigurationRecord setTriggers:](v2, "setTriggers:", v11);

  -[DNDSMutableModeConfigurationRecord setImpactsAvailability:](v2, "setImpactsAvailability:", objc_msgSend(a1, "impactsAvailability"));
  v12 = objc_msgSend(a1, "dimsLockScreen");
  objc_msgSend(a1, "mode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "semanticType");

  if (v14 == 1)
    v15 = 2;
  else
    v15 = v12;
  -[DNDSMutableModeConfigurationRecord setDimsLockScreen:](v2, "setDimsLockScreen:", v15);
  objc_msgSend(a1, "created");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeConfigurationRecord setCreated:](v2, "setCreated:", v16);

  objc_msgSend(a1, "lastModified");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeConfigurationRecord setLastModified:](v2, "setLastModified:", v17);

  objc_msgSend(a1, "lastModifiedByVersion");
  -[DNDSMutableModeConfigurationRecord setLastModifiedByVersion:](v2, "setLastModifiedByVersion:", v20);
  objc_msgSend(a1, "lastModifiedByDeviceID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeConfigurationRecord setLastModifiedByDeviceID:](v2, "setLastModifiedByDeviceID:", v18);

  -[DNDSMutableModeConfigurationRecord setHasSecureData:](v2, "setHasSecureData:", objc_msgSend(a1, "hasSecureData"));
  -[DNDSMutableModeConfigurationRecord setCompatibilityVersion:](v2, "setCompatibilityVersion:", objc_msgSend(a1, "compatibilityVersion"));
  -[DNDSMutableModeConfigurationRecord setEphemeralResolvedCompatibilityVersion:](v2, "setEphemeralResolvedCompatibilityVersion:", objc_msgSend(a1, "resolvedCompatibilityVersion"));
  -[DNDSMutableModeConfigurationRecord setAutomaticallyGenerated:](v2, "setAutomaticallyGenerated:", objc_msgSend(a1, "isAutomaticallyGenerated"));
  return v2;
}

@end
