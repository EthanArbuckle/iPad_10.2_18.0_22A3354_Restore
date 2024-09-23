@implementation CKCDPCodeServiceResponse

- (BOOL)hasSerializedResult
{
  return self->_serializedResult != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)clearAssetAuthorizationResponses
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_assetAuthorizationResponses, a2, v2);
}

- (void)addAssetAuthorizationResponses:(id)a3
{
  const char *v4;
  NSMutableArray *assetAuthorizationResponses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  assetAuthorizationResponses = self->_assetAuthorizationResponses;
  v8 = (char *)v4;
  if (!assetAuthorizationResponses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_assetAuthorizationResponses;
    self->_assetAuthorizationResponses = v6;

    v4 = v8;
    assetAuthorizationResponses = self->_assetAuthorizationResponses;
  }
  objc_msgSend_addObject_(assetAuthorizationResponses, v4, (uint64_t)v4);

}

- (unint64_t)assetAuthorizationResponsesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_assetAuthorizationResponses, a2, v2);
}

- (id)assetAuthorizationResponsesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_assetAuthorizationResponses, a2, a3);
}

+ (Class)assetAuthorizationResponsesType
{
  return (Class)objc_opt_class();
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
  v11.super_class = (Class)CKCDPCodeServiceResponse;
  -[CKCDPCodeServiceResponse description](&v11, sel_description);
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
  CKCDPError *error;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  NSMutableArray *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  const char *v28;
  const char *v29;
  CKCDPCodeServiceResponseAttestationResponse *attestationResponse;
  void *v31;
  const char *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  serializedResult = self->_serializedResult;
  if (serializedResult)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)serializedResult, CFSTR("serializedResult"));
  error = self->_error;
  if (error)
  {
    objc_msgSend_dictionaryRepresentation(error, v5, (uint64_t)serializedResult);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("error"));

  }
  if (objc_msgSend_count(self->_assetAuthorizationResponses, v5, (uint64_t)serializedResult))
  {
    v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v16 = objc_msgSend_count(self->_assetAuthorizationResponses, v14, v15);
    v18 = (void *)objc_msgSend_initWithCapacity_(v13, v17, v16);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v19 = self->_assetAuthorizationResponses;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v34, v38, 16);
    if (v21)
    {
      v24 = v21;
      v25 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v19);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v34 + 1) + 8 * i), v22, v23, (_QWORD)v34);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v18, v28, (uint64_t)v27);

        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v34, v38, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v18, CFSTR("assetAuthorizationResponses"));
  }
  attestationResponse = self->_attestationResponse;
  if (attestationResponse)
  {
    objc_msgSend_dictionaryRepresentation(attestationResponse, v11, v12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v32, (uint64_t)v31, CFSTR("attestationResponse"));

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
  int v16;
  NSData *v18;
  CKCDPError *serializedResult;
  const char *v20;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
    return *((_BYTE *)a3 + *v6) == 0;
  v8 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*((_BYTE *)a3 + *v6))
      return *((_BYTE *)a3 + *v6) == 0;
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
      if (v10++ >= 9)
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
    if (v16 || (v11 & 7) == 4)
      return *((_BYTE *)a3 + *v6) == 0;
    switch((v11 >> 3))
    {
      case 1u:
        PBReaderReadData();
        v18 = (NSData *)objc_claimAutoreleasedReturnValue();
        serializedResult = (CKCDPError *)self->_serializedResult;
        self->_serializedResult = v18;
        goto LABEL_31;
      case 2u:
        serializedResult = objc_alloc_init(CKCDPError);
        objc_storeStrong((id *)&self->_error, serializedResult);
        if (!PBReaderPlaceMark() || (sub_1BEC0D164(serializedResult, (uint64_t)a3) & 1) == 0)
          goto LABEL_35;
        goto LABEL_30;
      case 3u:
        serializedResult = objc_alloc_init(CKCDPCodeServiceResponseAssetAuthorizationResponse);
        objc_msgSend_addAssetAuthorizationResponses_(self, v20, (uint64_t)serializedResult);
        if (!PBReaderPlaceMark() || !sub_1BEC278B4((char *)serializedResult, (uint64_t)a3))
          goto LABEL_35;
        goto LABEL_30;
      case 5u:
        serializedResult = objc_alloc_init(CKCDPCodeServiceResponseAttestationResponse);
        objc_storeStrong((id *)&self->_attestationResponse, serializedResult);
        if (PBReaderPlaceMark() && (sub_1BEBC6814(serializedResult, (uint64_t)a3) & 1) != 0)
        {
LABEL_30:
          PBReaderRecallMark();
LABEL_31:

LABEL_32:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            return *((_BYTE *)a3 + *v6) == 0;
          continue;
        }
LABEL_35:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_32;
    }
  }
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
  if (self->_serializedResult)
    PBDataWriterWriteDataField();
  if (self->_error)
    PBDataWriterWriteSubmessage();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_assetAuthorizationResponses;
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

  if (self->_attestationResponse)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  NSData *serializedResult;
  CKCDPError *error;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  CKCDPCodeServiceResponseAttestationResponse *attestationResponse;
  id v17;

  v17 = a3;
  serializedResult = self->_serializedResult;
  if (serializedResult)
    objc_msgSend_setSerializedResult_(v17, v4, (uint64_t)serializedResult);
  error = self->_error;
  if (error)
    objc_msgSend_setError_(v17, v4, (uint64_t)error);
  if (objc_msgSend_assetAuthorizationResponsesCount(self, v4, (uint64_t)error))
  {
    objc_msgSend_clearAssetAuthorizationResponses(v17, v7, v8);
    v11 = objc_msgSend_assetAuthorizationResponsesCount(self, v9, v10);
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_assetAuthorizationResponsesAtIndex_(self, v7, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addAssetAuthorizationResponses_(v17, v15, (uint64_t)v14);

      }
    }
  }
  attestationResponse = self->_attestationResponse;
  if (attestationResponse)
    objc_msgSend_setAttestationResponse_(v17, v7, (uint64_t)attestationResponse);

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
  NSMutableArray *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_serializedResult, v11, (uint64_t)a3);
  v13 = (void *)v10[4];
  v10[4] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_error, v14, (uint64_t)a3);
  v16 = (void *)v10[3];
  v10[3] = v15;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = self->_assetAuthorizationResponses;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v30, v34, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v31;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v17);
        v24 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v30 + 1) + 8 * v23), v20, (uint64_t)a3, (_QWORD)v30);
        objc_msgSend_addAssetAuthorizationResponses_(v10, v25, (uint64_t)v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v30, v34, 16);
    }
    while (v21);
  }

  v27 = objc_msgSend_copyWithZone_(self->_attestationResponse, v26, (uint64_t)a3);
  v28 = (void *)v10[2];
  v10[2] = v27;

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
  CKCDPError *error;
  uint64_t v11;
  NSMutableArray *assetAuthorizationResponses;
  uint64_t v13;
  CKCDPCodeServiceResponseAttestationResponse *attestationResponse;
  uint64_t v15;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((serializedResult = self->_serializedResult, v9 = v4[4], !((unint64_t)serializedResult | v9))
     || objc_msgSend_isEqual_(serializedResult, v7, v9))
    && ((error = self->_error, v11 = v4[3], !((unint64_t)error | v11))
     || objc_msgSend_isEqual_(error, v7, v11))
    && ((assetAuthorizationResponses = self->_assetAuthorizationResponses,
         v13 = v4[1],
         !((unint64_t)assetAuthorizationResponses | v13))
     || objc_msgSend_isEqual_(assetAuthorizationResponses, v7, v13)))
  {
    attestationResponse = self->_attestationResponse;
    v15 = v4[2];
    if ((unint64_t)attestationResponse | v15)
      isEqual = objc_msgSend_isEqual_(attestationResponse, v7, v15);
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
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v4 = objc_msgSend_hash(self->_serializedResult, a2, v2);
  v7 = objc_msgSend_hash(self->_error, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_assetAuthorizationResponses, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_attestationResponse, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  CKCDPError *error;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  const char *v16;
  CKCDPCodeServiceResponseAttestationResponse *attestationResponse;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 4);
  if (v6)
    objc_msgSend_setSerializedResult_(self, v4, v6);
  error = self->_error;
  v8 = *((_QWORD *)v5 + 3);
  if (error)
  {
    if (v8)
      objc_msgSend_mergeFrom_(error, v4, v8);
  }
  else if (v8)
  {
    objc_msgSend_setError_(self, v4, v8);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = *((id *)v5 + 1);
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v19, v23, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend_addAssetAuthorizationResponses_(self, v12, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v19, v23, 16);
    }
    while (v13);
  }

  attestationResponse = self->_attestationResponse;
  v18 = *((_QWORD *)v5 + 2);
  if (attestationResponse)
  {
    if (v18)
      objc_msgSend_mergeFrom_(attestationResponse, v16, v18);
  }
  else if (v18)
  {
    objc_msgSend_setAttestationResponse_(self, v16, v18);
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

- (CKCDPError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSMutableArray)assetAuthorizationResponses
{
  return self->_assetAuthorizationResponses;
}

- (void)setAssetAuthorizationResponses:(id)a3
{
  objc_storeStrong((id *)&self->_assetAuthorizationResponses, a3);
}

- (CKCDPCodeServiceResponseAttestationResponse)attestationResponse
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
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_attestationResponse, 0);
  objc_storeStrong((id *)&self->_assetAuthorizationResponses, 0);
}

@end
