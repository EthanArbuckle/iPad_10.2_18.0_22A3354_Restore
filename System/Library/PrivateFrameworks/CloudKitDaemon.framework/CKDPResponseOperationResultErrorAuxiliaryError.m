@implementation CKDPResponseOperationResultErrorAuxiliaryError

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)setCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearUserInfos
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_userInfos, a2, v2);
}

- (void)addUserInfo:(id)a3
{
  const char *v4;
  NSMutableArray *userInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  userInfos = self->_userInfos;
  v8 = (char *)v4;
  if (!userInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_userInfos;
    self->_userInfos = v6;

    v4 = v8;
    userInfos = self->_userInfos;
  }
  objc_msgSend_addObject_(userInfos, v4, (uint64_t)v4);

}

- (unint64_t)userInfosCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_userInfos, a2, v2);
}

- (id)userInfoAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_userInfos, a2, a3);
}

+ (Class)userInfoType
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
  v11.super_class = (Class)CKDPResponseOperationResultErrorAuxiliaryError;
  -[CKDPResponseOperationResultErrorAuxiliaryError description](&v11, sel_description);
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
  NSString *domain;
  void *v8;
  const char *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  NSMutableArray *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  const char *v25;
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
  v6 = v4;
  domain = self->_domain;
  if (domain)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)domain, CFSTR("domain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v5, self->_code);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("code"));

  }
  if (objc_msgSend_count(self->_userInfos, v5, (uint64_t)domain))
  {
    v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v13 = objc_msgSend_count(self->_userInfos, v11, v12);
    v15 = (void *)objc_msgSend_initWithCapacity_(v10, v14, v13);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = self->_userInfos;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v28, v32, 16);
    if (v18)
    {
      v21 = v18;
      v22 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v16);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i), v19, v20, (_QWORD)v28);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v15, v25, (uint64_t)v24);

        }
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v28, v32, 16);
      }
      while (v21);
    }

    objc_msgSend_setObject_forKey_(v6, v26, (uint64_t)v15, CFSTR("userInfo"));
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultErrorAuxiliaryErrorReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_domain)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_userInfos;
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
  id v4;
  const char *v5;
  NSString *domain;
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

  v4 = a3;
  domain = self->_domain;
  v17 = v4;
  if (domain)
  {
    objc_msgSend_setDomain_(v4, v5, (uint64_t)domain);
    v4 = v17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_code;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (objc_msgSend_userInfosCount(self, v5, (uint64_t)domain))
  {
    objc_msgSend_clearUserInfos(v17, v7, v8);
    v11 = objc_msgSend_userInfosCount(self, v9, v10);
    if (v11)
    {
      v13 = v11;
      for (i = 0; i != v13; ++i)
      {
        objc_msgSend_userInfoAtIndex_(self, v12, i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addUserInfo_(v17, v16, (uint64_t)v15);

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
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_domain, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 8) = self->_code;
    *(_BYTE *)(v10 + 32) |= 1u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = self->_userInfos;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v24, v28, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v25;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v20), v17, (uint64_t)a3, (_QWORD)v24);
        objc_msgSend_addUserInfo_((void *)v10, v22, (uint64_t)v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, v28, 16);
    }
    while (v18);
  }

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *domain;
  uint64_t v9;
  NSMutableArray *userInfos;
  uint64_t v11;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_11;
  domain = self->_domain;
  v9 = v4[2];
  if ((unint64_t)domain | v9)
  {
    if (!objc_msgSend_isEqual_(domain, v7, v9))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) == 0 || self->_code != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((v4[4] & 1) != 0)
  {
LABEL_11:
    isEqual = 0;
    goto LABEL_12;
  }
  userInfos = self->_userInfos;
  v11 = v4[3];
  if ((unint64_t)userInfos | v11)
    isEqual = objc_msgSend_isEqual_(userInfos, v7, v11);
  else
    isEqual = 1;
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend_hash(self->_domain, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_code;
  else
    v7 = 0;
  return v7 ^ v4 ^ objc_msgSend_hash(self->_userInfos, v5, v6);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 2);
  if (v6)
    objc_msgSend_setDomain_(self, v4, v6);
  if ((*((_BYTE *)v5 + 32) & 1) != 0)
  {
    self->_code = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *((id *)v5 + 3);
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v14, v18, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend_addUserInfo_(self, v10, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v14, v18, 16);
    }
    while (v11);
  }

}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (int)code
{
  return self->_code;
}

- (NSMutableArray)userInfos
{
  return self->_userInfos;
}

- (void)setUserInfos:(id)a3
{
  objc_storeStrong((id *)&self->_userInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfos, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
