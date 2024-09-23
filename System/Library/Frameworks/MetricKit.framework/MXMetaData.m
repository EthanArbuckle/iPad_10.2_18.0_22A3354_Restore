@implementation MXMetaData

- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MXMetaData *v15;
  MXMetaData *v16;
  MXMetaData *v17;
  void *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MXMetaData;
  v15 = -[MXMetaData init](&v20, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_7;
  v17 = 0;
  if (v11 && v12 && v13 && v14)
  {
    objc_storeStrong((id *)&v15->_regionFormat, a3);
    objc_storeStrong((id *)&v16->_osVersion, a4);
    objc_storeStrong((id *)&v16->_deviceType, a5);
    objc_storeStrong((id *)&v16->_applicationBuildVersion, a6);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_lowPowerModeEnabled = objc_msgSend(v18, "isLowPowerModeEnabled");

    v16->_pid = -1;
LABEL_7:
    v17 = v16;
  }

  return v17;
}

- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6 platformArchitecture:(id)a7
{
  id v13;
  id v14;
  id v15;
  MXMetaData *v16;
  MXMetaData *v17;
  MXMetaData *v18;
  void *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)MXMetaData;
  v16 = -[MXMetaData init](&v23, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_8;
  v18 = 0;
  if (v22 && v21 && v13 && v14 && v15)
  {
    objc_storeStrong((id *)&v16->_regionFormat, a3);
    objc_storeStrong((id *)&v17->_osVersion, a4);
    objc_storeStrong((id *)&v17->_deviceType, a5);
    objc_storeStrong((id *)&v17->_applicationBuildVersion, a6);
    objc_storeStrong((id *)&v17->_platformArchitecture, a7);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_lowPowerModeEnabled = objc_msgSend(v19, "isLowPowerModeEnabled");

    v17->_pid = -1;
LABEL_8:
    v18 = v17;
  }

  return v18;
}

- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6 platformArchitecture:(id)a7 bundleID:(id)a8
{
  id v15;
  id v16;
  MXMetaData *v17;
  MXMetaData *v18;
  MXMetaData *v19;
  void *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v15 = a6;
  v16 = a7;
  v22 = a8;
  v26.receiver = self;
  v26.super_class = (Class)MXMetaData;
  v17 = -[MXMetaData init](&v26, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_8;
  v19 = 0;
  if (v25 && v24 && v23 && v15 && v16)
  {
    objc_storeStrong((id *)&v17->_regionFormat, a3);
    objc_storeStrong((id *)&v18->_osVersion, a4);
    objc_storeStrong((id *)&v18->_deviceType, a5);
    objc_storeStrong((id *)&v18->_applicationBuildVersion, a6);
    objc_storeStrong((id *)&v18->_platformArchitecture, a7);
    objc_storeStrong((id *)&v18->_bundleID, a8);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_lowPowerModeEnabled = objc_msgSend(v20, "isLowPowerModeEnabled");

    v18->_pid = -1;
LABEL_8:
    v19 = v18;
  }

  return v19;
}

- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6 platformArchitecture:(id)a7 bundleID:(id)a8 pid:(int)a9 isTestFlightApp:(BOOL)a10
{
  id v17;
  id v18;
  MXMetaData *v19;
  MXMetaData *v20;
  MXMetaData *v21;
  void *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v17 = a6;
  v18 = a7;
  v24 = a8;
  v28.receiver = self;
  v28.super_class = (Class)MXMetaData;
  v19 = -[MXMetaData init](&v28, sel_init);
  v20 = v19;
  if (!v19)
    goto LABEL_8;
  v21 = 0;
  if (v27 && v26 && v25 && v17 && v18)
  {
    objc_storeStrong((id *)&v19->_regionFormat, a3);
    objc_storeStrong((id *)&v20->_osVersion, a4);
    objc_storeStrong((id *)&v20->_deviceType, a5);
    objc_storeStrong((id *)&v20->_applicationBuildVersion, a6);
    objc_storeStrong((id *)&v20->_platformArchitecture, a7);
    objc_storeStrong((id *)&v20->_bundleID, a8);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20->_lowPowerModeEnabled = objc_msgSend(v22, "isLowPowerModeEnabled");

    v20->_pid = a9;
    v20->_isTestFlightApp = a10;
LABEL_8:
    v21 = v20;
  }

  return v21;
}

- (MXMetaData)initWithRegionFormat:(id)a3 osVersion:(id)a4 deviceType:(id)a5 appBuildVersion:(id)a6 bundleID:(id)a7
{
  id v13;
  id v14;
  id v15;
  MXMetaData *v16;
  MXMetaData *v17;
  MXMetaData *v18;
  void *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)MXMetaData;
  v16 = -[MXMetaData init](&v23, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_8;
  v18 = 0;
  if (v22 && v21 && v13 && v14 && v15)
  {
    objc_storeStrong((id *)&v16->_regionFormat, a3);
    objc_storeStrong((id *)&v17->_osVersion, a4);
    objc_storeStrong((id *)&v17->_deviceType, a5);
    objc_storeStrong((id *)&v17->_applicationBuildVersion, a6);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_lowPowerModeEnabled = objc_msgSend(v19, "isLowPowerModeEnabled");

    objc_storeStrong((id *)&v17->_bundleID, a7);
    v17->_pid = -1;
LABEL_8:
    v18 = v17;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *regionFormat;
  id v5;
  id v6;

  regionFormat = self->_regionFormat;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", regionFormat, CFSTR("regionFormat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_osVersion, CFSTR("osVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationBuildVersion, CFSTR("appBuildVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_platformArchitecture, CFSTR("platformArchitecture"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_lowPowerModeEnabled, CFSTR("lowPowerModeEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isTestFlightApp, CFSTR("isTestFlightApp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_pid);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("pid"));

}

- (MXMetaData)initWithCoder:(id)a3
{
  id v4;
  MXMetaData *v5;
  uint64_t v6;
  NSString *regionFormat;
  uint64_t v8;
  NSString *osVersion;
  uint64_t v10;
  NSString *deviceType;
  uint64_t v12;
  NSString *applicationBuildVersion;
  uint64_t v14;
  NSString *platformArchitecture;
  uint64_t v16;
  NSString *bundleID;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MXMetaData;
  v5 = -[MXMetaData init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("regionFormat"));
    v6 = objc_claimAutoreleasedReturnValue();
    regionFormat = v5->_regionFormat;
    v5->_regionFormat = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceType"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBuildVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    applicationBuildVersion = v5->_applicationBuildVersion;
    v5->_applicationBuildVersion = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformArchitecture"));
    v14 = objc_claimAutoreleasedReturnValue();
    platformArchitecture = v5->_platformArchitecture;
    v5->_platformArchitecture = (NSString *)v14;

    v5->_lowPowerModeEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lowPowerModeEnabled"));
    v5->_isTestFlightApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTestFlightApp"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pid"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pid = objc_msgSend(v18, "intValue");

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  NSString *bundleID;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *regionFormat;
  NSString *osVersion;
  NSString *deviceType;
  NSString *applicationBuildVersion;
  NSString *platformArchitecture;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = v3;
  bundleID = self->_bundleID;
  if (bundleID)
  {
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleIdentifier"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("bundleIdentifier"));

    }
  }
  regionFormat = self->_regionFormat;
  if (regionFormat)
    objc_msgSend(v4, "setObject:forKey:", regionFormat, CFSTR("regionFormat"));
  osVersion = self->_osVersion;
  if (osVersion)
    objc_msgSend(v4, "setObject:forKey:", osVersion, CFSTR("osVersion"));
  deviceType = self->_deviceType;
  if (deviceType)
    objc_msgSend(v4, "setObject:forKey:", deviceType, CFSTR("deviceType"));
  applicationBuildVersion = self->_applicationBuildVersion;
  if (applicationBuildVersion)
    objc_msgSend(v4, "setObject:forKey:", applicationBuildVersion, CFSTR("appBuildVersion"));
  platformArchitecture = self->_platformArchitecture;
  if (platformArchitecture)
    objc_msgSend(v4, "setObject:forKey:", platformArchitecture, CFSTR("platformArchitecture"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_lowPowerModeEnabled);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("lowPowerModeEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_pid);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("pid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isTestFlightApp);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("isTestFlightApp"));

  return v4;
}

- (NSData)JSONRepresentation
{
  void *v3;
  void *v4;
  id v6;

  if ((int)arc4random_uniform(0x64u) <= 9)
    AnalyticsSendEventLazy();
  -[MXMetaData toDictionary](self, "toDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v3))
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 1, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (NSData *)v4;
}

id __32__MXMetaData_JSONRepresentation__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v4[0] = CFSTR("bundleID");
  v4[1] = CFSTR("metricKitHelperFunctionType");
  v5[0] = v1;
  v5[1] = CFSTR("JSONRepresentation");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (NSDictionary)DictionaryRepresentation
{
  if ((int)arc4random_uniform(0x64u) <= 9)
    AnalyticsSendEventLazy();
  return (NSDictionary *)-[MXMetaData toDictionary](self, "toDictionary");
}

id __38__MXMetaData_DictionaryRepresentation__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v4[0] = CFSTR("bundleID");
  v4[1] = CFSTR("metricKitHelperFunctionType");
  v5[0] = v1;
  v5[1] = CFSTR("DictionaryRepresentation");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (NSDictionary)dictionaryRepresentation
{
  if ((int)arc4random_uniform(0x64u) <= 9)
    AnalyticsSendEventLazy();
  return (NSDictionary *)-[MXMetaData toDictionary](self, "toDictionary");
}

id __38__MXMetaData_dictionaryRepresentation__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v4[0] = CFSTR("bundleID");
  v4[1] = CFSTR("metricKitHelperFunctionType");
  v5[0] = v1;
  v5[1] = CFSTR("dictionaryRepresentation");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (NSString)regionFormat
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRegionFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)deviceType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)applicationBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApplicationBuildVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)platformArchitecture
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPlatformArchitecture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)lowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (BOOL)isTestFlightApp
{
  return self->_isTestFlightApp;
}

- (void)setIsTestFlightApp:(BOOL)a3
{
  self->_isTestFlightApp = a3;
}

- (pid_t)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (BOOL)errorRetrievingAppRecord
{
  return self->_errorRetrievingAppRecord;
}

- (void)setErrorRetrievingAppRecord:(BOOL)a3
{
  self->_errorRetrievingAppRecord = a3;
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_platformArchitecture, 0);
  objc_storeStrong((id *)&self->_applicationBuildVersion, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_regionFormat, 0);
}

@end
