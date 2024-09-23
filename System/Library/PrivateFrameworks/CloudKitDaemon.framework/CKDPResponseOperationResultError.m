@implementation CKDPResponseOperationResultError

- (BOOL)hasClientError
{
  return self->_clientError != 0;
}

- (BOOL)hasServerError
{
  return self->_serverError != 0;
}

- (BOOL)hasExtensionError
{
  return self->_extensionError != 0;
}

- (BOOL)hasAuxiliaryError
{
  return self->_auxiliaryError != 0;
}

- (void)setRetryAfterSeconds:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_retryAfterSeconds = a3;
}

- (void)setHasRetryAfterSeconds:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRetryAfterSeconds
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (BOOL)hasErrorKey
{
  return self->_errorKey != 0;
}

- (BOOL)hasErrorInternal
{
  return self->_errorInternal != 0;
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
  v11.super_class = (Class)CKDPResponseOperationResultError;
  -[CKDPResponseOperationResultError description](&v11, sel_description);
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
  CKDPResponseOperationResultErrorClient *clientError;
  void *v8;
  const char *v9;
  CKDPResponseOperationResultErrorServer *serverError;
  void *v11;
  const char *v12;
  CKDPResponseOperationResultErrorExtension *extensionError;
  void *v14;
  const char *v15;
  CKDPResponseOperationResultErrorAuxiliaryError *auxiliaryError;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  NSString *errorDescription;
  NSString *errorKey;
  NSString *errorInternal;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  clientError = self->_clientError;
  if (clientError)
  {
    objc_msgSend_dictionaryRepresentation(clientError, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("clientError"));

  }
  serverError = self->_serverError;
  if (serverError)
  {
    objc_msgSend_dictionaryRepresentation(serverError, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("serverError"));

  }
  extensionError = self->_extensionError;
  if (extensionError)
  {
    objc_msgSend_dictionaryRepresentation(extensionError, v4, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("extensionError"));

  }
  auxiliaryError = self->_auxiliaryError;
  if (auxiliaryError)
  {
    objc_msgSend_dictionaryRepresentation(auxiliaryError, v4, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, CFSTR("auxiliaryError"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_retryAfterSeconds);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, CFSTR("retryAfterSeconds"));

  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)errorDescription, CFSTR("errorDescription"));
  errorKey = self->_errorKey;
  if (errorKey)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)errorKey, CFSTR("errorKey"));
  errorInternal = self->_errorInternal;
  if (errorInternal)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)errorInternal, CFSTR("errorInternal"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientError)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_serverError)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_errorKey)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_errorInternal)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_extensionError)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_auxiliaryError)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPResponseOperationResultErrorClient *clientError;
  CKDPResponseOperationResultErrorServer *serverError;
  NSString *errorDescription;
  NSString *errorKey;
  NSString *errorInternal;
  CKDPResponseOperationResultErrorExtension *extensionError;
  CKDPResponseOperationResultErrorAuxiliaryError *auxiliaryError;
  id v13;

  v4 = a3;
  clientError = self->_clientError;
  v13 = v4;
  if (clientError)
  {
    objc_msgSend_setClientError_(v4, v5, (uint64_t)clientError);
    v4 = v13;
  }
  serverError = self->_serverError;
  if (serverError)
  {
    objc_msgSend_setServerError_(v13, v5, (uint64_t)serverError);
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_retryAfterSeconds;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
  {
    objc_msgSend_setErrorDescription_(v13, v5, (uint64_t)errorDescription);
    v4 = v13;
  }
  errorKey = self->_errorKey;
  if (errorKey)
  {
    objc_msgSend_setErrorKey_(v13, v5, (uint64_t)errorKey);
    v4 = v13;
  }
  errorInternal = self->_errorInternal;
  if (errorInternal)
  {
    objc_msgSend_setErrorInternal_(v13, v5, (uint64_t)errorInternal);
    v4 = v13;
  }
  extensionError = self->_extensionError;
  if (extensionError)
  {
    objc_msgSend_setExtensionError_(v13, v5, (uint64_t)extensionError);
    v4 = v13;
  }
  auxiliaryError = self->_auxiliaryError;
  if (auxiliaryError)
  {
    objc_msgSend_setAuxiliaryError_(v13, v5, (uint64_t)auxiliaryError);
    v4 = v13;
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
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_clientError, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_serverError, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 64);
  *(_QWORD *)(v10 + 64) = v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 56) = self->_retryAfterSeconds;
    *(_BYTE *)(v10 + 72) |= 1u;
  }
  v18 = objc_msgSend_copyWithZone_(self->_errorDescription, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v18;

  v21 = objc_msgSend_copyWithZone_(self->_errorKey, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v21;

  v24 = objc_msgSend_copyWithZone_(self->_errorInternal, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v24;

  v27 = objc_msgSend_copyWithZone_(self->_extensionError, v26, (uint64_t)a3);
  v28 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v27;

  v30 = objc_msgSend_copyWithZone_(self->_auxiliaryError, v29, (uint64_t)a3);
  v31 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v30;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPResponseOperationResultErrorClient *clientError;
  uint64_t v9;
  CKDPResponseOperationResultErrorServer *serverError;
  uint64_t v11;
  NSString *errorDescription;
  uint64_t v13;
  NSString *errorKey;
  uint64_t v15;
  NSString *errorInternal;
  uint64_t v17;
  CKDPResponseOperationResultErrorExtension *extensionError;
  uint64_t v19;
  CKDPResponseOperationResultErrorAuxiliaryError *auxiliaryError;
  uint64_t v21;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_21;
  clientError = self->_clientError;
  v9 = v4[2];
  if ((unint64_t)clientError | v9)
  {
    if (!objc_msgSend_isEqual_(clientError, v7, v9))
      goto LABEL_21;
  }
  serverError = self->_serverError;
  v11 = v4[8];
  if ((unint64_t)serverError | v11)
  {
    if (!objc_msgSend_isEqual_(serverError, v7, v11))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[9] & 1) == 0 || self->_retryAfterSeconds != *((_DWORD *)v4 + 14))
      goto LABEL_21;
  }
  else if ((v4[9] & 1) != 0)
  {
LABEL_21:
    isEqual = 0;
    goto LABEL_22;
  }
  errorDescription = self->_errorDescription;
  v13 = v4[3];
  if ((unint64_t)errorDescription | v13 && !objc_msgSend_isEqual_(errorDescription, v7, v13))
    goto LABEL_21;
  errorKey = self->_errorKey;
  v15 = v4[5];
  if ((unint64_t)errorKey | v15)
  {
    if (!objc_msgSend_isEqual_(errorKey, v7, v15))
      goto LABEL_21;
  }
  errorInternal = self->_errorInternal;
  v17 = v4[4];
  if ((unint64_t)errorInternal | v17)
  {
    if (!objc_msgSend_isEqual_(errorInternal, v7, v17))
      goto LABEL_21;
  }
  extensionError = self->_extensionError;
  v19 = v4[6];
  if ((unint64_t)extensionError | v19)
  {
    if (!objc_msgSend_isEqual_(extensionError, v7, v19))
      goto LABEL_21;
  }
  auxiliaryError = self->_auxiliaryError;
  v21 = v4[1];
  if ((unint64_t)auxiliaryError | v21)
    isEqual = objc_msgSend_isEqual_(auxiliaryError, v7, v21);
  else
    isEqual = 1;
LABEL_22:

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
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;

  v4 = objc_msgSend_hash(self->_clientError, a2, v2);
  v7 = objc_msgSend_hash(self->_serverError, v5, v6);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v10 = 2654435761 * self->_retryAfterSeconds;
  else
    v10 = 0;
  v11 = v7 ^ v4 ^ v10 ^ objc_msgSend_hash(self->_errorDescription, v8, v9);
  v14 = objc_msgSend_hash(self->_errorKey, v12, v13);
  v17 = v14 ^ objc_msgSend_hash(self->_errorInternal, v15, v16);
  v20 = v11 ^ v17 ^ objc_msgSend_hash(self->_extensionError, v18, v19);
  return v20 ^ objc_msgSend_hash(self->_auxiliaryError, v21, v22);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPResponseOperationResultErrorClient *clientError;
  uint64_t v6;
  CKDPResponseOperationResultErrorServer *serverError;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CKDPResponseOperationResultErrorExtension *extensionError;
  uint64_t v13;
  CKDPResponseOperationResultErrorAuxiliaryError *auxiliaryError;
  uint64_t v15;
  id v16;

  v4 = a3;
  clientError = self->_clientError;
  v6 = *((_QWORD *)v4 + 2);
  v16 = v4;
  if (clientError)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(clientError, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setClientError_(self, (const char *)v4, v6);
  }
  v4 = v16;
LABEL_7:
  serverError = self->_serverError;
  v8 = *((_QWORD *)v4 + 8);
  if (serverError)
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_mergeFrom_(serverError, (const char *)v4, v8);
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_setServerError_(self, (const char *)v4, v8);
  }
  v4 = v16;
LABEL_13:
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    self->_retryAfterSeconds = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
  }
  v9 = *((_QWORD *)v4 + 3);
  if (v9)
  {
    objc_msgSend_setErrorDescription_(self, (const char *)v4, v9);
    v4 = v16;
  }
  v10 = *((_QWORD *)v4 + 5);
  if (v10)
  {
    objc_msgSend_setErrorKey_(self, (const char *)v4, v10);
    v4 = v16;
  }
  v11 = *((_QWORD *)v4 + 4);
  if (v11)
  {
    objc_msgSend_setErrorInternal_(self, (const char *)v4, v11);
    v4 = v16;
  }
  extensionError = self->_extensionError;
  v13 = *((_QWORD *)v4 + 6);
  if (extensionError)
  {
    if (!v13)
      goto LABEL_27;
    objc_msgSend_mergeFrom_(extensionError, (const char *)v4, v13);
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    objc_msgSend_setExtensionError_(self, (const char *)v4, v13);
  }
  v4 = v16;
LABEL_27:
  auxiliaryError = self->_auxiliaryError;
  v15 = *((_QWORD *)v4 + 1);
  if (auxiliaryError)
  {
    if (v15)
    {
      objc_msgSend_mergeFrom_(auxiliaryError, (const char *)v4, v15);
LABEL_32:
      v4 = v16;
    }
  }
  else if (v15)
  {
    objc_msgSend_setAuxiliaryError_(self, (const char *)v4, v15);
    goto LABEL_32;
  }

}

- (CKDPResponseOperationResultErrorClient)clientError
{
  return self->_clientError;
}

- (void)setClientError:(id)a3
{
  objc_storeStrong((id *)&self->_clientError, a3);
}

- (CKDPResponseOperationResultErrorServer)serverError
{
  return self->_serverError;
}

- (void)setServerError:(id)a3
{
  objc_storeStrong((id *)&self->_serverError, a3);
}

- (CKDPResponseOperationResultErrorExtension)extensionError
{
  return self->_extensionError;
}

- (void)setExtensionError:(id)a3
{
  objc_storeStrong((id *)&self->_extensionError, a3);
}

- (CKDPResponseOperationResultErrorAuxiliaryError)auxiliaryError
{
  return self->_auxiliaryError;
}

- (void)setAuxiliaryError:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryError, a3);
}

- (int)retryAfterSeconds
{
  return self->_retryAfterSeconds;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_errorDescription, a3);
}

- (NSString)errorKey
{
  return self->_errorKey;
}

- (void)setErrorKey:(id)a3
{
  objc_storeStrong((id *)&self->_errorKey, a3);
}

- (NSString)errorInternal
{
  return self->_errorInternal;
}

- (void)setErrorInternal:(id)a3
{
  objc_storeStrong((id *)&self->_errorInternal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverError, 0);
  objc_storeStrong((id *)&self->_extensionError, 0);
  objc_storeStrong((id *)&self->_errorKey, 0);
  objc_storeStrong((id *)&self->_errorInternal, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_clientError, 0);
  objc_storeStrong((id *)&self->_auxiliaryError, 0);
}

@end
