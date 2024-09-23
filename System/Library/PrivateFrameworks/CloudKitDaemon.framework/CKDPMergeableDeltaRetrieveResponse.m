@implementation CKDPMergeableDeltaRetrieveResponse

- (void)clearDeltas
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_deltas, a2, v2);
}

- (void)addDeltas:(id)a3
{
  const char *v4;
  NSMutableArray *deltas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  deltas = self->_deltas;
  v8 = (char *)v4;
  if (!deltas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_deltas;
    self->_deltas = v6;

    v4 = v8;
    deltas = self->_deltas;
  }
  objc_msgSend_addObject_(deltas, v4, (uint64_t)v4);

}

- (unint64_t)deltasCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_deltas, a2, v2);
}

- (id)deltasAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_deltas, a2, a3);
}

+ (Class)deltasType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContinuation
{
  return self->_continuation != 0;
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
  v11.super_class = (Class)CKDPMergeableDeltaRetrieveResponse;
  -[CKDPMergeableDeltaRetrieveResponse description](&v11, sel_description);
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
  uint64_t i;
  void *v22;
  const char *v23;
  const char *v24;
  NSData *continuation;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_deltas, v5, v6))
  {
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v11 = objc_msgSend_count(self->_deltas, v9, v10);
    v13 = (void *)objc_msgSend_initWithCapacity_(v8, v12, v11);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v14 = self->_deltas;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v27, v31, 16);
    if (v16)
    {
      v19 = v16;
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v14);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v27 + 1) + 8 * i), v17, v18, (_QWORD)v27);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v27, v31, 16);
      }
      while (v19);
    }

    objc_msgSend_setObject_forKey_(v4, v24, (uint64_t)v13, CFSTR("deltas"));
  }
  continuation = self->_continuation;
  if (continuation)
    objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)continuation, CFSTR("continuation"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC1F184(self, (uint64_t)a3);
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
  v5 = self->_deltas;
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

  if (self->_continuation)
    PBDataWriterWriteDataField();

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
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  NSData *continuation;
  id v16;

  v16 = a3;
  if (objc_msgSend_deltasCount(self, v4, v5))
  {
    objc_msgSend_clearDeltas(v16, v6, v7);
    v10 = objc_msgSend_deltasCount(self, v8, v9);
    if (v10)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend_deltasAtIndex_(self, v6, i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addDeltas_(v16, v14, (uint64_t)v13);

      }
    }
  }
  continuation = self->_continuation;
  if (continuation)
    objc_msgSend_setContinuation_(v16, v6, (uint64_t)continuation);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  NSMutableArray *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = self->_deltas;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v24, v28, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v11);
        v18 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v17), v14, (uint64_t)a3, (_QWORD)v24);
        objc_msgSend_addDeltas_(v10, v19, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v24, v28, 16);
    }
    while (v15);
  }

  v21 = objc_msgSend_copyWithZone_(self->_continuation, v20, (uint64_t)a3);
  v22 = (void *)v10[1];
  v10[1] = v21;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSMutableArray *deltas;
  uint64_t v9;
  NSData *continuation;
  uint64_t v11;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((deltas = self->_deltas, v9 = v4[2], !((unint64_t)deltas | v9))
     || objc_msgSend_isEqual_(deltas, v7, v9)))
  {
    continuation = self->_continuation;
    v11 = v4[1];
    if ((unint64_t)continuation | v11)
      isEqual = objc_msgSend_isEqual_(continuation, v7, v11);
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

  v4 = objc_msgSend_hash(self->_deltas, a2, v2);
  return objc_msgSend_hash(self->_continuation, v5, v6) ^ v4;
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
  uint64_t i;
  const char *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = *((id *)v4 + 2);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v14, v18, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend_addDeltas_(self, v8, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v14, v18, 16);
    }
    while (v9);
  }

  v13 = *((_QWORD *)v4 + 1);
  if (v13)
    objc_msgSend_setContinuation_(self, v12, v13);

}

- (NSMutableArray)deltas
{
  return self->_deltas;
}

- (void)setDeltas:(id)a3
{
  objc_storeStrong((id *)&self->_deltas, a3);
}

- (NSData)continuation
{
  return self->_continuation;
}

- (void)setContinuation:(id)a3
{
  objc_storeStrong((id *)&self->_continuation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deltas, 0);
  objc_storeStrong((id *)&self->_continuation, 0);
}

@end
