@implementation CKDPShareVettingInitiateRequest

+ (id)options
{
  if (qword_1ED700AD0 != -1)
    dispatch_once(&qword_1ED700AD0, &unk_1E7838B58);
  return (id)qword_1ED700AC8;
}

- (BOOL)hasShareId
{
  return self->_shareId != 0;
}

- (BOOL)hasEncryptedKey
{
  return self->_encryptedKey != 0;
}

- (BOOL)hasParticipantId
{
  return self->_participantId != 0;
}

- (BOOL)hasBaseToken
{
  return self->_baseToken != 0;
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
  v11.super_class = (Class)CKDPShareVettingInitiateRequest;
  -[CKDPShareVettingInitiateRequest description](&v11, sel_description);
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
  NSData *encryptedKey;
  NSString *participantId;
  NSString *baseToken;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  shareId = self->_shareId;
  if (shareId)
  {
    objc_msgSend_dictionaryRepresentation(shareId, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("shareId"));

  }
  encryptedKey = self->_encryptedKey;
  if (encryptedKey)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)encryptedKey, CFSTR("encryptedKey"));
  participantId = self->_participantId;
  if (participantId)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)participantId, CFSTR("participantId"));
  baseToken = self->_baseToken;
  if (baseToken)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)baseToken, CFSTR("baseToken"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC7D358((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_shareId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_encryptedKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_participantId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_baseToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (unsigned)requestTypeCode
{
  return 60;
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
  NSData *encryptedKey;
  NSString *participantId;
  NSString *baseToken;
  id v10;

  v4 = a3;
  shareId = self->_shareId;
  v10 = v4;
  if (shareId)
  {
    objc_msgSend_setShareId_(v4, v5, (uint64_t)shareId);
    v4 = v10;
  }
  encryptedKey = self->_encryptedKey;
  if (encryptedKey)
  {
    objc_msgSend_setEncryptedKey_(v10, v5, (uint64_t)encryptedKey);
    v4 = v10;
  }
  participantId = self->_participantId;
  if (participantId)
  {
    objc_msgSend_setParticipantId_(v10, v5, (uint64_t)participantId);
    v4 = v10;
  }
  baseToken = self->_baseToken;
  if (baseToken)
  {
    objc_msgSend_setBaseToken_(v10, v5, (uint64_t)baseToken);
    v4 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_shareId, v11, (uint64_t)a3);
  v13 = (void *)v10[4];
  v10[4] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_encryptedKey, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_participantId, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  v21 = objc_msgSend_copyWithZone_(self->_baseToken, v20, (uint64_t)a3);
  v22 = (void *)v10[1];
  v10[1] = v21;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPShareIdentifier *shareId;
  uint64_t v9;
  NSData *encryptedKey;
  uint64_t v11;
  NSString *participantId;
  uint64_t v13;
  NSString *baseToken;
  uint64_t v15;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((shareId = self->_shareId, v9 = v4[4], !((unint64_t)shareId | v9))
     || objc_msgSend_isEqual_(shareId, v7, v9))
    && ((encryptedKey = self->_encryptedKey, v11 = v4[2], !((unint64_t)encryptedKey | v11))
     || objc_msgSend_isEqual_(encryptedKey, v7, v11))
    && ((participantId = self->_participantId, v13 = v4[3], !((unint64_t)participantId | v13))
     || objc_msgSend_isEqual_(participantId, v7, v13)))
  {
    baseToken = self->_baseToken;
    v15 = v4[1];
    if ((unint64_t)baseToken | v15)
      isEqual = objc_msgSend_isEqual_(baseToken, v7, v15);
    else
      isEqual = 1;
  }
  else
  {
    isEqual = 0;
  }

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
  const char *v11;
  uint64_t v12;

  v4 = objc_msgSend_hash(self->_shareId, a2, v2);
  v7 = objc_msgSend_hash(self->_encryptedKey, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_participantId, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_baseToken, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPShareIdentifier *shareId;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  shareId = self->_shareId;
  v6 = v4[4];
  v10 = v4;
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
  v4 = v10;
LABEL_7:
  v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setEncryptedKey_(self, (const char *)v4, v7);
    v4 = v10;
  }
  v8 = v4[3];
  if (v8)
  {
    objc_msgSend_setParticipantId_(self, (const char *)v4, v8);
    v4 = v10;
  }
  v9 = v4[1];
  if (v9)
  {
    objc_msgSend_setBaseToken_(self, (const char *)v4, v9);
    v4 = v10;
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

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedKey, a3);
}

- (NSString)participantId
{
  return self->_participantId;
}

- (void)setParticipantId:(id)a3
{
  objc_storeStrong((id *)&self->_participantId, a3);
}

- (NSString)baseToken
{
  return self->_baseToken;
}

- (void)setBaseToken:(id)a3
{
  objc_storeStrong((id *)&self->_baseToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareId, 0);
  objc_storeStrong((id *)&self->_participantId, 0);
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
}

@end
