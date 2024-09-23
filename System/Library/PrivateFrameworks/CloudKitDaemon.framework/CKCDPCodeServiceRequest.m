@implementation CKCDPCodeServiceRequest

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

- (int)serializationFormat
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_serializationFormat;
  else
    return 1;
}

- (void)setSerializationFormat:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_serializationFormat = a3;
}

- (void)setHasSerializationFormat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSerializationFormat
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)serializationFormatAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("PROTO");
  if (a3 == 2)
  {
    v3 = CFSTR("JSON");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSerializationFormat:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("PROTO")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("JSON")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (void)clearClientConfigs
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_clientConfigs, a2, v2);
}

- (void)addClientConfig:(id)a3
{
  const char *v4;
  NSMutableArray *clientConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  clientConfigs = self->_clientConfigs;
  v8 = (char *)v4;
  if (!clientConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_clientConfigs;
    self->_clientConfigs = v6;

    v4 = v8;
    clientConfigs = self->_clientConfigs;
  }
  objc_msgSend_addObject_(clientConfigs, v4, (uint64_t)v4);

}

- (unint64_t)clientConfigsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_clientConfigs, a2, v2);
}

- (id)clientConfigAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_clientConfigs, a2, a3);
}

+ (Class)clientConfigType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAccountConfig
{
  return self->_accountConfig != 0;
}

- (BOOL)hasRequestContext
{
  return self->_requestContext != 0;
}

- (BOOL)hasAssetAuthorizeGetRequestOptions
{
  return self->_assetAuthorizeGetRequestOptions != 0;
}

- (BOOL)hasAttestationRequest
{
  return self->_attestationRequest != 0;
}

- (BOOL)hasAuthInformation
{
  return self->_authInformation != 0;
}

- (BOOL)hasProtectedCloudComputeMetadata
{
  return self->_protectedCloudComputeMetadata != 0;
}

- (void)setProtectedCloudComputeMetadata:(id)a3
{
  CKCDPCodeServiceRequestProtectedCloudComputeMetadata *v4;
  const char *v5;
  uint64_t v6;
  CKCDPCodeServiceRequestProtectedCloudComputeMetadata *protectedCloudComputeMetadata;

  v4 = (CKCDPCodeServiceRequestProtectedCloudComputeMetadata *)a3;
  objc_msgSend_clearOneofValuesForDataProtection(self, v5, v6);
  *(_BYTE *)&self->_has |= 1u;
  self->_dataProtection = 1;
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  self->_protectedCloudComputeMetadata = v4;

}

- (BOOL)hasTrustedTargetCryptoMetadata
{
  return self->_trustedTargetCryptoMetadata != 0;
}

- (void)setTrustedTargetCryptoMetadata:(id)a3
{
  CKCDPTrustedTargetCryptoMetadata *v4;
  const char *v5;
  uint64_t v6;
  CKCDPTrustedTargetCryptoMetadata *trustedTargetCryptoMetadata;

  v4 = (CKCDPTrustedTargetCryptoMetadata *)a3;
  objc_msgSend_clearOneofValuesForDataProtection(self, v5, v6);
  *(_BYTE *)&self->_has |= 1u;
  self->_dataProtection = 2;
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  self->_trustedTargetCryptoMetadata = v4;

}

- (int)dataProtection
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_dataProtection;
  else
    return 0;
}

- (void)setDataProtection:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dataProtection = a3;
}

- (void)setHasDataProtection:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataProtection
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)dataProtectionAsString:(int)a3
{
  if (a3 < 3)
    return off_1E78386D0[a3];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDataProtection:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("PBUNSET")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("protectedCloudComputeMetadata")) & 1) != 0)
  {
    v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("trustedTargetCryptoMetadata")))
  {
    v6 = 2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)clearOneofValuesForDataProtection
{
  CKCDPCodeServiceRequestProtectedCloudComputeMetadata *protectedCloudComputeMetadata;
  CKCDPTrustedTargetCryptoMetadata *trustedTargetCryptoMetadata;

  *(_BYTE *)&self->_has &= ~1u;
  self->_dataProtection = 0;
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  self->_protectedCloudComputeMetadata = 0;

  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  self->_trustedTargetCryptoMetadata = 0;

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
  v11.super_class = (Class)CKCDPCodeServiceRequest;
  -[CKCDPCodeServiceRequest description](&v11, sel_description);
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
  int serializationFormat;
  __CFString *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  NSMutableArray *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  const char *v30;
  const char *v31;
  CKCDPCodeServiceRequestAccountConfig *accountConfig;
  void *v33;
  const char *v34;
  CKCDPCodeServiceRequestRequestContext *requestContext;
  void *v36;
  const char *v37;
  CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions *assetAuthorizeGetRequestOptions;
  void *v39;
  const char *v40;
  CKCDPCodeServiceRequestAttestationRequest *attestationRequest;
  void *v42;
  const char *v43;
  CKCDPCodeServiceRequestAuthInformation *authInformation;
  void *v45;
  const char *v46;
  CKCDPCodeServiceRequestProtectedCloudComputeMetadata *protectedCloudComputeMetadata;
  void *v48;
  const char *v49;
  CKCDPTrustedTargetCryptoMetadata *trustedTargetCryptoMetadata;
  void *v51;
  const char *v52;
  uint64_t dataProtection;
  __CFString *v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    serializationFormat = self->_serializationFormat;
    if (serializationFormat == 1)
    {
      v11 = CFSTR("PROTO");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("PROTO"), CFSTR("serializationFormat"));
    }
    else if (serializationFormat == 2)
    {
      v11 = CFSTR("JSON");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("JSON"), CFSTR("serializationFormat"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_serializationFormat);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("serializationFormat"));
    }

  }
  if (objc_msgSend_count(self->_clientConfigs, v5, (uint64_t)serializedParameters))
  {
    v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v18 = objc_msgSend_count(self->_clientConfigs, v16, v17);
    v20 = (void *)objc_msgSend_initWithCapacity_(v15, v19, v18);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v21 = self->_clientConfigs;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v56, v60, 16);
    if (v23)
    {
      v26 = v23;
      v27 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v57 != v27)
            objc_enumerationMutation(v21);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v56 + 1) + 8 * i), v24, v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v20, v30, (uint64_t)v29);

        }
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v56, v60, 16);
      }
      while (v26);
    }

    objc_msgSend_setObject_forKey_(v6, v31, (uint64_t)v20, CFSTR("clientConfig"));
  }
  accountConfig = self->_accountConfig;
  if (accountConfig)
  {
    objc_msgSend_dictionaryRepresentation(accountConfig, v13, v14);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v34, (uint64_t)v33, CFSTR("accountConfig"));

  }
  requestContext = self->_requestContext;
  if (requestContext)
  {
    objc_msgSend_dictionaryRepresentation(requestContext, v13, v14);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v37, (uint64_t)v36, CFSTR("requestContext"));

  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  if (assetAuthorizeGetRequestOptions)
  {
    objc_msgSend_dictionaryRepresentation(assetAuthorizeGetRequestOptions, v13, v14);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v40, (uint64_t)v39, CFSTR("assetAuthorizeGetRequestOptions"));

  }
  attestationRequest = self->_attestationRequest;
  if (attestationRequest)
  {
    objc_msgSend_dictionaryRepresentation(attestationRequest, v13, v14);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v43, (uint64_t)v42, CFSTR("attestationRequest"));

  }
  authInformation = self->_authInformation;
  if (authInformation)
  {
    objc_msgSend_dictionaryRepresentation(authInformation, v13, v14);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v46, (uint64_t)v45, CFSTR("authInformation"));

  }
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  if (protectedCloudComputeMetadata)
  {
    objc_msgSend_dictionaryRepresentation(protectedCloudComputeMetadata, v13, v14);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v49, (uint64_t)v48, CFSTR("protectedCloudComputeMetadata"));

  }
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  if (trustedTargetCryptoMetadata)
  {
    objc_msgSend_dictionaryRepresentation(trustedTargetCryptoMetadata, v13, v14);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v52, (uint64_t)v51, CFSTR("trustedTargetCryptoMetadata"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    dataProtection = self->_dataProtection;
    if (dataProtection >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v13, (uint64_t)CFSTR("(unknown: %i)"), self->_dataProtection);
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v54 = off_1E78386D0[dataProtection];
    }
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v54, CFSTR("DataProtection"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v17;
  const char *v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v24;
  int v26;
  objc_class *v27;
  uint64_t v28;
  void *v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  CKCDPCodeServiceRequestClientConfig *v36;
  const char *v37;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    while (!*((_BYTE *)a3 + *v6))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      v17 = v11 & 7;
      if (v16 || (_DWORD)v17 == 4)
        break;
      v19 = (const char *)(v11 >> 3);
      switch((v11 >> 3))
      {
        case 0u:
          v20 = 0;
          do
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
              goto LABEL_63;
            }
            v23 = v22 + 1;
            v24 = *(char *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v23;
            if ((v24 & 0x80000000) == 0)
              break;
          }
          while (v20++ <= 8);
          goto LABEL_63;
        case 4u:
          PBReaderReadString();
          v27 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v28 = 96;
          goto LABEL_31;
        case 5u:
          PBReaderReadString();
          v27 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v28 = 56;
          goto LABEL_31;
        case 6u:
          PBReaderReadData();
          v27 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v28 = 88;
LABEL_31:
          v29 = *(Class *)((char *)&self->super.super.super.isa + v28);
          *(Class *)((char *)&self->super.super.super.isa + v28) = v27;

          goto LABEL_63;
        case 8u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v33 = *v4;
            v34 = *(_QWORD *)((char *)a3 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v34);
              *(_QWORD *)((char *)a3 + v33) = v34 + 1;
              v32 |= (unint64_t)(v35 & 0x7F) << v30;
              if (v35 < 0)
              {
                v30 += 7;
                v15 = v31++ >= 9;
                if (v15)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v32) = 0;
LABEL_69:
          self->_serializationFormat = v32;
          goto LABEL_63;
        case 9u:
          v36 = objc_alloc_init(CKCDPCodeServiceRequestClientConfig);
          objc_msgSend_addClientConfig_(self, v37, (uint64_t)v36);
          if (!PBReaderPlaceMark() || (sub_1BEC5AD44((uint64_t)v36, (uint64_t)a3) & 1) == 0)
            goto LABEL_71;
          goto LABEL_62;
        case 0xAu:
          v36 = objc_alloc_init(CKCDPCodeServiceRequestAccountConfig);
          objc_storeStrong((id *)&self->_accountConfig, v36);
          if (!PBReaderPlaceMark() || (sub_1BEAB4228((uint64_t)v36, (uint64_t)a3) & 1) == 0)
            goto LABEL_71;
          goto LABEL_62;
        case 0xBu:
          v36 = objc_alloc_init(CKCDPCodeServiceRequestRequestContext);
          objc_storeStrong((id *)&self->_requestContext, v36);
          if (!PBReaderPlaceMark() || (sub_1BEC757D0((uint64_t)v36, (uint64_t)a3) & 1) == 0)
            goto LABEL_71;
          goto LABEL_62;
        case 0xCu:
          v36 = objc_alloc_init(CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions);
          objc_storeStrong((id *)&self->_assetAuthorizeGetRequestOptions, v36);
          if (!PBReaderPlaceMark() || (sub_1BEBD2A8C((uint64_t)v36, (uint64_t)a3) & 1) == 0)
            goto LABEL_71;
          goto LABEL_62;
        case 0xDu:
          objc_msgSend_clearOneofValuesForDataProtection(self, v19, v17);
          *(_BYTE *)&self->_has |= 1u;
          self->_dataProtection = 1;
          v36 = objc_alloc_init(CKCDPCodeServiceRequestProtectedCloudComputeMetadata);
          objc_storeStrong((id *)&self->_protectedCloudComputeMetadata, v36);
          if (!PBReaderPlaceMark() || (sub_1BEAA8C9C(v36, (uint64_t)a3) & 1) == 0)
            goto LABEL_71;
          goto LABEL_62;
        case 0xFu:
          v36 = objc_alloc_init(CKCDPCodeServiceRequestAttestationRequest);
          objc_storeStrong((id *)&self->_attestationRequest, v36);
          if (!PBReaderPlaceMark() || (sub_1BEA96EB8((uint64_t)v36, (uint64_t)a3) & 1) == 0)
            goto LABEL_71;
          goto LABEL_62;
        case 0x10u:
          objc_msgSend_clearOneofValuesForDataProtection(self, v19, v17);
          *(_BYTE *)&self->_has |= 1u;
          self->_dataProtection = 2;
          v36 = objc_alloc_init(CKCDPTrustedTargetCryptoMetadata);
          objc_storeStrong((id *)&self->_trustedTargetCryptoMetadata, v36);
          if (!PBReaderPlaceMark() || (sub_1BEC444E8((uint64_t)v36, (uint64_t)a3) & 1) == 0)
            goto LABEL_71;
          goto LABEL_62;
        case 0x11u:
          v36 = objc_alloc_init(CKCDPCodeServiceRequestAuthInformation);
          objc_storeStrong((id *)&self->_authInformation, v36);
          if (!PBReaderPlaceMark() || (sub_1BEB6A9AC((uint64_t)v36, (uint64_t)a3) & 1) == 0)
          {
LABEL_71:

            LOBYTE(v26) = 0;
            return v26;
          }
LABEL_62:
          PBReaderRecallMark();

LABEL_63:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_70;
          break;
        default:
          v26 = PBReaderSkipValueWithTag();
          if (!v26)
            return v26;
          goto LABEL_63;
      }
    }
  }
LABEL_70:
  LOBYTE(v26) = *((_BYTE *)a3 + *v6) == 0;
  return v26;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_serviceName)
    PBDataWriterWriteStringField();
  if (self->_functionName)
    PBDataWriterWriteStringField();
  if (self->_serializedParameters)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_clientConfigs;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

  if (self->_accountConfig)
    PBDataWriterWriteSubmessage();
  if (self->_requestContext)
    PBDataWriterWriteSubmessage();
  if (self->_assetAuthorizeGetRequestOptions)
    PBDataWriterWriteSubmessage();
  if (self->_protectedCloudComputeMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_attestationRequest)
    PBDataWriterWriteSubmessage();
  if (self->_trustedTargetCryptoMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_authInformation)
    PBDataWriterWriteSubmessage();

}

- (unsigned)requestTypeCode
{
  return 85;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  NSString *serviceName;
  NSString *functionName;
  NSData *serializedParameters;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  CKCDPCodeServiceRequestAccountConfig *accountConfig;
  CKCDPCodeServiceRequestRequestContext *requestContext;
  void *v20;
  CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions *assetAuthorizeGetRequestOptions;
  CKCDPCodeServiceRequestProtectedCloudComputeMetadata *protectedCloudComputeMetadata;
  CKCDPCodeServiceRequestAttestationRequest *attestationRequest;
  CKCDPTrustedTargetCryptoMetadata *trustedTargetCryptoMetadata;
  CKCDPCodeServiceRequestAuthInformation *authInformation;
  _DWORD *v26;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[12] = self->_dataProtection;
    *((_BYTE *)v4 + 112) |= 1u;
  }
  serviceName = self->_serviceName;
  v26 = v4;
  if (serviceName)
  {
    objc_msgSend_setServiceName_(v4, v5, (uint64_t)serviceName);
    v4 = v26;
  }
  functionName = self->_functionName;
  if (functionName)
  {
    objc_msgSend_setFunctionName_(v26, v5, (uint64_t)functionName);
    v4 = v26;
  }
  serializedParameters = self->_serializedParameters;
  if (serializedParameters)
  {
    objc_msgSend_setSerializedParameters_(v26, v5, (uint64_t)serializedParameters);
    v4 = v26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[20] = self->_serializationFormat;
    *((_BYTE *)v4 + 112) |= 2u;
  }
  if (objc_msgSend_clientConfigsCount(self, v5, (uint64_t)serializedParameters))
  {
    objc_msgSend_clearClientConfigs(v26, v9, v10);
    v13 = objc_msgSend_clientConfigsCount(self, v11, v12);
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend_clientConfigAtIndex_(self, v9, i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addClientConfig_(v26, v17, (uint64_t)v16);

      }
    }
  }
  accountConfig = self->_accountConfig;
  if (accountConfig)
    objc_msgSend_setAccountConfig_(v26, v9, (uint64_t)accountConfig);
  requestContext = self->_requestContext;
  v20 = v26;
  if (requestContext)
  {
    objc_msgSend_setRequestContext_(v26, v9, (uint64_t)requestContext);
    v20 = v26;
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  if (assetAuthorizeGetRequestOptions)
  {
    objc_msgSend_setAssetAuthorizeGetRequestOptions_(v26, v9, (uint64_t)assetAuthorizeGetRequestOptions);
    v20 = v26;
  }
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  if (protectedCloudComputeMetadata)
  {
    objc_msgSend_setProtectedCloudComputeMetadata_(v26, v9, (uint64_t)protectedCloudComputeMetadata);
    v20 = v26;
  }
  attestationRequest = self->_attestationRequest;
  if (attestationRequest)
  {
    objc_msgSend_setAttestationRequest_(v26, v9, (uint64_t)attestationRequest);
    v20 = v26;
  }
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  if (trustedTargetCryptoMetadata)
  {
    objc_msgSend_setTrustedTargetCryptoMetadata_(v26, v9, (uint64_t)trustedTargetCryptoMetadata);
    v20 = v26;
  }
  authInformation = self->_authInformation;
  if (authInformation)
  {
    objc_msgSend_setAuthInformation_(v26, v9, (uint64_t)authInformation);
    v20 = v26;
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
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 48) = self->_dataProtection;
    *(_BYTE *)(v10 + 112) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_serviceName, v11, (uint64_t)a3);
  v14 = *(void **)(v12 + 96);
  *(_QWORD *)(v12 + 96) = v13;

  v16 = objc_msgSend_copyWithZone_(self->_functionName, v15, (uint64_t)a3);
  v17 = *(void **)(v12 + 56);
  *(_QWORD *)(v12 + 56) = v16;

  v19 = objc_msgSend_copyWithZone_(self->_serializedParameters, v18, (uint64_t)a3);
  v20 = *(void **)(v12 + 88);
  *(_QWORD *)(v12 + 88) = v19;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v12 + 80) = self->_serializationFormat;
    *(_BYTE *)(v12 + 112) |= 2u;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v21 = self->_clientConfigs;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v52, v56, 16);
  if (v23)
  {
    v25 = v23;
    v26 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v53 != v26)
          objc_enumerationMutation(v21);
        v28 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v52 + 1) + 8 * i), v24, (uint64_t)a3, (_QWORD)v52);
        objc_msgSend_addClientConfig_((void *)v12, v29, (uint64_t)v28);

      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v52, v56, 16);
    }
    while (v25);
  }

  v31 = objc_msgSend_copyWithZone_(self->_accountConfig, v30, (uint64_t)a3);
  v32 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v31;

  v34 = objc_msgSend_copyWithZone_(self->_requestContext, v33, (uint64_t)a3);
  v35 = *(void **)(v12 + 72);
  *(_QWORD *)(v12 + 72) = v34;

  v37 = objc_msgSend_copyWithZone_(self->_assetAuthorizeGetRequestOptions, v36, (uint64_t)a3);
  v38 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v37;

  v40 = objc_msgSend_copyWithZone_(self->_protectedCloudComputeMetadata, v39, (uint64_t)a3);
  v41 = *(void **)(v12 + 64);
  *(_QWORD *)(v12 + 64) = v40;

  v43 = objc_msgSend_copyWithZone_(self->_attestationRequest, v42, (uint64_t)a3);
  v44 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v43;

  v46 = objc_msgSend_copyWithZone_(self->_trustedTargetCryptoMetadata, v45, (uint64_t)a3);
  v47 = *(void **)(v12 + 104);
  *(_QWORD *)(v12 + 104) = v46;

  v49 = objc_msgSend_copyWithZone_(self->_authInformation, v48, (uint64_t)a3);
  v50 = *(void **)(v12 + 32);
  *(_QWORD *)(v12 + 32) = v49;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *serviceName;
  uint64_t v9;
  NSString *functionName;
  uint64_t v11;
  NSData *serializedParameters;
  uint64_t v13;
  NSMutableArray *clientConfigs;
  uint64_t v15;
  CKCDPCodeServiceRequestAccountConfig *accountConfig;
  uint64_t v17;
  CKCDPCodeServiceRequestRequestContext *requestContext;
  uint64_t v19;
  CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions *assetAuthorizeGetRequestOptions;
  uint64_t v21;
  CKCDPCodeServiceRequestProtectedCloudComputeMetadata *protectedCloudComputeMetadata;
  uint64_t v23;
  CKCDPCodeServiceRequestAttestationRequest *attestationRequest;
  uint64_t v25;
  CKCDPTrustedTargetCryptoMetadata *trustedTargetCryptoMetadata;
  uint64_t v27;
  CKCDPCodeServiceRequestAuthInformation *authInformation;
  uint64_t v29;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_34;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[14] & 1) == 0 || self->_dataProtection != *((_DWORD *)v4 + 12))
      goto LABEL_34;
  }
  else if ((v4[14] & 1) != 0)
  {
LABEL_34:
    isEqual = 0;
    goto LABEL_35;
  }
  serviceName = self->_serviceName;
  v9 = v4[12];
  if ((unint64_t)serviceName | v9 && !objc_msgSend_isEqual_(serviceName, v7, v9))
    goto LABEL_34;
  functionName = self->_functionName;
  v11 = v4[7];
  if ((unint64_t)functionName | v11)
  {
    if (!objc_msgSend_isEqual_(functionName, v7, v11))
      goto LABEL_34;
  }
  serializedParameters = self->_serializedParameters;
  v13 = v4[11];
  if ((unint64_t)serializedParameters | v13)
  {
    if (!objc_msgSend_isEqual_(serializedParameters, v7, v13))
      goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[14] & 2) == 0 || self->_serializationFormat != *((_DWORD *)v4 + 20))
      goto LABEL_34;
  }
  else if ((v4[14] & 2) != 0)
  {
    goto LABEL_34;
  }
  clientConfigs = self->_clientConfigs;
  v15 = v4[5];
  if ((unint64_t)clientConfigs | v15 && !objc_msgSend_isEqual_(clientConfigs, v7, v15))
    goto LABEL_34;
  accountConfig = self->_accountConfig;
  v17 = v4[1];
  if ((unint64_t)accountConfig | v17)
  {
    if (!objc_msgSend_isEqual_(accountConfig, v7, v17))
      goto LABEL_34;
  }
  requestContext = self->_requestContext;
  v19 = v4[9];
  if ((unint64_t)requestContext | v19)
  {
    if (!objc_msgSend_isEqual_(requestContext, v7, v19))
      goto LABEL_34;
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  v21 = v4[2];
  if ((unint64_t)assetAuthorizeGetRequestOptions | v21)
  {
    if (!objc_msgSend_isEqual_(assetAuthorizeGetRequestOptions, v7, v21))
      goto LABEL_34;
  }
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  v23 = v4[8];
  if ((unint64_t)protectedCloudComputeMetadata | v23)
  {
    if (!objc_msgSend_isEqual_(protectedCloudComputeMetadata, v7, v23))
      goto LABEL_34;
  }
  attestationRequest = self->_attestationRequest;
  v25 = v4[3];
  if ((unint64_t)attestationRequest | v25)
  {
    if (!objc_msgSend_isEqual_(attestationRequest, v7, v25))
      goto LABEL_34;
  }
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  v27 = v4[13];
  if ((unint64_t)trustedTargetCryptoMetadata | v27)
  {
    if (!objc_msgSend_isEqual_(trustedTargetCryptoMetadata, v7, v27))
      goto LABEL_34;
  }
  authInformation = self->_authInformation;
  v29 = v4[4];
  if ((unint64_t)authInformation | v29)
    isEqual = objc_msgSend_isEqual_(authInformation, v7, v29);
  else
    isEqual = 1;
LABEL_35:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_dataProtection;
  else
    v4 = 0;
  v5 = objc_msgSend_hash(self->_serviceName, a2, v2);
  v8 = objc_msgSend_hash(self->_functionName, v6, v7);
  v11 = objc_msgSend_hash(self->_serializedParameters, v9, v10);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v14 = 2654435761 * self->_serializationFormat;
  else
    v14 = 0;
  v15 = v5 ^ v4 ^ v8 ^ v11;
  v16 = v14 ^ objc_msgSend_hash(self->_clientConfigs, v12, v13);
  v19 = v15 ^ v16 ^ objc_msgSend_hash(self->_accountConfig, v17, v18);
  v22 = objc_msgSend_hash(self->_requestContext, v20, v21);
  v25 = v22 ^ objc_msgSend_hash(self->_assetAuthorizeGetRequestOptions, v23, v24);
  v28 = v25 ^ objc_msgSend_hash(self->_protectedCloudComputeMetadata, v26, v27);
  v31 = v19 ^ v28 ^ objc_msgSend_hash(self->_attestationRequest, v29, v30);
  v34 = objc_msgSend_hash(self->_trustedTargetCryptoMetadata, v32, v33);
  return v31 ^ v34 ^ objc_msgSend_hash(self->_authInformation, v35, v36);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  const char *v17;
  CKCDPCodeServiceRequestAccountConfig *accountConfig;
  uint64_t v19;
  CKCDPCodeServiceRequestRequestContext *requestContext;
  uint64_t v21;
  CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions *assetAuthorizeGetRequestOptions;
  uint64_t v23;
  CKCDPCodeServiceRequestProtectedCloudComputeMetadata *protectedCloudComputeMetadata;
  uint64_t v25;
  CKCDPCodeServiceRequestAttestationRequest *attestationRequest;
  uint64_t v27;
  CKCDPTrustedTargetCryptoMetadata *trustedTargetCryptoMetadata;
  uint64_t v29;
  CKCDPCodeServiceRequestAuthInformation *authInformation;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6 = v4;
  if ((*((_BYTE *)v4 + 112) & 1) != 0)
  {
    self->_dataProtection = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = *((_QWORD *)v4 + 12);
  if (v7)
    objc_msgSend_setServiceName_(self, v5, v7);
  v8 = *((_QWORD *)v6 + 7);
  if (v8)
    objc_msgSend_setFunctionName_(self, v5, v8);
  v9 = *((_QWORD *)v6 + 11);
  if (v9)
    objc_msgSend_setSerializedParameters_(self, v5, v9);
  if ((*((_BYTE *)v6 + 112) & 2) != 0)
  {
    self->_serializationFormat = *((_DWORD *)v6 + 20);
    *(_BYTE *)&self->_has |= 2u;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = *((id *)v6 + 5);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v32, v36, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v10);
        objc_msgSend_addClientConfig_(self, v13, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), (_QWORD)v32);
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v32, v36, 16);
    }
    while (v14);
  }

  accountConfig = self->_accountConfig;
  v19 = *((_QWORD *)v6 + 1);
  if (accountConfig)
  {
    if (v19)
      objc_msgSend_mergeFrom_(accountConfig, v17, v19);
  }
  else if (v19)
  {
    objc_msgSend_setAccountConfig_(self, v17, v19);
  }
  requestContext = self->_requestContext;
  v21 = *((_QWORD *)v6 + 9);
  if (requestContext)
  {
    if (v21)
      objc_msgSend_mergeFrom_(requestContext, v17, v21);
  }
  else if (v21)
  {
    objc_msgSend_setRequestContext_(self, v17, v21);
  }
  assetAuthorizeGetRequestOptions = self->_assetAuthorizeGetRequestOptions;
  v23 = *((_QWORD *)v6 + 2);
  if (assetAuthorizeGetRequestOptions)
  {
    if (v23)
      objc_msgSend_mergeFrom_(assetAuthorizeGetRequestOptions, v17, v23);
  }
  else if (v23)
  {
    objc_msgSend_setAssetAuthorizeGetRequestOptions_(self, v17, v23);
  }
  protectedCloudComputeMetadata = self->_protectedCloudComputeMetadata;
  v25 = *((_QWORD *)v6 + 8);
  if (protectedCloudComputeMetadata)
  {
    if (v25)
      objc_msgSend_mergeFrom_(protectedCloudComputeMetadata, v17, v25);
  }
  else if (v25)
  {
    objc_msgSend_setProtectedCloudComputeMetadata_(self, v17, v25);
  }
  attestationRequest = self->_attestationRequest;
  v27 = *((_QWORD *)v6 + 3);
  if (attestationRequest)
  {
    if (v27)
      objc_msgSend_mergeFrom_(attestationRequest, v17, v27);
  }
  else if (v27)
  {
    objc_msgSend_setAttestationRequest_(self, v17, v27);
  }
  trustedTargetCryptoMetadata = self->_trustedTargetCryptoMetadata;
  v29 = *((_QWORD *)v6 + 13);
  if (trustedTargetCryptoMetadata)
  {
    if (v29)
      objc_msgSend_mergeFrom_(trustedTargetCryptoMetadata, v17, v29);
  }
  else if (v29)
  {
    objc_msgSend_setTrustedTargetCryptoMetadata_(self, v17, v29);
  }
  authInformation = self->_authInformation;
  v31 = *((_QWORD *)v6 + 4);
  if (authInformation)
  {
    if (v31)
      objc_msgSend_mergeFrom_(authInformation, v17, v31);
  }
  else if (v31)
  {
    objc_msgSend_setAuthInformation_(self, v17, v31);
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

- (NSMutableArray)clientConfigs
{
  return self->_clientConfigs;
}

- (void)setClientConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_clientConfigs, a3);
}

- (CKCDPCodeServiceRequestAccountConfig)accountConfig
{
  return self->_accountConfig;
}

- (void)setAccountConfig:(id)a3
{
  objc_storeStrong((id *)&self->_accountConfig, a3);
}

- (CKCDPCodeServiceRequestRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_requestContext, a3);
}

- (CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions)assetAuthorizeGetRequestOptions
{
  return self->_assetAuthorizeGetRequestOptions;
}

- (void)setAssetAuthorizeGetRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_assetAuthorizeGetRequestOptions, a3);
}

- (CKCDPCodeServiceRequestAttestationRequest)attestationRequest
{
  return self->_attestationRequest;
}

- (void)setAttestationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_attestationRequest, a3);
}

- (CKCDPCodeServiceRequestAuthInformation)authInformation
{
  return self->_authInformation;
}

- (void)setAuthInformation:(id)a3
{
  objc_storeStrong((id *)&self->_authInformation, a3);
}

- (CKCDPCodeServiceRequestProtectedCloudComputeMetadata)protectedCloudComputeMetadata
{
  return self->_protectedCloudComputeMetadata;
}

- (CKCDPTrustedTargetCryptoMetadata)trustedTargetCryptoMetadata
{
  return self->_trustedTargetCryptoMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedTargetCryptoMetadata, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_protectedCloudComputeMetadata, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_clientConfigs, 0);
  objc_storeStrong((id *)&self->_authInformation, 0);
  objc_storeStrong((id *)&self->_attestationRequest, 0);
  objc_storeStrong((id *)&self->_assetAuthorizeGetRequestOptions, 0);
  objc_storeStrong((id *)&self->_accountConfig, 0);
}

@end
