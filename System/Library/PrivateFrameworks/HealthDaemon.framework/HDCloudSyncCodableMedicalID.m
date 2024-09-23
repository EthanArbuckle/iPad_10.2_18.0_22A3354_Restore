@implementation HDCloudSyncCodableMedicalID

- (BOOL)hasMedicalIDData
{
  return self->_medicalIDData != 0;
}

- (void)clearMedicalIDLogs
{
  -[NSMutableArray removeAllObjects](self->_medicalIDLogs, "removeAllObjects");
}

- (void)addMedicalIDLogs:(id)a3
{
  id v4;
  NSMutableArray *medicalIDLogs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  medicalIDLogs = self->_medicalIDLogs;
  v8 = v4;
  if (!medicalIDLogs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_medicalIDLogs;
    self->_medicalIDLogs = v6;

    v4 = v8;
    medicalIDLogs = self->_medicalIDLogs;
  }
  -[NSMutableArray addObject:](medicalIDLogs, "addObject:", v4);

}

- (unint64_t)medicalIDLogsCount
{
  return -[NSMutableArray count](self->_medicalIDLogs, "count");
}

- (id)medicalIDLogsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_medicalIDLogs, "objectAtIndex:", a3);
}

+ (Class)medicalIDLogsType
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
  v8.super_class = (Class)HDCloudSyncCodableMedicalID;
  -[HDCloudSyncCodableMedicalID description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableMedicalID dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableMedicalIDData *medicalIDData;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  medicalIDData = self->_medicalIDData;
  if (medicalIDData)
  {
    -[HDCodableMedicalIDData dictionaryRepresentation](medicalIDData, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("medicalIDData"));

  }
  if (-[NSMutableArray count](self->_medicalIDLogs, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_medicalIDLogs, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_medicalIDLogs;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("medicalIDLogs"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableMedicalIDReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_medicalIDData)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_medicalIDLogs;
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
  if (self->_medicalIDData)
    objc_msgSend(v8, "setMedicalIDData:");
  if (-[HDCloudSyncCodableMedicalID medicalIDLogsCount](self, "medicalIDLogsCount"))
  {
    objc_msgSend(v8, "clearMedicalIDLogs");
    v4 = -[HDCloudSyncCodableMedicalID medicalIDLogsCount](self, "medicalIDLogsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCloudSyncCodableMedicalID medicalIDLogsAtIndex:](self, "medicalIDLogsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addMedicalIDLogs:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
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
  v6 = -[HDCodableMedicalIDData copyWithZone:](self->_medicalIDData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_medicalIDLogs;
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
        objc_msgSend(v5, "addMedicalIDLogs:", v13);

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
  HDCodableMedicalIDData *medicalIDData;
  NSMutableArray *medicalIDLogs;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((medicalIDData = self->_medicalIDData, !((unint64_t)medicalIDData | v4[1]))
     || -[HDCodableMedicalIDData isEqual:](medicalIDData, "isEqual:")))
  {
    medicalIDLogs = self->_medicalIDLogs;
    if ((unint64_t)medicalIDLogs | v4[2])
      v7 = -[NSMutableArray isEqual:](medicalIDLogs, "isEqual:");
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
  unint64_t v3;

  v3 = -[HDCodableMedicalIDData hash](self->_medicalIDData, "hash");
  return -[NSMutableArray hash](self->_medicalIDLogs, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableMedicalIDData *medicalIDData;
  uint64_t v6;
  id v7;
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

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  medicalIDData = self->_medicalIDData;
  v6 = *((_QWORD *)v4 + 1);
  if (medicalIDData)
  {
    if (v6)
      -[HDCodableMedicalIDData mergeFrom:](medicalIDData, "mergeFrom:");
  }
  else if (v6)
  {
    -[HDCloudSyncCodableMedicalID setMedicalIDData:](self, "setMedicalIDData:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        -[HDCloudSyncCodableMedicalID addMedicalIDLogs:](self, "addMedicalIDLogs:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (HDCodableMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDData, a3);
}

- (NSMutableArray)medicalIDLogs
{
  return self->_medicalIDLogs;
}

- (void)setMedicalIDLogs:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDLogs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDLogs, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
}

@end
