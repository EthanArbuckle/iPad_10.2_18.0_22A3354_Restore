@implementation NPKIDVRemoteDeviceProtoGenerateKeyRequest

- (BOOL)hasCredentialIdentifier
{
  return self->_credentialIdentifier != 0;
}

- (BOOL)hasKeyTypeString
{
  return self->_keyTypeString != 0;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoGenerateKeyRequest;
  -[NPKIDVRemoteDeviceProtoGenerateKeyRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceProtoGenerateKeyRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *keyTypeString;
  NSMutableArray *configuredPartitionsIdentifiers;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  credentialIdentifier = self->_credentialIdentifier;
  if (credentialIdentifier)
    objc_msgSend(v3, "setObject:forKey:", credentialIdentifier, CFSTR("credentialIdentifier"));
  keyTypeString = self->_keyTypeString;
  if (keyTypeString)
    objc_msgSend(v4, "setObject:forKey:", keyTypeString, CFSTR("keyTypeString"));
  configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
  if (configuredPartitionsIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", configuredPartitionsIdentifiers, CFSTR("configuredPartitionsIdentifiers"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoGenerateKeyRequestReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_keyTypeString)
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
  if (self->_keyTypeString)
    objc_msgSend(v8, "setKeyTypeString:");
  if (-[NPKIDVRemoteDeviceProtoGenerateKeyRequest configuredPartitionsIdentifiersCount](self, "configuredPartitionsIdentifiersCount"))
  {
    objc_msgSend(v8, "clearConfiguredPartitionsIdentifiers");
    v4 = -[NPKIDVRemoteDeviceProtoGenerateKeyRequest configuredPartitionsIdentifiersCount](self, "configuredPartitionsIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKIDVRemoteDeviceProtoGenerateKeyRequest configuredPartitionsIdentifiersAtIndex:](self, "configuredPartitionsIdentifiersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addConfiguredPartitionsIdentifiers:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_credentialIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_keyTypeString, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_configuredPartitionsIdentifiers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addConfiguredPartitionsIdentifiers:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *credentialIdentifier;
  NSString *keyTypeString;
  NSMutableArray *configuredPartitionsIdentifiers;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((credentialIdentifier = self->_credentialIdentifier, !((unint64_t)credentialIdentifier | v4[2]))
     || -[NSString isEqual:](credentialIdentifier, "isEqual:"))
    && ((keyTypeString = self->_keyTypeString, !((unint64_t)keyTypeString | v4[3]))
     || -[NSString isEqual:](keyTypeString, "isEqual:")))
  {
    configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
    if ((unint64_t)configuredPartitionsIdentifiers | v4[1])
      v8 = -[NSMutableArray isEqual:](configuredPartitionsIdentifiers, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_credentialIdentifier, "hash");
  v4 = -[NSString hash](self->_keyTypeString, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_configuredPartitionsIdentifiers, "hash");
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
    -[NPKIDVRemoteDeviceProtoGenerateKeyRequest setCredentialIdentifier:](self, "setCredentialIdentifier:");
  if (*((_QWORD *)v4 + 3))
    -[NPKIDVRemoteDeviceProtoGenerateKeyRequest setKeyTypeString:](self, "setKeyTypeString:");
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
        -[NPKIDVRemoteDeviceProtoGenerateKeyRequest addConfiguredPartitionsIdentifiers:](self, "addConfiguredPartitionsIdentifiers:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
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

- (NSString)keyTypeString
{
  return self->_keyTypeString;
}

- (void)setKeyTypeString:(id)a3
{
  objc_storeStrong((id *)&self->_keyTypeString, a3);
}

- (NSMutableArray)configuredPartitionsIdentifiers
{
  return self->_configuredPartitionsIdentifiers;
}

- (void)setConfiguredPartitionsIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_configuredPartitionsIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyTypeString, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_configuredPartitionsIdentifiers, 0);
}

@end
