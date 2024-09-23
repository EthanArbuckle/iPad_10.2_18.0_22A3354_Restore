@implementation FMDMagSafeAccessory

- (BOOL)isValid
{
  void *v2;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = -[FMDMagSafeAccessory findMyEnabled](self, "findMyEnabled");
  if (v4)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory name](self, "name"));
    if (!v2)
    {
      v10 = 1;
      goto LABEL_11;
    }
  }
  v5 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory serialNumbers](self, "serialNumbers"));
  if (!v5)
  {
    v10 = 1;
    if (!v4)
      return !v10;
    goto LABEL_11;
  }
  v6 = (void *)v5;
  v7 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory accessoryType](self, "accessoryType"));
    v10 = v9 == 0;

    if ((v4 & 1) == 0)
      return !v10;
    goto LABEL_11;
  }

  v10 = 1;
  if ((v4 & 1) != 0)
LABEL_11:

  return !v10;
}

- (FMDMagSafeAccessory)initWithPhysicalAccessory:(id)a3 fmEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  FMDMagSafeAccessory *v7;
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
  FMDMagSafeAccessory *v19;
  objc_super v21;
  const __CFString *v22;
  void *v23;

  v4 = a4;
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FMDMagSafeAccessory;
  v7 = -[FMDMagSafeAccessory init](&v21, "init");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtHelper deviceIDFromAddress:](FMDExtHelper, "deviceIDFromAddress:", v8));
    -[FMDMagSafeAccessory setAccessoryIdentifier:](v7, "setAccessoryIdentifier:", v9);

    v22 = CFSTR("systemSerialNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
    v23 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    -[FMDMagSafeAccessory setSerialNumbers:](v7, "setSerialNumbers:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firmwareVersion"));
    -[FMDMagSafeAccessory setFirmwareVersion:](v7, "setFirmwareVersion:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "style"));
    -[FMDMagSafeAccessory setStyle:](v7, "setStyle:", v13);

    if (objc_msgSend(v6, "isMF4i"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MFI4.0v1_%@"), v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtHelper _computehash:](FMDExtHelper, "_computehash:", v15));
      -[FMDMagSafeAccessory setAccessoryType:](v7, "setAccessoryType:", v16);

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryType"));
      -[FMDMagSafeAccessory setAccessoryType:](v7, "setAccessoryType:", v14);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
    -[FMDMagSafeAccessory setDeviceDiscoveryId:](v7, "setDeviceDiscoveryId:", v17);

    if (v4)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      -[FMDMagSafeAccessory setName:](v7, "setName:", v18);

    }
    -[FMDMagSafeAccessory setFindMyEnabled:](v7, "setFindMyEnabled:", v4);
  }
  if (-[FMDMagSafeAccessory isValid](v7, "isValid"))
    v19 = v7;
  else
    v19 = 0;

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory serialNumbers](self, "serialNumbers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory firmwareVersion](self, "firmwareVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory style](self, "style"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ %@ %@"), v3, v4, v5, v6));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory accessoryIdentifier](self, "accessoryIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accessoryIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory accessoryType](self, "accessoryType"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accessoryType"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory serialNumbers](self, "serialNumbers"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serialNumbers"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory firmwareVersion](self, "firmwareVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("firmwareVersion"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory name](self, "name"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("name"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory style](self, "style"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("style"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory additionalInfo](self, "additionalInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("additionalInfo"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory deviceDiscoveryId](self, "deviceDiscoveryId"));
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("deviceDiscoveryId"));

  objc_msgSend(v4, "encodeBool:forKey:", -[FMDMagSafeAccessory findMyEnabled](self, "findMyEnabled"), CFSTR("findMyEnabled"));
  v13 = (id)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessory lastLostModeKeyRollTime](self, "lastLostModeKeyRollTime"));
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("lastLostModeKeyRollTime"));

}

- (FMDMagSafeAccessory)initWithCoder:(id)a3
{
  id v4;
  FMDMagSafeAccessory *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSSet *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)FMDMagSafeAccessory;
  v5 = -[FMDMagSafeAccessory init](&v27, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("accessoryIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[FMDMagSafeAccessory setAccessoryIdentifier:](v5, "setAccessoryIdentifier:", v7);

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("accessoryType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[FMDMagSafeAccessory setAccessoryType:](v5, "setAccessoryType:", v9);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("firmwareVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[FMDMagSafeAccessory setFirmwareVersion:](v5, "setFirmwareVersion:", v11);

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[FMDMagSafeAccessory setName:](v5, "setName:", v13);

    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("style"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[FMDMagSafeAccessory setStyle:](v5, "setStyle:", v15);

    v16 = objc_opt_class(NSString);
    v17 = objc_opt_class(NSNumber);
    v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, v17, objc_opt_class(NSDictionary), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("serialNumbers")));
    -[FMDMagSafeAccessory setSerialNumbers:](v5, "setSerialNumbers:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("additionalInfo")));
    -[FMDMagSafeAccessory setAdditionalInfo:](v5, "setAdditionalInfo:", v21);

    v22 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("deviceDiscoveryId"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[FMDMagSafeAccessory setDeviceDiscoveryId:](v5, "setDeviceDiscoveryId:", v23);

    -[FMDMagSafeAccessory setFindMyEnabled:](v5, "setFindMyEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("findMyEnabled")));
    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("lastLostModeKeyRollTime"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[FMDMagSafeAccessory setLastLostModeKeyRollTime:](v5, "setLastLostModeKeyRollTime:", v25);

  }
  return v5;
}

- (NSString)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (BOOL)findMyEnabled
{
  return self->_findMyEnabled;
}

- (void)setFindMyEnabled:(BOOL)a3
{
  self->_findMyEnabled = a3;
}

- (NSString)lastLostModeKeyRollTime
{
  return self->_lastLostModeKeyRollTime;
}

- (void)setLastLostModeKeyRollTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastLostModeKeyRollTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLostModeKeyRollTime, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
