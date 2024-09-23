@implementation CKDFetchRecordZoneChangesURLRequest

- (NSMutableDictionary)zoneIDsByRequestOperationUUID
{
  return self->_zoneIDsByRequestOperationUUID;
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

- (NSDictionary)supplementalChangeTokenByZoneID
{
  return self->_supplementalChangeTokenByZoneID;
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setSupplementalChangeTokenByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, a3);
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (void)setRecordsChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void)setRecordDeletedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void)setFetchChangesForMergeableValues:(BOOL)a3
{
  self->_fetchChangesForMergeableValues = a3;
}

- (void)setChangeTypes:(int64_t)a3
{
  self->_changeTypes = a3;
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

- (NSMutableDictionary)requestResultsByRecordZoneID
{
  return self->_requestResultsByRecordZoneID;
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
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  id v46;
  id v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  void *v99;
  const char *v100;
  const char *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  int hasStatus;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  void *v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  void *v134;
  id v135;
  void *v136;
  CKDFetchRecordZoneChangesURLRequest *v137;
  id v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend_hasRecordRetrieveChangesResponse(v5, v6, v7))
  {
    v46 = 0;
    goto LABEL_26;
  }
  objc_msgSend_zoneIDsByRequestOperationUUID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v5, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v17, (uint64_t)v16);
  v18 = objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_response(v5, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationUUID(v123, v124, v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneIDsByRequestOperationUUID(self, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v129, v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v120, v133, (uint64_t)a2, self, CFSTR("CKDFetchRecordZoneChangesURLRequest.m"), 352, CFSTR("Got a response for an unknown zone with request operation %@ %@"), v126, v132);

  }
  objc_msgSend_recordsChangedBlock(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = self;
  if (v21
    || (objc_msgSend_recordDeletedBlock(self, v22, v23), (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_7:
    objc_msgSend_recordRetrieveChangesResponse(v5, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_changedRecords(v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordRetrieveChangesResponse(v5, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_changedDeltas(v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v5;
    objc_msgSend_recordRetrieveChangesResponse(v5, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneAttributesChange(v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__handleRecordChanges_deltaChanges_zoneAttributesChange_forZoneID_(self, v45, (uint64_t)v31, v37, v44, v18);
    v46 = (id)objc_claimAutoreleasedReturnValue();

    if (v46)
      v47 = v46;

    v5 = v38;
    goto LABEL_10;
  }
  objc_msgSend_zoneAttributesChangedBlock(self, v24, v25);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  if (v119)
    goto LABEL_7;
  v46 = 0;
LABEL_10:
  v48 = (void *)objc_opt_new();
  objc_msgSend_recordRetrieveChangesResponse(v5, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncContinuationToken(v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResultServerChangeTokenData_(v48, v55, (uint64_t)v54);

  objc_msgSend_recordRetrieveChangesResponse(v5, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientChangeToken(v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResultClientChangeTokenData_(v48, v62, (uint64_t)v61);

  objc_msgSend_recordRetrieveChangesResponse(v5, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend_pendingArchivedRecords(v65, v66, v67);
  objc_msgSend_setHasPendingArchivedRecords_(v48, v69, v68);

  objc_msgSend_recordRetrieveChangesResponse(v5, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend_syncObligationsCount(v72, v73, v74);

  v136 = (void *)v18;
  if (v75)
  {
    v134 = v48;
    v78 = (void *)objc_opt_new();
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    v142 = 0u;
    v135 = v5;
    objc_msgSend_recordRetrieveChangesResponse(v5, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_syncObligations(v81, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v139, v143, 16);
    if (v86)
    {
      v89 = v86;
      v90 = *(_QWORD *)v140;
      do
      {
        v91 = 0;
        v92 = v46;
        do
        {
          if (*(_QWORD *)v140 != v90)
            objc_enumerationMutation(v84);
          v93 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v91);
          objc_msgSend_translator(v137, v87, v88);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneIdentifier(v93, v95, v96);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = v92;
          objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_error_(v94, v98, (uint64_t)v97, &v138);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v138;

          objc_msgSend_addObject_(v78, v100, (uint64_t)v99);
          ++v91;
          v92 = v46;
        }
        while (v89 != v91);
        v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v87, (uint64_t)&v139, v143, 16);
      }
      while (v89);
    }

    v48 = v134;
    objc_msgSend_setSyncObligationZoneIDs_(v134, v101, (uint64_t)v78);

    v5 = v135;
  }
  objc_msgSend_recordRetrieveChangesResponse(v5, v76, v77);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  hasStatus = objc_msgSend_hasStatus(v102, v103, v104);

  if (hasStatus)
  {
    objc_msgSend_recordRetrieveChangesResponse(v5, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend_status(v108, v109, v110);

    v112 = (v111 - 1);
    if (v112 <= 2)
      v113 = v112 + 1;
    else
      v113 = -1;
  }
  else
  {
    v113 = -1;
  }
  objc_msgSend_setStatus_(v48, v106, v113);
  objc_msgSend_requestResultsByRecordZoneID(v137, v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v116, v117, (uint64_t)v48, v136);

LABEL_26:
  return v46;
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
  objc_msgSend_recordsChangedBlock(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_recordsChangedBlock(self, v7, v8);
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSMutableArray *))v9)[2](v9, self->_recordResponses);

  }
  objc_autoreleasePoolPop(v3);
}

- (id)recordsChangedBlock
{
  return self->_recordsChangedBlock;
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (NSMutableDictionary)nodeErrorsByZoneID
{
  return self->_nodeErrorsByZoneID;
}

- (CKDFetchRecordZoneChangesURLRequest)initWithOperation:(id)a3 recordZoneIDs:(id)a4 configurationsByRecordZoneID:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  CKDFetchRecordZoneChangesURLRequest *v12;
  uint64_t v13;
  NSArray *recordZoneIDs;
  uint64_t v15;
  NSMutableDictionary *zoneIDsByRequestOperationUUID;
  uint64_t v17;
  NSMutableDictionary *requestResultsByRecordZoneID;
  uint64_t v19;
  NSMutableDictionary *nodeErrorsByZoneID;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *recordResponses;
  objc_super v26;

  v8 = a4;
  v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CKDFetchRecordZoneChangesURLRequest;
  v12 = -[CKDURLRequest initWithOperation:](&v26, sel_initWithOperation_, a3);
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

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    recordResponses = v12->_recordResponses;
    v12->_recordResponses = (NSMutableArray *)v23;

  }
  return v12;
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
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
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
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  unsigned int v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  const char *v72;
  uint64_t NewestChangesFirst;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t i;
  uint64_t v102;
  void *v103;
  const char *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  const char *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t j;
  uint64_t v140;
  void *v141;
  const char *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  const char *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  uint64_t AssetContent;
  const char *v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t k;
  uint64_t v183;
  void *v184;
  const char *v185;
  void *v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  void *v192;
  const char *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  const char *v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  void *v212;
  const char *v213;
  void *v214;
  const char *v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  id obj;
  uint64_t v222;
  id v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  char v227;
  uint64_t v228;
  void *v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  uint64_t v250;

  v250 = *MEMORY[0x1E0C80C00];
  v223 = (id)objc_opt_new();
  v242 = 0u;
  v243 = 0u;
  v244 = 0u;
  v245 = 0u;
  objc_msgSend_recordZoneIDs(self, v3, v4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v224 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v242, v249, 16);
  if (v224)
  {
    v8 = 0;
    v222 = *(_QWORD *)v243;
    do
    {
      v9 = 0;
      do
      {
        v227 = v8;
        if (*(_QWORD *)v243 != v222)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * v9);
        objc_msgSend_configurationsByRecordZoneID(self, v6, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend_operationType(self, v14, v15);
        objc_msgSend_operationRequestWithType_(self, v17, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_requiresCKAnonymousUserIDs(self, v19, v20))
        {
          objc_msgSend_anonymousCKUserID(v10, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v24, v25);
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v216, v217, (uint64_t)a2, self, CFSTR("CKDFetchRecordZoneChangesURLRequest.m"), 116, CFSTR("An anonymousCKUserID is required to fetch record zone changes in %@ in the shared database when using anonymous to server share participants"), v10);

          }
          objc_msgSend_anonymousCKUserID(v10, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKDPIdentifier_User(v26, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_request(v18, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAnonymousCKUserID_(v32, v33, (uint64_t)v29);

        }
        v34 = (void *)objc_opt_new();
        objc_msgSend_setRecordRetrieveChangesRequest_(v18, v35, (uint64_t)v34);

        objc_msgSend_previousServerChangeToken(v13, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_data(v38, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordRetrieveChangesRequest(v18, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSyncContinuationToken_(v44, v45, (uint64_t)v41);

        objc_msgSend_translator(self, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(v48, v49, (uint64_t)v10);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordRetrieveChangesRequest(v18, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setZoneIdentifier_(v53, v54, (uint64_t)v50);

        v57 = objc_msgSend_changeTypes(self, v55, v56);
        if (v57 == 1)
          v60 = 2;
        else
          v60 = 1;
        if (v57 == 2)
          v61 = 3;
        else
          v61 = v60;
        objc_msgSend_recordRetrieveChangesRequest(v18, v58, v59);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRequestedChangeTypes_(v62, v63, v61);

        if (objc_msgSend_resultsLimit(v13, v64, v65))
        {
          v70 = objc_msgSend_resultsLimit(v13, v66, v67);
          if (HIDWORD(v70))
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v68, v69);
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v213, (uint64_t)"uint32_t CKDownsizeOrDie(NSUInteger)");
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v212, v215, (uint64_t)v214, CFSTR("CloudKit-Prefix.pch"), 34, CFSTR("That number was ridiculous"));

          }
          objc_msgSend_recordRetrieveChangesRequest(v18, v68, v69);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setMaxChanges_(v71, v72, v70);

        }
        NewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(v13, v66, v67);
        objc_msgSend_recordRetrieveChangesRequest(v18, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setNewestFirst_(v76, v77, NewestChangesFirst);

        if (v13 && (objc_msgSend_fetchChangesMadeByThisDevice(v13, v78, v79) & 1) == 0)
        {
          objc_msgSend_recordRetrieveChangesRequest(v18, v78, v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setIgnoreCallingDeviceChanges_(v80, v81, 1);

        }
        v228 = (uint64_t)v10;
        if (objc_msgSend_fetchChangesForMergeableValues(self, v78, v79))
        {
          objc_msgSend_recordRetrieveChangesRequest(v18, v82, v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setIncludeMergeableDeltas_(v84, v85, 1);

        }
        objc_msgSend_desiredKeys(v13, v82, v83);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        v229 = v13;
        if (v86)
        {
          v89 = (void *)objc_opt_new();
          objc_msgSend_recordRetrieveChangesRequest(v18, v90, v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRequestedFields_(v92, v93, (uint64_t)v89);

          v240 = 0u;
          v241 = 0u;
          v238 = 0u;
          v239 = 0u;
          objc_msgSend_desiredKeys(v13, v94, v95);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v96, v97, (uint64_t)&v238, v248, 16);
          if (v98)
          {
            v99 = v98;
            v100 = *(_QWORD *)v239;
            do
            {
              for (i = 0; i != v99; ++i)
              {
                if (*(_QWORD *)v239 != v100)
                  objc_enumerationMutation(v96);
                v102 = *(_QWORD *)(*((_QWORD *)&v238 + 1) + 8 * i);
                v103 = (void *)objc_opt_new();
                objc_msgSend_setName_(v103, v104, v102);
                objc_msgSend_recordRetrieveChangesRequest(v18, v105, v106);
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_requestedFields(v107, v108, v109);
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addFields_(v110, v111, (uint64_t)v103);

              }
              v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v96, v112, (uint64_t)&v238, v248, 16);
            }
            while (v99);
          }

          v13 = v229;
        }
        objc_msgSend_desiredAssetKeys(self, v87, v88);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = objc_msgSend_count(v113, v114, v115);

        if (v116)
        {
          v119 = (void *)objc_opt_new();
          objc_msgSend_recordRetrieveChangesRequest(v18, v120, v121);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAssetsToDownload_(v122, v123, (uint64_t)v119);

          v124 = (void *)objc_opt_new();
          objc_msgSend_recordRetrieveChangesRequest(v18, v125, v126);
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_assetsToDownload(v127, v128, v129);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAssetFields_(v130, v131, (uint64_t)v124);

          v236 = 0u;
          v237 = 0u;
          v234 = 0u;
          v235 = 0u;
          objc_msgSend_desiredAssetKeys(self, v132, v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v234, v247, 16);
          if (v136)
          {
            v137 = v136;
            v225 = v9;
            v138 = *(_QWORD *)v235;
            do
            {
              for (j = 0; j != v137; ++j)
              {
                if (*(_QWORD *)v235 != v138)
                  objc_enumerationMutation(v134);
                v140 = *(_QWORD *)(*((_QWORD *)&v234 + 1) + 8 * j);
                v141 = (void *)objc_opt_new();
                objc_msgSend_setName_(v141, v142, v140);
                objc_msgSend_recordRetrieveChangesRequest(v18, v143, v144);
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_assetsToDownload(v145, v146, v147);
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_assetFields(v148, v149, v150);
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addFields_(v151, v152, (uint64_t)v141);

              }
              v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v153, (uint64_t)&v234, v247, 16);
            }
            while (v137);
            v9 = v225;
            v13 = v229;
          }
        }
        else
        {
          if (!objc_msgSend_shouldFetchAssetContent(self, v117, v118))
            goto LABEL_46;
          v156 = (void *)objc_opt_new();
          objc_msgSend_recordRetrieveChangesRequest(v18, v157, v158);
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAssetsToDownload_(v159, v160, (uint64_t)v156);

          AssetContent = objc_msgSend_shouldFetchAssetContent(self, v161, v162);
          objc_msgSend_recordRetrieveChangesRequest(v18, v164, v165);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_assetsToDownload(v134, v166, v167);
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAllAssets_(v168, v169, AssetContent);

        }
LABEL_46:
        if ((v227 & 1) == 0)
        {
          v226 = v9;
          objc_msgSend_header(v18, v154, v155);
          v170 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v170)
          {
            v173 = (void *)objc_opt_new();
            objc_msgSend_setHeader_(v18, v174, (uint64_t)v173);

          }
          v232 = 0u;
          v233 = 0u;
          v230 = 0u;
          v231 = 0u;
          objc_msgSend_supplementalChangeTokenByZoneID(self, v171, v172);
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v175, v176, (uint64_t)&v230, v246, 16);
          if (v177)
          {
            v180 = v177;
            v181 = *(_QWORD *)v231;
            do
            {
              for (k = 0; k != v180; ++k)
              {
                if (*(_QWORD *)v231 != v181)
                  objc_enumerationMutation(v175);
                v183 = *(_QWORD *)(*((_QWORD *)&v230 + 1) + 8 * k);
                objc_msgSend_supplementalChangeTokenByZoneID(self, v178, v179);
                v184 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v184, v185, v183);
                v186 = (void *)objc_claimAutoreleasedReturnValue();

                v187 = (void *)objc_opt_new();
                objc_msgSend_translator(self, v188, v189);
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(v190, v191, v183);
                v192 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setZoneIdentifier_(v187, v193, (uint64_t)v192);

                objc_msgSend_data(v186, v194, v195);
                v196 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setSyncContinuationToken_(v187, v197, (uint64_t)v196);

                objc_msgSend_header(v18, v198, v199);
                v200 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addSupplementalZoneInfos_(v200, v201, (uint64_t)v187);

              }
              v180 = objc_msgSend_countByEnumeratingWithState_objects_count_(v175, v178, (uint64_t)&v230, v246, 16);
            }
            while (v180);
          }

          v9 = v226;
          v13 = v229;
        }
        objc_msgSend_addObject_(v223, v154, (uint64_t)v18);
        objc_msgSend_zoneIDsByRequestOperationUUID(self, v202, v203);
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v18, v205, v206);
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationUUID(v207, v208, v209);
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v204, v211, v228, v210);

        ++v9;
        v8 = 1;
      }
      while (v9 != v224);
      v218 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v242, v249, 16);
      v8 = 1;
      v224 = v218;
    }
    while (v218);
  }

  return v223;
}

- (BOOL)fetchChangesForMergeableValues
{
  return self->_fetchChangesForMergeableValues;
}

- (NSSet)desiredAssetKeys
{
  return self->_desiredAssetKeys;
}

- (NSDictionary)configurationsByRecordZoneID
{
  return self->_configurationsByRecordZoneID;
}

- (int64_t)changeTypes
{
  return self->_changeTypes;
}

- (BOOL)allowsAnonymousAccount
{
  uint64_t v2;

  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordResponses, 0);
  objc_storeStrong((id *)&self->_nodeErrorsByZoneID, 0);
  objc_storeStrong((id *)&self->_requestResultsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_zoneIDsByRequestOperationUUID, 0);
  objc_storeStrong(&self->_zoneAttributesChangedBlock, 0);
  objc_storeStrong(&self->_recordDeletedBlock, 0);
  objc_storeStrong(&self->_recordsChangedBlock, 0);
  objc_storeStrong((id *)&self->_supplementalChangeTokenByZoneID, 0);
  objc_storeStrong((id *)&self->_desiredAssetKeys, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
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
  v31.super_class = (Class)CKDFetchRecordZoneChangesURLRequest;
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
  v9.super_class = (Class)CKDFetchRecordZoneChangesURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v9, sel_fillOutRequestProperties_, v4);

}

- (id)_handleRecordChanges:(id)a3 deltaChanges:(id)a4 zoneAttributesChange:(id)a5 forZoneID:(id)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  void *v23;
  CKDFetchRecordZoneChangesURLRequest *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void (**v31)(_QWORD, _QWORD);
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  id v56;
  const char *v57;
  uint64_t v58;
  void (**v59)(_QWORD, _QWORD, _QWORD);
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  id v79;
  int v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  id v91;
  const char *v92;
  CKDRecordResponse *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t hasEncryptedAsset;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  id v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  const char *v153;
  id v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  id v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  const char *v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  void *v184;
  id v185;
  uint64_t v186;
  BOOL v187;
  void *v188;
  const char *v189;
  const char *v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  NSObject *v194;
  const char *v195;
  uint64_t v196;
  void *v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  void *v203;
  const char *v204;
  void *v205;
  void *v206;
  const char *v207;
  void *v208;
  const char *v209;
  void *v210;
  const char *v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  const char *v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  id v222;
  const char *v223;
  void *v224;
  const char *v225;
  CKDRecordResponse *v226;
  const char *v227;
  const char *v228;
  const char *v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  void *v233;
  void *v234;
  const char *v235;
  id v236;
  const char *v237;
  NSObject *v238;
  const char *v239;
  uint64_t v240;
  void *v241;
  NSObject *v242;
  const char *v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  const char *v247;
  const char *v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  NSObject *v252;
  const char *v253;
  uint64_t v254;
  void *v255;
  NSObject *v256;
  const char *v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  const char *v261;
  NSObject *v262;
  const char *v263;
  uint64_t v264;
  void *v265;
  NSObject *v266;
  const char *v267;
  uint64_t v268;
  void *v269;
  NSObject *v271;
  const char *v272;
  uint64_t v273;
  void *v274;
  NSObject *v275;
  const char *v276;
  uint64_t v277;
  void *v278;
  const char *v279;
  uint64_t v280;
  void *v281;
  void *v282;
  id v283;
  uint64_t v284;
  void *v285;
  void *v286;
  void *v287;
  id v288;
  id v289;
  id obj;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  void *v296;
  uint64_t v297;
  void *v298;
  uint64_t v299;
  uint64_t v300;
  void *v301;
  void *v302;
  uint64_t v303;
  id v304;
  id v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  id v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  id v316;
  id v317;
  id v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  id v323;
  _BYTE v324[128];
  _BYTE v325[128];
  uint8_t v326[128];
  uint8_t buf[4];
  void *v328;
  __int16 v329;
  id v330;
  uint64_t v331;

  v331 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v283 = a4;
  v10 = a5;
  v304 = a6;
  v282 = v10;
  if (v10 && objc_msgSend_hasRecordZone(v10, v11, v12))
  {
    v13 = (void *)MEMORY[0x1C3B83E24]();
    objc_msgSend_translator(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordZone(v10, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v323 = 0;
    objc_msgSend_recordZoneFromPRecordZone_error_(v16, v20, (uint64_t)v19, &v323);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v323;

    v23 = (void *)*MEMORY[0x1E0C952F8];
    if (v21)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v23);
      v24 = self;
      v25 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v271 = v25;
        objc_msgSend_zoneID(v21, v272, v273);
        v274 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v328 = v274;
        _os_log_debug_impl(&dword_1BE990000, v271, OS_LOG_TYPE_DEBUG, "Received zone attributes change for zone %{public}@", buf, 0xCu);

      }
      objc_msgSend_zoneAttributesChangedBlock(self, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
        goto LABEL_17;
      objc_msgSend_zoneAttributesChangedBlock(self, v29, v30);
      v31 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v31)[2](v31, v21);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v23);
      v24 = self;
      v32 = (void *)*MEMORY[0x1E0C952E0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
      {
        v275 = v32;
        objc_msgSend_requestUUID(self, v276, v277);
        v278 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordZone(v282, v279, v280);
        v281 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v328 = v278;
        v329 = 2112;
        v330 = v281;
        _os_log_error_impl(&dword_1BE990000, v275, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to parse record zone for record zone attributes change: %@\", buf, 0x16u);

      }
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v33, *MEMORY[0x1E0C947D8], 1005, v22, CFSTR("Failed to parse record zone attributes change"));
      v31 = (void (**)(_QWORD, _QWORD))v22;
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_17:
    objc_autoreleasePoolPop(v13);
    goto LABEL_18;
  }
  v22 = 0;
  v24 = self;
LABEL_18:
  v286 = (void *)objc_opt_new();
  v319 = 0u;
  v320 = 0u;
  v321 = 0u;
  v322 = 0u;
  obj = v9;
  v299 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v319, v326, 16);
  if (!v299)
    goto LABEL_50;
  v35 = *(_QWORD *)v320;
  v295 = *MEMORY[0x1E0C947D8];
  v297 = *(_QWORD *)v320;
  do
  {
    for (i = 0; i != v299; ++i)
    {
      if (*(_QWORD *)v320 != v35)
        objc_enumerationMutation(obj);
      v37 = *(void **)(*((_QWORD *)&v319 + 1) + 8 * i);
      v38 = (void *)MEMORY[0x1C3B83E24]();
      if (objc_msgSend_type(v37, v39, v40) == 3)
      {
        objc_msgSend_recordDeletedBlock(v24, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
        {
          objc_msgSend_recordIdentifier(v37, v41, v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v44)
            goto LABEL_48;
          v301 = v38;
          objc_msgSend_translator(v24, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordIdentifier(v37, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anonymousCKUserID(v304, v51, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v318 = v22;
          objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(v47, v54, (uint64_t)v50, v53, &v318);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v318;

          if (v55)
          {
            objc_msgSend_recordDeletedBlock(v24, v57, v58);
            v59 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordType(v37, v60, v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_name(v62, v63, v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, void *))v59)[2](v59, v55, v65);

          }
          else
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v57, v295, 2006, CFSTR("Invalid data received from server"));
            v59 = (void (**)(_QWORD, _QWORD, _QWORD))v56;
            v56 = (id)objc_claimAutoreleasedReturnValue();
          }
          v38 = v301;
          goto LABEL_47;
        }
      }
      objc_msgSend_recordsChangedBlock(v24, v41, v42);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v66)
        goto LABEL_48;
      v302 = v38;
      if (objc_msgSend_hasRecord(v37, v67, v68))
      {
        objc_msgSend_translator(v24, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_record(v37, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anonymousCKUserID(v304, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v317 = v22;
        objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v71, v78, (uint64_t)v74, v77, &v317);
        v59 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v79 = v317;

        if (v59)
        {
          v80 = 1;
          v22 = v79;
        }
        else
        {
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v69, v295, 2006, v79, CFSTR("Invalid data received from server"));
          v22 = (id)objc_claimAutoreleasedReturnValue();

          v80 = 0;
        }
      }
      else
      {
        v59 = 0;
        v80 = 1;
      }
      if (objc_msgSend_hasRecordIdentifier(v37, v69, v70))
      {
        objc_msgSend_translator(v24, v81, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordIdentifier(v37, v84, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anonymousCKUserID(v304, v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v316 = v22;
        objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(v83, v90, (uint64_t)v86, v89, &v316);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v316;

        if (!v55)
        {
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v92, v295, 2006, v91, CFSTR("Invalid data received from server"));
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v24 = self;
          v35 = v297;
          v38 = v302;
LABEL_44:

          v56 = v22;
          goto LABEL_47;
        }
        v22 = v91;
        v24 = self;
      }
      else
      {
        v55 = 0;
      }
      v38 = v302;
      if (v80)
      {
        v93 = [CKDRecordResponse alloc];
        objc_msgSend_etag(v37, v94, v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = (id)objc_msgSend_initWithRecordID_record_etag_(v93, v97, (uint64_t)v55, v59, v96);

        v24 = self;
        objc_msgSend_addObject_(self->_recordResponses, v98, (uint64_t)v91);
        if (v55)
          objc_msgSend_setObject_forKeyedSubscript_(v286, v99, (uint64_t)v91, v55);
        v35 = v297;
        goto LABEL_44;
      }
      v56 = v22;
      v35 = v297;
LABEL_47:

      v22 = v56;
LABEL_48:
      objc_autoreleasePoolPop(v38);
    }
    v299 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v100, (uint64_t)&v319, v326, 16);
  }
  while (v299);
LABEL_50:

  objc_msgSend_recordsChangedBlock(v24, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (v103)
  {
    v315 = 0u;
    v313 = 0u;
    v314 = 0u;
    v312 = 0u;
    v288 = v283;
    v294 = objc_msgSend_countByEnumeratingWithState_objects_count_(v288, v104, (uint64_t)&v312, v325, 16);
    if (!v294)
      goto LABEL_139;
    v293 = *(_QWORD *)v313;
    v291 = *MEMORY[0x1E0C947D8];
    while (1)
    {
      v107 = 0;
      do
      {
        if (*(_QWORD *)v313 != v293)
          objc_enumerationMutation(v288);
        v108 = *(void **)(*((_QWORD *)&v312 + 1) + 8 * v107);
        objc_msgSend_deltas(v108, v105, v106);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v109, v110, v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend_hasEncryptedData(v112, v113, v114) & 1) != 0)
          hasEncryptedAsset = 1;
        else
          hasEncryptedAsset = objc_msgSend_hasEncryptedAsset(v112, v115, v116);
        v303 = MEMORY[0x1C3B83E24]();
        objc_msgSend_translator(v24, v118, v119);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordIdentifier(v108, v121, v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anonymousCKUserID(v304, v124, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v311 = v22;
        objc_msgSend_recordIDFromPRecordIdentifier_asAnonymousCKUserID_error_(v120, v127, (uint64_t)v123, v126, &v311);
        v128 = objc_claimAutoreleasedReturnValue();
        v129 = v311;

        v130 = (void *)v128;
        if (!v128)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v24 = self;
          v203 = (void *)*MEMORY[0x1E0C952E0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
          {
            v238 = v203;
            objc_msgSend_requestUUID(self, v239, v240);
            v241 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v328 = v241;
            v329 = 2112;
            v330 = v108;
            _os_log_error_impl(&dword_1BE990000, v238, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to get record ID for mergeable delta change %@\", buf, 0x16u);

            v24 = self;
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v204, v291, 2006, v129, CFSTR("Failed to parse record ID"));
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v205 = (void *)v303;
          goto LABEL_137;
        }
        objc_msgSend_recordType(v108, v131, v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v133, v134, v135);
        v136 = objc_claimAutoreleasedReturnValue();

        if (!v136)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v24 = self;
          v206 = (void *)*MEMORY[0x1E0C952E0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
          {
            v242 = v206;
            objc_msgSend_requestUUID(self, v243, v244);
            v245 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v328 = v245;
            v329 = 2112;
            v330 = v108;
            _os_log_error_impl(&dword_1BE990000, v242, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to get record type for mergeable delta change %@\", buf, 0x16u);

            v24 = self;
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v207, v291, 2006, v129, CFSTR("Failed to parse record type"));
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v205 = (void *)v303;
          goto LABEL_136;
        }
        objc_msgSend_fieldIdentifier(v108, v137, v138);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v139, v140, v141);
        v142 = objc_claimAutoreleasedReturnValue();

        v292 = v142;
        if (!v142)
        {
          v24 = self;
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v208 = (void *)*MEMORY[0x1E0C952E0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
          {
            v252 = v208;
            objc_msgSend_requestUUID(self, v253, v254);
            v255 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v328 = v255;
            v329 = 2112;
            v330 = v108;
            _os_log_error_impl(&dword_1BE990000, v252, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to get record field key for %@\", buf, 0x16u);

            v24 = self;
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v209, v291, 2006, v129, CFSTR("Failed to get record field key"));
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v205 = (void *)v303;
          goto LABEL_135;
        }
        objc_msgSend_identifier(v108, v143, v144);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_value(v145, v146, v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v148, v149, v150);
        v151 = objc_claimAutoreleasedReturnValue();

        v287 = (void *)v151;
        if (!v151)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v24 = self;
          v210 = (void *)*MEMORY[0x1E0C952E0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
          {
            v256 = v210;
            objc_msgSend_requestUUID(self, v257, v258);
            v259 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v328 = v259;
            v329 = 2112;
            v330 = v108;
            _os_log_error_impl(&dword_1BE990000, v256, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to get location name from mergeable delta change %@\", buf, 0x16u);

            v24 = self;
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v211, v291, 2006, v129, CFSTR("Failed to get mergeable ID from mergeable delta"));
          v22 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_134;
        }
        v152 = objc_alloc(MEMORY[0x1E0C94ED8]);
        v300 = objc_msgSend_initWithName_recordID_key_encrypted_(v152, v153, v151, v130, v292, hasEncryptedAsset);
        if (!v300)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v24 = self;
          v212 = (void *)*MEMORY[0x1E0C952E0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
          {
            v262 = v212;
            objc_msgSend_requestUUID(self, v263, v264);
            v265 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v328 = v265;
            v329 = 2112;
            v330 = v129;
            _os_log_error_impl(&dword_1BE990000, v262, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to get value ID for mergeable delta change: %@\", buf, 0x16u);

            v24 = self;
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v213, v291, 2006, v129, CFSTR("Failed to parse mergeable value ID"));
          v198 = v129;
          v129 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_133;
        }
        v285 = v130;
        v154 = objc_alloc(MEMORY[0x1E0C99DE8]);
        objc_msgSend_deltas(v108, v155, v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = objc_msgSend_count(v157, v158, v159);
        v298 = (void *)objc_msgSend_initWithCapacity_(v154, v161, v160);

        v162 = objc_alloc(MEMORY[0x1E0C99DE8]);
        objc_msgSend_deltas(v108, v163, v164);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = objc_msgSend_count(v165, v166, v167);
        v296 = (void *)objc_msgSend_initWithCapacity_(v162, v169, v168);

        v309 = 0u;
        v310 = 0u;
        v307 = 0u;
        v308 = 0u;
        objc_msgSend_deltas(v108, v170, v171);
        v289 = (id)objc_claimAutoreleasedReturnValue();
        v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v289, v172, (uint64_t)&v307, v324, 16);
        if (!v173)
        {
          v24 = self;
          v198 = v298;
LABEL_118:

          v130 = v285;
          if (!v129)
          {
            v201 = objc_msgSend_count(v198, v217, v218);
            goto LABEL_120;
          }
          goto LABEL_132;
        }
        v176 = v173;
        v284 = v136;
        v177 = *(_QWORD *)v308;
        v24 = self;
        while (2)
        {
          v178 = 0;
          do
          {
            if (*(_QWORD *)v308 != v177)
              objc_enumerationMutation(v289);
            v179 = *(void **)(*((_QWORD *)&v307 + 1) + 8 * v178);
            if (objc_msgSend_hasEncryptedData(v179, v174, v175))
            {
              if ((hasEncryptedAsset & 1) == 0)
                goto LABEL_111;
            }
            else if ((_DWORD)hasEncryptedAsset != objc_msgSend_hasEncryptedAsset(v179, v180, v181))
            {
LABEL_111:
              objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v180, v291, 2006, CFSTR("Expected encrypted=%d on all mergeable deltas for %@"), hasEncryptedAsset, v300);
              v214 = objc_claimAutoreleasedReturnValue();
              v136 = v284;
              v198 = v298;
LABEL_117:

              v129 = (id)v214;
              goto LABEL_118;
            }
            objc_msgSend_translator(v24, v180, v181);
            v182 = (void *)objc_claimAutoreleasedReturnValue();
            v306 = v129;
            objc_msgSend_mergeableDeltaFromPDelta_valueID_error_(v182, v183, (uint64_t)v179, v300, &v306);
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            v185 = v306;

            v186 = *MEMORY[0x1E0C95300];
            if (v184)
              v187 = v185 == 0;
            else
              v187 = 0;
            if (!v187)
            {
              if (v186 != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v24 = self;
              v136 = v284;
              v198 = v298;
              v215 = (void *)*MEMORY[0x1E0C952E0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
              {
                v266 = v215;
                objc_msgSend_requestUUID(self, v267, v268);
                v269 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v328 = v269;
                v329 = 2112;
                v330 = v185;
                _os_log_error_impl(&dword_1BE990000, v266, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Failed to load delta when fetching changes: %@\", buf, 0x16u);

                v24 = self;
              }
              objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v216, v291, 2006, v185, CFSTR("Failed to parse mergeable delta"));
              v214 = objc_claimAutoreleasedReturnValue();

              v129 = v184;
              goto LABEL_117;
            }
            if (v186 != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v188 = (void *)*MEMORY[0x1E0C952E0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
            {
              v194 = v188;
              objc_msgSend_requestUUID(self, v195, v196);
              v197 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v328 = v197;
              v329 = 2112;
              v330 = v184;
              _os_log_debug_impl(&dword_1BE990000, v194, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Received mergeable delta: %@\", buf, 0x16u);

            }
            objc_msgSend_addObject_(v298, v189, (uint64_t)v184);
            objc_msgSend_metadata(v184, v190, v191);
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v296, v193, (uint64_t)v192);

            v129 = 0;
            ++v178;
            v24 = self;
          }
          while (v176 != v178);
          v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v289, v174, (uint64_t)&v307, v324, 16);
          v129 = 0;
          if (v176)
            continue;
          break;
        }

        v136 = v284;
        v130 = v285;
        v198 = v298;
        v201 = objc_msgSend_count(v298, v199, v200);
LABEL_120:
        if (v201)
        {
          objc_msgSend_objectForKeyedSubscript_(v286, v202, (uint64_t)v130);
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v221)
          {
            v222 = objc_alloc(MEMORY[0x1E0C95048]);
            v224 = (void *)objc_msgSend_initWithRecordType_recordID_(v222, v223, v136, v130);
            objc_msgSend_setIsMergeableValueDeltaRecord_(v224, v225, 1);
            v226 = [CKDRecordResponse alloc];
            v221 = (void *)objc_msgSend_initWithRecordID_record_etag_(v226, v227, (uint64_t)v130, v224, 0);
            objc_msgSend_addObject_(self->_recordResponses, v228, (uint64_t)v221);
            objc_msgSend_setObject_forKeyedSubscript_(v286, v229, (uint64_t)v221, v130);

            v24 = self;
          }
          objc_msgSend_record(v221, v219, v220);
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          v233 = v230;
          if ((hasEncryptedAsset & 1) != 0)
          {
            objc_msgSend_encryptedValues(v230, v231, v232);
            v234 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v234, v235, v292);
            v236 = (id)objc_claimAutoreleasedReturnValue();

            v24 = self;
            if (!v236)
              goto LABEL_127;
          }
          else
          {
            objc_msgSend_objectForKeyedSubscript_(v230, v231, v292);
            v236 = (id)objc_claimAutoreleasedReturnValue();
            if (!v236)
            {
LABEL_127:
              v236 = objc_alloc_init(MEMORY[0x1E0C94ED0]);
              objc_msgSend_setValueID_(v236, v246, v300);
              objc_msgSend_setIsValueIDKnownToServer_(v236, v247, 1);
              if ((_DWORD)hasEncryptedAsset)
              {
                objc_msgSend_encryptedValues(v233, v248, v249);
                v250 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v250, v251, (uint64_t)v236, v292);

              }
              else
              {
                objc_msgSend_setObject_forKeyedSubscript_(v233, v248, (uint64_t)v236, v292);
              }
            }
          }
          objc_msgSend_addUnmergedDeltas_(v236, v237, (uint64_t)v298);
          objc_msgSend_addServerDeltaMetadatas_(v236, v260, (uint64_t)v296);
          objc_msgSend_mergeLastKnownServerTimestampVectorFromDeltas_(v236, v261, (uint64_t)v298);

          v198 = v298;
        }
        v129 = 0;
LABEL_132:

LABEL_133:
        v22 = v129;

        v129 = (id)v300;
LABEL_134:
        v205 = (void *)v303;

        v129 = v287;
LABEL_135:

        v129 = (id)v292;
LABEL_136:

        v129 = (id)v136;
LABEL_137:

        objc_autoreleasePoolPop(v205);
        ++v107;
      }
      while (v107 != v294);
      v294 = objc_msgSend_countByEnumeratingWithState_objects_count_(v288, v105, (uint64_t)&v312, v325, 16);
      if (!v294)
      {
LABEL_139:

        break;
      }
    }
  }

  return v22;
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
      _os_log_debug_impl(&dword_1BE990000, v51, OS_LOG_TYPE_DEBUG, "Error fetching changes in zone %{public}@: %{public}@", buf, 0x16u);

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
    objc_msgSend_errorWithDomain_code_userInfo_format_(v22, v32, v23, v24, v25, CFSTR("Error fetching changes in zone %@: %@"), v15, v31);
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

- (void)setRecordZoneIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void)setConfigurationsByRecordZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, a3);
}

- (void)setDesiredAssetKeys:(id)a3
{
  objc_storeStrong((id *)&self->_desiredAssetKeys, a3);
}

- (id)recordDeletedBlock
{
  return self->_recordDeletedBlock;
}

- (id)zoneAttributesChangedBlock
{
  return self->_zoneAttributesChangedBlock;
}

- (void)setZoneAttributesChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void)setZoneIDsByRequestOperationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDsByRequestOperationUUID, a3);
}

- (void)setRequestResultsByRecordZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_requestResultsByRecordZoneID, a3);
}

- (void)setNodeErrorsByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_nodeErrorsByZoneID, a3);
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
