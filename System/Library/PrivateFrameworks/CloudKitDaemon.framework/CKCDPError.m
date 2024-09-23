@implementation CKCDPError

- (int)code
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_code;
  else
    return 1;
}

- (void)setCode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)codeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E7837A10[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCode:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("FUNCTION_TIMEOUT")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("FUNCTION_ERROR")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("INTERNAL_ERROR")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("INVALID_PARTITION")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (BOOL)hasAuxiliaryDomain
{
  return self->_auxiliaryDomain != 0;
}

- (void)setAuxiliaryCode:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_auxiliaryCode = a3;
}

- (void)setHasAuxiliaryCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuxiliaryCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearAuxiliaryUserInfos
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_auxiliaryUserInfos, a2, v2);
}

- (void)addAuxiliaryUserInfo:(id)a3
{
  const char *v4;
  NSMutableArray *auxiliaryUserInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  auxiliaryUserInfos = self->_auxiliaryUserInfos;
  v8 = (char *)v4;
  if (!auxiliaryUserInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_auxiliaryUserInfos;
    self->_auxiliaryUserInfos = v6;

    v4 = v8;
    auxiliaryUserInfos = self->_auxiliaryUserInfos;
  }
  objc_msgSend_addObject_(auxiliaryUserInfos, v4, (uint64_t)v4);

}

- (unint64_t)auxiliaryUserInfosCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_auxiliaryUserInfos, a2, v2);
}

- (id)auxiliaryUserInfoAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_auxiliaryUserInfos, a2, a3);
}

+ (Class)auxiliaryUserInfoType
{
  return (Class)objc_opt_class();
}

- (void)setTargetPartition:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_targetPartition = a3;
}

- (void)setHasTargetPartition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTargetPartition
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v11.super_class = (Class)CKCDPError;
  -[CKCDPError description](&v11, sel_description);
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
  void *v5;
  unsigned int v6;
  __CFString *v7;
  NSString *message;
  NSString *auxiliaryDomain;
  void *v10;
  const char *v11;
  const char *v12;
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
  void *v30;
  const char *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = self->_code - 1;
    if (v6 >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_code);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E7837A10[v6];
    }
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v7, CFSTR("code"));

  }
  message = self->_message;
  if (message)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)message, CFSTR("message"));
  auxiliaryDomain = self->_auxiliaryDomain;
  if (auxiliaryDomain)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)auxiliaryDomain, CFSTR("auxiliaryDomain"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_auxiliaryCode);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, CFSTR("auxiliaryCode"));

  }
  if (objc_msgSend_count(self->_auxiliaryUserInfos, v4, (uint64_t)auxiliaryDomain))
  {
    v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v16 = objc_msgSend_count(self->_auxiliaryUserInfos, v14, v15);
    v18 = (void *)objc_msgSend_initWithCapacity_(v13, v17, v16);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v19 = self->_auxiliaryUserInfos;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v33, v37, 16);
    if (v21)
    {
      v24 = v21;
      v25 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v19);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v33 + 1) + 8 * i), v22, v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v18, v28, (uint64_t)v27);

        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v33, v37, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v5, v29, (uint64_t)v18, CFSTR("auxiliaryUserInfo"));
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v12, self->_targetPartition);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v31, (uint64_t)v30, CFSTR("targetPartition"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC0D164(self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_message)
    PBDataWriterWriteStringField();
  if (self->_auxiliaryDomain)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_auxiliaryUserInfos;
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

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  NSString *message;
  NSString *auxiliaryDomain;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  _DWORD *v18;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[8] = self->_code;
    *((_BYTE *)v4 + 52) |= 2u;
  }
  message = self->_message;
  v18 = v4;
  if (message)
  {
    objc_msgSend_setMessage_(v4, v5, (uint64_t)message);
    v4 = v18;
  }
  auxiliaryDomain = self->_auxiliaryDomain;
  if (auxiliaryDomain)
  {
    objc_msgSend_setAuxiliaryDomain_(v18, v5, (uint64_t)auxiliaryDomain);
    v4 = v18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_auxiliaryCode;
    *((_BYTE *)v4 + 52) |= 1u;
  }
  if (objc_msgSend_auxiliaryUserInfosCount(self, v5, (uint64_t)auxiliaryDomain))
  {
    objc_msgSend_clearAuxiliaryUserInfos(v18, v8, v9);
    v12 = objc_msgSend_auxiliaryUserInfosCount(self, v10, v11);
    if (v12)
    {
      v14 = v12;
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend_auxiliaryUserInfoAtIndex_(self, v13, i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addAuxiliaryUserInfo_(v18, v17, (uint64_t)v16);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v18[12] = self->_targetPartition;
    *((_BYTE *)v18 + 52) |= 4u;
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
  NSMutableArray *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  const char *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = v10;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v10 + 32) = self->_code;
    *(_BYTE *)(v10 + 52) |= 2u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_message, v11, (uint64_t)a3);
  v14 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v13;

  v16 = objc_msgSend_copyWithZone_(self->_auxiliaryDomain, v15, (uint64_t)a3);
  v17 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 8) = self->_auxiliaryCode;
    *(_BYTE *)(v12 + 52) |= 1u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = self->_auxiliaryUserInfos;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v28, v32, 16);
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v18);
        v25 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i), v21, (uint64_t)a3, (_QWORD)v28);
        objc_msgSend_addAuxiliaryUserInfo_((void *)v12, v26, (uint64_t)v25);

      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v28, v32, 16);
    }
    while (v22);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v12 + 48) = self->_targetPartition;
    *(_BYTE *)(v12 + 52) |= 4u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *message;
  uint64_t v9;
  NSString *auxiliaryDomain;
  uint64_t v11;
  char has;
  char v13;
  NSMutableArray *auxiliaryUserInfos;
  uint64_t v15;
  BOOL v16;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_23;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_code != *((_DWORD *)v4 + 8))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_23;
  }
  message = self->_message;
  v9 = v4[5];
  if ((unint64_t)message | v9 && !objc_msgSend_isEqual_(message, v7, v9))
    goto LABEL_23;
  auxiliaryDomain = self->_auxiliaryDomain;
  v11 = v4[2];
  if ((unint64_t)auxiliaryDomain | v11)
  {
    if (!objc_msgSend_isEqual_(auxiliaryDomain, v7, v11))
      goto LABEL_23;
  }
  has = (char)self->_has;
  v13 = *((_BYTE *)v4 + 52);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_auxiliaryCode != *((_DWORD *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_23;
  }
  auxiliaryUserInfos = self->_auxiliaryUserInfos;
  v15 = v4[3];
  if ((unint64_t)auxiliaryUserInfos | v15)
  {
    if (!objc_msgSend_isEqual_(auxiliaryUserInfos, v7, v15))
    {
LABEL_23:
      v16 = 0;
      goto LABEL_24;
    }
    has = (char)self->_has;
    v13 = *((_BYTE *)v4 + 52);
  }
  v16 = (v13 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_targetPartition != *((_DWORD *)v4 + 12))
      goto LABEL_23;
    v16 = 1;
  }
LABEL_24:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_code;
  else
    v4 = 0;
  v5 = objc_msgSend_hash(self->_message, a2, v2);
  v10 = objc_msgSend_hash(self->_auxiliaryDomain, v6, v7);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_auxiliaryCode;
  else
    v11 = 0;
  v12 = objc_msgSend_hash(self->_auxiliaryUserInfos, v8, v9);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v13 = 2654435761 * self->_targetPartition;
  else
    v13 = 0;
  return v5 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6 = v4;
  if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    self->_code = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
  v7 = *((_QWORD *)v4 + 5);
  if (v7)
    objc_msgSend_setMessage_(self, v5, v7);
  v8 = *((_QWORD *)v6 + 2);
  if (v8)
    objc_msgSend_setAuxiliaryDomain_(self, v5, v8);
  if ((*((_BYTE *)v6 + 52) & 1) != 0)
  {
    self->_auxiliaryCode = *((_DWORD *)v6 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = *((id *)v6 + 3);
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v16, v20, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend_addAuxiliaryUserInfo_(self, v12, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v16, v20, 16);
    }
    while (v13);
  }

  if ((*((_BYTE *)v6 + 52) & 4) != 0)
  {
    self->_targetPartition = *((_DWORD *)v6 + 12);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)auxiliaryDomain
{
  return self->_auxiliaryDomain;
}

- (void)setAuxiliaryDomain:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryDomain, a3);
}

- (int)auxiliaryCode
{
  return self->_auxiliaryCode;
}

- (NSMutableArray)auxiliaryUserInfos
{
  return self->_auxiliaryUserInfos;
}

- (void)setAuxiliaryUserInfos:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryUserInfos, a3);
}

- (int)targetPartition
{
  return self->_targetPartition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_auxiliaryUserInfos, 0);
  objc_storeStrong((id *)&self->_auxiliaryDomain, 0);
}

@end
