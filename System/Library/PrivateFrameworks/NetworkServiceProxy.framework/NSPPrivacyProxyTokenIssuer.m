@implementation NSPPrivacyProxyTokenIssuer

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

- (BOOL)hasTransparencyKeyBundle
{
  return self->_transparencyKeyBundle != 0;
}

- (BOOL)hasTransparencyProof
{
  return self->_transparencyProof != 0;
}

- (BOOL)hasTransparencyInternalProof
{
  return self->_transparencyInternalProof != 0;
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
  v8.super_class = (Class)NSPPrivacyProxyTokenIssuer;
  -[NSPPrivacyProxyTokenIssuer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyTokenIssuer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *issuerName;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSData *transparencyKeyBundle;
  NSData *transparencyProof;
  NSData *transparencyInternalProof;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  issuerName = self->_issuerName;
  if (issuerName)
    objc_msgSend(v3, "setObject:forKey:", issuerName, CFSTR("issuerName"));
  if (-[NSMutableArray count](self->_tokenKeys, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_tokenKeys, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_tokenKeys;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("tokenKeys"));
  }
  transparencyKeyBundle = self->_transparencyKeyBundle;
  if (transparencyKeyBundle)
    objc_msgSend(v4, "setObject:forKey:", transparencyKeyBundle, CFSTR("transparencyKeyBundle"));
  transparencyProof = self->_transparencyProof;
  if (transparencyProof)
    objc_msgSend(v4, "setObject:forKey:", transparencyProof, CFSTR("transparencyProof"));
  transparencyInternalProof = self->_transparencyInternalProof;
  if (transparencyInternalProof)
    objc_msgSend(v4, "setObject:forKey:", transparencyInternalProof, CFSTR("transparencyInternalProof"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTokenIssuerReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_issuerName)
    __assert_rtn("-[NSPPrivacyProxyTokenIssuer writeTo:]", "NSPPrivacyProxyTokenIssuer.m", 186, "nil != self->_issuerName");
  v5 = v4;
  PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_tokenKeys;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_transparencyKeyBundle)
    PBDataWriterWriteDataField();
  if (self->_transparencyProof)
    PBDataWriterWriteDataField();
  if (self->_transparencyInternalProof)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setIssuerName:", self->_issuerName);
  if (-[NSPPrivacyProxyTokenIssuer tokenKeysCount](self, "tokenKeysCount"))
  {
    objc_msgSend(v9, "clearTokenKeys");
    v4 = -[NSPPrivacyProxyTokenIssuer tokenKeysCount](self, "tokenKeysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NSPPrivacyProxyTokenIssuer tokenKeysAtIndex:](self, "tokenKeysAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addTokenKeys:", v7);

      }
    }
  }
  if (self->_transparencyKeyBundle)
    objc_msgSend(v9, "setTransparencyKeyBundle:");
  v8 = v9;
  if (self->_transparencyProof)
  {
    objc_msgSend(v9, "setTransparencyProof:");
    v8 = v9;
  }
  if (self->_transparencyInternalProof)
  {
    objc_msgSend(v9, "setTransparencyInternalProof:");
    v8 = v9;
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_issuerName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_tokenKeys;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addTokenKeys:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v14 = -[NSData copyWithZone:](self->_transparencyKeyBundle, "copyWithZone:", a3);
  v15 = (void *)v5[4];
  v5[4] = v14;

  v16 = -[NSData copyWithZone:](self->_transparencyProof, "copyWithZone:", a3);
  v17 = (void *)v5[5];
  v5[5] = v16;

  v18 = -[NSData copyWithZone:](self->_transparencyInternalProof, "copyWithZone:", a3);
  v19 = (void *)v5[3];
  v5[3] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *issuerName;
  NSMutableArray *tokenKeys;
  NSData *transparencyKeyBundle;
  NSData *transparencyProof;
  NSData *transparencyInternalProof;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((issuerName = self->_issuerName, !((unint64_t)issuerName | v4[1]))
     || -[NSString isEqual:](issuerName, "isEqual:"))
    && ((tokenKeys = self->_tokenKeys, !((unint64_t)tokenKeys | v4[2]))
     || -[NSMutableArray isEqual:](tokenKeys, "isEqual:"))
    && ((transparencyKeyBundle = self->_transparencyKeyBundle, !((unint64_t)transparencyKeyBundle | v4[4]))
     || -[NSData isEqual:](transparencyKeyBundle, "isEqual:"))
    && ((transparencyProof = self->_transparencyProof, !((unint64_t)transparencyProof | v4[5]))
     || -[NSData isEqual:](transparencyProof, "isEqual:")))
  {
    transparencyInternalProof = self->_transparencyInternalProof;
    if ((unint64_t)transparencyInternalProof | v4[3])
      v10 = -[NSData isEqual:](transparencyInternalProof, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_issuerName, "hash");
  v4 = -[NSMutableArray hash](self->_tokenKeys, "hash") ^ v3;
  v5 = -[NSData hash](self->_transparencyKeyBundle, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_transparencyProof, "hash");
  return v6 ^ -[NSData hash](self->_transparencyInternalProof, "hash");
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
  if (*((_QWORD *)v4 + 1))
    -[NSPPrivacyProxyTokenIssuer setIssuerName:](self, "setIssuerName:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 2);
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
        -[NSPPrivacyProxyTokenIssuer addTokenKeys:](self, "addTokenKeys:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 4))
    -[NSPPrivacyProxyTokenIssuer setTransparencyKeyBundle:](self, "setTransparencyKeyBundle:");
  if (*((_QWORD *)v4 + 5))
    -[NSPPrivacyProxyTokenIssuer setTransparencyProof:](self, "setTransparencyProof:");
  if (*((_QWORD *)v4 + 3))
    -[NSPPrivacyProxyTokenIssuer setTransparencyInternalProof:](self, "setTransparencyInternalProof:");

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

- (NSData)transparencyKeyBundle
{
  return self->_transparencyKeyBundle;
}

- (void)setTransparencyKeyBundle:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyKeyBundle, a3);
}

- (NSData)transparencyProof
{
  return self->_transparencyProof;
}

- (void)setTransparencyProof:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyProof, a3);
}

- (NSData)transparencyInternalProof
{
  return self->_transparencyInternalProof;
}

- (void)setTransparencyInternalProof:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyInternalProof, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyProof, 0);
  objc_storeStrong((id *)&self->_transparencyKeyBundle, 0);
  objc_storeStrong((id *)&self->_transparencyInternalProof, 0);
  objc_storeStrong((id *)&self->_tokenKeys, 0);
  objc_storeStrong((id *)&self->_issuerName, 0);
}

@end
