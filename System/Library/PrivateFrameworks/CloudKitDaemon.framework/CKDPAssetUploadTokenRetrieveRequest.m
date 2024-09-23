@implementation CKDPAssetUploadTokenRetrieveRequest

+ (id)options
{
  if (qword_1ED700A80 != -1)
    dispatch_once(&qword_1ED700A80, &unk_1E7836048);
  return (id)qword_1ED700A78;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasField
{
  return self->_field != 0;
}

- (void)clearAssets
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_assets, a2, v2);
}

- (void)addAssets:(id)a3
{
  const char *v4;
  NSMutableArray *assets;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  assets = self->_assets;
  v8 = (char *)v4;
  if (!assets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_assets;
    self->_assets = v6;

    v4 = v8;
    assets = self->_assets;
  }
  objc_msgSend_addObject_(assets, v4, (uint64_t)v4);

}

- (unint64_t)assetsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_assets, a2, v2);
}

- (id)assetsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_assets, a2, a3);
}

+ (Class)assetsType
{
  return (Class)objc_opt_class();
}

- (void)clearUploads
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_uploads, a2, v2);
}

- (void)addUploads:(id)a3
{
  const char *v4;
  NSMutableArray *uploads;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  uploads = self->_uploads;
  v8 = (char *)v4;
  if (!uploads)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_uploads;
    self->_uploads = v6;

    v4 = v8;
    uploads = self->_uploads;
  }
  objc_msgSend_addObject_(uploads, v4, (uint64_t)v4);

}

- (unint64_t)uploadsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_uploads, a2, v2);
}

- (id)uploadsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_uploads, a2, a3);
}

+ (Class)uploadsType
{
  return (Class)objc_opt_class();
}

- (void)clearContentRequestHeaders
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_contentRequestHeaders, a2, v2);
}

- (void)addContentRequestHeaders:(id)a3
{
  const char *v4;
  NSMutableArray *contentRequestHeaders;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  contentRequestHeaders = self->_contentRequestHeaders;
  v8 = (char *)v4;
  if (!contentRequestHeaders)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contentRequestHeaders;
    self->_contentRequestHeaders = v6;

    v4 = v8;
    contentRequestHeaders = self->_contentRequestHeaders;
  }
  objc_msgSend_addObject_(contentRequestHeaders, v4, (uint64_t)v4);

}

- (unint64_t)contentRequestHeadersCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_contentRequestHeaders, a2, v2);
}

- (id)contentRequestHeadersAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_contentRequestHeaders, a2, a3);
}

+ (Class)contentRequestHeadersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAuthPutRequest
{
  return self->_authPutRequest != 0;
}

- (int)authPutType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_authPutType;
  else
    return 1;
}

- (void)setAuthPutType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_authPutType = a3;
}

- (void)setHasAuthPutType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAuthPutType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)authPutTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7836068[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAuthPutType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("authorizePut")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("reReference")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("authorizeClone")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)setOptions:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_options = a3;
}

- (void)setHasOptions:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOptions
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
  v11.super_class = (Class)CKDPAssetUploadTokenRetrieveRequest;
  -[CKDPAssetUploadTokenRetrieveRequest description](&v11, sel_description);
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
  CKDPRecordType *type;
  void *v8;
  const char *v9;
  CKDPRecordFieldIdentifier *field;
  void *v11;
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
  const char *v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  NSMutableArray *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  void *v57;
  NSMutableArray *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  void *v66;
  const char *v67;
  const char *v68;
  NSData *authPutRequest;
  char has;
  unsigned int v71;
  __CFString *v72;
  void *v73;
  const char *v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type)
  {
    objc_msgSend_dictionaryRepresentation(type, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("type"));

  }
  field = self->_field;
  if (field)
  {
    objc_msgSend_dictionaryRepresentation(field, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("field"));

  }
  if (objc_msgSend_count(self->_assets, v4, v5))
  {
    v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v18 = objc_msgSend_count(self->_assets, v16, v17);
    v20 = (void *)objc_msgSend_initWithCapacity_(v15, v19, v18);
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v21 = self->_assets;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v84, v90, 16);
    if (v23)
    {
      v26 = v23;
      v27 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v85 != v27)
            objc_enumerationMutation(v21);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v84 + 1) + 8 * i), v24, v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v20, v30, (uint64_t)v29);

        }
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v84, v90, 16);
      }
      while (v26);
    }

    objc_msgSend_setObject_forKey_(v6, v31, (uint64_t)v20, CFSTR("assets"));
  }
  if (objc_msgSend_count(self->_uploads, v13, v14))
  {
    v34 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v37 = objc_msgSend_count(self->_uploads, v35, v36);
    v39 = (void *)objc_msgSend_initWithCapacity_(v34, v38, v37);
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v40 = self->_uploads;
    v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v80, v89, 16);
    if (v42)
    {
      v45 = v42;
      v46 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v81 != v46)
            objc_enumerationMutation(v40);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v80 + 1) + 8 * j), v43, v44);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v39, v49, (uint64_t)v48);

        }
        v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v80, v89, 16);
      }
      while (v45);
    }

    objc_msgSend_setObject_forKey_(v6, v50, (uint64_t)v39, CFSTR("uploads"));
  }
  if (objc_msgSend_count(self->_contentRequestHeaders, v32, v33))
  {
    v52 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v55 = objc_msgSend_count(self->_contentRequestHeaders, v53, v54);
    v57 = (void *)objc_msgSend_initWithCapacity_(v52, v56, v55);
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v58 = self->_contentRequestHeaders;
    v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v76, v88, 16);
    if (v60)
    {
      v63 = v60;
      v64 = *(_QWORD *)v77;
      do
      {
        for (k = 0; k != v63; ++k)
        {
          if (*(_QWORD *)v77 != v64)
            objc_enumerationMutation(v58);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v76 + 1) + 8 * k), v61, v62);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v57, v67, (uint64_t)v66);

        }
        v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v76, v88, 16);
      }
      while (v63);
    }

    objc_msgSend_setObject_forKey_(v6, v68, (uint64_t)v57, CFSTR("contentRequestHeaders"));
  }
  authPutRequest = self->_authPutRequest;
  if (authPutRequest)
    objc_msgSend_setObject_forKey_(v6, v51, (uint64_t)authPutRequest, CFSTR("authPutRequest"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v71 = self->_authPutType - 1;
    if (v71 >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v51, (uint64_t)CFSTR("(unknown: %i)"), self->_authPutType);
      v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v72 = off_1E7836068[v71];
    }
    objc_msgSend_setObject_forKey_(v6, v51, (uint64_t)v72, CFSTR("authPutType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v51, self->_options);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v74, (uint64_t)v73, CFSTR("options"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBA6DC4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const char *v11;
  NSMutableArray *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  const char *v18;
  NSMutableArray *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  const char *v25;
  char has;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_type)
    PBDataWriterWriteSubmessage();
  if (self->_field)
    PBDataWriterWriteSubmessage();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_assets;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v35, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v35, v41, 16);
    }
    while (v8);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = self->_uploads;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v31, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v31, v40, 16);
    }
    while (v15);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = self->_contentRequestHeaders;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v27, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v27, v39, 16);
    }
    while (v22);
  }

  if (self->_authPutRequest)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (unsigned)requestTypeCode
{
  return 12;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  const char *v4;
  CKDPRecordType *type;
  CKDPRecordFieldIdentifier *field;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  const char *v33;
  NSData *authPutRequest;
  char has;
  id v36;

  v36 = a3;
  type = self->_type;
  if (type)
    objc_msgSend_setType_(v36, v4, (uint64_t)type);
  field = self->_field;
  if (field)
    objc_msgSend_setField_(v36, v4, (uint64_t)field);
  if (objc_msgSend_assetsCount(self, v4, (uint64_t)field))
  {
    objc_msgSend_clearAssets(v36, v7, v8);
    v11 = objc_msgSend_assetsCount(self, v9, v10);
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_assetsAtIndex_(self, v7, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addAssets_(v36, v15, (uint64_t)v14);

      }
    }
  }
  if (objc_msgSend_uploadsCount(self, v7, v8))
  {
    objc_msgSend_clearUploads(v36, v16, v17);
    v20 = objc_msgSend_uploadsCount(self, v18, v19);
    if (v20)
    {
      v21 = v20;
      for (j = 0; j != v21; ++j)
      {
        objc_msgSend_uploadsAtIndex_(self, v16, j);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addUploads_(v36, v24, (uint64_t)v23);

      }
    }
  }
  if (objc_msgSend_contentRequestHeadersCount(self, v16, v17))
  {
    objc_msgSend_clearContentRequestHeaders(v36, v25, v26);
    v29 = objc_msgSend_contentRequestHeadersCount(self, v27, v28);
    if (v29)
    {
      v30 = v29;
      for (k = 0; k != v30; ++k)
      {
        objc_msgSend_contentRequestHeadersAtIndex_(self, v25, k);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addContentRequestHeaders_(v36, v33, (uint64_t)v32);

      }
    }
  }
  authPutRequest = self->_authPutRequest;
  if (authPutRequest)
    objc_msgSend_setAuthPutRequest_(v36, v25, (uint64_t)authPutRequest);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v36 + 8) = self->_authPutType;
    *((_BYTE *)v36 + 72) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v36 + 1) = self->_options;
    *((_BYTE *)v36 + 72) |= 1u;
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
  NSMutableArray *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  const char *v25;
  NSMutableArray *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  const char *v34;
  NSMutableArray *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  char has;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_type, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_field, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v15;

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v17 = self->_assets;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v57, v63, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v58 != v22)
          objc_enumerationMutation(v17);
        v24 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v57 + 1) + 8 * i), v20, (uint64_t)a3);
        objc_msgSend_addAssets_((void *)v10, v25, (uint64_t)v24);

      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v57, v63, 16);
    }
    while (v21);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v26 = self->_uploads;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v53, v62, 16);
  if (v28)
  {
    v30 = v28;
    v31 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v54 != v31)
          objc_enumerationMutation(v26);
        v33 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v53 + 1) + 8 * j), v29, (uint64_t)a3);
        objc_msgSend_addUploads_((void *)v10, v34, (uint64_t)v33);

      }
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v53, v62, 16);
    }
    while (v30);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v35 = self->_contentRequestHeaders;
  v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v49, v61, 16);
  if (v37)
  {
    v39 = v37;
    v40 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v50 != v40)
          objc_enumerationMutation(v35);
        v42 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v49 + 1) + 8 * k), v38, (uint64_t)a3, (_QWORD)v49);
        objc_msgSend_addContentRequestHeaders_((void *)v10, v43, (uint64_t)v42);

      }
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v49, v61, 16);
    }
    while (v39);
  }

  v45 = objc_msgSend_copyWithZone_(self->_authPutRequest, v44, (uint64_t)a3);
  v46 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v45;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 32) = self->_authPutType;
    *(_BYTE *)(v10 + 72) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_options;
    *(_BYTE *)(v10 + 72) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordType *type;
  uint64_t v9;
  CKDPRecordFieldIdentifier *field;
  uint64_t v11;
  NSMutableArray *assets;
  uint64_t v13;
  NSMutableArray *uploads;
  uint64_t v15;
  NSMutableArray *contentRequestHeaders;
  uint64_t v17;
  NSData *authPutRequest;
  uint64_t v19;
  BOOL v20;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_23;
  type = self->_type;
  v9 = v4[7];
  if ((unint64_t)type | v9)
  {
    if (!objc_msgSend_isEqual_(type, v7, v9))
      goto LABEL_23;
  }
  field = self->_field;
  v11 = v4[6];
  if ((unint64_t)field | v11)
  {
    if (!objc_msgSend_isEqual_(field, v7, v11))
      goto LABEL_23;
  }
  assets = self->_assets;
  v13 = v4[2];
  if ((unint64_t)assets | v13)
  {
    if (!objc_msgSend_isEqual_(assets, v7, v13))
      goto LABEL_23;
  }
  uploads = self->_uploads;
  v15 = v4[8];
  if ((unint64_t)uploads | v15)
  {
    if (!objc_msgSend_isEqual_(uploads, v7, v15))
      goto LABEL_23;
  }
  contentRequestHeaders = self->_contentRequestHeaders;
  v17 = v4[5];
  if ((unint64_t)contentRequestHeaders | v17)
  {
    if (!objc_msgSend_isEqual_(contentRequestHeaders, v7, v17))
      goto LABEL_23;
  }
  authPutRequest = self->_authPutRequest;
  v19 = v4[3];
  if ((unint64_t)authPutRequest | v19)
  {
    if (!objc_msgSend_isEqual_(authPutRequest, v7, v19))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[9] & 2) == 0 || self->_authPutType != *((_DWORD *)v4 + 8))
      goto LABEL_23;
  }
  else if ((v4[9] & 2) != 0)
  {
LABEL_23:
    v20 = 0;
    goto LABEL_24;
  }
  v20 = (v4[9] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[9] & 1) == 0 || self->_options != v4[1])
      goto LABEL_23;
    v20 = 1;
  }
LABEL_24:

  return v20;
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
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v4 = objc_msgSend_hash(self->_type, a2, v2);
  v7 = objc_msgSend_hash(self->_field, v5, v6);
  v10 = objc_msgSend_hash(self->_assets, v8, v9);
  v13 = objc_msgSend_hash(self->_uploads, v11, v12);
  v16 = objc_msgSend_hash(self->_contentRequestHeaders, v14, v15);
  v19 = objc_msgSend_hash(self->_authPutRequest, v17, v18);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v20 = 2654435761 * self->_authPutType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v21 = 0;
    return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v19 ^ v20 ^ v21;
  }
  v20 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v21 = 2654435761u * self->_options;
  return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPRecordType *type;
  uint64_t v7;
  CKDPRecordFieldIdentifier *field;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  const char *v31;
  uint64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  type = self->_type;
  v7 = *((_QWORD *)v5 + 7);
  if (type)
  {
    if (v7)
      objc_msgSend_mergeFrom_(type, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setType_(self, v4, v7);
  }
  field = self->_field;
  v9 = *((_QWORD *)v5 + 6);
  if (field)
  {
    if (v9)
      objc_msgSend_mergeFrom_(field, v4, v9);
  }
  else if (v9)
  {
    objc_msgSend_setField_(self, v4, v9);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = *((id *)v5 + 2);
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v42, v48, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v10);
        objc_msgSend_addAssets_(self, v13, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v42, v48, 16);
    }
    while (v14);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v17 = *((id *)v5 + 8);
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v38, v47, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v39 != v22)
          objc_enumerationMutation(v17);
        objc_msgSend_addUploads_(self, v20, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v38, v47, 16);
    }
    while (v21);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = *((id *)v5 + 5);
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v34, v46, 16);
  if (v26)
  {
    v28 = v26;
    v29 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(v24);
        objc_msgSend_addContentRequestHeaders_(self, v27, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k), (_QWORD)v34);
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v34, v46, 16);
    }
    while (v28);
  }

  v32 = *((_QWORD *)v5 + 3);
  if (v32)
    objc_msgSend_setAuthPutRequest_(self, v31, v32);
  v33 = *((_BYTE *)v5 + 72);
  if ((v33 & 2) != 0)
  {
    self->_authPutType = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v33 = *((_BYTE *)v5 + 72);
  }
  if ((v33 & 1) != 0)
  {
    self->_options = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (CKDPRecordType)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (CKDPRecordFieldIdentifier)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
  objc_storeStrong((id *)&self->_field, a3);
}

- (NSMutableArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (NSMutableArray)uploads
{
  return self->_uploads;
}

- (void)setUploads:(id)a3
{
  objc_storeStrong((id *)&self->_uploads, a3);
}

- (NSMutableArray)contentRequestHeaders
{
  return self->_contentRequestHeaders;
}

- (void)setContentRequestHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_contentRequestHeaders, a3);
}

- (NSData)authPutRequest
{
  return self->_authPutRequest;
}

- (void)setAuthPutRequest:(id)a3
{
  objc_storeStrong((id *)&self->_authPutRequest, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploads, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_field, 0);
  objc_storeStrong((id *)&self->_contentRequestHeaders, 0);
  objc_storeStrong((id *)&self->_authPutRequest, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

@end
