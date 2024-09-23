@implementation CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions

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

- (void)setContentRequestAuthorizeGetOptions:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contentRequestAuthorizeGetOptions = a3;
}

- (void)setHasContentRequestAuthorizeGetOptions:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentRequestAuthorizeGetOptions
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
  v11.super_class = (Class)CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions;
  -[CKCDPCodeServiceRequestAssetAuthorizeGetRequestOptions description](&v11, sel_description);
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
  uint64_t v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_contentRequestHeaders, v5, v6))
  {
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v11 = objc_msgSend_count(self->_contentRequestHeaders, v9, v10);
    v13 = (void *)objc_msgSend_initWithCapacity_(v8, v12, v11);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = self->_contentRequestHeaders;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v28, v32, 16);
    if (v16)
    {
      v19 = v16;
      v20 = *(_QWORD *)v29;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v14);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v28 + 1) + 8 * v21), v17, v18, (_QWORD)v28);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v28, v32, 16);
      }
      while (v19);
    }

    objc_msgSend_setObject_forKey_(v4, v24, (uint64_t)v13, CFSTR("contentRequestHeaders"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v7, self->_contentRequestAuthorizeGetOptions);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v26, (uint64_t)v25, CFSTR("contentRequestAuthorizeGetOptions"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBD2A8C((uint64_t)self, (uint64_t)a3);
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
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_contentRequestHeaders;
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  id v16;

  v16 = a3;
  if (objc_msgSend_contentRequestHeadersCount(self, v4, v5))
  {
    objc_msgSend_clearContentRequestHeaders(v16, v6, v7);
    v10 = objc_msgSend_contentRequestHeadersCount(self, v8, v9);
    if (v10)
    {
      v12 = v10;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_contentRequestHeadersAtIndex_(self, v11, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addContentRequestHeaders_(v16, v15, (uint64_t)v14);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v16 + 1) = self->_contentRequestAuthorizeGetOptions;
    *((_BYTE *)v16 + 24) |= 1u;
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
  NSMutableArray *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = self->_contentRequestHeaders;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v21, v25, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v11);
        v18 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v17), v14, (uint64_t)a3, (_QWORD)v21);
        objc_msgSend_addContentRequestHeaders_((void *)v10, v19, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v21, v25, 16);
    }
    while (v15);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_contentRequestAuthorizeGetOptions;
    *(_BYTE *)(v10 + 24) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSMutableArray *contentRequestHeaders;
  uint64_t v9;
  BOOL v10;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_8;
  contentRequestHeaders = self->_contentRequestHeaders;
  v9 = v4[2];
  if ((unint64_t)contentRequestHeaders | v9)
  {
    if (!objc_msgSend_isEqual_(contentRequestHeaders, v7, v9))
      goto LABEL_8;
  }
  v10 = (v4[3] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[3] & 1) != 0 && self->_contentRequestAuthorizeGetOptions == v4[1])
    {
      v10 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v10 = 0;
  }
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;

  v4 = objc_msgSend_hash(self->_contentRequestHeaders, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_contentRequestAuthorizeGetOptions;
  else
    v5 = 0;
  return v5 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *((id *)v4 + 2);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend_addContentRequestHeaders_(self, v8, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v12, v16, 16);
    }
    while (v9);
  }

  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_contentRequestAuthorizeGetOptions = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSMutableArray)contentRequestHeaders
{
  return self->_contentRequestHeaders;
}

- (void)setContentRequestHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_contentRequestHeaders, a3);
}

- (unint64_t)contentRequestAuthorizeGetOptions
{
  return self->_contentRequestAuthorizeGetOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRequestHeaders, 0);
}

@end
