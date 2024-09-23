@implementation PSIDSLinkHBHEncryptedPayload

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)PSIDSLinkHBHEncryptedPayload;
  -[PSIDSLinkHBHEncryptedPayload description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  NSData *initializationVector;
  NSData *cipherText;
  NSData *authenticationTag;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  initializationVector = self->_initializationVector;
  if (initializationVector)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)initializationVector, v7, CFSTR("initializationVector"));
  cipherText = self->_cipherText;
  if (cipherText)
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)cipherText, v7, CFSTR("cipherText"));
  authenticationTag = self->_authenticationTag;
  if (authenticationTag)
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)authenticationTag, v7, CFSTR("authenticationTag"));
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return sub_19B9B693C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_initializationVector)
    sub_19BAF1188();
  PBDataWriterWriteDataField();
  if (!self->_cipherText)
    sub_19BAF11B0();
  PBDataWriterWriteDataField();
  if (!self->_authenticationTag)
    sub_19BAF11D8();
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSData *initializationVector;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  id v11;

  initializationVector = self->_initializationVector;
  v11 = a3;
  objc_msgSend_setInitializationVector_(v11, v5, (uint64_t)initializationVector, v6);
  objc_msgSend_setCipherText_(v11, v7, (uint64_t)self->_cipherText, v8);
  objc_msgSend_setAuthenticationTag_(v11, v9, (uint64_t)self->_authenticationTag, v10);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  _QWORD *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  double v22;
  uint64_t v23;
  void *v24;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_initializationVector, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[3];
  v12[3] = v15;

  v19 = objc_msgSend_copyWithZone_(self->_cipherText, v17, (uint64_t)a3, v18);
  v20 = (void *)v12[2];
  v12[2] = v19;

  v23 = objc_msgSend_copyWithZone_(self->_authenticationTag, v21, (uint64_t)a3, v22);
  v24 = (void *)v12[1];
  v12[1] = v23;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSData *initializationVector;
  uint64_t v11;
  NSData *cipherText;
  uint64_t v13;
  NSData *authenticationTag;
  uint64_t v15;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((initializationVector = self->_initializationVector, v11 = v4[3],
                                                             !((unint64_t)initializationVector | v11))
     || objc_msgSend_isEqual_(initializationVector, v8, v11, v9))
    && ((cipherText = self->_cipherText, v13 = v4[2], !((unint64_t)cipherText | v13))
     || objc_msgSend_isEqual_(cipherText, v8, v13, v9)))
  {
    authenticationTag = self->_authenticationTag;
    v15 = v4[1];
    if ((unint64_t)authenticationTag | v15)
      isEqual = objc_msgSend_isEqual_(authenticationTag, v8, v15, v9);
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
  double v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;

  v5 = objc_msgSend_hash(self->_initializationVector, a2, v2, v3);
  v9 = objc_msgSend_hash(self->_cipherText, v6, v7, v8) ^ v5;
  return v9 ^ objc_msgSend_hash(self->_authenticationTag, v10, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v9 = a3;
  v6 = v9[3];
  if (v6)
    objc_msgSend_setInitializationVector_(self, v4, v6, v5);
  v7 = v9[2];
  if (v7)
    objc_msgSend_setCipherText_(self, v4, v7, v5);
  v8 = v9[1];
  if (v8)
    objc_msgSend_setAuthenticationTag_(self, v4, v8, v5);

}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setInitializationVector:(id)a3
{
  objc_storeStrong((id *)&self->_initializationVector, a3);
}

- (NSData)cipherText
{
  return self->_cipherText;
}

- (void)setCipherText:(id)a3
{
  objc_storeStrong((id *)&self->_cipherText, a3);
}

- (NSData)authenticationTag
{
  return self->_authenticationTag;
}

- (void)setAuthenticationTag:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationTag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_cipherText, 0);
  objc_storeStrong((id *)&self->_authenticationTag, 0);
}

@end
