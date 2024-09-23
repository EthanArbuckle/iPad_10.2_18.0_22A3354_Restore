@implementation CKDPWebAuthTokenRetrieveRequest

+ (id)options
{
  if (qword_1ED7009B0 != -1)
    dispatch_once(&qword_1ED7009B0, &unk_1E7833750);
  return (id)qword_1ED7009A8;
}

- (BOOL)hasApiToken
{
  return self->_apiToken != 0;
}

- (void)setForceFetchToken:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_forceFetchToken = a3;
}

- (void)setHasForceFetchToken:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasForceFetchToken
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
  v11.super_class = (Class)CKDPWebAuthTokenRetrieveRequest;
  -[CKDPWebAuthTokenRetrieveRequest description](&v11, sel_description);
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
  NSString *apiToken;
  void *v8;
  const char *v9;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  apiToken = self->_apiToken;
  if (apiToken)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)apiToken, CFSTR("apiToken"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_forceFetchToken);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("forceFetchToken"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB07844((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_apiToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (unsigned)requestTypeCode
{
  return 54;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  NSString *apiToken;
  _BYTE *v7;

  v4 = a3;
  apiToken = self->_apiToken;
  if (apiToken)
  {
    v7 = v4;
    objc_msgSend_setApiToken_(v4, v5, (uint64_t)apiToken);
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_forceFetchToken;
    v4[20] |= 1u;
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_apiToken, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v10 + 16) = self->_forceFetchToken;
    *(_BYTE *)(v10 + 20) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *apiToken;
  uint64_t v9;
  BOOL v10;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_6;
  apiToken = self->_apiToken;
  v9 = v4[1];
  if ((unint64_t)apiToken | v9)
  {
    if (!objc_msgSend_isEqual_(apiToken, v7, v9))
      goto LABEL_6;
  }
  v10 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      v10 = 0;
      goto LABEL_7;
    }
    if (self->_forceFetchToken)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_6;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_6;
    }
    v10 = 1;
  }
LABEL_7:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend_hash(self->_apiToken, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_forceFetchToken;
  else
    v5 = 0;
  return v5 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v6 = *((_QWORD *)v4 + 1);
  if (v6)
  {
    v7 = v4;
    objc_msgSend_setApiToken_(self, v5, v6);
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_forceFetchToken = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)apiToken
{
  return self->_apiToken;
}

- (void)setApiToken:(id)a3
{
  objc_storeStrong((id *)&self->_apiToken, a3);
}

- (BOOL)forceFetchToken
{
  return self->_forceFetchToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apiToken, 0);
}

@end
