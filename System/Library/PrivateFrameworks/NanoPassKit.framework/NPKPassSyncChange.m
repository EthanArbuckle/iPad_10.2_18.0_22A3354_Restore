@implementation NPKPassSyncChange

- (NPKPassSyncChange)initWithChangeUUID:(id)a3 reconciledStateHash:(id)a4 reconciledStateVersion:(unint64_t)a5 changeType:(unint64_t)a6 uniqueID:(id)a7 syncStateItem:(id)a8 passData:(id)a9 baseManifestHashForPartialUpdate:(id)a10 remoteAssetsForPartialUpdate:(id)a11
{
  id v16;
  id v17;
  NPKPassSyncChange *v18;
  NPKPassSyncChange *v19;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v16 = a10;
  v17 = a11;
  v28.receiver = self;
  v28.super_class = (Class)NPKPassSyncChange;
  v18 = -[NPKPassSyncChange init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_changeUUID, a3);
    objc_storeStrong((id *)&v19->_reconciledStateHash, a4);
    v19->_reconciledStateVersion = a5;
    v19->_changeType = a6;
    objc_storeStrong((id *)&v19->_uniqueID, a7);
    objc_storeStrong((id *)&v19->_syncStateItem, a8);
    objc_storeStrong((id *)&v19->_passData, a9);
    objc_storeStrong((id *)&v19->_baseManifestHashForPartialUpdate, a10);
    objc_storeStrong((id *)&v19->_remoteAssetsForPartialUpdate, a11);
  }

  return v19;
}

- (NPKPassSyncChange)initWithChangeUUID:(id)a3 reconciledStateHash:(id)a4 reconciledStateVersion:(unint64_t)a5 changeType:(unint64_t)a6 uniqueID:(id)a7 syncStateItem:(id)a8 passData:(id)a9
{
  return -[NPKPassSyncChange initWithChangeUUID:reconciledStateHash:reconciledStateVersion:changeType:uniqueID:syncStateItem:passData:baseManifestHashForPartialUpdate:remoteAssetsForPartialUpdate:](self, "initWithChangeUUID:reconciledStateHash:reconciledStateVersion:changeType:uniqueID:syncStateItem:passData:baseManifestHashForPartialUpdate:remoteAssetsForPartialUpdate:", a3, a4, a5, a6, a7, a8, a9, 0, 0);
}

- (id)description
{
  uint64_t v3;
  NSUUID *changeUUID;
  void *v5;
  __CFString *v6;
  unint64_t changeType;
  unint64_t reconciledStateVersion;
  NPKPassSyncStateItem *syncStateItem;
  NSString *uniqueID;
  NSData *passData;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v17 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  changeUUID = self->_changeUUID;
  -[NSData hexEncoding](self->_reconciledStateHash, "hexEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("Add");
  reconciledStateVersion = self->_reconciledStateVersion;
  changeType = self->_changeType;
  if (changeType == 1)
    v6 = CFSTR("Update");
  if (changeType == 2)
    v6 = CFSTR("Remove");
  uniqueID = self->_uniqueID;
  syncStateItem = self->_syncStateItem;
  passData = self->_passData;
  v12 = v6;
  -[NSData npkDescription](passData, "npkDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData hexEncoding](self->_baseManifestHashForPartialUpdate, "hexEncoding");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p change UUID %@ reconciled state hash %@ version:%lu change type %@ unique ID %@ sync state item %@ pass data %@ base manifest hash for partial update %@>"), v3, self, changeUUID, v5, reconciledStateVersion, v12, uniqueID, syncStateItem, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  NPKPassSyncChange *v4;
  NPKPassSyncChange *v5;
  BOOL v6;

  v4 = (NPKPassSyncChange *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[NPKPassSyncChange isEqualToChange:](self, "isEqualToChange:", v5);

  return v6;
}

- (BOOL)isEqualToChange:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (PKEqualObjects())
    v5 = -[NPKPassSyncChange isEqualToChangeIgnoringUUID:](self, "isEqualToChangeIgnoringUUID:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToChangeIgnoringUUID:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  if (PKEqualObjects()
    && self->_changeType == v4[4]
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects())
  {
    v5 = PKEqualObjects();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_changeUUID);
  objc_msgSend(v3, "safelyAddObject:", self->_reconciledStateHash);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_reconciledStateVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_changeType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v5);

  objc_msgSend(v3, "safelyAddObject:", self->_uniqueID);
  objc_msgSend(v3, "safelyAddObject:", self->_syncStateItem);
  objc_msgSend(v3, "safelyAddObject:", self->_passData);
  objc_msgSend(v3, "safelyAddObject:", self->_baseManifestHashForPartialUpdate);
  objc_msgSend(v3, "safelyAddObject:", self->_remoteAssetsForPartialUpdate);
  v6 = PKCombinedHash();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NPKPassSyncChange *v4;

  v4 = -[NPKPassSyncChange init](+[NPKPassSyncChange allocWithZone:](NPKPassSyncChange, "allocWithZone:", a3), "init");
  -[NPKPassSyncChange setChangeUUID:](v4, "setChangeUUID:", self->_changeUUID);
  -[NPKPassSyncChange setReconciledStateHash:](v4, "setReconciledStateHash:", self->_reconciledStateHash);
  -[NPKPassSyncChange setReconciledStateVersion:](v4, "setReconciledStateVersion:", self->_reconciledStateVersion);
  -[NPKPassSyncChange setChangeType:](v4, "setChangeType:", self->_changeType);
  -[NPKPassSyncChange setUniqueID:](v4, "setUniqueID:", self->_uniqueID);
  -[NPKPassSyncChange setSyncStateItem:](v4, "setSyncStateItem:", self->_syncStateItem);
  -[NPKPassSyncChange setPassData:](v4, "setPassData:", self->_passData);
  -[NPKPassSyncChange setBaseManifestHashForPartialUpdate:](v4, "setBaseManifestHashForPartialUpdate:", self->_baseManifestHashForPartialUpdate);
  -[NPKPassSyncChange setRemoteAssetsForPartialUpdate:](v4, "setRemoteAssetsForPartialUpdate:", self->_remoteAssetsForPartialUpdate);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *changeUUID;
  void *v5;
  void *v6;
  id v7;

  changeUUID = self->_changeUUID;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", changeUUID, CFSTR("changeUUID"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_reconciledStateHash, CFSTR("reconciledStateHash"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_reconciledStateVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("reconciledStateVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_changeType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("changeType"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_uniqueID, CFSTR("uniqueID"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_syncStateItem, CFSTR("syncStateItem"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_passData, CFSTR("passData"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_baseManifestHashForPartialUpdate, CFSTR("baseManifestHashForPartialUpdate"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_remoteAssetsForPartialUpdate, CFSTR("remoteAssetsForPartialUpdate"));

}

- (NPKPassSyncChange)initWithCoder:(id)a3
{
  id v4;
  NPKPassSyncChange *v5;
  uint64_t v6;
  NSUUID *changeUUID;
  uint64_t v8;
  NSData *reconciledStateHash;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *uniqueID;
  uint64_t v14;
  NPKPassSyncStateItem *syncStateItem;
  uint64_t v16;
  NSData *passData;
  uint64_t v18;
  NSData *baseManifestHashForPartialUpdate;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *remoteAssetsForPartialUpdate;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NPKPassSyncChange;
  v5 = -[NPKPassSyncChange init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changeUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    changeUUID = v5->_changeUUID;
    v5->_changeUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reconciledStateHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    reconciledStateHash = v5->_reconciledStateHash;
    v5->_reconciledStateHash = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reconciledStateVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_reconciledStateVersion = objc_msgSend(v10, "unsignedIntValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changeType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_changeType = objc_msgSend(v11, "unsignedIntValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
    v12 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syncStateItem"));
    v14 = objc_claimAutoreleasedReturnValue();
    syncStateItem = v5->_syncStateItem;
    v5->_syncStateItem = (NPKPassSyncStateItem *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passData"));
    v16 = objc_claimAutoreleasedReturnValue();
    passData = v5->_passData;
    v5->_passData = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseManifestHashForPartialUpdate"));
    v18 = objc_claimAutoreleasedReturnValue();
    baseManifestHashForPartialUpdate = v5->_baseManifestHashForPartialUpdate;
    v5->_baseManifestHashForPartialUpdate = (NSData *)v18;

    v20 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v20, objc_opt_class(), CFSTR("remoteAssetsForPartialUpdate"));
    v21 = objc_claimAutoreleasedReturnValue();
    remoteAssetsForPartialUpdate = v5->_remoteAssetsForPartialUpdate;
    v5->_remoteAssetsForPartialUpdate = (NSDictionary *)v21;

  }
  return v5;
}

- (NSUUID)changeUUID
{
  return self->_changeUUID;
}

- (void)setChangeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_changeUUID, a3);
}

- (NSData)reconciledStateHash
{
  return self->_reconciledStateHash;
}

- (void)setReconciledStateHash:(id)a3
{
  objc_storeStrong((id *)&self->_reconciledStateHash, a3);
}

- (unint64_t)reconciledStateVersion
{
  return self->_reconciledStateVersion;
}

- (void)setReconciledStateVersion:(unint64_t)a3
{
  self->_reconciledStateVersion = a3;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unint64_t)a3
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

- (NPKPassSyncStateItem)syncStateItem
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

- (NSData)baseManifestHashForPartialUpdate
{
  return self->_baseManifestHashForPartialUpdate;
}

- (void)setBaseManifestHashForPartialUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_baseManifestHashForPartialUpdate, a3);
}

- (NSDictionary)remoteAssetsForPartialUpdate
{
  return self->_remoteAssetsForPartialUpdate;
}

- (void)setRemoteAssetsForPartialUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAssetsForPartialUpdate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAssetsForPartialUpdate, 0);
  objc_storeStrong((id *)&self->_baseManifestHashForPartialUpdate, 0);
  objc_storeStrong((id *)&self->_passData, 0);
  objc_storeStrong((id *)&self->_syncStateItem, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_reconciledStateHash, 0);
  objc_storeStrong((id *)&self->_changeUUID, 0);
}

- (NPKPassSyncChange)initWithProtoPassSyncChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NPKPassSyncChange *v7;
  int v8;
  uint64_t v9;
  NPKPassSyncStateItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NPKPassSyncStateItem *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NPKPassSyncChange *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v30 = self;
    objc_msgSend(v4, "changeUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v6;
    if (v6)
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v6), "bytes"));
    else
      v29 = 0;
    objc_msgSend(v5, "lastKnownReconciledPassSyncStateHash");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v5, "lastKnownReconciledPassSyncStateHashVersion");
    v8 = objc_msgSend(v5, "changeType");
    v9 = v8 == 1;
    if (v8 == 2)
      v9 = 2;
    v25 = v9;
    objc_msgSend(v5, "uniqueID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [NPKPassSyncStateItem alloc];
    objc_msgSend(v5, "syncStateItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[NPKPassSyncStateItem initWithProtoSyncStateItem:](v10, "initWithProtoSyncStateItem:", v11);

    objc_msgSend(v5, "passData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "baseManifestHashForPartialUpdate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v5, "remoteAssetsForPartialUpdates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v20, "fileHash");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "relativePath");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v21, v22);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v17);
    }

    v7 = -[NPKPassSyncChange initWithChangeUUID:reconciledStateHash:reconciledStateVersion:changeType:uniqueID:syncStateItem:passData:baseManifestHashForPartialUpdate:remoteAssetsForPartialUpdate:](v30, "initWithChangeUUID:reconciledStateHash:reconciledStateVersion:changeType:uniqueID:syncStateItem:passData:baseManifestHashForPartialUpdate:remoteAssetsForPartialUpdate:", v29, v28, v26, v25, v27, v24, v12, v13, v14);
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (id)protoPassSyncChange
{
  NPKProtoPassSyncStateChange *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NPKProtoPassSyncStateChange *v16;
  _QWORD v18[4];
  NPKProtoPassSyncStateChange *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(NPKProtoPassSyncStateChange);
  -[NPKPassSyncChange changeUUID](self, "changeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v20[0] = 0;
    v20[1] = 0;
    objc_msgSend(v4, "getUUIDBytes:", v20);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v20, 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoPassSyncStateChange setChangeUUID:](v3, "setChangeUUID:", v6);

  }
  -[NPKPassSyncChange reconciledStateHash](self, "reconciledStateHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncStateChange setLastKnownReconciledPassSyncStateHash:](v3, "setLastKnownReconciledPassSyncStateHash:", v7);

  -[NPKProtoPassSyncStateChange setLastKnownReconciledPassSyncStateHashVersion:](v3, "setLastKnownReconciledPassSyncStateHashVersion:", -[NPKPassSyncChange reconciledStateVersion](self, "reconciledStateVersion"));
  v8 = -[NPKPassSyncChange changeType](self, "changeType");
  if (v8 == 2)
    v9 = 2;
  else
    v9 = v8 == 1;
  -[NPKProtoPassSyncStateChange setChangeType:](v3, "setChangeType:", v9);
  -[NPKPassSyncChange uniqueID](self, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncStateChange setUniqueID:](v3, "setUniqueID:", v10);

  -[NPKPassSyncChange syncStateItem](self, "syncStateItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "protoSyncStateItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncStateChange setSyncStateItem:](v3, "setSyncStateItem:", v12);

  -[NPKPassSyncChange passData](self, "passData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncStateChange setPassData:](v3, "setPassData:", v13);

  -[NPKPassSyncChange baseManifestHashForPartialUpdate](self, "baseManifestHashForPartialUpdate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncStateChange setBaseManifestHashForPartialUpdate:](v3, "setBaseManifestHashForPartialUpdate:", v14);

  -[NPKPassSyncChange remoteAssetsForPartialUpdate](self, "remoteAssetsForPartialUpdate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__NPKPassSyncChange_ProtobufSupport__protoPassSyncChange__block_invoke;
  v18[3] = &unk_24CFEC0B0;
  v16 = v3;
  v19 = v16;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v18);

  return v16;
}

void __57__NPKPassSyncChange_ProtobufSupport__protoPassSyncChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NPKProtoPassSyncStateManifestEntry *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(NPKProtoPassSyncStateManifestEntry);
  -[NPKProtoPassSyncStateManifestEntry setRelativePath:](v7, "setRelativePath:", v6);

  -[NPKProtoPassSyncStateManifestEntry setFileHash:](v7, "setFileHash:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addRemoteAssetsForPartialUpdate:", v7);

}

@end
