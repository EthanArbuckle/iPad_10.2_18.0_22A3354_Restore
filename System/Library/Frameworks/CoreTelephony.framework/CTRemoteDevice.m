@implementation CTRemoteDevice

- (CTRemoteDevice)init
{
  CTRemoteDevice *v2;
  CTRemoteDevice *v3;
  CTDeviceIdentifier *deviceID;
  NSArray *remoteDisplayPlans;
  NSArray *remotePlans;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTRemoteDevice;
  v2 = -[CTRemoteDevice init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    deviceID = v2->_deviceID;
    v2->_deviceID = 0;

    remoteDisplayPlans = v3->_remoteDisplayPlans;
    v3->_remoteDisplayPlans = 0;

    remotePlans = v3->_remotePlans;
    v3->_remotePlans = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTRemoteDevice deviceID](self, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" deviceID=%@"), v4);

  -[CTRemoteDevice remoteDisplayPlans](self, "remoteDisplayPlans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" remoteDisplayPlans:%@"), v5);

  -[CTRemoteDevice remotePlans](self, "remotePlans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" remotePlans=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTRemoteDevice *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = (CTRemoteDevice *)a3;
  if (v6 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTRemoteDevice deviceID](self, "deviceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTRemoteDevice deviceID](v6, "deviceID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[CTRemoteDevice deviceID](self, "deviceID");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemoteDevice deviceID](v6, "deviceID");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v9 = 0;
          goto LABEL_18;
        }
      }
      -[CTRemoteDevice remoteDisplayPlans](self, "remoteDisplayPlans");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTRemoteDevice remoteDisplayPlans](v6, "remoteDisplayPlans");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[CTRemoteDevice remoteDisplayPlans](self, "remoteDisplayPlans");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemoteDevice remoteDisplayPlans](v6, "remoteDisplayPlans");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v13))
        {
          v9 = 0;
          goto LABEL_16;
        }
        v25 = v13;
        v26 = v12;
      }
      -[CTRemoteDevice remotePlans](self, "remotePlans");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTRemoteDevice remotePlans](v6, "remotePlans");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v9 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[CTRemoteDevice remotePlans](self, "remotePlans");
        v24 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemoteDevice remotePlans](v6, "remotePlans");
        v23 = v10;
        v18 = v8;
        v19 = v7;
        v20 = v4;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v17, "isEqual:", v21);

        v4 = v20;
        v7 = v19;
        v8 = v18;
        v10 = v23;

        v3 = v24;
      }
      v13 = v25;
      v12 = v26;
      if (v10 == v11)
      {
LABEL_17:

        if (v7 == v8)
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_18:

        goto LABEL_19;
      }
LABEL_16:

      goto LABEL_17;
    }
    v9 = 0;
  }
LABEL_20:

  return v9;
}

- (id)deviceName
{
  return -[CTDeviceIdentifier deviceName](self->_deviceID, "deviceName");
}

- (id)modelName
{
  return -[CTDeviceIdentifier modelName](self->_deviceID, "modelName");
}

- (unint64_t)deviceType
{
  return -[CTDeviceIdentifier deviceType](self->_deviceID, "deviceType");
}

- (id)EID
{
  return -[CTDeviceIdentifier EID](self->_deviceID, "EID");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTRemoteDevice)initWithCoder:(id)a3
{
  id v4;
  CTRemoteDevice *v5;
  uint64_t v6;
  CTDeviceIdentifier *deviceID;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *remoteDisplayPlans;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *remotePlans;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTRemoteDevice;
  v5 = -[CTRemoteDevice init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceID"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceID = v5->_deviceID;
    v5->_deviceID = (CTDeviceIdentifier *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("remoteDisplayPlans"));
    v11 = objc_claimAutoreleasedReturnValue();
    remoteDisplayPlans = v5->_remoteDisplayPlans;
    v5->_remoteDisplayPlans = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("remotePlans"));
    v16 = objc_claimAutoreleasedReturnValue();
    remotePlans = v5->_remotePlans;
    v5->_remotePlans = (NSArray *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CTDeviceIdentifier *deviceID;
  id v5;

  deviceID = self->_deviceID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceID, CFSTR("deviceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remoteDisplayPlans, CFSTR("remoteDisplayPlans"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remotePlans, CFSTR("remotePlans"));

}

- (CTDeviceIdentifier)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (NSArray)remoteDisplayPlans
{
  return self->_remoteDisplayPlans;
}

- (void)setRemoteDisplayPlans:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDisplayPlans, a3);
}

- (NSArray)remotePlans
{
  return self->_remotePlans;
}

- (void)setRemotePlans:(id)a3
{
  objc_storeStrong((id *)&self->_remotePlans, a3);
}

- (BOOL)isMultiESimEnabled
{
  return self->_isMultiESimEnabled;
}

- (void)setIsMultiESimEnabled:(BOOL)a3
{
  self->_isMultiESimEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePlans, 0);
  objc_storeStrong((id *)&self->_remoteDisplayPlans, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
