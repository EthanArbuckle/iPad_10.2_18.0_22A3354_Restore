@implementation CKDFetchDatabaseChangesURLRequest

- (id)zoneChangedBlock
{
  return self->_zoneChangedBlock;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setZonePurgedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void)setZoneDeletedDueToEncryptedDataResetBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void)setZoneDeletedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void)setZoneChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setServerChangeTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_serverChangeTokenData, a3);
}

- (void)setResultsLimit:(unint64_t)a3
{
  self->_resultsLimit = a3;
}

- (NSData)serverChangeTokenData
{
  return self->_serverChangeTokenData;
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  return 0;
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

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  int hasAnonymousZoneInfo;
  const char *v37;
  uint64_t v38;
  void *v39;
  CKDAnonymousZoneDataObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  id v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  id v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void (**v113)(_QWORD, _QWORD);
  const char *v114;
  uint64_t v115;
  int v116;
  void *v117;
  const char *v118;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  __int128 v124;
  id v125;
  void *v126;
  void *v127;
  id obj;
  void *v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint8_t buf[4];
  uint64_t v136;
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend_hasZoneRetrieveChangesResponse(v4, v5, v6))
  {
    v102 = 0;
    goto LABEL_58;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_container(self, v8, v9);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneRetrieveChangesResponse(v4, v10, v11);
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_changedZones(v127, v12, v13);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v131, v137, 16);
  if (!v15)
  {
    v20 = 0;
    goto LABEL_45;
  }
  v19 = v15;
  v20 = 0;
  v21 = *(_QWORD *)v132;
  *(_QWORD *)&v18 = 138412290;
  v124 = v18;
  v125 = v4;
  v126 = v7;
  while (2)
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v132 != v21)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v22);
      if (!objc_msgSend_hasChangeType(v23, v16, v17, v124)
        || (objc_msgSend_hasZoneIdentifier(v23, v24, v25) & 1) == 0
        && (objc_msgSend_isAnonymous(v23, v24, v26) & 1) == 0)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v24, *MEMORY[0x1E0C947D8], 2006, CFSTR("Invalid data received from server"));
        v62 = (id)objc_claimAutoreleasedReturnValue();

LABEL_43:
        v20 = v62;
        v4 = v125;
        v7 = v126;
        goto LABEL_45;
      }
      objc_msgSend_options(v129, v24, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_useAnonymousToServerShareParticipants(v27, v28, v29)
        && objc_msgSend_hasIsAnonymous(v23, v30, v31)
        && objc_msgSend_isAnonymous(v23, v32, v33))
      {
        hasAnonymousZoneInfo = objc_msgSend_hasAnonymousZoneInfo(v23, v34, v35);

        if (hasAnonymousZoneInfo)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v39 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v95 = v39;
            objc_msgSend_anonymousZoneInfo(v23, v96, v97);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_anonymousZoneInfoID(v98, v99, v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v124;
            v136 = (uint64_t)v101;
            _os_log_debug_impl(&dword_1BE990000, v95, OS_LOG_TYPE_DEBUG, "Identified anonymous zone through CKDPZoneRetrieveChangesResponseChangedZone with anonymousZoneInfoID: %@.", buf, 0xCu);

          }
          v40 = [CKDAnonymousZoneDataObject alloc];
          objc_msgSend_anonymousZoneInfo(v23, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anonymousZoneInfoData(v43, v44, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend_changeType(v23, v47, v48);
          v52 = objc_msgSend_deleteType(v23, v50, v51);
          v54 = (void *)objc_msgSend_initWithEncryptedData_changeType_deleteType_(v40, v53, (uint64_t)v46, v49, v52);

          objc_msgSend_addObject_(v126, v55, (uint64_t)v54);
          v56 = 0;
          goto LABEL_36;
        }
      }
      else
      {

      }
      objc_msgSend_translator(self, v37, v38);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneIdentifier(v23, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = v20;
      objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_error_(v57, v61, (uint64_t)v60, &v130);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v130;

      if (!v56)
        goto LABEL_43;
      if (objc_msgSend_changeType(v23, v63, v64) == 1)
      {
        objc_msgSend_addObject_(self->_changedZoneIDs, v65, (uint64_t)v56);
        objc_msgSend_zoneChangedBlock(self, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        if (v69)
        {
          objc_msgSend_zoneChangedBlock(self, v70, v71);
          v72 = objc_claimAutoreleasedReturnValue();
LABEL_35:
          v54 = (void *)v72;
          (*(void (**)(uint64_t, void *))(v72 + 16))(v72, v56);
          v20 = v62;
LABEL_36:

          goto LABEL_38;
        }
      }
      else
      {
        if (objc_msgSend_changeType(v23, v65, v66) != 2)
          goto LABEL_37;
        if (*MEMORY[0x1E0C95280])
        {
          objc_msgSend_unitTestOverrides(self, v73, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v75, v76, (uint64_t)CFSTR("FakeUserResetEncryptedDataForZoneDelete"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (v77)
            goto LABEL_31;
        }
        if (objc_msgSend_deleteType(v23, v73, v74) != 2)
        {
          if (objc_msgSend_deleteType(v23, v78, v79) != 3)
          {
            objc_msgSend_addObject_(self->_deletedZoneIDs, v73, (uint64_t)v56);
            objc_msgSend_zoneDeletedBlock(self, v90, v91);
            v92 = (void *)objc_claimAutoreleasedReturnValue();

            if (v92)
            {
              objc_msgSend_zoneDeletedBlock(self, v93, v94);
              v72 = objc_claimAutoreleasedReturnValue();
              goto LABEL_35;
            }
            goto LABEL_37;
          }
LABEL_31:
          objc_msgSend_addObject_(self->_encryptedDataResetDeletedZoneIDs, v73, (uint64_t)v56);
          objc_msgSend_zoneDeletedDueToEncryptedDataResetBlock(self, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          if (v87)
          {
            objc_msgSend_zoneDeletedDueToEncryptedDataResetBlock(self, v88, v89);
            v72 = objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          }
          goto LABEL_37;
        }
        objc_msgSend_addObject_(self->_purgedZoneIDs, v78, (uint64_t)v56);
        objc_msgSend_zonePurgedBlock(self, v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        if (v82)
        {
          objc_msgSend_zonePurgedBlock(self, v83, v84);
          v72 = objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
      }
LABEL_37:
      v20 = v62;
LABEL_38:

      ++v22;
    }
    while (v19 != v22);
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v131, v137, 16);
    v4 = v125;
    v7 = v126;
    if (v19)
      continue;
    break;
  }
LABEL_45:

  objc_msgSend_anonymousShareProcessingBlock(self, v103, v104);
  v105 = objc_claimAutoreleasedReturnValue();
  if (v105)
  {
    v108 = (void *)v105;
    v109 = objc_msgSend_count(v7, v106, v107);

    if (v109)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v110 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v120 = v110;
        v123 = objc_msgSend_count(v7, v121, v122);
        *(_DWORD *)buf = 134217984;
        v136 = v123;
        _os_log_debug_impl(&dword_1BE990000, v120, OS_LOG_TYPE_DEBUG, "Calling back to the anonymousShareProcessingBlock with %lu anonymous zone data objects.", buf, 0xCu);

      }
      objc_msgSend_anonymousShareProcessingBlock(self, v111, v112);
      v113 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v113)[2](v113, v7);

    }
  }
  if (objc_msgSend_hasStatus(v127, v106, v107))
  {
    v116 = objc_msgSend_status(v127, v114, v115);
    if (v116 == 1)
    {
      objc_msgSend_setStatus_(self, v114, 1);
    }
    else if (v116 == 2)
    {
      objc_msgSend_setStatus_(self, v114, 2);
    }
  }
  objc_msgSend_syncContinuationToken(v127, v114, v115);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerChangeTokenData_(self, v118, (uint64_t)v117);

  v102 = v20;
LABEL_58:

  return v102;
}

- (NSData)previousServerChangeTokenData
{
  return self->_previousServerChangeTokenData;
}

- (CKDFetchDatabaseChangesURLRequest)initWithOperation:(id)a3 previousServerChangeTokenData:(id)a4
{
  id v7;
  CKDFetchDatabaseChangesURLRequest *v8;
  NSMutableArray *v9;
  NSMutableArray *changedZoneIDs;
  NSMutableArray *v11;
  NSMutableArray *deletedZoneIDs;
  NSMutableArray *v13;
  NSMutableArray *purgedZoneIDs;
  NSMutableArray *v15;
  NSMutableArray *encryptedDataResetDeletedZoneIDs;
  objc_super v18;

  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKDFetchDatabaseChangesURLRequest;
  v8 = -[CKDURLRequest initWithOperation:](&v18, sel_initWithOperation_, a3);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    changedZoneIDs = v8->_changedZoneIDs;
    v8->_changedZoneIDs = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedZoneIDs = v8->_deletedZoneIDs;
    v8->_deletedZoneIDs = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    purgedZoneIDs = v8->_purgedZoneIDs;
    v8->_purgedZoneIDs = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    encryptedDataResetDeletedZoneIDs = v8->_encryptedDataResetDeletedZoneIDs;
    v8->_encryptedDataResetDeletedZoneIDs = v15;

    objc_storeStrong((id *)&v8->_previousServerChangeTokenData, a4);
    v8->_status = 0;
  }

  return v8;
}

- (id)generateRequestOperations
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_operationType(self, a2, v2);
  objc_msgSend_operationRequestWithType_(self, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend_setZoneRetrieveChangesRequest_(v6, v8, (uint64_t)v7);

  objc_msgSend_previousServerChangeTokenData(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneRetrieveChangesRequest(v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSyncContinuationToken_(v14, v15, (uint64_t)v11);

  if (objc_msgSend_resultsLimit(self, v16, v17))
  {
    v22 = objc_msgSend_resultsLimit(self, v18, v19);
    if (HIDWORD(v22))
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v28, (uint64_t)"uint32_t CKDownsizeOrDie(NSUInteger)");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v27, v30, (uint64_t)v29, CFSTR("CloudKit-Prefix.pch"), 34, CFSTR("That number was ridiculous"));

    }
    objc_msgSend_zoneRetrieveChangesRequest(v6, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setMaxChangedZones_(v23, v24, v22);

  }
  v31[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v31, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)anonymousShareProcessingBlock
{
  return self->_anonymousShareProcessingBlock;
}

- (BOOL)allowsAnonymousAccount
{
  uint64_t v2;

  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousServerChangeTokenData, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong(&self->_anonymousShareProcessingBlock, 0);
  objc_storeStrong(&self->_zoneDeletedDueToEncryptedDataResetBlock, 0);
  objc_storeStrong(&self->_zonePurgedBlock, 0);
  objc_storeStrong(&self->_zoneDeletedBlock, 0);
  objc_storeStrong(&self->_zoneChangedBlock, 0);
  objc_storeStrong((id *)&self->_serverChangeTokenData, 0);
  objc_storeStrong((id *)&self->_encryptedDataResetDeletedZoneIDs, 0);
  objc_storeStrong((id *)&self->_purgedZoneIDs, 0);
  objc_storeStrong((id *)&self->_deletedZoneIDs, 0);
  objc_storeStrong((id *)&self->_changedZoneIDs, 0);
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchDatabaseChangesURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v9, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_previousServerChangeTokenData(self, v5, v6, v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, CFSTR("changeToken"));

}

- (NSArray)changedZoneIDs
{
  return &self->_changedZoneIDs->super;
}

- (NSArray)deletedZoneIDs
{
  return &self->_deletedZoneIDs->super;
}

- (NSArray)purgedZoneIDs
{
  return &self->_purgedZoneIDs->super;
}

- (NSArray)encryptedDataResetDeletedZoneIDs
{
  return &self->_encryptedDataResetDeletedZoneIDs->super;
}

- (id)zoneDeletedBlock
{
  return self->_zoneDeletedBlock;
}

- (id)zonePurgedBlock
{
  return self->_zonePurgedBlock;
}

- (id)zoneDeletedDueToEncryptedDataResetBlock
{
  return self->_zoneDeletedDueToEncryptedDataResetBlock;
}

- (void)setAnonymousShareProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneID, a3);
}

- (void)setPreviousServerChangeTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_previousServerChangeTokenData, a3);
}

@end
