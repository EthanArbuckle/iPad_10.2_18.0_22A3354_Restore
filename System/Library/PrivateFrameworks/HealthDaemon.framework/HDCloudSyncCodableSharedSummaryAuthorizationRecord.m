@implementation HDCloudSyncCodableSharedSummaryAuthorizationRecord

- (BOOL)hasUuid
{
  return self->_uuid != 0;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableSharedSummaryAuthorizationRecord;
  -[HDCloudSyncCodableSharedSummaryAuthorizationRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSharedSummaryAuthorizationRecord dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSMutableArray *authorizationCategories;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  authorizationCategories = self->_authorizationCategories;
  if (authorizationCategories)
    objc_msgSend(v4, "setObject:forKey:", authorizationCategories, CFSTR("authorizationCategories"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableSharedSummaryAuthorizationRecordReadFrom(self, (uint64_t)a3);
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
  if (self->_uuid)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_authorizationCategories;
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
        PBDataWriterWriteStringField();
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
  if (self->_uuid)
    objc_msgSend(v8, "setUuid:");
  if (-[HDCloudSyncCodableSharedSummaryAuthorizationRecord authorizationCategoriesCount](self, "authorizationCategoriesCount"))
  {
    objc_msgSend(v8, "clearAuthorizationCategories");
    v4 = -[HDCloudSyncCodableSharedSummaryAuthorizationRecord authorizationCategoriesCount](self, "authorizationCategoriesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCloudSyncCodableSharedSummaryAuthorizationRecord authorizationCategoriesAtIndex:](self, "authorizationCategoriesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAuthorizationCategories:", v7);

      }
    }
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_authorizationCategories;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v5, "addAuthorizationCategories:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uuid;
  NSMutableArray *authorizationCategories;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[2])) || -[NSString isEqual:](uuid, "isEqual:")))
  {
    authorizationCategories = self->_authorizationCategories;
    if ((unint64_t)authorizationCategories | v4[1])
      v7 = -[NSMutableArray isEqual:](authorizationCategories, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_uuid, "hash");
  return -[NSMutableArray hash](self->_authorizationCategories, "hash") ^ v3;
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
  if (*((_QWORD *)v4 + 2))
    -[HDCloudSyncCodableSharedSummaryAuthorizationRecord setUuid:](self, "setUuid:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
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
        -[HDCloudSyncCodableSharedSummaryAuthorizationRecord addAuthorizationCategories:](self, "addAuthorizationCategories:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSMutableArray)authorizationCategories
{
  return self->_authorizationCategories;
}

- (void)setAuthorizationCategories:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationCategories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_authorizationCategories, 0);
}

@end
