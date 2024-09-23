@implementation _MROriginProtobuf

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_deviceInfoDeprecated, 0);
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setIsLocallyHosted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isLocallyHosted = a3;
}

- (void)setIdentifier:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_identifier = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setHasIsLocallyHosted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_type;
  else
    return 1;
}

- (int)identifier
{
  return self->_identifier;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_deviceInfoDeprecated)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();

}

- (BOOL)readFrom:(id)a3
{
  return _MROriginProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("Local");
  if (a3 == 2)
  {
    v3 = CFSTR("Custom");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Local")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Custom")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasIdentifier
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDeviceInfoDeprecated
{
  return self->_deviceInfoDeprecated != 0;
}

- (BOOL)hasIsLocallyHosted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MROriginProtobuf;
  -[_MROriginProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MROriginProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int type;
  __CFString *v5;
  NSString *displayName;
  void *v7;
  _MRDeviceInfoMessageProtobuf *deviceInfoDeprecated;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    type = self->_type;
    if (type == 1)
    {
      v5 = CFSTR("Local");
    }
    else if (type == 2)
    {
      v5 = CFSTR("Custom");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v3, "setObject:forKey:", displayName, CFSTR("displayName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_identifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("identifier"));

  }
  deviceInfoDeprecated = self->_deviceInfoDeprecated;
  if (deviceInfoDeprecated)
  {
    -[_MRDeviceInfoMessageProtobuf dictionaryRepresentation](deviceInfoDeprecated, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("deviceInfoDeprecated"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLocallyHosted);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isLocallyHosted"));

  }
  return v3;
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[7] = self->_type;
    *((_BYTE *)v4 + 36) |= 2u;
  }
  v5 = v4;
  if (self->_displayName)
  {
    objc_msgSend(v4, "setDisplayName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_identifier;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  if (self->_deviceInfoDeprecated)
  {
    objc_msgSend(v5, "setDeviceInfoDeprecated:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_isLocallyHosted;
    *((_BYTE *)v4 + 36) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_type;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_identifier;
    *(_BYTE *)(v6 + 36) |= 1u;
  }
  v9 = -[_MRDeviceInfoMessageProtobuf copyWithZone:](self->_deviceInfoDeprecated, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v6 + 32) = self->_isLocallyHosted;
    *(_BYTE *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *displayName;
  _MRDeviceInfoMessageProtobuf *deviceInfoDeprecated;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_type != *((_DWORD *)v4 + 7))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_20;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_20;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_identifier != *((_DWORD *)v4 + 6))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_20;
  }
  deviceInfoDeprecated = self->_deviceInfoDeprecated;
  if ((unint64_t)deviceInfoDeprecated | *((_QWORD *)v4 + 1))
  {
    if (!-[_MRDeviceInfoMessageProtobuf isEqual:](deviceInfoDeprecated, "isEqual:"))
      goto LABEL_20;
    has = (char)self->_has;
  }
  v8 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) != 0)
    {
      if (self->_isLocallyHosted)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_20;
      }
      else if (*((_BYTE *)v4 + 32))
      {
        goto LABEL_20;
      }
      v8 = 1;
      goto LABEL_21;
    }
LABEL_20:
    v8 = 0;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_displayName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_identifier;
  else
    v5 = 0;
  v6 = -[_MRDeviceInfoMessageProtobuf hash](self->_deviceInfoDeprecated, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_isLocallyHosted;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  _MRDeviceInfoMessageProtobuf *deviceInfoDeprecated;
  uint64_t v7;
  _DWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((v4[9] & 2) != 0)
  {
    self->_type = v4[7];
    *(_BYTE *)&self->_has |= 2u;
  }
  v8 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[_MROriginProtobuf setDisplayName:](self, "setDisplayName:");
    v5 = v8;
  }
  if ((*((_BYTE *)v5 + 36) & 1) != 0)
  {
    self->_identifier = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  deviceInfoDeprecated = self->_deviceInfoDeprecated;
  v7 = *((_QWORD *)v5 + 1);
  if (deviceInfoDeprecated)
  {
    if (!v7)
      goto LABEL_13;
    -[_MRDeviceInfoMessageProtobuf mergeFrom:](deviceInfoDeprecated, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[_MROriginProtobuf setDeviceInfoDeprecated:](self, "setDeviceInfoDeprecated:");
  }
  v5 = v8;
LABEL_13:
  if ((*((_BYTE *)v5 + 36) & 4) != 0)
  {
    self->_isLocallyHosted = *((_BYTE *)v5 + 32);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)displayName
{
  return self->_displayName;
}

- (_MRDeviceInfoMessageProtobuf)deviceInfoDeprecated
{
  return self->_deviceInfoDeprecated;
}

- (void)setDeviceInfoDeprecated:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfoDeprecated, a3);
}

- (BOOL)isLocallyHosted
{
  return self->_isLocallyHosted;
}

@end
