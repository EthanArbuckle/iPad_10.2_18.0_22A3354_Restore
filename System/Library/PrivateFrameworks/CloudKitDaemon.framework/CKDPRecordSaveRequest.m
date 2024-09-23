@implementation CKDPRecordSaveRequest

+ (id)options
{
  if (qword_1ED700960 != -1)
    dispatch_once(&qword_1ED700960, &unk_1E7832F70);
  return (id)qword_1ED700958;
}

- (BOOL)hasRecord
{
  return self->_record != 0;
}

- (void)setMerge:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_merge = a3;
}

- (void)setHasMerge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMerge
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearFieldsToDeleteIfExistOnMerges
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_fieldsToDeleteIfExistOnMerges, a2, v2);
}

- (void)addFieldsToDeleteIfExistOnMerge:(id)a3
{
  const char *v4;
  NSMutableArray *fieldsToDeleteIfExistOnMerges;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  fieldsToDeleteIfExistOnMerges = self->_fieldsToDeleteIfExistOnMerges;
  v8 = (char *)v4;
  if (!fieldsToDeleteIfExistOnMerges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fieldsToDeleteIfExistOnMerges;
    self->_fieldsToDeleteIfExistOnMerges = v6;

    v4 = v8;
    fieldsToDeleteIfExistOnMerges = self->_fieldsToDeleteIfExistOnMerges;
  }
  objc_msgSend_addObject_(fieldsToDeleteIfExistOnMerges, v4, (uint64_t)v4);

}

- (unint64_t)fieldsToDeleteIfExistOnMergesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_fieldsToDeleteIfExistOnMerges, a2, v2);
}

- (id)fieldsToDeleteIfExistOnMergeAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fieldsToDeleteIfExistOnMerges, a2, a3);
}

+ (Class)fieldsToDeleteIfExistOnMergeType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasConflictLoserUpdate
{
  return self->_conflictLoserUpdate != 0;
}

- (int)saveSemantics
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_saveSemantics;
  else
    return 3;
}

- (void)setSaveSemantics:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_saveSemantics = a3;
}

- (void)setHasSaveSemantics:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSaveSemantics
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)saveSemanticsAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7832F90[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSaveSemantics:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("failIfOutdated")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("failIfExists")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("override")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasZoneProtectionInfoTag
{
  return self->_zoneProtectionInfoTag != 0;
}

- (BOOL)hasRecordProtectionInfoTag
{
  return self->_recordProtectionInfoTag != 0;
}

- (void)clearConflictLosersToResolves
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_conflictLosersToResolves, a2, v2);
}

- (void)addConflictLosersToResolve:(id)a3
{
  const char *v4;
  NSMutableArray *conflictLosersToResolves;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  conflictLosersToResolves = self->_conflictLosersToResolves;
  v8 = (char *)v4;
  if (!conflictLosersToResolves)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_conflictLosersToResolves;
    self->_conflictLosersToResolves = v6;

    v4 = v8;
    conflictLosersToResolves = self->_conflictLosersToResolves;
  }
  objc_msgSend_addObject_(conflictLosersToResolves, v4, (uint64_t)v4);

}

- (unint64_t)conflictLosersToResolvesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_conflictLosersToResolves, a2, v2);
}

- (id)conflictLosersToResolveAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_conflictLosersToResolves, a2, a3);
}

+ (Class)conflictLosersToResolveType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasShareEtag
{
  return self->_shareEtag != 0;
}

- (BOOL)hasShareIDUpdate
{
  return self->_shareIDUpdate != 0;
}

- (BOOL)hasParentChainProtectionInfoTag
{
  return self->_parentChainProtectionInfoTag != 0;
}

- (BOOL)hasRequestedFields
{
  return self->_requestedFields != 0;
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
  v11.super_class = (Class)CKDPRecordSaveRequest;
  -[CKDPRecordSaveRequest description](&v11, sel_description);
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
  CKDPRecord *record;
  void *v8;
  const char *v9;
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
  NSString *etag;
  CKDPRecordSaveRequestConflictLoserUpdate *conflictLoserUpdate;
  void *v32;
  const char *v33;
  unsigned int v34;
  __CFString *v35;
  NSString *zoneProtectionInfoTag;
  NSString *recordProtectionInfoTag;
  NSMutableArray *conflictLosersToResolves;
  NSString *shareEtag;
  CKDPRecordSaveRequestShareIdUpdate *shareIDUpdate;
  void *v41;
  const char *v42;
  NSString *parentChainProtectionInfoTag;
  CKDPRequestedFields *requestedFields;
  void *v45;
  const char *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  record = self->_record;
  if (record)
  {
    objc_msgSend_dictionaryRepresentation(record, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("record"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_merge);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("merge"));

  }
  if (objc_msgSend_count(self->_fieldsToDeleteIfExistOnMerges, v4, v5))
  {
    v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v16 = objc_msgSend_count(self->_fieldsToDeleteIfExistOnMerges, v14, v15);
    v18 = (void *)objc_msgSend_initWithCapacity_(v13, v17, v16);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v19 = self->_fieldsToDeleteIfExistOnMerges;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v48, v52, 16);
    if (v21)
    {
      v24 = v21;
      v25 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v49 != v25)
            objc_enumerationMutation(v19);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v48 + 1) + 8 * i), v22, v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v18, v28, (uint64_t)v27);

        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v48, v52, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v18, CFSTR("fieldsToDeleteIfExistOnMerge"));
  }
  etag = self->_etag;
  if (etag)
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)etag, CFSTR("etag"));
  conflictLoserUpdate = self->_conflictLoserUpdate;
  if (conflictLoserUpdate)
  {
    objc_msgSend_dictionaryRepresentation(conflictLoserUpdate, v12, (uint64_t)etag);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v33, (uint64_t)v32, CFSTR("conflictLoserUpdate"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v34 = self->_saveSemantics - 1;
    if (v34 >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("(unknown: %i)"), self->_saveSemantics);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E7832F90[v34];
    }
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v35, CFSTR("saveSemantics"));

  }
  zoneProtectionInfoTag = self->_zoneProtectionInfoTag;
  if (zoneProtectionInfoTag)
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)zoneProtectionInfoTag, CFSTR("zoneProtectionInfoTag"));
  recordProtectionInfoTag = self->_recordProtectionInfoTag;
  if (recordProtectionInfoTag)
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)recordProtectionInfoTag, CFSTR("recordProtectionInfoTag"));
  conflictLosersToResolves = self->_conflictLosersToResolves;
  if (conflictLosersToResolves)
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)conflictLosersToResolves, CFSTR("conflictLosersToResolve"));
  shareEtag = self->_shareEtag;
  if (shareEtag)
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)shareEtag, CFSTR("shareEtag"));
  shareIDUpdate = self->_shareIDUpdate;
  if (shareIDUpdate)
  {
    objc_msgSend_dictionaryRepresentation(shareIDUpdate, v12, (uint64_t)shareEtag);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v42, (uint64_t)v41, CFSTR("shareIDUpdate"));

  }
  parentChainProtectionInfoTag = self->_parentChainProtectionInfoTag;
  if (parentChainProtectionInfoTag)
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)parentChainProtectionInfoTag, CFSTR("parentChainProtectionInfoTag"));
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_dictionaryRepresentation(requestedFields, v12, (uint64_t)parentChainProtectionInfoTag);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v46, (uint64_t)v45, CFSTR("requestedFields"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAD4870((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_record)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_fieldsToDeleteIfExistOnMerges;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v23, v28, 16);
    }
    while (v8);
  }

  if (self->_etag)
    PBDataWriterWriteStringField();
  if (self->_conflictLoserUpdate)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_zoneProtectionInfoTag)
    PBDataWriterWriteStringField();
  if (self->_recordProtectionInfoTag)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_conflictLosersToResolves;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v19, v27, 16);
    }
    while (v15);
  }

  if (self->_shareEtag)
    PBDataWriterWriteStringField();
  if (self->_shareIDUpdate)
    PBDataWriterWriteSubmessage();
  if (self->_parentChainProtectionInfoTag)
    PBDataWriterWriteStringField();
  if (self->_requestedFields)
    PBDataWriterWriteSubmessage();

}

- (unsigned)requestTypeCode
{
  return 5;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  CKDPRecord *record;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  NSString *etag;
  CKDPRecordSaveRequestConflictLoserUpdate *conflictLoserUpdate;
  _BYTE *v18;
  NSString *zoneProtectionInfoTag;
  NSString *recordProtectionInfoTag;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  const char *v29;
  NSString *shareEtag;
  CKDPRecordSaveRequestShareIdUpdate *shareIDUpdate;
  void *v32;
  NSString *parentChainProtectionInfoTag;
  CKDPRequestedFields *requestedFields;
  _BYTE *v35;

  v4 = a3;
  record = self->_record;
  v35 = v4;
  if (record)
  {
    objc_msgSend_setRecord_(v4, v5, (uint64_t)record);
    v4 = v35;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[104] = self->_merge;
    v4[108] |= 2u;
  }
  if (objc_msgSend_fieldsToDeleteIfExistOnMergesCount(self, v5, (uint64_t)record))
  {
    objc_msgSend_clearFieldsToDeleteIfExistOnMerges(v35, v7, v8);
    v11 = objc_msgSend_fieldsToDeleteIfExistOnMergesCount(self, v9, v10);
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_fieldsToDeleteIfExistOnMergeAtIndex_(self, v7, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addFieldsToDeleteIfExistOnMerge_(v35, v15, (uint64_t)v14);

      }
    }
  }
  etag = self->_etag;
  if (etag)
    objc_msgSend_setEtag_(v35, v7, (uint64_t)etag);
  conflictLoserUpdate = self->_conflictLoserUpdate;
  v18 = v35;
  if (conflictLoserUpdate)
  {
    objc_msgSend_setConflictLoserUpdate_(v35, v7, (uint64_t)conflictLoserUpdate);
    v18 = v35;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v18 + 18) = self->_saveSemantics;
    v18[108] |= 1u;
  }
  zoneProtectionInfoTag = self->_zoneProtectionInfoTag;
  if (zoneProtectionInfoTag)
    objc_msgSend_setZoneProtectionInfoTag_(v35, v7, (uint64_t)zoneProtectionInfoTag);
  recordProtectionInfoTag = self->_recordProtectionInfoTag;
  if (recordProtectionInfoTag)
    objc_msgSend_setRecordProtectionInfoTag_(v35, v7, (uint64_t)recordProtectionInfoTag);
  if (objc_msgSend_conflictLosersToResolvesCount(self, v7, (uint64_t)recordProtectionInfoTag))
  {
    objc_msgSend_clearConflictLosersToResolves(v35, v21, v22);
    v25 = objc_msgSend_conflictLosersToResolvesCount(self, v23, v24);
    if (v25)
    {
      v26 = v25;
      for (j = 0; j != v26; ++j)
      {
        objc_msgSend_conflictLosersToResolveAtIndex_(self, v21, j);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addConflictLosersToResolve_(v35, v29, (uint64_t)v28);

      }
    }
  }
  shareEtag = self->_shareEtag;
  if (shareEtag)
    objc_msgSend_setShareEtag_(v35, v21, (uint64_t)shareEtag);
  shareIDUpdate = self->_shareIDUpdate;
  v32 = v35;
  if (shareIDUpdate)
  {
    objc_msgSend_setShareIDUpdate_(v35, v21, (uint64_t)shareIDUpdate);
    v32 = v35;
  }
  parentChainProtectionInfoTag = self->_parentChainProtectionInfoTag;
  if (parentChainProtectionInfoTag)
  {
    objc_msgSend_setParentChainProtectionInfoTag_(v35, v21, (uint64_t)parentChainProtectionInfoTag);
    v32 = v35;
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_setRequestedFields_(v35, v21, (uint64_t)requestedFields);
    v32 = v35;
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
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  NSMutableArray *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_record, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v10 + 104) = self->_merge;
    *(_BYTE *)(v10 + 108) |= 2u;
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v14 = self->_fieldsToDeleteIfExistOnMerges;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v61, v66, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v62 != v19)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v61 + 1) + 8 * i), v17, (uint64_t)a3);
        objc_msgSend_addFieldsToDeleteIfExistOnMerge_((void *)v10, v22, (uint64_t)v21);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v61, v66, 16);
    }
    while (v18);
  }

  v24 = objc_msgSend_copyWithZone_(self->_etag, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v24;

  v27 = objc_msgSend_copyWithZone_(self->_conflictLoserUpdate, v26, (uint64_t)a3);
  v28 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v27;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 72) = self->_saveSemantics;
    *(_BYTE *)(v10 + 108) |= 1u;
  }
  v30 = objc_msgSend_copyWithZone_(self->_zoneProtectionInfoTag, v29, (uint64_t)a3);
  v31 = *(void **)(v10 + 96);
  *(_QWORD *)(v10 + 96) = v30;

  v33 = objc_msgSend_copyWithZone_(self->_recordProtectionInfoTag, v32, (uint64_t)a3);
  v34 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v33;

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v35 = self->_conflictLosersToResolves;
  v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v57, v65, 16);
  if (v37)
  {
    v39 = v37;
    v40 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v58 != v40)
          objc_enumerationMutation(v35);
        v42 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v57 + 1) + 8 * j), v38, (uint64_t)a3, (_QWORD)v57);
        objc_msgSend_addConflictLosersToResolve_((void *)v10, v43, (uint64_t)v42);

      }
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v57, v65, 16);
    }
    while (v39);
  }

  v45 = objc_msgSend_copyWithZone_(self->_shareEtag, v44, (uint64_t)a3);
  v46 = *(void **)(v10 + 80);
  *(_QWORD *)(v10 + 80) = v45;

  v48 = objc_msgSend_copyWithZone_(self->_shareIDUpdate, v47, (uint64_t)a3);
  v49 = *(void **)(v10 + 88);
  *(_QWORD *)(v10 + 88) = v48;

  v51 = objc_msgSend_copyWithZone_(self->_parentChainProtectionInfoTag, v50, (uint64_t)a3);
  v52 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v51;

  v54 = objc_msgSend_copyWithZone_(self->_requestedFields, v53, (uint64_t)a3);
  v55 = *(void **)(v10 + 64);
  *(_QWORD *)(v10 + 64) = v54;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecord *record;
  uint64_t v9;
  NSMutableArray *fieldsToDeleteIfExistOnMerges;
  uint64_t v11;
  NSString *etag;
  uint64_t v13;
  CKDPRecordSaveRequestConflictLoserUpdate *conflictLoserUpdate;
  uint64_t v15;
  NSString *zoneProtectionInfoTag;
  uint64_t v17;
  NSString *recordProtectionInfoTag;
  uint64_t v19;
  NSMutableArray *conflictLosersToResolves;
  uint64_t v21;
  NSString *shareEtag;
  uint64_t v23;
  CKDPRecordSaveRequestShareIdUpdate *shareIDUpdate;
  uint64_t v25;
  NSString *parentChainProtectionInfoTag;
  uint64_t v27;
  CKDPRequestedFields *requestedFields;
  uint64_t v29;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_37;
  record = self->_record;
  v9 = v4[6];
  if ((unint64_t)record | v9)
  {
    if (!objc_msgSend_isEqual_(record, v7, v9))
      goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 2) != 0)
    {
      if (self->_merge)
      {
        if (!*((_BYTE *)v4 + 104))
          goto LABEL_37;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_12;
    }
LABEL_37:
    isEqual = 0;
    goto LABEL_38;
  }
  if ((*((_BYTE *)v4 + 108) & 2) != 0)
    goto LABEL_37;
LABEL_12:
  fieldsToDeleteIfExistOnMerges = self->_fieldsToDeleteIfExistOnMerges;
  v11 = v4[4];
  if ((unint64_t)fieldsToDeleteIfExistOnMerges | v11
    && !objc_msgSend_isEqual_(fieldsToDeleteIfExistOnMerges, v7, v11))
  {
    goto LABEL_37;
  }
  etag = self->_etag;
  v13 = v4[3];
  if ((unint64_t)etag | v13)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v13))
      goto LABEL_37;
  }
  conflictLoserUpdate = self->_conflictLoserUpdate;
  v15 = v4[1];
  if ((unint64_t)conflictLoserUpdate | v15)
  {
    if (!objc_msgSend_isEqual_(conflictLoserUpdate, v7, v15))
      goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 1) == 0 || self->_saveSemantics != *((_DWORD *)v4 + 18))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
    goto LABEL_37;
  }
  zoneProtectionInfoTag = self->_zoneProtectionInfoTag;
  v17 = v4[12];
  if ((unint64_t)zoneProtectionInfoTag | v17
    && !objc_msgSend_isEqual_(zoneProtectionInfoTag, v7, v17))
  {
    goto LABEL_37;
  }
  recordProtectionInfoTag = self->_recordProtectionInfoTag;
  v19 = v4[7];
  if ((unint64_t)recordProtectionInfoTag | v19)
  {
    if (!objc_msgSend_isEqual_(recordProtectionInfoTag, v7, v19))
      goto LABEL_37;
  }
  conflictLosersToResolves = self->_conflictLosersToResolves;
  v21 = v4[2];
  if ((unint64_t)conflictLosersToResolves | v21)
  {
    if (!objc_msgSend_isEqual_(conflictLosersToResolves, v7, v21))
      goto LABEL_37;
  }
  shareEtag = self->_shareEtag;
  v23 = v4[10];
  if ((unint64_t)shareEtag | v23)
  {
    if (!objc_msgSend_isEqual_(shareEtag, v7, v23))
      goto LABEL_37;
  }
  shareIDUpdate = self->_shareIDUpdate;
  v25 = v4[11];
  if ((unint64_t)shareIDUpdate | v25)
  {
    if (!objc_msgSend_isEqual_(shareIDUpdate, v7, v25))
      goto LABEL_37;
  }
  parentChainProtectionInfoTag = self->_parentChainProtectionInfoTag;
  v27 = v4[5];
  if ((unint64_t)parentChainProtectionInfoTag | v27)
  {
    if (!objc_msgSend_isEqual_(parentChainProtectionInfoTag, v7, v27))
      goto LABEL_37;
  }
  requestedFields = self->_requestedFields;
  v29 = v4[8];
  if ((unint64_t)requestedFields | v29)
    isEqual = objc_msgSend_isEqual_(requestedFields, v7, v29);
  else
    isEqual = 1;
LABEL_38:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;

  v6 = objc_msgSend_hash(self->_record, a2, v2);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_merge;
  else
    v7 = 0;
  v8 = objc_msgSend_hash(self->_fieldsToDeleteIfExistOnMerges, v4, v5);
  v11 = objc_msgSend_hash(self->_etag, v9, v10);
  v14 = objc_msgSend_hash(self->_conflictLoserUpdate, v12, v13);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v17 = 2654435761 * self->_saveSemantics;
  else
    v17 = 0;
  v18 = v7 ^ v6 ^ v8 ^ v11 ^ v14 ^ v17 ^ objc_msgSend_hash(self->_zoneProtectionInfoTag, v15, v16);
  v21 = objc_msgSend_hash(self->_recordProtectionInfoTag, v19, v20);
  v24 = v21 ^ objc_msgSend_hash(self->_conflictLosersToResolves, v22, v23);
  v27 = v24 ^ objc_msgSend_hash(self->_shareEtag, v25, v26);
  v30 = v18 ^ v27 ^ objc_msgSend_hash(self->_shareIDUpdate, v28, v29);
  v33 = objc_msgSend_hash(self->_parentChainProtectionInfoTag, v31, v32);
  return v30 ^ v33 ^ objc_msgSend_hash(self->_requestedFields, v34, v35);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPRecord *record;
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
  CKDPRecordSaveRequestConflictLoserUpdate *conflictLoserUpdate;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  const char *v28;
  uint64_t v29;
  CKDPRecordSaveRequestShareIdUpdate *shareIDUpdate;
  uint64_t v31;
  uint64_t v32;
  CKDPRequestedFields *requestedFields;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  record = self->_record;
  v7 = *((_QWORD *)v5 + 6);
  if (record)
  {
    if (v7)
      objc_msgSend_mergeFrom_(record, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setRecord_(self, v4, v7);
  }
  if ((*((_BYTE *)v5 + 108) & 2) != 0)
  {
    self->_merge = *((_BYTE *)v5 + 104);
    *(_BYTE *)&self->_has |= 2u;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = *((id *)v5 + 4);
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v39, v44, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(v8);
        objc_msgSend_addFieldsToDeleteIfExistOnMerge_(self, v11, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v39, v44, 16);
    }
    while (v12);
  }

  v16 = *((_QWORD *)v5 + 3);
  if (v16)
    objc_msgSend_setEtag_(self, v15, v16);
  conflictLoserUpdate = self->_conflictLoserUpdate;
  v18 = *((_QWORD *)v5 + 1);
  if (conflictLoserUpdate)
  {
    if (v18)
      objc_msgSend_mergeFrom_(conflictLoserUpdate, v15, v18);
  }
  else if (v18)
  {
    objc_msgSend_setConflictLoserUpdate_(self, v15, v18);
  }
  if ((*((_BYTE *)v5 + 108) & 1) != 0)
  {
    self->_saveSemantics = *((_DWORD *)v5 + 18);
    *(_BYTE *)&self->_has |= 1u;
  }
  v19 = *((_QWORD *)v5 + 12);
  if (v19)
    objc_msgSend_setZoneProtectionInfoTag_(self, v15, v19);
  v20 = *((_QWORD *)v5 + 7);
  if (v20)
    objc_msgSend_setRecordProtectionInfoTag_(self, v15, v20);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = *((id *)v5 + 2);
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v35, v43, 16);
  if (v23)
  {
    v25 = v23;
    v26 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v21);
        objc_msgSend_addConflictLosersToResolve_(self, v24, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), (_QWORD)v35);
      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v35, v43, 16);
    }
    while (v25);
  }

  v29 = *((_QWORD *)v5 + 10);
  if (v29)
    objc_msgSend_setShareEtag_(self, v28, v29);
  shareIDUpdate = self->_shareIDUpdate;
  v31 = *((_QWORD *)v5 + 11);
  if (shareIDUpdate)
  {
    if (v31)
      objc_msgSend_mergeFrom_(shareIDUpdate, v28, v31);
  }
  else if (v31)
  {
    objc_msgSend_setShareIDUpdate_(self, v28, v31);
  }
  v32 = *((_QWORD *)v5 + 5);
  if (v32)
    objc_msgSend_setParentChainProtectionInfoTag_(self, v28, v32);
  requestedFields = self->_requestedFields;
  v34 = *((_QWORD *)v5 + 8);
  if (requestedFields)
  {
    if (v34)
      objc_msgSend_mergeFrom_(requestedFields, v28, v34);
  }
  else if (v34)
  {
    objc_msgSend_setRequestedFields_(self, v28, v34);
  }

}

- (CKDPRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (BOOL)merge
{
  return self->_merge;
}

- (NSMutableArray)fieldsToDeleteIfExistOnMerges
{
  return self->_fieldsToDeleteIfExistOnMerges;
}

- (void)setFieldsToDeleteIfExistOnMerges:(id)a3
{
  objc_storeStrong((id *)&self->_fieldsToDeleteIfExistOnMerges, a3);
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (CKDPRecordSaveRequestConflictLoserUpdate)conflictLoserUpdate
{
  return self->_conflictLoserUpdate;
}

- (void)setConflictLoserUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_conflictLoserUpdate, a3);
}

- (NSString)zoneProtectionInfoTag
{
  return self->_zoneProtectionInfoTag;
}

- (void)setZoneProtectionInfoTag:(id)a3
{
  objc_storeStrong((id *)&self->_zoneProtectionInfoTag, a3);
}

- (NSString)recordProtectionInfoTag
{
  return self->_recordProtectionInfoTag;
}

- (void)setRecordProtectionInfoTag:(id)a3
{
  objc_storeStrong((id *)&self->_recordProtectionInfoTag, a3);
}

- (NSMutableArray)conflictLosersToResolves
{
  return self->_conflictLosersToResolves;
}

- (void)setConflictLosersToResolves:(id)a3
{
  objc_storeStrong((id *)&self->_conflictLosersToResolves, a3);
}

- (NSString)shareEtag
{
  return self->_shareEtag;
}

- (void)setShareEtag:(id)a3
{
  objc_storeStrong((id *)&self->_shareEtag, a3);
}

- (CKDPRecordSaveRequestShareIdUpdate)shareIDUpdate
{
  return self->_shareIDUpdate;
}

- (void)setShareIDUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_shareIDUpdate, a3);
}

- (NSString)parentChainProtectionInfoTag
{
  return self->_parentChainProtectionInfoTag;
}

- (void)setParentChainProtectionInfoTag:(id)a3
{
  objc_storeStrong((id *)&self->_parentChainProtectionInfoTag, a3);
}

- (CKDPRequestedFields)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(id)a3
{
  objc_storeStrong((id *)&self->_requestedFields, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneProtectionInfoTag, 0);
  objc_storeStrong((id *)&self->_shareIDUpdate, 0);
  objc_storeStrong((id *)&self->_shareEtag, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_recordProtectionInfoTag, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_parentChainProtectionInfoTag, 0);
  objc_storeStrong((id *)&self->_fieldsToDeleteIfExistOnMerges, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_conflictLosersToResolves, 0);
  objc_storeStrong((id *)&self->_conflictLoserUpdate, 0);
}

@end
