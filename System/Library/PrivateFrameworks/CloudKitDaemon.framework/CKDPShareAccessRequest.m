@implementation CKDPShareAccessRequest

+ (id)options
{
  if (qword_1ED7008E0 != -1)
    dispatch_once(&qword_1ED7008E0, &unk_1E7832230);
  return (id)qword_1ED7008D8;
}

- (BOOL)hasRoutingKey
{
  return self->_routingKey != 0;
}

- (BOOL)hasShortTokenHash
{
  return self->_shortTokenHash != 0;
}

- (BOOL)hasUserInformationRequestAccess
{
  return self->_userInformationRequestAccess != 0;
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
  v11.super_class = (Class)CKDPShareAccessRequest;
  -[CKDPShareAccessRequest description](&v11, sel_description);
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
  CKDPUserInformationRequestAccess *userInformationRequestAccess;
  void *v10;
  const char *v11;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  routingKey = self->_routingKey;
  if (routingKey)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)routingKey, CFSTR("routingKey"));
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)shortTokenHash, CFSTR("shortTokenHash"));
  userInformationRequestAccess = self->_userInformationRequestAccess;
  if (userInformationRequestAccess)
  {
    objc_msgSend_dictionaryRepresentation(userInformationRequestAccess, v5, (uint64_t)shortTokenHash);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("userInformationRequestAccess"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA93FC0((uint64_t)self, (uint64_t)a3);
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
  if (self->_userInformationRequestAccess)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *routingKey;
  NSData *shortTokenHash;
  CKDPUserInformationRequestAccess *userInformationRequestAccess;
  id v9;

  v4 = a3;
  routingKey = self->_routingKey;
  v9 = v4;
  if (routingKey)
  {
    objc_msgSend_setRoutingKey_(v4, v5, (uint64_t)routingKey);
    v4 = v9;
  }
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
  {
    objc_msgSend_setShortTokenHash_(v9, v5, (uint64_t)shortTokenHash);
    v4 = v9;
  }
  userInformationRequestAccess = self->_userInformationRequestAccess;
  if (userInformationRequestAccess)
  {
    objc_msgSend_setUserInformationRequestAccess_(v9, v5, (uint64_t)userInformationRequestAccess);
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
  v12 = objc_msgSend_copyWithZone_(self->_routingKey, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_shortTokenHash, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_userInformationRequestAccess, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

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
  CKDPUserInformationRequestAccess *userInformationRequestAccess;
  uint64_t v13;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((routingKey = self->_routingKey, v9 = v4[1], !((unint64_t)routingKey | v9))
     || objc_msgSend_isEqual_(routingKey, v7, v9))
    && ((shortTokenHash = self->_shortTokenHash, v11 = v4[2], !((unint64_t)shortTokenHash | v11))
     || objc_msgSend_isEqual_(shortTokenHash, v7, v11)))
  {
    userInformationRequestAccess = self->_userInformationRequestAccess;
    v13 = v4[3];
    if ((unint64_t)userInformationRequestAccess | v13)
      isEqual = objc_msgSend_isEqual_(userInformationRequestAccess, v7, v13);
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

  v4 = objc_msgSend_hash(self->_routingKey, a2, v2);
  v7 = objc_msgSend_hash(self->_shortTokenHash, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_userInformationRequestAccess, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  CKDPUserInformationRequestAccess *userInformationRequestAccess;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4[1];
  v9 = v4;
  if (v5)
  {
    objc_msgSend_setRoutingKey_(self, (const char *)v4, v5);
    v4 = v9;
  }
  v6 = v4[2];
  if (v6)
  {
    objc_msgSend_setShortTokenHash_(self, (const char *)v4, v6);
    v4 = v9;
  }
  userInformationRequestAccess = self->_userInformationRequestAccess;
  v8 = v4[3];
  if (userInformationRequestAccess)
  {
    if (v8)
    {
      objc_msgSend_mergeFrom_(userInformationRequestAccess, (const char *)v4, v8);
LABEL_10:
      v4 = v9;
    }
  }
  else if (v8)
  {
    objc_msgSend_setUserInformationRequestAccess_(self, (const char *)v4, v8);
    goto LABEL_10;
  }

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

- (CKDPUserInformationRequestAccess)userInformationRequestAccess
{
  return self->_userInformationRequestAccess;
}

- (void)setUserInformationRequestAccess:(id)a3
{
  objc_storeStrong((id *)&self->_userInformationRequestAccess, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInformationRequestAccess, 0);
  objc_storeStrong((id *)&self->_shortTokenHash, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
}

@end
