@implementation NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest

- (BOOL)hasCredentialIdentifier
{
  return self->_credentialIdentifier != 0;
}

- (void)clearConfiguredPartitionsIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_configuredPartitionsIdentifiers, "removeAllObjects");
}

- (void)addConfiguredPartitionsIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *configuredPartitionsIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
  v8 = v4;
  if (!configuredPartitionsIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_configuredPartitionsIdentifiers;
    self->_configuredPartitionsIdentifiers = v6;

    v4 = v8;
    configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
  }
  -[NSMutableArray addObject:](configuredPartitionsIdentifiers, "addObject:", v4);

}

- (unint64_t)configuredPartitionsIdentifiersCount
{
  return -[NSMutableArray count](self->_configuredPartitionsIdentifiers, "count");
}

- (id)configuredPartitionsIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_configuredPartitionsIdentifiers, "objectAtIndex:", a3);
}

+ (Class)configuredPartitionsIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)setNumKeys:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numKeys = a3;
}

- (void)setHasNumKeys:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumKeys
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest;
  -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *credentialIdentifier;
  NSMutableArray *configuredPartitionsIdentifiers;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  credentialIdentifier = self->_credentialIdentifier;
  if (credentialIdentifier)
    objc_msgSend(v3, "setObject:forKey:", credentialIdentifier, CFSTR("credentialIdentifier"));
  configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
  if (configuredPartitionsIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", configuredPartitionsIdentifiers, CFSTR("configuredPartitionsIdentifiers"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numKeys);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("numKeys"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequestReadFrom((uint64_t)self, (uint64_t)a3);
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_credentialIdentifier)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_configuredPartitionsIdentifiers;
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_credentialIdentifier)
    objc_msgSend(v8, "setCredentialIdentifier:");
  if (-[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest configuredPartitionsIdentifiersCount](self, "configuredPartitionsIdentifiersCount"))
  {
    objc_msgSend(v8, "clearConfiguredPartitionsIdentifiers");
    v4 = -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest configuredPartitionsIdentifiersCount](self, "configuredPartitionsIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest configuredPartitionsIdentifiersAtIndex:](self, "configuredPartitionsIdentifiersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addConfiguredPartitionsIdentifiers:", v7);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v8 + 6) = self->_numKeys;
    *((_BYTE *)v8 + 28) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_credentialIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_configuredPartitionsIdentifiers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v5, "addConfiguredPartitionsIdentifiers:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_numKeys;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *credentialIdentifier;
  NSMutableArray *configuredPartitionsIdentifiers;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  credentialIdentifier = self->_credentialIdentifier;
  if ((unint64_t)credentialIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](credentialIdentifier, "isEqual:"))
      goto LABEL_10;
  }
  configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
  if ((unint64_t)configuredPartitionsIdentifiers | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](configuredPartitionsIdentifiers, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_numKeys == *((_DWORD *)v4 + 6))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_credentialIdentifier, "hash");
  v4 = -[NSMutableArray hash](self->_configuredPartitionsIdentifiers, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_numKeys;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest setCredentialIdentifier:](self, "setCredentialIdentifier:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest addConfiguredPartitionsIdentifiers:](self, "addConfiguredPartitionsIdentifiers:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_numKeys = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialIdentifier, a3);
}

- (NSMutableArray)configuredPartitionsIdentifiers
{
  return self->_configuredPartitionsIdentifiers;
}

- (void)setConfiguredPartitionsIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_configuredPartitionsIdentifiers, a3);
}

- (unsigned)numKeys
{
  return self->_numKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_configuredPartitionsIdentifiers, 0);
}

@end
