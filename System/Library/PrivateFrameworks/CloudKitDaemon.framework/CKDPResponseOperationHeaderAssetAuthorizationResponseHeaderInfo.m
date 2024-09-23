@implementation CKDPResponseOperationHeaderAssetAuthorizationResponseHeaderInfo

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
  v11.super_class = (Class)CKDPResponseOperationHeaderAssetAuthorizationResponseHeaderInfo;
  -[CKDPResponseOperationHeaderAssetAuthorizationResponseHeaderInfo description](&v11, sel_description);
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
  NSString *headerKey;
  NSString *headerValue;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  headerKey = self->_headerKey;
  if (headerKey)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)headerKey, CFSTR("headerKey"));
  headerValue = self->_headerValue;
  if (headerValue)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)headerValue, CFSTR("headerValue"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB64300((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_headerKey)
    __assert_rtn("-[CKDPResponseOperationHeaderAssetAuthorizationResponseHeaderInfo writeTo:]", "CKDPResponseOperationHeaderAssetAuthorizationResponseHeaderInfo.m", 83, "nil != self->_headerKey");
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_headerValue)
    __assert_rtn("-[CKDPResponseOperationHeaderAssetAuthorizationResponseHeaderInfo writeTo:]", "CKDPResponseOperationHeaderAssetAuthorizationResponseHeaderInfo.m", 88, "nil != self->_headerValue");
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  NSString *headerKey;
  const char *v5;
  const char *v6;
  id v7;

  headerKey = self->_headerKey;
  v7 = a3;
  objc_msgSend_setHeaderKey_(v7, v5, (uint64_t)headerKey);
  objc_msgSend_setHeaderValue_(v7, v6, (uint64_t)self->_headerValue);

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
  v12 = objc_msgSend_copyWithZone_(self->_headerKey, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_headerValue, v14, (uint64_t)a3);
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
  NSString *headerKey;
  uint64_t v9;
  NSString *headerValue;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((headerKey = self->_headerKey, v9 = v4[1], !((unint64_t)headerKey | v9))
     || objc_msgSend_isEqual_(headerKey, v7, v9)))
  {
    headerValue = self->_headerValue;
    v11 = v4[2];
    if ((unint64_t)headerValue | v11)
      isEqual = objc_msgSend_isEqual_(headerValue, v7, v11);
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

  v4 = objc_msgSend_hash(self->_headerKey, a2, v2);
  return objc_msgSend_hash(self->_headerValue, v5, v6) ^ v4;
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
    objc_msgSend_setHeaderKey_(self, v5, v6);
    v4 = v8;
  }
  v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setHeaderValue_(self, v5, v7);
    v4 = v8;
  }

}

- (NSString)headerKey
{
  return self->_headerKey;
}

- (void)setHeaderKey:(id)a3
{
  objc_storeStrong((id *)&self->_headerKey, a3);
}

- (NSString)headerValue
{
  return self->_headerValue;
}

- (void)setHeaderValue:(id)a3
{
  objc_storeStrong((id *)&self->_headerValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerValue, 0);
  objc_storeStrong((id *)&self->_headerKey, 0);
}

@end
