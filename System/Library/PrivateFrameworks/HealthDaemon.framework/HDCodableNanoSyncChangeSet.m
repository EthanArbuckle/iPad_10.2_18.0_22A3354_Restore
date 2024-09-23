@implementation HDCodableNanoSyncChangeSet

+ (id)changeSetWithChanges:(id)a3 sessionUUID:(id)a4 startDate:(id)a5 sessionError:(id)a6 statusCode:(int)a7
{
  uint64_t v7;
  id v11;
  id v12;
  HDCodableNanoSyncChangeSet *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v7 = *(_QWORD *)&a7;
  v35 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v29 = a5;
  v28 = a6;
  v12 = a3;
  v13 = objc_alloc_init(HDCodableNanoSyncChangeSet);
  v14 = v12;
  if (v13)
  {
    v15 = objc_opt_class();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v20);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v27 = v7;
            v22 = v11;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__addChanges_, v13, CFSTR("HDNanoSyncSupport.m"), 353, CFSTR("%@ must be an instance of %@"), v21, v15);

            v11 = v22;
            v7 = v27;
          }
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[HDCodableNanoSyncChangeSet addChanges:](v13, "addChanges:", v21);
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v18);
    }

  }
  if (v11)
  {
    objc_msgSend(v11, "hk_dataForUUIDBytes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableNanoSyncChangeSet setSessionUUID:](v13, "setSessionUUID:", v24);

  }
  if (v29)
  {
    objc_msgSend(v29, "timeIntervalSinceReferenceDate");
    -[HDCodableNanoSyncChangeSet setSessionStartDate:](v13, "setSessionStartDate:");
  }
  if (v28)
  {
    objc_msgSend(v28, "hk_codableError");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableNanoSyncChangeSet setSessionError:](v13, "setSessionError:", v25);

  }
  -[HDCodableNanoSyncChangeSet setStatusCode:](v13, "setStatusCode:", v7);

  return v13;
}

- (void)addChanges:(id)a3
{
  id v4;
  NSMutableArray *changes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  changes = self->_changes;
  v8 = v4;
  if (!changes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_changes;
    self->_changes = v6;

    v4 = v8;
    changes = self->_changes;
  }
  -[NSMutableArray addObject:](changes, "addObject:", v4);

}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (void)setSessionStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sessionStartDate = a3;
}

- (void)setStatusCode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_statusCode = a3;
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_changes;
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

  if (self->_sessionUUID)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_sessionError)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)addToPersistentUserInfo:(id)a3
{
  SetInPersistentUserInfo(a3, self);
}

- (id)copyForPersistentUserInfo
{
  HDCodableNanoSyncChangeSet *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  HDCodableNanoSyncChange *v10;
  HDCodableNanoSyncChange *v11;
  void *v12;
  char v13;
  uint64_t v14;
  HDCodableNanoSyncChangeSet *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(HDCodableNanoSyncChangeSet);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = self;
  -[HDCodableNanoSyncChangeSet changes](self, "changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v10 = objc_alloc_init(HDCodableNanoSyncChange);
        v11 = v10;
        if ((*(_BYTE *)(v9 + 76) & 8) != 0)
          -[HDCodableNanoSyncChange setObjectType:](v10, "setObjectType:", *(unsigned int *)(v9 + 48));
        if (objc_msgSend((id)v9, "hasEntityIdentifier"))
        {
          objc_msgSend((id)v9, "entityIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableNanoSyncChange setEntityIdentifier:](v11, "setEntityIdentifier:", v12);

        }
        v13 = *(_BYTE *)(v9 + 76);
        if ((v13 & 0x20) != 0)
        {
          -[HDCodableNanoSyncChange setSpeculative:](v11, "setSpeculative:", *(unsigned __int8 *)(v9 + 73));
          v13 = *(_BYTE *)(v9 + 76);
          if ((v13 & 4) == 0)
          {
LABEL_12:
            if ((v13 & 1) == 0)
              goto LABEL_14;
LABEL_13:
            -[HDCodableNanoSyncChange setEndAnchor:](v11, "setEndAnchor:", *(_QWORD *)(v9 + 8));
            goto LABEL_14;
          }
        }
        else if ((*(_BYTE *)(v9 + 76) & 4) == 0)
        {
          goto LABEL_12;
        }
        -[HDCodableNanoSyncChange setStartAnchor:](v11, "setStartAnchor:", *(_QWORD *)(v9 + 24));
        if ((*(_BYTE *)(v9 + 76) & 1) != 0)
          goto LABEL_13;
LABEL_14:
        -[HDCodableNanoSyncChangeSet addChanges:](v3, "addChanges:", v11);

        ++v8;
      }
      while (v6 != v8);
      v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = v14;
    }
    while (v14);
  }

  if ((*(_BYTE *)&v16->_has & 2) != 0)
    -[HDCodableNanoSyncChangeSet setStatusCode:](v3, "setStatusCode:", v16->_statusCode);
  -[HDCodableNanoSyncChangeSet setSessionUUID:](v3, "setSessionUUID:", v16->_sessionUUID);
  return v3;
}

- (NSMutableArray)changes
{
  return self->_changes;
}

+ (id)persistentUserInfoKey
{
  return CFSTR("changeset");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_sessionError, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

+ (id)retreiveFromPersistentUserInfo:(id)a3
{
  return GetFromPersistentUserInfo(a3, a1);
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNanoSyncChangeSetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)nanoSyncDescription
{
  uint64_t statusCode;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  statusCode = self->_statusCode;
  switch((_DWORD)statusCode)
  {
    case 1:
      v4 = CFSTR("Continue");
      goto LABEL_10;
    case 3:
      v4 = CFSTR("Error");
      break;
    case 2:
      v4 = CFSTR("Finished");
      goto LABEL_10;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), statusCode);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (self->_statusCode != 3)
        goto LABEL_10;
      break;
  }
  if (-[HDCodableNanoSyncChangeSet hasSessionError](self, "hasSessionError"))
  {
    -[HDCodableNanoSyncChangeSet sessionError](self, "sessionError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "code");
    -[HDCodableNanoSyncChangeSet sessionError](self, "sessionError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableNanoSyncChangeSet sessionError](self, "sessionError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR(":%lld, %@, %@"), v6, v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v11;
  }
LABEL_10:
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[HDCodableNanoSyncChangeSet decodedSessionUUID](self, "decodedSessionUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNanoSyncChangeSet changes](self, "changes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HDNanoSyncDescriptionWithArray(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("session:%@ status:%@, changes:%@"), v14, v4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)decodedSessionUUID
{
  void *v2;

  if (self->_sessionUUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (int)statusCode
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_statusCode;
  else
    return 1;
}

- (id)decodedSessionStartDate
{
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return 0;
  HDDecodeDateForValue();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)decodedSessionError
{
  void *v2;

  if (self->_sessionError)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorWithCodableError:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setSessionError:(id)a3
{
  objc_storeStrong((id *)&self->_sessionError, a3);
}

- (void)clearChanges
{
  -[NSMutableArray removeAllObjects](self->_changes, "removeAllObjects");
}

- (unint64_t)changesCount
{
  return -[NSMutableArray count](self->_changes, "count");
}

- (id)changesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_changes, "objectAtIndex:", a3);
}

+ (Class)changesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (void)setHasSessionStartDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionStartDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSessionError
{
  return self->_sessionError != 0;
}

- (void)setHasStatusCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatusCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)statusCodeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E6CFD480[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatusCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Continue")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Finished")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Error")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
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
  v8.super_class = (Class)HDCodableNanoSyncChangeSet;
  -[HDCodableNanoSyncChangeSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNanoSyncChangeSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSData *sessionUUID;
  void *v12;
  HDCodableError *sessionError;
  void *v14;
  unsigned int v15;
  __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_changes, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_changes, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = self->_changes;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("changes"));
  }
  sessionUUID = self->_sessionUUID;
  if (sessionUUID)
    objc_msgSend(v3, "setObject:forKey:", sessionUUID, CFSTR("sessionUUID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sessionStartDate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("sessionStartDate"));

  }
  sessionError = self->_sessionError;
  if (sessionError)
  {
    -[HDCodableError dictionaryRepresentation](sessionError, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("sessionError"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v15 = self->_statusCode - 1;
    if (v15 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_statusCode);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E6CFD480[v15];
    }
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("statusCode"));

  }
  return v3;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _DWORD *v8;
  id v9;

  v9 = a3;
  if (-[HDCodableNanoSyncChangeSet changesCount](self, "changesCount"))
  {
    objc_msgSend(v9, "clearChanges");
    v4 = -[HDCodableNanoSyncChangeSet changesCount](self, "changesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCodableNanoSyncChangeSet changesAtIndex:](self, "changesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addChanges:", v7);

      }
    }
  }
  if (self->_sessionUUID)
    objc_msgSend(v9, "setSessionUUID:");
  v8 = v9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v9 + 1) = *(_QWORD *)&self->_sessionStartDate;
    *((_BYTE *)v9 + 44) |= 1u;
  }
  if (self->_sessionError)
  {
    objc_msgSend(v9, "setSessionError:");
    v8 = v9;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v8[10] = self->_statusCode;
    *((_BYTE *)v8 + 44) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_changes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addChanges:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v12 = -[NSData copyWithZone:](self->_sessionUUID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_sessionStartDate;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v14 = -[HDCodableError copyWithZone:](self->_sessionError, "copyWithZone:", a3, (_QWORD)v17);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_statusCode;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *changes;
  NSData *sessionUUID;
  char has;
  char v8;
  HDCodableError *sessionError;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  changes = self->_changes;
  if ((unint64_t)changes | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](changes, "isEqual:"))
      goto LABEL_18;
  }
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](sessionUUID, "isEqual:"))
      goto LABEL_18;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 44);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_sessionStartDate != *((double *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_18;
  }
  sessionError = self->_sessionError;
  if ((unint64_t)sessionError | *((_QWORD *)v4 + 3))
  {
    if (!-[HDCodableError isEqual:](sessionError, "isEqual:"))
    {
LABEL_18:
      v10 = 0;
      goto LABEL_19;
    }
    has = (char)self->_has;
    v8 = *((_BYTE *)v4 + 44);
  }
  v10 = (v8 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_statusCode != *((_DWORD *)v4 + 10))
      goto LABEL_18;
    v10 = 1;
  }
LABEL_19:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double sessionStartDate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;

  v3 = -[NSMutableArray hash](self->_changes, "hash");
  v4 = -[NSData hash](self->_sessionUUID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    sessionStartDate = self->_sessionStartDate;
    v7 = -sessionStartDate;
    if (sessionStartDate >= 0.0)
      v7 = self->_sessionStartDate;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = -[HDCodableError hash](self->_sessionError, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v11 = 2654435761 * self->_statusCode;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  HDCodableError *sessionError;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *((id *)v4 + 2);
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
        -[HDCodableNanoSyncChangeSet addChanges:](self, "addChanges:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 4))
    -[HDCodableNanoSyncChangeSet setSessionUUID:](self, "setSessionUUID:");
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_sessionStartDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  sessionError = self->_sessionError;
  v11 = *((_QWORD *)v4 + 3);
  if (sessionError)
  {
    if (v11)
      -[HDCodableError mergeFrom:](sessionError, "mergeFrom:");
  }
  else if (v11)
  {
    -[HDCodableNanoSyncChangeSet setSessionError:](self, "setSessionError:");
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    self->_statusCode = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (void)setChanges:(id)a3
{
  objc_storeStrong((id *)&self->_changes, a3);
}

- (NSData)sessionUUID
{
  return self->_sessionUUID;
}

- (double)sessionStartDate
{
  return self->_sessionStartDate;
}

- (HDCodableError)sessionError
{
  return self->_sessionError;
}

@end
