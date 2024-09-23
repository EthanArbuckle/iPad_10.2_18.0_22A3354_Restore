@implementation CKDFetchRecordsURLRequest

- (CKDFetchRecordsURLRequest)initWithOperation:(id)a3 recordIDs:(id)a4 recordIDsToEtags:(id)a5 recordIDsToVersionETags:(id)a6 desiredKeys:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CKDFetchRecordsURLRequest *v17;
  CKDFetchRecordsURLRequest *v18;
  uint64_t v19;
  NSMutableDictionary *recordIDByRequestID;
  const char *v21;
  uint64_t v22;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CKDFetchRecordsURLRequest;
  v17 = -[CKDURLRequest initWithOperation:](&v24, sel_initWithOperation_, v12);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_recordIDs, a4);
    v18->_recordCount = 0;
    objc_storeStrong((id *)&v18->_recordIDsToETags, a5);
    objc_storeStrong((id *)&v18->_recordIDsToVersionETags, a6);
    objc_storeStrong((id *)&v18->_desiredKeys, a7);
    v19 = objc_opt_new();
    recordIDByRequestID = v18->_recordIDByRequestID;
    v18->_recordIDByRequestID = (NSMutableDictionary *)v19;

    v18->_shouldFetchAssetContent = 1;
    v18->_shouldRequestEncryptedAssetOwnerIdentifier = objc_msgSend_shouldRequestEncryptedAssetOwnerIdentifier(v12, v21, v22);
  }

  return v18;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKDFetchRecordsURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v15, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_recordIDs(self, v6, v7, v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, CFSTR("recordIDs"));
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
  objc_msgSend_recordIDs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFetchRecordIDs_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchRecordsURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v9, sel_fillOutRequestProperties_, v4);

}

- (BOOL)allowsAnonymousAccount
{
  uint64_t v2;

  return objc_msgSend_databaseScope(self, a2, v2) == 1;
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
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend_recordIDs(self, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v20, v24, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v6);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v13), v9, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend_addObject_(v3, v14, (uint64_t)v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v20, v24, 16);
    }
    while (v11);
  }

  objc_msgSend_allObjects(v3, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
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

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (id)generateRequestOperations
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
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
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
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
  uint64_t v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i;
  uint64_t v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  const char *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t j;
  uint64_t v118;
  void *v119;
  const char *v120;
  const char *v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  unsigned int v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t k;
  uint64_t v184;
  void *v185;
  const char *v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  const char *v197;
  const char *v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  const char *v204;
  uint64_t v205;
  uint64_t AssetContent;
  const char *v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  id v223;
  void *v224;
  void *v225;
  const char *v226;
  void *v227;
  const char *v228;
  const char *v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  const char *v237;
  void *v238;
  void *v239;
  const char *v240;
  void *v242;
  id obj;
  uint64_t v244;
  uint64_t v245;
  CKDFetchRecordsURLRequest *v246;
  uint64_t v247;
  uint64_t v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  _QWORD v257[4];
  id v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  _BYTE v267[128];
  _BYTE v268[128];
  _BYTE v269[128];
  _BYTE v270[128];
  uint64_t v271;

  v271 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v263 = 0u;
  v264 = 0u;
  v265 = 0u;
  v266 = 0u;
  objc_msgSend_recordIDs(self, v4, v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v245 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v263, v270, 16);
  if (v245)
  {
    v244 = *(_QWORD *)v264;
    v246 = self;
    v242 = v3;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v264 != v244)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v263 + 1) + 8 * v9);
      v11 = objc_msgSend_operationType(self, v7, v8);
      objc_msgSend_operationRequestWithType_(self, v12, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_requiresCKAnonymousUserIDs(self, v14, v15))
      {
        objc_msgSend_zoneID(v10, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anonymousCKUserID(v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          v224 = v3;
          v225 = (void *)objc_opt_new();
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v226, (uint64_t)CFSTR("An anonymousCKUserID is required to fetch %@ in the shared database when using anonymous to server share participants"), v10);
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v225, v228, (uint64_t)v227, *MEMORY[0x1E0CB2D50]);
          objc_msgSend_operation(self, v229, v230);
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_topmostParentOperation(v231, v232, v233);
          v234 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_operationID(v234, v235, v236);
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          if (v238)
            objc_msgSend_setObject_forKeyedSubscript_(v225, v237, (uint64_t)v238, *MEMORY[0x1E0C947F8]);
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v237, *MEMORY[0x1E0C94B20], 5015, v225);
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_finishWithError_(self, v240, (uint64_t)v239);

          v223 = 0;
          v3 = v224;
          goto LABEL_55;
        }
        objc_msgSend_zoneID(v10, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anonymousCKUserID(v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKDPIdentifier_User(v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v13, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAnonymousCKUserID_(v33, v34, (uint64_t)v30);

      }
      v248 = v9;
      v35 = (void *)objc_opt_new();
      objc_msgSend_setRecordRetrieveRequest_(v13, v36, (uint64_t)v35);

      objc_msgSend_translator(self, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pRecordIdentifierFromRecordID_(v39, v40, (uint64_t)v10);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordRetrieveRequest(v13, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRecordIdentifier_(v44, v45, (uint64_t)v41);

      objc_msgSend_recordIDsToVersionETags(self, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v48, v49, (uint64_t)v10);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordRetrieveRequest(v13, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setVersionETag_(v53, v54, (uint64_t)v50);

      objc_msgSend_recordIDsToETags(self, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v247 = (uint64_t)v10;
      objc_msgSend_objectForKeyedSubscript_(v57, v58, (uint64_t)v10);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordRetrieveRequest(v13, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setClientVersionETag_(v62, v63, (uint64_t)v59);

      objc_msgSend_desiredKeys(self, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        v69 = (void *)objc_opt_new();
        objc_msgSend_recordRetrieveRequest(v13, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRequestedFields_(v72, v73, (uint64_t)v69);

        v261 = 0u;
        v262 = 0u;
        v259 = 0u;
        v260 = 0u;
        objc_msgSend_desiredKeys(self, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v77, (uint64_t)&v259, v269, 16);
        if (v78)
        {
          v79 = v78;
          v80 = *(_QWORD *)v260;
          do
          {
            for (i = 0; i != v79; ++i)
            {
              if (*(_QWORD *)v260 != v80)
                objc_enumerationMutation(v76);
              v82 = *(_QWORD *)(*((_QWORD *)&v259 + 1) + 8 * i);
              v83 = (void *)objc_opt_new();
              objc_msgSend_setName_(v83, v84, v82);
              objc_msgSend_recordRetrieveRequest(v13, v85, v86);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_requestedFields(v87, v88, v89);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addFields_(v90, v91, (uint64_t)v83);

            }
            v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v92, (uint64_t)&v259, v269, 16);
          }
          while (v79);
        }

        self = v246;
      }
      objc_msgSend_desiredIndexedListKeys(self, v67, v68);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend_count(v93, v94, v95);

      if (v96)
      {
        objc_msgSend_requestedListFieldsForDesiredIndexedListKeys(self, v97, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v257[0] = MEMORY[0x1E0C809B0];
        v257[1] = 3221225472;
        v257[2] = sub_1BEC52260;
        v257[3] = &unk_1E7838540;
        v258 = v13;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v99, v100, (uint64_t)v257);

      }
      objc_msgSend_assetFieldNamesToPublishURLs(self, v97, v98);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      if (v101)
      {
        v104 = (void *)objc_opt_new();
        objc_msgSend_recordRetrieveRequest(v13, v105, v106);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setGetAssetURL_(v107, v108, (uint64_t)v104);

        v109 = (void *)objc_opt_new();
        v253 = 0u;
        v254 = 0u;
        v255 = 0u;
        v256 = 0u;
        objc_msgSend_assetFieldNamesToPublishURLs(self, v110, v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v113, (uint64_t)&v253, v268, 16);
        if (v114)
        {
          v115 = v114;
          v116 = *(_QWORD *)v254;
          do
          {
            for (j = 0; j != v115; ++j)
            {
              if (*(_QWORD *)v254 != v116)
                objc_enumerationMutation(v112);
              v118 = *(_QWORD *)(*((_QWORD *)&v253 + 1) + 8 * j);
              v119 = (void *)objc_opt_new();
              objc_msgSend_setName_(v119, v120, v118);
              objc_msgSend_addFields_(v109, v121, (uint64_t)v119);

            }
            v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v122, (uint64_t)&v253, v268, 16);
          }
          while (v115);
        }

        objc_msgSend_recordRetrieveRequest(v13, v123, v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_getAssetURL(v125, v126, v127);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAssetFields_(v128, v129, (uint64_t)v109);

        self = v246;
        v132 = objc_msgSend_requestedTTL(v246, v130, v131);
        objc_msgSend_recordRetrieveRequest(v13, v133, v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_getAssetURL(v135, v136, v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRequestedTTL_(v138, v139, v132);

        if (objc_msgSend_shouldRequestEncryptedAssetOwnerIdentifier(v246, v140, v141))
        {
          objc_msgSend_recordRetrieveRequest(v13, v142, v143);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRequestEncryptedAssetOwnerIdentifier_(v144, v145, 1);

        }
        if ((objc_msgSend_URLOptions(v246, v142, v143) & 1) != 0)
          v148 = 2;
        else
          v148 = 1;
        if ((objc_msgSend_URLOptions(v246, v146, v147) & 2) != 0)
          v151 = 4;
        else
          v151 = v148;
        objc_msgSend_recordRetrieveRequest(v13, v149, v150);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_getAssetURL(v152, v153, v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setType_(v155, v156, v151);

      }
      objc_msgSend_desiredAssetKeys(self, v102, v103);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = objc_msgSend_count(v157, v158, v159);

      if (v160)
        break;
      if (objc_msgSend_shouldFetchAssetContent(self, v161, v162))
      {
        v199 = (void *)objc_opt_new();
        objc_msgSend_recordRetrieveRequest(v13, v200, v201);
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAssetsToDownload_(v202, v203, (uint64_t)v199);

        AssetContent = objc_msgSend_shouldFetchAssetContent(self, v204, v205);
        objc_msgSend_recordRetrieveRequest(v13, v207, v208);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_assetsToDownload(v178, v209, v210);
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAllAssets_(v211, v212, AssetContent);

LABEL_48:
      }
      objc_msgSend_addObject_(v3, v198, (uint64_t)v13);
      objc_msgSend_recordIDByRequestID(self, v213, v214);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_request(v13, v216, v217);
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationUUID(v218, v219, v220);
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v215, v222, v247, v221);

      v9 = v248 + 1;
      if (v248 + 1 == v245)
      {
        v245 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v263, v270, 16);
        if (v245)
          goto LABEL_3;
        goto LABEL_51;
      }
    }
    v163 = (void *)objc_opt_new();
    objc_msgSend_recordRetrieveRequest(v13, v164, v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAssetsToDownload_(v166, v167, (uint64_t)v163);

    v168 = (void *)objc_opt_new();
    objc_msgSend_recordRetrieveRequest(v13, v169, v170);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetsToDownload(v171, v172, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAssetFields_(v174, v175, (uint64_t)v168);

    v251 = 0u;
    v252 = 0u;
    v249 = 0u;
    v250 = 0u;
    objc_msgSend_desiredAssetKeys(self, v176, v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v179, (uint64_t)&v249, v267, 16);
    if (v180)
    {
      v181 = v180;
      v182 = *(_QWORD *)v250;
      do
      {
        for (k = 0; k != v181; ++k)
        {
          if (*(_QWORD *)v250 != v182)
            objc_enumerationMutation(v178);
          v184 = *(_QWORD *)(*((_QWORD *)&v249 + 1) + 8 * k);
          v185 = (void *)objc_opt_new();
          objc_msgSend_setName_(v185, v186, v184);
          objc_msgSend_recordRetrieveRequest(v13, v187, v188);
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_assetsToDownload(v189, v190, v191);
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_assetFields(v192, v193, v194);
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addFields_(v195, v196, (uint64_t)v185);

        }
        v181 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v197, (uint64_t)&v249, v267, 16);
      }
      while (v181);
      v3 = v242;
      self = v246;
    }
    goto LABEL_48;
  }
LABEL_51:

  v223 = v3;
LABEL_55:

  return v223;
}

- (id)requestedListFieldsForDesiredIndexedListKeys
{
  uint64_t v2;
  CKDFetchRecordsURLRequest *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  void *v35;
  CKDFetchRecordsURLRequest *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v4 = self;
  v45 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend_desiredIndexedListKeys(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v38, v44, 16);
  if (v7)
  {
    v8 = v7;
    v37 = 0;
    v9 = *(_QWORD *)v39;
    v35 = v5;
    v36 = v4;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v10);
        CKProcessIndexedArrayKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        v15 = v13;
        if (v12)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v16 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v43 = v11;
            _os_log_error_impl(&dword_1BE990000, v16, OS_LOG_TYPE_ERROR, "Invalid desired key %{public}@, which should have been caught earlier", buf, 0xCu);
          }
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, v4, CFSTR("CKDFetchRecordsURLRequest.m"), 193, CFSTR("Invalid desired key %@, which should have been caught earlier"), v11);
        }
        else if (v13)
        {
          v21 = v37;
          objc_msgSend_objectForKeyedSubscript_(v37, v14, (uint64_t)v13);
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v19 = (id)v22;
          }
          else
          {
            v27 = (void *)objc_opt_new();
            objc_msgSend_setName_(v27, v28, (uint64_t)v15);
            v29 = (void *)objc_opt_new();
            objc_msgSend_setFieldId_(v29, v30, (uint64_t)v27);
            v19 = v29;
            if (!v37)
            {
              objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v31, v32);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend_setObject_forKeyedSubscript_(v21, v31, (uint64_t)v19, v15);

          }
          v37 = v21;
          v5 = v35;
          v4 = v36;
        }
        else
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v23 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v43 = v11;
            _os_log_error_impl(&dword_1BE990000, v23, OS_LOG_TYPE_ERROR, "Non-indexed desired key %{public}@, which should have been caught earlier", buf, 0xCu);
          }
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v24, v25);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v26, (uint64_t)a2, v4, CFSTR("CKDFetchRecordsURLRequest.m"), 196, CFSTR("Non-indexed desired key %@, which should have been caught earlier"), v11);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v33, (uint64_t)&v38, v44, 16);
    }
    while (v8);
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  unsigned int v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  id v46;
  void *v47;
  const char *v48;
  uint64_t v49;
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
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  char isEqual;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  const char *v113;
  int isEqualToString;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  int v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  void *v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  void (**v154)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  const char *v159;
  id v160;
  NSObject *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  NSObject *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  void *v176;
  const char *v177;
  int v178;
  int v179;
  int v180;
  void *v181;
  void *v182;
  id v183;
  unsigned int v184;
  id v185;
  uint8_t buf[4];
  void *v187;
  __int16 v188;
  void *v189;
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_recordIDByRequestID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v176, v177, (uint64_t)a2, self, CFSTR("CKDFetchRecordsURLRequest.m"), 253, CFSTR("Expected non-nil recordID for %@"), v5);

  }
  if (!objc_msgSend_hasRecordRetrieveResponse(v5, v17, v18))
  {
LABEL_24:
    v107 = 0;
    v45 = 0;
    v47 = 0;
    goto LABEL_25;
  }
  objc_msgSend_recordRetrieveResponse(v5, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_clientVersionETagMatch(v21, v22, v23);

  objc_msgSend_recordRetrieveResponse(v5, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_record(v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    if ((v24 & 1) != 0)
    {
      v45 = 0;
      v47 = 0;
      v107 = 1;
      goto LABEL_25;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v150 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
    {
      v172 = v150;
      objc_msgSend_requestUUID(self, v173, v174);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v187 = v175;
      v188 = 2114;
      v189 = v16;
      _os_log_error_impl(&dword_1BE990000, v172, OS_LOG_TYPE_ERROR, "req: %{public}@, \"The response for recordID %{public}@ doesn't contain the record\", buf, 0x16u);

    }
    goto LABEL_24;
  }
  v184 = v24;
  objc_msgSend_translator(self, v19, v20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordRetrieveResponse(v5, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_record(v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v16, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anonymousCKUserID(v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = 0;
  objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v31, v44, (uint64_t)v37, v43, &v185);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v185;

  v47 = v46;
  if (!v45 && v46)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v50 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v162 = v50;
      objc_msgSend_result(v5, v163, v164);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v5, v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v168, v169, v170);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v187 = v165;
      v188 = 2114;
      v189 = v171;
      _os_log_error_impl(&dword_1BE990000, v162, OS_LOG_TYPE_ERROR, "Invalid data in server protobuf, ignoring response. Server response was: %@, error: %{public}@", buf, 0x16u);

    }
    objc_msgSend_result(v5, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCode_(v53, v54, 3);

    v55 = (void *)objc_opt_new();
    objc_msgSend_result(v5, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(v58, v59, (uint64_t)v55);

    v60 = (void *)objc_opt_new();
    objc_msgSend_result(v5, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClientError_(v66, v67, (uint64_t)v60);

    objc_msgSend_result(v5, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientError(v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setType_(v76, v77, 7);

    objc_msgSend_result(v5, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorKey_(v83, v84, (uint64_t)CFSTR("Invalid record"));

    v85 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_localizedDescription(v46, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v85, v89, (uint64_t)CFSTR("Failed to read server response: %@"), v88);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v93, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setErrorDescription_(v96, v97, (uint64_t)v90);

  }
  objc_msgSend_recordID(v45, v48, v49);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v16, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v101, v105, (uint64_t)v104);

  if ((isEqual & 1) != 0)
  {
    v107 = v184;
    goto LABEL_25;
  }
  v183 = v46;
  objc_msgSend_zoneID(v16, v19, v20);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerName(v108, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = *MEMORY[0x1E0C94730];
  isEqualToString = objc_msgSend_isEqualToString_(v111, v113, *MEMORY[0x1E0C94730]);

  objc_msgSend_recordID(v45, v115, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v117, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerName(v120, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend_isEqualToString_(v123, v124, v112);

  objc_msgSend_recordID(v45, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v128, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v16, v132, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v131, v135, (uint64_t)v134) & 1) == 0)
  {

    goto LABEL_29;
  }
  v178 = v125;
  v179 = isEqualToString;
  objc_msgSend_recordID(v45, v136, v137);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v182, v138, v139);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v181, v140, v141);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v16, v143, v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v145, v146, v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = objc_msgSend_isEqualToString_(v142, v149, (uint64_t)v148);

  if (!v180)
  {
LABEL_29:
    v107 = v184;
    v47 = v183;
    goto LABEL_25;
  }
  v107 = v184;
  v47 = v183;
  if (v179 != v178)
    objc_msgSend_setRecordID_(v45, v19, (uint64_t)v16);
LABEL_25:
  objc_msgSend_recordFetchedBlock(self, v19, v20);
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  if (v151)
  {
    objc_msgSend_recordFetchedBlock(self, v152, v153);
    v154 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v155, v156);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, uint64_t, void *))v154)[2](v154, v45, v16, v107, v157);

  }
  v158 = objc_msgSend_recordCount(self, v152, v153);
  objc_msgSend_setRecordCount_(self, v159, v158 + 1);
  v160 = v47;

  return v160;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
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
  uint64_t v47;
  int v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  id v61;

  v61 = a3;
  objc_msgSend_response(v61, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

LABEL_6:
    objc_msgSend_result(v61, v22, v23);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_hasClientError(v34, v35, v36) & 1) != 0)
    {
      objc_msgSend_result(v61, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clientError(v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_type(v45, v46, v47);

      if (v48 == 4)
      {
        v51 = (void *)MEMORY[0x1E0CB35C8];
        v52 = *MEMORY[0x1E0C94B20];
        objc_msgSend_result(v61, v49, v50);
        v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        sub_1BEB10290(self, v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v51, v53, v52, 2006, v30);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_finishWithError_(self, v55, (uint64_t)v54);

LABEL_12:
        v21 = 0;
        goto LABEL_13;
      }
    }
    else
    {

    }
    objc_msgSend_recordFetchedBlock(self, v49, v50);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v56)
    {
      v21 = 0;
      goto LABEL_15;
    }
    objc_msgSend_recordFetchedBlock(self, v57, v58);
    v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v61, v59, v60);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *))v27)[2](v27, 0, 0, 0, v30);
    goto LABEL_12;
  }
  v12 = (void *)v9;
  objc_msgSend_recordIDByRequestID(self, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v61, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v13, v20, (uint64_t)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    goto LABEL_6;
  objc_msgSend_recordFetchedBlock(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_recordFetchedBlock(self, v25, v26);
    v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v61, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *, _QWORD, void *))v27)[2](v27, 0, v21, 0, v30);
LABEL_13:

  }
LABEL_15:

}

- (NSSet)assetFieldNamesToPublishURLs
{
  return self->_assetFieldNamesToPublishURLs;
}

- (void)setAssetFieldNamesToPublishURLs:(id)a3
{
  objc_storeStrong((id *)&self->_assetFieldNamesToPublishURLs, a3);
}

- (unint64_t)requestedTTL
{
  return self->_requestedTTL;
}

- (void)setRequestedTTL:(unint64_t)a3
{
  self->_requestedTTL = a3;
}

- (unint64_t)URLOptions
{
  return self->_URLOptions;
}

- (void)setURLOptions:(unint64_t)a3
{
  self->_URLOptions = a3;
}

- (NSSet)desiredAssetKeys
{
  return self->_desiredAssetKeys;
}

- (void)setDesiredAssetKeys:(id)a3
{
  objc_storeStrong((id *)&self->_desiredAssetKeys, a3);
}

- (NSArray)desiredIndexedListKeys
{
  return self->_desiredIndexedListKeys;
}

- (void)setDesiredIndexedListKeys:(id)a3
{
  objc_storeStrong((id *)&self->_desiredIndexedListKeys, a3);
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (BOOL)shouldRequestEncryptedAssetOwnerIdentifier
{
  return self->_shouldRequestEncryptedAssetOwnerIdentifier;
}

- (void)setShouldRequestEncryptedAssetOwnerIdentifier:(BOOL)a3
{
  self->_shouldRequestEncryptedAssetOwnerIdentifier = a3;
}

- (id)recordFetchedBlock
{
  return self->_recordFetchedBlock;
}

- (void)setRecordFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDs, a3);
}

- (NSDictionary)recordIDsToETags
{
  return self->_recordIDsToETags;
}

- (void)setRecordIDsToETags:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToETags, a3);
}

- (NSDictionary)recordIDsToVersionETags
{
  return self->_recordIDsToVersionETags;
}

- (void)setRecordIDsToVersionETags:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToVersionETags, a3);
}

- (unint64_t)recordCount
{
  return self->_recordCount;
}

- (void)setRecordCount:(unint64_t)a3
{
  self->_recordCount = a3;
}

- (NSMutableDictionary)recordIDByRequestID
{
  return self->_recordIDByRequestID;
}

- (void)setRecordIDByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDByRequestID, a3);
}

- (NSSet)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_desiredKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDByRequestID, 0);
  objc_storeStrong((id *)&self->_recordIDsToVersionETags, 0);
  objc_storeStrong((id *)&self->_recordIDsToETags, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong(&self->_recordFetchedBlock, 0);
  objc_storeStrong((id *)&self->_desiredIndexedListKeys, 0);
  objc_storeStrong((id *)&self->_desiredAssetKeys, 0);
  objc_storeStrong((id *)&self->_assetFieldNamesToPublishURLs, 0);
}

@end
