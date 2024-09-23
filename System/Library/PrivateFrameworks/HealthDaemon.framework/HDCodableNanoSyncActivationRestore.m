@implementation HDCodableNanoSyncActivationRestore

+ (id)retreiveFromPersistentUserInfo:(id)a3
{
  return GetFromPersistentUserInfo(a3, a1);
}

+ (id)persistentUserInfoKey
{
  return CFSTR("activation");
}

- (BOOL)hasRestoreIdentifier
{
  return self->_restoreIdentifier != 0;
}

- (void)setSequenceNumber:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)statusCode
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_statusCode;
  else
    return 1;
}

- (void)setStatusCode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_statusCode = a3;
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
    return off_1E6CEADF8[a3 - 1];
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
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Abort")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasDefaultSourceBundleIdentifier
{
  return self->_defaultSourceBundleIdentifier != 0;
}

- (void)clearObliteratedHealthPairingUUIDs
{
  -[NSMutableArray removeAllObjects](self->_obliteratedHealthPairingUUIDs, "removeAllObjects");
}

- (void)addObliteratedHealthPairingUUIDs:(id)a3
{
  id v4;
  NSMutableArray *obliteratedHealthPairingUUIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  obliteratedHealthPairingUUIDs = self->_obliteratedHealthPairingUUIDs;
  v8 = v4;
  if (!obliteratedHealthPairingUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_obliteratedHealthPairingUUIDs;
    self->_obliteratedHealthPairingUUIDs = v6;

    v4 = v8;
    obliteratedHealthPairingUUIDs = self->_obliteratedHealthPairingUUIDs;
  }
  -[NSMutableArray addObject:](obliteratedHealthPairingUUIDs, "addObject:", v4);

}

- (unint64_t)obliteratedHealthPairingUUIDsCount
{
  return -[NSMutableArray count](self->_obliteratedHealthPairingUUIDs, "count");
}

- (id)obliteratedHealthPairingUUIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_obliteratedHealthPairingUUIDs, "objectAtIndex:", a3);
}

+ (Class)obliteratedHealthPairingUUIDsType
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
  v8.super_class = (Class)HDCodableNanoSyncActivationRestore;
  -[HDCodableNanoSyncActivationRestore description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNanoSyncActivationRestore dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *restoreIdentifier;
  char has;
  void *v7;
  unsigned int v8;
  __CFString *v9;
  NSString *defaultSourceBundleIdentifier;
  NSMutableArray *obliteratedHealthPairingUUIDs;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  restoreIdentifier = self->_restoreIdentifier;
  if (restoreIdentifier)
    objc_msgSend(v3, "setObject:forKey:", restoreIdentifier, CFSTR("restoreIdentifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sequenceNumber);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("sequenceNumber"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = self->_statusCode - 1;
    if (v8 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_statusCode);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E6CEADF8[v8];
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("statusCode"));

  }
  defaultSourceBundleIdentifier = self->_defaultSourceBundleIdentifier;
  if (defaultSourceBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", defaultSourceBundleIdentifier, CFSTR("defaultSourceBundleIdentifier"));
  obliteratedHealthPairingUUIDs = self->_obliteratedHealthPairingUUIDs;
  if (obliteratedHealthPairingUUIDs)
    objc_msgSend(v4, "setObject:forKey:", obliteratedHealthPairingUUIDs, CFSTR("obliteratedHealthPairingUUIDs"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNanoSyncActivationRestoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_restoreIdentifier)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_defaultSourceBundleIdentifier)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_obliteratedHealthPairingUUIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteDataField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_restoreIdentifier)
  {
    objc_msgSend(v4, "setRestoreIdentifier:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_sequenceNumber;
    *((_BYTE *)v4 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_statusCode;
    *((_BYTE *)v4 + 44) |= 2u;
  }
  if (self->_defaultSourceBundleIdentifier)
    objc_msgSend(v10, "setDefaultSourceBundleIdentifier:");
  if (-[HDCodableNanoSyncActivationRestore obliteratedHealthPairingUUIDsCount](self, "obliteratedHealthPairingUUIDsCount"))
  {
    objc_msgSend(v10, "clearObliteratedHealthPairingUUIDs");
    v6 = -[HDCodableNanoSyncActivationRestore obliteratedHealthPairingUUIDsCount](self, "obliteratedHealthPairingUUIDsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[HDCodableNanoSyncActivationRestore obliteratedHealthPairingUUIDsAtIndex:](self, "obliteratedHealthPairingUUIDsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObliteratedHealthPairingUUIDs:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_restoreIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_sequenceNumber;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_statusCode;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_defaultSourceBundleIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_obliteratedHealthPairingUUIDs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addObliteratedHealthPairingUUIDs:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *restoreIdentifier;
  NSString *defaultSourceBundleIdentifier;
  NSMutableArray *obliteratedHealthPairingUUIDs;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  restoreIdentifier = self->_restoreIdentifier;
  if ((unint64_t)restoreIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](restoreIdentifier, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_sequenceNumber != *((_QWORD *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_statusCode != *((_DWORD *)v4 + 10))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_18;
  }
  defaultSourceBundleIdentifier = self->_defaultSourceBundleIdentifier;
  if ((unint64_t)defaultSourceBundleIdentifier | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](defaultSourceBundleIdentifier, "isEqual:"))
  {
    goto LABEL_18;
  }
  obliteratedHealthPairingUUIDs = self->_obliteratedHealthPairingUUIDs;
  if ((unint64_t)obliteratedHealthPairingUUIDs | *((_QWORD *)v4 + 3))
    v8 = -[NSMutableArray isEqual:](obliteratedHealthPairingUUIDs, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSData hash](self->_restoreIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_sequenceNumber;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_statusCode;
LABEL_6:
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_defaultSourceBundleIdentifier, "hash");
  return v6 ^ -[NSMutableArray hash](self->_obliteratedHealthPairingUUIDs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[HDCodableNanoSyncActivationRestore setRestoreIdentifier:](self, "setRestoreIdentifier:");
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
  {
    self->_sequenceNumber = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_statusCode = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
    -[HDCodableNanoSyncActivationRestore setDefaultSourceBundleIdentifier:](self, "setDefaultSourceBundleIdentifier:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[HDCodableNanoSyncActivationRestore addObliteratedHealthPairingUUIDs:](self, "addObliteratedHealthPairingUUIDs:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSData)restoreIdentifier
{
  return self->_restoreIdentifier;
}

- (void)setRestoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_restoreIdentifier, a3);
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSString)defaultSourceBundleIdentifier
{
  return self->_defaultSourceBundleIdentifier;
}

- (void)setDefaultSourceBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSourceBundleIdentifier, a3);
}

- (NSMutableArray)obliteratedHealthPairingUUIDs
{
  return self->_obliteratedHealthPairingUUIDs;
}

- (void)setObliteratedHealthPairingUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_obliteratedHealthPairingUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreIdentifier, 0);
  objc_storeStrong((id *)&self->_obliteratedHealthPairingUUIDs, 0);
  objc_storeStrong((id *)&self->_defaultSourceBundleIdentifier, 0);
}

+ (id)activationRestoreWithRestoreUUID:(id)a3 sequenceNumber:(int64_t)a4 statusCode:(int)a5
{
  uint64_t v5;
  id v7;
  HDCodableNanoSyncActivationRestore *v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v7 = a3;
  v8 = objc_alloc_init(HDCodableNanoSyncActivationRestore);
  objc_msgSend(v7, "hk_dataForUUIDBytes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCodableNanoSyncActivationRestore setRestoreIdentifier:](v8, "setRestoreIdentifier:", v9);
  -[HDCodableNanoSyncActivationRestore setSequenceNumber:](v8, "setSequenceNumber:", a4);
  -[HDCodableNanoSyncActivationRestore setStatusCode:](v8, "setStatusCode:", v5);
  return v8;
}

- (BOOL)hasRequiredFields
{
  return -[HDCodableNanoSyncActivationRestore hasRestoreIdentifier](self, "hasRestoreIdentifier")
      && -[HDCodableNanoSyncActivationRestore hasSequenceNumber](self, "hasSequenceNumber")
      && -[HDCodableNanoSyncActivationRestore hasStatusCode](self, "hasStatusCode");
}

- (id)decodedRestoreUUID
{
  void *v2;

  if (self->_restoreIdentifier)
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

- (void)encodeObliteratedHealthPairingUUIDs:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDCodableNanoSyncActivationRestore clearObliteratedHealthPairingUUIDs](self, "clearObliteratedHealthPairingUUIDs");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "hk_dataForUUIDBytes", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableNanoSyncActivationRestore addObliteratedHealthPairingUUIDs:](self, "addObliteratedHealthPairingUUIDs:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)decodedObliteratedHealthPairingUUIDs
{
  return (id)-[NSMutableArray hk_map:](self->_obliteratedHealthPairingUUIDs, "hk_map:", &__block_literal_global_124);
}

uint64_t __91__HDCodableNanoSyncActivationRestore_NanoSyncSupport__decodedObliteratedHealthPairingUUIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", a2);
}

- (id)nanoSyncDescription
{
  void *v3;
  void *v4;
  void *v5;
  char has;
  __CFString *v7;
  unsigned int v8;
  __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDCodableNanoSyncActivationRestore decodedRestoreUUID](self, "decodedRestoreUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    v7 = CFSTR("(null)");
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(v3, "stringWithFormat:", CFSTR("restore-id:%@ seq:%@ status:%@"), v5, v7, CFSTR("(null)"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sequenceNumber);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v8 = self->_statusCode - 1;
  if (v8 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_statusCode);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E6CFB960[v8];
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("restore-id:%@ seq:%@ status:%@"), v5, v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((has & 1) != 0)
LABEL_10:

LABEL_11:
  return v10;
}

- (void)addToPersistentUserInfo:(id)a3
{
  SetInPersistentUserInfo(a3, self);
}

- (id)copyForPersistentUserInfo
{
  HDCodableNanoSyncActivationRestore *v3;
  char has;

  v3 = objc_alloc_init(HDCodableNanoSyncActivationRestore);
  -[HDCodableNanoSyncActivationRestore setRestoreIdentifier:](v3, "setRestoreIdentifier:", self->_restoreIdentifier);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    -[HDCodableNanoSyncActivationRestore setSequenceNumber:](v3, "setSequenceNumber:", self->_sequenceNumber);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    -[HDCodableNanoSyncActivationRestore setStatusCode:](v3, "setStatusCode:", self->_statusCode);
  return v3;
}

@end
