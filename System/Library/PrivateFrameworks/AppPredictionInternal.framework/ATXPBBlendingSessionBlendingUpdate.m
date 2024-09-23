@implementation ATXPBBlendingSessionBlendingUpdate

- (BOOL)hasBlendingUpdateUUID
{
  return self->_blendingUpdateUUID != 0;
}

- (BOOL)hasBlendingABGroup
{
  return self->_blendingABGroup != 0;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasDeviceContext
{
  return self->_deviceContext != 0;
}

- (void)clearClientModelUpdates
{
  -[NSMutableArray removeAllObjects](self->_clientModelUpdates, "removeAllObjects");
}

- (void)addClientModelUpdate:(id)a3
{
  id v4;
  NSMutableArray *clientModelUpdates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  clientModelUpdates = self->_clientModelUpdates;
  v8 = v4;
  if (!clientModelUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_clientModelUpdates;
    self->_clientModelUpdates = v6;

    v4 = v8;
    clientModelUpdates = self->_clientModelUpdates;
  }
  -[NSMutableArray addObject:](clientModelUpdates, "addObject:", v4);

}

- (unint64_t)clientModelUpdatesCount
{
  return -[NSMutableArray count](self->_clientModelUpdates, "count");
}

- (id)clientModelUpdateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_clientModelUpdates, "objectAtIndex:", a3);
}

+ (Class)clientModelUpdateType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUiCache
{
  return self->_uiCache != 0;
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
  v8.super_class = (Class)ATXPBBlendingSessionBlendingUpdate;
  -[ATXPBBlendingSessionBlendingUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBBlendingSessionBlendingUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *blendingUpdateUUID;
  NSString *blendingABGroup;
  NSString *consumerSubType;
  ATXPBBlendingSessionDeviceContext *deviceContext;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  ATXPBBlendingSessionUICache *uiCache;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  blendingUpdateUUID = self->_blendingUpdateUUID;
  if (blendingUpdateUUID)
    objc_msgSend(v3, "setObject:forKey:", blendingUpdateUUID, CFSTR("blendingUpdateUUID"));
  blendingABGroup = self->_blendingABGroup;
  if (blendingABGroup)
    objc_msgSend(v4, "setObject:forKey:", blendingABGroup, CFSTR("blendingABGroup"));
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v4, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  deviceContext = self->_deviceContext;
  if (deviceContext)
  {
    -[ATXPBBlendingSessionDeviceContext dictionaryRepresentation](deviceContext, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("deviceContext"));

  }
  if (-[NSMutableArray count](self->_clientModelUpdates, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_clientModelUpdates, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = self->_clientModelUpdates;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("clientModelUpdate"));
  }
  uiCache = self->_uiCache;
  if (uiCache)
  {
    -[ATXPBBlendingSessionUICache dictionaryRepresentation](uiCache, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("uiCache"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBlendingSessionBlendingUpdateReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_blendingUpdateUUID)
    PBDataWriterWriteStringField();
  if (self->_blendingABGroup)
    PBDataWriterWriteStringField();
  if (self->_consumerSubType)
    PBDataWriterWriteStringField();
  if (self->_deviceContext)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_clientModelUpdates;
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

  if (self->_uiCache)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_blendingUpdateUUID)
    objc_msgSend(v8, "setBlendingUpdateUUID:");
  if (self->_blendingABGroup)
    objc_msgSend(v8, "setBlendingABGroup:");
  if (self->_consumerSubType)
    objc_msgSend(v8, "setConsumerSubType:");
  if (self->_deviceContext)
    objc_msgSend(v8, "setDeviceContext:");
  if (-[ATXPBBlendingSessionBlendingUpdate clientModelUpdatesCount](self, "clientModelUpdatesCount"))
  {
    objc_msgSend(v8, "clearClientModelUpdates");
    v4 = -[ATXPBBlendingSessionBlendingUpdate clientModelUpdatesCount](self, "clientModelUpdatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ATXPBBlendingSessionBlendingUpdate clientModelUpdateAtIndex:](self, "clientModelUpdateAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addClientModelUpdate:", v7);

      }
    }
  }
  if (self->_uiCache)
    objc_msgSend(v8, "setUiCache:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
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
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_blendingUpdateUUID, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_blendingABGroup, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[ATXPBBlendingSessionDeviceContext copyWithZone:](self->_deviceContext, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = self->_clientModelUpdates;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v5, "addClientModelUpdate:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  v20 = -[ATXPBBlendingSessionUICache copyWithZone:](self->_uiCache, "copyWithZone:", a3);
  v21 = (void *)v5[6];
  v5[6] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *blendingUpdateUUID;
  NSString *blendingABGroup;
  NSString *consumerSubType;
  ATXPBBlendingSessionDeviceContext *deviceContext;
  NSMutableArray *clientModelUpdates;
  ATXPBBlendingSessionUICache *uiCache;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((blendingUpdateUUID = self->_blendingUpdateUUID, !((unint64_t)blendingUpdateUUID | v4[2]))
     || -[NSString isEqual:](blendingUpdateUUID, "isEqual:"))
    && ((blendingABGroup = self->_blendingABGroup, !((unint64_t)blendingABGroup | v4[1]))
     || -[NSString isEqual:](blendingABGroup, "isEqual:"))
    && ((consumerSubType = self->_consumerSubType, !((unint64_t)consumerSubType | v4[4]))
     || -[NSString isEqual:](consumerSubType, "isEqual:"))
    && ((deviceContext = self->_deviceContext, !((unint64_t)deviceContext | v4[5]))
     || -[ATXPBBlendingSessionDeviceContext isEqual:](deviceContext, "isEqual:"))
    && ((clientModelUpdates = self->_clientModelUpdates, !((unint64_t)clientModelUpdates | v4[3]))
     || -[NSMutableArray isEqual:](clientModelUpdates, "isEqual:")))
  {
    uiCache = self->_uiCache;
    if ((unint64_t)uiCache | v4[6])
      v11 = -[ATXPBBlendingSessionUICache isEqual:](uiCache, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_blendingUpdateUUID, "hash");
  v4 = -[NSString hash](self->_blendingABGroup, "hash") ^ v3;
  v5 = -[NSString hash](self->_consumerSubType, "hash");
  v6 = v4 ^ v5 ^ -[ATXPBBlendingSessionDeviceContext hash](self->_deviceContext, "hash");
  v7 = -[NSMutableArray hash](self->_clientModelUpdates, "hash");
  return v6 ^ v7 ^ -[ATXPBBlendingSessionUICache hash](self->_uiCache, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ATXPBBlendingSessionDeviceContext *deviceContext;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  ATXPBBlendingSessionUICache *uiCache;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[ATXPBBlendingSessionBlendingUpdate setBlendingUpdateUUID:](self, "setBlendingUpdateUUID:");
  if (*((_QWORD *)v4 + 1))
    -[ATXPBBlendingSessionBlendingUpdate setBlendingABGroup:](self, "setBlendingABGroup:");
  if (*((_QWORD *)v4 + 4))
    -[ATXPBBlendingSessionBlendingUpdate setConsumerSubType:](self, "setConsumerSubType:");
  deviceContext = self->_deviceContext;
  v6 = *((_QWORD *)v4 + 5);
  if (deviceContext)
  {
    if (v6)
      -[ATXPBBlendingSessionDeviceContext mergeFrom:](deviceContext, "mergeFrom:");
  }
  else if (v6)
  {
    -[ATXPBBlendingSessionBlendingUpdate setDeviceContext:](self, "setDeviceContext:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *((id *)v4 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[ATXPBBlendingSessionBlendingUpdate addClientModelUpdate:](self, "addClientModelUpdate:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  uiCache = self->_uiCache;
  v13 = *((_QWORD *)v4 + 6);
  if (uiCache)
  {
    if (v13)
      -[ATXPBBlendingSessionUICache mergeFrom:](uiCache, "mergeFrom:");
  }
  else if (v13)
  {
    -[ATXPBBlendingSessionBlendingUpdate setUiCache:](self, "setUiCache:");
  }

}

- (NSString)blendingUpdateUUID
{
  return self->_blendingUpdateUUID;
}

- (void)setBlendingUpdateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_blendingUpdateUUID, a3);
}

- (NSString)blendingABGroup
{
  return self->_blendingABGroup;
}

- (void)setBlendingABGroup:(id)a3
{
  objc_storeStrong((id *)&self->_blendingABGroup, a3);
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
}

- (ATXPBBlendingSessionDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (void)setDeviceContext:(id)a3
{
  objc_storeStrong((id *)&self->_deviceContext, a3);
}

- (NSMutableArray)clientModelUpdates
{
  return self->_clientModelUpdates;
}

- (void)setClientModelUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelUpdates, a3);
}

- (ATXPBBlendingSessionUICache)uiCache
{
  return self->_uiCache;
}

- (void)setUiCache:(id)a3
{
  objc_storeStrong((id *)&self->_uiCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiCache, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelUpdates, 0);
  objc_storeStrong((id *)&self->_blendingUpdateUUID, 0);
  objc_storeStrong((id *)&self->_blendingABGroup, 0);
}

@end
