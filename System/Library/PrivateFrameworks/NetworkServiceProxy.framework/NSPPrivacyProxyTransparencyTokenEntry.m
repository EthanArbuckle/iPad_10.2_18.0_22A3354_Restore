@implementation NSPPrivacyProxyTransparencyTokenEntry

- (void)clearTokenKeys
{
  -[NSMutableArray removeAllObjects](self->_tokenKeys, "removeAllObjects");
}

- (void)addTokenKeys:(id)a3
{
  id v4;
  NSMutableArray *tokenKeys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  tokenKeys = self->_tokenKeys;
  v8 = v4;
  if (!tokenKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_tokenKeys;
    self->_tokenKeys = v6;

    v4 = v8;
    tokenKeys = self->_tokenKeys;
  }
  -[NSMutableArray addObject:](tokenKeys, "addObject:", v4);

}

- (unint64_t)tokenKeysCount
{
  return -[NSMutableArray count](self->_tokenKeys, "count");
}

- (id)tokenKeysAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_tokenKeys, "objectAtIndex:", a3);
}

+ (Class)tokenKeysType
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
  v8.super_class = (Class)NSPPrivacyProxyTransparencyTokenEntry;
  -[NSPPrivacyProxyTransparencyTokenEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyTransparencyTokenEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSString *issuerName;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_configurationDeliveryStart);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("configurationDeliveryStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_configurationDeliveryEnd);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("configurationDeliveryEnd"));

  issuerName = self->_issuerName;
  if (issuerName)
    objc_msgSend(v3, "setObject:forKey:", issuerName, CFSTR("issuerName"));
  if (-[NSMutableArray count](self->_tokenKeys, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_tokenKeys, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_tokenKeys;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("tokenKeys"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTransparencyTokenEntryReadFrom(self, (uint64_t)a3);
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
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  if (!self->_issuerName)
    __assert_rtn("-[NSPPrivacyProxyTransparencyTokenEntry writeTo:]", "NSPPrivacyProxyTransparencyTokenEntry.m", 163, "nil != self->_issuerName");
  PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_tokenKeys;
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
        PBDataWriterWriteSubmessage();
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
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v4[2] = self->_configurationDeliveryStart;
  v4[1] = self->_configurationDeliveryEnd;
  v9 = v4;
  objc_msgSend(v4, "setIssuerName:", self->_issuerName);
  if (-[NSPPrivacyProxyTransparencyTokenEntry tokenKeysCount](self, "tokenKeysCount"))
  {
    objc_msgSend(v9, "clearTokenKeys");
    v5 = -[NSPPrivacyProxyTransparencyTokenEntry tokenKeysCount](self, "tokenKeysCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NSPPrivacyProxyTransparencyTokenEntry tokenKeysAtIndex:](self, "tokenKeysAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addTokenKeys:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
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

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[2] = self->_configurationDeliveryStart;
  v5[1] = self->_configurationDeliveryEnd;
  v6 = -[NSString copyWithZone:](self->_issuerName, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_tokenKeys;
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
        objc_msgSend(v5, "addTokenKeys:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *issuerName;
  NSMutableArray *tokenKeys;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_configurationDeliveryStart == v4[2]
    && self->_configurationDeliveryEnd == v4[1]
    && ((issuerName = self->_issuerName, !((unint64_t)issuerName | v4[3]))
     || -[NSString isEqual:](issuerName, "isEqual:")))
  {
    tokenKeys = self->_tokenKeys;
    if ((unint64_t)tokenKeys | v4[4])
      v7 = -[NSMutableArray isEqual:](tokenKeys, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = (2654435761u * self->_configurationDeliveryEnd) ^ (2654435761u * self->_configurationDeliveryStart);
  v4 = -[NSString hash](self->_issuerName, "hash");
  return v3 ^ v4 ^ -[NSMutableArray hash](self->_tokenKeys, "hash");
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

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_configurationDeliveryStart = *((_QWORD *)v4 + 2);
  self->_configurationDeliveryEnd = *((_QWORD *)v4 + 1);
  if (*((_QWORD *)v4 + 3))
    -[NSPPrivacyProxyTransparencyTokenEntry setIssuerName:](self, "setIssuerName:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 4);
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
        -[NSPPrivacyProxyTransparencyTokenEntry addTokenKeys:](self, "addTokenKeys:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (unint64_t)configurationDeliveryStart
{
  return self->_configurationDeliveryStart;
}

- (void)setConfigurationDeliveryStart:(unint64_t)a3
{
  self->_configurationDeliveryStart = a3;
}

- (unint64_t)configurationDeliveryEnd
{
  return self->_configurationDeliveryEnd;
}

- (void)setConfigurationDeliveryEnd:(unint64_t)a3
{
  self->_configurationDeliveryEnd = a3;
}

- (NSString)issuerName
{
  return self->_issuerName;
}

- (void)setIssuerName:(id)a3
{
  objc_storeStrong((id *)&self->_issuerName, a3);
}

- (NSMutableArray)tokenKeys
{
  return self->_tokenKeys;
}

- (void)setTokenKeys:(id)a3
{
  objc_storeStrong((id *)&self->_tokenKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenKeys, 0);
  objc_storeStrong((id *)&self->_issuerName, 0);
}

@end
