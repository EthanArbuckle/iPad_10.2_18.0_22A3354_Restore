@implementation HDCloudSyncCodableSharedSummaryRecord

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasPackage
{
  return self->_package != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasCompatibilityVersion
{
  return self->_compatibilityVersion != 0;
}

- (void)clearObjectTypeIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_objectTypeIdentifiers, "removeAllObjects");
}

- (void)addObjectTypeIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *objectTypeIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  objectTypeIdentifiers = self->_objectTypeIdentifiers;
  v8 = v4;
  if (!objectTypeIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_objectTypeIdentifiers;
    self->_objectTypeIdentifiers = v6;

    v4 = v8;
    objectTypeIdentifiers = self->_objectTypeIdentifiers;
  }
  -[NSMutableArray addObject:](objectTypeIdentifiers, "addObject:", v4);

}

- (unint64_t)objectTypeIdentifiersCount
{
  return -[NSMutableArray count](self->_objectTypeIdentifiers, "count");
}

- (id)objectTypeIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_objectTypeIdentifiers, "objectAtIndex:", a3);
}

+ (Class)objectTypeIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearAuthorizationCategories
{
  -[NSMutableArray removeAllObjects](self->_authorizationCategories, "removeAllObjects");
}

- (void)addAuthorizationCategories:(id)a3
{
  id v4;
  NSMutableArray *authorizationCategories;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  authorizationCategories = self->_authorizationCategories;
  v8 = v4;
  if (!authorizationCategories)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_authorizationCategories;
    self->_authorizationCategories = v6;

    v4 = v8;
    authorizationCategories = self->_authorizationCategories;
  }
  -[NSMutableArray addObject:](authorizationCategories, "addObject:", v4);

}

- (unint64_t)authorizationCategoriesCount
{
  return -[NSMutableArray count](self->_authorizationCategories, "count");
}

- (id)authorizationCategoriesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_authorizationCategories, "objectAtIndex:", a3);
}

+ (Class)authorizationCategoriesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSummaryData
{
  return self->_summaryData != 0;
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
  v8.super_class = (Class)HDCloudSyncCodableSharedSummaryRecord;
  -[HDCloudSyncCodableSharedSummaryRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSharedSummaryRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuid;
  NSString *package;
  NSString *name;
  NSString *version;
  NSString *compatibilityVersion;
  NSMutableArray *objectTypeIdentifiers;
  NSMutableArray *authorizationCategories;
  NSData *summaryData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  package = self->_package;
  if (package)
    objc_msgSend(v4, "setObject:forKey:", package, CFSTR("package"));
  name = self->_name;
  if (name)
    objc_msgSend(v4, "setObject:forKey:", name, CFSTR("name"));
  version = self->_version;
  if (version)
    objc_msgSend(v4, "setObject:forKey:", version, CFSTR("version"));
  compatibilityVersion = self->_compatibilityVersion;
  if (compatibilityVersion)
    objc_msgSend(v4, "setObject:forKey:", compatibilityVersion, CFSTR("compatibilityVersion"));
  objectTypeIdentifiers = self->_objectTypeIdentifiers;
  if (objectTypeIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", objectTypeIdentifiers, CFSTR("objectTypeIdentifiers"));
  authorizationCategories = self->_authorizationCategories;
  if (authorizationCategories)
    objc_msgSend(v4, "setObject:forKey:", authorizationCategories, CFSTR("authorizationCategories"));
  summaryData = self->_summaryData;
  if (summaryData)
    objc_msgSend(v4, "setObject:forKey:", summaryData, CFSTR("summaryData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableSharedSummaryRecordReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  if (self->_uuid)
    PBDataWriterWriteStringField();
  if (self->_package)
    PBDataWriterWriteStringField();
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_version)
    PBDataWriterWriteStringField();
  if (self->_compatibilityVersion)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_objectTypeIdentifiers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_authorizationCategories;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (self->_summaryData)
    PBDataWriterWriteDataField();

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
  if (self->_uuid)
    objc_msgSend(v12, "setUuid:");
  if (self->_package)
    objc_msgSend(v12, "setPackage:");
  if (self->_name)
    objc_msgSend(v12, "setName:");
  if (self->_version)
    objc_msgSend(v12, "setVersion:");
  if (self->_compatibilityVersion)
    objc_msgSend(v12, "setCompatibilityVersion:");
  if (-[HDCloudSyncCodableSharedSummaryRecord objectTypeIdentifiersCount](self, "objectTypeIdentifiersCount"))
  {
    objc_msgSend(v12, "clearObjectTypeIdentifiers");
    v4 = -[HDCloudSyncCodableSharedSummaryRecord objectTypeIdentifiersCount](self, "objectTypeIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCloudSyncCodableSharedSummaryRecord objectTypeIdentifiersAtIndex:](self, "objectTypeIdentifiersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectTypeIdentifiers:", v7);

      }
    }
  }
  if (-[HDCloudSyncCodableSharedSummaryRecord authorizationCategoriesCount](self, "authorizationCategoriesCount"))
  {
    objc_msgSend(v12, "clearAuthorizationCategories");
    v8 = -[HDCloudSyncCodableSharedSummaryRecord authorizationCategoriesCount](self, "authorizationCategoriesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[HDCloudSyncCodableSharedSummaryRecord authorizationCategoriesAtIndex:](self, "authorizationCategoriesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAuthorizationCategories:", v11);

      }
    }
  }
  if (self->_summaryData)
    objc_msgSend(v12, "setSummaryData:");

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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[NSString copyWithZone:](self->_package, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_version, "copyWithZone:", a3);
  v13 = (void *)v5[8];
  v5[8] = v12;

  v14 = -[NSString copyWithZone:](self->_compatibilityVersion, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = self->_objectTypeIdentifiers;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v20), "copyWithZone:", a3);
        objc_msgSend(v5, "addObjectTypeIdentifiers:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v18);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = self->_authorizationCategories;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v26), "copyWithZone:", a3, (_QWORD)v31);
        objc_msgSend(v5, "addAuthorizationCategories:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v24);
  }

  v28 = -[NSData copyWithZone:](self->_summaryData, "copyWithZone:", a3);
  v29 = (void *)v5[6];
  v5[6] = v28;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uuid;
  NSString *package;
  NSString *name;
  NSString *version;
  NSString *compatibilityVersion;
  NSMutableArray *objectTypeIdentifiers;
  NSMutableArray *authorizationCategories;
  NSData *summaryData;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[7])) || -[NSString isEqual:](uuid, "isEqual:"))
    && ((package = self->_package, !((unint64_t)package | v4[5]))
     || -[NSString isEqual:](package, "isEqual:"))
    && ((name = self->_name, !((unint64_t)name | v4[3])) || -[NSString isEqual:](name, "isEqual:"))
    && ((version = self->_version, !((unint64_t)version | v4[8]))
     || -[NSString isEqual:](version, "isEqual:"))
    && ((compatibilityVersion = self->_compatibilityVersion, !((unint64_t)compatibilityVersion | v4[2]))
     || -[NSString isEqual:](compatibilityVersion, "isEqual:"))
    && ((objectTypeIdentifiers = self->_objectTypeIdentifiers, !((unint64_t)objectTypeIdentifiers | v4[4]))
     || -[NSMutableArray isEqual:](objectTypeIdentifiers, "isEqual:"))
    && ((authorizationCategories = self->_authorizationCategories, !((unint64_t)authorizationCategories | v4[1]))
     || -[NSMutableArray isEqual:](authorizationCategories, "isEqual:")))
  {
    summaryData = self->_summaryData;
    if ((unint64_t)summaryData | v4[6])
      v13 = -[NSData isEqual:](summaryData, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_uuid, "hash");
  v4 = -[NSString hash](self->_package, "hash") ^ v3;
  v5 = -[NSString hash](self->_name, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_version, "hash");
  v7 = -[NSString hash](self->_compatibilityVersion, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_objectTypeIdentifiers, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_authorizationCategories, "hash");
  return v9 ^ -[NSData hash](self->_summaryData, "hash");
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
  if (*((_QWORD *)v4 + 7))
    -[HDCloudSyncCodableSharedSummaryRecord setUuid:](self, "setUuid:");
  if (*((_QWORD *)v4 + 5))
    -[HDCloudSyncCodableSharedSummaryRecord setPackage:](self, "setPackage:");
  if (*((_QWORD *)v4 + 3))
    -[HDCloudSyncCodableSharedSummaryRecord setName:](self, "setName:");
  if (*((_QWORD *)v4 + 8))
    -[HDCloudSyncCodableSharedSummaryRecord setVersion:](self, "setVersion:");
  if (*((_QWORD *)v4 + 2))
    -[HDCloudSyncCodableSharedSummaryRecord setCompatibilityVersion:](self, "setCompatibilityVersion:");
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
        -[HDCloudSyncCodableSharedSummaryRecord addObjectTypeIdentifiers:](self, "addObjectTypeIdentifiers:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 1);
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
        -[HDCloudSyncCodableSharedSummaryRecord addAuthorizationCategories:](self, "addAuthorizationCategories:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 6))
    -[HDCloudSyncCodableSharedSummaryRecord setSummaryData:](self, "setSummaryData:");

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
  objc_storeStrong((id *)&self->_package, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSString)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
  objc_storeStrong((id *)&self->_compatibilityVersion, a3);
}

- (NSMutableArray)objectTypeIdentifiers
{
  return self->_objectTypeIdentifiers;
}

- (void)setObjectTypeIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_objectTypeIdentifiers, a3);
}

- (NSMutableArray)authorizationCategories
{
  return self->_authorizationCategories;
}

- (void)setAuthorizationCategories:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationCategories, a3);
}

- (NSData)summaryData
{
  return self->_summaryData;
}

- (void)setSummaryData:(id)a3
{
  objc_storeStrong((id *)&self->_summaryData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_summaryData, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_objectTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_authorizationCategories, 0);
}

@end
