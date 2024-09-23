@implementation CKDPUserQueryRequest

+ (id)options
{
  if (qword_1ED700950 != -1)
    dispatch_once(&qword_1ED700950, &unk_1E7832C90);
  return (id)qword_1ED700948;
}

- (BOOL)hasAlias
{
  return self->_alias != 0;
}

- (void)clearSortedBys
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_sortedBys, a2, v2);
}

- (void)addSortedBy:(id)a3
{
  const char *v4;
  NSMutableArray *sortedBys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  sortedBys = self->_sortedBys;
  v8 = (char *)v4;
  if (!sortedBys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sortedBys;
    self->_sortedBys = v6;

    v4 = v8;
    sortedBys = self->_sortedBys;
  }
  objc_msgSend_addObject_(sortedBys, v4, (uint64_t)v4);

}

- (unint64_t)sortedBysCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_sortedBys, a2, v2);
}

- (id)sortedByAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_sortedBys, a2, a3);
}

+ (Class)sortedByType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasOBSOLETEPcsServiceType
{
  return self->_oBSOLETEPcsServiceType != 0;
}

- (BOOL)publicKeyRequested
{
  return (*(_BYTE *)&self->_has & 1) != 0 && self->_publicKeyRequested;
}

- (void)setPublicKeyRequested:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_publicKeyRequested = a3;
}

- (void)setHasPublicKeyRequested:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPublicKeyRequested
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
  v11.super_class = (Class)CKDPUserQueryRequest;
  -[CKDPUserQueryRequest description](&v11, sel_description);
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
  CKDPUserAlias *alias;
  void *v8;
  const char *v9;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  NSMutableArray *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  const char *v26;
  const char *v27;
  NSString *oBSOLETEPcsServiceType;
  void *v29;
  const char *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  alias = self->_alias;
  if (alias)
  {
    objc_msgSend_dictionaryRepresentation(alias, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("alias"));

  }
  if (objc_msgSend_count(self->_sortedBys, v4, v5))
  {
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v14 = objc_msgSend_count(self->_sortedBys, v12, v13);
    v16 = (void *)objc_msgSend_initWithCapacity_(v11, v15, v14);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v17 = self->_sortedBys;
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v32, v36, 16);
    if (v19)
    {
      v22 = v19;
      v23 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v17);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v32 + 1) + 8 * i), v20, v21, (_QWORD)v32);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v16, v26, (uint64_t)v25);

        }
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v32, v36, 16);
      }
      while (v22);
    }

    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v16, CFSTR("sortedBy"));
  }
  oBSOLETEPcsServiceType = self->_oBSOLETEPcsServiceType;
  if (oBSOLETEPcsServiceType)
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)oBSOLETEPcsServiceType, CFSTR("OBSOLETE_pcsServiceType"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v10, self->_publicKeyRequested);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v30, (uint64_t)v29, CFSTR("publicKeyRequested"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAC42B4((uint64_t)self, (uint64_t)a3);
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
  if (self->_alias)
    PBDataWriterWriteSubmessage();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_sortedBys;
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

  if (self->_oBSOLETEPcsServiceType)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (unsigned)requestTypeCode
{
  return 44;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  const char *v4;
  CKDPUserAlias *alias;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  NSString *oBSOLETEPcsServiceType;
  _BYTE *v16;

  v16 = a3;
  alias = self->_alias;
  if (alias)
    objc_msgSend_setAlias_(v16, v4, (uint64_t)alias);
  if (objc_msgSend_sortedBysCount(self, v4, (uint64_t)alias))
  {
    objc_msgSend_clearSortedBys(v16, v6, v7);
    v10 = objc_msgSend_sortedBysCount(self, v8, v9);
    if (v10)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend_sortedByAtIndex_(self, v6, i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSortedBy_(v16, v14, (uint64_t)v13);

      }
    }
  }
  oBSOLETEPcsServiceType = self->_oBSOLETEPcsServiceType;
  if (oBSOLETEPcsServiceType)
    objc_msgSend_setOBSOLETEPcsServiceType_(v16, v6, (uint64_t)oBSOLETEPcsServiceType);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v16[32] = self->_publicKeyRequested;
    v16[36] |= 1u;
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
  uint64_t i;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_alias, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v12;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = self->_sortedBys;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v27, v31, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v27 + 1) + 8 * i), v17, (uint64_t)a3, (_QWORD)v27);
        objc_msgSend_addSortedBy_((void *)v10, v22, (uint64_t)v21);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v27, v31, 16);
    }
    while (v18);
  }

  v24 = objc_msgSend_copyWithZone_(self->_oBSOLETEPcsServiceType, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v24;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v10 + 32) = self->_publicKeyRequested;
    *(_BYTE *)(v10 + 36) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPUserAlias *alias;
  uint64_t v9;
  NSMutableArray *sortedBys;
  uint64_t v11;
  NSString *oBSOLETEPcsServiceType;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_10;
  alias = self->_alias;
  v9 = v4[1];
  if ((unint64_t)alias | v9)
  {
    if (!objc_msgSend_isEqual_(alias, v7, v9))
      goto LABEL_10;
  }
  sortedBys = self->_sortedBys;
  v11 = v4[3];
  if ((unint64_t)sortedBys | v11)
  {
    if (!objc_msgSend_isEqual_(sortedBys, v7, v11))
      goto LABEL_10;
  }
  oBSOLETEPcsServiceType = self->_oBSOLETEPcsServiceType;
  v13 = v4[2];
  if ((unint64_t)oBSOLETEPcsServiceType | v13)
  {
    if (!objc_msgSend_isEqual_(oBSOLETEPcsServiceType, v7, v13))
      goto LABEL_10;
  }
  v14 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      v14 = 0;
      goto LABEL_11;
    }
    if (self->_publicKeyRequested)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_10;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_10;
    }
    v14 = 1;
  }
LABEL_11:

  return v14;
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

  v4 = objc_msgSend_hash(self->_alias, a2, v2);
  v7 = objc_msgSend_hash(self->_sortedBys, v5, v6);
  v10 = objc_msgSend_hash(self->_oBSOLETEPcsServiceType, v8, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_publicKeyRequested;
  else
    v11 = 0;
  return v7 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPUserAlias *alias;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const char *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  alias = self->_alias;
  v7 = *((_QWORD *)v5 + 1);
  if (alias)
  {
    if (v7)
      objc_msgSend_mergeFrom_(alias, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setAlias_(self, v4, v7);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = *((id *)v5 + 3);
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v17, v21, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v8);
        objc_msgSend_addSortedBy_(self, v11, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v17, v21, 16);
    }
    while (v12);
  }

  v16 = *((_QWORD *)v5 + 2);
  if (v16)
    objc_msgSend_setOBSOLETEPcsServiceType_(self, v15, v16);
  if ((*((_BYTE *)v5 + 36) & 1) != 0)
  {
    self->_publicKeyRequested = *((_BYTE *)v5 + 32);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (CKDPUserAlias)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
  objc_storeStrong((id *)&self->_alias, a3);
}

- (NSMutableArray)sortedBys
{
  return self->_sortedBys;
}

- (void)setSortedBys:(id)a3
{
  objc_storeStrong((id *)&self->_sortedBys, a3);
}

- (NSString)oBSOLETEPcsServiceType
{
  return self->_oBSOLETEPcsServiceType;
}

- (void)setOBSOLETEPcsServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_oBSOLETEPcsServiceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedBys, 0);
  objc_storeStrong((id *)&self->_oBSOLETEPcsServiceType, 0);
  objc_storeStrong((id *)&self->_alias, 0);
}

@end
