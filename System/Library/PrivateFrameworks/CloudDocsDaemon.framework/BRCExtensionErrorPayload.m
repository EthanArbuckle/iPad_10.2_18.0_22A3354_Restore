@implementation BRCExtensionErrorPayload

- (BOOL)hasMinimumOSName
{
  return self->_minimumOSName != 0;
}

- (BOOL)hasRecordId
{
  return self->_recordId != 0;
}

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (void)clearRecordIds
{
  -[NSMutableArray removeAllObjects](self->_recordIds, "removeAllObjects");
}

- (void)addRecordIds:(id)a3
{
  id v4;
  NSMutableArray *recordIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  recordIds = self->_recordIds;
  v8 = v4;
  if (!recordIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_recordIds;
    self->_recordIds = v6;

    v4 = v8;
    recordIds = self->_recordIds;
  }
  -[NSMutableArray addObject:](recordIds, "addObject:", v4);

}

- (unint64_t)recordIdsCount
{
  return -[NSMutableArray count](self->_recordIds, "count");
}

- (id)recordIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_recordIds, "objectAtIndex:", a3);
}

+ (Class)recordIdsType
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
  v8.super_class = (Class)BRCExtensionErrorPayload;
  -[BRCExtensionErrorPayload description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCExtensionErrorPayload dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *minimumOSName;
  NSString *recordId;
  NSString *fieldName;
  NSMutableArray *recordIds;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  minimumOSName = self->_minimumOSName;
  if (minimumOSName)
    objc_msgSend(v3, "setObject:forKey:", minimumOSName, CFSTR("minimumOSName"));
  recordId = self->_recordId;
  if (recordId)
    objc_msgSend(v4, "setObject:forKey:", recordId, CFSTR("recordId"));
  fieldName = self->_fieldName;
  if (fieldName)
    objc_msgSend(v4, "setObject:forKey:", fieldName, CFSTR("fieldName"));
  recordIds = self->_recordIds;
  if (recordIds)
    objc_msgSend(v4, "setObject:forKey:", recordIds, CFSTR("recordIds"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BRCExtensionErrorPayloadReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_minimumOSName)
    PBDataWriterWriteStringField();
  if (self->_recordId)
    PBDataWriterWriteStringField();
  if (self->_fieldName)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_recordIds;
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
  if (self->_minimumOSName)
    objc_msgSend(v8, "setMinimumOSName:");
  if (self->_recordId)
    objc_msgSend(v8, "setRecordId:");
  if (self->_fieldName)
    objc_msgSend(v8, "setFieldName:");
  if (-[BRCExtensionErrorPayload recordIdsCount](self, "recordIdsCount"))
  {
    objc_msgSend(v8, "clearRecordIds");
    v4 = -[BRCExtensionErrorPayload recordIdsCount](self, "recordIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[BRCExtensionErrorPayload recordIdsAtIndex:](self, "recordIdsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addRecordIds:", v7);

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
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  v6 = -[NSString copyWithZone:](self->_minimumOSName, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_recordId, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_fieldName, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_recordIds;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addRecordIds:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *minimumOSName;
  NSString *recordId;
  NSString *fieldName;
  NSMutableArray *recordIds;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((minimumOSName = self->_minimumOSName, !((unint64_t)minimumOSName | v4[2]))
     || -[NSString isEqual:](minimumOSName, "isEqual:"))
    && ((recordId = self->_recordId, !((unint64_t)recordId | v4[3]))
     || -[NSString isEqual:](recordId, "isEqual:"))
    && ((fieldName = self->_fieldName, !((unint64_t)fieldName | v4[1]))
     || -[NSString isEqual:](fieldName, "isEqual:")))
  {
    recordIds = self->_recordIds;
    if ((unint64_t)recordIds | v4[4])
      v9 = -[NSMutableArray isEqual:](recordIds, "isEqual:");
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
  NSUInteger v5;

  v3 = -[NSString hash](self->_minimumOSName, "hash");
  v4 = -[NSString hash](self->_recordId, "hash") ^ v3;
  v5 = -[NSString hash](self->_fieldName, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_recordIds, "hash");
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
    -[BRCExtensionErrorPayload setMinimumOSName:](self, "setMinimumOSName:");
  if (*((_QWORD *)v4 + 3))
    -[BRCExtensionErrorPayload setRecordId:](self, "setRecordId:");
  if (*((_QWORD *)v4 + 1))
    -[BRCExtensionErrorPayload setFieldName:](self, "setFieldName:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 4);
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
        -[BRCExtensionErrorPayload addRecordIds:](self, "addRecordIds:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)minimumOSName
{
  return self->_minimumOSName;
}

- (void)setMinimumOSName:(id)a3
{
  objc_storeStrong((id *)&self->_minimumOSName, a3);
}

- (NSString)recordId
{
  return self->_recordId;
}

- (void)setRecordId:(id)a3
{
  objc_storeStrong((id *)&self->_recordId, a3);
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (NSMutableArray)recordIds
{
  return self->_recordIds;
}

- (void)setRecordIds:(id)a3
{
  objc_storeStrong((id *)&self->_recordIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIds, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_minimumOSName, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

@end
