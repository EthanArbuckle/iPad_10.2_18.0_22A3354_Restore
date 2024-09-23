@implementation CKDQueryURLRequest

- (BOOL)requiresCKAnonymousUserIDs
{
  const char *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDQueryURLRequest;
  if (!-[CKDURLRequest requiresCKAnonymousUserIDs](&v8, sel_requiresCKAnonymousUserIDs))
    return 0;
  objc_msgSend_zoneID(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (id)generateRequestOperations
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
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
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  uint64_t v84;
  void *v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  unint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t j;
  uint64_t v130;
  void *v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  const char *v143;
  void *v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  void *v150;
  const char *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  const char *v160;
  void *v161;
  void *v162;
  const char *v163;
  const char *v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  const char *v170;
  uint64_t v171;
  uint64_t AssetContent;
  const char *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  id v188;
  void *v189;
  _BYTE v190[128];
  _BYTE v191[128];
  uint64_t v192;

  v192 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_operationType(self, a2, v2);
  objc_msgSend_operationRequestWithType_(self, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_requiresCKAnonymousUserIDs(self, v7, v8))
  {
LABEL_4:
    v28 = (void *)objc_opt_new();
    objc_msgSend_setQueryRetrieveRequest_(v6, v29, (uint64_t)v28);

    objc_msgSend_query(self, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend_translator(self, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_query(self, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v188 = 0;
      objc_msgSend_pQueryFromQuery_error_(v35, v39, (uint64_t)v38, &v188);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v188;
      objc_msgSend_queryRetrieveRequest(v6, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setQuery_(v44, v45, (uint64_t)v40);

      if (v41)
      {
        objc_msgSend_finishWithError_(self, v46, (uint64_t)v41);

        v48 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_41;
      }
    }
    else
    {
      objc_msgSend_cursor(self, v33, v34);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        objc_msgSend_cursor(self, v46, v47);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_queryRetrieveRequest(v6, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setContinuationMarker_(v53, v54, (uint64_t)v50);

      }
    }
    objc_msgSend_zoneID(self, v46, v47);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend_translator(self, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(self, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(v58, v62, (uint64_t)v61);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_queryRetrieveRequest(v6, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneIdentifier_(v66, v67, (uint64_t)v63);

    }
    objc_msgSend_requestedFields(self, v56, v57);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      v71 = (void *)objc_opt_new();
      objc_msgSend_queryRetrieveRequest(v6, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRequestedFields_(v74, v75, (uint64_t)v71);

      v186 = 0u;
      v187 = 0u;
      v184 = 0u;
      v185 = 0u;
      objc_msgSend_requestedFields(self, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v79, (uint64_t)&v184, v191, 16);
      if (v80)
      {
        v81 = v80;
        v82 = *(_QWORD *)v185;
        do
        {
          for (i = 0; i != v81; ++i)
          {
            if (*(_QWORD *)v185 != v82)
              objc_enumerationMutation(v78);
            v84 = *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * i);
            v85 = (void *)objc_opt_new();
            objc_msgSend_setName_(v85, v86, v84);
            objc_msgSend_queryRetrieveRequest(v6, v87, v88);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_requestedFields(v89, v90, v91);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addFields_(v92, v93, (uint64_t)v85);

          }
          v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v94, (uint64_t)&v184, v191, 16);
        }
        while (v81);
      }

    }
    if (objc_msgSend_limit(self, v69, v70))
    {
      v97 = objc_msgSend_limit(self, v95, v96);
      if (v97 >= 0xFFFFFFFF)
        v100 = 0xFFFFFFFFLL;
      else
        v100 = v97;
      objc_msgSend_queryRetrieveRequest(v6, v98, v99);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setLimit_(v101, v102, v100);

    }
    objc_msgSend_desiredAssetKeys(self, v95, v96);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend_count(v103, v104, v105);

    if (v106)
    {
      v109 = (void *)objc_opt_new();
      objc_msgSend_queryRetrieveRequest(v6, v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAssetsToDownload_(v112, v113, (uint64_t)v109);

      v114 = (void *)objc_opt_new();
      objc_msgSend_queryRetrieveRequest(v6, v115, v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_assetsToDownload(v117, v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAssetFields_(v120, v121, (uint64_t)v114);

      v182 = 0u;
      v183 = 0u;
      v180 = 0u;
      v181 = 0u;
      objc_msgSend_desiredAssetKeys(self, v122, v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v125, (uint64_t)&v180, v190, 16);
      if (v126)
      {
        v127 = v126;
        v128 = *(_QWORD *)v181;
        do
        {
          for (j = 0; j != v127; ++j)
          {
            if (*(_QWORD *)v181 != v128)
              objc_enumerationMutation(v124);
            v130 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * j);
            v131 = (void *)objc_opt_new();
            objc_msgSend_setName_(v131, v132, v130);
            objc_msgSend_queryRetrieveRequest(v6, v133, v134);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_assetsToDownload(v135, v136, v137);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_assetFields(v138, v139, v140);
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addFields_(v141, v142, (uint64_t)v131);

          }
          v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v143, (uint64_t)&v180, v190, 16);
        }
        while (v127);
      }
    }
    else
    {
      if (!objc_msgSend_shouldFetchAssetContent(self, v107, v108))
      {
LABEL_40:
        v189 = v6;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v164, (uint64_t)&v189, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
      v165 = (void *)objc_opt_new();
      objc_msgSend_queryRetrieveRequest(v6, v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAssetsToDownload_(v168, v169, (uint64_t)v165);

      AssetContent = objc_msgSend_shouldFetchAssetContent(self, v170, v171);
      objc_msgSend_queryRetrieveRequest(v6, v173, v174);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_assetsToDownload(v124, v175, v176);
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAllAssets_(v177, v178, AssetContent);

    }
    goto LABEL_40;
  }
  objc_msgSend_zoneID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anonymousCKUserID(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_zoneID(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_anonymousCKUserID(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDPIdentifier_User(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_request(v6, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAnonymousCKUserID_(v26, v27, (uint64_t)v23);

    goto LABEL_4;
  }
  v144 = (void *)objc_opt_new();
  v145 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_zoneID(self, v146, v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v145, v149, (uint64_t)CFSTR("An anonymousCKUserID is required to query in zone %@ in the shared database when using anonymous to server share participants"), v148);
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v144, v151, (uint64_t)v150, *MEMORY[0x1E0CB2D50]);
  objc_msgSend_operation(self, v152, v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topmostParentOperation(v154, v155, v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_operationID(v157, v158, v159);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if (v161)
    objc_msgSend_setObject_forKeyedSubscript_(v144, v160, (uint64_t)v161, *MEMORY[0x1E0C947F8]);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v160, *MEMORY[0x1E0C94B20], 5015, v144);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishWithError_(self, v163, (uint64_t)v162);

  v48 = 0;
LABEL_41:

  return v48;
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (NSArray)requestedFields
{
  return self->_requestedFields;
}

- (CKQuery)query
{
  return self->_query;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (id)zoneIDsToLock
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_zoneID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  objc_msgSend_zoneID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (BOOL)allowsAnonymousAccount
{
  uint64_t v2;

  return objc_msgSend_databaseScope(self, a2, v2) == 1;
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
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
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
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  CKDRecordResponse *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  void *v55;
  void *v56;
  const char *v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  int hasContinuationMarker;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  void *v83;
  id obj;
  uint64_t v85;
  uint64_t v86;
  void *v88;
  id v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t buf[4];
  void *v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend_hasQueryRetrieveResponse(v3, v4, v5))
  {
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v83 = v3;
    objc_msgSend_queryRetrieveResponse(v3, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_queryResults(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v11;
    v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v91, v97, 16);
    v13 = 0;
    if (v86)
    {
      v85 = *(_QWORD *)v92;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v92 != v85)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x1C3B83E24]();
          v88 = v16;
          if (objc_msgSend_hasRecord(v15, v17, v18))
          {
            objc_msgSend_translator(self, v19, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_record(v15, v22, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_zoneID(self, v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_anonymousCKUserID(v27, v28, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v13;
            objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v21, v31, (uint64_t)v24, v30, &v90);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v90;

            if (!v32)
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v16 = v88;
              v55 = (void *)*MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
              {
                v58 = v55;
                objc_msgSend_record(v15, v59, v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_recordIdentifier(v61, v62, v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v96 = v64;
                _os_log_error_impl(&dword_1BE990000, v58, OS_LOG_TYPE_ERROR, "Invalid data in server protobuf, ignoring record. Offending record: %{public}@", buf, 0xCu);

              }
              v13 = v33;
              goto LABEL_26;
            }
            v16 = v88;
          }
          else
          {
            v32 = 0;
            v33 = v13;
          }
          if (!objc_msgSend_hasIdentifier(v15, v19, v20))
          {
            v47 = 0;
            v13 = v33;
            goto LABEL_15;
          }
          objc_msgSend_translator(self, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(v15, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneID(self, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anonymousCKUserID(v42, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v33;
          objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(v36, v46, (uint64_t)v39, v45, &v89);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v89;

          if (v47)
          {
            v16 = v88;
LABEL_15:
            v48 = [CKDRecordResponse alloc];
            objc_msgSend_etag(v15, v49, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = (void *)objc_msgSend_initWithRecordID_record_etag_(v48, v52, (uint64_t)v47, v32, v51);

            objc_msgSend_addObject_(self->_recordResponses, v54, (uint64_t)v53);
            goto LABEL_26;
          }
          v16 = v88;
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v56 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            v65 = v56;
            objc_msgSend_identifier(v15, v66, v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v96 = v68;
            _os_log_error_impl(&dword_1BE990000, v65, OS_LOG_TYPE_ERROR, "Invalid data in server protobuf, ignoring record. Offending identifier: %{public}@", buf, 0xCu);

          }
LABEL_26:
          objc_autoreleasePoolPop(v16);
          ++v14;
        }
        while (v86 != v14);
        v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v57, (uint64_t)&v91, v97, 16);
      }
      while (v86);
    }

    v3 = v83;
    objc_msgSend_queryRetrieveResponse(v83, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    hasContinuationMarker = objc_msgSend_hasContinuationMarker(v71, v72, v73);

    if (hasContinuationMarker)
    {
      objc_msgSend_queryRetrieveResponse(v83, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_continuationMarker(v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setResultsCursor_(self, v81, (uint64_t)v80);

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)requestDidComplete
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);

  v3 = (void *)MEMORY[0x1C3B83E24](self, a2);
  objc_msgSend_recordsParsedBlock(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_recordsParsedBlock(self, v7, v8);
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSMutableArray *))v9)[2](v9, self->_recordResponses);

  }
  objc_autoreleasePoolPop(v3);
}

- (id)recordsParsedBlock
{
  return self->_recordsParsedBlock;
}

- (CKDQueryURLRequest)initWithOperation:(id)a3 query:(id)a4 cursor:(id)a5 limit:(unint64_t)a6 requestedFields:(id)a7 zoneID:(id)a8
{
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  CKDQueryURLRequest *v20;
  uint64_t v21;
  NSMutableArray *queryResponses;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableArray *recordResponses;
  id v28;
  objc_super v29;

  v28 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)CKDQueryURLRequest;
  v20 = -[CKDURLRequest initWithOperation:](&v29, sel_initWithOperation_, a3);
  if (v20)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v18, v19);
    v21 = objc_claimAutoreleasedReturnValue();
    queryResponses = v20->_queryResponses;
    v20->_queryResponses = (NSMutableArray *)v21;

    objc_storeStrong((id *)&v20->_query, a4);
    objc_storeStrong((id *)&v20->_cursor, a5);
    v20->_limit = a6;
    objc_storeStrong((id *)&v20->_requestedFields, a7);
    objc_storeStrong((id *)&v20->_zoneID, a8);
    v20->_shouldFetchAssetContent = 1;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    recordResponses = v20->_recordResponses;
    v20->_recordResponses = (NSMutableArray *)v25;

  }
  return v20;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (void)setRecordsParsedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSData)resultsCursor
{
  return self->_resultsCursor;
}

- (BOOL)requestGETPreAuth
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  BOOL shouldFetchAssetContent;

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_usePreauth(v4, v5, v6))
    shouldFetchAssetContent = self->_shouldFetchAssetContent;
  else
    shouldFetchAssetContent = 0;

  return shouldFetchAssetContent;
}

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (NSSet)desiredAssetKeys
{
  return self->_desiredAssetKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordResponses, 0);
  objc_storeStrong((id *)&self->_resultsCursor, 0);
  objc_storeStrong(&self->_recordsParsedBlock, 0);
  objc_storeStrong((id *)&self->_desiredAssetKeys, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryResponses, 0);
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKDQueryURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v17, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_query(self, v5, v6, v17.receiver, v17.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, CFSTR("query"));

  objc_msgSend_cursor(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, CFSTR("cursor"));

  objc_msgSend_zoneID(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v16, (uint64_t)v15, CFSTR("zoneID"));

}

- (void)fillOutRequestProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_zoneID(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v7;
  if (v7)
  {
    v13[0] = v7;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFetchRecordZoneIDs_(v4, v11, (uint64_t)v10);

  }
  v12.receiver = self;
  v12.super_class = (Class)CKDQueryURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v12, sel_fillOutRequestProperties_, v4);

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
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  int v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  int hasErrorDescription;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  void *v45;
  const char *v46;
  objc_super v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_result(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasClientError(v10, v11, v12) & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend_result(v4, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientError(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_type(v21, v22, v23);

  if (v24 != 4)
  {
LABEL_6:
    v47.receiver = self;
    v47.super_class = (Class)CKDQueryURLRequest;
    -[CKDURLRequest requestDidParseNodeFailure:](&v47, sel_requestDidParseNodeFailure_, v4);
    goto LABEL_9;
  }
  objc_msgSend_result(v4, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  hasErrorDescription = objc_msgSend_hasErrorDescription(v30, v31, v32);

  if (hasErrorDescription)
  {
    v48 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_result(v4, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v42;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v43, (uint64_t)v49, &v48, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v44 = 0;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v34, *MEMORY[0x1E0C94B20], 1009, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishWithError_(self, v46, (uint64_t)v45);

LABEL_9:
}

- (NSMutableArray)queryResponses
{
  return self->_queryResponses;
}

- (void)setQueryResponses:(id)a3
{
  objc_storeStrong((id *)&self->_queryResponses, a3);
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSData)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
  objc_storeStrong((id *)&self->_cursor, a3);
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void)setZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneID, a3);
}

- (void)setRequestedFields:(id)a3
{
  objc_storeStrong((id *)&self->_requestedFields, a3);
}

- (void)setDesiredAssetKeys:(id)a3
{
  objc_storeStrong((id *)&self->_desiredAssetKeys, a3);
}

- (void)setResultsCursor:(id)a3
{
  objc_storeStrong((id *)&self->_resultsCursor, a3);
}

- (NSMutableArray)recordResponses
{
  return self->_recordResponses;
}

- (void)setRecordResponses:(id)a3
{
  objc_storeStrong((id *)&self->_recordResponses, a3);
}

@end
