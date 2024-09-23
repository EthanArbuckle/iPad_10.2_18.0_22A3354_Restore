@implementation CKDPRecordStableUrl

- (BOOL)hasRoutingKey
{
  return self->_routingKey != 0;
}

- (BOOL)hasShortTokenHash
{
  return self->_shortTokenHash != 0;
}

- (BOOL)hasProtectedFullToken
{
  return self->_protectedFullToken != 0;
}

- (BOOL)hasEncryptedPublicSharingKey
{
  return self->_encryptedPublicSharingKey != 0;
}

- (BOOL)hasDisplayedHostname
{
  return self->_displayedHostname != 0;
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
  v11.super_class = (Class)CKDPRecordStableUrl;
  -[CKDPRecordStableUrl description](&v11, sel_description);
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
  NSData *protectedFullToken;
  NSData *encryptedPublicSharingKey;
  NSString *displayedHostname;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  routingKey = self->_routingKey;
  if (routingKey)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)routingKey, CFSTR("routingKey"));
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)shortTokenHash, CFSTR("shortTokenHash"));
  protectedFullToken = self->_protectedFullToken;
  if (protectedFullToken)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)protectedFullToken, CFSTR("protectedFullToken"));
  encryptedPublicSharingKey = self->_encryptedPublicSharingKey;
  if (encryptedPublicSharingKey)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)encryptedPublicSharingKey, CFSTR("encryptedPublicSharingKey"));
  displayedHostname = self->_displayedHostname;
  if (displayedHostname)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)displayedHostname, CFSTR("displayedHostname"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordStableUrlReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_routingKey)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_shortTokenHash)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_protectedFullToken)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_encryptedPublicSharingKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_displayedHostname)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *routingKey;
  NSData *shortTokenHash;
  NSData *protectedFullToken;
  NSData *encryptedPublicSharingKey;
  NSString *displayedHostname;
  id v11;

  v4 = a3;
  routingKey = self->_routingKey;
  v11 = v4;
  if (routingKey)
  {
    objc_msgSend_setRoutingKey_(v4, v5, (uint64_t)routingKey);
    v4 = v11;
  }
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
  {
    objc_msgSend_setShortTokenHash_(v11, v5, (uint64_t)shortTokenHash);
    v4 = v11;
  }
  protectedFullToken = self->_protectedFullToken;
  if (protectedFullToken)
  {
    objc_msgSend_setProtectedFullToken_(v11, v5, (uint64_t)protectedFullToken);
    v4 = v11;
  }
  encryptedPublicSharingKey = self->_encryptedPublicSharingKey;
  if (encryptedPublicSharingKey)
  {
    objc_msgSend_setEncryptedPublicSharingKey_(v11, v5, (uint64_t)encryptedPublicSharingKey);
    v4 = v11;
  }
  displayedHostname = self->_displayedHostname;
  if (displayedHostname)
  {
    objc_msgSend_setDisplayedHostname_(v11, v5, (uint64_t)displayedHostname);
    v4 = v11;
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
  const char *v23;
  uint64_t v24;
  void *v25;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_routingKey, v11, (uint64_t)a3);
  v13 = (void *)v10[4];
  v10[4] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_shortTokenHash, v14, (uint64_t)a3);
  v16 = (void *)v10[5];
  v10[5] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_protectedFullToken, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  v21 = objc_msgSend_copyWithZone_(self->_encryptedPublicSharingKey, v20, (uint64_t)a3);
  v22 = (void *)v10[2];
  v10[2] = v21;

  v24 = objc_msgSend_copyWithZone_(self->_displayedHostname, v23, (uint64_t)a3);
  v25 = (void *)v10[1];
  v10[1] = v24;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *routingKey;
  uint64_t v9;
  NSData *shortTokenHash;
  uint64_t v11;
  NSData *protectedFullToken;
  uint64_t v13;
  NSData *encryptedPublicSharingKey;
  uint64_t v15;
  NSString *displayedHostname;
  uint64_t v17;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_12;
  routingKey = self->_routingKey;
  v9 = v4[4];
  if ((unint64_t)routingKey | v9)
  {
    if (!objc_msgSend_isEqual_(routingKey, v7, v9))
      goto LABEL_12;
  }
  if (((shortTokenHash = self->_shortTokenHash, v11 = v4[5], !((unint64_t)shortTokenHash | v11))
     || objc_msgSend_isEqual_(shortTokenHash, v7, v11))
    && ((protectedFullToken = self->_protectedFullToken, v13 = v4[3], !((unint64_t)protectedFullToken | v13))
     || objc_msgSend_isEqual_(protectedFullToken, v7, v13))
    && ((encryptedPublicSharingKey = self->_encryptedPublicSharingKey,
         v15 = v4[2],
         !((unint64_t)encryptedPublicSharingKey | v15))
     || objc_msgSend_isEqual_(encryptedPublicSharingKey, v7, v15)))
  {
    displayedHostname = self->_displayedHostname;
    v17 = v4[1];
    if ((unint64_t)displayedHostname | v17)
      isEqual = objc_msgSend_isEqual_(displayedHostname, v7, v17);
    else
      isEqual = 1;
  }
  else
  {
LABEL_12:
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
  uint64_t v13;
  const char *v14;
  uint64_t v15;

  v4 = objc_msgSend_hash(self->_routingKey, a2, v2);
  v7 = objc_msgSend_hash(self->_shortTokenHash, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_protectedFullToken, v8, v9);
  v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_encryptedPublicSharingKey, v11, v12);
  return v13 ^ objc_msgSend_hash(self->_displayedHostname, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v10 = a3;
  v5 = v10[4];
  if (v5)
    objc_msgSend_setRoutingKey_(self, v4, v5);
  v6 = v10[5];
  if (v6)
    objc_msgSend_setShortTokenHash_(self, v4, v6);
  v7 = v10[3];
  if (v7)
    objc_msgSend_setProtectedFullToken_(self, v4, v7);
  v8 = v10[2];
  if (v8)
    objc_msgSend_setEncryptedPublicSharingKey_(self, v4, v8);
  v9 = v10[1];
  if (v9)
    objc_msgSend_setDisplayedHostname_(self, v4, v9);

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

- (NSData)protectedFullToken
{
  return self->_protectedFullToken;
}

- (void)setProtectedFullToken:(id)a3
{
  objc_storeStrong((id *)&self->_protectedFullToken, a3);
}

- (NSData)encryptedPublicSharingKey
{
  return self->_encryptedPublicSharingKey;
}

- (void)setEncryptedPublicSharingKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedPublicSharingKey, a3);
}

- (NSString)displayedHostname
{
  return self->_displayedHostname;
}

- (void)setDisplayedHostname:(id)a3
{
  objc_storeStrong((id *)&self->_displayedHostname, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortTokenHash, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_protectedFullToken, 0);
  objc_storeStrong((id *)&self->_encryptedPublicSharingKey, 0);
  objc_storeStrong((id *)&self->_displayedHostname, 0);
}

@end
