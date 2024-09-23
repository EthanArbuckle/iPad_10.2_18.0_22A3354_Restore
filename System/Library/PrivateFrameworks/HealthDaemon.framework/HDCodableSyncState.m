@implementation HDCodableSyncState

- ($2825F4736939C4A6D3AD43837233062D)versionRange
{
  void *v2;
  $2825F4736939C4A6D3AD43837233062D v3;

  -[HDCodableSyncState version](self, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ($2825F4736939C4A6D3AD43837233062D)objc_msgSend(v2, "syncVersionRange");

  return v3;
}

- (void)setVersionRange:(id)a3
{
  id v4;

  +[HDCodableSyncVersionRange versionRangeWithSyncVersionRange:](HDCodableSyncVersionRange, "versionRangeWithSyncVersionRange:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCodableSyncState setVersion:](self, "setVersion:", v4);

}

- (void)setCodableObject:(id)a3 version:(int64_t)a4 profile:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HDCodableSyncStateVersionedData *v21;
  void *v22;
  HDCodableSyncStateOrigin *v23;
  _QWORD v24[7];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v8 = a5;
  v9 = a3;
  -[HDCodableSyncState versionedDatas](self, "versionedDatas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __70__HDCodableSyncState_HDSyncSupport__setCodableObject_version_profile___block_invoke;
  v24[3] = &__block_descriptor_40_e41_B16__0__HDCodableSyncStateVersionedData_8l;
  v24[4] = a4;
  objc_msgSend(v10, "hk_removeObjectsPassingTest:", v24);

  v11 = v8;
  objc_opt_self();
  objc_msgSend(v11, "daemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "behavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc_init(HDCodableSyncStateOrigin);
  -[HDCodableSyncStateOrigin setTimestamp:](v23, "setTimestamp:", CFAbsoluteTimeGetCurrent());
  objc_msgSend(v13, "currentOSBuild");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSyncStateOrigin setBuild:](v23, "setBuild:", v14);

  objc_msgSend(v13, "currentDeviceProductType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSyncStateOrigin setProductType:](v23, "setProductType:", v15);

  if (v13)
  {
    objc_msgSend(v13, "currentOSVersionStruct");
    -[HDCodableSyncStateOrigin setMajorVersion:](v23, "setMajorVersion:", v29);
    objc_msgSend(v13, "currentOSVersionStruct");
    -[HDCodableSyncStateOrigin setMinorVersion:](v23, "setMinorVersion:", v27);
    objc_msgSend(v13, "currentOSVersionStruct");
    v16 = v25;
  }
  else
  {
    v29 = 0;
    v30 = 0;
    v31 = 0;
    -[HDCodableSyncStateOrigin setMajorVersion:](v23, "setMajorVersion:", 0);
    v26 = 0;
    v27 = 0;
    v28 = 0;
    -[HDCodableSyncStateOrigin setMinorVersion:](v23, "setMinorVersion:", 0);
    v16 = 0;
    v24[5] = 0;
    v24[6] = 0;
    v25 = 0;
  }
  -[HDCodableSyncStateOrigin setPatchVersion:](v23, "setPatchVersion:", v16);
  objc_msgSend(v11, "syncIdentityManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentSyncIdentity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "codableSyncIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSyncStateOrigin setSyncIdentity:](v23, "setSyncIdentity:", v20);

  v21 = objc_alloc_init(HDCodableSyncStateVersionedData);
  -[HDCodableSyncStateVersionedData setVersion:](v21, "setVersion:", a4);
  -[HDCodableSyncStateVersionedData setOrigin:](v21, "setOrigin:", v23);
  objc_msgSend(v9, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCodableSyncStateVersionedData setObjectData:](v21, "setObjectData:", v22);
  -[HDCodableSyncState addVersionedData:](self, "addVersionedData:", v21);
  -[HDCodableSyncState setOrigin:](self, "setOrigin:", v23);

}

BOOL __70__HDCodableSyncState_HDSyncSupport__setCodableObject_version_profile___block_invoke(uint64_t a1, void *a2)
{
  return *(_QWORD *)(a1 + 32) == (int)objc_msgSend(a2, "version");
}

- (BOOL)decodedObjectOfClass:(Class)a3 version:(int64_t)a4 decodedObject:(id *)a5 error:(id *)a6
{
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];

  -[HDCodableSyncState versionedDatas](self, "versionedDatas");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __86__HDCodableSyncState_HDSyncSupport__decodedObjectOfClass_version_decodedObject_error___block_invoke;
  v21[3] = &__block_descriptor_40_e41_B16__0__HDCodableSyncStateVersionedData_8l;
  v21[4] = a4;
  objc_msgSend(v11, "hk_firstObjectPassingTest:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(v12, "objectData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithData:", v14);

    v16 = v15 != 0;
    if (v15)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v15);
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      -[HDCodableSyncState domain](self, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableSyncState key](self, "key");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hk_assignError:code:format:", a6, 129, CFSTR("Unable to decode data as class %@ for version %d (%@, %@)"), a3, a4, v18, v19);

    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

BOOL __86__HDCodableSyncState_HDSyncSupport__decodedObjectOfClass_version_decodedObject_error___block_invoke(uint64_t a1, void *a2)
{
  return *(_QWORD *)(a1 + 32) == (int)objc_msgSend(a2, "version");
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasOrigin
{
  return self->_origin != 0;
}

- (void)clearVersionedDatas
{
  -[NSMutableArray removeAllObjects](self->_versionedDatas, "removeAllObjects");
}

- (void)addVersionedData:(id)a3
{
  id v4;
  NSMutableArray *versionedDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  versionedDatas = self->_versionedDatas;
  v8 = v4;
  if (!versionedDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_versionedDatas;
    self->_versionedDatas = v6;

    v4 = v8;
    versionedDatas = self->_versionedDatas;
  }
  -[NSMutableArray addObject:](versionedDatas, "addObject:", v4);

}

- (unint64_t)versionedDatasCount
{
  return -[NSMutableArray count](self->_versionedDatas, "count");
}

- (id)versionedDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_versionedDatas, "objectAtIndex:", a3);
}

+ (Class)versionedDataType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSyncState;
  -[HDCodableSyncState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSyncState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *domain;
  NSString *key;
  HDCodableSyncVersionRange *version;
  void *v8;
  HDCodableSyncStateOrigin *origin;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  key = self->_key;
  if (key)
    objc_msgSend(v4, "setObject:forKey:", key, CFSTR("key"));
  version = self->_version;
  if (version)
  {
    -[HDCodableSyncVersionRange dictionaryRepresentation](version, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("version"));

  }
  origin = self->_origin;
  if (origin)
  {
    -[HDCodableSyncStateOrigin dictionaryRepresentation](origin, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("origin"));

  }
  if (-[NSMutableArray count](self->_versionedDatas, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_versionedDatas, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = self->_versionedDatas;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("versionedData"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSyncStateReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_domain)
    PBDataWriterWriteStringField();
  if (self->_key)
    PBDataWriterWriteStringField();
  if (self->_version)
    PBDataWriterWriteSubmessage();
  if (self->_origin)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_versionedDatas;
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
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_domain)
    objc_msgSend(v8, "setDomain:");
  if (self->_key)
    objc_msgSend(v8, "setKey:");
  if (self->_version)
    objc_msgSend(v8, "setVersion:");
  if (self->_origin)
    objc_msgSend(v8, "setOrigin:");
  if (-[HDCodableSyncState versionedDatasCount](self, "versionedDatasCount"))
  {
    objc_msgSend(v8, "clearVersionedDatas");
    v4 = -[HDCodableSyncState versionedDatasCount](self, "versionedDatasCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCodableSyncState versionedDataAtIndex:](self, "versionedDataAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addVersionedData:", v7);

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
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[HDCodableSyncVersionRange copyWithZone:](self->_version, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[HDCodableSyncStateOrigin copyWithZone:](self->_origin, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_versionedDatas;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addVersionedData:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *domain;
  NSString *key;
  HDCodableSyncVersionRange *version;
  HDCodableSyncStateOrigin *origin;
  NSMutableArray *versionedDatas;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((domain = self->_domain, !((unint64_t)domain | v4[1]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && ((key = self->_key, !((unint64_t)key | v4[2])) || -[NSString isEqual:](key, "isEqual:"))
    && ((version = self->_version, !((unint64_t)version | v4[4]))
     || -[HDCodableSyncVersionRange isEqual:](version, "isEqual:"))
    && ((origin = self->_origin, !((unint64_t)origin | v4[3]))
     || -[HDCodableSyncStateOrigin isEqual:](origin, "isEqual:")))
  {
    versionedDatas = self->_versionedDatas;
    if ((unint64_t)versionedDatas | v4[5])
      v10 = -[NSMutableArray isEqual:](versionedDatas, "isEqual:");
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
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_domain, "hash");
  v4 = -[NSString hash](self->_key, "hash") ^ v3;
  v5 = -[HDCodableSyncVersionRange hash](self->_version, "hash");
  v6 = v4 ^ v5 ^ -[HDCodableSyncStateOrigin hash](self->_origin, "hash");
  return v6 ^ -[NSMutableArray hash](self->_versionedDatas, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSyncVersionRange *version;
  uint64_t v6;
  HDCodableSyncStateOrigin *origin;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 1))
    -[HDCodableSyncState setDomain:](self, "setDomain:");
  if (*((_QWORD *)v4 + 2))
    -[HDCodableSyncState setKey:](self, "setKey:");
  version = self->_version;
  v6 = *((_QWORD *)v4 + 4);
  if (version)
  {
    if (v6)
      -[HDCodableSyncVersionRange mergeFrom:](version, "mergeFrom:");
  }
  else if (v6)
  {
    -[HDCodableSyncState setVersion:](self, "setVersion:");
  }
  origin = self->_origin;
  v8 = *((_QWORD *)v4 + 3);
  if (origin)
  {
    if (v8)
      -[HDCodableSyncStateOrigin mergeFrom:](origin, "mergeFrom:");
  }
  else if (v8)
  {
    -[HDCodableSyncState setOrigin:](self, "setOrigin:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v4 + 5);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[HDCodableSyncState addVersionedData:](self, "addVersionedData:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (HDCodableSyncVersionRange)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (HDCodableSyncStateOrigin)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (NSMutableArray)versionedDatas
{
  return self->_versionedDatas;
}

- (void)setVersionedDatas:(id)a3
{
  objc_storeStrong((id *)&self->_versionedDatas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionedDatas, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
