@implementation CKDPCodeFunctionInvokeResponse

- (BOOL)hasSerializedResult
{
  return self->_serializedResult != 0;
}

- (BOOL)hasAttestationResponse
{
  return self->_attestationResponse != 0;
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
  v11.super_class = (Class)CKDPCodeFunctionInvokeResponse;
  -[CKDPCodeFunctionInvokeResponse description](&v11, sel_description);
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
  NSData *serializedResult;
  CKDPCodeFunctionInvokeResponseAttestationResponse *attestationResponse;
  void *v9;
  const char *v10;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  serializedResult = self->_serializedResult;
  if (serializedResult)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)serializedResult, CFSTR("serializedResult"));
  attestationResponse = self->_attestationResponse;
  if (attestationResponse)
  {
    objc_msgSend_dictionaryRepresentation(attestationResponse, v5, (uint64_t)serializedResult);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("attestationResponse"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC36F8C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_serializedResult)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_attestationResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSData *serializedResult;
  CKDPCodeFunctionInvokeResponseAttestationResponse *attestationResponse;
  id v8;

  v4 = a3;
  serializedResult = self->_serializedResult;
  v8 = v4;
  if (serializedResult)
  {
    objc_msgSend_setSerializedResult_(v4, v5, (uint64_t)serializedResult);
    v4 = v8;
  }
  attestationResponse = self->_attestationResponse;
  if (attestationResponse)
  {
    objc_msgSend_setAttestationResponse_(v8, v5, (uint64_t)attestationResponse);
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
  v12 = objc_msgSend_copyWithZone_(self->_serializedResult, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_attestationResponse, v14, (uint64_t)a3);
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
  NSData *serializedResult;
  uint64_t v9;
  CKDPCodeFunctionInvokeResponseAttestationResponse *attestationResponse;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((serializedResult = self->_serializedResult, v9 = v4[2], !((unint64_t)serializedResult | v9))
     || objc_msgSend_isEqual_(serializedResult, v7, v9)))
  {
    attestationResponse = self->_attestationResponse;
    v11 = v4[1];
    if ((unint64_t)attestationResponse | v11)
      isEqual = objc_msgSend_isEqual_(attestationResponse, v7, v11);
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

  v4 = objc_msgSend_hash(self->_serializedResult, a2, v2);
  return objc_msgSend_hash(self->_attestationResponse, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  CKDPCodeFunctionInvokeResponseAttestationResponse *attestationResponse;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4[2];
  v8 = v4;
  if (v5)
  {
    objc_msgSend_setSerializedResult_(self, (const char *)v4, v5);
    v4 = v8;
  }
  attestationResponse = self->_attestationResponse;
  v7 = v4[1];
  if (attestationResponse)
  {
    if (v7)
    {
      objc_msgSend_mergeFrom_(attestationResponse, (const char *)v4, v7);
LABEL_8:
      v4 = v8;
    }
  }
  else if (v7)
  {
    objc_msgSend_setAttestationResponse_(self, (const char *)v4, v7);
    goto LABEL_8;
  }

}

- (NSData)serializedResult
{
  return self->_serializedResult;
}

- (void)setSerializedResult:(id)a3
{
  objc_storeStrong((id *)&self->_serializedResult, a3);
}

- (CKDPCodeFunctionInvokeResponseAttestationResponse)attestationResponse
{
  return self->_attestationResponse;
}

- (void)setAttestationResponse:(id)a3
{
  objc_storeStrong((id *)&self->_attestationResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedResult, 0);
  objc_storeStrong((id *)&self->_attestationResponse, 0);
}

@end
