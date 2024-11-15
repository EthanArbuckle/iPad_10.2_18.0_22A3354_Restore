@implementation CKDPRecordRetrieveChangesResponse

- (unint64_t)syncObligationsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_syncObligations, a2, v2);
}

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

- (BOOL)pendingArchivedRecords
{
  return self->_pendingArchivedRecords;
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (NSData)clientChangeToken
{
  return self->_clientChangeToken;
}

- (NSMutableArray)changedRecords
{
  return self->_changedRecords;
}

- (NSMutableArray)changedDeltas
{
  return self->_changedDeltas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneAttributesChange, 0);
  objc_storeStrong((id *)&self->_syncObligations, 0);
  objc_storeStrong((id *)&self->_syncContinuationToken, 0);
  objc_storeStrong((id *)&self->_clientChangeToken, 0);
  objc_storeStrong((id *)&self->_changedShares, 0);
  objc_storeStrong((id *)&self->_changedRecords, 0);
  objc_storeStrong((id *)&self->_changedDeltas, 0);
}

- (void)clearChangedRecords
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_changedRecords, a2, v2);
}

- (void)addChangedRecord:(id)a3
{
  const char *v4;
  NSMutableArray *changedRecords;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  changedRecords = self->_changedRecords;
  v8 = (char *)v4;
  if (!changedRecords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_changedRecords;
    self->_changedRecords = v6;

    v4 = v8;
    changedRecords = self->_changedRecords;
  }
  objc_msgSend_addObject_(changedRecords, v4, (uint64_t)v4);

}

- (unint64_t)changedRecordsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_changedRecords, a2, v2);
}

- (id)changedRecordAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_changedRecords, a2, a3);
}

+ (Class)changedRecordType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSyncContinuationToken
{
  return self->_syncContinuationToken != 0;
}

- (BOOL)hasClientChangeToken
{
  return self->_clientChangeToken != 0;
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
  if ((a3 - 1) < 3)
    return off_1E7835FC8[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("inconsistent")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("consistent")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("noPendingChanges")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)clearChangedShares
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_changedShares, a2, v2);
}

- (void)addChangedShare:(id)a3
{
  const char *v4;
  NSMutableArray *changedShares;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  changedShares = self->_changedShares;
  v8 = (char *)v4;
  if (!changedShares)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_changedShares;
    self->_changedShares = v6;

    v4 = v8;
    changedShares = self->_changedShares;
  }
  objc_msgSend_addObject_(changedShares, v4, (uint64_t)v4);

}

- (unint64_t)changedSharesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_changedShares, a2, v2);
}

- (id)changedShareAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_changedShares, a2, a3);
}

+ (Class)changedShareType
{
  return (Class)objc_opt_class();
}

- (void)setPendingArchivedRecords:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_pendingArchivedRecords = a3;
}

- (void)setHasPendingArchivedRecords:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPendingArchivedRecords
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearChangedDeltas
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_changedDeltas, a2, v2);
}

- (void)addChangedDeltas:(id)a3
{
  const char *v4;
  NSMutableArray *changedDeltas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  changedDeltas = self->_changedDeltas;
  v8 = (char *)v4;
  if (!changedDeltas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_changedDeltas;
    self->_changedDeltas = v6;

    v4 = v8;
    changedDeltas = self->_changedDeltas;
  }
  objc_msgSend_addObject_(changedDeltas, v4, (uint64_t)v4);

}

- (unint64_t)changedDeltasCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_changedDeltas, a2, v2);
}

- (id)changedDeltasAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_changedDeltas, a2, a3);
}

+ (Class)changedDeltasType
{
  return (Class)objc_opt_class();
}

- (void)clearSyncObligations
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_syncObligations, a2, v2);
}

- (void)addSyncObligations:(id)a3
{
  const char *v4;
  NSMutableArray *syncObligations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  syncObligations = self->_syncObligations;
  v8 = (char *)v4;
  if (!syncObligations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_syncObligations;
    self->_syncObligations = v6;

    v4 = v8;
    syncObligations = self->_syncObligations;
  }
  objc_msgSend_addObject_(syncObligations, v4, (uint64_t)v4);

}

- (id)syncObligationsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_syncObligations, a2, a3);
}

+ (Class)syncObligationsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasZoneAttributesChange
{
  return self->_zoneAttributesChange != 0;
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
  v11.super_class = (Class)CKDPRecordRetrieveChangesResponse;
  -[CKDPRecordRetrieveChangesResponse description](&v11, sel_description);
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
  NSData *clientChangeToken;
  unsigned int v27;
  __CFString *v28;
  const char *v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  NSMutableArray *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  const char *v46;
  const char *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
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
  const char *v69;
  uint64_t v70;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  void *v76;
  NSMutableArray *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t m;
  void *v85;
  const char *v86;
  const char *v87;
  CKDPRecordRetrieveChangesResponseZoneAttributesChange *zoneAttributesChange;
  void *v89;
  const char *v90;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_changedRecords, v5, v6))
  {
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v11 = objc_msgSend_count(self->_changedRecords, v9, v10);
    v13 = (void *)objc_msgSend_initWithCapacity_(v8, v12, v11);
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v14 = self->_changedRecords;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v104, v111, 16);
    if (v16)
    {
      v19 = v16;
      v20 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v105 != v20)
            objc_enumerationMutation(v14);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v104 + 1) + 8 * i), v17, v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v104, v111, 16);
      }
      while (v19);
    }

    objc_msgSend_setObject_forKey_(v4, v24, (uint64_t)v13, CFSTR("changedRecord"));
  }
  syncContinuationToken = self->_syncContinuationToken;
  if (syncContinuationToken)
    objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)syncContinuationToken, CFSTR("syncContinuationToken"));
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken)
    objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)clientChangeToken, CFSTR("clientChangeToken"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v27 = self->_status - 1;
    if (v27 >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("(unknown: %i)"), self->_status);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_1E7835FC8[v27];
    }
    objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)v28, CFSTR("status"));

  }
  if (objc_msgSend_count(self->_changedShares, v7, (uint64_t)clientChangeToken))
  {
    v31 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v34 = objc_msgSend_count(self->_changedShares, v32, v33);
    v36 = (void *)objc_msgSend_initWithCapacity_(v31, v35, v34);
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v37 = self->_changedShares;
    v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v100, v110, 16);
    if (v39)
    {
      v42 = v39;
      v43 = *(_QWORD *)v101;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v101 != v43)
            objc_enumerationMutation(v37);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v100 + 1) + 8 * j), v40, v41);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v36, v46, (uint64_t)v45);

        }
        v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v100, v110, 16);
      }
      while (v42);
    }

    objc_msgSend_setObject_forKey_(v4, v47, (uint64_t)v36, CFSTR("changedShare"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v29, self->_pendingArchivedRecords);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v49, (uint64_t)v48, CFSTR("pendingArchivedRecords"));

  }
  if (objc_msgSend_count(self->_changedDeltas, v29, v30))
  {
    v52 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v55 = objc_msgSend_count(self->_changedDeltas, v53, v54);
    v57 = (void *)objc_msgSend_initWithCapacity_(v52, v56, v55);
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v58 = self->_changedDeltas;
    v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v96, v109, 16);
    if (v60)
    {
      v63 = v60;
      v64 = *(_QWORD *)v97;
      do
      {
        for (k = 0; k != v63; ++k)
        {
          if (*(_QWORD *)v97 != v64)
            objc_enumerationMutation(v58);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v96 + 1) + 8 * k), v61, v62);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v57, v67, (uint64_t)v66);

        }
        v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v96, v109, 16);
      }
      while (v63);
    }

    objc_msgSend_setObject_forKey_(v4, v68, (uint64_t)v57, CFSTR("changedDeltas"));
  }
  if (objc_msgSend_count(self->_syncObligations, v50, v51))
  {
    v71 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v74 = objc_msgSend_count(self->_syncObligations, v72, v73);
    v76 = (void *)objc_msgSend_initWithCapacity_(v71, v75, v74);
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v77 = self->_syncObligations;
    v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v78, (uint64_t)&v92, v108, 16);
    if (v79)
    {
      v82 = v79;
      v83 = *(_QWORD *)v93;
      do
      {
        for (m = 0; m != v82; ++m)
        {
          if (*(_QWORD *)v93 != v83)
            objc_enumerationMutation(v77);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v92 + 1) + 8 * m), v80, v81);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v76, v86, (uint64_t)v85);

        }
        v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v80, (uint64_t)&v92, v108, 16);
      }
      while (v82);
    }

    objc_msgSend_setObject_forKey_(v4, v87, (uint64_t)v76, CFSTR("syncObligations"));
  }
  zoneAttributesChange = self->_zoneAttributesChange;
  if (zoneAttributesChange)
  {
    objc_msgSend_dictionaryRepresentation(zoneAttributesChange, v69, v70);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v90, (uint64_t)v89, CFSTR("zoneAttributesChange"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BE9C8A14((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  NSMutableArray *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  __int128 v33;
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
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = self->_changedRecords;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v45, v52, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v46;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v45, v52, 16);
    }
    while (v8);
  }

  if (self->_syncContinuationToken)
    PBDataWriterWriteDataField();
  if (self->_clientChangeToken)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = self->_changedShares;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v41, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v41, v51, 16);
    }
    while (v15);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v19 = self->_changedDeltas;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v37, v50, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v37, v50, 16);
    }
    while (v22);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = self->_syncObligations;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v33, v49, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v34;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(v26);
        PBDataWriterWriteSubmessage();
        ++v31;
      }
      while (v29 != v31);
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v32, (uint64_t)&v33, v49, 16);
    }
    while (v29);
  }

  if (self->_zoneAttributesChange)
    PBDataWriterWriteSubmessage();

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
  NSData *clientChangeToken;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  const char *v43;
  CKDPRecordRetrieveChangesResponseZoneAttributesChange *zoneAttributesChange;
  id v45;

  v45 = a3;
  if (objc_msgSend_changedRecordsCount(self, v4, v5))
  {
    objc_msgSend_clearChangedRecords(v45, v6, v7);
    v10 = objc_msgSend_changedRecordsCount(self, v8, v9);
    if (v10)
    {
      v11 = v10;
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend_changedRecordAtIndex_(self, v6, i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addChangedRecord_(v45, v14, (uint64_t)v13);

      }
    }
  }
  syncContinuationToken = self->_syncContinuationToken;
  if (syncContinuationToken)
    objc_msgSend_setSyncContinuationToken_(v45, v6, (uint64_t)syncContinuationToken);
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken)
    objc_msgSend_setClientChangeToken_(v45, v6, (uint64_t)clientChangeToken);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v45 + 10) = self->_status;
    *((_BYTE *)v45 + 76) |= 1u;
  }
  if (objc_msgSend_changedSharesCount(self, v6, (uint64_t)clientChangeToken))
  {
    objc_msgSend_clearChangedShares(v45, v17, v18);
    v21 = objc_msgSend_changedSharesCount(self, v19, v20);
    if (v21)
    {
      v22 = v21;
      for (j = 0; j != v22; ++j)
      {
        objc_msgSend_changedShareAtIndex_(self, v17, j);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addChangedShare_(v45, v25, (uint64_t)v24);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v45 + 72) = self->_pendingArchivedRecords;
    *((_BYTE *)v45 + 76) |= 2u;
  }
  if (objc_msgSend_changedDeltasCount(self, v17, v18))
  {
    objc_msgSend_clearChangedDeltas(v45, v26, v27);
    v30 = objc_msgSend_changedDeltasCount(self, v28, v29);
    if (v30)
    {
      v31 = v30;
      for (k = 0; k != v31; ++k)
      {
        objc_msgSend_changedDeltasAtIndex_(self, v26, k);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addChangedDeltas_(v45, v34, (uint64_t)v33);

      }
    }
  }
  if (objc_msgSend_syncObligationsCount(self, v26, v27))
  {
    objc_msgSend_clearSyncObligations(v45, v35, v36);
    v39 = objc_msgSend_syncObligationsCount(self, v37, v38);
    if (v39)
    {
      v40 = v39;
      for (m = 0; m != v40; ++m)
      {
        objc_msgSend_syncObligationsAtIndex_(self, v35, m);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSyncObligations_(v45, v43, (uint64_t)v42);

      }
    }
  }
  zoneAttributesChange = self->_zoneAttributesChange;
  if (zoneAttributesChange)
    objc_msgSend_setZoneAttributesChange_(v45, v35, (uint64_t)zoneAttributesChange);

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
  const char *v23;
  uint64_t v24;
  void *v25;
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
  NSMutableArray *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  const char *v52;
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
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v11 = self->_changedRecords;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v69, v76, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v70 != v16)
          objc_enumerationMutation(v11);
        v18 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v69 + 1) + 8 * i), v14, (uint64_t)a3);
        objc_msgSend_addChangedRecord_((void *)v10, v19, (uint64_t)v18);

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v69, v76, 16);
    }
    while (v15);
  }

  v21 = objc_msgSend_copyWithZone_(self->_syncContinuationToken, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v21;

  v24 = objc_msgSend_copyWithZone_(self->_clientChangeToken, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v24;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 40) = self->_status;
    *(_BYTE *)(v10 + 76) |= 1u;
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v26 = self->_changedShares;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v65, v75, 16);
  if (v28)
  {
    v30 = v28;
    v31 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v66 != v31)
          objc_enumerationMutation(v26);
        v33 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v65 + 1) + 8 * j), v29, (uint64_t)a3);
        objc_msgSend_addChangedShare_((void *)v10, v34, (uint64_t)v33);

      }
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v65, v75, 16);
    }
    while (v30);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v10 + 72) = self->_pendingArchivedRecords;
    *(_BYTE *)(v10 + 76) |= 2u;
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v35 = self->_changedDeltas;
  v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v61, v74, 16);
  if (v37)
  {
    v39 = v37;
    v40 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v62 != v40)
          objc_enumerationMutation(v35);
        v42 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v61 + 1) + 8 * k), v38, (uint64_t)a3);
        objc_msgSend_addChangedDeltas_((void *)v10, v43, (uint64_t)v42);

      }
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v61, v74, 16);
    }
    while (v39);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v44 = self->_syncObligations;
  v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v57, v73, 16);
  if (v46)
  {
    v48 = v46;
    v49 = *(_QWORD *)v58;
    do
    {
      for (m = 0; m != v48; ++m)
      {
        if (*(_QWORD *)v58 != v49)
          objc_enumerationMutation(v44);
        v51 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v57 + 1) + 8 * m), v47, (uint64_t)a3, (_QWORD)v57);
        objc_msgSend_addSyncObligations_((void *)v10, v52, (uint64_t)v51);

      }
      v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v47, (uint64_t)&v57, v73, 16);
    }
    while (v48);
  }

  v54 = objc_msgSend_copyWithZone_(self->_zoneAttributesChange, v53, (uint64_t)a3);
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
  NSMutableArray *changedRecords;
  uint64_t v9;
  NSData *syncContinuationToken;
  uint64_t v11;
  NSData *clientChangeToken;
  uint64_t v13;
  char has;
  char v15;
  NSMutableArray *changedShares;
  uint64_t v17;
  NSMutableArray *changedDeltas;
  uint64_t v19;
  NSMutableArray *syncObligations;
  uint64_t v21;
  CKDPRecordRetrieveChangesResponseZoneAttributesChange *zoneAttributesChange;
  uint64_t v23;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_30;
  changedRecords = self->_changedRecords;
  v9 = v4[2];
  if ((unint64_t)changedRecords | v9)
  {
    if (!objc_msgSend_isEqual_(changedRecords, v7, v9))
      goto LABEL_30;
  }
  syncContinuationToken = self->_syncContinuationToken;
  v11 = v4[6];
  if ((unint64_t)syncContinuationToken | v11)
  {
    if (!objc_msgSend_isEqual_(syncContinuationToken, v7, v11))
      goto LABEL_30;
  }
  clientChangeToken = self->_clientChangeToken;
  v13 = v4[4];
  if ((unint64_t)clientChangeToken | v13)
  {
    if (!objc_msgSend_isEqual_(clientChangeToken, v7, v13))
      goto LABEL_30;
  }
  has = (char)self->_has;
  v15 = *((_BYTE *)v4 + 76);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_status != *((_DWORD *)v4 + 10))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_30;
  }
  changedShares = self->_changedShares;
  v17 = v4[3];
  if ((unint64_t)changedShares | v17)
  {
    if (!objc_msgSend_isEqual_(changedShares, v7, v17))
      goto LABEL_30;
    has = (char)self->_has;
    v15 = *((_BYTE *)v4 + 76);
  }
  if ((has & 2) != 0)
  {
    if ((v15 & 2) != 0)
    {
      if (self->_pendingArchivedRecords)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_30;
        goto LABEL_24;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_24;
    }
LABEL_30:
    isEqual = 0;
    goto LABEL_31;
  }
  if ((v15 & 2) != 0)
    goto LABEL_30;
LABEL_24:
  changedDeltas = self->_changedDeltas;
  v19 = v4[1];
  if ((unint64_t)changedDeltas | v19 && !objc_msgSend_isEqual_(changedDeltas, v7, v19))
    goto LABEL_30;
  syncObligations = self->_syncObligations;
  v21 = v4[7];
  if ((unint64_t)syncObligations | v21)
  {
    if (!objc_msgSend_isEqual_(syncObligations, v7, v21))
      goto LABEL_30;
  }
  zoneAttributesChange = self->_zoneAttributesChange;
  v23 = v4[8];
  if ((unint64_t)zoneAttributesChange | v23)
    isEqual = objc_msgSend_isEqual_(zoneAttributesChange, v7, v23);
  else
    isEqual = 1;
LABEL_31:

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
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;

  v4 = objc_msgSend_hash(self->_changedRecords, a2, v2);
  v7 = objc_msgSend_hash(self->_syncContinuationToken, v5, v6);
  v12 = objc_msgSend_hash(self->_clientChangeToken, v8, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v13 = 2654435761 * self->_status;
  else
    v13 = 0;
  v14 = objc_msgSend_hash(self->_changedShares, v10, v11);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v17 = 2654435761 * self->_pendingArchivedRecords;
  else
    v17 = 0;
  v18 = v7 ^ v4 ^ v12 ^ v13;
  v19 = v14 ^ v17 ^ objc_msgSend_hash(self->_changedDeltas, v15, v16);
  v22 = v18 ^ v19 ^ objc_msgSend_hash(self->_syncObligations, v20, v21);
  return v22 ^ objc_msgSend_hash(self->_zoneAttributesChange, v23, v24);
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
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  const char *v36;
  CKDPRecordRetrieveChangesResponseZoneAttributesChange *zoneAttributesChange;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v5 = *((id *)v4 + 2);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v51, v58, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend_addChangedRecord_(self, v8, *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v51, v58, 16);
    }
    while (v9);
  }

  v13 = *((_QWORD *)v4 + 6);
  if (v13)
    objc_msgSend_setSyncContinuationToken_(self, v12, v13);
  v14 = *((_QWORD *)v4 + 4);
  if (v14)
    objc_msgSend_setClientChangeToken_(self, v12, v14);
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    self->_status = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v15 = *((id *)v4 + 3);
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v47, v57, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v48 != v20)
          objc_enumerationMutation(v15);
        objc_msgSend_addChangedShare_(self, v18, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j));
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v47, v57, 16);
    }
    while (v19);
  }

  if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    self->_pendingArchivedRecords = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 2u;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v22 = *((id *)v4 + 1);
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v43, v56, 16);
  if (v24)
  {
    v26 = v24;
    v27 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v44 != v27)
          objc_enumerationMutation(v22);
        objc_msgSend_addChangedDeltas_(self, v25, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * k));
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v43, v56, 16);
    }
    while (v26);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v29 = *((id *)v4 + 7);
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v39, v55, 16);
  if (v31)
  {
    v33 = v31;
    v34 = *(_QWORD *)v40;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(v29);
        objc_msgSend_addSyncObligations_(self, v32, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * m), (_QWORD)v39);
      }
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v39, v55, 16);
    }
    while (v33);
  }

  zoneAttributesChange = self->_zoneAttributesChange;
  v38 = *((_QWORD *)v4 + 8);
  if (zoneAttributesChange)
  {
    if (v38)
      objc_msgSend_mergeFrom_(zoneAttributesChange, v36, v38);
  }
  else if (v38)
  {
    objc_msgSend_setZoneAttributesChange_(self, v36, v38);
  }

}

- (void)setChangedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_changedRecords, a3);
}

- (void)setSyncContinuationToken:(id)a3
{
  objc_storeStrong((id *)&self->_syncContinuationToken, a3);
}

- (void)setClientChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_clientChangeToken, a3);
}

- (NSMutableArray)changedShares
{
  return self->_changedShares;
}

- (void)setChangedShares:(id)a3
{
  objc_storeStrong((id *)&self->_changedShares, a3);
}

- (void)setChangedDeltas:(id)a3
{
  objc_storeStrong((id *)&self->_changedDeltas, a3);
}

- (NSMutableArray)syncObligations
{
  return self->_syncObligations;
}

- (void)setSyncObligations:(id)a3
{
  objc_storeStrong((id *)&self->_syncObligations, a3);
}

- (CKDPRecordRetrieveChangesResponseZoneAttributesChange)zoneAttributesChange
{
  return self->_zoneAttributesChange;
}

- (void)setZoneAttributesChange:(id)a3
{
  objc_storeStrong((id *)&self->_zoneAttributesChange, a3);
}

@end
