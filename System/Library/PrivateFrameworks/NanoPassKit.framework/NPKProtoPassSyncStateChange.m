@implementation NPKProtoPassSyncStateChange

- (BOOL)hasLastKnownReconciledPassSyncStateHash
{
  return self->_lastKnownReconciledPassSyncStateHash != 0;
}

- (id)changeTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CFECC90[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsChangeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Add")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Update")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Remove")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSyncStateItem
{
  return self->_syncStateItem != 0;
}

- (BOOL)hasPassData
{
  return self->_passData != 0;
}

- (void)setPassSegmentIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_passSegmentIndex = a3;
}

- (void)setHasPassSegmentIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPassSegmentIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPassSegmentTotal:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_passSegmentTotal = a3;
}

- (void)setHasPassSegmentTotal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPassSegmentTotal
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasCompanionCatalog
{
  return self->_companionCatalog != 0;
}

- (BOOL)hasBaseManifestHashForPartialUpdate
{
  return self->_baseManifestHashForPartialUpdate != 0;
}

- (void)clearRemoteAssetsForPartialUpdates
{
  -[NSMutableArray removeAllObjects](self->_remoteAssetsForPartialUpdates, "removeAllObjects");
}

- (void)addRemoteAssetsForPartialUpdate:(id)a3
{
  id v4;
  NSMutableArray *remoteAssetsForPartialUpdates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  remoteAssetsForPartialUpdates = self->_remoteAssetsForPartialUpdates;
  v8 = v4;
  if (!remoteAssetsForPartialUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_remoteAssetsForPartialUpdates;
    self->_remoteAssetsForPartialUpdates = v6;

    v4 = v8;
    remoteAssetsForPartialUpdates = self->_remoteAssetsForPartialUpdates;
  }
  -[NSMutableArray addObject:](remoteAssetsForPartialUpdates, "addObject:", v4);

}

- (unint64_t)remoteAssetsForPartialUpdatesCount
{
  return -[NSMutableArray count](self->_remoteAssetsForPartialUpdates, "count");
}

- (id)remoteAssetsForPartialUpdateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_remoteAssetsForPartialUpdates, "objectAtIndex:", a3);
}

+ (Class)remoteAssetsForPartialUpdateType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasWatchCatalog
{
  return self->_watchCatalog != 0;
}

- (void)setLastKnownReconciledPassSyncStateHashVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lastKnownReconciledPassSyncStateHashVersion = a3;
}

- (void)setHasLastKnownReconciledPassSyncStateHashVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastKnownReconciledPassSyncStateHashVersion
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
  v8.super_class = (Class)NPKProtoPassSyncStateChange;
  -[NPKProtoPassSyncStateChange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncStateChange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *changeUUID;
  NSData *lastKnownReconciledPassSyncStateHash;
  uint64_t changeType;
  __CFString *v8;
  NSString *uniqueID;
  NPKProtoPassSyncStateItem *syncStateItem;
  void *v11;
  NSData *passData;
  char has;
  void *v14;
  void *v15;
  NPKProtoCatalog *companionCatalog;
  void *v17;
  NSData *baseManifestHashForPartialUpdate;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NPKProtoCatalog *watchCatalog;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  changeUUID = self->_changeUUID;
  if (changeUUID)
    objc_msgSend(v3, "setObject:forKey:", changeUUID, CFSTR("changeUUID"));
  lastKnownReconciledPassSyncStateHash = self->_lastKnownReconciledPassSyncStateHash;
  if (lastKnownReconciledPassSyncStateHash)
    objc_msgSend(v4, "setObject:forKey:", lastKnownReconciledPassSyncStateHash, CFSTR("lastKnownReconciledPassSyncStateHash"));
  changeType = self->_changeType;
  if (changeType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_changeType);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_24CFECC90[changeType];
  }
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("changeType"));

  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(v4, "setObject:forKey:", uniqueID, CFSTR("uniqueID"));
  syncStateItem = self->_syncStateItem;
  if (syncStateItem)
  {
    -[NPKProtoPassSyncStateItem dictionaryRepresentation](syncStateItem, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("syncStateItem"));

  }
  passData = self->_passData;
  if (passData)
    objc_msgSend(v4, "setObject:forKey:", passData, CFSTR("passData"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_passSegmentIndex);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("passSegmentIndex"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_passSegmentTotal);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("passSegmentTotal"));

  }
  companionCatalog = self->_companionCatalog;
  if (companionCatalog)
  {
    -[NPKProtoCatalog dictionaryRepresentation](companionCatalog, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("companionCatalog"));

  }
  baseManifestHashForPartialUpdate = self->_baseManifestHashForPartialUpdate;
  if (baseManifestHashForPartialUpdate)
    objc_msgSend(v4, "setObject:forKey:", baseManifestHashForPartialUpdate, CFSTR("baseManifestHashForPartialUpdate"));
  if (-[NSMutableArray count](self->_remoteAssetsForPartialUpdates, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_remoteAssetsForPartialUpdates, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v20 = self->_remoteAssetsForPartialUpdates;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v22);
    }

    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("remoteAssetsForPartialUpdate"));
  }
  watchCatalog = self->_watchCatalog;
  if (watchCatalog)
  {
    -[NPKProtoCatalog dictionaryRepresentation](watchCatalog, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("watchCatalog"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_lastKnownReconciledPassSyncStateHashVersion);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("lastKnownReconciledPassSyncStateHashVersion"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncStateChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_changeUUID)
    -[NPKProtoPassSyncStateChange writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteDataField();
  if (self->_lastKnownReconciledPassSyncStateHash)
    PBDataWriterWriteDataField();
  PBDataWriterWriteInt32Field();
  if (!self->_uniqueID)
    -[NPKProtoPassSyncStateChange writeTo:].cold.2();
  PBDataWriterWriteStringField();
  if (self->_syncStateItem)
    PBDataWriterWriteSubmessage();
  if (self->_passData)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_companionCatalog)
    PBDataWriterWriteSubmessage();
  if (self->_baseManifestHashForPartialUpdate)
    PBDataWriterWriteDataField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_remoteAssetsForPartialUpdates;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (self->_watchCatalog)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setChangeUUID:", self->_changeUUID);
  if (self->_lastKnownReconciledPassSyncStateHash)
    objc_msgSend(v9, "setLastKnownReconciledPassSyncStateHash:");
  *((_DWORD *)v9 + 4) = self->_changeType;
  objc_msgSend(v9, "setUniqueID:", self->_uniqueID);
  if (self->_syncStateItem)
    objc_msgSend(v9, "setSyncStateItem:");
  if (self->_passData)
    objc_msgSend(v9, "setPassData:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v9 + 16) = self->_passSegmentIndex;
    *((_BYTE *)v9 + 104) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v9 + 17) = self->_passSegmentTotal;
    *((_BYTE *)v9 + 104) |= 4u;
  }
  if (self->_companionCatalog)
    objc_msgSend(v9, "setCompanionCatalog:");
  if (self->_baseManifestHashForPartialUpdate)
    objc_msgSend(v9, "setBaseManifestHashForPartialUpdate:");
  if (-[NPKProtoPassSyncStateChange remoteAssetsForPartialUpdatesCount](self, "remoteAssetsForPartialUpdatesCount"))
  {
    objc_msgSend(v9, "clearRemoteAssetsForPartialUpdates");
    v5 = -[NPKProtoPassSyncStateChange remoteAssetsForPartialUpdatesCount](self, "remoteAssetsForPartialUpdatesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NPKProtoPassSyncStateChange remoteAssetsForPartialUpdateAtIndex:](self, "remoteAssetsForPartialUpdateAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addRemoteAssetsForPartialUpdate:", v8);

      }
    }
  }
  if (self->_watchCatalog)
    objc_msgSend(v9, "setWatchCatalog:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v9 + 12) = self->_lastKnownReconciledPassSyncStateHashVersion;
    *((_BYTE *)v9 + 104) |= 1u;
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
  uint64_t v14;
  void *v15;
  char has;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_changeUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSData copyWithZone:](self->_lastKnownReconciledPassSyncStateHash, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  *(_DWORD *)(v5 + 16) = self->_changeType;
  v10 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v10;

  v12 = -[NPKProtoPassSyncStateItem copyWithZone:](self->_syncStateItem, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v12;

  v14 = -[NSData copyWithZone:](self->_passData, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_passSegmentIndex;
    *(_BYTE *)(v5 + 104) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_passSegmentTotal;
    *(_BYTE *)(v5 + 104) |= 4u;
  }
  v17 = -[NPKProtoCatalog copyWithZone:](self->_companionCatalog, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v17;

  v19 = -[NSData copyWithZone:](self->_baseManifestHashForPartialUpdate, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v19;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = self->_remoteAssetsForPartialUpdates;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend((id)v5, "addRemoteAssetsForPartialUpdate:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v23);
  }

  v27 = -[NPKProtoCatalog copyWithZone:](self->_watchCatalog, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v27;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_lastKnownReconciledPassSyncStateHashVersion;
    *(_BYTE *)(v5 + 104) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *changeUUID;
  NSData *lastKnownReconciledPassSyncStateHash;
  NSString *uniqueID;
  NPKProtoPassSyncStateItem *syncStateItem;
  NSData *passData;
  NPKProtoCatalog *companionCatalog;
  NSData *baseManifestHashForPartialUpdate;
  NSMutableArray *remoteAssetsForPartialUpdates;
  NPKProtoCatalog *watchCatalog;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  changeUUID = self->_changeUUID;
  if ((unint64_t)changeUUID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](changeUUID, "isEqual:"))
      goto LABEL_35;
  }
  lastKnownReconciledPassSyncStateHash = self->_lastKnownReconciledPassSyncStateHash;
  if ((unint64_t)lastKnownReconciledPassSyncStateHash | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](lastKnownReconciledPassSyncStateHash, "isEqual:"))
      goto LABEL_35;
  }
  if (self->_changeType != *((_DWORD *)v4 + 4))
    goto LABEL_35;
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:"))
      goto LABEL_35;
  }
  syncStateItem = self->_syncStateItem;
  if ((unint64_t)syncStateItem | *((_QWORD *)v4 + 10))
  {
    if (!-[NPKProtoPassSyncStateItem isEqual:](syncStateItem, "isEqual:"))
      goto LABEL_35;
  }
  passData = self->_passData;
  if ((unint64_t)passData | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](passData, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 2) == 0 || self->_passSegmentIndex != *((_DWORD *)v4 + 16))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 104) & 2) != 0)
  {
LABEL_35:
    v14 = 0;
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 4) == 0 || self->_passSegmentTotal != *((_DWORD *)v4 + 17))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 104) & 4) != 0)
  {
    goto LABEL_35;
  }
  companionCatalog = self->_companionCatalog;
  if ((unint64_t)companionCatalog | *((_QWORD *)v4 + 4)
    && !-[NPKProtoCatalog isEqual:](companionCatalog, "isEqual:"))
  {
    goto LABEL_35;
  }
  baseManifestHashForPartialUpdate = self->_baseManifestHashForPartialUpdate;
  if ((unint64_t)baseManifestHashForPartialUpdate | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](baseManifestHashForPartialUpdate, "isEqual:"))
      goto LABEL_35;
  }
  remoteAssetsForPartialUpdates = self->_remoteAssetsForPartialUpdates;
  if ((unint64_t)remoteAssetsForPartialUpdates | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](remoteAssetsForPartialUpdates, "isEqual:"))
      goto LABEL_35;
  }
  watchCatalog = self->_watchCatalog;
  if ((unint64_t)watchCatalog | *((_QWORD *)v4 + 12))
  {
    if (!-[NPKProtoCatalog isEqual:](watchCatalog, "isEqual:"))
      goto LABEL_35;
  }
  v14 = (*((_BYTE *)v4 + 104) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 1) == 0 || self->_lastKnownReconciledPassSyncStateHashVersion != *((_DWORD *)v4 + 12))
      goto LABEL_35;
    v14 = 1;
  }
LABEL_36:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t changeType;
  uint64_t v16;
  uint64_t v17;

  v17 = -[NSData hash](self->_changeUUID, "hash");
  v3 = -[NSData hash](self->_lastKnownReconciledPassSyncStateHash, "hash");
  changeType = self->_changeType;
  v16 = v3;
  v4 = -[NSString hash](self->_uniqueID, "hash");
  v5 = -[NPKProtoPassSyncStateItem hash](self->_syncStateItem, "hash");
  v6 = -[NSData hash](self->_passData, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_passSegmentIndex;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v8 = 2654435761 * self->_passSegmentTotal;
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:
  v9 = -[NPKProtoCatalog hash](self->_companionCatalog, "hash");
  v10 = -[NSData hash](self->_baseManifestHashForPartialUpdate, "hash");
  v11 = -[NSMutableArray hash](self->_remoteAssetsForPartialUpdates, "hash");
  v12 = -[NPKProtoCatalog hash](self->_watchCatalog, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v13 = 2654435761 * self->_lastKnownReconciledPassSyncStateHashVersion;
  else
    v13 = 0;
  return v16 ^ v17 ^ v4 ^ v5 ^ v6 ^ (2654435761 * changeType) ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NPKProtoPassSyncStateItem *syncStateItem;
  uint64_t v6;
  char v7;
  NPKProtoCatalog *companionCatalog;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NPKProtoCatalog *watchCatalog;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[NPKProtoPassSyncStateChange setChangeUUID:](self, "setChangeUUID:");
  if (*((_QWORD *)v4 + 5))
    -[NPKProtoPassSyncStateChange setLastKnownReconciledPassSyncStateHash:](self, "setLastKnownReconciledPassSyncStateHash:");
  self->_changeType = *((_DWORD *)v4 + 4);
  if (*((_QWORD *)v4 + 11))
    -[NPKProtoPassSyncStateChange setUniqueID:](self, "setUniqueID:");
  syncStateItem = self->_syncStateItem;
  v6 = *((_QWORD *)v4 + 10);
  if (syncStateItem)
  {
    if (v6)
      -[NPKProtoPassSyncStateItem mergeFrom:](syncStateItem, "mergeFrom:");
  }
  else if (v6)
  {
    -[NPKProtoPassSyncStateChange setSyncStateItem:](self, "setSyncStateItem:");
  }
  if (*((_QWORD *)v4 + 7))
    -[NPKProtoPassSyncStateChange setPassData:](self, "setPassData:");
  v7 = *((_BYTE *)v4 + 104);
  if ((v7 & 2) != 0)
  {
    self->_passSegmentIndex = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 104);
  }
  if ((v7 & 4) != 0)
  {
    self->_passSegmentTotal = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_has |= 4u;
  }
  companionCatalog = self->_companionCatalog;
  v9 = *((_QWORD *)v4 + 4);
  if (companionCatalog)
  {
    if (v9)
      -[NPKProtoCatalog mergeFrom:](companionCatalog, "mergeFrom:");
  }
  else if (v9)
  {
    -[NPKProtoPassSyncStateChange setCompanionCatalog:](self, "setCompanionCatalog:");
  }
  if (*((_QWORD *)v4 + 1))
    -[NPKProtoPassSyncStateChange setBaseManifestHashForPartialUpdate:](self, "setBaseManifestHashForPartialUpdate:");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = *((id *)v4 + 9);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[NPKProtoPassSyncStateChange addRemoteAssetsForPartialUpdate:](self, "addRemoteAssetsForPartialUpdate:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  watchCatalog = self->_watchCatalog;
  v16 = *((_QWORD *)v4 + 12);
  if (watchCatalog)
  {
    if (v16)
      -[NPKProtoCatalog mergeFrom:](watchCatalog, "mergeFrom:");
  }
  else if (v16)
  {
    -[NPKProtoPassSyncStateChange setWatchCatalog:](self, "setWatchCatalog:");
  }
  if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
    self->_lastKnownReconciledPassSyncStateHashVersion = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)changeUUID
{
  return self->_changeUUID;
}

- (void)setChangeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_changeUUID, a3);
}

- (NSData)lastKnownReconciledPassSyncStateHash
{
  return self->_lastKnownReconciledPassSyncStateHash;
}

- (void)setLastKnownReconciledPassSyncStateHash:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownReconciledPassSyncStateHash, a3);
}

- (int)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int)a3
{
  self->_changeType = a3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (NPKProtoPassSyncStateItem)syncStateItem
{
  return self->_syncStateItem;
}

- (void)setSyncStateItem:(id)a3
{
  objc_storeStrong((id *)&self->_syncStateItem, a3);
}

- (NSData)passData
{
  return self->_passData;
}

- (void)setPassData:(id)a3
{
  objc_storeStrong((id *)&self->_passData, a3);
}

- (unsigned)passSegmentIndex
{
  return self->_passSegmentIndex;
}

- (unsigned)passSegmentTotal
{
  return self->_passSegmentTotal;
}

- (NPKProtoCatalog)companionCatalog
{
  return self->_companionCatalog;
}

- (void)setCompanionCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_companionCatalog, a3);
}

- (NSData)baseManifestHashForPartialUpdate
{
  return self->_baseManifestHashForPartialUpdate;
}

- (void)setBaseManifestHashForPartialUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_baseManifestHashForPartialUpdate, a3);
}

- (NSMutableArray)remoteAssetsForPartialUpdates
{
  return self->_remoteAssetsForPartialUpdates;
}

- (void)setRemoteAssetsForPartialUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAssetsForPartialUpdates, a3);
}

- (NPKProtoCatalog)watchCatalog
{
  return self->_watchCatalog;
}

- (void)setWatchCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_watchCatalog, a3);
}

- (unsigned)lastKnownReconciledPassSyncStateHashVersion
{
  return self->_lastKnownReconciledPassSyncStateHashVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchCatalog, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_syncStateItem, 0);
  objc_storeStrong((id *)&self->_remoteAssetsForPartialUpdates, 0);
  objc_storeStrong((id *)&self->_passData, 0);
  objc_storeStrong((id *)&self->_lastKnownReconciledPassSyncStateHash, 0);
  objc_storeStrong((id *)&self->_companionCatalog, 0);
  objc_storeStrong((id *)&self->_changeUUID, 0);
  objc_storeStrong((id *)&self->_baseManifestHashForPartialUpdate, 0);
}

- (id)npkDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  -[NPKProtoPassSyncStateChange dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NPKProtoPassSyncStateChange passData](self, "passData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "npkDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("passData"));

  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)NPKProtoPassSyncStateChange;
  -[NPKProtoPassSyncStateChange description](&v12, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoPassSyncStateChange writeTo:]", "NPKProtoPassSyncStateChange.m", 352, "nil != self->_changeUUID");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoPassSyncStateChange writeTo:]", "NPKProtoPassSyncStateChange.m", 368, "nil != self->_uniqueID");
}

@end
