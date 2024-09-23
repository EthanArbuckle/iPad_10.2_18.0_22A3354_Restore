@implementation NSPPrivacyProxyTokenInfo

- (void)clearUnactivatedTokenLists
{
  -[NSMutableArray removeAllObjects](self->_unactivatedTokenLists, "removeAllObjects");
}

- (void)addUnactivatedTokenList:(id)a3
{
  id v4;
  NSMutableArray *unactivatedTokenLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  unactivatedTokenLists = self->_unactivatedTokenLists;
  v8 = v4;
  if (!unactivatedTokenLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_unactivatedTokenLists;
    self->_unactivatedTokenLists = v6;

    v4 = v8;
    unactivatedTokenLists = self->_unactivatedTokenLists;
  }
  -[NSMutableArray addObject:](unactivatedTokenLists, "addObject:", v4);

}

- (unint64_t)unactivatedTokenListsCount
{
  return -[NSMutableArray count](self->_unactivatedTokenLists, "count");
}

- (id)unactivatedTokenListAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_unactivatedTokenLists, "objectAtIndex:", a3);
}

+ (Class)unactivatedTokenListType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasVendor
{
  return self->_vendor != 0;
}

- (void)clearTokenRequestLists
{
  -[NSMutableArray removeAllObjects](self->_tokenRequestLists, "removeAllObjects");
}

- (void)addTokenRequestList:(id)a3
{
  id v4;
  NSMutableArray *tokenRequestLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  tokenRequestLists = self->_tokenRequestLists;
  v8 = v4;
  if (!tokenRequestLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_tokenRequestLists;
    self->_tokenRequestLists = v6;

    v4 = v8;
    tokenRequestLists = self->_tokenRequestLists;
  }
  -[NSMutableArray addObject:](tokenRequestLists, "addObject:", v4);

}

- (unint64_t)tokenRequestListsCount
{
  return -[NSMutableArray count](self->_tokenRequestLists, "count");
}

- (id)tokenRequestListAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_tokenRequestLists, "objectAtIndex:", a3);
}

+ (Class)tokenRequestListType
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
  v8.super_class = (Class)NSPPrivacyProxyTokenInfo;
  -[NSPPrivacyProxyTokenInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyTokenInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *proxyURL;
  NSData *tokenKeyID;
  NSMutableArray *unactivatedTokenLists;
  NSString *vendor;
  NSMutableArray *tokenRequestLists;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  proxyURL = self->_proxyURL;
  if (proxyURL)
    objc_msgSend(v3, "setObject:forKey:", proxyURL, CFSTR("proxyURL"));
  tokenKeyID = self->_tokenKeyID;
  if (tokenKeyID)
    objc_msgSend(v4, "setObject:forKey:", tokenKeyID, CFSTR("tokenKeyID"));
  unactivatedTokenLists = self->_unactivatedTokenLists;
  if (unactivatedTokenLists)
    objc_msgSend(v4, "setObject:forKey:", unactivatedTokenLists, CFSTR("unactivatedTokenList"));
  vendor = self->_vendor;
  if (vendor)
    objc_msgSend(v4, "setObject:forKey:", vendor, CFSTR("vendor"));
  tokenRequestLists = self->_tokenRequestLists;
  if (tokenRequestLists)
    objc_msgSend(v4, "setObject:forKey:", tokenRequestLists, CFSTR("tokenRequestList"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTokenInfoReadFrom((char *)self, (uint64_t)a3);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_proxyURL)
    __assert_rtn("-[NSPPrivacyProxyTokenInfo writeTo:]", "NSPPrivacyProxyTokenInfo.m", 187, "nil != self->_proxyURL");
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_tokenKeyID)
    __assert_rtn("-[NSPPrivacyProxyTokenInfo writeTo:]", "NSPPrivacyProxyTokenInfo.m", 192, "nil != self->_tokenKeyID");
  PBDataWriterWriteDataField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_unactivatedTokenLists;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  if (self->_vendor)
    PBDataWriterWriteStringField();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_tokenRequestLists;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteDataField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "setProxyURL:", self->_proxyURL);
  objc_msgSend(v12, "setTokenKeyID:", self->_tokenKeyID);
  if (-[NSPPrivacyProxyTokenInfo unactivatedTokenListsCount](self, "unactivatedTokenListsCount"))
  {
    objc_msgSend(v12, "clearUnactivatedTokenLists");
    v4 = -[NSPPrivacyProxyTokenInfo unactivatedTokenListsCount](self, "unactivatedTokenListsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NSPPrivacyProxyTokenInfo unactivatedTokenListAtIndex:](self, "unactivatedTokenListAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addUnactivatedTokenList:", v7);

      }
    }
  }
  if (self->_vendor)
    objc_msgSend(v12, "setVendor:");
  if (-[NSPPrivacyProxyTokenInfo tokenRequestListsCount](self, "tokenRequestListsCount"))
  {
    objc_msgSend(v12, "clearTokenRequestLists");
    v8 = -[NSPPrivacyProxyTokenInfo tokenRequestListsCount](self, "tokenRequestListsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NSPPrivacyProxyTokenInfo tokenRequestListAtIndex:](self, "tokenRequestListAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addTokenRequestList:", v11);

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
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_proxyURL, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_tokenKeyID, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = self->_unactivatedTokenLists;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend(v5, "addUnactivatedTokenList:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_vendor, "copyWithZone:", a3);
  v17 = (void *)v5[5];
  v5[5] = v16;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_tokenRequestLists;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addTokenRequestList:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *proxyURL;
  NSData *tokenKeyID;
  NSMutableArray *unactivatedTokenLists;
  NSString *vendor;
  NSMutableArray *tokenRequestLists;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((proxyURL = self->_proxyURL, !((unint64_t)proxyURL | v4[1]))
     || -[NSString isEqual:](proxyURL, "isEqual:"))
    && ((tokenKeyID = self->_tokenKeyID, !((unint64_t)tokenKeyID | v4[2]))
     || -[NSData isEqual:](tokenKeyID, "isEqual:"))
    && ((unactivatedTokenLists = self->_unactivatedTokenLists, !((unint64_t)unactivatedTokenLists | v4[4]))
     || -[NSMutableArray isEqual:](unactivatedTokenLists, "isEqual:"))
    && ((vendor = self->_vendor, !((unint64_t)vendor | v4[5]))
     || -[NSString isEqual:](vendor, "isEqual:")))
  {
    tokenRequestLists = self->_tokenRequestLists;
    if ((unint64_t)tokenRequestLists | v4[3])
      v10 = -[NSMutableArray isEqual:](tokenRequestLists, "isEqual:");
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
  NSUInteger v6;

  v3 = -[NSString hash](self->_proxyURL, "hash");
  v4 = -[NSData hash](self->_tokenKeyID, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_unactivatedTokenLists, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_vendor, "hash");
  return v6 ^ -[NSMutableArray hash](self->_tokenRequestLists, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 1))
    -[NSPPrivacyProxyTokenInfo setProxyURL:](self, "setProxyURL:");
  if (*((_QWORD *)v4 + 2))
    -[NSPPrivacyProxyTokenInfo setTokenKeyID:](self, "setTokenKeyID:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[NSPPrivacyProxyTokenInfo addUnactivatedTokenList:](self, "addUnactivatedTokenList:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 5))
    -[NSPPrivacyProxyTokenInfo setVendor:](self, "setVendor:");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[NSPPrivacyProxyTokenInfo addTokenRequestList:](self, "addTokenRequestList:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (NSString)proxyURL
{
  return self->_proxyURL;
}

- (void)setProxyURL:(id)a3
{
  objc_storeStrong((id *)&self->_proxyURL, a3);
}

- (NSData)tokenKeyID
{
  return self->_tokenKeyID;
}

- (void)setTokenKeyID:(id)a3
{
  objc_storeStrong((id *)&self->_tokenKeyID, a3);
}

- (NSMutableArray)unactivatedTokenLists
{
  return self->_unactivatedTokenLists;
}

- (void)setUnactivatedTokenLists:(id)a3
{
  objc_storeStrong((id *)&self->_unactivatedTokenLists, a3);
}

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
  objc_storeStrong((id *)&self->_vendor, a3);
}

- (NSMutableArray)tokenRequestLists
{
  return self->_tokenRequestLists;
}

- (void)setTokenRequestLists:(id)a3
{
  objc_storeStrong((id *)&self->_tokenRequestLists, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_unactivatedTokenLists, 0);
  objc_storeStrong((id *)&self->_tokenRequestLists, 0);
  objc_storeStrong((id *)&self->_tokenKeyID, 0);
  objc_storeStrong((id *)&self->_proxyURL, 0);
}

@end
