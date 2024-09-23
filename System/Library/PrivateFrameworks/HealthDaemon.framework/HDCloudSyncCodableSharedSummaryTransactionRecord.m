@implementation HDCloudSyncCodableSharedSummaryTransactionRecord

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasSourceDeviceIdentifier
{
  return self->_sourceDeviceIdentifier != 0;
}

- (void)clearSummaryIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_summaryIdentifiers, "removeAllObjects");
}

- (void)addSummaryIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *summaryIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  summaryIdentifiers = self->_summaryIdentifiers;
  v8 = v4;
  if (!summaryIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_summaryIdentifiers;
    self->_summaryIdentifiers = v6;

    v4 = v8;
    summaryIdentifiers = self->_summaryIdentifiers;
  }
  -[NSMutableArray addObject:](summaryIdentifiers, "addObject:", v4);

}

- (unint64_t)summaryIdentifiersCount
{
  return -[NSMutableArray count](self->_summaryIdentifiers, "count");
}

- (id)summaryIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_summaryIdentifiers, "objectAtIndex:", a3);
}

+ (Class)summaryIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
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
  v8.super_class = (Class)HDCloudSyncCodableSharedSummaryTransactionRecord;
  -[HDCloudSyncCodableSharedSummaryTransactionRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableSharedSummaryTransactionRecord dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *sourceDeviceIdentifier;
  NSMutableArray *summaryIdentifiers;
  NSData *metadata;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  sourceDeviceIdentifier = self->_sourceDeviceIdentifier;
  if (sourceDeviceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sourceDeviceIdentifier, CFSTR("sourceDeviceIdentifier"));
  summaryIdentifiers = self->_summaryIdentifiers;
  if (summaryIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", summaryIdentifiers, CFSTR("summaryIdentifiers"));
  metadata = self->_metadata;
  if (metadata)
    objc_msgSend(v4, "setObject:forKey:", metadata, CFSTR("metadata"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableSharedSummaryTransactionRecordReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_sourceDeviceIdentifier)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_summaryIdentifiers;
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

  if (self->_metadata)
    PBDataWriterWriteDataField();

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
  if (self->_sourceDeviceIdentifier)
    objc_msgSend(v8, "setSourceDeviceIdentifier:");
  if (-[HDCloudSyncCodableSharedSummaryTransactionRecord summaryIdentifiersCount](self, "summaryIdentifiersCount"))
  {
    objc_msgSend(v8, "clearSummaryIdentifiers");
    v4 = -[HDCloudSyncCodableSharedSummaryTransactionRecord summaryIdentifiersCount](self, "summaryIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCloudSyncCodableSharedSummaryTransactionRecord summaryIdentifiersAtIndex:](self, "summaryIdentifiersAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSummaryIdentifiers:", v7);

      }
    }
  }
  if (self->_metadata)
    objc_msgSend(v8, "setMetadata:");

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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_sourceDeviceIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_summaryIdentifiers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addSummaryIdentifiers:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v16 = -[NSData copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v17 = (void *)v5[1];
  v5[1] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uuid;
  NSString *sourceDeviceIdentifier;
  NSMutableArray *summaryIdentifiers;
  NSData *metadata;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[4])) || -[NSString isEqual:](uuid, "isEqual:"))
    && ((sourceDeviceIdentifier = self->_sourceDeviceIdentifier, !((unint64_t)sourceDeviceIdentifier | v4[2]))
     || -[NSString isEqual:](sourceDeviceIdentifier, "isEqual:"))
    && ((summaryIdentifiers = self->_summaryIdentifiers, !((unint64_t)summaryIdentifiers | v4[3]))
     || -[NSMutableArray isEqual:](summaryIdentifiers, "isEqual:")))
  {
    metadata = self->_metadata;
    if ((unint64_t)metadata | v4[1])
      v9 = -[NSData isEqual:](metadata, "isEqual:");
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
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_uuid, "hash");
  v4 = -[NSString hash](self->_sourceDeviceIdentifier, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_summaryIdentifiers, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_metadata, "hash");
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
  if (*((_QWORD *)v4 + 4))
    -[HDCloudSyncCodableSharedSummaryTransactionRecord setUuid:](self, "setUuid:");
  if (*((_QWORD *)v4 + 2))
    -[HDCloudSyncCodableSharedSummaryTransactionRecord setSourceDeviceIdentifier:](self, "setSourceDeviceIdentifier:");
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
        -[HDCloudSyncCodableSharedSummaryTransactionRecord addSummaryIdentifiers:](self, "addSummaryIdentifiers:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 1))
    -[HDCloudSyncCodableSharedSummaryTransactionRecord setMetadata:](self, "setMetadata:");

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)sourceDeviceIdentifier
{
  return self->_sourceDeviceIdentifier;
}

- (void)setSourceDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDeviceIdentifier, a3);
}

- (NSMutableArray)summaryIdentifiers
{
  return self->_summaryIdentifiers;
}

- (void)setSummaryIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_summaryIdentifiers, a3);
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_summaryIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
