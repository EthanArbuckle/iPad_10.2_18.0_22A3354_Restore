@implementation CKDPRecordOneTimeStableUrl

- (BOOL)hasShortTokenHash
{
  return self->_shortTokenHash != 0;
}

- (BOOL)hasProtectedFullToken
{
  return self->_protectedFullToken != 0;
}

- (BOOL)hasEncryptedFullTokenInfo
{
  return self->_encryptedFullTokenInfo != 0;
}

- (void)clearParticipantIds
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_participantIds, a2, v2);
}

- (void)addParticipantId:(id)a3
{
  const char *v4;
  NSMutableArray *participantIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  participantIds = self->_participantIds;
  v8 = (char *)v4;
  if (!participantIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_participantIds;
    self->_participantIds = v6;

    v4 = v8;
    participantIds = self->_participantIds;
  }
  objc_msgSend_addObject_(participantIds, v4, (uint64_t)v4);

}

- (unint64_t)participantIdsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_participantIds, a2, v2);
}

- (id)participantIdAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_participantIds, a2, a3);
}

+ (Class)participantIdType
{
  return (Class)objc_opt_class();
}

- (void)setCreatedTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_createdTime = a3;
}

- (void)setHasCreatedTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreatedTime
{
  return *(_BYTE *)&self->_has & 1;
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
  v11.super_class = (Class)CKDPRecordOneTimeStableUrl;
  -[CKDPRecordOneTimeStableUrl description](&v11, sel_description);
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
  NSData *shortTokenHash;
  NSData *protectedFullToken;
  NSData *encryptedFullTokenInfo;
  NSMutableArray *participantIds;
  void *v11;
  const char *v12;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)shortTokenHash, CFSTR("shortTokenHash"));
  protectedFullToken = self->_protectedFullToken;
  if (protectedFullToken)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)protectedFullToken, CFSTR("protectedFullToken"));
  encryptedFullTokenInfo = self->_encryptedFullTokenInfo;
  if (encryptedFullTokenInfo)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)encryptedFullTokenInfo, CFSTR("encryptedFullTokenInfo"));
  participantIds = self->_participantIds;
  if (participantIds)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)participantIds, CFSTR("participantId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v5, (uint64_t)participantIds, self->_createdTime);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("createdTime"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordOneTimeStableUrlReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_shortTokenHash)
    PBDataWriterWriteDataField();
  if (self->_protectedFullToken)
    PBDataWriterWriteDataField();
  if (self->_encryptedFullTokenInfo)
    PBDataWriterWriteDataField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_participantIds;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  NSData *shortTokenHash;
  NSData *protectedFullToken;
  NSData *encryptedFullTokenInfo;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  id v18;

  v18 = a3;
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
    objc_msgSend_setShortTokenHash_(v18, v4, (uint64_t)shortTokenHash);
  protectedFullToken = self->_protectedFullToken;
  if (protectedFullToken)
    objc_msgSend_setProtectedFullToken_(v18, v4, (uint64_t)protectedFullToken);
  encryptedFullTokenInfo = self->_encryptedFullTokenInfo;
  if (encryptedFullTokenInfo)
    objc_msgSend_setEncryptedFullTokenInfo_(v18, v4, (uint64_t)encryptedFullTokenInfo);
  if (objc_msgSend_participantIdsCount(self, v4, (uint64_t)encryptedFullTokenInfo))
  {
    objc_msgSend_clearParticipantIds(v18, v8, v9);
    v12 = objc_msgSend_participantIdsCount(self, v10, v11);
    if (v12)
    {
      v14 = v12;
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend_participantIdAtIndex_(self, v13, i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addParticipantId_(v18, v17, (uint64_t)v16);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v18 + 1) = *(_QWORD *)&self->_createdTime;
    *((_BYTE *)v18 + 48) |= 1u;
  }

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
  const char *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_shortTokenHash, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_protectedFullToken, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_encryptedFullTokenInfo, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v18;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = self->_participantIds;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v30, v34, 16);
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v31;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v20);
        v27 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v30 + 1) + 8 * v26), v23, (uint64_t)a3, (_QWORD)v30);
        objc_msgSend_addParticipantId_((void *)v10, v28, (uint64_t)v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v30, v34, 16);
    }
    while (v24);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v10 + 8) = self->_createdTime;
    *(_BYTE *)(v10 + 48) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSData *shortTokenHash;
  uint64_t v9;
  NSData *protectedFullToken;
  uint64_t v11;
  NSData *encryptedFullTokenInfo;
  uint64_t v13;
  NSMutableArray *participantIds;
  uint64_t v15;
  BOOL v16;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_14;
  shortTokenHash = self->_shortTokenHash;
  v9 = v4[5];
  if ((unint64_t)shortTokenHash | v9)
  {
    if (!objc_msgSend_isEqual_(shortTokenHash, v7, v9))
      goto LABEL_14;
  }
  protectedFullToken = self->_protectedFullToken;
  v11 = v4[4];
  if ((unint64_t)protectedFullToken | v11)
  {
    if (!objc_msgSend_isEqual_(protectedFullToken, v7, v11))
      goto LABEL_14;
  }
  encryptedFullTokenInfo = self->_encryptedFullTokenInfo;
  v13 = v4[2];
  if ((unint64_t)encryptedFullTokenInfo | v13)
  {
    if (!objc_msgSend_isEqual_(encryptedFullTokenInfo, v7, v13))
      goto LABEL_14;
  }
  participantIds = self->_participantIds;
  v15 = v4[3];
  if ((unint64_t)participantIds | v15)
  {
    if (!objc_msgSend_isEqual_(participantIds, v7, v15))
      goto LABEL_14;
  }
  v16 = (v4[6] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[6] & 1) != 0 && self->_createdTime == *((double *)v4 + 1))
    {
      v16 = 1;
      goto LABEL_15;
    }
LABEL_14:
    v16 = 0;
  }
LABEL_15:

  return v16;
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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double createdTime;
  double v16;
  long double v17;
  double v18;

  v4 = objc_msgSend_hash(self->_shortTokenHash, a2, v2);
  v7 = objc_msgSend_hash(self->_protectedFullToken, v5, v6);
  v10 = objc_msgSend_hash(self->_encryptedFullTokenInfo, v8, v9);
  v13 = objc_msgSend_hash(self->_participantIds, v11, v12);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    createdTime = self->_createdTime;
    v16 = -createdTime;
    if (createdTime >= 0.0)
      v16 = self->_createdTime;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  return v7 ^ v4 ^ v10 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 5);
  if (v6)
    objc_msgSend_setShortTokenHash_(self, v4, v6);
  v7 = *((_QWORD *)v5 + 4);
  if (v7)
    objc_msgSend_setProtectedFullToken_(self, v4, v7);
  v8 = *((_QWORD *)v5 + 2);
  if (v8)
    objc_msgSend_setEncryptedFullTokenInfo_(self, v4, v8);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = *((id *)v5 + 3);
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v16, v20, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend_addParticipantId_(self, v12, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v16, v20, 16);
    }
    while (v13);
  }

  if ((*((_BYTE *)v5 + 48) & 1) != 0)
  {
    self->_createdTime = *((double *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)shortTokenHash
{
  return self->_shortTokenHash;
}

- (void)setShortTokenHash:(id)a3
{
  objc_storeStrong((id *)&self->_shortTokenHash, a3);
}

- (NSData)protectedFullToken
{
  return self->_protectedFullToken;
}

- (void)setProtectedFullToken:(id)a3
{
  objc_storeStrong((id *)&self->_protectedFullToken, a3);
}

- (NSData)encryptedFullTokenInfo
{
  return self->_encryptedFullTokenInfo;
}

- (void)setEncryptedFullTokenInfo:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedFullTokenInfo, a3);
}

- (NSMutableArray)participantIds
{
  return self->_participantIds;
}

- (void)setParticipantIds:(id)a3
{
  objc_storeStrong((id *)&self->_participantIds, a3);
}

- (double)createdTime
{
  return self->_createdTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortTokenHash, 0);
  objc_storeStrong((id *)&self->_protectedFullToken, 0);
  objc_storeStrong((id *)&self->_participantIds, 0);
  objc_storeStrong((id *)&self->_encryptedFullTokenInfo, 0);
}

@end
