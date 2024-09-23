@implementation CKDPWebAuthTokenRetrieveResponse

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (BOOL)hasContainerScopedUserId
{
  return self->_containerScopedUserId != 0;
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
  v11.super_class = (Class)CKDPWebAuthTokenRetrieveResponse;
  -[CKDPWebAuthTokenRetrieveResponse description](&v11, sel_description);
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
  NSString *token;
  NSString *containerScopedUserId;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  token = self->_token;
  if (token)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)token, CFSTR("token"));
  containerScopedUserId = self->_containerScopedUserId;
  if (containerScopedUserId)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)containerScopedUserId, CFSTR("containerScopedUserId"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB07F28((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_token)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_containerScopedUserId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *token;
  NSString *containerScopedUserId;
  id v8;

  v4 = a3;
  token = self->_token;
  v8 = v4;
  if (token)
  {
    objc_msgSend_setToken_(v4, v5, (uint64_t)token);
    v4 = v8;
  }
  containerScopedUserId = self->_containerScopedUserId;
  if (containerScopedUserId)
  {
    objc_msgSend_setContainerScopedUserId_(v8, v5, (uint64_t)containerScopedUserId);
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
  v12 = objc_msgSend_copyWithZone_(self->_token, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_containerScopedUserId, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *token;
  uint64_t v9;
  NSString *containerScopedUserId;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((token = self->_token, v9 = v4[2], !((unint64_t)token | v9))
     || objc_msgSend_isEqual_(token, v7, v9)))
  {
    containerScopedUserId = self->_containerScopedUserId;
    v11 = v4[1];
    if ((unint64_t)containerScopedUserId | v11)
      isEqual = objc_msgSend_isEqual_(containerScopedUserId, v7, v11);
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

  v4 = objc_msgSend_hash(self->_token, a2, v2);
  return objc_msgSend_hash(self->_containerScopedUserId, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v6 = v4[2];
  v8 = v4;
  if (v6)
  {
    objc_msgSend_setToken_(self, v5, v6);
    v4 = v8;
  }
  v7 = v4[1];
  if (v7)
  {
    objc_msgSend_setContainerScopedUserId_(self, v5, v7);
    v4 = v8;
  }

}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSString)containerScopedUserId
{
  return self->_containerScopedUserId;
}

- (void)setContainerScopedUserId:(id)a3
{
  objc_storeStrong((id *)&self->_containerScopedUserId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_containerScopedUserId, 0);
}

@end
