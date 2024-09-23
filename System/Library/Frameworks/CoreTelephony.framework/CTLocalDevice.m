@implementation CTLocalDevice

- (CTLocalDevice)init
{
  CTLocalDevice *v2;
  CTLocalDevice *v3;
  CTDeviceIdentifier *deviceID;
  NSArray *installedPlans;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTLocalDevice;
  v2 = -[CTLocalDevice init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    deviceID = v2->_deviceID;
    v2->_deviceID = 0;

    installedPlans = v3->_installedPlans;
    v3->_installedPlans = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLocalDevice deviceID](self, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" deviceID=%@"), v4);

  -[CTLocalDevice installedPlans](self, "installedPlans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" installedPlans=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTLocalDevice *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (CTLocalDevice *)a3;
  if (v6 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTLocalDevice deviceID](self, "deviceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTLocalDevice deviceID](v6, "deviceID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8
        || (-[CTLocalDevice deviceID](self, "deviceID"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTLocalDevice deviceID](v6, "deviceID"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        -[CTLocalDevice installedPlans](self, "installedPlans");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTLocalDevice installedPlans](v6, "installedPlans");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
        {
          v9 = 1;
        }
        else
        {
          -[CTLocalDevice installedPlans](self, "installedPlans");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTLocalDevice installedPlans](v6, "installedPlans");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v12, "isEqual:", v13);

        }
        if (v7 == v8)
          goto LABEL_13;
      }
      else
      {
        v9 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (id)deviceName
{
  return -[CTDeviceIdentifier deviceName](self->_deviceID, "deviceName");
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

- (CTLocalDevice)initWithCoder:(id)a3
{
  id v4;
  CTLocalDevice *v5;
  uint64_t v6;
  CTDeviceIdentifier *deviceID;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *installedPlans;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLocalDevice;
  v5 = -[CTLocalDevice init](&v14, sel_init);
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("installedPlans"));
    v11 = objc_claimAutoreleasedReturnValue();
    installedPlans = v5->_installedPlans;
    v5->_installedPlans = (NSArray *)v11;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_installedPlans, CFSTR("installedPlans"));

}

- (CTDeviceIdentifier)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (NSArray)installedPlans
{
  return self->_installedPlans;
}

- (void)setInstalledPlans:(id)a3
{
  objc_storeStrong((id *)&self->_installedPlans, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedPlans, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
