@implementation HDCodableSourceAuthorization

- (BOOL)hasSourceUUID
{
  return self->_sourceUUID != 0;
}

- (void)clearAuthorizations
{
  -[NSMutableArray removeAllObjects](self->_authorizations, "removeAllObjects");
}

- (void)addAuthorizations:(id)a3
{
  id v4;
  NSMutableArray *authorizations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  authorizations = self->_authorizations;
  v8 = v4;
  if (!authorizations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_authorizations;
    self->_authorizations = v6;

    v4 = v8;
    authorizations = self->_authorizations;
  }
  -[NSMutableArray addObject:](authorizations, "addObject:", v4);

}

- (unint64_t)authorizationsCount
{
  return -[NSMutableArray count](self->_authorizations, "count");
}

- (id)authorizationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_authorizations, "objectAtIndex:", a3);
}

+ (Class)authorizationsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBackupUUID
{
  return self->_backupUUID != 0;
}

- (BOOL)hasSource
{
  return self->_source != 0;
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
  v8.super_class = (Class)HDCodableSourceAuthorization;
  -[HDCodableSourceAuthorization description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSourceAuthorization dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *sourceUUID;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSData *backupUUID;
  HDCodableSource *source;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sourceUUID = self->_sourceUUID;
  if (sourceUUID)
    objc_msgSend(v3, "setObject:forKey:", sourceUUID, CFSTR("sourceUUID"));
  if (-[NSMutableArray count](self->_authorizations, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_authorizations, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_authorizations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("authorizations"));
  }
  backupUUID = self->_backupUUID;
  if (backupUUID)
    objc_msgSend(v4, "setObject:forKey:", backupUUID, CFSTR("backupUUID"));
  source = self->_source;
  if (source)
  {
    -[HDCodableSource dictionaryRepresentation](source, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("source"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSourceAuthorizationReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_sourceUUID)
    PBDataWriterWriteDataField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_authorizations;
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

  if (self->_backupUUID)
    PBDataWriterWriteDataField();
  if (self->_source)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_sourceUUID)
    objc_msgSend(v9, "setSourceUUID:");
  if (-[HDCodableSourceAuthorization authorizationsCount](self, "authorizationsCount"))
  {
    objc_msgSend(v9, "clearAuthorizations");
    v4 = -[HDCodableSourceAuthorization authorizationsCount](self, "authorizationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCodableSourceAuthorization authorizationsAtIndex:](self, "authorizationsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAuthorizations:", v7);

      }
    }
  }
  if (self->_backupUUID)
    objc_msgSend(v9, "setBackupUUID:");
  v8 = v9;
  if (self->_source)
  {
    objc_msgSend(v9, "setSource:");
    v8 = v9;
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
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_sourceUUID, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_authorizations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addAuthorizations:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v14 = -[NSData copyWithZone:](self->_backupUUID, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v16 = -[HDCodableSource copyWithZone:](self->_source, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *sourceUUID;
  NSMutableArray *authorizations;
  NSData *backupUUID;
  HDCodableSource *source;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((sourceUUID = self->_sourceUUID, !((unint64_t)sourceUUID | v4[4]))
     || -[NSData isEqual:](sourceUUID, "isEqual:"))
    && ((authorizations = self->_authorizations, !((unint64_t)authorizations | v4[1]))
     || -[NSMutableArray isEqual:](authorizations, "isEqual:"))
    && ((backupUUID = self->_backupUUID, !((unint64_t)backupUUID | v4[2]))
     || -[NSData isEqual:](backupUUID, "isEqual:")))
  {
    source = self->_source;
    if ((unint64_t)source | v4[3])
      v9 = -[HDCodableSource isEqual:](source, "isEqual:");
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
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_sourceUUID, "hash");
  v4 = -[NSMutableArray hash](self->_authorizations, "hash") ^ v3;
  v5 = -[NSData hash](self->_backupUUID, "hash");
  return v4 ^ v5 ^ -[HDCodableSource hash](self->_source, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  HDCodableSource *source;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[HDCodableSourceAuthorization setSourceUUID:](self, "setSourceUUID:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[HDCodableSourceAuthorization addAuthorizations:](self, "addAuthorizations:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 2))
    -[HDCodableSourceAuthorization setBackupUUID:](self, "setBackupUUID:");
  source = self->_source;
  v11 = *((_QWORD *)v4 + 3);
  if (source)
  {
    if (v11)
      -[HDCodableSource mergeFrom:](source, "mergeFrom:");
  }
  else if (v11)
  {
    -[HDCodableSourceAuthorization setSource:](self, "setSource:");
  }

}

- (NSData)sourceUUID
{
  return self->_sourceUUID;
}

- (void)setSourceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceUUID, a3);
}

- (NSMutableArray)authorizations
{
  return self->_authorizations;
}

- (void)setAuthorizations:(id)a3
{
  objc_storeStrong((id *)&self->_authorizations, a3);
}

- (NSData)backupUUID
{
  return self->_backupUUID;
}

- (void)setBackupUUID:(id)a3
{
  objc_storeStrong((id *)&self->_backupUUID, a3);
}

- (HDCodableSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_backupUUID, 0);
  objc_storeStrong((id *)&self->_authorizations, 0);
}

- (id)decodedSourceUUID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", self->_sourceUUID);
}

- (id)decodedBackupUUID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", self->_backupUUID);
}

@end
