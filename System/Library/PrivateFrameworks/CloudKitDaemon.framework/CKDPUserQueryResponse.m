@implementation CKDPUserQueryResponse

- (BOOL)hasUser
{
  return self->_user != 0;
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
  v11.super_class = (Class)CKDPUserQueryResponse;
  -[CKDPUserQueryResponse description](&v11, sel_description);
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
  CKDPUser *user;
  void *v8;
  const char *v9;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  user = self->_user;
  if (user)
  {
    objc_msgSend_dictionaryRepresentation(user, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("user"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC5DB88((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_user)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  CKDPUser *user;

  user = self->_user;
  if (user)
    objc_msgSend_setUser_(a3, a2, (uint64_t)user);
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_user, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPUser *user;
  uint64_t v9;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    user = self->_user;
    v9 = v4[1];
    if ((unint64_t)user | v9)
      isEqual = objc_msgSend_isEqual_(user, v7, v9);
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

  return objc_msgSend_hash(self->_user, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPUser *user;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  user = self->_user;
  v6 = v4[1];
  if (user)
  {
    if (v6)
    {
      v7 = v4;
      objc_msgSend_mergeFrom_(user, (const char *)v4, v6);
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    objc_msgSend_setUser_(self, (const char *)v4, v6);
    goto LABEL_6;
  }

}

- (CKDPUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_storeStrong((id *)&self->_user, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
}

@end
