@implementation ACProtobufCredentialItem

- (BOOL)hasExpirationDate
{
  return self->_expirationDate != 0;
}

- (void)setIsPersistent:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isPersistent = a3;
}

- (void)setHasIsPersistent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsPersistent
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasObjectID
{
  return self->_objectID != 0;
}

- (void)clearDirtyProperties
{
  -[NSMutableArray removeAllObjects](self->_dirtyProperties, "removeAllObjects");
}

- (void)addDirtyProperties:(id)a3
{
  id v4;
  NSMutableArray *dirtyProperties;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  v8 = v4;
  if (!dirtyProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    v4 = v8;
    dirtyProperties = self->_dirtyProperties;
  }
  -[NSMutableArray addObject:](dirtyProperties, "addObject:", v4);

}

- (unint64_t)dirtyPropertiesCount
{
  return -[NSMutableArray count](self->_dirtyProperties, "count");
}

- (id)dirtyPropertiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_dirtyProperties, "objectAtIndex:", a3);
}

+ (Class)dirtyPropertiesType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)ACProtobufCredentialItem;
  -[ACProtobufCredentialItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACProtobufCredentialItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *accountIdentifier;
  ACProtobufDate *expirationDate;
  void *v7;
  NSString *serviceName;
  void *v9;
  ACProtobufURL *objectID;
  void *v11;
  NSMutableArray *dirtyProperties;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
    objc_msgSend(v3, "setObject:forKey:", accountIdentifier, CFSTR("accountIdentifier"));
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    -[ACProtobufDate dictionaryRepresentation](expirationDate, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("expirationDate"));

  }
  serviceName = self->_serviceName;
  if (serviceName)
    objc_msgSend(v4, "setObject:forKey:", serviceName, CFSTR("serviceName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPersistent);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("isPersistent"));

  }
  objectID = self->_objectID;
  if (objectID)
  {
    -[ACProtobufURL dictionaryRepresentation](objectID, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("objectID"));

  }
  dirtyProperties = self->_dirtyProperties;
  if (dirtyProperties)
    objc_msgSend(v4, "setObject:forKey:", dirtyProperties, CFSTR("dirtyProperties"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufCredentialItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteStringField();
  if (self->_expirationDate)
    PBDataWriterWriteSubmessage();
  PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_objectID)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_dirtyProperties;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _BYTE *v8;

  v8 = a3;
  objc_msgSend(v8, "setAccountIdentifier:", self->_accountIdentifier);
  if (self->_expirationDate)
    objc_msgSend(v8, "setExpirationDate:");
  objc_msgSend(v8, "setServiceName:", self->_serviceName);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[48] = self->_isPersistent;
    v8[52] |= 1u;
  }
  if (self->_objectID)
    objc_msgSend(v8, "setObjectID:");
  if (-[ACProtobufCredentialItem dirtyPropertiesCount](self, "dirtyPropertiesCount"))
  {
    objc_msgSend(v8, "clearDirtyProperties");
    v4 = -[ACProtobufCredentialItem dirtyPropertiesCount](self, "dirtyPropertiesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ACProtobufCredentialItem dirtyPropertiesAtIndex:](self, "dirtyPropertiesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addDirtyProperties:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[ACProtobufDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_isPersistent;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v12 = -[ACProtobufURL copyWithZone:](self->_objectID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_dirtyProperties;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addDirtyProperties:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *accountIdentifier;
  ACProtobufDate *expirationDate;
  NSString *serviceName;
  ACProtobufURL *objectID;
  NSMutableArray *dirtyProperties;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  accountIdentifier = self->_accountIdentifier;
  if ((unint64_t)accountIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountIdentifier, "isEqual:"))
      goto LABEL_20;
  }
  expirationDate = self->_expirationDate;
  if ((unint64_t)expirationDate | *((_QWORD *)v4 + 3))
  {
    if (!-[ACProtobufDate isEqual:](expirationDate, "isEqual:"))
      goto LABEL_20;
  }
  serviceName = self->_serviceName;
  if ((unint64_t)serviceName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](serviceName, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) != 0)
    {
      if (self->_isPersistent)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_20;
        goto LABEL_16;
      }
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_16;
    }
LABEL_20:
    v10 = 0;
    goto LABEL_21;
  }
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
    goto LABEL_20;
LABEL_16:
  objectID = self->_objectID;
  if ((unint64_t)objectID | *((_QWORD *)v4 + 4) && !-[ACProtobufURL isEqual:](objectID, "isEqual:"))
    goto LABEL_20;
  dirtyProperties = self->_dirtyProperties;
  if ((unint64_t)dirtyProperties | *((_QWORD *)v4 + 2))
    v10 = -[NSMutableArray isEqual:](dirtyProperties, "isEqual:");
  else
    v10 = 1;
LABEL_21:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[NSString hash](self->_accountIdentifier, "hash");
  v4 = -[ACProtobufDate hash](self->_expirationDate, "hash");
  v5 = -[NSString hash](self->_serviceName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_isPersistent;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[ACProtobufURL hash](self->_objectID, "hash");
  return v7 ^ v8 ^ -[NSMutableArray hash](self->_dirtyProperties, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ACProtobufDate *expirationDate;
  uint64_t v6;
  ACProtobufURL *objectID;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 1))
    -[ACProtobufCredentialItem setAccountIdentifier:](self, "setAccountIdentifier:");
  expirationDate = self->_expirationDate;
  v6 = *((_QWORD *)v4 + 3);
  if (expirationDate)
  {
    if (v6)
      -[ACProtobufDate mergeFrom:](expirationDate, "mergeFrom:");
  }
  else if (v6)
  {
    -[ACProtobufCredentialItem setExpirationDate:](self, "setExpirationDate:");
  }
  if (*((_QWORD *)v4 + 5))
    -[ACProtobufCredentialItem setServiceName:](self, "setServiceName:");
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_isPersistent = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 1u;
  }
  objectID = self->_objectID;
  v8 = *((_QWORD *)v4 + 4);
  if (objectID)
  {
    if (v8)
      -[ACProtobufURL mergeFrom:](objectID, "mergeFrom:");
  }
  else if (v8)
  {
    -[ACProtobufCredentialItem setObjectID:](self, "setObjectID:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v4 + 2);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[ACProtobufCredentialItem addDirtyProperties:](self, "addDirtyProperties:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (ACProtobufDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (BOOL)isPersistent
{
  return self->_isPersistent;
}

- (ACProtobufURL)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (NSMutableArray)dirtyProperties
{
  return self->_dirtyProperties;
}

- (void)setDirtyProperties:(id)a3
{
  objc_storeStrong((id *)&self->_dirtyProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
