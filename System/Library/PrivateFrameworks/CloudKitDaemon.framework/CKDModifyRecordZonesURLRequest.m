@implementation CKDModifyRecordZonesURLRequest

- (CKDModifyRecordZonesURLRequest)initWithOperation:(id)a3 recordZonesToSave:(id)a4 recordZoneIDsToDelete:(id)a5
{
  id v9;
  id v10;
  CKDModifyRecordZonesURLRequest *v11;
  CKDModifyRecordZonesURLRequest *v12;
  uint64_t v13;
  NSMutableDictionary *recordZoneIDByRequestID;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKDModifyRecordZonesURLRequest;
  v11 = -[CKDURLRequest initWithOperation:](&v16, sel_initWithOperation_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_recordZonesToSave, a4);
    objc_storeStrong((id *)&v12->_recordZoneIDsToDelete, a5);
    v13 = objc_opt_new();
    recordZoneIDByRequestID = v12->_recordZoneIDByRequestID;
    v12->_recordZoneIDByRequestID = (NSMutableDictionary *)v13;

  }
  return v12;
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
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CKDModifyRecordZonesURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v25, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_recordZonesToSave(self, v6, v7, v25.receiver, v25.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, CFSTR("modifyIDs"));
  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_recordZoneIDsToDelete(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckEquivalencyProperties(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v15, v22, (uint64_t)v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v24, (uint64_t)v23, CFSTR("deleteIDs"));
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
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  objc_super v15;

  v4 = a3;
  objc_msgSend_recordZonesToSave(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMap_(v7, v8, (uint64_t)&unk_1E7838A98);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setModifyRecordZoneIDs_(v4, v10, (uint64_t)v9);
  objc_msgSend_recordZoneIDsToDelete(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeleteRecordZoneIDs_(v4, v14, (uint64_t)v13);

  v15.receiver = self;
  v15.super_class = (Class)CKDModifyRecordZonesURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v15, sel_fillOutRequestProperties_, v4);

}

- (BOOL)requiresCKAnonymousUserIDs
{
  return 0;
}

- (id)zoneIDsToLock
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend_recordZonesToSave(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v33, v38, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v34;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v6);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v33 + 1) + 8 * v13), v9, v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v3, v15, (uint64_t)v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v33, v38, 16);
    }
    while (v11);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend_recordZoneIDsToDelete(self, v16, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v29, v37, 16);
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v30;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v18);
        objc_msgSend_addObject_(v3, v21, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v24++));
      }
      while (v22 != v24);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v29, v37, 16);
    }
    while (v22);
  }

  objc_msgSend_allObjects(v3, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)requestOperationClasses
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;

  v3 = (void *)objc_opt_new();
  objc_msgSend_recordZonesToSave(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    v12 = objc_opt_class();
    objc_msgSend_addObject_(v3, v13, v12);
  }
  objc_msgSend_recordZoneIDsToDelete(self, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v14, v15, v16);

  if (v17)
  {
    v18 = objc_opt_class();
    objc_msgSend_addObject_(v3, v19, v18);
  }
  return v3;
}

- (id)makeRequestOperations
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  char isEqual;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  CKDPZoneSignedCryptoRequirements *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  int v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  uint64_t v80;
  int v81;
  const char *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  void *v91;
  const char *v92;
  void *v93;
  const char *v94;
  void *v95;
  const char *v96;
  void *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  const char *v113;
  NSObject *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  NSObject *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t i;
  uint64_t v136;
  void *v137;
  void *v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  double v170;
  double v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  id v190;
  __int128 v192;
  NSObject *log;
  os_log_t loga;
  id v196;
  void *v197;
  void *v198;
  uint64_t v199;
  id obj;
  void *v201;
  void *v202;
  id v203;
  id v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  id v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  uint8_t v214[128];
  uint8_t buf[4];
  uint64_t v216;
  __int16 v217;
  id v218;
  __int16 v219;
  void *v220;
  _BYTE v221[128];
  uint64_t v222;

  v222 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v210 = 0u;
  v211 = 0u;
  v212 = 0u;
  v213 = 0u;
  objc_msgSend_recordZonesToSave(self, v4, v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v210, v221, 16);
  if (v7)
  {
    v10 = v7;
    v203 = *(id *)v211;
    v197 = (void *)*MEMORY[0x1E0C94B20];
    *(_QWORD *)&v9 = 138543618;
    v192 = v9;
    v198 = v3;
LABEL_3:
    v11 = 0;
    v199 = v10;
    while (1)
    {
      if (*(id *)v211 != v203)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v210 + 1) + 8 * v11);
      objc_msgSend_operationRequestWithType_(self, v8, 200, v192);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_opt_new();
      objc_msgSend_setZoneSaveRequest_(v13, v15, (uint64_t)v14);

      objc_msgSend_previousProtectionEtag(v12, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneSaveRequest(v13, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneProtectionInfoTag_(v21, v22, (uint64_t)v18);

      objc_msgSend_translator(self, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pRecordZoneFromRecordZone_(v25, v26, (uint64_t)v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_originalRequiredFeatures(v12, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_requiredFeatures(v12, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v30, v34, (uint64_t)v33);

      if ((isEqual & 1) == 0)
        break;
LABEL_36:
      objc_msgSend_zoneSaveRequest(v13, v36, v37);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRecordZone_(v97, v98, (uint64_t)v27);

      objc_msgSend_addObject_(v3, v99, (uint64_t)v13);
      objc_msgSend_zoneID(v12, v100, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordZoneIDByRequestID(self, v103, v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_request(v13, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationUUID(v108, v109, v110);
      v111 = v27;
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v105, v113, (uint64_t)v102, v112);

      if (v10 == ++v11)
      {
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v210, v221, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_38;
      }
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v38 = (void *)*MEMORY[0x1E0C952B0];
    v202 = v27;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v114 = v38;
      objc_msgSend_zoneID(v12, v115, v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_requiredFeatures(v12, v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_originalRequiredFeatures(v12, v121, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v216 = (uint64_t)v117;
      v217 = 2112;
      v218 = v120;
      v219 = 2112;
      v220 = v123;
      _os_log_debug_impl(&dword_1BE990000, v114, OS_LOG_TYPE_DEBUG, "Saving updated required features for zone %@.\nUpdated: %@\nPrevious: %@", buf, 0x20u);

    }
    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(self, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v41, v42, (uint64_t)CFSTR("DoNotExpectUpdatingRequiredFeatures"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v46, v47, (uint64_t)a2, self, CFSTR("CKDModifyRecordZonesURLRequest.m"), 103, CFSTR("Expected not to update required feature set but actually did"));

      }
    }
    v48 = objc_alloc_init(CKDPZoneSignedCryptoRequirements);
    objc_msgSend_translator(self, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pZoneCryptoFeatureRequirmentsFromZone_(v51, v52, (uint64_t)v12);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(self, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v56, v57, (uint64_t)CFSTR("HigherCryptoFeatureRequirementsMinimumSchemaVersion"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        v59 = objc_msgSend_minimumSchemaVersion(v53, v54, v55);
        objc_msgSend_setMinimumSchemaVersion_(v53, v60, (v59 + 1));
      }
    }
    v201 = v53;
    objc_msgSend_data(v53, v54, v55);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(self, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v209 = 0;
    objc_msgSend_createCloudKitFeaturesSignatureForData_error_(v67, v68, (uint64_t)v61, &v209);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v209;

    if (v69)
    {
      objc_msgSend_setSignature_(v48, v71, (uint64_t)v69);
      objc_msgSend_setSerializedRequirements_(v48, v73, (uint64_t)v61);
      objc_msgSend_setVersion_(v48, v74, *MEMORY[0x1E0C95410]);
      if (*MEMORY[0x1E0C95280])
      {
        objc_msgSend_unitTestOverrides(self, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v77, v78, (uint64_t)CFSTR("HigherSignedCryptoRequirementsVersion"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (v79)
        {
          v81 = objc_msgSend_version(v48, v75, v80);
          objc_msgSend_setVersion_(v48, v82, (v81 + 1));
        }
      }
      v27 = v202;
      objc_msgSend_setSignedCryptoRequirements_(v202, v75, (uint64_t)v48);
      goto LABEL_35;
    }
    objc_msgSend_domain(v70, v71, v72);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = v70;
    if (v83 == v197)
    {
      v86 = objc_msgSend_code(v70, v84, v85);

      if (v86 == 5000)
      {
        objc_msgSend_zoneID(v12, v87, v88);
        v89 = objc_claimAutoreleasedReturnValue();
        v27 = v202;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        log = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v216 = v89;
          _os_log_impl(&dword_1BE990000, log, OS_LOG_TYPE_INFO, "Missing identity for signing required features when saving record zone %{public}@.", buf, 0xCu);
        }
        loga = (os_log_t)v89;
        v70 = v196;
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v90, (uint64_t)v197, 5000, v196, CFSTR("Failed to create cryptographic signature when saving modified record zones."));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_finishWithError_(self, v92, (uint64_t)v91);

LABEL_35:
        v3 = v198;
        v10 = v199;
        if (!v69)
        {

          v190 = 0;
          goto LABEL_49;
        }
        goto LABEL_36;
      }
    }
    else
    {

    }
    v27 = v202;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v93 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v124 = v93;
      objc_msgSend_zoneID(v12, v125, v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v192;
      v216 = (uint64_t)v127;
      v217 = 2114;
      v218 = v70;
      _os_log_error_impl(&dword_1BE990000, v124, OS_LOG_TYPE_ERROR, "Failed to generate signature for required features when saving record zone %{public}@. Error: %{public}@", buf, 0x16u);

      v27 = v202;
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v94, (uint64_t)v197, 5002, v70, CFSTR("Failed to create cryptographic signature when saving modified record zones."));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v96, (uint64_t)v95);

    goto LABEL_35;
  }
LABEL_38:

  v207 = 0u;
  v208 = 0u;
  v205 = 0u;
  v206 = 0u;
  objc_msgSend_recordZoneIDsToDelete(self, v128, v129);
  v204 = (id)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(v204, v130, (uint64_t)&v205, v214, 16);
  if (v131)
  {
    v133 = v131;
    v134 = *(_QWORD *)v206;
    do
    {
      for (i = 0; i != v133; ++i)
      {
        if (*(_QWORD *)v206 != v134)
          objc_enumerationMutation(v204);
        v136 = *(_QWORD *)(*((_QWORD *)&v205 + 1) + 8 * i);
        objc_msgSend_operationRequestWithType_(self, v132, 202);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = (void *)objc_opt_new();
        objc_msgSend_setZoneDeleteRequest_(v137, v139, (uint64_t)v138);

        objc_msgSend_translator(self, v140, v141);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(v142, v143, v136);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneDeleteRequest(v137, v145, v146);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setZoneIdentifier_(v147, v148, (uint64_t)v144);

        v151 = objc_msgSend_markZonesAsUserPurged(self, v149, v150);
        objc_msgSend_zoneDeleteRequest(v137, v152, v153);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setUserPurge_(v154, v155, v151);

        objc_msgSend_lastMissingManateeIdentityErrorDate(self, v156, v157);
        v158 = (void *)objc_claimAutoreleasedReturnValue();

        if (v158)
        {
          v160 = (void *)objc_opt_new();
          objc_msgSend_zoneDeleteRequest(v137, v161, v162);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setLastMissingManateeIdentityErrorDate_(v163, v164, (uint64_t)v160);

          objc_msgSend_lastMissingManateeIdentityErrorDate(self, v165, v166);
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_timeIntervalSinceReferenceDate(v167, v168, v169);
          v171 = v170;
          objc_msgSend_zoneDeleteRequest(v137, v172, v173);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lastMissingManateeIdentityErrorDate(v174, v175, v176);
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setTime_(v177, v178, v179, v171);

        }
        objc_msgSend_addObject_(v3, v159, (uint64_t)v137);
        objc_msgSend_recordZoneIDByRequestID(self, v180, v181);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v137, v183, v184);
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationUUID(v185, v186, v187);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v182, v189, v136, v188);

      }
      v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v204, v132, (uint64_t)&v205, v214, 16);
    }
    while (v133);
  }

  v190 = v3;
LABEL_49:

  return v190;
}

- (id)generateRequestOperations
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  objc_msgSend_generatedRequestOperations(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend_makeRequestOperations(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGeneratedRequestOperations_(self, v8, (uint64_t)v7);

  }
  return (id)objc_msgSend_generatedRequestOperations(self, v5, v6);
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
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  int hasExpirationTime;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  int SavedPerZone;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  void *v70;
  void *v71;
  const char *v72;
  int isEqual;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void (**v82)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v83;
  uint64_t v84;
  void *v85;
  unsigned int v87;
  void *v88;
  void *v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_recordZoneIDByRequestID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_zoneSaveResponse(v4, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_capabilities(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_translator(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend_capabilitiesFromPZoneCapabilities_(v24, v25, (uint64_t)v21);

  objc_msgSend_zoneSaveResponse(v4, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  hasExpirationTime = objc_msgSend_hasExpirationTime(v28, v29, v30);

  if (hasExpirationTime)
  {
    objc_msgSend_zoneSaveResponse(v4, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expirationTime(v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_time(v37, v38, v39);
    v41 = v40;

    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v42, v43, v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = 0;
  }
  objc_msgSend_zoneSaveResponse(v4, v32, v33);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend_expired(v45, v46, v47);

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isAppleInternalInstall(v51, v52, v53) & 1) != 0)
  {
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v54, v55);
    v89 = v21;
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    SavedPerZone = objc_msgSend_stubRequiredFeaturesUsingLastSavedPerZone(v56, v57, v58);

    v21 = v89;
    if (SavedPerZone)
    {
      v87 = v48;
      v88 = v44;
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      objc_msgSend_recordZonesToSave(self, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v91, v95, 16);
      if (v64)
      {
        v67 = v64;
        v68 = *(_QWORD *)v92;
        while (2)
        {
          for (i = 0; i != v67; ++i)
          {
            if (*(_QWORD *)v92 != v68)
              objc_enumerationMutation(v62);
            v70 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
            objc_msgSend_zoneID(v70, v65, v66);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            isEqual = objc_msgSend_isEqual_(v71, v72, (uint64_t)v15);

            if (isEqual)
            {
              objc_msgSend_requiredFeatures(v70, v65, v66);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_sharedCache(CKDRequiredFeaturesCache, v75, v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setRequiredFeatures_forZoneID_(v77, v78, (uint64_t)v74, v15);

              goto LABEL_17;
            }
          }
          v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v91, v95, 16);
          if (v67)
            continue;
          break;
        }
      }
LABEL_17:

      v44 = v88;
      v21 = v89;
      v48 = v87;
    }
  }
  else
  {

  }
  objc_msgSend_recordZoneModifiedBlock(self, v60, v61);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    objc_msgSend_recordZoneModifiedBlock(self, v80, v81);
    v82 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, uint64_t, void *, uint64_t))v82)[2](v82, v15, v85, v90, v44, v48);

  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend_recordZoneIDByRequestID(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v24, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recordZoneModifiedBlock(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_recordZoneModifiedBlock(self, v18, v19);
    v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v24, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, _QWORD, _QWORD, _QWORD))v20)[2](v20, v14, v23, 0, 0, 0);

  }
}

- (BOOL)markZonesAsUserPurged
{
  return self->_markZonesAsUserPurged;
}

- (void)setMarkZonesAsUserPurged:(BOOL)a3
{
  self->_markZonesAsUserPurged = a3;
}

- (NSDate)lastMissingManateeIdentityErrorDate
{
  return self->_lastMissingManateeIdentityErrorDate;
}

- (void)setLastMissingManateeIdentityErrorDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastMissingManateeIdentityErrorDate, a3);
}

- (id)recordZoneModifiedBlock
{
  return self->_recordZoneModifiedBlock;
}

- (void)setRecordZoneModifiedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSArray)recordZonesToSave
{
  return self->_recordZonesToSave;
}

- (void)setRecordZonesToSave:(id)a3
{
  objc_storeStrong((id *)&self->_recordZonesToSave, a3);
}

- (NSArray)recordZoneIDsToDelete
{
  return self->_recordZoneIDsToDelete;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, a3);
}

- (NSArray)generatedRequestOperations
{
  return self->_generatedRequestOperations;
}

- (void)setGeneratedRequestOperations:(id)a3
{
  objc_storeStrong((id *)&self->_generatedRequestOperations, a3);
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
  objc_storeStrong((id *)&self->_generatedRequestOperations, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
  objc_storeStrong(&self->_recordZoneModifiedBlock, 0);
  objc_storeStrong((id *)&self->_lastMissingManateeIdentityErrorDate, 0);
}

@end
