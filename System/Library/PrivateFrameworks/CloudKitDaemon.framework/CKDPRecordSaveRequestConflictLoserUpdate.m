@implementation CKDPRecordSaveRequestConflictLoserUpdate

- (void)clearConflictLoserEtags
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_conflictLoserEtags, a2, v2);
}

- (void)addConflictLoserEtags:(id)a3
{
  const char *v4;
  NSMutableArray *conflictLoserEtags;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  conflictLoserEtags = self->_conflictLoserEtags;
  v8 = (char *)v4;
  if (!conflictLoserEtags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_conflictLoserEtags;
    self->_conflictLoserEtags = v6;

    v4 = v8;
    conflictLoserEtags = self->_conflictLoserEtags;
  }
  objc_msgSend_addObject_(conflictLoserEtags, v4, (uint64_t)v4);

}

- (unint64_t)conflictLoserEtagsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_conflictLoserEtags, a2, v2);
}

- (id)conflictLoserEtagsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_conflictLoserEtags, a2, a3);
}

+ (Class)conflictLoserEtagsType
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
  v11.super_class = (Class)CKDPRecordSaveRequestConflictLoserUpdate;
  -[CKDPRecordSaveRequestConflictLoserUpdate description](&v11, sel_description);
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
  NSMutableArray *conflictLoserEtags;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  conflictLoserEtags = self->_conflictLoserEtags;
  if (conflictLoserEtags)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)conflictLoserEtags, CFSTR("conflictLoserEtags"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC0E0B8(self, (uint64_t)a3);
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
  v5 = self->_conflictLoserEtags;
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
        PBDataWriterWriteStringField();
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
  if (objc_msgSend_conflictLoserEtagsCount(self, v4, v5))
  {
    objc_msgSend_clearConflictLoserEtags(v16, v6, v7);
    v10 = objc_msgSend_conflictLoserEtagsCount(self, v8, v9);
    if (v10)
    {
      v12 = v10;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_conflictLoserEtagsAtIndex_(self, v11, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addConflictLoserEtags_(v16, v15, (uint64_t)v14);

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
  void *v10;
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
  v10 = (void *)objc_msgSend_init(v7, v8, v9);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = self->_conflictLoserEtags;
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
        objc_msgSend_addConflictLoserEtags_(v10, v19, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v21, v25, 16);
    }
    while (v15);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSMutableArray *conflictLoserEtags;
  uint64_t v9;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    conflictLoserEtags = self->_conflictLoserEtags;
    v9 = v4[1];
    if ((unint64_t)conflictLoserEtags | v9)
      isEqual = objc_msgSend_isEqual_(conflictLoserEtags, v7, v9);
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

  return objc_msgSend_hash(self->_conflictLoserEtags, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *((id *)a3 + 1);
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v11, v15, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v4);
        objc_msgSend_addConflictLoserEtags_(self, v7, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v11, v15, 16);
    }
    while (v8);
  }

}

- (NSMutableArray)conflictLoserEtags
{
  return self->_conflictLoserEtags;
}

- (void)setConflictLoserEtags:(id)a3
{
  objc_storeStrong((id *)&self->_conflictLoserEtags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictLoserEtags, 0);
}

@end
