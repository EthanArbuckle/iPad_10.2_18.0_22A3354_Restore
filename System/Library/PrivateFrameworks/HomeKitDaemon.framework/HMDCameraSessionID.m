@implementation HMDCameraSessionID

- (HMDCameraSessionID)initWithSessionID:(id)a3 message:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  __CFString **v13;
  __CFString *v14;
  HMDCameraSessionID *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[HMDCameraSessionID hostProcessBundleIdentifierForMessage:](HMDCameraSessionID, "hostProcessBundleIdentifierForMessage:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEntitledForSPIAccess");
  if (isWatch())
  {
    v13 = kCameraWatch;
  }
  else if (isTVOSDevice() || isiPadDevice() && (objc_msgSend(v9, "isRemote") & 1) != 0)
  {
    v13 = kCameraResident;
  }
  else
  {
    v13 = &kCameraController;
  }
  v14 = *v13;
  v15 = -[HMDCameraSessionID initWithSessionID:hostProcessBundleIdentifier:isSPIClient:deviceSectionName:description:](self, "initWithSessionID:hostProcessBundleIdentifier:isSPIClient:deviceSectionName:description:", v8, v11, v12, v14, v10);

  return v15;
}

- (HMDCameraSessionID)initWithSessionID:(id)a3 hostProcessBundleIdentifier:(id)a4 isSPIClient:(BOOL)a5 deviceSectionName:(id)a6 description:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDCameraSessionID *v17;
  HMDCameraSessionID *v18;
  uint64_t v19;
  NSString *hostProcessBundleIdentifier;
  uint64_t v21;
  NSString *deviceSectionName;
  uint64_t v23;
  NSString *description;
  uint64_t v25;
  NSMutableDictionary *deviceMilestones;
  uint64_t v27;
  NSMutableDictionary *milestones;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)HMDCameraSessionID;
  v17 = -[HMDCameraSessionID init](&v30, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sessionID, a3);
    v19 = objc_msgSend(v14, "copy");
    hostProcessBundleIdentifier = v18->_hostProcessBundleIdentifier;
    v18->_hostProcessBundleIdentifier = (NSString *)v19;

    v18->_spiClient = a5;
    v21 = objc_msgSend(v15, "copy");
    deviceSectionName = v18->_deviceSectionName;
    v18->_deviceSectionName = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    description = v18->_description;
    v18->_description = (NSString *)v23;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    deviceMilestones = v18->_deviceMilestones;
    v18->_deviceMilestones = (NSMutableDictionary *)v25;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v27 = objc_claimAutoreleasedReturnValue();
    milestones = v18->_milestones;
    v18->_milestones = (NSMutableDictionary *)v27;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v18->_milestones, "setObject:forKeyedSubscript:", v18->_deviceMilestones, v18->_deviceSectionName);
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  HMDCameraSessionID *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HMDCameraSessionID *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMDCameraSessionID sessionID](self, "sessionID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSessionID sessionID](v4, "sessionID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDCameraSessionID sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HMDCameraSessionID sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSessionID hostProcessBundleIdentifier](self, "hostProcessBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDCameraSessionID isSPIClient](self, "isSPIClient");
  -[HMDCameraSessionID deviceSectionName](self, "deviceSectionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSessionID description](self, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithSessionID:hostProcessBundleIdentifier:isSPIClient:deviceSectionName:description:", v5, v6, v7, v8, v9);

  return v10;
}

- (void)markMilestoneFor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "uptimeNumberInMilliseconds");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSessionID markMilestoneFor:withTimestamp:](self, "markMilestoneFor:withTimestamp:", v4, v5);

}

- (void)markMilestoneFor:(id)a3 withTimestamp:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDCameraSessionID deviceMilestones](self, "deviceMilestones");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)markMilestoneForPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[HMDCameraSessionID deviceMilestones](self, "deviceMilestones");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSessionID deviceMilestones](self, "deviceMilestones");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  objc_msgSend((id)objc_opt_class(), "uptimeNumberInMilliseconds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v10);

}

- (void)setParameterFor:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDCameraSessionID deviceMilestones](self, "deviceMilestones");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setParameterForPath:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[HMDCameraSessionID deviceMilestones](self, "deviceMilestones");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v10);
}

- (void)addParameterFor:(id)a3 value:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[HMDCameraSessionID deviceMilestones](self, "deviceMilestones");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSessionID deviceMilestones](self, "deviceMilestones");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v13);

  }
  -[HMDCameraSessionID deviceMilestones](self, "deviceMilestones");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v6);

}

- (id)description
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)hostProcessBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isSPIClient
{
  return self->_spiClient;
}

- (NSMutableDictionary)milestones
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)deviceSectionName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)deviceMilestones
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceMilestones, 0);
  objc_storeStrong((id *)&self->_deviceSectionName, 0);
  objc_storeStrong((id *)&self->_milestones, 0);
  objc_storeStrong((id *)&self->_hostProcessBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

+ (id)hostProcessBundleIdentifierForMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;

  v3 = a3;
  objc_msgSend(v3, "stringForKey:", CFSTR("kCameraSessionApplicationID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(v3, "companionAppBundleIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v6 = (__CFString *)v7;
      if (!isWatch())
        goto LABEL_14;
      if (hostProcessBundleIdentifierForMessage__onceToken != -1)
        dispatch_once(&hostProcessBundleIdentifierForMessage__onceToken, &__block_literal_global_229048);
      objc_msgSend((id)hostProcessBundleIdentifierForMessage__companionAppBundleIdentifierOverrides, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = v8;

        v6 = v9;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v3, "applicationBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v9 = v10;
        v6 = v9;
        goto LABEL_13;
      }
      v6 = CFSTR("kDefaultCameraApplicationIdentifier");
      v11 = CFSTR("kDefaultCameraApplicationIdentifier");
    }
    v9 = 0;
    goto LABEL_13;
  }
  v6 = v4;
LABEL_14:

  return v6;
}

+ (int64_t)uptimeInMilliseconds
{
  double v2;

  HMFUptime();
  return (uint64_t)(v2 * 1000.0);
}

+ (NSNumber)uptimeNumberInMilliseconds
{
  return (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "uptimeInMilliseconds"));
}

void __60__HMDCameraSessionID_hostProcessBundleIdentifierForMessage___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *MEMORY[0x24BDD5C70], *MEMORY[0x24BDD6778]);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)hostProcessBundleIdentifierForMessage__companionAppBundleIdentifierOverrides;
  hostProcessBundleIdentifierForMessage__companionAppBundleIdentifierOverrides = v0;

}

@end
