@implementation CKDFetchContentAuthTokensForPutURLRequest

- (CKDFetchContentAuthTokensForPutURLRequest)initWithOperation:(id)a3 assetTokenRequest:(id)a4 headers:(id)a5
{
  id v9;
  id v10;
  CKDFetchContentAuthTokensForPutURLRequest *v11;
  CKDFetchContentAuthTokensForPutURLRequest *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKDFetchContentAuthTokensForPutURLRequest;
  v11 = -[CKDURLRequest initWithOperation:](&v14, sel_initWithOperation_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetTokenRequest, a4);
    objc_storeStrong((id *)&v12->_headers, a5);
  }

  return v12;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDFetchContentAuthTokensForPutURLRequest;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v3, sel_fillOutEquivalencyPropertiesBuilder_, a3);
}

- (void)fillOutRequestProperties:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDFetchContentAuthTokensForPutURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v3, sel_fillOutRequestProperties_, a3);
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

- (BOOL)allowsAnonymousAccount
{
  uint64_t v2;

  return objc_msgSend_databaseScope(self, a2, v2) == 1;
}

- (id)generateRequestOperations
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  id v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  const char *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t i;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  CKDAssetID *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  void *v118;
  const char *v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  CKDAssetID *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  void *v144;
  const char *v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  const char *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  const char *v163;
  const char *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  void *v169;
  void *v170;
  const char *v171;
  const char *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  NSDictionary *headers;
  id v191;
  const char *v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  const char *v203;
  const char *v204;
  void *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  id v210;
  CKDFetchContentAuthTokensForPutURLRequest *v211;
  id obj;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  void *v216;
  uint64_t v217;
  id v218;
  void *v219;
  uint64_t v220;
  void *v221;
  uint64_t v222;
  void *v223;
  uint64_t v224;
  void *v225;
  id v226;
  uint64_t v227;
  void *v228;
  void *v229;
  uint64_t v230;
  void *v231;
  _QWORD v232[4];
  id v233;
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
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  _BYTE v253[128];
  uint64_t v254;

  v254 = *MEMORY[0x1E0C80C00];
  objc_msgSend_translator(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransactionStateByRequestIDs_(self, v8, (uint64_t)v7);

  v210 = (id)objc_opt_new();
  v211 = self;
  v246 = 0u;
  v247 = 0u;
  v248 = 0u;
  v249 = 0u;
  objc_msgSend_successfulBatches(self->_assetTokenRequest, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v246, v253, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v247;
    v225 = v4;
    v206 = v11;
    v208 = *(_QWORD *)v247;
    do
    {
      v15 = 0;
      v207 = v13;
      do
      {
        if (*(_QWORD *)v247 != v14)
        {
          v16 = v15;
          objc_enumerationMutation(v11);
          v15 = v16;
        }
        v209 = v15;
        v17 = *(void **)(*((_QWORD *)&v246 + 1) + 8 * v15);
        v231 = (void *)objc_opt_new();
        objc_msgSend_setAssetBatch_(v231, v18, (uint64_t)v17);
        v215 = (void *)objc_opt_new();
        v242 = 0u;
        v243 = 0u;
        v244 = 0u;
        v245 = 0u;
        objc_msgSend_assetRecords(v17, v19, v20);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v213 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v242, v252, 16);
        if (v213)
        {
          v214 = *(_QWORD *)v243;
          v219 = v17;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v243 != v214)
                objc_enumerationMutation(obj);
              v217 = v22;
              v23 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * v22);
              v24 = (void *)objc_opt_new();
              objc_msgSend_recordID(v23, v25, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_pRecordIdentifierFromRecordID_(v4, v28, (uint64_t)v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setRecordId_(v24, v30, (uint64_t)v29);

              v31 = (void *)objc_opt_new();
              objc_msgSend_recordType(v23, v32, v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setName_(v31, v35, (uint64_t)v34);

              v216 = v31;
              objc_msgSend_setType_(v24, v36, (uint64_t)v31);
              v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v221 = v24;
              objc_msgSend_setAssetFields_(v24, v38, (uint64_t)v37);

              v228 = v23;
              objc_msgSend_allRecordKeys(v23, v39, v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v238 = 0u;
              v239 = 0u;
              v240 = 0u;
              v241 = 0u;
              v218 = v41;
              v222 = objc_msgSend_countByEnumeratingWithState_objects_count_(v218, v42, (uint64_t)&v238, v251, 16);
              if (v222)
              {
                v220 = *(_QWORD *)v239;
                do
                {
                  v44 = 0;
                  do
                  {
                    if (*(_QWORD *)v239 != v220)
                      objc_enumerationMutation(v218);
                    v45 = *(_QWORD *)(*((_QWORD *)&v238 + 1) + 8 * v44);
                    objc_msgSend_allRegularAndSectionAndRereferenceItemsWithRecordKey_(v228, v43, v45);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!objc_msgSend_count(v46, v47, v48))
                      __assert_rtn("-[CKDFetchContentAuthTokensForPutURLRequest generateRequestOperations]", "CKDFetchContentAuthTokensForPutURLRequest.m", 96, "items.count");
                    v224 = v44;
                    v49 = (void *)objc_opt_new();
                    v50 = (void *)objc_opt_new();
                    objc_msgSend_setName_(v50, v51, v45);
                    v223 = v50;
                    objc_msgSend_setField_(v49, v52, (uint64_t)v50);
                    v53 = objc_alloc(MEMORY[0x1E0C99DE8]);
                    v56 = objc_msgSend_count(v46, v54, v55);
                    v58 = (void *)objc_msgSend_initWithCapacity_(v53, v57, v56);
                    v229 = v49;
                    objc_msgSend_setAssets_(v49, v59, (uint64_t)v58);

                    v236 = 0u;
                    v237 = 0u;
                    v234 = 0u;
                    v235 = 0u;
                    v226 = v46;
                    v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(v226, v60, (uint64_t)&v234, v250, 16);
                    if (v230)
                    {
                      v227 = *(_QWORD *)v235;
                      do
                      {
                        for (i = 0; i != v230; ++i)
                        {
                          if (*(_QWORD *)v235 != v227)
                            objc_enumerationMutation(v226);
                          v62 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * i);
                          v63 = (void *)objc_opt_new();
                          objc_msgSend_recordID(v228, v64, v65);
                          v66 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_pRecordIdentifierFromRecordID_(v4, v67, (uint64_t)v66);
                          v68 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_setRecordId_(v63, v69, (uint64_t)v68);

                          objc_msgSend_signature(v62, v70, v71);
                          v72 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_setSignature_(v63, v73, (uint64_t)v72);

                          v77 = objc_msgSend_paddedFileSize(v62, v74, v75);
                          if (!v77)
                            v77 = objc_msgSend_fileSize(v62, v76, 0);
                          objc_msgSend_setSize_(v63, v76, v77);
                          objc_msgSend_referenceSignature(v62, v78, v79);
                          v80 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_setReferenceSignature_(v63, v81, (uint64_t)v80);

                          objc_msgSend_wrappedAssetKey(v62, v82, v83);
                          v84 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v84)
                          {
                            v87 = (void *)objc_opt_new();
                            objc_msgSend_setProtectionInfo_(v63, v88, (uint64_t)v87);

                            objc_msgSend_wrappedAssetKey(v62, v89, v90);
                            v91 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_protectionInfo(v63, v92, v93);
                            v94 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_setProtectionInfo_(v94, v95, (uint64_t)v91);

                          }
                          objc_msgSend_clearAssetKey(v62, v85, v86);
                          v96 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v96)
                          {
                            objc_msgSend_clearAssetKey(v62, v97, v98);
                            v99 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_setClearAssetKey_(v63, v100, (uint64_t)v99);

                          }
                          objc_msgSend_assets(v229, v97, v98);
                          v101 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_addObject_(v101, v102, (uint64_t)v63);

                          v103 = [CKDAssetID alloc];
                          objc_msgSend_recordId(v63, v104, v105);
                          v106 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_signature(v63, v107, v108);
                          v109 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_referenceSignature(v63, v110, v111);
                          v112 = (void *)objc_claimAutoreleasedReturnValue();
                          v113 = (void *)MEMORY[0x1E0CB37E8];
                          v116 = objc_msgSend_size(v63, v114, v115);
                          objc_msgSend_numberWithLongLong_(v113, v117, v116);
                          v118 = (void *)objc_claimAutoreleasedReturnValue();
                          v120 = (void *)objc_msgSend_initWithRecordID_fileSignature_referenceSignature_size_(v103, v119, (uint64_t)v106, v109, v112, v118);

                          objc_msgSend_itemsByAssetId(v231, v121, v122);
                          v123 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_objectForKeyedSubscript_(v123, v124, (uint64_t)v120);
                          v125 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v125)
                          {
                            objc_msgSend_set(MEMORY[0x1E0C99E20], v126, v127);
                            v125 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_itemsByAssetId(v231, v128, v129);
                            v130 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_setObject_forKeyedSubscript_(v130, v131, (uint64_t)v125, v120);

                          }
                          objc_msgSend_addObject_(v125, v126, (uint64_t)v62);
                          if (_os_feature_enabled_impl())
                          {
                            v132 = [CKDAssetID alloc];
                            objc_msgSend_recordId(v63, v133, v134);
                            v135 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_signature(v63, v136, v137);
                            v138 = (void *)objc_claimAutoreleasedReturnValue();
                            v139 = (void *)MEMORY[0x1E0CB37E8];
                            v142 = objc_msgSend_size(v63, v140, v141);
                            objc_msgSend_numberWithLongLong_(v139, v143, v142);
                            v144 = (void *)objc_claimAutoreleasedReturnValue();
                            v146 = (void *)objc_msgSend_initWithRecordID_fileSignature_referenceSignature_size_(v132, v145, (uint64_t)v135, v138, 0, v144);

                            objc_msgSend_itemsByAssetIdIgnoreRefSignature(v231, v147, v148);
                            v149 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_objectForKeyedSubscript_(v149, v150, (uint64_t)v146);
                            v151 = (void *)objc_claimAutoreleasedReturnValue();

                            if (!v151)
                            {
                              objc_msgSend_set(MEMORY[0x1E0C99E20], v152, v153);
                              v151 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_itemsByAssetIdIgnoreRefSignature(v231, v154, v155);
                              v156 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_setObject_forKeyedSubscript_(v156, v157, (uint64_t)v151, v146);

                            }
                            objc_msgSend_addObject_(v151, v152, (uint64_t)v62);

                            v4 = v225;
                          }

                        }
                        v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(v226, v158, (uint64_t)&v234, v250, 16);
                      }
                      while (v230);
                    }

                    objc_msgSend_assetFields(v221, v159, v160);
                    v161 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_addObject_(v161, v162, (uint64_t)v229);

                    v44 = v224 + 1;
                    v17 = v219;
                  }
                  while (v224 + 1 != v222);
                  v222 = objc_msgSend_countByEnumeratingWithState_objects_count_(v218, v43, (uint64_t)&v238, v251, 16);
                }
                while (v222);
              }

              objc_msgSend_addObject_(v215, v163, (uint64_t)v221);
              v22 = v217 + 1;
            }
            while (v217 + 1 != v213);
            v213 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v164, (uint64_t)&v242, v252, 16);
          }
          while (v213);
        }

        v167 = objc_msgSend_operationType(v211, v165, v166);
        objc_msgSend_operationRequestWithType_(v211, v168, v167);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        v170 = (void *)objc_opt_new();
        objc_msgSend_setAssetUploadTokenRetrieveRequest_(v169, v171, (uint64_t)v170);
        objc_msgSend_setUploads_(v170, v172, (uint64_t)v215);
        objc_msgSend_authPutRequest(v17, v173, v174);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAuthPutRequest_(v170, v176, (uint64_t)v175);

        if (_os_feature_enabled_impl())
          objc_msgSend_setOptions_(v170, v177, 1);
        objc_msgSend_assetZone(v17, v177, v178);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_assetZoneKey(v179, v180, v181);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        v185 = objc_msgSend_authPutType(v182, v183, v184);

        if ((_DWORD)v185 != 3 || (objc_msgSend_useMMCSEncryptionV2(v17, v186, v187) & 1) == 0)
        {
          objc_msgSend_authPutRequest(v17, v186, v187);
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAuthPutRequest_(v170, v189, (uint64_t)v188);

        }
        objc_msgSend_setAuthPutType_(v170, v186, v185);
        headers = v211->_headers;
        v232[0] = MEMORY[0x1E0C809B0];
        v232[1] = 3221225472;
        v232[2] = sub_1BEA8F8AC;
        v232[3] = &unk_1E7831058;
        v233 = v170;
        v191 = v170;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(headers, v192, (uint64_t)v232);
        objc_msgSend_transactionStateByRequestIDs(v211, v193, v194);
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v169, v196, v197);
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationUUID(v198, v199, v200);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v195, v202, (uint64_t)v231, v201);

        objc_msgSend_addObject_(v210, v203, (uint64_t)v169);
        v14 = v208;
        v15 = v209 + 1;
        v11 = v206;
      }
      while (v209 + 1 != v207);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v206, v204, (uint64_t)&v246, v253, 16);
      v14 = v208;
    }
    while (v13);
  }

  return v210;
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
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  dispatch_once_t *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  BOOL v51;
  void *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  char isRereferenceAssetBatch;
  NSObject *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  id v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  void *v137;
  const char *v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  CKDAssetID *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  void *v172;
  const char *v173;
  id v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  void *v179;
  void *v180;
  NSObject *v181;
  const char *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  CKDWrappingContext *v194;
  const char *v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  void *v207;
  const char *v208;
  const char *v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  const char *v234;
  const char *v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  const char *v239;
  const char *v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  const char *v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  const char *v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  const char *v262;
  uint64_t v263;
  void *v264;
  void *v265;
  const char *v266;
  const char *v267;
  void *v268;
  NSObject *v269;
  const char *v270;
  uint64_t v271;
  CKDAssetID *v272;
  const char *v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  void *v286;
  const char *v287;
  uint64_t v288;
  void *v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  void *v298;
  const char *v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  void *v305;
  const char *v306;
  uint64_t v307;
  void *v308;
  const char *v309;
  uint64_t v310;
  void *v311;
  const char *v312;
  uint64_t v313;
  void *v314;
  const char *v315;
  void *v316;
  const char *v317;
  CKDAssetID *v318;
  const char *v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  void *v323;
  const char *v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  void *v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  const char *v337;
  void *v338;
  const char *v339;
  void *v340;
  const char *v341;
  uint64_t v342;
  void *v343;
  const char *v344;
  const char *v345;
  uint64_t v346;
  dispatch_once_t *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  void *v351;
  void *v352;
  const char *v353;
  const char *v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  void *v359;
  const char *v360;
  const char *v361;
  uint64_t v362;
  void *v363;
  const char *v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  const char *v368;
  uint64_t v369;
  void *v370;
  const char *v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  const char *v375;
  const char *v376;
  NSObject *v377;
  const char *v378;
  uint64_t v379;
  void *v380;
  const char *v381;
  uint64_t v382;
  void *v383;
  const char *v384;
  uint64_t v385;
  NSObject *v386;
  const char *v387;
  uint64_t v388;
  void *v389;
  void *v390;
  void *v391;
  NSObject *v392;
  const char *v393;
  NSObject *v394;
  const char *v395;
  uint64_t v397;
  uint64_t v398;
  id obj;
  id v400;
  id v401;
  void *v402;
  void *v403;
  uint64_t v404;
  void *v405;
  void *v406;
  uint64_t v407;
  uint64_t v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  CKDFetchContentAuthTokensForPutURLRequest *v413;
  uint64_t v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  id v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  uint8_t buf[4];
  void *v438;
  __int16 v439;
  void *v440;
  __int16 v441;
  void *v442;
  _BYTE v443[128];
  _BYTE v444[128];
  _BYTE v445[128];
  _BYTE v446[128];
  uint64_t v447;

  v447 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_response(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing operationUUID on %@"), v4);
LABEL_33:
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_126;
  }
  if ((objc_msgSend_hasAssetUploadTokenRetrieveResponse(v4, v11, v12) & 1) == 0)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v13, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing AssetUploadTokenRetrieveResponse on %@"), v4);
    goto LABEL_33;
  }
  objc_msgSend_assetUploadTokenRetrieveResponse(v4, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transactionStateByRequestIDs(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v18, v19, (uint64_t)v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v21, *MEMORY[0x1E0C94B20], 1000, CFSTR("Can't find transactionState for %@"), v10);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_125;
  }
  objc_msgSend_assetBatch(v20, v21, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v23, *MEMORY[0x1E0C94B20], 1000, CFSTR("Can't find assetBatch for %@"), v10);
LABEL_123:
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_124;
  }
  objc_msgSend_authPutResponse(v15, v23, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAuthPutResponse_(v25, v27, (uint64_t)v26);

  v405 = v25;
  v406 = v10;
  v403 = v15;
  v409 = v20;
  v413 = self;
  v400 = v4;
  if (objc_msgSend_contentResponseHeadersCount(v15, v28, v29))
  {
    v32 = (void *)objc_opt_new();
    v433 = 0u;
    v434 = 0u;
    v435 = 0u;
    v436 = 0u;
    objc_msgSend_contentResponseHeaders(v15, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v433, v446, 16);
    if (v37)
    {
      v40 = v37;
      v41 = (dispatch_once_t *)MEMORY[0x1E0C95300];
      v42 = *(_QWORD *)v434;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v434 != v42)
            objc_enumerationMutation(v35);
          v44 = *(void **)(*((_QWORD *)&v433 + 1) + 8 * v43);
          objc_msgSend_headerKey(v44, v38, v39);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_headerValue(v44, v46, v47);
          v48 = objc_claimAutoreleasedReturnValue();
          v50 = (void *)v48;
          if (v45)
            v51 = v48 == 0;
          else
            v51 = 1;
          if (v51)
          {
            if (*v41 != -1)
              dispatch_once(v41, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v52 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              v53 = v52;
              objc_msgSend_headerKey(v44, v54, v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_headerValue(v44, v57, v58);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543619;
              v438 = v56;
              v439 = 2113;
              v440 = v59;
              _os_log_error_impl(&dword_1BE990000, v53, OS_LOG_TYPE_ERROR, "Unable to set header %{public}@ with value %{private}@", buf, 0x16u);

              v41 = (dispatch_once_t *)MEMORY[0x1E0C95300];
            }
          }
          else
          {
            objc_msgSend_setObject_forKey_(v32, v49, v48, v45);
          }

          ++v43;
        }
        while (v40 != v43);
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v433, v446, 16);
      }
      while (v40);
    }

    v25 = v405;
    if (objc_msgSend_count(v32, v60, v61))
      objc_msgSend_setAuthPutResponseHeaders_(v405, v62, (uint64_t)v32);

    v4 = v400;
    v10 = v406;
    v15 = v403;
    v20 = v409;
    self = v413;
  }
  if ((objc_msgSend_useMMCSEncryptionV2(v25, v30, v31) & 1) == 0)
  {
    if (objc_msgSend_isRereferenceAssetBatch(v25, v63, v64))
    {
      objc_msgSend_authPutResponse(v25, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v65)
      {
        objc_msgSend_authPutRequest(v25, v63, v64);
        v390 = (void *)objc_claimAutoreleasedReturnValue();

        v391 = (void *)*MEMORY[0x1E0C952F8];
        if (v390)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], v391);
          v392 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1BE990000, v392, OS_LOG_TYPE_ERROR, "Server did not return the required authPutResponse even though an authPutRequest was sent.", buf, 2u);
          }
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v393, *MEMORY[0x1E0C94B20], 1000, CFSTR("Server did not return the required authPutResponse even though an authPutRequest was sent. AssetUploadTokenRetrieveResponse on %@"), v4);
        }
        else
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], v391);
          v394 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1BE990000, v394, OS_LOG_TYPE_ERROR, "Missing authPutRequest.", buf, 2u);
          }
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v395, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing authPutRequest. AssetUploadTokenRetrieveResponse on %@"), v4);
        }
        goto LABEL_123;
      }
    }
  }
  objc_msgSend_authPutRequest(v25, v63, v64);
  v66 = objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    v69 = (void *)v66;
    objc_msgSend_authPutResponse(v25, v67, v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {

    }
    else
    {
      isRereferenceAssetBatch = objc_msgSend_isRereferenceAssetBatch(v25, v71, v72);

      if ((isRereferenceAssetBatch & 1) == 0)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v75 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BE990000, v75, OS_LOG_TYPE_ERROR, "Server did not return an authPutResponse even though an authPutRequest was sent. While unexpected, this just means the MMCS operation requires a trip to the Content server", buf, 2u);
        }
      }
    }
  }
  objc_msgSend_authPutResponse(v25, v67, v68);
  v76 = objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    v79 = (void *)v76;
    objc_msgSend_authPutResponseHeaders(v25, v77, v78);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v80)
    {
      v4 = v400;
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v77, *MEMORY[0x1E0C94B20], 1000, CFSTR("Failed to get headers for authPutResponse AssetUploadTokenRetrieveResponse on %@"), v400);
      goto LABEL_123;
    }
  }
  v431 = 0u;
  v432 = 0u;
  v429 = 0u;
  v430 = 0u;
  objc_msgSend_uploadTokens(v15, v77, v78);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v397 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v429, v445, 16);
  if (!v397)
    goto LABEL_100;
  v398 = *(_QWORD *)v430;
  while (2)
  {
    v84 = 0;
    do
    {
      if (*(_QWORD *)v430 != v398)
        objc_enumerationMutation(obj);
      v404 = v84;
      v85 = *(void **)(*((_QWORD *)&v429 + 1) + 8 * v84);
      objc_msgSend_translator(self, v82, v83);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_asset(v85, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordId(v89, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v428 = 0;
      objc_msgSend_recordIDFromPRecordIdentifier_error_(v86, v93, (uint64_t)v92, &v428);
      v94 = objc_claimAutoreleasedReturnValue();
      v95 = v428;

      v419 = (void *)v94;
      if (!v94)
      {
        v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v96, *MEMORY[0x1E0C94B20], 1000, CFSTR("Failed to parse recordID from AssetUploadTokenRetrieveResponseUploadToken on %@ : %@"), v400, v95);
LABEL_115:
        v73 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_116:

        v25 = v405;
        v10 = v406;
        goto LABEL_124;
      }
      objc_msgSend_asset(v85, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_signature(v98, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v101)
      {
        v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v102, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing Asset signature from AssetUploadTokenRetrieveResponseUploadToken on %@"), v400);
        goto LABEL_115;
      }
      objc_msgSend_asset(v85, v102, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend_size(v104, v105, v106);

      if (!v107)
      {
        v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v108, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing Asset size from AssetUploadTokenRetrieveResponseUploadToken on %@"), v400);
        goto LABEL_115;
      }
      objc_msgSend_asset(v85, v108, v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_owner(v110, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v113)
      {
        v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v114, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing Asset owner from AssetUploadTokenRetrieveResponseUploadToken on %@"), v400);
        goto LABEL_115;
      }
      objc_msgSend_asset(v85, v114, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_requestor(v116, v117, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v119)
      {
        v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v120, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing Asset requestor from AssetUploadTokenRetrieveResponseUploadToken on %@"), v400);
        goto LABEL_115;
      }
      objc_msgSend_token(v85, v120, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v122)
      {
        v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v123, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing Asset token from AssetUploadTokenRetrieveResponseUploadToken on %@"), v400);
        goto LABEL_115;
      }
      objc_msgSend_asset(v85, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contentBaseURL(v125, v126, v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v128)
      {
        v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v129, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing Asset contentBaseURL from AssetUploadTokenRetrieveResponseUploadToken on %@"), v400);
        goto LABEL_115;
      }
      v402 = v95;
      v131 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend_asset(v85, v129, v130);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contentBaseURL(v132, v133, v134);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLWithString_(v131, v136, (uint64_t)v135);
      v137 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v137)
      {
        v4 = v400;
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v138, *MEMORY[0x1E0C94B20], 1000, CFSTR("Malformed Asset contentBaseURL from AssetUploadTokenRetrieveResponseUploadToken on %@"), v400);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_129:
        v95 = v402;
        goto LABEL_116;
      }
      if (!_os_feature_enabled_impl()
        || !objc_msgSend_duplicateAsset(v85, v139, v140)
        || (objc_msgSend_asset(v85, v141, v142),
            v143 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_uploadReceipt(v143, v144, v145),
            v146 = (void *)objc_claimAutoreleasedReturnValue(),
            v146,
            v143,
            !v146))
      {
        v272 = [CKDAssetID alloc];
        objc_msgSend_asset(v85, v273, v274);
        v417 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordId(v417, v275, v276);
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_asset(v85, v278, v279);
        v280 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_signature(v280, v281, v282);
        v283 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_asset(v85, v284, v285);
        v286 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_referenceSignature(v286, v287, v288);
        v289 = (void *)objc_claimAutoreleasedReturnValue();
        v290 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_asset(v85, v291, v292);
        v293 = (void *)objc_claimAutoreleasedReturnValue();
        v296 = objc_msgSend_size(v293, v294, v295);
        objc_msgSend_numberWithLongLong_(v290, v297, v296);
        v298 = (void *)objc_claimAutoreleasedReturnValue();
        v300 = (void *)objc_msgSend_initWithRecordID_fileSignature_referenceSignature_size_(v272, v299, (uint64_t)v277, v283, v289, v298);

        v20 = v409;
        objc_msgSend_itemsByAssetId(v409, v301, v302);
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v303, v304, (uint64_t)v300);
        v305 = (void *)objc_claimAutoreleasedReturnValue();

        if (v305)
        {
LABEL_86:
          v412 = v300;
          v422 = 0u;
          v423 = 0u;
          v420 = 0u;
          v421 = 0u;
          v174 = v305;
          v346 = objc_msgSend_countByEnumeratingWithState_objects_count_(v174, v345, (uint64_t)&v420, v443, 16);
          v347 = (dispatch_once_t *)MEMORY[0x1E0C95300];
          if (v346)
          {
            v348 = v346;
            v349 = *(_QWORD *)v421;
            do
            {
              v350 = 0;
              do
              {
                if (*(_QWORD *)v421 != v349)
                  objc_enumerationMutation(v174);
                v351 = *(void **)(*((_QWORD *)&v420 + 1) + 8 * v350);
                if (*v347 != -1)
                  dispatch_once(v347, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                v352 = (void *)*MEMORY[0x1E0C952B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
                {
                  v377 = v352;
                  objc_msgSend_token(v85, v378, v379);
                  v380 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_trackingUUID(v351, v381, v382);
                  v383 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v438 = v380;
                  v439 = 2114;
                  v440 = v419;
                  v441 = 2112;
                  v442 = v383;
                  _os_log_debug_impl(&dword_1BE990000, v377, OS_LOG_TYPE_DEBUG, "Setting the upload token \"%@\" for recordID:%{public}@, MMCSItem:%@", buf, 0x20u);

                  v347 = (dispatch_once_t *)MEMORY[0x1E0C95300];
                }
                objc_msgSend_setContentBaseURL_(v351, v353, (uint64_t)v137);
                objc_msgSend_asset(v85, v354, v355);
                v356 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_owner(v356, v357, v358);
                v359 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setOwner_(v351, v360, (uint64_t)v359);

                objc_msgSend_asset(v85, v361, v362);
                v363 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_requestor(v363, v364, v365);
                v366 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setRequestor_(v351, v367, (uint64_t)v366);

                objc_msgSend_token(v85, v368, v369);
                v370 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setAuthToken_(v351, v371, (uint64_t)v370);

                v374 = objc_msgSend_tokenExpiration(v85, v372, v373);
                objc_msgSend_setUploadTokenExpiration_(v351, v375, v374);
                ++v350;
              }
              while (v348 != v350);
              v348 = objc_msgSend_countByEnumeratingWithState_objects_count_(v174, v376, (uint64_t)&v420, v443, 16);
            }
            while (v348);
          }

          objc_msgSend_removeAllObjects(v174, v384, v385);
          v10 = v406;
          v180 = v412;
          goto LABEL_98;
        }
        objc_msgSend_translator(v413, v306, v307);
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_asset(v85, v309, v310);
        v311 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordId(v311, v312, v313);
        v314 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pContainerScopedRecordIdentifierWithPRecordIdentifier_(v308, v315, (uint64_t)v314);
        v316 = (void *)objc_claimAutoreleasedReturnValue();

        if (v316)
        {
          v318 = [CKDAssetID alloc];
          objc_msgSend_asset(v85, v319, v320);
          v418 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_signature(v418, v321, v322);
          v323 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_asset(v85, v324, v325);
          v326 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_referenceSignature(v326, v327, v328);
          v329 = (void *)objc_claimAutoreleasedReturnValue();
          v330 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend_asset(v85, v331, v332);
          v333 = (void *)objc_claimAutoreleasedReturnValue();
          v336 = objc_msgSend_size(v333, v334, v335);
          objc_msgSend_numberWithLongLong_(v330, v337, v336);
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          v340 = (void *)objc_msgSend_initWithRecordID_fileSignature_referenceSignature_size_(v318, v339, (uint64_t)v316, v323, v329, v338);

          v20 = v409;
          objc_msgSend_itemsByAssetId(v409, v341, v342);
          v343 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v343, v344, (uint64_t)v340);
          v305 = (void *)objc_claimAutoreleasedReturnValue();

          v300 = v340;
          if (!v305)
            goto LABEL_128;
          goto LABEL_86;
        }
        v340 = v300;
LABEL_128:
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v317, *MEMORY[0x1E0C94B20], 1000, CFSTR("Failed to find asset for assetID %@ on %@"), v340, v400);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v400;
        v15 = v403;
        goto LABEL_129;
      }
      objc_msgSend_asset(v85, v147, v148);
      v149 = objc_claimAutoreleasedReturnValue();
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v411 = (void *)v149;
      v150 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v386 = v150;
        objc_msgSend_asset(v85, v387, v388);
        v389 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v438 = v389;
        _os_log_debug_impl(&dword_1BE990000, v386, OS_LOG_TYPE_DEBUG, "Asset %@ exists on server. Reuse existing reference signature and asset key and skip uploading.", buf, 0xCu);

      }
      v151 = [CKDAssetID alloc];
      objc_msgSend_asset(v85, v152, v153);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordId(v154, v155, v156);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_asset(v85, v158, v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_signature(v160, v161, v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_asset(v85, v165, v166);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = objc_msgSend_size(v167, v168, v169);
      objc_msgSend_numberWithLongLong_(v164, v171, v170);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      v174 = (id)objc_msgSend_initWithRecordID_fileSignature_referenceSignature_size_(v151, v173, (uint64_t)v157, v163, 0, v172);

      objc_msgSend_itemsByAssetIdIgnoreRefSignature(v409, v175, v176);
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v177, v178, (uint64_t)v174);
      v179 = (void *)objc_claimAutoreleasedReturnValue();

      v180 = v411;
      if (!v179)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v181 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v438 = v411;
          _os_log_error_impl(&dword_1BE990000, v181, OS_LOG_TYPE_ERROR, "unable to find items for duplicate asset %@", buf, 0xCu);
        }
      }
      v426 = 0u;
      v427 = 0u;
      v424 = 0u;
      v425 = 0u;
      v401 = v179;
      v408 = objc_msgSend_countByEnumeratingWithState_objects_count_(v401, v182, (uint64_t)&v424, v444, 16);
      if (v408)
      {
        v407 = *(_QWORD *)v425;
LABEL_70:
        v185 = 0;
        while (1)
        {
          if (*(_QWORD *)v425 != v407)
            objc_enumerationMutation(v401);
          v414 = v185;
          v186 = *(void **)(*((_QWORD *)&v424 + 1) + 8 * v185);
          objc_msgSend_asset(v186, v183, v184);
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_record(v187, v188, v189);
          v190 = (void *)objc_claimAutoreleasedReturnValue();

          v410 = v186;
          objc_msgSend_asset(v186, v191, v192);
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          v194 = [CKDWrappingContext alloc];
          objc_msgSend_recordID(v190, v195, v196);
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          v416 = v193;
          objc_msgSend_recordKey(v193, v198, v199);
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_signature(v180, v201, v202);
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_referenceSignature(v180, v204, v205);
          v206 = v180;
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          v415 = (void *)objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v194, v208, (uint64_t)v197, v200, 0, v203, v207);

          objc_msgSend_operation(v413, v209, v210);
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_container(v211, v212, v213);
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsManager(v214, v215, v216);
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_protectionInfo(v206, v218, v219);
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_protectionInfo(v220, v221, v222);
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          v226 = objc_msgSend_recordPCS(v190, v224, v225);
          objc_msgSend_unwrapAssetKey_withRecordPCS_inContext_withError_(v217, v227, (uint64_t)v223, v226, v415, 0);
          v228 = objc_claimAutoreleasedReturnValue();

          v229 = (void *)v228;
          if (v228)
          {
            v180 = v411;
            objc_msgSend_referenceSignature(v411, v230, v231);
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setReferenceSignature_(v410, v233, (uint64_t)v232);

            objc_msgSend_setAssetKey_(v410, v234, v228);
            objc_msgSend_uploadReceipt(v411, v235, v236);
            v237 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setUploadReceipt_(v410, v238, (uint64_t)v237);

            objc_msgSend_setContentBaseURL_(v410, v239, (uint64_t)v137);
            objc_msgSend_asset(v85, v240, v241);
            v242 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_owner(v242, v243, v244);
            v245 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setOwner_(v410, v246, (uint64_t)v245);

            objc_msgSend_asset(v85, v247, v248);
            v249 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_requestor(v249, v250, v251);
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setRequestor_(v410, v253, (uint64_t)v252);

            objc_msgSend_token(v85, v254, v255);
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setAuthToken_(v410, v257, (uint64_t)v256);

            v260 = objc_msgSend_tokenExpiration(v85, v258, v259);
            objc_msgSend_setUploadTokenExpiration_(v410, v261, v260);
            objc_msgSend_referenceSignature(v411, v262, v263);
            v264 = (void *)objc_claimAutoreleasedReturnValue();
            v265 = v416;
            objc_msgSend_setReferenceSignature_(v416, v266, (uint64_t)v264);

            objc_msgSend_setAssetKey_(v416, v267, (uint64_t)v229);
            v268 = v190;
          }
          else
          {
            v265 = v416;
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v180 = v411;
            v268 = v190;
            v269 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v438 = v411;
              _os_log_error_impl(&dword_1BE990000, v269, OS_LOG_TYPE_ERROR, "failed to unwrapp asset key for duplicate asset %@", buf, 0xCu);
            }
          }

          if (!v229)
            break;
          v185 = v414 + 1;
          if (v408 == v414 + 1)
          {
            v408 = objc_msgSend_countByEnumeratingWithState_objects_count_(v401, v183, (uint64_t)&v424, v444, 16);
            if (v408)
              goto LABEL_70;
            break;
          }
        }
      }

      objc_msgSend_removeAllObjects(v401, v270, v271);
      v10 = v406;
LABEL_98:

      v15 = v403;
      v84 = v404 + 1;
      v20 = v409;
      v25 = v405;
      self = v413;
    }
    while (v404 + 1 != v397);
    v397 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v82, (uint64_t)&v429, v445, 16);
    if (v397)
      continue;
    break;
  }
LABEL_100:

  v73 = 0;
  v4 = v400;
LABEL_124:

LABEL_125:
LABEL_126:

  return v73;
}

- (void)requestDidParseNodeFailure:(id)a3
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
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;
  void *v28;
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
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  int hasTypeCode;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  NSObject *v84;
  const char *v85;
  NSObject *v86;
  const char *v87;
  const char *v88;
  void *v89;
  objc_class *v90;
  void *v91;
  void *v92;
  const char *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint8_t buf[4];
  id v99;
  __int16 v100;
  id v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_result(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasClientError(v11, v12, v13) & 1) != 0)
  {
    objc_msgSend_result(v5, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientError(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_type(v22, v23, v24);

    if (v25 == 4)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0C94B20];
      objc_msgSend_result(v5, v26, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BEB10290(self, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v28, v32, v29, 2006, v31);
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend_result(v5, v26, v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasExtensionError(v37, v38, v39) & 1) == 0)
  {

LABEL_11:
    objc_msgSend_response(v5, v52, v53);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationUUID(v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      objc_msgSend_transactionStateByRequestIDs(self, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v64, v65, (uint64_t)v61);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        v94 = (void *)MEMORY[0x1E0C94FF8];
        v29 = *MEMORY[0x1E0C94B20];
        objc_msgSend_result(v5, v67, v68);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = sub_1BEB10D5C(v96);
        objc_msgSend_result(v5, v70, v71);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1BEB10290(self, v95);
        v97 = v61;
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v5, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_error(v75, v76, v77);
        v78 = a2;
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDescription(v79, v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_format_(v94, v83, v29, v69, v72, CFSTR("Error uploading asset: %@"), v82);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        a2 = v78;
        v61 = v97;

      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v86 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v99 = v61;
          v100 = 2112;
          v101 = v5;
          _os_log_error_impl(&dword_1BE990000, v86, OS_LOG_TYPE_ERROR, "Can't find assetBatch for %{public}@ on %@", buf, 0x16u);
        }
        v29 = *MEMORY[0x1E0C94B20];
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v87, *MEMORY[0x1E0C94B20], 1000, CFSTR("Can't find transactionState"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v84 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v99 = v5;
        _os_log_error_impl(&dword_1BE990000, v84, OS_LOG_TYPE_ERROR, "Missing requestID on %@", buf, 0xCu);
      }
      v29 = *MEMORY[0x1E0C94B20];
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v85, *MEMORY[0x1E0C94B20], 1000, CFSTR("Missing requestID on %@"), v5);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v56)
      goto LABEL_26;
    goto LABEL_27;
  }
  objc_msgSend_result(v5, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extensionError(v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  hasTypeCode = objc_msgSend_hasTypeCode(v48, v49, v50);

  if (!hasTypeCode)
    goto LABEL_11;
  v54 = (void *)MEMORY[0x1E0C94FF8];
  v29 = *MEMORY[0x1E0C94B20];
  objc_msgSend_result(v5, v52, v53);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1BEB10290(self, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_format_(v54, v55, v29, 6000, v31, CFSTR("Plugin-Specific Error"));
  v33 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v56 = (void *)v33;

  if (!v56)
  {
LABEL_26:
    v88 = a2;
    v89 = (void *)MEMORY[0x1E0C94FF8];
    v90 = (objc_class *)objc_opt_class();
    NSStringFromClass(v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(v88);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v89, v93, v29, 1000, CFSTR("Generic %@ %@ error"), v91, v92);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_27:
  objc_msgSend_finishWithError_(self, v57, (uint64_t)v56);

}

- (BOOL)useEncryption
{
  return self->_useEncryption;
}

- (void)setUseEncryption:(BOOL)a3
{
  self->_useEncryption = a3;
}

- (CKDAssetTokenRequest)assetTokenRequest
{
  return self->_assetTokenRequest;
}

- (void)setAssetTokenRequest:(id)a3
{
  objc_storeStrong((id *)&self->_assetTokenRequest, a3);
}

- (NSMapTable)transactionStateByRequestIDs
{
  return self->_transactionStateByRequestIDs;
}

- (void)setTransactionStateByRequestIDs:(id)a3
{
  objc_storeStrong((id *)&self->_transactionStateByRequestIDs, a3);
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_transactionStateByRequestIDs, 0);
  objc_storeStrong((id *)&self->_assetTokenRequest, 0);
}

@end
