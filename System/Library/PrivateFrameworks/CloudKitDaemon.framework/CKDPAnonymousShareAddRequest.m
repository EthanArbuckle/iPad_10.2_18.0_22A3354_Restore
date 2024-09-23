@implementation CKDPAnonymousShareAddRequest

+ (id)options
{
  if (qword_1ED700970 != -1)
    dispatch_once(&qword_1ED700970, &unk_1E7833120);
  return (id)qword_1ED700968;
}

- (BOOL)hasAnonymousShareTupleHash
{
  return self->_anonymousShareTupleHash != 0;
}

- (BOOL)hasEncryptedShareTuple
{
  return self->_encryptedShareTuple != 0;
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
  v11.super_class = (Class)CKDPAnonymousShareAddRequest;
  -[CKDPAnonymousShareAddRequest description](&v11, sel_description);
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
  NSString *anonymousShareTupleHash;
  NSData *encryptedShareTuple;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  anonymousShareTupleHash = self->_anonymousShareTupleHash;
  if (anonymousShareTupleHash)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)anonymousShareTupleHash, CFSTR("anonymousShareTupleHash"));
  encryptedShareTuple = self->_encryptedShareTuple;
  if (encryptedShareTuple)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)encryptedShareTuple, CFSTR("encryptedShareTuple"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAE04BC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_anonymousShareTupleHash)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_encryptedShareTuple)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (unsigned)requestTypeCode
{
  return 81;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *anonymousShareTupleHash;
  NSData *encryptedShareTuple;
  id v8;

  v4 = a3;
  anonymousShareTupleHash = self->_anonymousShareTupleHash;
  v8 = v4;
  if (anonymousShareTupleHash)
  {
    objc_msgSend_setAnonymousShareTupleHash_(v4, v5, (uint64_t)anonymousShareTupleHash);
    v4 = v8;
  }
  encryptedShareTuple = self->_encryptedShareTuple;
  if (encryptedShareTuple)
  {
    objc_msgSend_setEncryptedShareTuple_(v8, v5, (uint64_t)encryptedShareTuple);
    v4 = v8;
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_anonymousShareTupleHash, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_encryptedShareTuple, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *anonymousShareTupleHash;
  uint64_t v9;
  NSData *encryptedShareTuple;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((anonymousShareTupleHash = self->_anonymousShareTupleHash,
         v9 = v4[1],
         !((unint64_t)anonymousShareTupleHash | v9))
     || objc_msgSend_isEqual_(anonymousShareTupleHash, v7, v9)))
  {
    encryptedShareTuple = self->_encryptedShareTuple;
    v11 = v4[2];
    if ((unint64_t)encryptedShareTuple | v11)
      isEqual = objc_msgSend_isEqual_(encryptedShareTuple, v7, v11);
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

  v4 = objc_msgSend_hash(self->_anonymousShareTupleHash, a2, v2);
  return objc_msgSend_hash(self->_encryptedShareTuple, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v6 = v4[1];
  v8 = v4;
  if (v6)
  {
    objc_msgSend_setAnonymousShareTupleHash_(self, v5, v6);
    v4 = v8;
  }
  v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setEncryptedShareTuple_(self, v5, v7);
    v4 = v8;
  }

}

- (NSString)anonymousShareTupleHash
{
  return self->_anonymousShareTupleHash;
}

- (void)setAnonymousShareTupleHash:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousShareTupleHash, a3);
}

- (NSData)encryptedShareTuple
{
  return self->_encryptedShareTuple;
}

- (void)setEncryptedShareTuple:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedShareTuple, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedShareTuple, 0);
  objc_storeStrong((id *)&self->_anonymousShareTupleHash, 0);
}

@end
