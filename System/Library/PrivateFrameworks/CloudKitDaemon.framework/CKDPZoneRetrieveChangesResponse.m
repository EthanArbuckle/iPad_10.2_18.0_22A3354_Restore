@implementation CKDPZoneRetrieveChangesResponse

- (NSData)syncContinuationToken
{
  return self->_syncContinuationToken;
}

- (int)status
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_status;
  else
    return 1;
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (NSMutableArray)changedZones
{
  return self->_changedZones;
}

- (void)addChangedZones:(id)a3
{
  const char *v4;
  NSMutableArray *changedZones;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  changedZones = self->_changedZones;
  v8 = (char *)v4;
  if (!changedZones)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_changedZones;
    self->_changedZones = v6;

    v4 = v8;
    changedZones = self->_changedZones;
  }
  objc_msgSend_addObject_(changedZones, v4, (uint64_t)v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncContinuationToken, 0);
  objc_storeStrong((id *)&self->_changedZones, 0);
}

- (void)clearChangedZones
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_changedZones, a2, v2);
}

- (unint64_t)changedZonesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_changedZones, a2, v2);
}

- (id)changedZonesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_changedZones, a2, a3);
}

+ (Class)changedZonesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSyncContinuationToken
{
  return self->_syncContinuationToken != 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)statusAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("hasPendingChanges");
  if (a3 == 2)
  {
    v3 = CFSTR("syncComplete");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("hasPendingChanges")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("syncComplete")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
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
  v11.super_class = (Class)CKDPZoneRetrieveChangesResponse;
  -[CKDPZoneRetrieveChangesResponse description](&v11, sel_description);
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
  NSData *syncContinuationToken;
  int status;
  __CFString *v27;
  const char *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_changedZones, v5, v6))
  {
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v11 = objc_msgSend_count(self->_changedZones, v9, v10);
    v13 = (void *)objc_msgSend_initWithCapacity_(v8, v12, v11);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v14 = self->_changedZones;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v30, v34, 16);
    if (v16)
    {
      v19 = v16;
      v20 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v14);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v30 + 1) + 8 * i), v17, v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v30, v34, 16);
      }
      while (v19);
    }

    objc_msgSend_setObject_forKey_(v4, v24, (uint64_t)v13, CFSTR("changedZones"));
  }
  syncContinuationToken = self->_syncContinuationToken;
  if (syncContinuationToken)
    objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)syncContinuationToken, CFSTR("syncContinuationToken"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    status = self->_status;
    if (status == 1)
    {
      v27 = CFSTR("hasPendingChanges");
      objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)CFSTR("hasPendingChanges"), CFSTR("status"));
    }
    else if (status == 2)
    {
      v27 = CFSTR("syncComplete");
      objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)CFSTR("syncComplete"), CFSTR("status"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("(unknown: %i)"), self->_status);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v4, v28, (uint64_t)v27, CFSTR("status"));
    }

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BE9C6DE8((uint64_t)self, (uint64_t)a3);
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
  v5 = self->_changedZones;
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

  if (self->_syncContinuationToken)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

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
  NSData *syncContinuationToken;
  id v16;

  v16 = a3;
  if (objc_msgSend_changedZonesCount(self, v4, v5))
  {
    objc_msgSend_clearChangedZones(v16, v6, v7);
    v10 = objc_msgSend_changedZonesCount(self, v8, v9);
    if (v10)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend_changedZonesAtIndex_(self, v6, i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addChangedZones_(v16, v14, (uint64_t)v13);

      }
    }
  }
  syncContinuationToken = self->_syncContinuationToken;
  if (syncContinuationToken)
    objc_msgSend_setSyncContinuationToken_(v16, v6, (uint64_t)syncContinuationToken);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v16 + 4) = self->_status;
    *((_BYTE *)v16 + 32) |= 1u;
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
  uint64_t i;
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
  v10 = objc_msgSend_init(v7, v8, v9);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = self->_changedZones;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v24, v28, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v11);
        v18 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v24 + 1) + 8 * i), v14, (uint64_t)a3, (_QWORD)v24);
        objc_msgSend_addChangedZones_((void *)v10, v19, (uint64_t)v18);

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v24, v28, 16);
    }
    while (v15);
  }

  v21 = objc_msgSend_copyWithZone_(self->_syncContinuationToken, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v21;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 16) = self->_status;
    *(_BYTE *)(v10 + 32) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSMutableArray *changedZones;
  uint64_t v9;
  NSData *syncContinuationToken;
  uint64_t v11;
  BOOL v12;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_10;
  changedZones = self->_changedZones;
  v9 = v4[1];
  if ((unint64_t)changedZones | v9)
  {
    if (!objc_msgSend_isEqual_(changedZones, v7, v9))
      goto LABEL_10;
  }
  syncContinuationToken = self->_syncContinuationToken;
  v11 = v4[3];
  if ((unint64_t)syncContinuationToken | v11)
  {
    if (!objc_msgSend_isEqual_(syncContinuationToken, v7, v11))
      goto LABEL_10;
  }
  v12 = (v4[4] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[4] & 1) != 0 && self->_status == *((_DWORD *)v4 + 4))
    {
      v12 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v12 = 0;
  }
LABEL_11:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend_hash(self->_changedZones, a2, v2);
  v7 = objc_msgSend_hash(self->_syncContinuationToken, v5, v6);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_status;
  else
    v8 = 0;
  return v7 ^ v4 ^ v8;
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
  v5 = *((id *)v4 + 1);
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
        objc_msgSend_addChangedZones_(self, v8, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v14, v18, 16);
    }
    while (v9);
  }

  v13 = *((_QWORD *)v4 + 3);
  if (v13)
    objc_msgSend_setSyncContinuationToken_(self, v12, v13);
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_status = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (void)setChangedZones:(id)a3
{
  objc_storeStrong((id *)&self->_changedZones, a3);
}

- (void)setSyncContinuationToken:(id)a3
{
  objc_storeStrong((id *)&self->_syncContinuationToken, a3);
}

@end
