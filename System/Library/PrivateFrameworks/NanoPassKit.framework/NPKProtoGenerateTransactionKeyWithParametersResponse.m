@implementation NPKProtoGenerateTransactionKeyWithParametersResponse

- (BOOL)hasTransactionKeyIdentifier
{
  return self->_transactionKeyIdentifier != 0;
}

- (void)clearTransactionKeyCertChains
{
  -[NSMutableArray removeAllObjects](self->_transactionKeyCertChains, "removeAllObjects");
}

- (void)addTransactionKeyCertChain:(id)a3
{
  id v4;
  NSMutableArray *transactionKeyCertChains;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  transactionKeyCertChains = self->_transactionKeyCertChains;
  v8 = v4;
  if (!transactionKeyCertChains)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_transactionKeyCertChains;
    self->_transactionKeyCertChains = v6;

    v4 = v8;
    transactionKeyCertChains = self->_transactionKeyCertChains;
  }
  -[NSMutableArray addObject:](transactionKeyCertChains, "addObject:", v4);

}

- (unint64_t)transactionKeyCertChainsCount
{
  return -[NSMutableArray count](self->_transactionKeyCertChains, "count");
}

- (id)transactionKeyCertChainAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_transactionKeyCertChains, "objectAtIndex:", a3);
}

+ (Class)transactionKeyCertChainType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAppletIdentifier
{
  return self->_appletIdentifier != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
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
  v8.super_class = (Class)NPKProtoGenerateTransactionKeyWithParametersResponse;
  -[NPKProtoGenerateTransactionKeyWithParametersResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoGenerateTransactionKeyWithParametersResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *transactionKeyIdentifier;
  NSMutableArray *transactionKeyCertChains;
  NSData *appletIdentifier;
  NSData *errorData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  transactionKeyIdentifier = self->_transactionKeyIdentifier;
  if (transactionKeyIdentifier)
    objc_msgSend(v3, "setObject:forKey:", transactionKeyIdentifier, CFSTR("transactionKeyIdentifier"));
  transactionKeyCertChains = self->_transactionKeyCertChains;
  if (transactionKeyCertChains)
    objc_msgSend(v4, "setObject:forKey:", transactionKeyCertChains, CFSTR("transactionKeyCertChain"));
  appletIdentifier = self->_appletIdentifier;
  if (appletIdentifier)
    objc_msgSend(v4, "setObject:forKey:", appletIdentifier, CFSTR("appletIdentifier"));
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v4, "setObject:forKey:", errorData, CFSTR("errorData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoGenerateTransactionKeyWithParametersResponseReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_transactionKeyIdentifier)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_transactionKeyCertChains;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_appletIdentifier)
    PBDataWriterWriteDataField();
  if (self->_errorData)
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
  if (self->_transactionKeyIdentifier)
    objc_msgSend(v9, "setTransactionKeyIdentifier:");
  if (-[NPKProtoGenerateTransactionKeyWithParametersResponse transactionKeyCertChainsCount](self, "transactionKeyCertChainsCount"))
  {
    objc_msgSend(v9, "clearTransactionKeyCertChains");
    v4 = -[NPKProtoGenerateTransactionKeyWithParametersResponse transactionKeyCertChainsCount](self, "transactionKeyCertChainsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NPKProtoGenerateTransactionKeyWithParametersResponse transactionKeyCertChainAtIndex:](self, "transactionKeyCertChainAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addTransactionKeyCertChain:", v7);

      }
    }
  }
  if (self->_appletIdentifier)
    objc_msgSend(v9, "setAppletIdentifier:");
  v8 = v9;
  if (self->_errorData)
  {
    objc_msgSend(v9, "setErrorData:");
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_transactionKeyIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_transactionKeyCertChains;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addTransactionKeyCertChain:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v14 = -[NSData copyWithZone:](self->_appletIdentifier, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  v16 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v17 = (void *)v5[2];
  v5[2] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *transactionKeyIdentifier;
  NSMutableArray *transactionKeyCertChains;
  NSData *appletIdentifier;
  NSData *errorData;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((transactionKeyIdentifier = self->_transactionKeyIdentifier,
         !((unint64_t)transactionKeyIdentifier | v4[4]))
     || -[NSString isEqual:](transactionKeyIdentifier, "isEqual:"))
    && ((transactionKeyCertChains = self->_transactionKeyCertChains,
         !((unint64_t)transactionKeyCertChains | v4[3]))
     || -[NSMutableArray isEqual:](transactionKeyCertChains, "isEqual:"))
    && ((appletIdentifier = self->_appletIdentifier, !((unint64_t)appletIdentifier | v4[1]))
     || -[NSData isEqual:](appletIdentifier, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[2])
      v9 = -[NSData isEqual:](errorData, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_transactionKeyIdentifier, "hash");
  v4 = -[NSMutableArray hash](self->_transactionKeyCertChains, "hash") ^ v3;
  v5 = -[NSData hash](self->_appletIdentifier, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_errorData, "hash");
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
  if (*((_QWORD *)v4 + 4))
    -[NPKProtoGenerateTransactionKeyWithParametersResponse setTransactionKeyIdentifier:](self, "setTransactionKeyIdentifier:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 3);
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
        -[NPKProtoGenerateTransactionKeyWithParametersResponse addTransactionKeyCertChain:](self, "addTransactionKeyCertChain:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 1))
    -[NPKProtoGenerateTransactionKeyWithParametersResponse setAppletIdentifier:](self, "setAppletIdentifier:");
  if (*((_QWORD *)v4 + 2))
    -[NPKProtoGenerateTransactionKeyWithParametersResponse setErrorData:](self, "setErrorData:");

}

- (NSString)transactionKeyIdentifier
{
  return self->_transactionKeyIdentifier;
}

- (void)setTransactionKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transactionKeyIdentifier, a3);
}

- (NSMutableArray)transactionKeyCertChains
{
  return self->_transactionKeyCertChains;
}

- (void)setTransactionKeyCertChains:(id)a3
{
  objc_storeStrong((id *)&self->_transactionKeyCertChains, a3);
}

- (NSData)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)setAppletIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appletIdentifier, a3);
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionKeyCertChains, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
