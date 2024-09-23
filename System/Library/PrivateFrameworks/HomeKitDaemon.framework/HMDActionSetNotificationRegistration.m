@implementation HMDActionSetNotificationRegistration

- (HMDActionSetNotificationRegistration)initWithActionSetUUID:(id)a3 deviceIdsDestination:(id)a4 userUUID:(id)a5 lastModified:(id)a6 enabled:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDActionSetNotificationRegistration *v17;
  HMDActionSetNotificationRegistration *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDActionSetNotificationRegistration;
  v17 = -[HMDActionSetNotificationRegistration init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_actionSetUUID, a3);
    objc_storeStrong((id *)&v18->_deviceIdsDestination, a4);
    objc_storeStrong((id *)&v18->_userUUID, a5);
    objc_storeStrong((id *)&v18->_lastModified, a6);
    v18->_enabled = a7;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  HMDActionSetNotificationRegistration *v4;
  HMDActionSetNotificationRegistration *v5;
  HMDActionSetNotificationRegistration *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  _BOOL4 v18;
  void *v20;

  v4 = (HMDActionSetNotificationRegistration *)a3;
  if (v4 == self)
  {
    LOBYTE(v18) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDActionSetNotificationRegistration actionSetUUID](self, "actionSetUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDActionSetNotificationRegistration actionSetUUID](v6, "actionSetUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[HMDActionSetNotificationRegistration deviceIdsDestination](self, "deviceIdsDestination");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDActionSetNotificationRegistration deviceIdsDestination](v6, "deviceIdsDestination");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[HMDActionSetNotificationRegistration userUUID](self, "userUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDActionSetNotificationRegistration userUUID](v6, "userUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v12))
          {
            -[HMDActionSetNotificationRegistration lastModified](self, "lastModified");
            v13 = objc_claimAutoreleasedReturnValue();
            -[HMDActionSetNotificationRegistration lastModified](v6, "lastModified");
            v14 = objc_claimAutoreleasedReturnValue();
            v20 = (void *)v13;
            v15 = (void *)v13;
            v16 = (void *)v14;
            if (objc_msgSend(v15, "isEqual:", v14))
            {
              v17 = -[HMDActionSetNotificationRegistration enabled](self, "enabled");
              v18 = v17 ^ -[HMDActionSetNotificationRegistration enabled](v6, "enabled") ^ 1;
            }
            else
            {
              LOBYTE(v18) = 0;
            }

          }
          else
          {
            LOBYTE(v18) = 0;
          }

        }
        else
        {
          LOBYTE(v18) = 0;
        }

      }
      else
      {
        LOBYTE(v18) = 0;
      }

    }
    else
    {
      LOBYTE(v18) = 0;
    }

  }
  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMDActionSetNotificationRegistration actionSetUUID](self, "actionSetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMDActionSetNotificationRegistration deviceIdsDestination](self, "deviceIdsDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDActionSetNotificationRegistration actionSetUUID](self, "actionSetUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Action Set UUID"), v19);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDActionSetNotificationRegistration deviceIdsDestination](self, "deviceIdsDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Device IDS Destination"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDActionSetNotificationRegistration userUUID](self, "userUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("User UUID"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDActionSetNotificationRegistration lastModified](self, "lastModified");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Last Modified"), v12);
  v20[3] = v13;
  v14 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDActionSetNotificationRegistration enabled](self, "enabled");
  HMFBooleanToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Enabled"), v15);
  v20[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSUUID)actionSetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)deviceIdsDestination
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)lastModified
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_deviceIdsDestination, 0);
  objc_storeStrong((id *)&self->_actionSetUUID, 0);
}

@end
