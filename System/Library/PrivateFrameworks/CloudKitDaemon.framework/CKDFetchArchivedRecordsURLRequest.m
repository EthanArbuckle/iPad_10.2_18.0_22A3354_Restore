@implementation CKDFetchArchivedRecordsURLRequest

- (CKDFetchArchivedRecordsURLRequest)initWithOperation:(id)a3 recordZoneIDs:(id)a4 configurationsByRecordZoneID:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  CKDFetchArchivedRecordsURLRequest *v12;
  uint64_t v13;
  NSArray *recordZoneIDs;
  uint64_t v15;
  NSMutableDictionary *zoneIDsByRequestOperationUUID;
  uint64_t v17;
  NSMutableDictionary *requestResultsByRecordZoneID;
  uint64_t v19;
  NSMutableDictionary *nodeErrorsByZoneID;
  objc_super v22;

  v8 = a4;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CKDFetchArchivedRecordsURLRequest;
  v12 = -[CKDURLRequest initWithOperation:](&v22, sel_initWithOperation_, a3);
  if (v12)
  {
    v13 = objc_msgSend_copy(v8, v10, v11);
    recordZoneIDs = v12->_recordZoneIDs;
    v12->_recordZoneIDs = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_configurationsByRecordZoneID, a5);
    v15 = objc_opt_new();
    zoneIDsByRequestOperationUUID = v12->_zoneIDsByRequestOperationUUID;
    v12->_zoneIDsByRequestOperationUUID = (NSMutableDictionary *)v15;

    v12->_shouldFetchAssetContent = 1;
    v17 = objc_opt_new();
    requestResultsByRecordZoneID = v12->_requestResultsByRecordZoneID;
    v12->_requestResultsByRecordZoneID = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    nodeErrorsByZoneID = v12->_nodeErrorsByZoneID;
    v12->_nodeErrorsByZoneID = (NSMutableDictionary *)v19;

  }
  return v12;
}

- (NSDictionary)zoneErrorsByZoneID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_nodeErrorsByZoneID(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_copy(v3, v4, v5);

  return (NSDictionary *)v6;
}

- (NSDictionary)resultsByRecordZoneID
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_requestResultsByRecordZoneID(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_copy(v3, v4, v5);

  return (NSDictionary *)v6;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  id v29;
  id obj;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v4 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend_recordZoneIDs(self, v5, v6);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v32, v36, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v33;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v13);
        objc_msgSend_configurationsByRecordZoneID(self, v9, v10, v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_previousServerChangeToken(v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_data(v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          objc_msgSend_data(MEMORY[0x1E0C99D50], v24, v25);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_sqliteRepresentation(v14, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v4, v27, (uint64_t)v23, v26);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v32, v36, 16);
    }
    while (v11);
  }

  v31.receiver = self;
  v31.super_class = (Class)CKDFetchArchivedRecordsURLRequest;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v31, sel_fillOutEquivalencyPropertiesBuilder_, v29);
  objc_msgSend_setObject_forKeyedSubscript_(v29, v28, (uint64_t)v4, CFSTR("zid->token"));

}

- (void)fillOutRequestProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v4 = a3;
  objc_msgSend_recordZoneIDs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFetchRecordZoneIDs_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchArchivedRecordsURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v9, sel_fillOutRequestProperties_, v4);

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
  void *v6;
  _QWORD v8[5];

  objc_msgSend_recordZoneIDs(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BEBC0C04;
  v8[3] = &unk_1E78338E0;
  v8[4] = self;
  objc_msgSend_CKMap_(v4, v5, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_handleRecords:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD);
  const char *v25;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = a3;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v30;
    v27 = *MEMORY[0x1E0C947D8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1C3B83E24]();
        objc_msgSend_recordFetchedBlock(self, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend_translator(self, v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v8;
          objc_msgSend_recordFromPRecord_error_(v18, v19, v11, &v28);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v28;

          if (v20)
          {
            objc_msgSend_recordFetchedBlock(self, v22, v23);
            v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v24)[2](v24, v20);
          }
          else
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v22, v27, 2006, CFSTR("Invalid data received from server"));
            v24 = (void (**)(_QWORD, _QWORD))v21;
            v21 = (id)objc_claimAutoreleasedReturnValue();
          }

          v8 = v21;
        }
        objc_autoreleasePoolPop(v12);
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v25, (uint64_t)&v29, v33, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  int v48;
  _BOOL8 v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;

  v5 = a3;
  if (objc_msgSend_hasFetchArchivedRecordsResponse(v5, v6, v7))
  {
    objc_msgSend_zoneIDsByRequestOperationUUID(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_response(v5, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationUUID(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v17, (uint64_t)v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_response(v5, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationUUID(v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneIDsByRequestOperationUUID(self, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allKeys(v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v68, (uint64_t)a2, self, CFSTR("CKDFetchArchivedRecordsURLRequest.m"), 140, CFSTR("Got a response for an unknown zone with request operation %@ %@"), v61, v67);

    }
    objc_msgSend_recordFetchedBlock(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend_fetchArchivedRecordsResponse(v5, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_records(v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__handleRecords_(self, v28, (uint64_t)v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        v29 = v21;

    }
    v30 = (void *)objc_opt_new();
    objc_msgSend_fetchArchivedRecordsResponse(v5, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_archiveContinuationToken(v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setResultServerChangeTokenData_(v30, v37, (uint64_t)v36);

    objc_msgSend_fetchArchivedRecordsResponse(v5, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = objc_msgSend_hasStatus(v40, v41, v42);

    if ((_DWORD)v36)
    {
      objc_msgSend_fetchArchivedRecordsResponse(v5, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_status(v45, v46, v47);

      v49 = v48 != 2;
    }
    else
    {
      v49 = 1;
    }
    objc_msgSend_setStatus_(v30, v43, v49);
    objc_msgSend_requestResultsByRecordZoneID(self, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v52, v53, (uint64_t)v30, v18);

  }
  else
  {
    v21 = 0;
  }

  return v21;
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
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  uint64_t v48;
  void *v49;
  const char *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_zoneIDsByRequestOperationUUID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_result(v4, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_code(v18, v19, v20) != 1)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v51 = v21;
      objc_msgSend_error(v18, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDescription(v54, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = v15;
      v65 = 2114;
      v66 = v57;
      _os_log_debug_impl(&dword_1BE990000, v51, OS_LOG_TYPE_DEBUG, "Error fetching archived records in zone %{public}@: %{public}@", buf, 0x16u);

    }
    v22 = (void *)MEMORY[0x1E0C94FF8];
    v23 = *MEMORY[0x1E0C94B20];
    v24 = sub_1BEB10D5C(v18);
    sub_1BEB10290(self, v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v18, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v22, v32, v23, v24, v25, CFSTR("Error fetching archived records in zone %@: %@"), v15, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend_nodeErrorsByZoneID(self, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v36, v37, (uint64_t)v33, v15);
    }
    else
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      objc_msgSend_zoneIDsByRequestOperationUUID(self, v34, v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allValues(v38, v39, v40);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v41, (uint64_t)&v58, v62, 16);
      if (v42)
      {
        v45 = v42;
        v46 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v59 != v46)
              objc_enumerationMutation(v36);
            v48 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_msgSend_nodeErrorsByZoneID(self, v43, v44);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v49, v50, (uint64_t)v33, v48);

          }
          v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v43, (uint64_t)&v58, v62, 16);
        }
        while (v45);
        v15 = 0;
      }
    }

  }
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
}

- (void)setConfigurationsByRecordZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, a3);
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (NSSet)desiredAssetKeys
{
  return self->_desiredAssetKeys;
}

- (void)setDesiredAssetKeys:(id)a3
{
  objc_storeStrong((id *)&self->_desiredAssetKeys, a3);
}

- (id)recordFetchedBlock
{
  return self->_recordFetchedBlock;
}

- (void)setRecordFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSMutableDictionary)zoneIDsByRequestOperationUUID
{
  return self->_zoneIDsByRequestOperationUUID;
}

- (void)setZoneIDsByRequestOperationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDsByRequestOperationUUID, a3);
}

- (NSMutableDictionary)requestResultsByRecordZoneID
{
  return self->_requestResultsByRecordZoneID;
}

- (void)setRequestResultsByRecordZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_requestResultsByRecordZoneID, a3);
}

- (NSMutableDictionary)nodeErrorsByZoneID
{
  return self->_nodeErrorsByZoneID;
}

- (void)setNodeErrorsByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_nodeErrorsByZoneID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeErrorsByZoneID, 0);
  objc_storeStrong((id *)&self->_requestResultsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_zoneIDsByRequestOperationUUID, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
  objc_storeStrong((id *)&self->_desiredAssetKeys, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end
