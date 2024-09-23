@implementation CKDPRecordResolveTokenRequest

+ (id)options
{
  if (qword_1ED700920 != -1)
    dispatch_once(&qword_1ED700920, &unk_1E7832698);
  return (id)qword_1ED700918;
}

- (BOOL)hasRoutingKey
{
  return self->_routingKey != 0;
}

- (BOOL)hasShortTokenHash
{
  return self->_shortTokenHash != 0;
}

- (void)setForceFetch:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_forceFetch = a3;
}

- (void)setHasForceFetch:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasForceFetch
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)shouldFetchRootRecord
{
  return (*(_BYTE *)&self->_has & 2) == 0 || self->_shouldFetchRootRecord;
}

- (void)setShouldFetchRootRecord:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shouldFetchRootRecord = a3;
}

- (void)setHasShouldFetchRootRecord:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldFetchRootRecord
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearRootRecordDesiredKeys
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_rootRecordDesiredKeys, a2, v2);
}

- (void)addRootRecordDesiredKeys:(id)a3
{
  const char *v4;
  NSMutableArray *rootRecordDesiredKeys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  rootRecordDesiredKeys = self->_rootRecordDesiredKeys;
  v8 = (char *)v4;
  if (!rootRecordDesiredKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_rootRecordDesiredKeys;
    self->_rootRecordDesiredKeys = v6;

    v4 = v8;
    rootRecordDesiredKeys = self->_rootRecordDesiredKeys;
  }
  objc_msgSend_addObject_(rootRecordDesiredKeys, v4, (uint64_t)v4);

}

- (unint64_t)rootRecordDesiredKeysCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_rootRecordDesiredKeys, a2, v2);
}

- (id)rootRecordDesiredKeysAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_rootRecordDesiredKeys, a2, a3);
}

+ (Class)rootRecordDesiredKeysType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasParticipantId
{
  return self->_participantId != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordResolveTokenRequest;
  -[CKDPRecordResolveTokenRequest description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  NSString *routingKey;
  NSData *shortTokenHash;
  char has;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  NSMutableArray *rootRecordDesiredKeys;
  NSString *participantId;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  routingKey = self->_routingKey;
  if (routingKey)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)routingKey, CFSTR("routingKey"));
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)shortTokenHash, CFSTR("shortTokenHash"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_forceFetch);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("forceFetch"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_shouldFetchRootRecord);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("shouldFetchRootRecord"));

  }
  rootRecordDesiredKeys = self->_rootRecordDesiredKeys;
  if (rootRecordDesiredKeys)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)rootRecordDesiredKeys, CFSTR("rootRecordDesiredKeys"));
  participantId = self->_participantId;
  if (participantId)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)participantId, CFSTR("participantId"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAA256C(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_routingKey)
    PBDataWriterWriteStringField();
  if (self->_shortTokenHash)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_rootRecordDesiredKeys;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v13, v17, 16);
    }
    while (v9);
  }

  if (self->_participantId)
    PBDataWriterWriteStringField();

}

- (unsigned)requestTypeCode
{
  return 73;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  NSString *routingKey;
  NSData *shortTokenHash;
  char has;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  NSString *participantId;
  _BYTE *v19;

  v4 = a3;
  routingKey = self->_routingKey;
  v19 = v4;
  if (routingKey)
  {
    objc_msgSend_setRoutingKey_(v4, v5, (uint64_t)routingKey);
    v4 = v19;
  }
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
  {
    objc_msgSend_setShortTokenHash_(v19, v5, (uint64_t)shortTokenHash);
    v4 = v19;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[40] = self->_forceFetch;
    v4[44] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[41] = self->_shouldFetchRootRecord;
    v4[44] |= 2u;
  }
  if (objc_msgSend_rootRecordDesiredKeysCount(self, v5, (uint64_t)shortTokenHash))
  {
    objc_msgSend_clearRootRecordDesiredKeys(v19, v9, v10);
    v13 = objc_msgSend_rootRecordDesiredKeysCount(self, v11, v12);
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend_rootRecordDesiredKeysAtIndex_(self, v9, i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addRootRecordDesiredKeys_(v19, v17, (uint64_t)v16);

      }
    }
  }
  participantId = self->_participantId;
  if (participantId)
    objc_msgSend_setParticipantId_(v19, v9, (uint64_t)participantId);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  char has;
  NSMutableArray *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_routingKey, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_shortTokenHash, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v10 + 40) = self->_forceFetch;
    *(_BYTE *)(v10 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 41) = self->_shouldFetchRootRecord;
    *(_BYTE *)(v10 + 44) |= 2u;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v18 = self->_rootRecordDesiredKeys;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v31, v35, 16);
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v18);
        v25 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v31 + 1) + 8 * i), v21, (uint64_t)a3, (_QWORD)v31);
        objc_msgSend_addRootRecordDesiredKeys_((void *)v10, v26, (uint64_t)v25);

      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v31, v35, 16);
    }
    while (v22);
  }

  v28 = objc_msgSend_copyWithZone_(self->_participantId, v27, (uint64_t)a3);
  v29 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v28;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *routingKey;
  uint64_t v9;
  NSData *shortTokenHash;
  uint64_t v11;
  NSMutableArray *rootRecordDesiredKeys;
  uint64_t v13;
  NSString *participantId;
  uint64_t v15;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_26;
  routingKey = self->_routingKey;
  v9 = v4[3];
  if ((unint64_t)routingKey | v9)
  {
    if (!objc_msgSend_isEqual_(routingKey, v7, v9))
      goto LABEL_26;
  }
  shortTokenHash = self->_shortTokenHash;
  v11 = v4[4];
  if ((unint64_t)shortTokenHash | v11)
  {
    if (!objc_msgSend_isEqual_(shortTokenHash, v7, v11))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0)
      goto LABEL_26;
    if (self->_forceFetch)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_26;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_26;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_shouldFetchRootRecord)
      {
        if (!*((_BYTE *)v4 + 41))
          goto LABEL_26;
        goto LABEL_22;
      }
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_22;
    }
LABEL_26:
    isEqual = 0;
    goto LABEL_27;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_26;
LABEL_22:
  rootRecordDesiredKeys = self->_rootRecordDesiredKeys;
  v13 = v4[2];
  if ((unint64_t)rootRecordDesiredKeys | v13
    && !objc_msgSend_isEqual_(rootRecordDesiredKeys, v7, v13))
  {
    goto LABEL_26;
  }
  participantId = self->_participantId;
  v15 = v4[1];
  if ((unint64_t)participantId | v15)
    isEqual = objc_msgSend_isEqual_(participantId, v7, v15);
  else
    isEqual = 1;
LABEL_27:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  v4 = objc_msgSend_hash(self->_routingKey, a2, v2);
  v7 = objc_msgSend_hash(self->_shortTokenHash, v5, v6);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v10 = 2654435761 * self->_forceFetch;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v11 = 2654435761 * self->_shouldFetchRootRecord;
LABEL_6:
  v12 = v7 ^ v4 ^ v10 ^ v11 ^ objc_msgSend_hash(self->_rootRecordDesiredKeys, v8, v9);
  return v12 ^ objc_msgSend_hash(self->_participantId, v13, v14);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  const char *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 3);
  if (v6)
    objc_msgSend_setRoutingKey_(self, v4, v6);
  v7 = *((_QWORD *)v5 + 4);
  if (v7)
    objc_msgSend_setShortTokenHash_(self, v4, v7);
  v8 = *((_BYTE *)v5 + 44);
  if ((v8 & 1) != 0)
  {
    self->_forceFetch = *((_BYTE *)v5 + 40);
    *(_BYTE *)&self->_has |= 1u;
    v8 = *((_BYTE *)v5 + 44);
  }
  if ((v8 & 2) != 0)
  {
    self->_shouldFetchRootRecord = *((_BYTE *)v5 + 41);
    *(_BYTE *)&self->_has |= 2u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = *((id *)v5 + 2);
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v18, v22, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend_addRootRecordDesiredKeys_(self, v12, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v18, v22, 16);
    }
    while (v13);
  }

  v17 = *((_QWORD *)v5 + 1);
  if (v17)
    objc_msgSend_setParticipantId_(self, v16, v17);

}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
  objc_storeStrong((id *)&self->_routingKey, a3);
}

- (NSData)shortTokenHash
{
  return self->_shortTokenHash;
}

- (void)setShortTokenHash:(id)a3
{
  objc_storeStrong((id *)&self->_shortTokenHash, a3);
}

- (BOOL)forceFetch
{
  return self->_forceFetch;
}

- (NSMutableArray)rootRecordDesiredKeys
{
  return self->_rootRecordDesiredKeys;
}

- (void)setRootRecordDesiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_rootRecordDesiredKeys, a3);
}

- (NSString)participantId
{
  return self->_participantId;
}

- (void)setParticipantId:(id)a3
{
  objc_storeStrong((id *)&self->_participantId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortTokenHash, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_rootRecordDesiredKeys, 0);
  objc_storeStrong((id *)&self->_participantId, 0);
}

@end
