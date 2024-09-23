@implementation CKDPShareAcceptRequest

+ (id)options
{
  if (qword_1ED7009C0 != -1)
    dispatch_once(&qword_1ED7009C0, &unk_1E7833858);
  return (id)qword_1ED7009B8;
}

- (BOOL)hasShareId
{
  return self->_shareId != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasSelfAddedPcs
{
  return self->_selfAddedPcs != 0;
}

- (BOOL)hasPublicKey
{
  return self->_publicKey != 0;
}

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (BOOL)hasParticipantId
{
  return self->_participantId != 0;
}

- (int)publicKeyVersion
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_publicKeyVersion;
  else
    return 1;
}

- (void)setPublicKeyVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_publicKeyVersion = a3;
}

- (void)setHasPublicKeyVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPublicKeyVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setAcceptedInProcess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_acceptedInProcess = a3;
}

- (void)setHasAcceptedInProcess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAcceptedInProcess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v11.super_class = (Class)CKDPShareAcceptRequest;
  -[CKDPShareAcceptRequest description](&v11, sel_description);
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
  const char *v4;
  uint64_t v5;
  void *v6;
  CKDPShareIdentifier *shareId;
  void *v8;
  const char *v9;
  NSString *etag;
  CKDPProtectionInfo *selfAddedPcs;
  void *v12;
  const char *v13;
  CKDPProtectionInfo *publicKey;
  void *v15;
  const char *v16;
  CKDPProtectionInfo *protectionInfo;
  void *v18;
  const char *v19;
  NSString *participantId;
  char has;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  shareId = self->_shareId;
  if (shareId)
  {
    objc_msgSend_dictionaryRepresentation(shareId, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("shareId"));

  }
  etag = self->_etag;
  if (etag)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)etag, CFSTR("etag"));
  selfAddedPcs = self->_selfAddedPcs;
  if (selfAddedPcs)
  {
    objc_msgSend_dictionaryRepresentation(selfAddedPcs, v4, (uint64_t)etag);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("selfAddedPcs"));

  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    objc_msgSend_dictionaryRepresentation(publicKey, v4, (uint64_t)etag);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, CFSTR("publicKey"));

  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_dictionaryRepresentation(protectionInfo, v4, (uint64_t)etag);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, CFSTR("protectionInfo"));

  }
  participantId = self->_participantId;
  if (participantId)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)participantId, CFSTR("participantId"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_publicKeyVersion);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v23, (uint64_t)v22, CFSTR("publicKeyVersion"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_acceptedInProcess);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v24, CFSTR("acceptedInProcess"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB0BF5C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_shareId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_selfAddedPcs)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_publicKey)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_protectionInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_participantId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (unsigned)requestTypeCode
{
  return 56;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPShareIdentifier *shareId;
  NSString *etag;
  CKDPProtectionInfo *selfAddedPcs;
  CKDPProtectionInfo *publicKey;
  CKDPProtectionInfo *protectionInfo;
  NSString *participantId;
  char has;
  id v13;

  v4 = a3;
  shareId = self->_shareId;
  v13 = v4;
  if (shareId)
  {
    objc_msgSend_setShareId_(v4, v5, (uint64_t)shareId);
    v4 = v13;
  }
  etag = self->_etag;
  if (etag)
  {
    objc_msgSend_setEtag_(v13, v5, (uint64_t)etag);
    v4 = v13;
  }
  selfAddedPcs = self->_selfAddedPcs;
  if (selfAddedPcs)
  {
    objc_msgSend_setSelfAddedPcs_(v13, v5, (uint64_t)selfAddedPcs);
    v4 = v13;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    objc_msgSend_setPublicKey_(v13, v5, (uint64_t)publicKey);
    v4 = v13;
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_setProtectionInfo_(v13, v5, (uint64_t)protectionInfo);
    v4 = v13;
  }
  participantId = self->_participantId;
  if (participantId)
  {
    objc_msgSend_setParticipantId_(v13, v5, (uint64_t)participantId);
    v4 = v13;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_publicKeyVersion;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 64) = self->_acceptedInProcess;
    *((_BYTE *)v4 + 68) |= 2u;
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
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  char has;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_shareId, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_etag, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_selfAddedPcs, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v18;

  v21 = objc_msgSend_copyWithZone_(self->_publicKey, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v21;

  v24 = objc_msgSend_copyWithZone_(self->_protectionInfo, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v24;

  v27 = objc_msgSend_copyWithZone_(self->_participantId, v26, (uint64_t)a3);
  v28 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v27;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v10 + 40) = self->_publicKeyVersion;
    *(_BYTE *)(v10 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 64) = self->_acceptedInProcess;
    *(_BYTE *)(v10 + 68) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPShareIdentifier *shareId;
  uint64_t v9;
  NSString *etag;
  uint64_t v11;
  CKDPProtectionInfo *selfAddedPcs;
  uint64_t v13;
  CKDPProtectionInfo *publicKey;
  uint64_t v15;
  CKDPProtectionInfo *protectionInfo;
  uint64_t v17;
  NSString *participantId;
  uint64_t v19;
  BOOL v20;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_21;
  shareId = self->_shareId;
  v9 = v4[7];
  if ((unint64_t)shareId | v9)
  {
    if (!objc_msgSend_isEqual_(shareId, v7, v9))
      goto LABEL_21;
  }
  etag = self->_etag;
  v11 = v4[1];
  if ((unint64_t)etag | v11)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v11))
      goto LABEL_21;
  }
  selfAddedPcs = self->_selfAddedPcs;
  v13 = v4[6];
  if ((unint64_t)selfAddedPcs | v13)
  {
    if (!objc_msgSend_isEqual_(selfAddedPcs, v7, v13))
      goto LABEL_21;
  }
  publicKey = self->_publicKey;
  v15 = v4[4];
  if ((unint64_t)publicKey | v15)
  {
    if (!objc_msgSend_isEqual_(publicKey, v7, v15))
      goto LABEL_21;
  }
  protectionInfo = self->_protectionInfo;
  v17 = v4[3];
  if ((unint64_t)protectionInfo | v17)
  {
    if (!objc_msgSend_isEqual_(protectionInfo, v7, v17))
      goto LABEL_21;
  }
  participantId = self->_participantId;
  v19 = v4[2];
  if ((unint64_t)participantId | v19)
  {
    if (!objc_msgSend_isEqual_(participantId, v7, v19))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_publicKeyVersion != *((_DWORD *)v4 + 10))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_21;
  }
  v20 = (*((_BYTE *)v4 + 68) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0)
    {
LABEL_21:
      v20 = 0;
      goto LABEL_22;
    }
    if (self->_acceptedInProcess)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_21;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_21;
    }
    v20 = 1;
  }
LABEL_22:

  return v20;
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = objc_msgSend_hash(self->_shareId, a2, v2);
  v7 = objc_msgSend_hash(self->_etag, v5, v6);
  v10 = objc_msgSend_hash(self->_selfAddedPcs, v8, v9);
  v13 = objc_msgSend_hash(self->_publicKey, v11, v12);
  v16 = objc_msgSend_hash(self->_protectionInfo, v14, v15);
  v19 = objc_msgSend_hash(self->_participantId, v17, v18);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v20 = 2654435761 * self->_publicKeyVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v21 = 0;
    return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v19 ^ v20 ^ v21;
  }
  v20 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v21 = 2654435761 * self->_acceptedInProcess;
  return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPShareIdentifier *shareId;
  uint64_t v6;
  uint64_t v7;
  CKDPProtectionInfo *selfAddedPcs;
  uint64_t v9;
  CKDPProtectionInfo *publicKey;
  uint64_t v11;
  CKDPProtectionInfo *protectionInfo;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id v16;

  v4 = a3;
  shareId = self->_shareId;
  v6 = *((_QWORD *)v4 + 7);
  v16 = v4;
  if (shareId)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(shareId, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setShareId_(self, (const char *)v4, v6);
  }
  v4 = v16;
LABEL_7:
  v7 = *((_QWORD *)v4 + 1);
  if (v7)
  {
    objc_msgSend_setEtag_(self, (const char *)v4, v7);
    v4 = v16;
  }
  selfAddedPcs = self->_selfAddedPcs;
  v9 = *((_QWORD *)v4 + 6);
  if (selfAddedPcs)
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_mergeFrom_(selfAddedPcs, (const char *)v4, v9);
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    objc_msgSend_setSelfAddedPcs_(self, (const char *)v4, v9);
  }
  v4 = v16;
LABEL_15:
  publicKey = self->_publicKey;
  v11 = *((_QWORD *)v4 + 4);
  if (publicKey)
  {
    if (!v11)
      goto LABEL_21;
    objc_msgSend_mergeFrom_(publicKey, (const char *)v4, v11);
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    objc_msgSend_setPublicKey_(self, (const char *)v4, v11);
  }
  v4 = v16;
LABEL_21:
  protectionInfo = self->_protectionInfo;
  v13 = *((_QWORD *)v4 + 3);
  if (protectionInfo)
  {
    if (!v13)
      goto LABEL_27;
    objc_msgSend_mergeFrom_(protectionInfo, (const char *)v4, v13);
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    objc_msgSend_setProtectionInfo_(self, (const char *)v4, v13);
  }
  v4 = v16;
LABEL_27:
  v14 = *((_QWORD *)v4 + 2);
  if (v14)
  {
    objc_msgSend_setParticipantId_(self, (const char *)v4, v14);
    v4 = v16;
  }
  v15 = *((_BYTE *)v4 + 68);
  if ((v15 & 1) != 0)
  {
    self->_publicKeyVersion = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
    v15 = *((_BYTE *)v4 + 68);
  }
  if ((v15 & 2) != 0)
  {
    self->_acceptedInProcess = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (CKDPShareIdentifier)shareId
{
  return self->_shareId;
}

- (void)setShareId:(id)a3
{
  objc_storeStrong((id *)&self->_shareId, a3);
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (CKDPProtectionInfo)selfAddedPcs
{
  return self->_selfAddedPcs;
}

- (void)setSelfAddedPcs:(id)a3
{
  objc_storeStrong((id *)&self->_selfAddedPcs, a3);
}

- (CKDPProtectionInfo)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_protectionInfo, a3);
}

- (NSString)participantId
{
  return self->_participantId;
}

- (void)setParticipantId:(id)a3
{
  objc_storeStrong((id *)&self->_participantId, a3);
}

- (BOOL)acceptedInProcess
{
  return self->_acceptedInProcess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareId, 0);
  objc_storeStrong((id *)&self->_selfAddedPcs, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_participantId, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end
