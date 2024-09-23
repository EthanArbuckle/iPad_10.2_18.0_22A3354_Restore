@implementation _INPBShareDestination

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (BOOL)hasContact
{
  return self->_contact != 0;
}

- (void)setDeviceType:(int)a3
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
    self->_deviceType = a3;
  }
}

- (BOOL)hasDeviceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)deviceTypeAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E228EEC8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeviceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_TV")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_WATCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPHONE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPAD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPOD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMAC")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAC")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MACBOOK")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MACBOOK_AIR")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MACBOOK_PRO")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAC_MINI")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAC_PRO")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBShareDestinationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBShareDestination contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBShareDestination contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBShareDestination hasDeviceType](self, "hasDeviceType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBShareDestination)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBShareDestination *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBShareDestination *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBShareDestination *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBShareDestination initWithData:](self, "initWithData:", v6);

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
  -[_INPBShareDestination data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBShareDestination *v5;
  id v6;

  v5 = -[_INPBShareDestination init](+[_INPBShareDestination allocWithZone:](_INPBShareDestination, "allocWithZone:"), "init");
  v6 = -[_INPBContact copyWithZone:](self->_contact, "copyWithZone:", a3);
  -[_INPBShareDestination setContact:](v5, "setContact:", v6);

  if (-[_INPBShareDestination hasDeviceType](self, "hasDeviceType"))
    -[_INPBShareDestination setDeviceType:](v5, "setDeviceType:", -[_INPBShareDestination deviceType](self, "deviceType"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  int deviceType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[_INPBShareDestination contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBShareDestination contact](self, "contact");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_INPBShareDestination contact](self, "contact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_9;
    }
    else
    {

    }
    v13 = -[_INPBShareDestination hasDeviceType](self, "hasDeviceType");
    if (v13 == objc_msgSend(v4, "hasDeviceType"))
    {
      if (!-[_INPBShareDestination hasDeviceType](self, "hasDeviceType")
        || !objc_msgSend(v4, "hasDeviceType")
        || (deviceType = self->_deviceType, deviceType == objc_msgSend(v4, "deviceType")))
      {
        v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {

  }
LABEL_9:
  v14 = 0;
LABEL_10:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[_INPBContact hash](self->_contact, "hash");
  if (-[_INPBShareDestination hasDeviceType](self, "hasDeviceType"))
    v4 = 2654435761 * self->_deviceType;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBShareDestination contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contact"));

  if (-[_INPBShareDestination hasDeviceType](self, "hasDeviceType"))
  {
    v6 = -[_INPBShareDestination deviceType](self, "deviceType");
    if (v6 >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E228EEC8[v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("deviceType"));

  }
  return v3;
}

- (_INPBContact)contact
{
  return self->_contact;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
