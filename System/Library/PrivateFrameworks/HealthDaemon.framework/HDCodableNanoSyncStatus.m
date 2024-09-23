@implementation HDCodableNanoSyncStatus

+ (id)retreiveFromPersistentUserInfo:(id)a3
{
  return GetFromPersistentUserInfo(a3, a1);
}

+ (id)persistentUserInfoKey
{
  return CFSTR("status");
}

- (void)addAnchors:(id)a3
{
  id v4;
  NSMutableArray *anchors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  anchors = self->_anchors;
  v8 = v4;
  if (!anchors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_anchors;
    self->_anchors = v6;

    v4 = v8;
    anchors = self->_anchors;
  }
  -[NSMutableArray addObject:](anchors, "addObject:", v4);

}

- (id)nanoSyncDescription
{
  __CFString *v3;
  uint64_t statusCode;
  void *v5;
  void *v6;
  void *v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    statusCode = self->_statusCode;
    if (statusCode >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_statusCode);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = off_1E6CFBB08[statusCode];
    }
  }
  else
  {
    v3 = CFSTR("(null)");
  }
  -[HDCodableNanoSyncStatus anchors](self, "anchors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDNanoSyncDescriptionWithArray(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("status:%@ anchors:%@"), v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSMutableArray)anchors
{
  return self->_anchors;
}

- (int)statusCode
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_statusCode;
  else
    return 0;
}

- (int64_t)anchorForSyncEntityClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[objc_class syncEntityIdentifier](a3, "syncEntityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "codableEntityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HDCodableNanoSyncStatus anchors](self, "anchors", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        if ((objc_msgSend(*(id *)(v11 + 16), "isEqual:", v5) & 1) != 0)
        {
          v12 = *(_QWORD *)(v11 + 8);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = -1;
LABEL_11:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchors, 0);
}

+ (id)statusWithStatusCode:(int)a3
{
  uint64_t v3;
  HDCodableNanoSyncStatus *v4;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc_init(HDCodableNanoSyncStatus);
  -[HDCodableNanoSyncStatus setStatusCode:](v4, "setStatusCode:", v3);
  return v4;
}

- (void)setStatusCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_statusCode = a3;
}

- (void)setAnchor:(int64_t)a3 forSyncEntity:(Class)a4
{
  void *v7;
  void *v8;
  HDCodableNanoSyncAnchor *v9;

  v9 = objc_alloc_init(HDCodableNanoSyncAnchor);
  -[objc_class syncEntityIdentifier](a4, "syncEntityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "codableEntityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNanoSyncAnchor setEntityIdentifier:](v9, "setEntityIdentifier:", v8);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[HDCodableNanoSyncAnchor setObjectType:](v9, "setObjectType:", -[objc_class nanoSyncObjectType](a4, "nanoSyncObjectType"));
  -[HDCodableNanoSyncAnchor setAnchor:](v9, "setAnchor:", a3);
  -[HDCodableNanoSyncStatus addAnchors:](self, "addAnchors:", v9);

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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_anchors;
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

- (void)addToPersistentUserInfo:(id)a3
{
  SetInPersistentUserInfo(a3, self);
}

- (id)copyForPersistentUserInfo
{
  HDCodableNanoSyncStatus *v3;
  HDCodableNanoSyncStatus *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(HDCodableNanoSyncStatus);
  v4 = v3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    -[HDCodableNanoSyncStatus setStatusCode:](v3, "setStatusCode:", self->_statusCode);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HDCodableNanoSyncStatus anchors](self, "anchors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "copy");
        -[HDCodableNanoSyncStatus addAnchors:](v4, "addAnchors:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNanoSyncStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)setHasStatusCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatusCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)statusCodeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E6CF8B98[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatusCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownError")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Continue")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Resend")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Reactivate")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChangesRequested")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LastChanceChangesRequested")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Obliterate")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearAnchors
{
  -[NSMutableArray removeAllObjects](self->_anchors, "removeAllObjects");
}

- (unint64_t)anchorsCount
{
  return -[NSMutableArray count](self->_anchors, "count");
}

- (id)anchorsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_anchors, "objectAtIndex:", a3);
}

+ (Class)anchorsType
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
  v8.super_class = (Class)HDCodableNanoSyncStatus;
  -[HDCodableNanoSyncStatus description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNanoSyncStatus dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t statusCode;
  __CFString *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    statusCode = self->_statusCode;
    if (statusCode >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_statusCode);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E6CF8B98[statusCode];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("statusCode"));

  }
  if (-[NSMutableArray count](self->_anchors, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_anchors, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_anchors;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("anchors"));
  }
  return v3;
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_statusCode;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  v9 = v4;
  if (-[HDCodableNanoSyncStatus anchorsCount](self, "anchorsCount"))
  {
    objc_msgSend(v9, "clearAnchors");
    v5 = -[HDCodableNanoSyncStatus anchorsCount](self, "anchorsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[HDCodableNanoSyncStatus anchorsAtIndex:](self, "anchorsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAnchors:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_statusCode;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_anchors;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend(v6, "addAnchors:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *anchors;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_statusCode != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  anchors = self->_anchors;
  if ((unint64_t)anchors | *((_QWORD *)v4 + 1))
    v6 = -[NSMutableArray isEqual:](anchors, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_statusCode;
  else
    v2 = 0;
  return -[NSMutableArray hash](self->_anchors, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_statusCode = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[HDCodableNanoSyncStatus addAnchors:](self, "addAnchors:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)setAnchors:(id)a3
{
  objc_storeStrong((id *)&self->_anchors, a3);
}

- (int64_t)anchorForSyncEntityIdentifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "codableEntityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HDCodableNanoSyncStatus anchors](self, "anchors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "entityIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {

LABEL_15:
          v15 = v10[1];
          goto LABEL_17;
        }
        v12 = v11;
        if (v4)
        {
          objc_msgSend(v10, "entityIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v4);

          if ((v14 & 1) != 0)
            goto LABEL_15;
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v15 = -1;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v15 = -1;
  }
LABEL_17:

  return v15;
}

- (void)enumerateAnchorsAndEntityIdentifiersWithBlock:(id)a3
{
  void (**v4)(id, HDSyncEntityIdentifier *, uint64_t, _BYTE *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HDSyncEntityIdentifier *v13;
  HDSyncEntityIdentifier *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unsigned __int8 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, HDSyncEntityIdentifier *, uint64_t, _BYTE *))a3;
  v20 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HDCodableNanoSyncStatus anchors](self, "anchors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
      v11 = objc_msgSend(v10, "hasAnchor") ? objc_msgSend(v10, "anchor") : -1;
      objc_msgSend(v10, "entityIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = -[HDSyncEntityIdentifier initWithCodableEntityIdentifier:]([HDSyncEntityIdentifier alloc], "initWithCodableEntityIdentifier:", v12);
        v14 = v13;
        if ((v11 & 0x8000000000000000) == 0 && v13)
          v4[2](v4, v13, v11, &v20);
      }
      else
      {
        v14 = 0;
      }
      v15 = v20;

      if (v15)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (unint64_t)anchorCount
{
  void *v2;
  unint64_t v3;

  -[HDCodableNanoSyncStatus anchors](self, "anchors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

@end
