@implementation _INPBDevice

- (void)setDeviceCategory:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_deviceCategory = a3;
  }
}

- (BOOL)hasDeviceCategory
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeviceCategory:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)deviceCategoryAsString:(int)a3
{
  if ((a3 - 1) < 0xE)
    return *(&off_1E2294730 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeviceCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAC")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_TV")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_POD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV_REMOTE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEAKER")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEADPHONE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATTERY_CASE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KEYBOARD")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRACKPAD")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOUSE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PENCIL")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setDeviceModel:(id)a3
{
  NSString *v4;
  NSString *deviceModel;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  deviceModel = self->_deviceModel;
  self->_deviceModel = v4;

}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (void)setDeviceName:(id)a3
{
  NSString *v4;
  NSString *deviceName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  deviceName = self->_deviceName;
  self->_deviceName = v4;

}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeviceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBDevice hasDeviceCategory](self, "hasDeviceCategory"))
    PBDataWriterWriteInt32Field();
  -[_INPBDevice deviceModel](self, "deviceModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBDevice deviceName](self, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (_INPBDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDevice *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDevice *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDevice *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDevice initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBDevice data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDevice *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBDevice init](+[_INPBDevice allocWithZone:](_INPBDevice, "allocWithZone:"), "init");
  if (-[_INPBDevice hasDeviceCategory](self, "hasDeviceCategory"))
    -[_INPBDevice setDeviceCategory:](v5, "setDeviceCategory:", -[_INPBDevice deviceCategory](self, "deviceCategory"));
  v6 = (void *)-[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  -[_INPBDevice setDeviceModel:](v5, "setDeviceModel:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  -[_INPBDevice setDeviceName:](v5, "setDeviceName:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int deviceCategory;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  v5 = -[_INPBDevice hasDeviceCategory](self, "hasDeviceCategory");
  if (v5 != objc_msgSend(v4, "hasDeviceCategory"))
    goto LABEL_16;
  if (-[_INPBDevice hasDeviceCategory](self, "hasDeviceCategory"))
  {
    if (objc_msgSend(v4, "hasDeviceCategory"))
    {
      deviceCategory = self->_deviceCategory;
      if (deviceCategory != objc_msgSend(v4, "deviceCategory"))
        goto LABEL_16;
    }
  }
  -[_INPBDevice deviceModel](self, "deviceModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_15;
  -[_INPBDevice deviceModel](self, "deviceModel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBDevice deviceModel](self, "deviceModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_16;
  }
  else
  {

  }
  -[_INPBDevice deviceName](self, "deviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBDevice deviceName](self, "deviceName");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_19:
      v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    -[_INPBDevice deviceName](self, "deviceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
LABEL_15:

  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if (-[_INPBDevice hasDeviceCategory](self, "hasDeviceCategory"))
    v3 = 2654435761 * self->_deviceCategory;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_deviceModel, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_deviceName, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBDevice hasDeviceCategory](self, "hasDeviceCategory"))
  {
    v4 = -[_INPBDevice deviceCategory](self, "deviceCategory");
    if ((v4 - 1) >= 0xE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E2294730 + (v4 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceCategory"));

  }
  if (self->_deviceModel)
  {
    -[_INPBDevice deviceModel](self, "deviceModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("deviceModel"));

  }
  if (self->_deviceName)
  {
    -[_INPBDevice deviceName](self, "deviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deviceName"));

  }
  return v3;
}

- (int)deviceCategory
{
  return self->_deviceCategory;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
