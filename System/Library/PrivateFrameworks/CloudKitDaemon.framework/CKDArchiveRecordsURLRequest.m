@implementation CKDArchiveRecordsURLRequest

- (CKDArchiveRecordsURLRequest)initWithOperation:(id)a3 recordIDsToArchive:(id)a4
{
  id v6;
  CKDArchiveRecordsURLRequest *v7;
  uint64_t v8;
  NSMutableDictionary *zoneIDToRecordIDs;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSMutableDictionary *recordZoneIDByRequestID;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CKDArchiveRecordsURLRequest;
  v7 = -[CKDURLRequest initWithOperation:](&v32, sel_initWithOperation_, a3);
  if (v7)
  {
    v8 = objc_opt_new();
    zoneIDToRecordIDs = v7->_zoneIDToRecordIDs;
    v7->_zoneIDToRecordIDs = (NSMutableDictionary *)v8;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v27 = v6;
    v10 = v6;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, v33, 16);
    if (v12)
    {
      v15 = v12;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v10);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend_zoneID(v18, v13, v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v7->_zoneIDToRecordIDs, v20, (uint64_t)v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            v22 = (void *)objc_opt_new();
            objc_msgSend_setObject_forKeyedSubscript_(v7->_zoneIDToRecordIDs, v23, (uint64_t)v22, v19);
          }
          objc_msgSend_addObject_(v22, v21, (uint64_t)v18);

        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v28, v33, 16);
      }
      while (v15);
    }

    v24 = objc_opt_new();
    recordZoneIDByRequestID = v7->_recordZoneIDByRequestID;
    v7->_recordZoneIDByRequestID = (NSMutableDictionary *)v24;

    v6 = v27;
  }

  return v7;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  objc_super v14;

  v4 = a3;
  objc_msgSend_zoneIDToRecordIDs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKFlatMap_(v10, v11, (uint64_t)&unk_1E7833898);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)CKDArchiveRecordsURLRequest;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v14, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, (uint64_t)v12, CFSTR("recordIDs"));

}

- (void)fillOutRequestProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  objc_super v14;

  v4 = a3;
  objc_msgSend_zoneIDToRecordIDs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKFlatMap_(v10, v11, (uint64_t)&unk_1E78338B8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setModifyRecordIDs_(v4, v13, (uint64_t)v12);
  v14.receiver = self;
  v14.super_class = (Class)CKDArchiveRecordsURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v14, sel_fillOutRequestProperties_, v4);

}

- (id)zoneIDsToLock
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_zoneIDToRecordIDs(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)requestOperationClasses
{
  const char *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2, (uint64_t)v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateRequestOperations
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  _QWORD v11[5];

  objc_msgSend_zoneIDToRecordIDs(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BEB0D5A4;
  v11[3] = &unk_1E78338E0;
  v11[4] = self;
  objc_msgSend_CKMap_(v7, v8, (uint64_t)v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  const char *v33;
  uint64_t v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_recordZoneIDByRequestID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recordArchivedBlock(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend_zoneIDToRecordIDs(self, v19, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v37, v41, 16);
    if (v25)
    {
      v28 = v25;
      v29 = *(_QWORD *)v38;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v23);
          v31 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v30);
          objc_msgSend_recordArchivedBlock(self, v26, v27);
          v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend_result(v4, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, void *))v32)[2](v32, v31, v35);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v37, v41, 16);
      }
      while (v28);
    }

  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  const char *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_recordZoneIDByRequestID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recordArchivedBlock(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend_zoneIDToRecordIDs(self, v19, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v36, v40, 16);
    if (v25)
    {
      v28 = v25;
      v29 = *(_QWORD *)v37;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v37 != v29)
            objc_enumerationMutation(v23);
          v31 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v30);
          objc_msgSend_recordArchivedBlock(self, v26, v27);
          v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend_result(v4, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, void *))v32)[2](v32, v31, v35);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v36, v40, 16);
      }
      while (v28);
    }

  }
}

- (id)recordArchivedBlock
{
  return self->_recordArchivedBlock;
}

- (void)setRecordArchivedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSMutableDictionary)zoneIDToRecordIDs
{
  return self->_zoneIDToRecordIDs;
}

- (void)setZoneIDToRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDToRecordIDs, a3);
}

- (NSMutableDictionary)recordZoneIDByRequestID
{
  return self->_recordZoneIDByRequestID;
}

- (void)setRecordZoneIDByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneIDByRequestID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneIDByRequestID, 0);
  objc_storeStrong((id *)&self->_zoneIDToRecordIDs, 0);
  objc_storeStrong(&self->_recordArchivedBlock, 0);
}

@end
