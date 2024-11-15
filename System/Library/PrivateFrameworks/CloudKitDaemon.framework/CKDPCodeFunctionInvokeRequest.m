@implementation CKDPCodeFunctionInvokeRequest

+ (id)options
{
  if (qword_1ED7008F0 != -1)
    dispatch_once(&qword_1ED7008F0, &unk_1E7832270);
  return (id)qword_1ED7008E8;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (BOOL)hasFunctionName
{
  return self->_functionName != 0;
}

- (BOOL)hasSerializedParameters
{
  return self->_serializedParameters != 0;
}

- (BOOL)hasProtectedCloudComputeMetadata
{
  return self->_protectedCloudComputeMetadata != 0;
}

- (BOOL)hasAttestationRequest
{
  return self->_attestationRequest != 0;
}

- (BOOL)hasTrustedTargetCryptoMetadata
{
  return self->_trustedTargetCryptoMetadata != 0;
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
  v11.super_class = (Class)CKDPCodeFunctionInvokeRequest;
  -[CKDPCodeFunctionInvokeRequest description](&v11, sel_description);
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
  NSString *serviceName;
  NSString *functionName;
  NSData *serializedParameters;
  CKDPCodeFunctionInvokeRequestProtectedCloudComputeMetadata *protectedCloudComputeMetadata;
  void *v11;
  const char *v12;
  CKDPCodeFunctionInvokeRequestAttestationRequest *attestationRequest;
  void *v14;
  const char *v15;
  CKCDPTrustedTargetCryptoMetadata *trustedTargetCryptoMetadata;
  void *v17;
  const char *v18;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  serviceName = self->_serviceName;
  if (serviceName)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)serviceName, CFSTR("serviceName"));
  functionName = self->_functionName;
  if (functionName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)functionName, CFSTR("functionName"));
  serializedParameters = self->_serializedParameters;
  if (serializedParameters)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)serializedParameters, CFSTR("serializedParameters"));
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  if (protectedCloudComputeMetadata)
  {
    objc_msgSend_dictionaryRepresentation(protectedCloudComputeMetadata, v5, (uint64_t)serializedParameters);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("protectedCloudComputeMetadata"));

  }
  attestationRequest = self->_attestationRequest;
  if (attestationRequest)
  {
    objc_msgSend_dictionaryRepresentation(attestationRequest, v5, (uint64_t)serializedParameters);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("attestationRequest"));

  }
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  if (trustedTargetCryptoMetadata)
  {
    objc_msgSend_dictionaryRepresentation(trustedTargetCryptoMetadata, v5, (uint64_t)serializedParameters);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, CFSTR("trustedTargetCryptoMetadata"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA9520C((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_serviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_functionName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_serializedParameters)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_protectedCloudComputeMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_attestationRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_trustedTargetCryptoMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (unsigned)requestTypeCode
{
  return 71;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *serviceName;
  NSString *functionName;
  NSData *serializedParameters;
  CKDPCodeFunctionInvokeRequestProtectedCloudComputeMetadata *protectedCloudComputeMetadata;
  CKDPCodeFunctionInvokeRequestAttestationRequest *attestationRequest;
  CKCDPTrustedTargetCryptoMetadata *trustedTargetCryptoMetadata;
  id v12;

  v4 = a3;
  serviceName = self->_serviceName;
  v12 = v4;
  if (serviceName)
  {
    objc_msgSend_setServiceName_(v4, v5, (uint64_t)serviceName);
    v4 = v12;
  }
  functionName = self->_functionName;
  if (functionName)
  {
    objc_msgSend_setFunctionName_(v12, v5, (uint64_t)functionName);
    v4 = v12;
  }
  serializedParameters = self->_serializedParameters;
  if (serializedParameters)
  {
    objc_msgSend_setSerializedParameters_(v12, v5, (uint64_t)serializedParameters);
    v4 = v12;
  }
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  if (protectedCloudComputeMetadata)
  {
    objc_msgSend_setProtectedCloudComputeMetadata_(v12, v5, (uint64_t)protectedCloudComputeMetadata);
    v4 = v12;
  }
  attestationRequest = self->_attestationRequest;
  if (attestationRequest)
  {
    objc_msgSend_setAttestationRequest_(v12, v5, (uint64_t)attestationRequest);
    v4 = v12;
  }
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  if (trustedTargetCryptoMetadata)
  {
    objc_msgSend_setTrustedTargetCryptoMetadata_(v12, v5, (uint64_t)trustedTargetCryptoMetadata);
    v4 = v12;
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
  const char *v26;
  uint64_t v27;
  void *v28;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_serviceName, v11, (uint64_t)a3);
  v13 = (void *)v10[5];
  v10[5] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_functionName, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_serializedParameters, v17, (uint64_t)a3);
  v19 = (void *)v10[4];
  v10[4] = v18;

  v21 = objc_msgSend_copyWithZone_(self->_protectedCloudComputeMetadata, v20, (uint64_t)a3);
  v22 = (void *)v10[3];
  v10[3] = v21;

  v24 = objc_msgSend_copyWithZone_(self->_attestationRequest, v23, (uint64_t)a3);
  v25 = (void *)v10[1];
  v10[1] = v24;

  v27 = objc_msgSend_copyWithZone_(self->_trustedTargetCryptoMetadata, v26, (uint64_t)a3);
  v28 = (void *)v10[6];
  v10[6] = v27;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *serviceName;
  uint64_t v9;
  NSString *functionName;
  uint64_t v11;
  NSData *serializedParameters;
  uint64_t v13;
  CKDPCodeFunctionInvokeRequestProtectedCloudComputeMetadata *protectedCloudComputeMetadata;
  uint64_t v15;
  CKDPCodeFunctionInvokeRequestAttestationRequest *attestationRequest;
  uint64_t v17;
  CKCDPTrustedTargetCryptoMetadata *trustedTargetCryptoMetadata;
  uint64_t v19;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_14;
  serviceName = self->_serviceName;
  v9 = v4[5];
  if ((unint64_t)serviceName | v9)
  {
    if (!objc_msgSend_isEqual_(serviceName, v7, v9))
      goto LABEL_14;
  }
  functionName = self->_functionName;
  v11 = v4[2];
  if ((unint64_t)functionName | v11)
  {
    if (!objc_msgSend_isEqual_(functionName, v7, v11))
      goto LABEL_14;
  }
  if (((serializedParameters = self->_serializedParameters, v13 = v4[4],
                                                             !((unint64_t)serializedParameters | v13))
     || objc_msgSend_isEqual_(serializedParameters, v7, v13))
    && ((protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata,
         v15 = v4[3],
         !((unint64_t)protectedCloudComputeMetadata | v15))
     || objc_msgSend_isEqual_(protectedCloudComputeMetadata, v7, v15))
    && ((attestationRequest = self->_attestationRequest, v17 = v4[1], !((unint64_t)attestationRequest | v17))
     || objc_msgSend_isEqual_(attestationRequest, v7, v17)))
  {
    trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
    v19 = v4[6];
    if ((unint64_t)trustedTargetCryptoMetadata | v19)
      isEqual = objc_msgSend_isEqual_(trustedTargetCryptoMetadata, v7, v19);
    else
      isEqual = 1;
  }
  else
  {
LABEL_14:
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
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v4 = objc_msgSend_hash(self->_serviceName, a2, v2);
  v7 = objc_msgSend_hash(self->_functionName, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_serializedParameters, v8, v9);
  v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_protectedCloudComputeMetadata, v11, v12);
  v16 = objc_msgSend_hash(self->_attestationRequest, v14, v15);
  return v13 ^ v16 ^ objc_msgSend_hash(self->_trustedTargetCryptoMetadata, v17, v18);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CKDPCodeFunctionInvokeRequestProtectedCloudComputeMetadata *protectedCloudComputeMetadata;
  uint64_t v9;
  CKDPCodeFunctionInvokeRequestAttestationRequest *attestationRequest;
  uint64_t v11;
  CKCDPTrustedTargetCryptoMetadata *trustedTargetCryptoMetadata;
  uint64_t v13;
  char *v14;

  v14 = (char *)a3;
  v5 = *((_QWORD *)v14 + 5);
  if (v5)
    objc_msgSend_setServiceName_(self, v4, v5);
  v6 = *((_QWORD *)v14 + 2);
  if (v6)
    objc_msgSend_setFunctionName_(self, v4, v6);
  v7 = *((_QWORD *)v14 + 4);
  if (v7)
    objc_msgSend_setSerializedParameters_(self, v4, v7);
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  v9 = *((_QWORD *)v14 + 3);
  if (protectedCloudComputeMetadata)
  {
    if (v9)
      objc_msgSend_mergeFrom_(protectedCloudComputeMetadata, v14, v9);
  }
  else if (v9)
  {
    objc_msgSend_setProtectedCloudComputeMetadata_(self, v14, v9);
  }
  attestationRequest = self->_attestationRequest;
  v11 = *((_QWORD *)v14 + 1);
  if (attestationRequest)
  {
    if (v11)
      objc_msgSend_mergeFrom_(attestationRequest, v14, v11);
  }
  else if (v11)
  {
    objc_msgSend_setAttestationRequest_(self, v14, v11);
  }
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  v13 = *((_QWORD *)v14 + 6);
  if (trustedTargetCryptoMetadata)
  {
    if (v13)
      objc_msgSend_mergeFrom_(trustedTargetCryptoMetadata, v14, v13);
  }
  else if (v13)
  {
    objc_msgSend_setTrustedTargetCryptoMetadata_(self, v14, v13);
  }

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
  objc_storeStrong((id *)&self->_functionName, a3);
}

- (NSData)serializedParameters
{
  return self->_serializedParameters;
}

- (void)setSerializedParameters:(id)a3
{
  objc_storeStrong((id *)&self->_serializedParameters, a3);
}

- (CKDPCodeFunctionInvokeRequestProtectedCloudComputeMetadata)protectedCloudComputeMetadata
{
  return self->_protectedCloudComputeMetadata;
}

- (void)setProtectedCloudComputeMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_protectedCloudComputeMetadata, a3);
}

- (CKDPCodeFunctionInvokeRequestAttestationRequest)attestationRequest
{
  return self->_attestationRequest;
}

- (void)setAttestationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_attestationRequest, a3);
}

- (CKCDPTrustedTargetCryptoMetadata)trustedTargetCryptoMetadata
{
  return self->_trustedTargetCryptoMetadata;
}

- (void)setTrustedTargetCryptoMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_trustedTargetCryptoMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedTargetCryptoMetadata, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_protectedCloudComputeMetadata, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_attestationRequest, 0);
}

@end
