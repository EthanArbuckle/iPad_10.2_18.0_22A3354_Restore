@implementation SPProtoCacheMessage

- (BOOL)hasAssetKey
{
  return self->_assetKey != 0;
}

- (BOOL)hasGizmoCacheIdentifier
{
  return self->_gizmoCacheIdentifier != 0;
}

- (BOOL)hasAssetData
{
  return self->_assetData != 0;
}

- (BOOL)hasSyncData
{
  return self->_syncData != 0;
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
  v8.super_class = (Class)SPProtoCacheMessage;
  -[SPProtoCacheMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPProtoCacheMessage dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *assetKey;
  NSString *gizmoCacheIdentifier;
  NSData *assetData;
  SPProtoCacheSyncData *syncData;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_messageType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("messageType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cacheType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cacheType"));

  assetKey = self->_assetKey;
  if (assetKey)
    objc_msgSend(v3, "setObject:forKey:", assetKey, CFSTR("assetKey"));
  gizmoCacheIdentifier = self->_gizmoCacheIdentifier;
  if (gizmoCacheIdentifier)
    objc_msgSend(v3, "setObject:forKey:", gizmoCacheIdentifier, CFSTR("gizmoCacheIdentifier"));
  assetData = self->_assetData;
  if (assetData)
    objc_msgSend(v3, "setObject:forKey:", assetData, CFSTR("assetData"));
  syncData = self->_syncData;
  if (syncData)
  {
    -[SPProtoCacheSyncData dictionaryRepresentation](syncData, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("syncData"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SPProtoCacheMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (self->_assetKey)
    PBDataWriterWriteStringField();
  if (self->_gizmoCacheIdentifier)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_assetData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_syncData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  v4[10] = self->_messageType;
  v4[6] = self->_cacheType;
  v5 = v4;
  if (self->_assetKey)
  {
    objc_msgSend(v4, "setAssetKey:");
    v4 = v5;
  }
  if (self->_gizmoCacheIdentifier)
  {
    objc_msgSend(v5, "setGizmoCacheIdentifier:");
    v4 = v5;
  }
  if (self->_assetData)
  {
    objc_msgSend(v5, "setAssetData:");
    v4 = v5;
  }
  if (self->_syncData)
  {
    objc_msgSend(v5, "setSyncData:");
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
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_messageType;
  *(_DWORD *)(v5 + 24) = self->_cacheType;
  v6 = -[NSString copyWithZone:](self->_assetKey, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_gizmoCacheIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSData copyWithZone:](self->_assetData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v12 = -[SPProtoCacheSyncData copyWithZone:](self->_syncData, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *assetKey;
  NSString *gizmoCacheIdentifier;
  NSData *assetData;
  SPProtoCacheSyncData *syncData;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_messageType == *((_DWORD *)v4 + 10)
    && self->_cacheType == *((_DWORD *)v4 + 6)
    && ((assetKey = self->_assetKey, !((unint64_t)assetKey | v4[2]))
     || -[NSString isEqual:](assetKey, "isEqual:"))
    && ((gizmoCacheIdentifier = self->_gizmoCacheIdentifier, !((unint64_t)gizmoCacheIdentifier | v4[4]))
     || -[NSString isEqual:](gizmoCacheIdentifier, "isEqual:"))
    && ((assetData = self->_assetData, !((unint64_t)assetData | v4[1]))
     || -[NSData isEqual:](assetData, "isEqual:")))
  {
    syncData = self->_syncData;
    if ((unint64_t)syncData | v4[6])
      v9 = -[SPProtoCacheSyncData isEqual:](syncData, "isEqual:");
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
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = (2654435761 * self->_cacheType) ^ (2654435761 * self->_messageType);
  v4 = -[NSString hash](self->_assetKey, "hash");
  v5 = v4 ^ -[NSString hash](self->_gizmoCacheIdentifier, "hash");
  v6 = v5 ^ -[NSData hash](self->_assetData, "hash");
  return v3 ^ v6 ^ -[SPProtoCacheSyncData hash](self->_syncData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  SPProtoCacheSyncData *syncData;
  uint64_t v6;
  _DWORD *v7;

  v4 = a3;
  self->_messageType = v4[10];
  self->_cacheType = v4[6];
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[SPProtoCacheMessage setAssetKey:](self, "setAssetKey:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[SPProtoCacheMessage setGizmoCacheIdentifier:](self, "setGizmoCacheIdentifier:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[SPProtoCacheMessage setAssetData:](self, "setAssetData:");
    v4 = v7;
  }
  syncData = self->_syncData;
  v6 = *((_QWORD *)v4 + 6);
  if (syncData)
  {
    if (v6)
    {
      -[SPProtoCacheSyncData mergeFrom:](syncData, "mergeFrom:");
LABEL_12:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[SPProtoCacheMessage setSyncData:](self, "setSyncData:");
    goto LABEL_12;
  }

}

- (int)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int)a3
{
  self->_messageType = a3;
}

- (int)cacheType
{
  return self->_cacheType;
}

- (void)setCacheType:(int)a3
{
  self->_cacheType = a3;
}

- (NSString)assetKey
{
  return self->_assetKey;
}

- (void)setAssetKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetKey, a3);
}

- (NSString)gizmoCacheIdentifier
{
  return self->_gizmoCacheIdentifier;
}

- (void)setGizmoCacheIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_gizmoCacheIdentifier, a3);
}

- (NSData)assetData
{
  return self->_assetData;
}

- (void)setAssetData:(id)a3
{
  objc_storeStrong((id *)&self->_assetData, a3);
}

- (SPProtoCacheSyncData)syncData
{
  return self->_syncData;
}

- (void)setSyncData:(id)a3
{
  objc_storeStrong((id *)&self->_syncData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncData, 0);
  objc_storeStrong((id *)&self->_gizmoCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
}

@end
