@implementation _INPBDeviceDetail

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (void)setDeviceClass:(int)a3
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
    self->_deviceClass = a3;
  }
}

- (BOOL)hasDeviceClass
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)deviceClassAsString:(int)a3
{
  if (a3 < 0xA)
    return *(&off_1E2294120 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeviceClass:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPHONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPAD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPOD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAC")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOMEPOD")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEADPHONE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ACCESSORIES")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (void)setDeviceOwner:(id)a3
{
  objc_storeStrong((id *)&self->_deviceOwner, a3);
}

- (BOOL)hasDeviceOwner
{
  return self->_deviceOwner != 0;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setProductName:(id)a3
{
  objc_storeStrong((id *)&self->_productName, a3);
}

- (BOOL)hasProductName
{
  return self->_productName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeviceDetailReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[_INPBDeviceDetail category](self, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBDeviceDetail category](self, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBDeviceDetail hasDeviceClass](self, "hasDeviceClass"))
    PBDataWriterWriteInt32Field();
  -[_INPBDeviceDetail deviceName](self, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBDeviceDetail deviceName](self, "deviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBDeviceDetail deviceOwner](self, "deviceOwner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBDeviceDetail deviceOwner](self, "deviceOwner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBDeviceDetail identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[_INPBDeviceDetail productName](self, "productName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[_INPBDeviceDetail productName](self, "productName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v12 = v14;
  }

}

- (_INPBDeviceDetail)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDeviceDetail *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDeviceDetail *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDeviceDetail *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDeviceDetail initWithData:](self, "initWithData:", v6);

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
  -[_INPBDeviceDetail data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDeviceDetail *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = -[_INPBDeviceDetail init](+[_INPBDeviceDetail allocWithZone:](_INPBDeviceDetail, "allocWithZone:"), "init");
  v6 = -[_INPBDataString copyWithZone:](self->_category, "copyWithZone:", a3);
  -[_INPBDeviceDetail setCategory:](v5, "setCategory:", v6);

  if (-[_INPBDeviceDetail hasDeviceClass](self, "hasDeviceClass"))
    -[_INPBDeviceDetail setDeviceClass:](v5, "setDeviceClass:", -[_INPBDeviceDetail deviceClass](self, "deviceClass"));
  v7 = -[_INPBDataString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  -[_INPBDeviceDetail setDeviceName:](v5, "setDeviceName:", v7);

  v8 = -[_INPBContact copyWithZone:](self->_deviceOwner, "copyWithZone:", a3);
  -[_INPBDeviceDetail setDeviceOwner:](v5, "setDeviceOwner:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBDeviceDetail setIdentifier:](v5, "setIdentifier:", v9);

  v10 = -[_INPBDataString copyWithZone:](self->_productName, "copyWithZone:", a3);
  -[_INPBDeviceDetail setProductName:](v5, "setProductName:", v10);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int deviceClass;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  BOOL v34;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[_INPBDeviceDetail category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBDeviceDetail category](self, "category");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBDeviceDetail category](self, "category");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "category");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_31;
  }
  else
  {

  }
  v12 = -[_INPBDeviceDetail hasDeviceClass](self, "hasDeviceClass");
  if (v12 != objc_msgSend(v4, "hasDeviceClass"))
    goto LABEL_31;
  if (-[_INPBDeviceDetail hasDeviceClass](self, "hasDeviceClass"))
  {
    if (objc_msgSend(v4, "hasDeviceClass"))
    {
      deviceClass = self->_deviceClass;
      if (deviceClass != objc_msgSend(v4, "deviceClass"))
        goto LABEL_31;
    }
  }
  -[_INPBDeviceDetail deviceName](self, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBDeviceDetail deviceName](self, "deviceName");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBDeviceDetail deviceName](self, "deviceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBDeviceDetail deviceOwner](self, "deviceOwner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceOwner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBDeviceDetail deviceOwner](self, "deviceOwner");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBDeviceDetail deviceOwner](self, "deviceOwner");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceOwner");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBDeviceDetail identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBDeviceDetail identifier](self, "identifier");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBDeviceDetail identifier](self, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBDeviceDetail productName](self, "productName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBDeviceDetail productName](self, "productName");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {

LABEL_34:
      v34 = 1;
      goto LABEL_32;
    }
    v30 = (void *)v29;
    -[_INPBDeviceDetail productName](self, "productName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if ((v33 & 1) != 0)
      goto LABEL_34;
  }
  else
  {
LABEL_30:

  }
LABEL_31:
  v34 = 0;
LABEL_32:

  return v34;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;

  v3 = -[_INPBDataString hash](self->_category, "hash");
  if (-[_INPBDeviceDetail hasDeviceClass](self, "hasDeviceClass"))
    v4 = 2654435761 * self->_deviceClass;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[_INPBDataString hash](self->_deviceName, "hash");
  v7 = v5 ^ v6 ^ -[_INPBContact hash](self->_deviceOwner, "hash");
  v8 = -[NSString hash](self->_identifier, "hash");
  return v7 ^ v8 ^ -[_INPBDataString hash](self->_productName, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBDeviceDetail category](self, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("category"));

  if (-[_INPBDeviceDetail hasDeviceClass](self, "hasDeviceClass"))
  {
    v6 = -[_INPBDeviceDetail deviceClass](self, "deviceClass");
    if (v6 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E2294120 + v6);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("deviceClass"));

  }
  -[_INPBDeviceDetail deviceName](self, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deviceName"));

  -[_INPBDeviceDetail deviceOwner](self, "deviceOwner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("deviceOwner"));

  if (self->_identifier)
  {
    -[_INPBDeviceDetail identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("identifier"));

  }
  -[_INPBDeviceDetail productName](self, "productName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("productName"));

  return v3;
}

- (_INPBDataString)category
{
  return self->_category;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (_INPBDataString)deviceName
{
  return self->_deviceName;
}

- (_INPBContact)deviceOwner
{
  return self->_deviceOwner;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_INPBDataString)productName
{
  return self->_productName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceOwner, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
