@implementation C2MPPathInfo

- (void)setInterfaceType:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceType, a3);
}

- (void)setApplicationBytesSent:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_applicationBytesSent = a3;
}

- (void)setApplicationBytesReceived:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_applicationBytesReceived = a3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *interfaceType;
  NSString *radioType;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  interfaceType = self->_interfaceType;
  if (interfaceType)
    objc_msgSend(v3, "setObject:forKey:", interfaceType, CFSTR("interface_type"));
  radioType = self->_radioType;
  if (radioType)
    objc_msgSend(v4, "setObject:forKey:", radioType, CFSTR("radio_type"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_applicationBytesSent);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("application_bytes_sent"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_applicationBytesReceived);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("application_bytes_received"));

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioType, 0);
  objc_storeStrong((id *)&self->_interfaceType, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_interfaceType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_radioType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }

}

- (BOOL)hasInterfaceType
{
  return self->_interfaceType != 0;
}

- (BOOL)hasRadioType
{
  return self->_radioType != 0;
}

- (void)setHasApplicationBytesSent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasApplicationBytesSent
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasApplicationBytesReceived:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasApplicationBytesReceived
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)C2MPPathInfo;
  -[C2MPPathInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[C2MPPathInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPPathInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_interfaceType)
  {
    objc_msgSend(v4, "setInterfaceType:");
    v4 = v6;
  }
  if (self->_radioType)
  {
    objc_msgSend(v6, "setRadioType:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_applicationBytesSent;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_applicationBytesReceived;
    *((_BYTE *)v4 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_interfaceType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_radioType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_applicationBytesSent;
    *(_BYTE *)(v5 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_applicationBytesReceived;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *interfaceType;
  NSString *radioType;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  interfaceType = self->_interfaceType;
  if ((unint64_t)interfaceType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](interfaceType, "isEqual:"))
      goto LABEL_15;
  }
  radioType = self->_radioType;
  if ((unint64_t)radioType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](radioType, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_applicationBytesSent != *((_QWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_applicationBytesReceived != *((_QWORD *)v4 + 1))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_interfaceType, "hash");
  v4 = -[NSString hash](self->_radioType, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761u * self->_applicationBytesSent;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761u * self->_applicationBytesReceived;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  char v5;
  unint64_t *v6;

  v4 = (unint64_t *)a3;
  v6 = v4;
  if (v4[3])
  {
    -[C2MPPathInfo setInterfaceType:](self, "setInterfaceType:");
    v4 = v6;
  }
  if (v4[4])
  {
    -[C2MPPathInfo setRadioType:](self, "setRadioType:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_applicationBytesSent = v4[2];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 1) != 0)
  {
    self->_applicationBytesReceived = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)interfaceType
{
  return self->_interfaceType;
}

- (NSString)radioType
{
  return self->_radioType;
}

- (void)setRadioType:(id)a3
{
  objc_storeStrong((id *)&self->_radioType, a3);
}

- (unint64_t)applicationBytesSent
{
  return self->_applicationBytesSent;
}

- (unint64_t)applicationBytesReceived
{
  return self->_applicationBytesReceived;
}

@end
