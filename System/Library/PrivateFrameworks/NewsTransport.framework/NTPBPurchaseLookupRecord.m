@implementation NTPBPurchaseLookupRecord

- (void)addBundleChannelTagIDs:(id)a3
{
  NSMutableArray *bundleChannelTagIDs;

  bundleChannelTagIDs = self->_bundleChannelTagIDs;
  if (!bundleChannelTagIDs)
  {
    bundleChannelTagIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_bundleChannelTagIDs = bundleChannelTagIDs;
  }
  -[NSMutableArray addObject:](bundleChannelTagIDs, "addObject:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *channelTagIDs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *bundleChannelTagIDs;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[2] = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  v5[1] = (id)-[NSString copyWithZone:](self->_appAdamID, "copyWithZone:", a3);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  channelTagIDs = self->_channelTagIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelTagIDs, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(channelTagIDs);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addChannelTagIDs:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelTagIDs, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  bundleChannelTagIDs = self->_bundleChannelTagIDs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bundleChannelTagIDs, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(bundleChannelTagIDs);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v5, "addBundleChannelTagIDs:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bundleChannelTagIDs, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  v5[4] = (id)-[NSString copyWithZone:](self->_bundleChannelTagIDsVersion, "copyWithZone:", a3);
  return v5;
}

- (NSMutableArray)bundleChannelTagIDs
{
  return self->_bundleChannelTagIDs;
}

- (NSString)bundleChannelTagIDsVersion
{
  return self->_bundleChannelTagIDsVersion;
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (NSMutableArray)channelTagIDs
{
  return self->_channelTagIDs;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPurchaseLookupRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)setChannelTagIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setBundleChannelTagIDsVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setBundleChannelTagIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setAppAdamID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBPurchaseLookupRecord setBase:](self, "setBase:", 0);
  -[NTPBPurchaseLookupRecord setAppAdamID:](self, "setAppAdamID:", 0);
  -[NTPBPurchaseLookupRecord setChannelTagIDs:](self, "setChannelTagIDs:", 0);
  -[NTPBPurchaseLookupRecord setBundleChannelTagIDs:](self, "setBundleChannelTagIDs:", 0);
  -[NTPBPurchaseLookupRecord setBundleChannelTagIDsVersion:](self, "setBundleChannelTagIDsVersion:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPurchaseLookupRecord;
  -[NTPBPurchaseLookupRecord dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasAppAdamID
{
  return self->_appAdamID != 0;
}

- (void)clearChannelTagIDs
{
  -[NSMutableArray removeAllObjects](self->_channelTagIDs, "removeAllObjects");
}

- (void)addChannelTagIDs:(id)a3
{
  NSMutableArray *channelTagIDs;

  channelTagIDs = self->_channelTagIDs;
  if (!channelTagIDs)
  {
    channelTagIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_channelTagIDs = channelTagIDs;
  }
  -[NSMutableArray addObject:](channelTagIDs, "addObject:", a3);
}

- (unint64_t)channelTagIDsCount
{
  return -[NSMutableArray count](self->_channelTagIDs, "count");
}

- (id)channelTagIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_channelTagIDs, "objectAtIndex:", a3);
}

+ (Class)channelTagIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearBundleChannelTagIDs
{
  -[NSMutableArray removeAllObjects](self->_bundleChannelTagIDs, "removeAllObjects");
}

- (unint64_t)bundleChannelTagIDsCount
{
  return -[NSMutableArray count](self->_bundleChannelTagIDs, "count");
}

- (id)bundleChannelTagIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bundleChannelTagIDs, "objectAtIndex:", a3);
}

+ (Class)bundleChannelTagIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBundleChannelTagIDsVersion
{
  return self->_bundleChannelTagIDsVersion != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPurchaseLookupRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPurchaseLookupRecord description](&v3, sel_description), -[NTPBPurchaseLookupRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSString *appAdamID;
  NSMutableArray *channelTagIDs;
  NSMutableArray *bundleChannelTagIDs;
  NSString *bundleChannelTagIDsVersion;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  appAdamID = self->_appAdamID;
  if (appAdamID)
    objc_msgSend(v3, "setObject:forKey:", appAdamID, CFSTR("app_adam_ID"));
  channelTagIDs = self->_channelTagIDs;
  if (channelTagIDs)
    objc_msgSend(v3, "setObject:forKey:", channelTagIDs, CFSTR("channel_tag_IDs"));
  bundleChannelTagIDs = self->_bundleChannelTagIDs;
  if (bundleChannelTagIDs)
    objc_msgSend(v3, "setObject:forKey:", bundleChannelTagIDs, CFSTR("bundle_channel_tag_IDs"));
  bundleChannelTagIDsVersion = self->_bundleChannelTagIDsVersion;
  if (bundleChannelTagIDsVersion)
    objc_msgSend(v3, "setObject:forKey:", bundleChannelTagIDsVersion, CFSTR("bundle_channel_tag_IDs_version"));
  return v3;
}

- (void)writeTo:(id)a3
{
  NSMutableArray *channelTagIDs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *bundleChannelTagIDs;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if (self->_appAdamID)
    PBDataWriterWriteStringField();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  channelTagIDs = self->_channelTagIDs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelTagIDs, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(channelTagIDs);
        PBDataWriterWriteStringField();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](channelTagIDs, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  bundleChannelTagIDs = self->_bundleChannelTagIDs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bundleChannelTagIDs, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(bundleChannelTagIDs);
        PBDataWriterWriteStringField();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](bundleChannelTagIDs, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }
  if (self->_bundleChannelTagIDsVersion)
    PBDataWriterWriteStringField();
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSString *appAdamID;
  NSMutableArray *channelTagIDs;
  NSMutableArray *bundleChannelTagIDs;
  NSString *bundleChannelTagIDsVersion;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((_QWORD *)a3 + 2)) || (v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      appAdamID = self->_appAdamID;
      if (!((unint64_t)appAdamID | *((_QWORD *)a3 + 1))
        || (v5 = -[NSString isEqual:](appAdamID, "isEqual:")) != 0)
      {
        channelTagIDs = self->_channelTagIDs;
        if (!((unint64_t)channelTagIDs | *((_QWORD *)a3 + 5))
          || (v5 = -[NSMutableArray isEqual:](channelTagIDs, "isEqual:")) != 0)
        {
          bundleChannelTagIDs = self->_bundleChannelTagIDs;
          if (!((unint64_t)bundleChannelTagIDs | *((_QWORD *)a3 + 3))
            || (v5 = -[NSMutableArray isEqual:](bundleChannelTagIDs, "isEqual:")) != 0)
          {
            bundleChannelTagIDsVersion = self->_bundleChannelTagIDsVersion;
            if ((unint64_t)bundleChannelTagIDsVersion | *((_QWORD *)a3 + 4))
              LOBYTE(v5) = -[NSString isEqual:](bundleChannelTagIDsVersion, "isEqual:");
            else
              LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NTPBRecordBase hash](self->_base, "hash");
  v4 = -[NSString hash](self->_appAdamID, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_channelTagIDs, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_bundleChannelTagIDs, "hash");
  return v6 ^ -[NSString hash](self->_bundleChannelTagIDsVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBRecordBase *base;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  base = self->_base;
  v6 = *((_QWORD *)a3 + 2);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBPurchaseLookupRecord setBase:](self, "setBase:");
  }
  if (*((_QWORD *)a3 + 1))
    -[NTPBPurchaseLookupRecord setAppAdamID:](self, "setAppAdamID:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[NTPBPurchaseLookupRecord addChannelTagIDs:](self, "addChannelTagIDs:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = (void *)*((_QWORD *)a3 + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[NTPBPurchaseLookupRecord addBundleChannelTagIDs:](self, "addBundleChannelTagIDs:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }
  if (*((_QWORD *)a3 + 4))
    -[NTPBPurchaseLookupRecord setBundleChannelTagIDsVersion:](self, "setBundleChannelTagIDsVersion:");
}

- (NSString)appAdamID
{
  return self->_appAdamID;
}

@end
