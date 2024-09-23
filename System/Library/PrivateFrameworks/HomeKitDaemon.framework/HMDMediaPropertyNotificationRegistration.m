@implementation HMDMediaPropertyNotificationRegistration

- (HMDMediaPropertyNotificationRegistration)initWithMediaProfileUniqueIdentifier:(id)a3 mediaProperty:(id)a4 deviceIdsDestination:(id)a5 userUUID:(id)a6 lastModified:(id)a7 enabled:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMDMediaPropertyNotificationRegistration *v18;
  HMDMediaPropertyNotificationRegistration *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDMediaPropertyNotificationRegistration;
  v18 = -[HMDMediaPropertyNotificationRegistration init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_mediaProfileUniqueIdentifier, a3);
    objc_storeStrong((id *)&v19->_mediaProperty, a4);
    objc_storeStrong((id *)&v19->_deviceIdsDestination, a5);
    objc_storeStrong((id *)&v19->_userUUID, a6);
    objc_storeStrong((id *)&v19->_lastModified, a7);
    v19->_enabled = a8;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  HMDMediaPropertyNotificationRegistration *v4;
  HMDMediaPropertyNotificationRegistration *v5;
  HMDMediaPropertyNotificationRegistration *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  void *v21;
  void *v22;
  void *v23;

  v4 = (HMDMediaPropertyNotificationRegistration *)a3;
  if (v4 == self)
  {
    LOBYTE(v19) = 1;
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
      -[HMDMediaPropertyNotificationRegistration mediaProfileUniqueIdentifier](self, "mediaProfileUniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMediaPropertyNotificationRegistration mediaProfileUniqueIdentifier](v6, "mediaProfileUniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[HMDMediaPropertyNotificationRegistration mediaProperty](self, "mediaProperty");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMediaPropertyNotificationRegistration mediaProperty](v6, "mediaProperty");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[HMDMediaPropertyNotificationRegistration deviceIdsDestination](self, "deviceIdsDestination");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDMediaPropertyNotificationRegistration deviceIdsDestination](v6, "deviceIdsDestination");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v12))
          {
            -[HMDMediaPropertyNotificationRegistration userUUID](self, "userUUID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDMediaPropertyNotificationRegistration userUUID](v6, "userUUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v13;
            if (objc_msgSend(v13, "isEqual:", v22))
            {
              -[HMDMediaPropertyNotificationRegistration lastModified](self, "lastModified");
              v14 = objc_claimAutoreleasedReturnValue();
              -[HMDMediaPropertyNotificationRegistration lastModified](v6, "lastModified");
              v15 = objc_claimAutoreleasedReturnValue();
              v21 = (void *)v14;
              v16 = (void *)v14;
              v17 = (void *)v15;
              if (objc_msgSend(v16, "isEqual:", v15))
              {
                v18 = -[HMDMediaPropertyNotificationRegistration enabled](self, "enabled");
                v19 = v18 ^ -[HMDMediaPropertyNotificationRegistration enabled](v6, "enabled") ^ 1;
              }
              else
              {
                LOBYTE(v19) = 0;
              }

            }
            else
            {
              LOBYTE(v19) = 0;
            }

          }
          else
          {
            LOBYTE(v19) = 0;
          }

        }
        else
        {
          LOBYTE(v19) = 0;
        }

      }
      else
      {
        LOBYTE(v19) = 0;
      }

    }
    else
    {
      LOBYTE(v19) = 0;
    }

  }
  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMDMediaPropertyNotificationRegistration mediaProfileUniqueIdentifier](self, "mediaProfileUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMDMediaPropertyNotificationRegistration mediaProperty](self, "mediaProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMDMediaPropertyNotificationRegistration deviceIdsDestination](self, "deviceIdsDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaPropertyNotificationRegistration mediaProfileUniqueIdentifier](self, "mediaProfileUniqueIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Media Profile Unique Identifier"), v22);
  v23[0] = v21;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaPropertyNotificationRegistration mediaProperty](self, "mediaProperty");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Media Property"), v20);
  v23[1] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaPropertyNotificationRegistration deviceIdsDestination](self, "deviceIdsDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Device IDS Destination"), v7);
  v23[2] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaPropertyNotificationRegistration userUUID](self, "userUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("User UUID"), v10);
  v23[3] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaPropertyNotificationRegistration lastModified](self, "lastModified");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Last Modified"), v13);
  v23[4] = v14;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaPropertyNotificationRegistration enabled](self, "enabled");
  HMFBooleanToString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Enabled"), v16);
  v23[5] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSUUID)mediaProfileUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)mediaProperty
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)deviceIdsDestination
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)lastModified
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
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
  objc_storeStrong((id *)&self->_mediaProperty, 0);
  objc_storeStrong((id *)&self->_mediaProfileUniqueIdentifier, 0);
}

@end
