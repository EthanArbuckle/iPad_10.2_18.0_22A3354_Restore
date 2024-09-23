@implementation CTDeviceIdentifier

- (CTDeviceIdentifier)init
{
  CTDeviceIdentifier *v2;
  CTDeviceIdentifier *v3;
  NSString *deviceName;
  NSString *modelName;
  NSString *EID;
  NSString *IMEI;
  NSString *idsDeviceId;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTDeviceIdentifier;
  v2 = -[CTDeviceIdentifier init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    deviceName = v2->_deviceName;
    v2->_deviceName = 0;

    modelName = v3->_modelName;
    v3->_modelName = 0;

    EID = v3->_EID;
    v3->_deviceType = 0;
    v3->_EID = 0;

    IMEI = v3->_IMEI;
    v3->_IMEI = 0;

    idsDeviceId = v3->_idsDeviceId;
    v3->_idsDeviceId = 0;

  }
  return v3;
}

- (CTDeviceIdentifier)initWithDeviceType:(unint64_t)a3 EID:(id)a4 IMEI:(id)a5 idsDeviceId:(id)a6
{
  id v10;
  id v11;
  id v12;
  CTDeviceIdentifier *v13;
  CTDeviceIdentifier *v14;
  uint64_t v15;
  NSString *EID;
  uint64_t v17;
  NSString *IMEI;
  uint64_t v19;
  NSString *idsDeviceId;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CTDeviceIdentifier;
  v13 = -[CTDeviceIdentifier init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_deviceType = a3;
    v15 = objc_msgSend(v10, "copy");
    EID = v14->_EID;
    v14->_EID = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    IMEI = v14->_IMEI;
    v14->_IMEI = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    idsDeviceId = v14->_idsDeviceId;
    v14->_idsDeviceId = (NSString *)v19;

  }
  return v14;
}

- (id)toQRCodeString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LPA:1$TR.ID:1$EID:%@$IMEI:%@"), self->_EID, self->_IMEI);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDeviceIdentifier deviceName](self, "deviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" deviceName=%@"), v4);

  -[CTDeviceIdentifier modelName](self, "modelName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" modelName=%@"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(" deviceType=%s"), CTDeviceTypeAsString(-[CTDeviceIdentifier deviceType](self, "deviceType")));
  -[CTDeviceIdentifier EID](self, "EID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" EID=%@"), v6);

  -[CTDeviceIdentifier IMEI](self, "IMEI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" IMEI=%@"), v7);

  -[CTDeviceIdentifier idsDeviceId](self, "idsDeviceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" idsDeviceId=%@"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  CTDeviceIdentifier *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v7 = (CTDeviceIdentifier *)a3;
  if (v7 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTDeviceIdentifier deviceName](self, "deviceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTDeviceIdentifier deviceName](v7, "deviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[CTDeviceIdentifier deviceName](self, "deviceName");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTDeviceIdentifier deviceName](v7, "deviceName");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqualToString:", v4))
        {
          v10 = 0;
          goto LABEL_15;
        }
      }
      -[CTDeviceIdentifier modelName](self, "modelName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTDeviceIdentifier modelName](v7, "modelName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12
        || (v13 = -[CTDeviceIdentifier deviceType](self, "deviceType"),
            v13 != -[CTDeviceIdentifier deviceType](v7, "deviceType")))
      {

        v10 = 0;
        goto LABEL_14;
      }
      -[CTDeviceIdentifier EID](self, "EID");
      v14 = objc_claimAutoreleasedReturnValue();
      -[CTDeviceIdentifier EID](v7, "EID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)v14;
      if ((void *)v14 != v15)
      {
        -[CTDeviceIdentifier EID](self, "EID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTDeviceIdentifier EID](v7, "EID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "isEqualToString:"))
        {
          v10 = 0;
          goto LABEL_29;
        }
      }
      -[CTDeviceIdentifier IMEI](self, "IMEI");
      v17 = objc_claimAutoreleasedReturnValue();
      -[CTDeviceIdentifier IMEI](v7, "IMEI");
      v32 = v5;
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v17;
      if (v17 == v29)
      {
        v26 = v15;
      }
      else
      {
        -[CTDeviceIdentifier IMEI](self, "IMEI");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTDeviceIdentifier IMEI](v7, "IMEI");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v18;
        if (!objc_msgSend(v18, "isEqualToString:"))
        {
          v10 = 0;
          v24 = (void *)v29;
          v23 = v30;
          goto LABEL_27;
        }
        v26 = v15;
      }
      -[CTDeviceIdentifier idsDeviceId](self, "idsDeviceId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTDeviceIdentifier idsDeviceId](v7, "idsDeviceId");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v19 == (void *)v20)
      {

        v10 = 1;
      }
      else
      {
        v21 = (void *)v20;
        -[CTDeviceIdentifier idsDeviceId](self, "idsDeviceId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTDeviceIdentifier idsDeviceId](v7, "idsDeviceId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v25, "isEqualToString:", v22);

      }
      v24 = (void *)v29;
      v23 = v30;
      v15 = v26;
      if (v30 == (void *)v29)
      {
LABEL_28:

        v5 = v32;
        if (v33 == v15)
        {
LABEL_30:

LABEL_14:
          if (v8 == v9)
          {
LABEL_16:

            goto LABEL_17;
          }
LABEL_15:

          goto LABEL_16;
        }
LABEL_29:

        goto LABEL_30;
      }
LABEL_27:

      goto LABEL_28;
    }
    v10 = 0;
  }
LABEL_17:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTDeviceIdentifier)initWithCoder:(id)a3
{
  id v4;
  CTDeviceIdentifier *v5;
  uint64_t v6;
  NSString *deviceName;
  uint64_t v8;
  NSString *modelName;
  uint64_t v10;
  NSString *EID;
  uint64_t v12;
  NSString *IMEI;
  uint64_t v14;
  NSString *idsDeviceId;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTDeviceIdentifier;
  v5 = -[CTDeviceIdentifier init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelName"));
    v8 = objc_claimAutoreleasedReturnValue();
    modelName = v5->_modelName;
    v5->_modelName = (NSString *)v8;

    v5->_deviceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EID"));
    v10 = objc_claimAutoreleasedReturnValue();
    EID = v5->_EID;
    v5->_EID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMEI"));
    v12 = objc_claimAutoreleasedReturnValue();
    IMEI = v5->_IMEI;
    v5->_IMEI = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsDeviceId"));
    v14 = objc_claimAutoreleasedReturnValue();
    idsDeviceId = v5->_idsDeviceId;
    v5->_idsDeviceId = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceName;
  id v5;

  deviceName = self->_deviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceName, CFSTR("deviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelName, CFSTR("modelName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_EID, CFSTR("EID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_IMEI, CFSTR("IMEI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_idsDeviceId, CFSTR("idsDeviceId"));

}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_storeStrong((id *)&self->_modelName, a3);
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (NSString)EID
{
  return self->_EID;
}

- (void)setEID:(id)a3
{
  objc_storeStrong((id *)&self->_EID, a3);
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (void)setIMEI:(id)a3
{
  objc_storeStrong((id *)&self->_IMEI, a3);
}

- (NSString)idsDeviceId
{
  return self->_idsDeviceId;
}

- (void)setIdsDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_idsDeviceId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceId, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_EID, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
