@implementation HDCodableNanoSyncMessage

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setPersistentPairingUUID:(id)a3
{
  objc_storeStrong((id *)&self->_persistentPairingUUID, a3);
}

- (void)setHealthPairingUUID:(id)a3
{
  objc_storeStrong((id *)&self->_healthPairingUUID, a3);
}

- (void)setChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->_changeSet, a3);
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_persistentPairingUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_healthPairingUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_changeSet)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_status)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_activationRestore)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_entityVersionMap)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_currentSyncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyPersistentUserInfo
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[HDCodableNanoSyncActivationRestore addToPersistentUserInfo:](self->_activationRestore, "addToPersistentUserInfo:", v3);
  -[HDCodableNanoSyncStatus addToPersistentUserInfo:](self->_status, "addToPersistentUserInfo:", v3);
  -[HDCodableNanoSyncChangeSet addToPersistentUserInfo:](self->_changeSet, "addToPersistentUserInfo:", v3);
  return v3;
}

+ (id)messageFromPersistentUserInfo:(id)a3
{
  id v3;
  HDCodableNanoSyncMessage *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(HDCodableNanoSyncMessage);
  +[HDCodableNanoSyncActivationRestore retreiveFromPersistentUserInfo:](HDCodableNanoSyncActivationRestore, "retreiveFromPersistentUserInfo:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNanoSyncMessage setActivationRestore:](v4, "setActivationRestore:", v5);

  +[HDCodableNanoSyncChangeSet retreiveFromPersistentUserInfo:](HDCodableNanoSyncChangeSet, "retreiveFromPersistentUserInfo:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNanoSyncMessage setChangeSet:](v4, "setChangeSet:", v6);

  +[HDCodableNanoSyncStatus retreiveFromPersistentUserInfo:](HDCodableNanoSyncStatus, "retreiveFromPersistentUserInfo:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCodableNanoSyncMessage setStatus:](v4, "setStatus:", v7);
  return v4;
}

- (void)setActivationRestore:(id)a3
{
  objc_storeStrong((id *)&self->_activationRestore, a3);
}

- (id)nanoSyncDescription
{
  id v3;
  id v4;
  void (**v5)(void *, HDCodableNanoSyncActivationRestore *);
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HDCodableNanoSyncMessage_NanoSyncSupport__nanoSyncDescription__block_invoke;
  aBlock[3] = &unk_1E6CFB920;
  v9 = v3;
  v4 = v3;
  v5 = (void (**)(void *, HDCodableNanoSyncActivationRestore *))_Block_copy(aBlock);
  v5[2](v5, self->_activationRestore);
  v5[2](v5, (HDCodableNanoSyncActivationRestore *)self->_changeSet);
  v5[2](v5, (HDCodableNanoSyncActivationRestore *)self->_status);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __64__HDCodableNanoSyncMessage_NanoSyncSupport__nanoSyncDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a2, "nanoSyncDescription");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@>"), v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_persistentPairingUUID, 0);
  objc_storeStrong((id *)&self->_healthPairingUUID, 0);
  objc_storeStrong((id *)&self->_entityVersionMap, 0);
  objc_storeStrong((id *)&self->_currentSyncIdentity, 0);
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_activationRestore, 0);
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNanoSyncMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (HDCodableNanoSyncStatus)status
{
  return self->_status;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)version
{
  return self->_version;
}

- (id)decodedPersistentPairingUUID
{
  void *v2;

  if (self->_persistentPairingUUID)
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

- (id)decodedHealthPairingUUID
{
  void *v2;

  if (self->_healthPairingUUID)
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

- (HDCodableNanoSyncChangeSet)changeSet
{
  return self->_changeSet;
}

+ (id)messageWithSyncStore:(id)a3 profile:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setVersion:", objc_msgSend(v7, "protocolVersion"));
  objc_msgSend(v7, "persistentUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_dataForUUIDBytes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPersistentPairingUUID:", v10);

  objc_msgSend(v7, "healthUUID");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "hk_dataForUUIDBytes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHealthPairingUUID:", v12);

  LOBYTE(v11) = objc_msgSend(v7, "isMaster");
  if ((v11 & 1) == 0)
  {
    objc_msgSend(v6, "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "behavior");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "tinkerModeEnabled");

    if ((v15 & 1) == 0)
    {
      objc_msgSend(v6, "syncIdentityManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentSyncIdentity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "codableSyncIdentity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCurrentSyncIdentity:", v19);

    }
  }

  return v8;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPersistentPairingUUID
{
  return self->_persistentPairingUUID != 0;
}

- (BOOL)hasHealthPairingUUID
{
  return self->_healthPairingUUID != 0;
}

- (BOOL)hasChangeSet
{
  return self->_changeSet != 0;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (BOOL)hasActivationRestore
{
  return self->_activationRestore != 0;
}

- (BOOL)hasEntityVersionMap
{
  return self->_entityVersionMap != 0;
}

- (BOOL)hasCurrentSyncIdentity
{
  return self->_currentSyncIdentity != 0;
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
  v8.super_class = (Class)HDCodableNanoSyncMessage;
  -[HDCodableNanoSyncMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNanoSyncMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *persistentPairingUUID;
  NSData *healthPairingUUID;
  HDCodableNanoSyncChangeSet *changeSet;
  void *v8;
  HDCodableNanoSyncStatus *status;
  void *v10;
  HDCodableNanoSyncActivationRestore *activationRestore;
  void *v12;
  HDCodableSyncEntityVersionMap *entityVersionMap;
  void *v14;
  HDCodableSyncIdentity *currentSyncIdentity;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_version);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  persistentPairingUUID = self->_persistentPairingUUID;
  if (persistentPairingUUID)
    objc_msgSend(v3, "setObject:forKey:", persistentPairingUUID, CFSTR("persistentPairingUUID"));
  healthPairingUUID = self->_healthPairingUUID;
  if (healthPairingUUID)
    objc_msgSend(v3, "setObject:forKey:", healthPairingUUID, CFSTR("healthPairingUUID"));
  changeSet = self->_changeSet;
  if (changeSet)
  {
    -[HDCodableNanoSyncChangeSet dictionaryRepresentation](changeSet, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("changeSet"));

  }
  status = self->_status;
  if (status)
  {
    -[HDCodableNanoSyncStatus dictionaryRepresentation](status, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("status"));

  }
  activationRestore = self->_activationRestore;
  if (activationRestore)
  {
    -[HDCodableNanoSyncActivationRestore dictionaryRepresentation](activationRestore, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("activationRestore"));

  }
  entityVersionMap = self->_entityVersionMap;
  if (entityVersionMap)
  {
    -[HDCodableSyncEntityVersionMap dictionaryRepresentation](entityVersionMap, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("entityVersionMap"));

  }
  currentSyncIdentity = self->_currentSyncIdentity;
  if (currentSyncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](currentSyncIdentity, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("currentSyncIdentity"));

  }
  return v3;
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_version;
    *((_BYTE *)v4 + 68) |= 1u;
  }
  v5 = v4;
  if (self->_persistentPairingUUID)
  {
    objc_msgSend(v4, "setPersistentPairingUUID:");
    v4 = v5;
  }
  if (self->_healthPairingUUID)
  {
    objc_msgSend(v5, "setHealthPairingUUID:");
    v4 = v5;
  }
  if (self->_changeSet)
  {
    objc_msgSend(v5, "setChangeSet:");
    v4 = v5;
  }
  if (self->_status)
  {
    objc_msgSend(v5, "setStatus:");
    v4 = v5;
  }
  if (self->_activationRestore)
  {
    objc_msgSend(v5, "setActivationRestore:");
    v4 = v5;
  }
  if (self->_entityVersionMap)
  {
    objc_msgSend(v5, "setEntityVersionMap:");
    v4 = v5;
  }
  if (self->_currentSyncIdentity)
  {
    objc_msgSend(v5, "setCurrentSyncIdentity:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_version;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_persistentPairingUUID, "copyWithZone:", a3);
  v8 = (void *)v6[6];
  v6[6] = v7;

  v9 = -[NSData copyWithZone:](self->_healthPairingUUID, "copyWithZone:", a3);
  v10 = (void *)v6[5];
  v6[5] = v9;

  v11 = -[HDCodableNanoSyncChangeSet copyWithZone:](self->_changeSet, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  v13 = -[HDCodableNanoSyncStatus copyWithZone:](self->_status, "copyWithZone:", a3);
  v14 = (void *)v6[7];
  v6[7] = v13;

  v15 = -[HDCodableNanoSyncActivationRestore copyWithZone:](self->_activationRestore, "copyWithZone:", a3);
  v16 = (void *)v6[1];
  v6[1] = v15;

  v17 = -[HDCodableSyncEntityVersionMap copyWithZone:](self->_entityVersionMap, "copyWithZone:", a3);
  v18 = (void *)v6[4];
  v6[4] = v17;

  v19 = -[HDCodableSyncIdentity copyWithZone:](self->_currentSyncIdentity, "copyWithZone:", a3);
  v20 = (void *)v6[3];
  v6[3] = v19;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *persistentPairingUUID;
  NSData *healthPairingUUID;
  HDCodableNanoSyncChangeSet *changeSet;
  HDCodableNanoSyncStatus *status;
  HDCodableNanoSyncActivationRestore *activationRestore;
  HDCodableSyncEntityVersionMap *entityVersionMap;
  HDCodableSyncIdentity *currentSyncIdentity;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_version != *((_DWORD *)v4 + 16))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  persistentPairingUUID = self->_persistentPairingUUID;
  if ((unint64_t)persistentPairingUUID | *((_QWORD *)v4 + 6)
    && !-[NSData isEqual:](persistentPairingUUID, "isEqual:"))
  {
    goto LABEL_21;
  }
  healthPairingUUID = self->_healthPairingUUID;
  if ((unint64_t)healthPairingUUID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](healthPairingUUID, "isEqual:"))
      goto LABEL_21;
  }
  changeSet = self->_changeSet;
  if ((unint64_t)changeSet | *((_QWORD *)v4 + 2))
  {
    if (!-[HDCodableNanoSyncChangeSet isEqual:](changeSet, "isEqual:"))
      goto LABEL_21;
  }
  status = self->_status;
  if ((unint64_t)status | *((_QWORD *)v4 + 7))
  {
    if (!-[HDCodableNanoSyncStatus isEqual:](status, "isEqual:"))
      goto LABEL_21;
  }
  activationRestore = self->_activationRestore;
  if ((unint64_t)activationRestore | *((_QWORD *)v4 + 1))
  {
    if (!-[HDCodableNanoSyncActivationRestore isEqual:](activationRestore, "isEqual:"))
      goto LABEL_21;
  }
  entityVersionMap = self->_entityVersionMap;
  if ((unint64_t)entityVersionMap | *((_QWORD *)v4 + 4))
  {
    if (!-[HDCodableSyncEntityVersionMap isEqual:](entityVersionMap, "isEqual:"))
      goto LABEL_21;
  }
  currentSyncIdentity = self->_currentSyncIdentity;
  if ((unint64_t)currentSyncIdentity | *((_QWORD *)v4 + 3))
    v12 = -[HDCodableSyncIdentity isEqual:](currentSyncIdentity, "isEqual:");
  else
    v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_persistentPairingUUID, "hash") ^ v3;
  v5 = -[NSData hash](self->_healthPairingUUID, "hash");
  v6 = v4 ^ v5 ^ -[HDCodableNanoSyncChangeSet hash](self->_changeSet, "hash");
  v7 = -[HDCodableNanoSyncStatus hash](self->_status, "hash");
  v8 = v7 ^ -[HDCodableNanoSyncActivationRestore hash](self->_activationRestore, "hash");
  v9 = v6 ^ v8 ^ -[HDCodableSyncEntityVersionMap hash](self->_entityVersionMap, "hash");
  return v9 ^ -[HDCodableSyncIdentity hash](self->_currentSyncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  HDCodableNanoSyncChangeSet *changeSet;
  uint64_t v7;
  HDCodableNanoSyncStatus *status;
  uint64_t v9;
  HDCodableNanoSyncActivationRestore *activationRestore;
  uint64_t v11;
  HDCodableSyncEntityVersionMap *entityVersionMap;
  uint64_t v13;
  HDCodableSyncIdentity *currentSyncIdentity;
  uint64_t v15;
  _QWORD *v16;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
  }
  v16 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCodableNanoSyncMessage setPersistentPairingUUID:](self, "setPersistentPairingUUID:");
    v5 = v16;
  }
  if (v5[5])
  {
    -[HDCodableNanoSyncMessage setHealthPairingUUID:](self, "setHealthPairingUUID:");
    v5 = v16;
  }
  changeSet = self->_changeSet;
  v7 = v5[2];
  if (changeSet)
  {
    if (!v7)
      goto LABEL_13;
    -[HDCodableNanoSyncChangeSet mergeFrom:](changeSet, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[HDCodableNanoSyncMessage setChangeSet:](self, "setChangeSet:");
  }
  v5 = v16;
LABEL_13:
  status = self->_status;
  v9 = v5[7];
  if (status)
  {
    if (!v9)
      goto LABEL_19;
    -[HDCodableNanoSyncStatus mergeFrom:](status, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_19;
    -[HDCodableNanoSyncMessage setStatus:](self, "setStatus:");
  }
  v5 = v16;
LABEL_19:
  activationRestore = self->_activationRestore;
  v11 = v5[1];
  if (activationRestore)
  {
    if (!v11)
      goto LABEL_25;
    -[HDCodableNanoSyncActivationRestore mergeFrom:](activationRestore, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_25;
    -[HDCodableNanoSyncMessage setActivationRestore:](self, "setActivationRestore:");
  }
  v5 = v16;
LABEL_25:
  entityVersionMap = self->_entityVersionMap;
  v13 = v5[4];
  if (entityVersionMap)
  {
    if (!v13)
      goto LABEL_31;
    -[HDCodableSyncEntityVersionMap mergeFrom:](entityVersionMap, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_31;
    -[HDCodableNanoSyncMessage setEntityVersionMap:](self, "setEntityVersionMap:");
  }
  v5 = v16;
LABEL_31:
  currentSyncIdentity = self->_currentSyncIdentity;
  v15 = v5[3];
  if (currentSyncIdentity)
  {
    if (v15)
    {
      -[HDCodableSyncIdentity mergeFrom:](currentSyncIdentity, "mergeFrom:");
LABEL_36:
      v5 = v16;
    }
  }
  else if (v15)
  {
    -[HDCodableNanoSyncMessage setCurrentSyncIdentity:](self, "setCurrentSyncIdentity:");
    goto LABEL_36;
  }

}

- (NSData)persistentPairingUUID
{
  return self->_persistentPairingUUID;
}

- (NSData)healthPairingUUID
{
  return self->_healthPairingUUID;
}

- (HDCodableNanoSyncActivationRestore)activationRestore
{
  return self->_activationRestore;
}

- (HDCodableSyncEntityVersionMap)entityVersionMap
{
  return self->_entityVersionMap;
}

- (void)setEntityVersionMap:(id)a3
{
  objc_storeStrong((id *)&self->_entityVersionMap, a3);
}

- (HDCodableSyncIdentity)currentSyncIdentity
{
  return self->_currentSyncIdentity;
}

- (void)setCurrentSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_currentSyncIdentity, a3);
}

@end
