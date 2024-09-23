@implementation CKCDPCodeServiceResponseAssetAuthorizationResponse

- (BOOL)hasResponseUUID
{
  return self->_responseUUID != 0;
}

- (BOOL)hasAuthGetResponseBody
{
  return self->_authGetResponseBody != 0;
}

- (void)clearResponseHeaders
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_responseHeaders, a2, v2);
}

- (void)addResponseHeaders:(id)a3
{
  const char *v4;
  NSMutableArray *responseHeaders;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  responseHeaders = self->_responseHeaders;
  v8 = (char *)v4;
  if (!responseHeaders)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_responseHeaders;
    self->_responseHeaders = v6;

    v4 = v8;
    responseHeaders = self->_responseHeaders;
  }
  objc_msgSend_addObject_(responseHeaders, v4, (uint64_t)v4);

}

- (unint64_t)responseHeadersCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_responseHeaders, a2, v2);
}

- (id)responseHeadersAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_responseHeaders, a2, a3);
}

+ (Class)responseHeadersType
{
  return (Class)objc_opt_class();
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
  v11.super_class = (Class)CKCDPCodeServiceResponseAssetAuthorizationResponse;
  -[CKCDPCodeServiceResponseAssetAuthorizationResponse description](&v11, sel_description);
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
  NSString *responseUUID;
  NSData *authGetResponseBody;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  NSMutableArray *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  const char *v24;
  const char *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  responseUUID = self->_responseUUID;
  if (responseUUID)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)responseUUID, CFSTR("responseUUID"));
  authGetResponseBody = self->_authGetResponseBody;
  if (authGetResponseBody)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)authGetResponseBody, CFSTR("authGetResponseBody"));
  if (objc_msgSend_count(self->_responseHeaders, v5, (uint64_t)authGetResponseBody))
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v12 = objc_msgSend_count(self->_responseHeaders, v10, v11);
    v14 = (void *)objc_msgSend_initWithCapacity_(v9, v13, v12);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = self->_responseHeaders;
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v27, v31, 16);
    if (v17)
    {
      v20 = v17;
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v15);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v27 + 1) + 8 * i), v18, v19, (_QWORD)v27);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v14, v24, (uint64_t)v23);

        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v27, v31, 16);
      }
      while (v20);
    }

    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v14, CFSTR("responseHeaders"));
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC278B4((char *)self, (uint64_t)a3);
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
  if (self->_responseUUID)
    PBDataWriterWriteStringField();
  if (self->_authGetResponseBody)
    PBDataWriterWriteDataField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_responseHeaders;
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

}

- (void)copyTo:(id)a3
{
  const char *v4;
  NSString *responseUUID;
  NSData *authGetResponseBody;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  id v17;

  v17 = a3;
  responseUUID = self->_responseUUID;
  if (responseUUID)
    objc_msgSend_setResponseUUID_(v17, v4, (uint64_t)responseUUID);
  authGetResponseBody = self->_authGetResponseBody;
  if (authGetResponseBody)
    objc_msgSend_setAuthGetResponseBody_(v17, v4, (uint64_t)authGetResponseBody);
  if (objc_msgSend_responseHeadersCount(self, v4, (uint64_t)authGetResponseBody))
  {
    objc_msgSend_clearResponseHeaders(v17, v7, v8);
    v11 = objc_msgSend_responseHeadersCount(self, v9, v10);
    if (v11)
    {
      v13 = v11;
      for (i = 0; i != v13; ++i)
      {
        objc_msgSend_responseHeadersAtIndex_(self, v12, i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addResponseHeaders_(v17, v16, (uint64_t)v15);

      }
    }
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
  NSMutableArray *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_responseUUID, v11, (uint64_t)a3);
  v13 = (void *)v10[3];
  v10[3] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_authGetResponseBody, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = self->_responseHeaders;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v27, v31, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v28;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v17);
        v24 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v27 + 1) + 8 * v23), v20, (uint64_t)a3, (_QWORD)v27);
        objc_msgSend_addResponseHeaders_(v10, v25, (uint64_t)v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v27, v31, 16);
    }
    while (v21);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *responseUUID;
  uint64_t v9;
  NSData *authGetResponseBody;
  uint64_t v11;
  NSMutableArray *responseHeaders;
  uint64_t v13;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((responseUUID = self->_responseUUID, v9 = v4[3], !((unint64_t)responseUUID | v9))
     || objc_msgSend_isEqual_(responseUUID, v7, v9))
    && ((authGetResponseBody = self->_authGetResponseBody, v11 = v4[1], !((unint64_t)authGetResponseBody | v11))
     || objc_msgSend_isEqual_(authGetResponseBody, v7, v11)))
  {
    responseHeaders = self->_responseHeaders;
    v13 = v4[2];
    if ((unint64_t)responseHeaders | v13)
      isEqual = objc_msgSend_isEqual_(responseHeaders, v7, v13);
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

  v4 = objc_msgSend_hash(self->_responseUUID, a2, v2);
  v7 = objc_msgSend_hash(self->_authGetResponseBody, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_responseHeaders, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 3);
  if (v6)
    objc_msgSend_setResponseUUID_(self, v4, v6);
  v7 = *((_QWORD *)v5 + 1);
  if (v7)
    objc_msgSend_setAuthGetResponseBody_(self, v4, v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = *((id *)v5 + 2);
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v15, v19, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v8);
        objc_msgSend_addResponseHeaders_(self, v11, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v15, v19, 16);
    }
    while (v12);
  }

}

- (NSString)responseUUID
{
  return self->_responseUUID;
}

- (void)setResponseUUID:(id)a3
{
  objc_storeStrong((id *)&self->_responseUUID, a3);
}

- (NSData)authGetResponseBody
{
  return self->_authGetResponseBody;
}

- (void)setAuthGetResponseBody:(id)a3
{
  objc_storeStrong((id *)&self->_authGetResponseBody, a3);
}

- (NSMutableArray)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_responseHeaders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseUUID, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_authGetResponseBody, 0);
}

@end
