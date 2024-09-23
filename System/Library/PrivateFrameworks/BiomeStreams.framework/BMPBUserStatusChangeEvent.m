@implementation BMPBUserStatusChangeEvent

- (BOOL)hasIdsHandle
{
  return self->_idsHandle != 0;
}

- (BOOL)hasStatusChangeType
{
  return self->_statusChangeType != 0;
}

- (void)clearIdsHandles
{
  -[NSMutableArray removeAllObjects](self->_idsHandles, "removeAllObjects");
}

- (void)addIdsHandles:(id)a3
{
  id v4;
  NSMutableArray *idsHandles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  idsHandles = self->_idsHandles;
  v8 = v4;
  if (!idsHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_idsHandles;
    self->_idsHandles = v6;

    v4 = v8;
    idsHandles = self->_idsHandles;
  }
  -[NSMutableArray addObject:](idsHandles, "addObject:", v4);

}

- (unint64_t)idsHandlesCount
{
  return -[NSMutableArray count](self->_idsHandles, "count");
}

- (id)idsHandlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_idsHandles, "objectAtIndex:", a3);
}

+ (Class)idsHandlesType
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
  v8.super_class = (Class)BMPBUserStatusChangeEvent;
  -[BMPBUserStatusChangeEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBUserStatusChangeEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *idsHandle;
  NSString *statusChangeType;
  NSMutableArray *idsHandles;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  idsHandle = self->_idsHandle;
  if (idsHandle)
    objc_msgSend(v3, "setObject:forKey:", idsHandle, CFSTR("idsHandle"));
  statusChangeType = self->_statusChangeType;
  if (statusChangeType)
    objc_msgSend(v4, "setObject:forKey:", statusChangeType, CFSTR("statusChangeType"));
  idsHandles = self->_idsHandles;
  if (idsHandles)
    objc_msgSend(v4, "setObject:forKey:", idsHandles, CFSTR("idsHandles"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBUserStatusChangeEventReadFrom((char *)self, (uint64_t)a3);
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
  if (self->_idsHandle)
    PBDataWriterWriteStringField();
  if (self->_statusChangeType)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_idsHandles;
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
  if (self->_idsHandle)
    objc_msgSend(v8, "setIdsHandle:");
  if (self->_statusChangeType)
    objc_msgSend(v8, "setStatusChangeType:");
  if (-[BMPBUserStatusChangeEvent idsHandlesCount](self, "idsHandlesCount"))
  {
    objc_msgSend(v8, "clearIdsHandles");
    v4 = -[BMPBUserStatusChangeEvent idsHandlesCount](self, "idsHandlesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[BMPBUserStatusChangeEvent idsHandlesAtIndex:](self, "idsHandlesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addIdsHandles:", v7);

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
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_idsHandle, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_statusChangeType, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_idsHandles;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addIdsHandles:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *idsHandle;
  NSString *statusChangeType;
  NSMutableArray *idsHandles;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((idsHandle = self->_idsHandle, !((unint64_t)idsHandle | v4[1]))
     || -[NSString isEqual:](idsHandle, "isEqual:"))
    && ((statusChangeType = self->_statusChangeType, !((unint64_t)statusChangeType | v4[3]))
     || -[NSString isEqual:](statusChangeType, "isEqual:")))
  {
    idsHandles = self->_idsHandles;
    if ((unint64_t)idsHandles | v4[2])
      v8 = -[NSMutableArray isEqual:](idsHandles, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_idsHandle, "hash");
  v4 = -[NSString hash](self->_statusChangeType, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_idsHandles, "hash");
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
  if (*((_QWORD *)v4 + 1))
    -[BMPBUserStatusChangeEvent setIdsHandle:](self, "setIdsHandle:");
  if (*((_QWORD *)v4 + 3))
    -[BMPBUserStatusChangeEvent setStatusChangeType:](self, "setStatusChangeType:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 2);
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
        -[BMPBUserStatusChangeEvent addIdsHandles:](self, "addIdsHandles:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (void)setIdsHandle:(id)a3
{
  objc_storeStrong((id *)&self->_idsHandle, a3);
}

- (NSString)statusChangeType
{
  return self->_statusChangeType;
}

- (void)setStatusChangeType:(id)a3
{
  objc_storeStrong((id *)&self->_statusChangeType, a3);
}

- (NSMutableArray)idsHandles
{
  return self->_idsHandles;
}

- (void)setIdsHandles:(id)a3
{
  objc_storeStrong((id *)&self->_idsHandles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusChangeType, 0);
  objc_storeStrong((id *)&self->_idsHandles, 0);
  objc_storeStrong((id *)&self->_idsHandle, 0);
}

@end
