@implementation CKDPShareDeclineRequest

+ (id)options
{
  if (qword_1ED700940 != -1)
    dispatch_once(&qword_1ED700940, &unk_1E7832C70);
  return (id)qword_1ED700938;
}

- (BOOL)hasShareId
{
  return self->_shareId != 0;
}

- (BOOL)hasParticipantId
{
  return self->_participantId != 0;
}

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
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
  v11.super_class = (Class)CKDPShareDeclineRequest;
  -[CKDPShareDeclineRequest description](&v11, sel_description);
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
  NSString *participantId;
  CKDPProtectionInfo *protectionInfo;
  void *v12;
  const char *v13;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  shareId = self->_shareId;
  if (shareId)
  {
    objc_msgSend_dictionaryRepresentation(shareId, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("shareId"));

  }
  participantId = self->_participantId;
  if (participantId)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)participantId, CFSTR("participantId"));
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_dictionaryRepresentation(protectionInfo, v4, (uint64_t)participantId);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("protectionInfo"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAC37CC((uint64_t)self, (uint64_t)a3);
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
  if (self->_participantId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_protectionInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPShareIdentifier *shareId;
  NSString *participantId;
  CKDPProtectionInfo *protectionInfo;
  id v9;

  v4 = a3;
  shareId = self->_shareId;
  v9 = v4;
  if (shareId)
  {
    objc_msgSend_setShareId_(v4, v5, (uint64_t)shareId);
    v4 = v9;
  }
  participantId = self->_participantId;
  if (participantId)
  {
    objc_msgSend_setParticipantId_(v9, v5, (uint64_t)participantId);
    v4 = v9;
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_setProtectionInfo_(v9, v5, (uint64_t)protectionInfo);
    v4 = v9;
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_shareId, v11, (uint64_t)a3);
  v13 = (void *)v10[3];
  v10[3] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_participantId, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_protectionInfo, v17, (uint64_t)a3);
  v19 = (void *)v10[2];
  v10[2] = v18;

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
  NSString *participantId;
  uint64_t v11;
  CKDPProtectionInfo *protectionInfo;
  uint64_t v13;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((shareId = self->_shareId, v9 = v4[3], !((unint64_t)shareId | v9))
     || objc_msgSend_isEqual_(shareId, v7, v9))
    && ((participantId = self->_participantId, v11 = v4[1], !((unint64_t)participantId | v11))
     || objc_msgSend_isEqual_(participantId, v7, v11)))
  {
    protectionInfo = self->_protectionInfo;
    v13 = v4[2];
    if ((unint64_t)protectionInfo | v13)
      isEqual = objc_msgSend_isEqual_(protectionInfo, v7, v13);
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

  v4 = objc_msgSend_hash(self->_shareId, a2, v2);
  v7 = objc_msgSend_hash(self->_participantId, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_protectionInfo, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPShareIdentifier *shareId;
  uint64_t v6;
  uint64_t v7;
  CKDPProtectionInfo *protectionInfo;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  shareId = self->_shareId;
  v6 = v4[3];
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
  v7 = v4[1];
  if (v7)
  {
    objc_msgSend_setParticipantId_(self, (const char *)v4, v7);
    v4 = v10;
  }
  protectionInfo = self->_protectionInfo;
  v9 = v4[2];
  if (protectionInfo)
  {
    if (v9)
    {
      objc_msgSend_mergeFrom_(protectionInfo, (const char *)v4, v9);
LABEL_14:
      v4 = v10;
    }
  }
  else if (v9)
  {
    objc_msgSend_setProtectionInfo_(self, (const char *)v4, v9);
    goto LABEL_14;
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

- (NSString)participantId
{
  return self->_participantId;
}

- (void)setParticipantId:(id)a3
{
  objc_storeStrong((id *)&self->_participantId, a3);
}

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_protectionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareId, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_participantId, 0);
}

@end
