@implementation FMFDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceId, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
}

- (FMFDevice)initWithCoder:(id)a3
{
  id v4;
  FMFDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = (FMFDevice *)objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFDevice setDeviceId:](v5, "setDeviceId:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFDevice setDeviceName:](v5, "setDeviceName:", v7);

  -[FMFDevice setIsActiveDevice:](v5, "setIsActiveDevice:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isActiveDevice")));
  -[FMFDevice setIsThisDevice:](v5, "setIsThisDevice:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isThisDevice")));
  -[FMFDevice setIsCompanionDevice:](v5, "setIsCompanionDevice:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCompanionDevice")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsDeviceId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFDevice setIdsDeviceId:](v5, "setIdsDeviceId:", v8);

  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutoMeCapable"));
  -[FMFDevice setIsAutoMeCapable:](v5, "setIsAutoMeCapable:", v9);

  return v5;
}

- (void)setIsThisDevice:(BOOL)a3
{
  self->_isThisDevice = a3;
}

- (void)setIsCompanionDevice:(BOOL)a3
{
  self->_isCompanionDevice = a3;
}

- (void)setIsAutoMeCapable:(BOOL)a3
{
  self->_isAutoMeCapable = a3;
}

- (void)setIsActiveDevice:(BOOL)a3
{
  self->_isActiveDevice = a3;
}

- (void)setIdsDeviceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDeviceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[FMFDevice deviceId](self, "deviceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("deviceId"));

  -[FMFDevice deviceName](self, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("deviceName"));

  objc_msgSend(v7, "encodeBool:forKey:", -[FMFDevice isActiveDevice](self, "isActiveDevice"), CFSTR("isActiveDevice"));
  objc_msgSend(v7, "encodeBool:forKey:", -[FMFDevice isThisDevice](self, "isThisDevice"), CFSTR("isThisDevice"));
  objc_msgSend(v7, "encodeBool:forKey:", -[FMFDevice isCompanionDevice](self, "isCompanionDevice"), CFSTR("isCompanionDevice"));
  -[FMFDevice idsDeviceId](self, "idsDeviceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("idsDeviceId"));

  objc_msgSend(v7, "encodeBool:forKey:", -[FMFDevice isAutoMeCapable](self, "isAutoMeCapable"), CFSTR("isAutoMeCapable"));
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (BOOL)isThisDevice
{
  return self->_isThisDevice;
}

- (BOOL)isCompanionDevice
{
  return self->_isCompanionDevice;
}

- (BOOL)isAutoMeCapable
{
  return self->_isAutoMeCapable;
}

- (BOOL)isActiveDevice
{
  return self->_isActiveDevice;
}

- (NSString)idsDeviceId
{
  return self->_idsDeviceId;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

+ (id)deviceWithId:(id)a3 name:(id)a4 idsDeviceId:(id)a5 isActive:(BOOL)a6 isThisDevice:(BOOL)a7 isCompanionDevice:(BOOL)a8 isAutoMeCapable:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v17, "setDeviceId:", v16);

  objc_msgSend(v17, "setDeviceName:", v15);
  objc_msgSend(v17, "setIsActiveDevice:", v11);
  objc_msgSend(v17, "setIsThisDevice:", v10);
  objc_msgSend(v17, "setIsCompanionDevice:", v9);
  objc_msgSend(v17, "setIsAutoMeCapable:", a9);
  objc_msgSend(v17, "setIdsDeviceId:", v14);

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[FMFDevice deviceName](self, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceName:", v5);

  objc_msgSend(v4, "setIsActiveDevice:", -[FMFDevice isActiveDevice](self, "isActiveDevice"));
  objc_msgSend(v4, "setIsAutoMeCapable:", -[FMFDevice isAutoMeCapable](self, "isAutoMeCapable"));
  -[FMFDevice idsDeviceId](self, "idsDeviceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdsDeviceId:", v6);

  objc_msgSend(v4, "setIsThisDevice:", -[FMFDevice isThisDevice](self, "isThisDevice"));
  objc_msgSend(v4, "setIsCompanionDevice:", -[FMFDevice isCompanionDevice](self, "isCompanionDevice"));
  -[FMFDevice deviceId](self, "deviceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceId:", v7);

  return v4;
}

- (void)updateIsActive:(BOOL)a3 isThisDevice:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[FMFDevice setIsActiveDevice:](self, "setIsActiveDevice:", a3);
  -[FMFDevice setIsThisDevice:](self, "setIsThisDevice:", v4);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  _BOOL4 v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[FMFDevice deviceId](self, "deviceId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[FMFDevice deviceName](self, "deviceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[FMFDevice idsDeviceId](self, "idsDeviceId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "idsDeviceId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11)
          && (v12 = -[FMFDevice isAutoMeCapable](self, "isAutoMeCapable"),
              v12 == objc_msgSend(v5, "isAutoMeCapable"))
          && (v13 = -[FMFDevice isActiveDevice](self, "isActiveDevice"),
              v13 == objc_msgSend(v5, "isActiveDevice"))
          && (v14 = -[FMFDevice isThisDevice](self, "isThisDevice"),
              v14 == objc_msgSend(v5, "isThisDevice")))
        {
          v17 = -[FMFDevice isCompanionDevice](self, "isCompanionDevice");
          v15 = v17 ^ objc_msgSend(v5, "isCompanionDevice") ^ 1;
        }
        else
        {
          LOBYTE(v15) = 0;
        }

      }
      else
      {
        LOBYTE(v15) = 0;
      }

    }
    else
    {
      LOBYTE(v15) = 0;
    }

  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FMFDevice deviceId](self, "deviceId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FMFDevice deviceName](self, "deviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFDevice deviceId](self, "deviceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("NO");
  if (-[FMFDevice isActiveDevice](self, "isActiveDevice"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[FMFDevice isThisDevice](self, "isThisDevice"))
    v6 = CFSTR("YES");
  -[FMFDevice idsDeviceId](self, "idsDeviceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@] {meDevice=%@} {thisDevice=%@} {idsDeviceId=%@}"), v4, v5, v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FMFDevice deviceId](self, "deviceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFDevice deviceName](self, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("YES");
  if (-[FMFDevice isActiveDevice](self, "isActiveDevice"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (!-[FMFDevice isThisDevice](self, "isThisDevice"))
    v7 = CFSTR("NO");
  -[FMFDevice idsDeviceId](self, "idsDeviceId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [%@:%@]> meDevice ? (%@) : thisDevice ? (%@) : idsDeviceId (%@)"), v4, self, v5, v6, v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
