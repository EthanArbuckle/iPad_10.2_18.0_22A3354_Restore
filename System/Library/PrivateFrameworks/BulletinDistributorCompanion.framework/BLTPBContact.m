@implementation BLTPBContact

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasCnContactIdentifier
{
  return self->_cnContactIdentifier != 0;
}

- (BOOL)hasCnContactFullname
{
  return self->_cnContactFullname != 0;
}

- (void)setDisplayNameSuggested:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_displayNameSuggested = a3;
}

- (void)setHasDisplayNameSuggested:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayNameSuggested
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCustomIdentifier
{
  return self->_customIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BLTPBContact;
  -[BLTPBContact description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBContact dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *handle;
  void *v6;
  NSString *serviceName;
  NSString *displayName;
  NSString *cnContactIdentifier;
  NSString *cnContactFullname;
  void *v11;
  void *v12;
  NSString *customIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  handle = self->_handle;
  if (handle)
    objc_msgSend(v3, "setObject:forKey:", handle, CFSTR("handle"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_handleType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("handleType"));

  serviceName = self->_serviceName;
  if (serviceName)
    objc_msgSend(v4, "setObject:forKey:", serviceName, CFSTR("serviceName"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  cnContactIdentifier = self->_cnContactIdentifier;
  if (cnContactIdentifier)
    objc_msgSend(v4, "setObject:forKey:", cnContactIdentifier, CFSTR("cnContactIdentifier"));
  cnContactFullname = self->_cnContactFullname;
  if (cnContactFullname)
    objc_msgSend(v4, "setObject:forKey:", cnContactFullname, CFSTR("cnContactFullname"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cnContactIdentifierSuggested);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("cnContactIdentifierSuggested"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_displayNameSuggested);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("displayNameSuggested"));

  }
  customIdentifier = self->_customIdentifier;
  if (customIdentifier)
    objc_msgSend(v4, "setObject:forKey:", customIdentifier, CFSTR("customIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBContactReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_handle)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_serviceName)
    PBDataWriterWriteStringField();
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if (self->_cnContactIdentifier)
    PBDataWriterWriteStringField();
  if (self->_cnContactFullname)
    PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v4 = v5;
  if (self->_customIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    v4 = v5;
  }
  *((_DWORD *)v4 + 12) = self->_handleType;
  if (self->_serviceName)
  {
    objc_msgSend(v5, "setServiceName:");
    v4 = v5;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    v4 = v5;
  }
  if (self->_cnContactIdentifier)
  {
    objc_msgSend(v5, "setCnContactIdentifier:");
    v4 = v5;
  }
  if (self->_cnContactFullname)
  {
    objc_msgSend(v5, "setCnContactFullname:");
    v4 = v5;
  }
  *((_BYTE *)v4 + 64) = self->_cnContactIdentifierSuggested;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)v4 + 65) = self->_displayNameSuggested;
    *((_BYTE *)v4 + 68) |= 1u;
  }
  if (self->_customIdentifier)
  {
    objc_msgSend(v5, "setCustomIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_handle, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  *(_DWORD *)(v5 + 48) = self->_handleType;
  v8 = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_cnContactIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v14 = -[NSString copyWithZone:](self->_cnContactFullname, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v14;

  *(_BYTE *)(v5 + 64) = self->_cnContactIdentifierSuggested;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 65) = self->_displayNameSuggested;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v16 = -[NSString copyWithZone:](self->_customIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *handle;
  NSString *serviceName;
  NSString *displayName;
  NSString *cnContactIdentifier;
  NSString *cnContactFullname;
  char v10;
  NSString *customIdentifier;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  handle = self->_handle;
  if ((unint64_t)handle | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](handle, "isEqual:"))
      goto LABEL_21;
  }
  if (self->_handleType != *((_DWORD *)v4 + 12))
    goto LABEL_21;
  serviceName = self->_serviceName;
  if ((unint64_t)serviceName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](serviceName, "isEqual:"))
      goto LABEL_21;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_21;
  }
  cnContactIdentifier = self->_cnContactIdentifier;
  if ((unint64_t)cnContactIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](cnContactIdentifier, "isEqual:"))
      goto LABEL_21;
  }
  cnContactFullname = self->_cnContactFullname;
  if ((unint64_t)cnContactFullname | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](cnContactFullname, "isEqual:"))
      goto LABEL_21;
  }
  if (self->_cnContactIdentifierSuggested)
  {
    if (!*((_BYTE *)v4 + 64))
      goto LABEL_21;
  }
  else if (*((_BYTE *)v4 + 64))
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0)
      goto LABEL_27;
LABEL_21:
    v10 = 0;
    goto LABEL_22;
  }
  if ((*((_BYTE *)v4 + 68) & 1) == 0)
    goto LABEL_21;
  if (!self->_displayNameSuggested)
  {
    if (!*((_BYTE *)v4 + 65))
      goto LABEL_27;
    goto LABEL_21;
  }
  if (!*((_BYTE *)v4 + 65))
    goto LABEL_21;
LABEL_27:
  customIdentifier = self->_customIdentifier;
  if ((unint64_t)customIdentifier | *((_QWORD *)v4 + 3))
    v10 = -[NSString isEqual:](customIdentifier, "isEqual:");
  else
    v10 = 1;
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unsigned int handleType;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _BOOL4 cnContactIdentifierSuggested;
  uint64_t v10;

  v3 = -[NSString hash](self->_handle, "hash");
  handleType = self->_handleType;
  v5 = -[NSString hash](self->_serviceName, "hash");
  v6 = -[NSString hash](self->_displayName, "hash");
  v7 = -[NSString hash](self->_cnContactIdentifier, "hash");
  v8 = -[NSString hash](self->_cnContactFullname, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v10 = 2654435761 * self->_displayNameSuggested;
  else
    v10 = 0;
  cnContactIdentifierSuggested = self->_cnContactIdentifierSuggested;
  return (2654435761 * handleType) ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761 * cnContactIdentifierSuggested) ^ v10 ^ -[NSString hash](self->_customIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[BLTPBContact setHandle:](self, "setHandle:");
    v4 = v5;
  }
  self->_handleType = *((_DWORD *)v4 + 12);
  if (*((_QWORD *)v4 + 7))
  {
    -[BLTPBContact setServiceName:](self, "setServiceName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BLTPBContact setDisplayName:](self, "setDisplayName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BLTPBContact setCnContactIdentifier:](self, "setCnContactIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[BLTPBContact setCnContactFullname:](self, "setCnContactFullname:");
    v4 = v5;
  }
  self->_cnContactIdentifierSuggested = *((_BYTE *)v4 + 64);
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_displayNameSuggested = *((_BYTE *)v4 + 65);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BLTPBContact setCustomIdentifier:](self, "setCustomIdentifier:");
    v4 = v5;
  }

}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (unsigned)handleType
{
  return self->_handleType;
}

- (void)setHandleType:(unsigned int)a3
{
  self->_handleType = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (void)setCnContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cnContactIdentifier, a3);
}

- (NSString)cnContactFullname
{
  return self->_cnContactFullname;
}

- (void)setCnContactFullname:(id)a3
{
  objc_storeStrong((id *)&self->_cnContactFullname, a3);
}

- (BOOL)cnContactIdentifierSuggested
{
  return self->_cnContactIdentifierSuggested;
}

- (void)setCnContactIdentifierSuggested:(BOOL)a3
{
  self->_cnContactIdentifierSuggested = a3;
}

- (BOOL)displayNameSuggested
{
  return self->_displayNameSuggested;
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (void)setCustomIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_customIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
  objc_storeStrong((id *)&self->_cnContactFullname, 0);
}

@end
