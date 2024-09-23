@implementation CKDMovePhotosURLRequest

- (CKDMovePhotosURLRequest)initWithOperation:(id)a3 moveChanges:(id)a4 sourceDatabaseScope:(int64_t)a5 atomic:(BOOL)a6
{
  id v11;
  CKDMovePhotosURLRequest *v12;
  CKDMovePhotosURLRequest *v13;
  uint64_t v14;
  NSMutableDictionary *recordIDByRequestID;
  uint64_t v16;
  NSMutableDictionary *recordByRequestID;
  objc_super v19;

  v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CKDMovePhotosURLRequest;
  v12 = -[CKDURLRequest initWithOperation:](&v19, sel_initWithOperation_, a3);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_moveChanges, a4);
    v13->_sourceDatabaseScope = a5;
    v13->_atomic = a6;
    v14 = objc_opt_new();
    recordIDByRequestID = v13->_recordIDByRequestID;
    v13->_recordIDByRequestID = (NSMutableDictionary *)v14;

    v16 = objc_opt_new();
    recordByRequestID = v13->_recordByRequestID;
    v13->_recordByRequestID = (NSMutableDictionary *)v16;

  }
  return v13;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CKDMovePhotosURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v22, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_moveChanges(self, v6, v7, v22.receiver, v22.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, CFSTR("moveChanges"));
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_msgSend_sourceDatabaseScope(self, v16, v17);
  objc_msgSend_numberWithInteger_(v15, v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v21, (uint64_t)v20, CFSTR("sourceDatabaseScope"));

}

- (void)fillOutRequestProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  objc_super v19;

  v4 = a3;
  objc_msgSend_moveChanges(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v7, v8, (uint64_t)&unk_1E7838438);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_moveChanges(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v12, v13, (uint64_t)&unk_1E7838478);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v14, v15, (uint64_t)&unk_1E78384B8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setModifyRecordIDs_(v4, v17, (uint64_t)v16);
  objc_msgSend_setDeleteRecordIDs_(v4, v18, (uint64_t)v9);
  v19.receiver = self;
  v19.super_class = (Class)CKDMovePhotosURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v19, sel_fillOutRequestProperties_, v4);

}

- (id)zoneIDsToLock
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_moveChanges(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKFlatMap_(v3, v4, (uint64_t)&unk_1E78384F8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

- (int)isolationLevel
{
  uint64_t v2;

  if (objc_msgSend_atomic(self, a2, v2))
    return 1;
  else
    return 2;
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (id)generateRequestOperations
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  unint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  void *v94;
  const char *v95;
  void *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void (**v122)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  const char *v130;
  void *v131;
  const char *v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  id obj;
  id v162;
  uint64_t v163;
  uint64_t v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v162 = (id)objc_opt_new();
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  objc_msgSend_moveChanges(self, v3, v4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v165, v169, 16);
  if (v164)
  {
    v163 = *(_QWORD *)v166;
    do
    {
      for (i = 0; i != v164; ++i)
      {
        if (*(_QWORD *)v166 != v163)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * i);
        objc_msgSend_destinationRecord(v9, v6, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend_operationType(self, v11, v12);
        objc_msgSend_operationRequestWithType_(self, v14, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_opt_new();
        objc_msgSend_setRecordMoveRequest_(v15, v17, (uint64_t)v16);

        objc_msgSend_recordMoveRequest(v15, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 1;
        objc_msgSend_setMerge_(v20, v22, 1);

        objc_msgSend_translator(self, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sourceRecordID(v9, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pRecordIdentifierFromRecordID_(v25, v29, (uint64_t)v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordMoveRequest(v15, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setOriginId_(v33, v34, (uint64_t)v30);

        v37 = objc_msgSend_sourceDatabaseScope(self, v35, v36);
        if (v37 <= 4)
          v21 = dword_1BECBC158[v37];
        objc_msgSend_recordMoveRequest(v15, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_originId(v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneIdentifier(v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDatabaseType_(v46, v47, v21);

        objc_msgSend_sourceRecordChangeTag(v9, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordMoveRequest(v15, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setOriginEtag_(v53, v54, (uint64_t)v50);

        objc_msgSend_translator(self, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_deltaPRecordFromRecord_withAllFields_outDeletedMergeFields_outKeysToSend_(v57, v58, (uint64_t)v10, 1, 0, 0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordMoveRequest(v15, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDestinationRecord_(v62, v63, (uint64_t)v59);

        objc_msgSend_etag(v10, v64, v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordMoveRequest(v15, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDestinationEtag_(v69, v70, (uint64_t)v66);

        LODWORD(v66) = objc_msgSend_isKnownToServer(v10, v71, v72);
        objc_msgSend_recordMoveRequest(v15, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v75;
        if ((_DWORD)v66)
          objc_msgSend_setSemantics_(v75, v76, 2);
        else
          objc_msgSend_setSemantics_(v75, v76, 1);

        objc_msgSend_previousProtectionEtag(v10, v78, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordMoveRequest(v15, v81, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDestinationRecordProtectionInfoTag_(v83, v84, (uint64_t)v80);

        if (objc_msgSend_databaseScope(self, v85, v86) == 2 || objc_msgSend_databaseScope(self, v87, v88) == 3)
        {
          objc_msgSend_zoneProtectionEtag(v10, v87, v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordMoveRequest(v15, v90, v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setDestinationZoneProtectionInfoTag_(v92, v93, (uint64_t)v89);

        }
        if (*MEMORY[0x1E0C95280])
        {
          objc_msgSend_unitTestOverrides(self, v87, v88);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v94, v95, (uint64_t)CFSTR("NoRecordProtectionInfoOnSaves"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          if (v96)
          {
            objc_msgSend_recordMoveRequest(v15, v87, v88);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_destinationRecord(v97, v98, v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setProtectionInfo_(v100, v101, 0);

          }
        }
        objc_msgSend_recordMoveRequest(v15, v87, v88);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_destinationRecord(v102, v103, v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();

        if (v105)
        {
          objc_msgSend_addObject_(v162, v106, (uint64_t)v15);
          objc_msgSend_recordByRequestID(self, v107, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_request(v15, v110, v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_operationUUID(v112, v113, v114);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v109, v116, (uint64_t)v10, v115);

          objc_msgSend_recordID(v10, v117, v118);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordIDByRequestID(self, v120, v121);
          v122 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend_request(v15, v123, v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_operationUUID(v125, v126, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v122, v129, (uint64_t)v119, v128);

        }
        else
        {
          v119 = (void *)objc_opt_new();
          objc_msgSend_setCode_(v119, v130, 3);
          v131 = (void *)objc_opt_new();
          objc_msgSend_setError_(v119, v132, (uint64_t)v131);

          v133 = (void *)objc_opt_new();
          objc_msgSend_error(v119, v134, v135);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setClientError_(v136, v137, (uint64_t)v133);

          objc_msgSend_error(v119, v138, v139);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clientError(v140, v141, v142);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setType_(v143, v144, 7);

          objc_msgSend_error(v119, v145, v146);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setErrorKey_(v147, v148, (uint64_t)CFSTR("Invalid values in record"));

          objc_msgSend_error(v119, v149, v150);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setErrorDescription_(v151, v152, (uint64_t)CFSTR("The record could not be encoded because it has invalid values"));

          objc_msgSend_recordPostedBlock(self, v153, v154);
          v155 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v155)
            goto LABEL_22;
          objc_msgSend_recordPostedBlock(self, v156, v157);
          v122 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v10, v158, v159);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *, _QWORD, _QWORD, _QWORD))v122)[2](v122, v119, v125, 0, 0, 0);
        }

LABEL_22:
      }
      v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v165, v169, 16);
    }
    while (v164);
  }

  return v162;
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
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void (**v53)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v54;
  uint64_t v55;
  void *v56;
  void *v57;
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
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  id v73;
  os_log_t *v74;
  os_log_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  id v94;
  os_log_t *v95;
  const char *v96;
  uint64_t v97;
  os_log_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  const char *v104;
  void *v105;
  os_log_t v106;
  const char *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t hasProtectionDataEntitlement;
  const char *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void (**v131)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v132;
  uint64_t v133;
  void *v134;
  NSObject *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  NSObject *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  NSObject *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  id v153;
  id v154;
  id v155;
  uint8_t buf[4];
  id v157;
  __int16 v158;
  uint64_t v159;
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_recordIDByRequestID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_hasRecordMoveResponse(v4, v16, v17))
  {
    objc_msgSend_result(v4, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientError(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_oplockFailure(v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordForOplockFailure(v29, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v151 = (void *)v32;
    if (v32)
    {
      objc_msgSend_translator(self, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v15, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_anonymousCKUserID(v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = 0;
      objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v35, v42, v32, v41, &v155);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v155;

      v150 = v44;
      if (v43 || !v44)
      {
        objc_msgSend_translator(self, v45, v46, v43);
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v47 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v157 = v44;
          _os_log_error_impl(&dword_1BE990000, v47, OS_LOG_TYPE_ERROR, "Invalid data from server in response to moveRecords request: %@", buf, 0xCu);
        }
        objc_msgSend_translator(self, v48, v49, 0);
      }
    }
    else
    {
      v150 = 0;
      objc_msgSend_translator(self, v33, v34, 0);
    }
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordMoveResponse(v4, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_movedRecord(v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v15, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_anonymousCKUserID(v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = 0;
    objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v58, v71, (uint64_t)v64, v70, &v154);
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = v154;

    v74 = (os_log_t *)MEMORY[0x1E0C952E0];
    if (v73)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v75 = *v74;
      if (os_log_type_enabled(*v74, OS_LOG_TYPE_ERROR))
      {
        v136 = v75;
        objc_msgSend_requestUUID(self, v137, v138);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v157 = v139;
        v158 = 2112;
        v159 = (uint64_t)v73;
        _os_log_error_impl(&dword_1BE990000, v136, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Error parsing destination server record returned for save: %@\", buf, 0x16u);

      }
    }
    v149 = (void *)v72;

    objc_msgSend_translator(self, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordMoveResponse(v4, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_moveMarker(v81, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = (uint64_t)v15;
    objc_msgSend_zoneID(v15, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_anonymousCKUserID(v88, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = 0;
    objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v78, v92, (uint64_t)v84, v91, &v153);
    v93 = objc_claimAutoreleasedReturnValue();
    v94 = v153;

    v95 = (os_log_t *)MEMORY[0x1E0C952E0];
    v152 = v94;
    if (v94)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v98 = *v95;
      if (os_log_type_enabled(*v95, OS_LOG_TYPE_ERROR))
      {
        v140 = v98;
        objc_msgSend_requestUUID(self, v141, v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v157 = v143;
        v158 = 2112;
        v159 = (uint64_t)v94;
        _os_log_error_impl(&dword_1BE990000, v140, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Error parsing move marker server record returned for save: %@\", buf, 0x16u);

        v95 = (os_log_t *)MEMORY[0x1E0C952E0];
      }
    }
    objc_msgSend_fakeResponseOperationResultByItemID(self, v96, v97);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    v102 = (void *)v93;
    v15 = (void *)v85;
    if (v99)
    {
      objc_msgSend_fakeResponseOperationResultByItemID(self, v100, v101);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v103, v104, v85);
      v105 = (void *)objc_claimAutoreleasedReturnValue();

      if (v105)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v106 = *v95;
        if (os_log_type_enabled(*v95, OS_LOG_TYPE_ERROR))
        {
          v144 = v106;
          objc_msgSend_requestUUID(self, v145, v146);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v157 = v147;
          v158 = 2114;
          v159 = v85;
          _os_log_error_impl(&dword_1BE990000, v144, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Inlining fake response operation result for item id %{public}@\", buf, 0x16u);

        }
        objc_msgSend_setResult_(v4, v107, (uint64_t)v105);
      }

    }
    objc_msgSend_container(self, v100, v101);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entitlements(v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    hasProtectionDataEntitlement = objc_msgSend_hasProtectionDataEntitlement(v111, v112, v113);
    objc_msgSend_setSerializeProtectionData_(v149, v115, hasProtectionDataEntitlement);

    objc_msgSend_container(self, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entitlements(v118, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend_hasProtectionDataEntitlement(v121, v122, v123);
    objc_msgSend_setSerializeProtectionData_(v102, v125, v124);

    objc_msgSend_recordPostedBlock(self, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    if (v128)
    {
      objc_msgSend_recordPostedBlock(self, v129, v130);
      v131 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v4, v132, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, uint64_t, void *, void *, void *))v131)[2](v131, v134, v85, v149, v148, v102);

    }
    v57 = v150;
  }
  else
  {
    objc_msgSend_recordPostedBlock(self, v18, v19);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend_recordPostedBlock(self, v51, v52);
      v53 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v4, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD, _QWORD, _QWORD))v53)[2](v53, v56, v15, 0, 0, 0);

    }
    v57 = 0;
  }

  return v57;
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
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void (**v47)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_recordIDByRequestID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_result(v4, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientError(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_oplockFailure(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordForOplockFailure(v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend_translator(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v15, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_anonymousCKUserID(v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v33, v40, (uint64_t)v30, v39, &v51);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v51;

    if (!v41 && v42)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v43 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v42;
        _os_log_error_impl(&dword_1BE990000, v43, OS_LOG_TYPE_ERROR, "Invalid data from server in response to moveRecords request: %@", buf, 0xCu);
      }
    }

  }
  objc_msgSend_recordPostedBlock(self, v31, v32);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend_recordPostedBlock(self, v45, v46);
    v47 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, _QWORD, _QWORD, _QWORD))v47)[2](v47, v50, v15, 0, 0, 0);

  }
}

- (id)recordPostedBlock
{
  return self->_recordPostedBlock;
}

- (void)setRecordPostedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSArray)moveChanges
{
  return self->_moveChanges;
}

- (void)setMoveChanges:(id)a3
{
  objc_storeStrong((id *)&self->_moveChanges, a3);
}

- (int64_t)sourceDatabaseScope
{
  return self->_sourceDatabaseScope;
}

- (void)setSourceDatabaseScope:(int64_t)a3
{
  self->_sourceDatabaseScope = a3;
}

- (BOOL)atomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)a3
{
  self->_atomic = a3;
}

- (NSMutableDictionary)recordIDByRequestID
{
  return self->_recordIDByRequestID;
}

- (void)setRecordIDByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDByRequestID, a3);
}

- (NSMutableDictionary)recordByRequestID
{
  return self->_recordByRequestID;
}

- (void)setRecordByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_recordByRequestID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordByRequestID, 0);
  objc_storeStrong((id *)&self->_recordIDByRequestID, 0);
  objc_storeStrong((id *)&self->_moveChanges, 0);
  objc_storeStrong(&self->_recordPostedBlock, 0);
}

@end
