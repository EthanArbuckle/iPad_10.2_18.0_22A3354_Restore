@implementation CKDModifyRecordsOperation

- (CKDModifyRecordsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  uint64_t v5;
  NSMutableDictionary *modifyHandlersByZoneID;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  char v42;
  const char *v43;
  id v44;
  const char *v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  void *v70;
  void *v71;
  const char *v72;
  const char *v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  int isEqualToString;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t m;
  void *v106;
  void *v107;
  const char *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  void *v119;
  const char *v120;
  const char *v121;
  const char *v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  NSDictionary *conflictLosersToResolveByRecordID;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  NSDictionary *pluginFieldsForRecordDeletesByID;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  NSData *clientChangeTokenData;
  const char *v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  OS_dispatch_queue *modifyRecordsQueue;
  const char *v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  NSDictionary *assetUUIDToExpectedProperties;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  NSDictionary *packageUUIDToExpectedProperties;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  unint64_t v177;
  const char *v178;
  uint64_t v179;
  BOOL v180;
  void *v181;
  const char *v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  int v186;
  id v188;
  id v189;
  uint64_t v190;
  uint64_t v191;
  id obj;
  id v193;
  id v194;
  uint64_t v195;
  unint64_t v196;
  id v197;
  uint64_t k;
  id v199;
  CKDModifyRecordsOperation *v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  _QWORD v213[5];
  id v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  uint64_t v219;
  uint64_t *v220;
  uint64_t v221;
  uint64_t v222;
  objc_super v223;
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  uint64_t v227;
  _BYTE v228[128];
  uint64_t v229;

  v229 = *MEMORY[0x1E0C80C00];
  v223.receiver = self;
  v223.super_class = (Class)CKDModifyRecordsOperation;
  v199 = a3;
  v188 = a4;
  v200 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v223, sel_initWithOperationInfo_container_, v199);
  if (v200)
  {
    v5 = objc_opt_new();
    modifyHandlersByZoneID = v200->_modifyHandlersByZoneID;
    v200->_modifyHandlersByZoneID = (NSMutableDictionary *)v5;

    v200->_originatingFromDaemon = objc_msgSend_originatingFromDaemon(v199, v7, v8);
    v200->_markAsParticipantNeedsNewInvitationToken = objc_msgSend_markAsParticipantNeedsNewInvitationToken(v199, v9, v10);
    v200->_shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v199, v11, v12);
    v197 = (id)objc_opt_new();
    v219 = 0;
    v220 = &v219;
    v221 = 0x2020000000;
    v222 = 0;
    objc_msgSend_recordsToSave(v199, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v200->_hasRecordsToSave = objc_msgSend_count(v15, v16, v17) != 0;
    v215 = 0u;
    v216 = 0u;
    v217 = 0u;
    v218 = 0u;
    obj = v15;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v215, v228, 16);
    if (v21)
    {
      v22 = 0;
      v193 = *(id *)v216;
      v195 = 0;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(id *)v216 != v193)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v215 + 1) + 8 * i);
          objc_msgSend_recordID(v24, v19, v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneID(v25, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_objectForKeyedSubscript_(v200->_modifyHandlersByZoneID, v29, (uint64_t)v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v31)
          {
            v31 = (void *)objc_opt_new();
            objc_msgSend_setObject_forKeyedSubscript_(v200->_modifyHandlersByZoneID, v32, (uint64_t)v31, v28);
          }
          objc_msgSend_handlerForSaveWithRecord_(v200, v30, (uint64_t)v24);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setBatchRank_(v33, v34, v195 + i);
          objc_msgSend_addObject_(v31, v35, (uint64_t)v33);
          if ((objc_msgSend_originatingFromDaemon(v199, v36, v37) & 1) == 0)
          {
            v40 = (void *)objc_opt_class();
            v214 = 0;
            v42 = objc_msgSend__claimPackagesInRecord_error_(v40, v41, (uint64_t)v24, &v214);
            v44 = v214;
            if ((v42 & 1) == 0)
            {
              objc_msgSend_setState_(v33, v43, 12);
              objc_msgSend_setError_(v33, v45, (uint64_t)v44);
            }

          }
          objc_msgSend_assetUUIDToExpectedProperties(v199, v38, v39);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAssetUUIDToExpectedProperties_(v33, v47, (uint64_t)v46);

          objc_msgSend_recordID(v24, v48, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v197, v51, (uint64_t)v33, v50);

          v54 = objc_msgSend_size(v24, v52, v53);
          ++v220[3];
          v227 = objc_opt_class();
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v55, (uint64_t)&v227, 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v213[0] = MEMORY[0x1E0C809B0];
          v213[1] = 3221225472;
          v213[2] = sub_1BEBEC500;
          v213[3] = &unk_1E78371D8;
          v213[4] = &v219;
          objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v24, v57, (uint64_t)v56, v213);

          v22 += v54;
        }
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v215, v228, 16);
        v195 += i;
      }
      while (v21);
    }
    else
    {
      v22 = 0;
    }
    v196 = v22;

    objc_msgSend_recordIDsToDelete(v199, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v200->_hasRecordsToDelete = objc_msgSend_count(v60, v61, v62) != 0;
    v209 = 0u;
    v210 = 0u;
    v211 = 0u;
    v212 = 0u;
    v194 = v60;
    v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v63, (uint64_t)&v209, v226, 16);
    if (v66)
    {
      v67 = *(_QWORD *)v210;
      v68 = *MEMORY[0x1E0C949F0];
      do
      {
        for (j = 0; j != v66; ++j)
        {
          if (*(_QWORD *)v210 != v67)
            objc_enumerationMutation(v194);
          v70 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * j);
          objc_msgSend_zoneID(v70, v64, v65);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v200->_modifyHandlersByZoneID, v72, (uint64_t)v71);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v74)
          {
            v74 = (void *)objc_opt_new();
            objc_msgSend_setObject_forKeyedSubscript_(v200->_modifyHandlersByZoneID, v75, (uint64_t)v74, v71);
          }
          objc_msgSend_handlerForDeleteWithRecordID_(v200, v73, (uint64_t)v70);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordIDsToDeleteToEtags(v199, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v79, v80, (uint64_t)v70);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setEtag_(v76, v82, (uint64_t)v81);

          objc_msgSend_addObject_(v74, v83, (uint64_t)v76);
          objc_msgSend_setObject_forKeyedSubscript_(v197, v84, (uint64_t)v76, v70);
          if (objc_msgSend_markAsParticipantNeedsNewInvitationToken(v199, v85, v86))
          {
            objc_msgSend_recordName(v70, v87, v88);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v89, v90, v68);

            if (isEqualToString)
              v200->_requestNeedsUserPublicKeys = 1;
          }
          v92 = objc_msgSend_size(v70, v87, v88);

          v196 += v92;
        }
        v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v64, (uint64_t)&v209, v226, 16);
      }
      while (v66);
    }

    objc_storeStrong((id *)&v200->_handlersByRecordID, v197);
    v207 = 0u;
    v208 = 0u;
    v205 = 0u;
    v206 = 0u;
    objc_msgSend_allValues(v200->_modifyHandlersByZoneID, v93, v94);
    v189 = (id)objc_claimAutoreleasedReturnValue();
    v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v189, v95, (uint64_t)&v205, v225, 16);
    if (v191)
    {
      v190 = *(_QWORD *)v206;
      v96 = *MEMORY[0x1E0C94B20];
      do
      {
        for (k = 0; k != v191; ++k)
        {
          if (*(_QWORD *)v206 != v190)
            objc_enumerationMutation(v189);
          v97 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * k);
          v98 = (void *)objc_opt_new();
          v203 = 0u;
          v204 = 0u;
          v201 = 0u;
          v202 = 0u;
          v99 = v97;
          v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v100, (uint64_t)&v201, v224, 16);
          if (v103)
          {
            v104 = *(_QWORD *)v202;
            do
            {
              for (m = 0; m != v103; ++m)
              {
                if (*(_QWORD *)v202 != v104)
                  objc_enumerationMutation(v99);
                v106 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * m);
                objc_msgSend_recordID(v106, v101, v102);
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v98, v108, (uint64_t)v107);
                v109 = (void *)objc_claimAutoreleasedReturnValue();

                if (v109)
                {
                  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v110, v96, 1017, CFSTR("You can't pass multiple instances of the same record to a CKModifyRecordsOperation"));
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setState_(v106, v113, 12);
                  objc_msgSend_setError_(v106, v114, (uint64_t)v112);
                  objc_msgSend_recordID(v106, v115, v116);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v98, v118, (uint64_t)v117);
                  v119 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_setState_(v119, v120, 12);
                  objc_msgSend_setError_(v119, v121, (uint64_t)v112);

                }
                else
                {
                  objc_msgSend_recordID(v106, v110, v111);
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setObject_forKeyedSubscript_(v98, v122, (uint64_t)v106, v112);
                }

              }
              v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v101, (uint64_t)&v201, v224, 16);
            }
            while (v103);
          }

        }
        v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v189, v123, (uint64_t)&v205, v225, 16);
      }
      while (v191);
    }

    objc_msgSend_conflictLosersToResolveByRecordID(v199, v124, v125);
    v126 = objc_claimAutoreleasedReturnValue();
    conflictLosersToResolveByRecordID = v200->_conflictLosersToResolveByRecordID;
    v200->_conflictLosersToResolveByRecordID = (NSDictionary *)v126;

    objc_msgSend_pluginFieldsForRecordDeletesByID(v199, v128, v129);
    v130 = objc_claimAutoreleasedReturnValue();
    pluginFieldsForRecordDeletesByID = v200->_pluginFieldsForRecordDeletesByID;
    v200->_pluginFieldsForRecordDeletesByID = (NSDictionary *)v130;

    objc_msgSend_recordsToSave(v199, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v134, v135, v136))
    {
      v200->_haveOutstandingHandlers = 1;
    }
    else
    {
      objc_msgSend_recordIDsToDelete(v199, v137, v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v200->_haveOutstandingHandlers = objc_msgSend_count(v139, v140, v141) != 0;

    }
    v200->_savePolicy = objc_msgSend_savePolicy(v199, v142, v143);
    objc_msgSend_clientChangeTokenData(v199, v144, v145);
    v146 = objc_claimAutoreleasedReturnValue();
    clientChangeTokenData = v200->_clientChangeTokenData;
    v200->_clientChangeTokenData = (NSData *)v146;

    v200->_shouldOnlySaveAssetContent = objc_msgSend_shouldOnlySaveAssetContent(v199, v148, v149);
    v200->_atomic = objc_msgSend_atomic(v199, v150, v151);
    v200->_retryPCSFailures = objc_msgSend_shouldSkipPCSRetryBehavior(v199, v152, v153) ^ 1;
    v200->_shouldReportRecordsInFlight = objc_msgSend_shouldReportRecordsInFlight(v199, v154, v155);
    objc_msgSend_createSerialQueue(v200, v156, v157);
    v158 = objc_claimAutoreleasedReturnValue();
    modifyRecordsQueue = v200->_modifyRecordsQueue;
    v200->_modifyRecordsQueue = (OS_dispatch_queue *)v158;

    v200->_shouldModifyRecordsInDatabase = objc_msgSend_shouldModifyRecordsInDatabase(v199, v160, v161);
    v200->_alwaysFetchPCSFromServer = objc_msgSend_alwaysFetchPCSFromServer(v199, v162, v163);
    objc_msgSend_assetUUIDToExpectedProperties(v199, v164, v165);
    v166 = objc_claimAutoreleasedReturnValue();
    assetUUIDToExpectedProperties = v200->_assetUUIDToExpectedProperties;
    v200->_assetUUIDToExpectedProperties = (NSDictionary *)v166;

    objc_msgSend_packageUUIDToExpectedProperties(v199, v168, v169);
    v170 = objc_claimAutoreleasedReturnValue();
    packageUUIDToExpectedProperties = v200->_packageUUIDToExpectedProperties;
    v200->_packageUUIDToExpectedProperties = (NSDictionary *)v170;

    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v172, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = objc_msgSend_maximumMergeableDeltaRequestSize(v174, v175, v176);

    v180 = v200->_atomic || v196 < v177 && (unint64_t)v220[3] < *MEMORY[0x1E0C948D0];
    v200->_includeMergeableDeltasInModifyRecordsRequest = v180;
    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(v200, v178, v179);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v181, v182, (uint64_t)CFSTR("ForceSeparateRequestForMergeableDeltaUpload"));
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = objc_msgSend_BOOLValue(v183, v184, v185);

      if (v186)
        v200->_includeMergeableDeltasInModifyRecordsRequest = 0;
    }

    _Block_object_dispose(&v219, 8);
  }

  return v200;
}

- (BOOL)retryPCSFailures
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  BOOL result;

  result = (!*MEMORY[0x1E0C95280]
         || (objc_msgSend_unitTestOverrides(self, a2, v2),
             v4 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("DontRetryPCSFailures")),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             v6,
             v4,
             !v6))
        && self->_retryPCSFailures;
  return result;
}

+ (BOOL)_claimPackagesInRecord:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  void *v7;
  char v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1BE9BB190;
  v15 = sub_1BE9BAE70;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BEBEC734;
  v10[3] = &unk_1E7837200;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend_claimPackagesWithSuccessBlock_failureBlock_completionBlock_(v5, v6, 0, v10, &unk_1E7837240);
  if (a4)
  {
    v7 = (void *)v12[5];
    if (v7)
      *a4 = objc_retainAutorelease(v7);
  }
  v8 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/modify-records", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)_hasHandlerInState:(unint64_t)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  const char *v22;
  BOOL v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend_modifyHandlersByZoneID(self, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v29, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v14 = v13;
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v25, v33, 16);
        if (v16)
        {
          v19 = v16;
          v20 = *(_QWORD *)v26;
          while (2)
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v26 != v20)
                objc_enumerationMutation(v14);
              if (objc_msgSend_state(*(void **)(*((_QWORD *)&v25 + 1) + 8 * j), v17, v18) == a3)
              {

                v23 = 1;
                goto LABEL_19;
              }
            }
            v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v25, v33, 16);
            if (v19)
              continue;
            break;
          }
        }

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v22, (uint64_t)&v29, v34, 16);
      v23 = 0;
    }
    while (v10);
  }
  else
  {
    v23 = 0;
  }
LABEL_19:

  return v23;
}

- (void)_enumerateHandlersInState:(unint64_t)a3 withBlock:(id)a4
{
  const char *v6;
  uint64_t v7;
  void (**v8)(id, void *);
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  const char *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *))a4;
  if (v8)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend_modifyHandlersByZoneID(self, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allValues(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v12;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v34, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v19 = v18;
          v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v30, v38, 16);
          if (v21)
          {
            v24 = v21;
            v25 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v31 != v25)
                  objc_enumerationMutation(v19);
                v27 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
                if (objc_msgSend_state(v27, v22, v23) == a3)
                  v8[2](v8, v27);
              }
              v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v30, v38, 16);
            }
            while (v24);
          }

        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v34, v39, 16);
      }
      while (v15);
    }

  }
}

- (int)operationType
{
  _BOOL4 hasRecordsToSave;
  int result;

  hasRecordsToSave = self->_hasRecordsToSave;
  result = 210;
  if (!hasRecordsToSave)
  {
    if (self->_hasRecordsToDelete)
      return 214;
    else
      return 210;
  }
  return result;
}

- (BOOL)isOperationType:(int)a3
{
  uint64_t v3;
  objc_super v5;

  if (a3 == 214)
  {
    v3 = 465;
    return *((_BYTE *)&self->super.super.super.super.isa + v3) != 0;
  }
  if (a3 == 210)
  {
    v3 = 464;
    return *((_BYTE *)&self->super.super.super.super.isa + v3) != 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CKDModifyRecordsOperation;
  return -[CKDOperation isOperationType:](&v5, sel_isOperationType_);
}

- (id)handlerForSaveWithRecord:(id)a3
{
  id v4;
  const char *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_modifyHandlerWithShare_operation_(CKDModifyShareHandler, v5, (uint64_t)v4, self);
  else
    objc_msgSend_modifyHandlerWithRecord_operation_(CKDModifyRecordHandler, v5, (uint64_t)v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)handlerForDeleteWithRecordID:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](CKDModifyRecordHandler, sel_modifyHandlerForDeleteWithRecordID_operation_, a3);
}

- (CKDDecryptRecordsOperation)recordDecryptOperation
{
  CKDModifyRecordsOperation *v2;
  const char *v3;
  uint64_t v4;
  CKDDecryptRecordsOperation *decryptOperation;
  void *v6;
  uint64_t v7;
  const char *v8;
  _QWORD v10[5];

  v2 = self;
  objc_sync_enter(v2);
  decryptOperation = v2->_decryptOperation;
  if (!decryptOperation || objc_msgSend_isFinished(decryptOperation, v3, v4))
  {
    v6 = (void *)objc_opt_new();
    v7 = objc_opt_class();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1BEBECE24;
    v10[3] = &unk_1E782E508;
    v10[4] = v2;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v2, v8, v7, v6, v10);

  }
  objc_sync_exit(v2);

  return v2->_decryptOperation;
}

- (void)finishDecryption
{
  const char *v2;
  uint64_t v3;
  CKDDecryptRecordsOperation *decryptOperation;
  const char *v5;
  uint64_t v6;
  CKDModifyRecordsOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  decryptOperation = obj->_decryptOperation;
  if (decryptOperation && (objc_msgSend_isFinished(decryptOperation, v2, v3) & 1) == 0)
    objc_msgSend_finishDecryption(obj->_decryptOperation, v5, v6);
  objc_sync_exit(obj);

}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
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
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  int shouldDecryptRecordsBeforeSave;
  CKDModifyRecordsOperation *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  int v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  int v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  int v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  int v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  objc_msgSend__performHandlerCallbacks(self, a2, v2);
  switch(objc_msgSend_state(self, v4, v5))
  {
    case 1:
      objc_msgSend_setState_(self, v6, 2);
      objc_msgSend__determineEnvironment(self, v10, v11);
      return 1;
    case 2:
      objc_msgSend_setState_(self, v6, 3);
      objc_msgSend__fetchContainerScopedUserID(self, v12, v13);
      return 1;
    case 3:
      objc_msgSend_setState_(self, v6, 4);
      objc_msgSend__fetchUserPublicKeys(self, v14, v15);
      return 1;
    case 4:
      objc_msgSend_setState_(self, v6, 5);
      objc_msgSend__applySideEffects(self, v16, v17);
      return 1;
    case 5:
      objc_msgSend_setState_(self, v6, 6);
      return MEMORY[0x1E0DE7D20](self, sel__topoSortRecords, v74);
    case 6:
    case 17:
      goto LABEL_2;
    case 7:
      objc_msgSend_setState_(self, v6, 9);
      objc_msgSend__fetchSharePCSData(self, v18, v19);
      return 1;
    case 8:
      objc_msgSend_setState_(self, v6, 10);
      objc_msgSend__fetchRecordsForRereferencing(self, v20, v21);
      return 1;
    case 9:
      objc_msgSend_setState_(self, v6, 8);
      objc_msgSend__fetchRecordPCSData(self, v22, v23);
      return 1;
    case 10:
      objc_msgSend_setState_(self, v6, 11);
      objc_msgSend__prepareForUpload(self, v24, v25);
      return 1;
    case 11:
      objc_msgSend_setState_(self, v6, 12);
      objc_msgSend__uploadAssets(self, v26, v27);
      return 1;
    case 12:
      if (objc_msgSend_shouldOnlySaveAssetContent(self, v6, v7))
        goto LABEL_22;
      objc_msgSend_setState_(self, v28, 13);
      return MEMORY[0x1E0DE7D20](self, sel__prepareRecordsForSave, v73);
    case 13:
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v6, v7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      shouldDecryptRecordsBeforeSave = objc_msgSend_shouldDecryptRecordsBeforeSave(v29, v30, v31);

      v33 = self;
      if (!shouldDecryptRecordsBeforeSave)
        goto LABEL_18;
      objc_msgSend_setState_(self, v6, 14);
      objc_msgSend__verifyRecordEncryption(self, v34, v35);
      return 1;
    case 14:
      v33 = self;
LABEL_18:
      if (!objc_msgSend_shouldReportRecordsInFlight(v33, v6, v7))
        goto LABEL_20;
      objc_msgSend_setState_(self, v6, 15);
      objc_msgSend__reportRecordsInFlight(self, v36, v37);
      break;
    case 15:
LABEL_20:
      if ((objc_msgSend_shouldModifyRecordsInDatabase(self, v6, v7) & 1) != 0)
      {
        objc_msgSend_setState_(self, v28, 16);
        objc_msgSend__continueRecordsModify(self, v38, v39);
      }
      else
      {
LABEL_22:
        objc_msgSend_setState_(self, v28, 18);
        objc_msgSend__markRecordHandlersAsUploaded(self, v40, v41);
      }
      break;
    case 16:
      if (objc_msgSend__hasHandlerInState_(self, v6, 10)
        && (v44 = objc_msgSend_saveAttempts(self, v42, v43),
            objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v45, v46),
            v47 = (void *)objc_claimAutoreleasedReturnValue(),
            v50 = objc_msgSend_PCSRetryCount(v47, v48, v49),
            v47,
            v44 <= v50))
      {
        objc_msgSend_setState_(self, v42, 17);
        objc_msgSend__fetchShareParticipants(self, v66, v67);
      }
      else
      {
        objc_msgSend_setState_(self, v42, 18);
      }
      break;
    case 18:
      objc_msgSend_setState_(self, v6, 19);
      objc_msgSend__uploadMergeableDeltas(self, v51, v52);
      break;
    case 19:
      if (objc_msgSend_haveOutstandingHandlers(self, v6, v7)
        && (v55 = objc_msgSend_saveAttempts(self, v53, v54),
            objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v56, v57),
            v58 = (void *)objc_claimAutoreleasedReturnValue(),
            v61 = objc_msgSend_PCSRetryCount(v58, v59, v60),
            v58,
            v55 <= v61))
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v68 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          v69 = v68;
          objc_msgSend_modifyHandlersByZoneID(self, v70, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 138412290;
          v77 = v72;
          _os_log_impl(&dword_1BE990000, v69, OS_LOG_TYPE_INFO, "Records needed PCS info re-fetched: %@", (uint8_t *)&v76, 0xCu);

        }
LABEL_2:
        objc_msgSend_setState_(self, v6, 7);
        objc_msgSend__prepareParentPCS(self, v8, v9);
      }
      else
      {
        objc_msgSend_setState_(self, v53, 0xFFFFFFFFLL);
        objc_msgSend_error(self, v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_finishWithError_(self, v65, (uint64_t)v64);

      }
      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 0x12)
    return off_1E78376E0[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDModifyRecordsOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)callbackWithMetadata:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t (*v14)(uint64_t);
  uint64_t *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_isDelete(v6, v8, v9);
  objc_msgSend_callbackQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v19 = MEMORY[0x1E0C809B0];
    v14 = sub_1BEBED460;
    v15 = &v19;
  }
  else
  {
    v18 = MEMORY[0x1E0C809B0];
    v14 = sub_1BEBED470;
    v15 = &v18;
  }
  v15[1] = 3221225472;
  v15[2] = (uint64_t)v14;
  v15[3] = (uint64_t)&unk_1E782E418;
  v15[4] = (uint64_t)self;
  v15[5] = (uint64_t)v6;
  v15[6] = (uint64_t)v7;
  v16 = v7;
  v17 = v6;
  dispatch_async(v13, v15);

}

- (void)saveCallbackWithMetadata:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void (**v32)(_QWORD, _QWORD, double);
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  id v61;
  const char *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  _QWORD v81[5];
  id v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  __CFString *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend_saveCompletionBlockCalled(v7, v9, v10))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_record(v7, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v76, v80, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 671, CFSTR("saveCallbackWithMetadata:error: called twice on %@"), v79);

  }
  objc_msgSend_serverRecord(v7, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_streamingAssetRequestOptions(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStreamingAssetRequestOptions_(v13, v17, (uint64_t)v16);

  if (v8)
  {
    objc_msgSend_saveCompletionBlock(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_13;
    objc_msgSend_saveCompletionBlock(self, v21, v22);
    v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_record(v7, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD, _QWORD, id))v23)[2](v23, v29, 0, 0, v8);
    goto LABEL_12;
  }
  objc_msgSend_error(v7, v18, v19);
  v32 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  if (v32)
    goto LABEL_9;
  objc_msgSend_saveProgressBlock(self, v30, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend_saveProgressBlock(self, v34, v35);
    v32 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
    objc_msgSend_record(v7, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, double))v32)[2](v32, v41, 1.0);

LABEL_9:
  }
  objc_msgSend_saveCompletionBlock(self, v34, v35);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
    goto LABEL_13;
  objc_msgSend_saveCompletionBlock(self, v21, v22);
  v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend_record(v7, v43, v44);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v26, v45, v46);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_record(v7, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverRecord(v7, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v7, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, void *, void *))v23)[2](v23, v29, v49, v52, v55);

LABEL_12:
LABEL_13:
  if (objc_msgSend_didAttemptZoneWideShareKeyRoll(v7, v21, v22))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v58 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v63 = v58;
      objc_msgSend_operationID(self, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v84 = v66;
      v85 = 2114;
      v86 = CFSTR("com.apple.cloudkit.dugongKeyRollOperationFinished");
      _os_log_debug_impl(&dword_1BE990000, v63, OS_LOG_TYPE_DEBUG, "Operation %{public}@ sending CoreAnalytics event %{public}@", buf, 0x16u);

      if (v8)
        goto LABEL_18;
    }
    else if (v8)
    {
LABEL_18:
      v61 = v8;
LABEL_21:
      v67 = v61;
      objc_msgSend_dugongKeyRollAnalyticsPayloadWithError_(self, v62, (uint64_t)v61);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      goto LABEL_22;
    }
    objc_msgSend_error(v7, v59, v60);
    v61 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_22:
  if (!v8)
  {
    objc_msgSend_error(v7, v56, v57);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v69)
    {
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = sub_1BEBED8C4;
      v81[3] = &unk_1E78332D0;
      v81[4] = self;
      v82 = v7;
      objc_msgSend_updateCloudKitMetrics_(self, v70, (uint64_t)v81);

    }
  }
  objc_msgSend_setSaveCompletionBlockCalled_(v7, v56, 1);
  objc_msgSend_record(v7, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_releasePackages(v73, v74, v75);

}

- (void)deleteCallbackWithMetadata:(id)a3 error:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  objc_msgSend_deleteCompletionBlock(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_deleteCompletionBlock(self, v10, v11);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v23, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      ((void (**)(_QWORD, void *, id))v12)[2](v12, v17, v6);
    }
    else
    {
      objc_msgSend_error(v23, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v12)[2](v12, v17, v18);

    }
  }
  if (!v6)
  {
    objc_msgSend_error(v23, v10, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19 && (objc_msgSend_shouldOnlySaveAssetContent(self, v20, v21) & 1) == 0)
      objc_msgSend_updateCloudKitMetrics_(self, v22, (uint64_t)&unk_1E7837260);
  }

}

- (void)_performCallbacksForNonAtomicZoneHandlers:(id)a3
{
  uint64_t v3;
  id v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  _BOOL8 v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  BOOL v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  BOOL v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL8 v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  const char *v57;
  id v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v8 = objc_msgSend_saveAttempts(self, v6, v7);
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_PCSRetryCount(v11, v12, v13);
  v15 = v8 <= v14;

  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)CFSTR("PreventRecordModifyRetries"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      v21 = 0;
    else
      v21 = v8 <= v14;
    v15 = v21;
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v22 = v5;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v60, v64, 16);
  if (v24)
  {
    v27 = v24;
    v28 = *(_QWORD *)v61;
    v58 = v22;
LABEL_10:
    v29 = 0;
    while (2)
    {
      if (*(_QWORD *)v61 != v28)
        objc_enumerationMutation(v22);
      v30 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v29);
      switch(objc_msgSend_state(v30, v25, v26))
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 9:
        case 10:
          objc_msgSend_setHaveOutstandingHandlers_(self, v25, 1);
          goto LABEL_27;
        case 8:
        case 11:
        case 12:
          goto LABEL_18;
        case 13:
          if (!v15)
          {
LABEL_18:
            objc_msgSend_setState_(v30, v25, 14);
            objc_msgSend_callbackWithMetadata_error_(self, v39, (uint64_t)v30, 0);
            goto LABEL_27;
          }
          objc_msgSend_setError_(v30, v25, 0);
          if (objc_msgSend_isDelete(v30, v31, v32))
          {
            v35 = objc_msgSend__needsSigningPCS(self, v33, v34) == 0;
            v37 = 5;
            v38 = 2;
          }
          else
          {
            if ((objc_msgSend_needsRefetch(v30, v33, v34) & 1) != 0)
            {
              objc_msgSend_setState_(v30, v53, 9);
              goto LABEL_26;
            }
            v35 = objc_msgSend_isShare(v30, v53, v54) == 0;
            v37 = 2;
            v38 = 10;
          }
          if (v35)
            objc_msgSend_setState_(v30, v36, v37);
          else
            objc_msgSend_setState_(v30, v36, v38);
LABEL_26:
          objc_msgSend_setNeedsRefetch_(v30, v55, 0);
          objc_msgSend_setHaveOutstandingHandlers_(self, v56, 1);
          objc_msgSend_updateCloudKitMetrics_(self, v57, (uint64_t)&unk_1E7837280);
LABEL_27:
          if (v27 != ++v29)
            continue;
          v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v60, v64, 16);
          if (!v27)
            goto LABEL_29;
          goto LABEL_10;
        case 14:
          goto LABEL_27;
        default:
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v25, v26);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend_state(v30, v41, v42);
          v46 = objc_msgSend_state(self, v44, v45);
          objc_msgSend_modifyHandlersByZoneID(self, v47, v48);
          v49 = v3;
          v50 = v15;
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v52, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 786, CFSTR("Unexpected handler state in default zone %ld %ld %@"), v43, v46, v51);

          v15 = v50;
          v3 = v49;
          v22 = v58;

          goto LABEL_27;
      }
    }
  }
LABEL_29:

}

- (void)_performCallbacksForAtomicZoneHandlers:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  BOOL v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  BOOL v30;
  BOOL v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  id v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
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
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  id v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  void *v86;
  const char *v87;
  uint64_t v88;
  unint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v93;
  uint64_t v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  id v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t j;
  void *v119;
  uint64_t v120;
  const char *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  id obj;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7 = objc_msgSend_saveAttempts(self, v5, v6);
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_PCSRetryCount(v10, v11, v12);
  v14 = v7 <= v13;

  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)CFSTR("PreventRecordModifyRetries"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v20 = 0;
    else
      v20 = v7 <= v13;
    v14 = v20;
  }
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  v21 = v4;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v148, v155, 16);
  obj = v21;
  if (v23)
  {
    v26 = v23;
    v27 = 0;
    v28 = 0;
    v29 = *(_QWORD *)v149;
    v30 = v14;
    v31 = !v14;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v149 != v29)
          objc_enumerationMutation(obj);
        v33 = objc_msgSend_state(*(void **)(*((_QWORD *)&v148 + 1) + 8 * v32), v24, v25);
        if (v33 <= 0xD)
        {
          if (((1 << v33) & 0x6FF) != 0)
          {
            objc_msgSend_setHaveOutstandingHandlers_(self, v24, 1);
          }
          else if (((1 << v33) & 0x2800) != 0)
          {
            v27 |= v30;
            v28 |= v31;
          }
          else if (v33 == 12)
          {
            v28 = 1;
          }
        }
        ++v32;
      }
      while (v26 != v32);
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v148, v155, 16);
      v26 = v34;
    }
    while (v34);
    v21 = obj;

    if ((v28 & 1) != 0)
    {
      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      v37 = obj;
      v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v144, v154, 16);
      if (v39)
      {
        v42 = v39;
        v43 = *(_QWORD *)v145;
        v133 = *MEMORY[0x1E0C94B20];
        do
        {
          v44 = 0;
          do
          {
            if (*(_QWORD *)v145 != v43)
              objc_enumerationMutation(v37);
            v45 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v44);
            switch(objc_msgSend_state(v45, v40, v41))
            {
              case 0:
              case 1:
              case 2:
              case 3:
              case 4:
              case 5:
              case 6:
              case 7:
              case 9:
              case 10:
              case 11:
              case 12:
                objc_msgSend_setState_(v45, v40, 14);
                objc_msgSend_error(v45, v46, v47);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                if (v50)
                  goto LABEL_33;
                v51 = (void *)MEMORY[0x1E0C94FF8];
                objc_msgSend_recordID(v45, v48, v49);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_errorWithDomain_code_format_(v51, v53, v133, 2024, CFSTR("Record %@ will not be saved because of previous error in atomic zone"), v52);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_32;
              case 8:
                objc_msgSend_setState_(v45, v40, 14);
                objc_msgSend_callbackWithMetadata_error_(self, v57, (uint64_t)v45, 0);
                break;
              case 13:
                objc_msgSend_setState_(v45, v40, 14);
                v58 = (void *)MEMORY[0x1E0C94FF8];
                objc_msgSend_error(v45, v59, v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_recordID(v45, v62, v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_errorWithDomain_code_error_format_(v58, v65, v133, 2055, v61, CFSTR("Record %@ will not be saved but can be retried as is"), v64);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_32:
                objc_msgSend_CKClientSuitableError(v54, v55, v56);
                v50 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
                objc_msgSend_callbackWithMetadata_error_(self, v48, (uint64_t)v45, v50);

                break;
              case 14:
                break;
              default:
                objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v40, v41);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = objc_msgSend_state(v45, v67, v68);
                v72 = objc_msgSend_state(self, v70, v71);
                objc_msgSend_modifyHandlersByZoneID(self, v73, v74);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v66, v76, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 899, CFSTR("Unexpected handler state in failed atomic zone %ld %ld %@"), v69, v72, v75);

                break;
            }
            ++v44;
          }
          while (v42 != v44);
          v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v144, v154, 16);
          v42 = v77;
        }
        while (v77);
      }
LABEL_78:
      v21 = obj;

      goto LABEL_79;
    }
    if ((v27 & 1) != 0)
    {
      objc_msgSend_setHaveOutstandingHandlers_(self, v35, 1);
      objc_msgSend_updateCloudKitMetrics_(self, v78, (uint64_t)&unk_1E78372A0);
      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v79 = obj;
      v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v80, (uint64_t)&v140, v153, 16);
      if (v81)
      {
        v83 = v81;
        v84 = *(_QWORD *)v141;
        do
        {
          for (i = 0; i != v83; ++i)
          {
            if (*(_QWORD *)v141 != v84)
              objc_enumerationMutation(v79);
            v86 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * i);
            objc_msgSend_setError_(v86, v82, 0);
            v89 = objc_msgSend_state(v86, v87, v88);
            if (v89 < 0xC || v89 == 13)
            {
              if (objc_msgSend_isDelete(v86, v90, v91))
              {
                if (objc_msgSend__needsSigningPCS(self, v93, v94))
                  objc_msgSend_setState_(v86, v95, 2);
                else
                  objc_msgSend_setState_(v86, v95, 5);
              }
              else if (objc_msgSend_needsRefetch(v86, v93, v94))
              {
                objc_msgSend_setState_(v86, v96, 9);
              }
              else
              {
                if (objc_msgSend_isShare(v86, v96, v97))
                  v99 = 10;
                else
                  v99 = 2;
                objc_msgSend_setState_(v86, v98, v99);
              }
            }
            else
            {
              objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v90, v91);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = objc_msgSend_state(v86, v101, v102);
              v106 = objc_msgSend_state(self, v104, v105);
              objc_msgSend_modifyHandlersByZoneID(self, v107, v108);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v100, v110, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 940, CFSTR("Unexpected handler state in retryable atomic zone %ld %ld %@"), v103, v106, v109);

            }
          }
          v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v82, (uint64_t)&v140, v153, 16);
        }
        while (v83);
      }
      goto LABEL_78;
    }
  }
  else
  {

  }
  if ((objc_msgSend_haveOutstandingHandlers(self, v35, v36) & 1) == 0)
  {
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v111 = v21;
    v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v112, (uint64_t)&v136, v152, 16);
    if (v113)
    {
      v116 = v113;
      v117 = *(_QWORD *)v137;
      do
      {
        for (j = 0; j != v116; ++j)
        {
          if (*(_QWORD *)v137 != v117)
            objc_enumerationMutation(v111);
          v119 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * j);
          v120 = objc_msgSend_state(v119, v114, v115);
          if (v120 != 14)
          {
            if (v120 == 8)
            {
              objc_msgSend_setState_(v119, v114, 14);
              objc_msgSend_callbackWithMetadata_error_(self, v121, (uint64_t)v119, 0);
            }
            else
            {
              objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v114, v115);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              v125 = objc_msgSend_state(v119, v123, v124);
              v128 = objc_msgSend_state(self, v126, v127);
              objc_msgSend_modifyHandlersByZoneID(self, v129, v130);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v122, v132, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 956, CFSTR("Unexpected handler state in failed atomic zone %ld %ld %@"), v125, v128, v131);

            }
          }
        }
        v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v114, (uint64_t)&v136, v152, 16);
      }
      while (v116);
    }
    goto LABEL_78;
  }
LABEL_79:

}

- (void)_performHandlerCallbacks
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  int isDefaultRecordZoneID;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend_setHaveOutstandingHandlers_(self, a2, 0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend_modifyHandlersByZoneID(self, v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v32, v36, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v33;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v15);
        objc_msgSend_modifyHandlersByZoneID(self, v11, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_msgSend_atomic(self, v20, v21);
        objc_msgSend_container(self, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clientSDKVersion(v25, v26, v27);
        if (CKLinkCheck48d9728e8c354416a38f82379cbb35e3())
        {

          if ((v22 & 1) == 0)
            goto LABEL_8;
        }
        else
        {
          isDefaultRecordZoneID = objc_msgSend_isDefaultRecordZoneID(v16, v28, v29);

          if ((v22 & ~isDefaultRecordZoneID & 1) == 0)
          {
LABEL_8:
            objc_msgSend__performCallbacksForNonAtomicZoneHandlers_(self, v30, (uint64_t)v19);
            goto LABEL_11;
          }
        }
        objc_msgSend__performCallbacksForAtomicZoneHandlers_(self, v30, (uint64_t)v19);
LABEL_11:

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v32, v36, 16);
    }
    while (v13);
  }

}

- (void)_determineEnvironment
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isAppleInternalInstall(v19, v4, v5) & 1) != 0)
  {
    objc_msgSend_container(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_cachedEnvironment(v8, v9, v10);

    if (v11 == -1)
    {
      objc_initWeak(&location, self);
      objc_msgSend_stateTransitionGroup(self, v12, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v14);

      objc_msgSend_container(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = sub_1BEBEE83C;
      v20[3] = &unk_1E78372C8;
      objc_copyWeak(&v21, &location);
      objc_msgSend_fetchServerEnvironmentForOperation_withCompletionHandler_(v17, v18, (uint64_t)self, v20);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
}

- (void)_fetchUserPublicKeys
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  void **v11;
  os_log_t *v12;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  os_log_t v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const __CFString *v47;
  void *v48;
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_requestNeedsUserPublicKeys(self, a2, v2))
  {
    objc_msgSend_userPublicKeys(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_count(v6, v7, v8);

    if (!v9)
    {
      v10 = (uint64_t *)MEMORY[0x1E0C95300];
      v11 = (void **)MEMORY[0x1E0C952F8];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v12 = (os_log_t *)MEMORY[0x1E0C952B0];
      v13 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v35 = v13;
        objc_msgSend_operationID(self, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = (uint64_t)v38;
        _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Fetching user public keys for operation %{public}@", buf, 0xCu);

      }
      objc_msgSend_container(self, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0;
      v21 = (void *)objc_msgSend_copyAllPublicKeysForService_withError_(v19, v20, 0, &v49);
      v22 = v49;

      v25 = objc_msgSend_count(v21, v23, v24);
      v26 = *v11;
      v27 = *v10;
      if (!v25 || v22)
      {
        if (v27 != -1)
          dispatch_once(MEMORY[0x1E0C95300], v26);
        v30 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v51 = (uint64_t)v22;
          _os_log_error_impl(&dword_1BE990000, v30, OS_LOG_TYPE_ERROR, "Error fetching current service public keys for user: %@", buf, 0xCu);
        }
        objc_msgSend_error(self, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
          objc_msgSend_setError_(self, v34, (uint64_t)v22);
      }
      else
      {
        if (v27 != -1)
          dispatch_once(MEMORY[0x1E0C95300], v26);
        v28 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
        {
          v39 = v28;
          v42 = objc_msgSend_count(v21, v40, v41);
          if ((unint64_t)objc_msgSend_count(v21, v43, v44) <= 1)
            v47 = &stru_1E7838F48;
          else
            v47 = CFSTR("s");
          objc_msgSend_operationID(self, v45, v46);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v51 = v42;
          v52 = 2114;
          v53 = v47;
          v54 = 2114;
          v55 = v48;
          _os_log_debug_impl(&dword_1BE990000, v39, OS_LOG_TYPE_DEBUG, "Fetched %lu user public key%{public}@ for operation %{public}@", buf, 0x20u);

        }
        objc_msgSend_setUserPublicKeys_(self, v29, (uint64_t)v21);
      }

    }
  }
}

- (void)_fetchContainerScopedUserID
{
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend_stateTransitionGroup(self, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v5);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEBEEC5C;
  v7[3] = &unk_1E78309E8;
  objc_copyWeak(&v8, &location);
  objc_msgSend_fetchContainerScopedUserID_(self, v6, (uint64_t)v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_applySideEffects
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BEBEED10;
  v2[3] = &unk_1E78372F0;
  v2[4] = self;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, a2, 0, v2);
}

- (id)_topoSortRecordsForHandlers:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  char v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  const char *v43;
  const char *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  id v59;
  id v60;
  id obj;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v10 = v4;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v68, v73, 16);
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v69 != v16)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend_record(v18, v13, v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend_addObject_(v5, v19, (uint64_t)v20);
          objc_msgSend_setObject_forKey_(v8, v21, (uint64_t)v18, v20);
        }
        else
        {
          objc_msgSend_addObject_(v9, v19, (uint64_t)v18);
        }

      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v68, v73, 16);
    }
    while (v15);
  }

  if (objc_msgSend_count(v5, v22, v23))
  {
    v24 = objc_alloc_init(MEMORY[0x1E0C95068]);
    v67 = 0;
    v26 = objc_msgSend_addRecords_error_(v24, v25, (uint64_t)v5, &v67);
    v27 = v67;
    v30 = v27;
    if ((v26 & 1) != 0)
    {
      v66 = v27;
      objc_msgSend_recordsByTopologicalSortWithError_(v24, v28, (uint64_t)&v66);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v66;

      if (v31)
      {
        v59 = v32;
        v60 = v24;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        obj = v31;
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v62, v72, 16);
        if (v36)
        {
          v38 = v36;
          v39 = 0;
          v40 = *(_QWORD *)v63;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v63 != v40)
                objc_enumerationMutation(obj);
              objc_msgSend_objectForKey_(v8, v37, *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setBatchRank_(v42, v43, v39 + j);
              objc_msgSend_addObject_(v9, v44, (uint64_t)v42);

            }
            v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v62, v72, 16);
            v39 += j;
          }
          while (v38);
        }
        v45 = obj;

        v46 = v9;
        v32 = v59;
        v24 = v60;
      }
      else
      {
        v52 = (void *)MEMORY[0x1E0C94FF8];
        v53 = *MEMORY[0x1E0C94B20];
        objc_msgSend_localizedDescription(v32, v33, v34);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v52, v55, v53, 1007, CFSTR("Invalid list of records: %@"), v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setError_(self, v57, (uint64_t)v56);

        v45 = 0;
        v46 = 0;
      }
    }
    else
    {
      v47 = (void *)MEMORY[0x1E0C94FF8];
      v48 = *MEMORY[0x1E0C94B20];
      objc_msgSend_localizedDescription(v27, v28, v29);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v47, v49, v48, 1007, CFSTR("Invalid list of records: %@"), v45);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(self, v51, (uint64_t)v50);

      v46 = 0;
      v32 = v30;
    }

  }
  else
  {
    v46 = v9;
  }

  return v46;
}

- (BOOL)_shouldToposortInContainerID:(id)a3
{
  return (objc_msgSend_specialContainerType(a3, a2, (uint64_t)a3) & 0xFFFFFFFFFFFFFFFELL) != 4;
}

- (BOOL)_topoSortRecords
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  char v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  int shouldToposortInContainerID;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
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
  uint8_t buf[4];
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_msgSend_container(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_maintainRecordUploadOrder(v7, v8, v9);

  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("SkipToposortingRecords"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v16 = 1;
    else
      v16 = v10;
    if ((v16 & 1) != 0)
    {
LABEL_18:
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v46 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v48 = v46;
        objc_msgSend_container(self, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_containerID(v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ckShortDescription(v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v63 = v57;
        _os_log_debug_impl(&dword_1BE990000, v48, OS_LOG_TYPE_DEBUG, "Skipping topo sort of all zones for container %{public}@", buf, 0xCu);

      }
      return 1;
    }
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_18;
  }
  objc_msgSend_container(self, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  shouldToposortInContainerID = objc_msgSend__shouldToposortInContainerID_(self, v21, (uint64_t)v20);

  if (!shouldToposortInContainerID)
    goto LABEL_18;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend_modifyHandlersByZoneID(self, v23, v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v58, v64, 16);
  if (v30)
  {
    v33 = v30;
    v34 = *(_QWORD *)v59;
    while (2)
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v59 != v34)
          objc_enumerationMutation(v28);
        v36 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend_modifyHandlersByZoneID(self, v31, v32);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v37, v38, v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__topoSortRecordsForHandlers_(self, v40, (uint64_t)v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v41)
        {

          return 0;
        }
        objc_msgSend_modifyHandlersByZoneID(self, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v44, v45, (uint64_t)v41, v36);

      }
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v58, v64, 16);
      if (v33)
        continue;
      break;
    }
  }

  return 1;
}

- (void)_fetchShareParticipants
{
  void *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  _QWORD v27[4];
  id v28;
  CKDModifyRecordsOperation *v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1BEBEF7B4;
  v30[3] = &unk_1E78372F0;
  v5 = v3;
  v31 = v5;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, v6, 10, v30);
  if (objc_msgSend_count(v5, v7, v8))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v12 = v9;
      objc_msgSend_allKeys(v5, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v15;
      _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Fetching participants for shares: %@", buf, 0xCu);

    }
    objc_msgSend_stateTransitionGroup(self, v10, v11);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v16);

    v17 = (void *)objc_opt_new();
    objc_msgSend_allKeys(v5, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecordIDs_(v17, v21, (uint64_t)v20);

    v32 = *MEMORY[0x1E0C94A10];
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)&v32, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDesiredKeys_(v17, v24, (uint64_t)v23);

    v25 = objc_opt_class();
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = sub_1BEBEF824;
    v27[3] = &unk_1E782E558;
    v28 = v5;
    v29 = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v26, v25, v17, v27);

  }
}

- (void)_prepareParentPCS
{
  uint64_t v2;
  int v4;
  const char *v5;
  const char *v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_saveAttempts(self, a2, v2);
  objc_msgSend_setSaveAttempts_(self, v5, (v4 + 1));
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_1BE9BB190;
  v44 = sub_1BE9BAE70;
  v45 = (id)objc_opt_new();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_1BEBEFEA4;
  v39[3] = &unk_1E7837318;
  v39[4] = &v40;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, v6, 2, v39);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = (id)v41[5];
  v9 = 0;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v35, v46, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v36;
    v14 = (_BYTE *)MEMORY[0x1E0C95280];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v7);
        v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend_handlersByRecordID(self, v10, v11, (_QWORD)v35);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v17, v18, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          if (!v9)
            v9 = (void *)objc_opt_new();
          objc_msgSend_setObject_forKeyedSubscript_(v9, v20, (uint64_t)v19, v16);
          objc_msgSend_record(v19, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWantsChainPCS_(v23, v24, 1);

          if (*v14)
          {
            objc_msgSend_unitTestOverrides(self, v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v27, v28, (uint64_t)CFSTR("SkipChainPCS"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              objc_msgSend_record(v19, v30, v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setWantsChainPCS_(v32, v33, 0);

            }
          }
        }

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v35, v46, 16);
    }
    while (v12);
  }

  objc_msgSend_setParentsByRecordID_(self, v34, (uint64_t)v9);
  _Block_object_dispose(&v40, 8);

}

- (void)_fetchSharePCSData
{
  void *v3;
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BEBF0104;
  v18[3] = &unk_1E7837340;
  v18[4] = self;
  v4 = v3;
  v19 = v4;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, v5, 1, v18);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v14, v20, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v6);
        objc_msgSend_fetchSharePCSData(*(void **)(*((_QWORD *)&v14 + 1) + 8 * v13++), v9, v10, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v14, v20, 16);
    }
    while (v11);
  }

}

- (BOOL)_needsSigningPCS
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  BOOL v12;

  objc_msgSend_container(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_useAnonymousToServerShareParticipants(v7, v8, v9))
    v12 = objc_msgSend_databaseScope(self, v10, v11) == 3;
  else
    v12 = 0;

  return v12;
}

- (void)_fetchRecordPCSData
{
  void *v3;
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BEBF0410;
  v18[3] = &unk_1E7837340;
  v18[4] = self;
  v4 = v3;
  v19 = v4;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, v5, 2, v18);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v14, v20, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v6);
        objc_msgSend_fetchRecordPCSData(*(void **)(*((_QWORD *)&v14 + 1) + 8 * v13++), v9, v10, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v14, v20, 16);
    }
    while (v11);
  }

}

- (void)assetArray:(id)a3 didFetchRecord:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
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
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
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
  char isEqualToData;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  char PropertiesWithAsset;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  id v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  int v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  NSObject *v97;
  const char *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  objc_class *v107;
  const char *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  char v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
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
  void *v162;
  const char *v163;
  void *v164;
  const char *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  const char *v170;
  NSObject *v171;
  objc_class *v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const __CFString *v181;
  const __CFString *v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  __CFString *v186;
  CKDModifyRecordsOperation *v187;
  uint64_t v188;
  id obj;
  id v190;
  void *v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _BYTE v200[128];
  uint8_t v201[128];
  uint8_t buf[4];
  void *v203;
  __int16 v204;
  CKDModifyRecordsOperation *v205;
  __int16 v206;
  void *v207;
  __int16 v208;
  uint64_t v209;
  __int16 v210;
  const __CFString *v211;
  __int16 v212;
  const __CFString *v213;
  uint64_t v214;

  v214 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = (void *)*MEMORY[0x1E0C952B0];
  v186 = v10;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v171 = v11;
    v172 = (objc_class *)objc_opt_class();
    NSStringFromClass(v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(self, v174, v175);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v9, v177, v178);
    v179 = objc_claimAutoreleasedReturnValue();
    v180 = (void *)v179;
    *(_DWORD *)buf = 138544642;
    v181 = CFSTR(" Error was ");
    v203 = v173;
    v182 = &stru_1E7838F48;
    v204 = 2048;
    if (!v10)
      v181 = &stru_1E7838F48;
    v205 = self;
    if (v10)
      v182 = v10;
    v206 = 2114;
    v207 = v176;
    v208 = 2112;
    v209 = v179;
    v210 = 2114;
    v211 = v181;
    v212 = 2112;
    v213 = v182;
    _os_log_debug_impl(&dword_1BE990000, v171, OS_LOG_TYPE_DEBUG, "Record fetcher <%{public}@: %p; %{public}@> fetched a record with ID %@.%{public}@%@",
      buf,
      0x3Eu);

  }
  v198 = 0u;
  v199 = 0u;
  v196 = 0u;
  v197 = 0u;
  obj = v8;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v196, v201, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v197;
    v184 = *MEMORY[0x1E0C94B20];
    v185 = *(_QWORD *)v197;
    v187 = self;
    v183 = v9;
    do
    {
      v16 = 0;
      v188 = v14;
      do
      {
        if (*(_QWORD *)v197 != v15)
          objc_enumerationMutation(obj);
        v17 = *(id *)(*((_QWORD *)&v196 + 1) + 8 * v16);
        objc_msgSend_handlersByAssetNeedingRecordFetch(self, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v20, v21, (uint64_t)v17);
        v191 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          objc_msgSend_assetReference(v17, v22, v23);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_fieldName(v32, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v9, v36, (uint64_t)v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v38 = v9;
            v39 = v37;
            v40 = v37;
            v43 = objc_msgSend_reReferenceItemID(v40, v41, v42);
            objc_msgSend_setReReferenceItemID_(v17, v44, v43);
            objc_msgSend_signature(v40, v45, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_assetReference(v17, v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_fileSignature(v50, v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToData = objc_msgSend_isEqualToData_(v47, v54, (uint64_t)v53);

            objc_msgSend_assetRereferenceInfo(v17, v56, v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = v58;
            if ((isEqualToData & 1) != 0)
            {
              PropertiesWithAsset = objc_msgSend_validateAndSetRecordFetchPropertiesWithAsset_(v58, v59, (uint64_t)v40);

              if ((PropertiesWithAsset & 1) == 0)
              {
                objc_msgSend_assetRereferenceInfo(v17, v63, v64);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_error(v65, v66, v67);
                v68 = (void *)objc_claimAutoreleasedReturnValue();

                v15 = v185;
                v10 = v186;
                v14 = v188;
                if (!v68)
                {
                  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v69, v184, 1, CFSTR("the referenced asset %@ has missing information"), v40);
                  goto LABEL_35;
                }
LABEL_41:

                v30 = v39;
                v9 = v38;
                self = v187;
                goto LABEL_47;
              }
LABEL_33:
              v15 = v185;
              v10 = v186;
LABEL_40:
              v14 = v188;
              goto LABEL_41;
            }
            objc_msgSend_error(v58, v59, v60);
            v103 = (void *)objc_claimAutoreleasedReturnValue();

            if (v103)
              goto LABEL_33;
            v123 = (void *)MEMORY[0x1E0C94FF8];
            objc_msgSend_assetReference(v17, v104, v105);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_fileSignature(v109, v124, v125);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_signature(v40, v126, v127);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(v123, v129, v184, 1, CFSTR("the referencing asset's signature %@ and the referenced asset's signature %@ don't match"), v112, v128);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_assetRereferenceInfo(v17, v131, v132);
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setError_(v133, v134, (uint64_t)v130);

            v15 = v185;
            v10 = v186;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v70 = v37;
              v192 = 0u;
              v193 = 0u;
              v194 = 0u;
              v195 = 0u;
              v190 = v70;
              v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v190, v71, (uint64_t)&v192, v200, 16);
              if (v72)
              {
                v73 = v72;
                v74 = *(_QWORD *)v193;
                while (2)
                {
                  for (i = 0; i != v73; ++i)
                  {
                    if (*(_QWORD *)v193 != v74)
                      objc_enumerationMutation(v190);
                    v76 = *(id *)(*((_QWORD *)&v192 + 1) + 8 * i);
                    objc_msgSend_signature(v76, v77, v78);
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_assetReference(v17, v80, v81);
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_fileSignature(v82, v83, v84);
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    v87 = objc_msgSend_isEqualToData_(v79, v86, (uint64_t)v85);

                    if (v87)
                    {
                      v114 = objc_msgSend_reReferenceItemID(v76, v88, v89);
                      objc_msgSend_setReReferenceItemID_(v17, v115, v114);
                      objc_msgSend_assetRereferenceInfo(v17, v116, v117);
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      v120 = objc_msgSend_validateAndSetRecordFetchPropertiesWithAsset_(v118, v119, (uint64_t)v76);

                      if ((v120 & 1) != 0)
                      {
                        v99 = v190;
                        v10 = v186;
                        self = v187;
                        v9 = v183;
                        v15 = v185;
                        v14 = v188;
                      }
                      else
                      {
                        objc_msgSend_assetRereferenceInfo(v17, v121, v122);
                        v135 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_error(v135, v136, v137);
                        v138 = (void *)objc_claimAutoreleasedReturnValue();

                        v10 = v186;
                        self = v187;
                        v9 = v183;
                        v15 = v185;
                        v14 = v188;
                        if (!v138)
                        {
                          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v139, v184, 1, CFSTR("the referenced asset %@ has missing information"), v76);
                          v140 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_assetRereferenceInfo(v17, v141, v142);
                          v143 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_setError_(v143, v144, (uint64_t)v140);

                        }
                        v99 = v190;
                      }
                      goto LABEL_45;
                    }

                  }
                  v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v190, v90, (uint64_t)&v192, v200, 16);
                  if (v73)
                    continue;
                  break;
                }
              }

              objc_msgSend_assetRereferenceInfo(v17, v91, v92);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_error(v93, v94, v95);
              v96 = (void *)objc_claimAutoreleasedReturnValue();

              v10 = v186;
              self = v187;
              v9 = v183;
              v15 = v185;
              v14 = v188;
              if (!v96)
              {
                if (*MEMORY[0x1E0C95300] != -1)
                  dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                v97 = *MEMORY[0x1E0C952B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_1BE990000, v97, OS_LOG_TYPE_ERROR, "re-referenced asset signature not found in source asset array", buf, 2u);
                }
                objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v98, v184, 3011, CFSTR("Re-referenced asset signature not found in source asset array"));
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_assetRereferenceInfo(v17, v100, v101);
                v76 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setError_(v76, v102, (uint64_t)v99);
LABEL_45:

              }
              v30 = v190;

              goto LABEL_47;
            }
            v38 = v9;
            v106 = (void *)MEMORY[0x1E0C94FF8];
            v39 = v37;
            v107 = (objc_class *)objc_opt_class();
            NSStringFromClass(v107);
            v40 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_format_(v106, v108, v184, 1, CFSTR("Can't handle fieldValue %@"), v40);
LABEL_35:
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_assetRereferenceInfo(v17, v110, v111);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setError_(v112, v113, (uint64_t)v109);
          }

          goto LABEL_40;
        }
        objc_msgSend_assetRereferenceInfo(v17, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_error(v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          goto LABEL_48;
        objc_msgSend_assetRereferenceInfo(v17, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setError_(v30, v31, (uint64_t)v10);
LABEL_47:

LABEL_48:
        objc_msgSend_assetRereferenceInfo(v17, v28, v29);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_error(v145, v146, v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();

        if (v148)
        {
          objc_msgSend_assetRereferenceInfo(v17, v149, v150);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_destinationFieldName(v151, v152, v153);
          v154 = (void *)objc_claimAutoreleasedReturnValue();

          if (v154)
          {
            objc_msgSend_rereferencedAssetArrayByFieldname(v191, v155, v156);
            v157 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v157)
            {
              v160 = (void *)objc_opt_new();
              objc_msgSend_setRereferencedAssetArrayByFieldname_(v191, v161, (uint64_t)v160);

            }
            objc_msgSend_rereferencedAssetArrayByFieldname(v191, v158, v159);
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v162, v163, (uint64_t)v154);
            v164 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v164)
            {
              v164 = (void *)objc_opt_new();
              objc_msgSend_rereferencedAssetArrayByFieldname(v191, v166, v167);
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v168, v169, (uint64_t)v164, v154);

            }
            objc_msgSend_addObject_(v164, v165, (uint64_t)v17);

          }
        }

        ++v16;
      }
      while (v16 != v14);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v170, (uint64_t)&v196, v201, 16);
    }
    while (v14);
  }

}

- (void)packageArray:(id)a3 didFetchRecord:(id)a4 error:(id)a5
{
  id v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  id v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
  void *v67;
  id v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  const char *v80;
  void *v81;
  const char *v82;
  id v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  id v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  CKDModifyRecordsOperation *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id v107;
  void *v108;
  id obj;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  uint8_t v123[128];
  uint8_t buf[4];
  id v125;
  __int16 v126;
  void *v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v107 = a4;
  v98 = a5;
  if (!v98)
  {
    v103 = self;
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v118, v123, 16);
    if (!v15)
      goto LABEL_28;
    v18 = v15;
    v19 = *(_QWORD *)v119;
    v102 = *MEMORY[0x1E0C94B20];
    v99 = *(_QWORD *)v119;
    v100 = v8;
LABEL_8:
    v20 = 0;
    v101 = v18;
    while (1)
    {
      if (*(_QWORD *)v119 != v19)
        objc_enumerationMutation(v8);
      v21 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v20);
      objc_msgSend_packageReference(v21, v16, v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fieldName(v22, v23, v24);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v107, v25, (uint64_t)v113);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend_handlersByAssetNeedingRecordFetch(v103, v27, v28);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v45, v46, (uint64_t)v21);
      v47 = v8;
      v48 = objc_claimAutoreleasedReturnValue();

      v49 = (void *)v48;
      v8 = v47;
      objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E0C94FF8], v50, v102, 3011, 0, CFSTR("One or more referenced asset do not exist"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v49, v51, (uint64_t)v32);
LABEL_26:

      if (++v20 == v18)
      {
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v16, (uint64_t)&v118, v123, 16);
        if (!v18)
          goto LABEL_28;
        goto LABEL_8;
      }
    }
    v112 = v21;
    v29 = v26;
    objc_msgSend_signature(v22, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signature(v29, v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v26;
    v108 = v29;
    if (v32)
    {
      if ((objc_msgSend_isEqualToData_(v32, v35, (uint64_t)v36) & 1) == 0)
      {
        objc_msgSend_handlersByAssetNeedingRecordFetch(v103, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v39, v40, (uint64_t)v112);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E0C94FF8], v42, v102, 5022, 0, CFSTR("Package signature %@ does not match re-reference signature %@."), v36, v32);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setError_(v41, v44, (uint64_t)v43);

LABEL_25:
        v26 = v106;
        v49 = v108;
        goto LABEL_26;
      }
    }
    else
    {
      objc_msgSend_setSignature_(v22, v35, (uint64_t)v36);
    }
    v104 = v32;
    v105 = v20;

    v52 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend_assets(v108, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend_count(v55, v56, v57);
    objc_msgSend_arrayWithCapacity_(v52, v59, v58);
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    objc_msgSend_assets(v108, v60, v61);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v62, (uint64_t)&v114, v122, 16);
    if (v63)
    {
      v64 = v63;
      v65 = 0;
      v110 = *(_QWORD *)v115;
      do
      {
        for (i = 0; i != v64; ++i)
        {
          if (*(_QWORD *)v115 != v110)
            objc_enumerationMutation(obj);
          v67 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
          v68 = objc_alloc(MEMORY[0x1E0C94BD8]);
          objc_msgSend_recordID(v22, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v22;
          v75 = objc_msgSend_databaseScope(v22, v72, v73);
          objc_msgSend_signature(v67, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v75;
          v22 = v74;
          v81 = (void *)objc_msgSend_initWithExistingRecordID_databaseScope_fieldName_fileSignature_(v68, v80, (uint64_t)v71, v79, v113, v78);

          objc_msgSend_setIsPackageMember_(v81, v82, 1);
          v83 = objc_alloc(MEMORY[0x1E0C94BB8]);
          v85 = (void *)objc_msgSend_initWithAssetReference_(v83, v84, (uint64_t)v81);
          v88 = objc_msgSend_reReferenceItemID(v67, v86, v87);
          objc_msgSend_setReReferenceItemID_(v85, v89, v88);
          objc_msgSend_setArrayIndex_(v85, v90, v65 + i);
          objc_msgSend_boundaryKey(v112, v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setBoundaryKey_(v85, v94, (uint64_t)v93);

          objc_msgSend_addObject_(v111, v95, (uint64_t)v85);
        }
        v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v96, (uint64_t)&v114, v122, 16);
        v65 += i;
      }
      while (v64);
    }

    v36 = v111;
    objc_msgSend_setAssets_(v112, v97, (uint64_t)v111);
    v19 = v99;
    v8 = v100;
    v18 = v101;
    v32 = v104;
    v20 = v105;
    goto LABEL_25;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v10 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    objc_msgSend_recordID(v107, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v125 = v98;
    v126 = 2112;
    v127 = v14;
    _os_log_error_impl(&dword_1BE990000, v11, OS_LOG_TYPE_ERROR, "Encountered error %@ when fetching record with recordID %@ for package cloning", buf, 0x16u);

  }
LABEL_28:

}

- (void)_didCompleteRecordFetchOperation:(id)a3 assetArrayByRecordID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  const char *v21;
  uint64_t v22;
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
  uint64_t v35;
  void *v36;
  id v37;
  CKDModifyRecordsOperation *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  id v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v54;
  _QWORD *v55;
  os_log_t *v56;
  os_log_t v57;
  const char *v58;
  uint64_t v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  os_log_t v69;
  const char *v70;
  uint64_t v71;
  NSObject *v72;
  objc_class *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[4];
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  id v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  CKDModifyRecordsOperation *v92;
  __int16 v93;
  void *v94;
  const __CFString *v95;
  id v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_error(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v78 = v6;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    objc_msgSend_keyEnumerator(v7, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v83, v97, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v84;
      v79 = *MEMORY[0x1E0C94B20];
      v80 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v84 != v18)
            objc_enumerationMutation(v13);
          objc_msgSend_objectForKeyedSubscript_(v7, v16, *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v20, v21, v22))
          {
            objc_msgSend_handlersByAssetNeedingRecordFetch(self, v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_firstObject(v20, v26, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v25, v29, (uint64_t)v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_error(v30, v31, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
            {
              v36 = v13;
              v37 = v7;
              v38 = self;
              objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v34, v35);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_rereferencedAssetArrayByFieldname(v30, v40, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v81[0] = MEMORY[0x1E0C809B0];
              v81[1] = 3221225472;
              v81[2] = sub_1BEBF18B4;
              v81[3] = &unk_1E7837388;
              v43 = v39;
              v82 = v43;
              objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v42, v44, (uint64_t)v81);

              if (objc_msgSend_count(v43, v45, v46))
              {
                objc_msgSend_setState_(v30, v47, 12);
                v48 = (void *)MEMORY[0x1E0C94FF8];
                v95 = CFSTR("FailedAssetsByFieldName");
                v96 = v43;
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v49, (uint64_t)&v96, &v95, 1);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_errorWithDomain_code_userInfo_format_(v48, v51, v79, 3011, v50, CFSTR("One or more referenced asset do not exist"));
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setError_(v30, v53, (uint64_t)v52);

              }
              self = v38;
              v7 = v37;
              v13 = v36;
              v18 = v80;
            }

          }
        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v83, v97, 16);
      }
      while (v17);
    }

    v6 = v78;
  }
  objc_msgSend_error(v6, v11, v12);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = (_QWORD *)MEMORY[0x1E0C95300];
  v56 = (os_log_t *)MEMORY[0x1E0C952B0];
  if (v54)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v57 = *v56;
    if (os_log_type_enabled(*v56, OS_LOG_TYPE_INFO))
    {
      v60 = v57;
      objc_msgSend_error(v6, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v88 = v63;
      _os_log_impl(&dword_1BE990000, v60, OS_LOG_TYPE_INFO, "Error fetching records: %@", buf, 0xCu);

    }
    objc_msgSend_error(self, v58, v59);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v64)
    {
      objc_msgSend_error(v6, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(self, v68, (uint64_t)v67);

    }
  }
  if (*v55 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v69 = *v56;
  if (os_log_type_enabled(*v56, OS_LOG_TYPE_DEBUG))
  {
    v72 = v69;
    v73 = (objc_class *)objc_opt_class();
    NSStringFromClass(v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(self, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v88 = v6;
    v89 = 2114;
    v90 = v74;
    v91 = 2048;
    v92 = self;
    v93 = 2114;
    v94 = v77;
    _os_log_debug_impl(&dword_1BE990000, v72, OS_LOG_TYPE_DEBUG, "Fetch records operation %p completed for <%{public}@: %p; %{public}@>",
      buf,
      0x2Au);

  }
  objc_msgSend_hash(self, v70, v71);
  kdebug_trace();

}

- (void)_batchFetchAssetRecordsForRereferencing
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  CKDModifyRecordsOperationReReferenceBatchKey *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  void *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  unint64_t v88;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  id v98;
  void *v99;
  uint64_t v100;
  id v101;
  const char *v102;
  id obj;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t j;
  void *v110;
  id v111;
  _QWORD v112[5];
  id v113;
  uint64_t v114;
  SEL v115;
  _QWORD v116[5];
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t, uint64_t);
  void (*v129)(uint64_t);
  NSMutableDictionary *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  objc_msgSend_handlersByAssetNeedingRecordFetch(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyEnumerator(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v131, v137, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v132;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v132 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v13;
          if ((objc_msgSend_isReference(v15, v16, v17) & 1) == 0)
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v33, v34, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 1450, CFSTR("Expected isReference %@"), v15);

          }
          v20 = [CKDModifyRecordsOperationReReferenceBatchKey alloc];
          v22 = (void *)objc_msgSend_initWithAsset_(v20, v21, (uint64_t)v15);
          objc_msgSend_objectForKeyedSubscript_(v110, v23, (uint64_t)v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v24, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v110, v27, (uint64_t)v26, v22);
          }
          objc_msgSend_addObject_(v26, v24, (uint64_t)v15);
          objc_msgSend_assetRereferenceInfo(v15, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clearRecordFetchProperties(v30, v31, v32);

        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v14, (uint64_t)&v131, v137, 16);
    }
    while (v10);
  }

  v125 = 0;
  v126 = &v125;
  v127 = 0x3032000000;
  v128 = sub_1BE9BB190;
  v129 = sub_1BE9BAE70;
  v130 = self->_cloneContextsBySignature;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  objc_msgSend_allKeys(v110, v35, v36);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v121, v136, 16);
  if (v106)
  {
    v105 = *(_QWORD *)v122;
    do
    {
      for (j = 0; j != v106; ++j)
      {
        if (*(_QWORD *)v122 != v105)
          objc_enumerationMutation(obj);
        v40 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * j);
        objc_msgSend_set(MEMORY[0x1E0C99E20], v38, v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_set(MEMORY[0x1E0C99E20], v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v110, v45, v40);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = (void *)v40;
        v47 = (void *)objc_opt_new();
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v111 = v46;
        v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v48, (uint64_t)&v117, v135, 16);
        if (v51)
        {
          v52 = *(_QWORD *)v118;
          do
          {
            for (k = 0; k != v51; ++k)
            {
              if (*(_QWORD *)v118 != v52)
                objc_enumerationMutation(v111);
              v54 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * k);
              objc_msgSend_assetReference(v54, v49, v50);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(v55, v56, v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_objectForKeyedSubscript_(v47, v59, (uint64_t)v58);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v61)
              {
                v61 = (void *)objc_opt_new();
                objc_msgSend_setObject_forKeyedSubscript_(v47, v62, (uint64_t)v61, v58);
              }
              objc_msgSend_addObject_(v61, v60, (uint64_t)v54);
              objc_msgSend_addObject_(v44, v63, (uint64_t)v58);
              objc_msgSend_assetReference(v54, v64, v65);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_fieldName(v66, v67, v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v41, v70, (uint64_t)v69);

            }
            v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v49, (uint64_t)&v117, v135, 16);
          }
          while (v51);
        }

        v71 = (void *)objc_opt_new();
        objc_msgSend_allObjects(v44, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRecordIDs_(v71, v75, (uint64_t)v74);

        objc_msgSend_allObjects(v41, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDesiredKeys_(v71, v79, (uint64_t)v78);

        objc_msgSend_container(self, v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_options(v82, v83, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend_mmcsEncryptionSupport(v85, v86, v87);
        objc_msgSend_setShouldFetchAssetContent_(v71, v89, (v88 >> 1) & 1);

        objc_msgSend_setShouldFetchAssetContent_(v71, v90, 1);
        objc_msgSend_setFetchingAssetsForRereference_(v71, v91, 1);
        v94 = objc_msgSend_databaseScope(v107, v92, v93);
        if (objc_msgSend_isClone(v107, v95, v96))
        {
          if (!v126[5])
          {
            v98 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v99 = (void *)v126[5];
            v126[5] = (uint64_t)v98;

            objc_storeStrong((id *)&self->_cloneContextsBySignature, (id)v126[5]);
          }
          v116[0] = MEMORY[0x1E0C809B0];
          v116[1] = 3221225472;
          v116[2] = sub_1BEBF2094;
          v116[3] = &unk_1E78373B0;
          v116[4] = &v125;
          objc_msgSend_setCloneContextReturnBlock_(v71, v97, (uint64_t)v116);
        }
        v100 = objc_opt_class();
        v112[0] = MEMORY[0x1E0C809B0];
        v112[1] = 3221225472;
        v112[2] = sub_1BEBF2240;
        v112[3] = &unk_1E78373D8;
        v112[4] = self;
        v114 = v94;
        v115 = a2;
        v101 = v47;
        v113 = v101;
        objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v102, v100, v71, v112);

      }
      v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v121, v136, 16);
    }
    while (v106);
  }

  _Block_object_dispose(&v125, 8);
}

- (void)_fetchPackageRecordsForRereferencing
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  CKDModifyRecordsOperationReReferenceBatchKey *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  id v88;
  void *v89;
  uint64_t v90;
  id v91;
  const char *v92;
  id obj;
  uint64_t v95;
  uint64_t v96;
  void *v98;
  uint64_t j;
  void *v100;
  id v101;
  _QWORD v102[5];
  id v103;
  uint64_t v104;
  SEL v105;
  _QWORD v106[5];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  NSMutableDictionary *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  objc_msgSend_handlersByAssetNeedingRecordFetch(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyEnumerator(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v121, v127, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v122;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v122 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v13;
          if ((objc_msgSend_isReference(v15, v16, v17) & 1) == 0)
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 1546, CFSTR("Expect package %@ to be a reference"), v15);

          }
          v20 = [CKDModifyRecordsOperationReReferenceBatchKey alloc];
          v22 = (void *)objc_msgSend_initWithPackage_(v20, v21, (uint64_t)v15);
          objc_msgSend_objectForKeyedSubscript_(v100, v23, (uint64_t)v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v24, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v100, v27, (uint64_t)v26, v22);
          }
          objc_msgSend_addObject_(v26, v24, (uint64_t)v15);

        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v14, (uint64_t)&v121, v127, 16);
    }
    while (v10);
  }

  v30 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_allKeys(v100, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v30, v34, (uint64_t)v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v115 = 0;
  v116 = &v115;
  v117 = 0x3032000000;
  v118 = sub_1BE9BB190;
  v119 = sub_1BE9BAE70;
  v120 = self->_cloneContextsBySignature;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  obj = v35;
  v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v111, v126, 16);
  if (v96)
  {
    v95 = *(_QWORD *)v112;
    do
    {
      for (j = 0; j != v96; ++j)
      {
        if (*(_QWORD *)v112 != v95)
          objc_enumerationMutation(obj);
        v39 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * j);
        objc_msgSend_set(MEMORY[0x1E0C99E20], v37, v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_set(MEMORY[0x1E0C99E20], v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v100, v44, v39);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = (void *)v39;
        v46 = (void *)objc_opt_new();
        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        v101 = v45;
        v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v101, v47, (uint64_t)&v107, v125, 16);
        if (v50)
        {
          v51 = *(_QWORD *)v108;
          do
          {
            for (k = 0; k != v50; ++k)
            {
              if (*(_QWORD *)v108 != v51)
                objc_enumerationMutation(v101);
              v53 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * k);
              objc_msgSend_packageReference(v53, v48, v49);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(v54, v55, v56);
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_objectForKeyedSubscript_(v46, v58, (uint64_t)v57);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v61)
              {
                objc_msgSend_array(MEMORY[0x1E0C99DE8], v59, v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v46, v62, (uint64_t)v61, v57);
              }
              objc_msgSend_addObject_(v61, v59, (uint64_t)v53);
              objc_msgSend_addObject_(v43, v63, (uint64_t)v57);
              objc_msgSend_packageReference(v53, v64, v65);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_fieldName(v66, v67, v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v40, v70, (uint64_t)v69);

            }
            v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v101, v48, (uint64_t)&v107, v125, 16);
          }
          while (v50);
        }

        v71 = (void *)objc_opt_new();
        objc_msgSend_allObjects(v43, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRecordIDs_(v71, v75, (uint64_t)v74);

        objc_msgSend_allObjects(v40, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDesiredKeys_(v71, v79, (uint64_t)v78);

        objc_msgSend_setShouldFetchAssetContent_(v71, v80, 1);
        objc_msgSend_setFetchingAssetsForRereference_(v71, v81, 1);
        v84 = objc_msgSend_databaseScope(v98, v82, v83);
        if (objc_msgSend_isClone(v98, v85, v86))
        {
          if (!v116[5])
          {
            v88 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v89 = (void *)v116[5];
            v116[5] = (uint64_t)v88;

            objc_storeStrong((id *)&self->_cloneContextsBySignature, (id)v116[5]);
          }
          v106[0] = MEMORY[0x1E0C809B0];
          v106[1] = 3221225472;
          v106[2] = sub_1BEBF2D84;
          v106[3] = &unk_1E78373B0;
          v106[4] = &v115;
          objc_msgSend_setCloneContextReturnBlock_(v71, v87, (uint64_t)v106);
        }
        v90 = objc_opt_class();
        v102[0] = MEMORY[0x1E0C809B0];
        v102[1] = 3221225472;
        v102[2] = sub_1BEBF2F30;
        v102[3] = &unk_1E78373D8;
        v102[4] = self;
        v104 = v84;
        v105 = a2;
        v91 = v46;
        v103 = v91;
        objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v92, v90, v71, v102);

      }
      v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v111, v126, 16);
    }
    while (v96);
  }

  _Block_object_dispose(&v115, 8);
}

- (void)_fetchRecordsForRereferencing
{
  uint64_t v2;
  void *v5;
  id v6;
  const char *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  SEL v15;

  objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEBF3404;
  v13[3] = &unk_1E7837400;
  v14 = v5;
  v15 = a2;
  v13[4] = self;
  v6 = v5;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, v7, 3, v13);
  objc_msgSend_setHandlersByAssetNeedingRecordFetch_(self, v8, (uint64_t)v6);
  objc_msgSend__fetchPackageRecordsForRereferencing(self, v9, v10);
  objc_msgSend__batchFetchAssetRecordsForRereferencing(self, v11, v12);

}

- (void)_prepareForUpload
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend__prepareAssetsForUpload(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHandlersByAsset_(self, v5, (uint64_t)v4);

  objc_msgSend_handlersByAsset(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v8, v9, v10);

  if (v11)
  {
    objc_msgSend_container(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_mmcsEncryptionSupport(v17, v18, v19);

    if (v20 != 1)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      objc_msgSend_handlersByAsset(self, v21, v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_keyEnumerator(v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v63, v67, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v64;
        while (2)
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v64 != v30)
              objc_enumerationMutation(v26);
            v32 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v31);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v33 = v32;
              objc_msgSend_container(self, v34, v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_options(v36, v37, v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_mmcsEncryptionSupport(v39, v40, v41) == 2
                || (objc_msgSend_useMMCSEncryptionV2(v33, v42, v43) & 1) != 0)
              {
                objc_msgSend_boundaryKey(v33, v42, v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v44)
                  goto LABEL_25;
              }
              else
              {

              }
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = v32;
              objc_msgSend_container(self, v47, v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_options(v49, v50, v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_mmcsEncryptionSupport(v52, v53, v54) == 2
                || (objc_msgSend_useMMCSEncryptionV2(v46, v55, v56) & 1) != 0)
              {
                objc_msgSend_boundaryKey(v46, v55, v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v57)
                {
LABEL_25:

                  objc_msgSend_cachedGlobalPerUserBoundaryKeyData(self, v58, v59);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v60)
                    objc_msgSend__fetchGlobalPerUserBoundaryKey(self, v61, v62);
                  return;
                }
              }
              else
              {

              }
            }
            ++v31;
          }
          while (v29 != v31);
          v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v45, (uint64_t)&v63, v67, 16);
          if (v29)
            continue;
          break;
        }
      }

    }
  }
}

- (id)_prepareAssetsForUpload
{
  uint64_t v2;
  void *v4;
  id v5;
  const char *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x1E0CB3748], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BEBF390C;
  v8[3] = &unk_1E78372F0;
  v5 = v4;
  v9 = v5;
  objc_msgSend__enumerateHandlersInState_withBlock_(self, v6, 4, v8);

  return v5;
}

- (void)_fetchGlobalPerUserBoundaryKey
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id location;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (id)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_operationID(self, v4, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v18;
    _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "Fetching user boundary key for operation %{public}@", buf, 0xCu);

  }
  objc_msgSend_stateTransitionGroup(self, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v8);

  objc_msgSend_noteOperationWillWaitOnPCS(self, v9, v10);
  objc_msgSend_container(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEBF3CB0;
  v19[3] = &unk_1E7837428;
  objc_copyWeak(&v20, &location);
  v19[4] = self;
  objc_msgSend_globalPerUserBoundaryKeyDataWithCompletionHandler_(v16, v17, (uint64_t)v19);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)_uploadAssets
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  os_log_t *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  char v25;
  const char *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t shouldCloneFileInAssetCache;
  const char *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  os_log_t v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  _QWORD v65[5];
  id v66;
  SEL v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  objc_msgSend_handlersByAsset(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v5, v6, v7))
  {
    objc_msgSend_keyEnumerator(v5, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (_QWORD *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v15 = (os_log_t *)MEMORY[0x1E0C952B0];
    v16 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v61 = v16;
      objc_msgSend_operationID(self, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v64;
      v70 = 2112;
      v71 = v13;
      _os_log_debug_impl(&dword_1BE990000, v61, OS_LOG_TYPE_DEBUG, "Uploading assets for operation %{public}@: %@", buf, 0x16u);

    }
    objc_msgSend_container(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_mmcsEncryptionSupport(v22, v23, v24);

    if ((v25 & 2) != 0)
    {
      objc_msgSend__setBoundaryKeyOnAssetsToUpload_(self, v26, (uint64_t)v13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend_count(v27, v33, v34))
      {
        if (*v14 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v56 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
        {
          v57 = v56;
          objc_msgSend_operationID(self, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v69 = v60;
          _os_log_debug_impl(&dword_1BE990000, v57, OS_LOG_TYPE_DEBUG, "No assets to upload after setting boundary keys for operation %{public}@", buf, 0xCu);

        }
        goto LABEL_15;
      }
      v13 = v27;
    }
    else
    {
      v27 = v13;
    }
    v35 = (void *)objc_opt_new();
    objc_msgSend_setAssetsToUpload_(v35, v36, (uint64_t)v13);
    objc_msgSend_assetUUIDToExpectedProperties(self, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAssetUUIDToExpectedProperties_(v35, v40, (uint64_t)v39);

    objc_msgSend_packageUUIDToExpectedProperties(self, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPackageUUIDToExpectedProperties_(v35, v44, (uint64_t)v43);

    v47 = objc_msgSend_originatingFromDaemon(self, v45, v46);
    objc_msgSend_setTemporary_(v35, v48, v47);
    shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v49, v50);
    objc_msgSend_setShouldCloneFileInAssetCache_(v35, v52, shouldCloneFileInAssetCache);
    objc_msgSend_setCloneContextsBySignature_(v35, v53, (uint64_t)self->_cloneContextsBySignature);
    v54 = objc_opt_class();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = sub_1BEBF4360;
    v65[3] = &unk_1E78374C8;
    v65[4] = self;
    v67 = a2;
    v66 = v5;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v55, v54, v35, v65);

LABEL_15:
    goto LABEL_16;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v28 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v29 = v28;
    objc_msgSend_operationID(self, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v69 = v32;
    _os_log_debug_impl(&dword_1BE990000, v29, OS_LOG_TYPE_DEBUG, "No assets to upload for operation %{public}@", buf, 0xCu);

  }
LABEL_16:

}

- (id)_setBoundaryKeyOnAssetsToUpload:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  char v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  id v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  char v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  id v69;
  const char *v70;
  void *v71;
  const char *v72;
  const char *v73;
  void *v74;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  int v92;
  __int16 v93;
  int v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v85, v95, 16);
  if (!v5)
  {
    v82 = 0;
    v83 = 0;
    v80 = v3;
    goto LABEL_42;
  }
  v6 = v5;
  v82 = 0;
  v83 = 0;
  v7 = *(_QWORD *)v86;
  v8 = 0x1E0C94000uLL;
  v80 = v3;
  v81 = *MEMORY[0x1E0C947D8];
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v86 != v7)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v6;
        v12 = v7;
        v13 = v8;
        v14 = v3;
        v15 = v10;
        objc_msgSend_container(self, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_options(v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend_mmcsEncryptionSupport(v21, v22, v23);

        if ((v24 & 1) == 0)
        {
          objc_msgSend_boundaryKey(v15, v25, v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        v30 = objc_msgSend_useMMCSEncryptionV2(v15, v25, v26);
        objc_msgSend_boundaryKey(v15, v31, v32);
        v33 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v33;
        if (v30)
        {
LABEL_10:
          if (v29)
          {
            v34 = 0;
            ++HIDWORD(v83);
LABEL_21:

            v3 = v14;
            v8 = v13;
            v7 = v12;
            v6 = v11;
            goto LABEL_22;
          }
          objc_msgSend_cachedGlobalPerUserBoundaryKeyData(self, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            objc_msgSend_setBoundaryKey_(v15, v27, (uint64_t)v29);
            v34 = 0;
            LODWORD(v83) = v83 + 1;
            goto LABEL_21;
          }
          v35 = CFSTR("Expected non-nil cached boundary key");
        }
        else
        {
          v35 = CFSTR("Boundary key not supported for MMCSv1 asset upload");
          if (!v33)
          {
            v34 = 0;
            goto LABEL_21;
          }
        }
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v27, v81, 12, v35);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v38 = v82;
          if (!v82)
          {
            v39 = (id)objc_msgSend_mutableCopy(v14, v36, v37);

            v38 = v39;
            v80 = v39;
          }
          v82 = v38;
          objc_msgSend_removeObject_(v38, v36, (uint64_t)v15);
          objc_msgSend_objectForKey_(self->_handlersByAsset, v40, (uint64_t)v15);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setError_(v41, v42, (uint64_t)v34);
          objc_msgSend_setState_(v41, v43, 12);

        }
        goto LABEL_21;
      }
LABEL_22:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        continue;
      v45 = v10;
      objc_msgSend_container(self, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_options(v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend_mmcsEncryptionSupport(v51, v52, v53);

      if ((v54 & 1) != 0)
      {
        v60 = objc_msgSend_useMMCSEncryptionV2(v45, v55, v56);
        objc_msgSend_boundaryKey(v45, v61, v62);
        v63 = objc_claimAutoreleasedReturnValue();
        v59 = (void *)v63;
        if (!v60)
        {
          v65 = CFSTR("Boundary key not supported for MMCSv1 package upload");
          if (v63)
            goto LABEL_33;
          v64 = 0;
          goto LABEL_37;
        }
      }
      else
      {
        objc_msgSend_boundaryKey(v45, v55, v56);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v59)
      {
        v64 = 0;
        ++HIDWORD(v83);
      }
      else
      {
        objc_msgSend_cachedGlobalPerUserBoundaryKeyData(self, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v59)
        {
          v65 = CFSTR("Expected non-nil cached boundary key");
LABEL_33:
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v57, v81, 12, v65);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (v64)
          {
            v68 = v82;
            if (!v82)
            {
              v69 = (id)objc_msgSend_mutableCopy(v3, v66, v67);

              v68 = v69;
              v80 = v69;
            }
            v82 = v68;
            objc_msgSend_removeObject_(v68, v66, (uint64_t)v45);
            objc_msgSend_objectForKey_(self->_handlersByAsset, v70, (uint64_t)v45);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setError_(v71, v72, (uint64_t)v64);
            objc_msgSend_setState_(v71, v73, 12);

          }
          goto LABEL_37;
        }
        objc_msgSend_setBoundaryKey_(v45, v57, (uint64_t)v59);
        v64 = 0;
        LODWORD(v83) = v83 + 1;
      }
LABEL_37:

    }
    v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v44, (uint64_t)&v85, v95, 16);
  }
  while (v6);
LABEL_42:
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v74 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v76 = v74;
    v79 = objc_msgSend_count(v3, v77, v78);
    *(_DWORD *)buf = 134218496;
    v90 = v79;
    v91 = 1024;
    v92 = v83;
    v93 = 1024;
    v94 = HIDWORD(v83);
    _os_log_debug_impl(&dword_1BE990000, v76, OS_LOG_TYPE_DEBUG, "Of %lu potential v2 assets, globalPerUser %d, custom %d", buf, 0x18u);

  }
  return v80;
}

- (void)_markRecordHandlersAsUploaded
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[6];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v11 = v4;
    objc_msgSend_operationID(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modifyHandlersByZoneID(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2112;
    v22 = v17;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Skipping saving records for operation %{public}@ after uploading assets: %@", buf, 0x16u);

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BEBF5BF8;
  v18[3] = &unk_1E78374F0;
  v18[4] = self;
  v18[5] = a2;
  v5 = _Block_copy(v18);
  if (objc_msgSend_shouldOnlySaveAssetContent(self, v6, v7))
    objc_msgSend__enumerateHandlersInState_withBlock_(self, v8, 5, v5);
  if ((objc_msgSend_shouldModifyRecordsInDatabase(self, v8, v9) & 1) == 0)
    objc_msgSend__enumerateHandlersInState_withBlock_(self, v10, 6, v5);

}

- (BOOL)_prepareRecordsForSave
{
  uint64_t v2;
  CKDModifyRecordsOperation *v4;
  const char *v5;
  uint64_t v6;
  int haveOutstandingHandlers;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  int isDefaultRecordZoneID;
  void *v33;
  const char *v34;
  void *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  NSObject *v57;
  id v58;
  void *v59;
  const char *v60;
  char v62;
  SEL v63;
  id obj;
  uint64_t v65;
  CKDModifyRecordsOperation *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  _QWORD block[5];
  id v71;
  SEL v72;
  _QWORD v73[4];
  NSObject *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  uint64_t v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v4 = self;
  v91 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_shouldOnlySaveAssetContent(self, a2, v2))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v59, v60, (uint64_t)a2, v4, CFSTR("CKDModifyRecordsOperation.m"), 1991, CFSTR("We shouldn't get into this state if shouldOnlySaveAssetContent is true"));

  }
  haveOutstandingHandlers = objc_msgSend_haveOutstandingHandlers(v4, v5, v6);
  if (haveOutstandingHandlers)
  {
    v62 = haveOutstandingHandlers;
    v63 = a2;
    v69 = (void *)objc_opt_new();
    v8 = dispatch_group_create();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    objc_msgSend_modifyHandlersByZoneID(v4, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v14;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v79, v90, 16);
    v19 = MEMORY[0x1E0C809B0];
    v67 = v16;
    if (v16)
    {
      v65 = *(_QWORD *)v80;
      v66 = v4;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v80 != v65)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v20);
          v22 = objc_msgSend_atomic(v4, v17, v18);
          objc_msgSend_container(v4, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clientSDKVersion(v25, v26, v27);
          v68 = v20;
          if ((CKLinkCheck48d9728e8c354416a38f82379cbb35e3() & 1) != 0)
          {

          }
          else
          {
            isDefaultRecordZoneID = objc_msgSend_isDefaultRecordZoneID(v21, v28, v29);

            v22 &= ~isDefaultRecordZoneID;
          }
          objc_msgSend_modifyHandlersByZoneID(v4, v30, v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)v21);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v36 = v35;
          v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v75, v89, 16);
          if (v38)
          {
            v41 = v38;
            v42 = *(_QWORD *)v76;
            do
            {
              v43 = 0;
              do
              {
                if (*(_QWORD *)v76 != v42)
                  objc_enumerationMutation(v36);
                v44 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v43);
                if (objc_msgSend_state(v44, v39, v40) == 5)
                {
                  dispatch_group_enter(v8);
                  v73[0] = v19;
                  v73[1] = 3221225472;
                  v73[2] = sub_1BEBF6114;
                  v73[3] = &unk_1E782EA40;
                  v74 = v8;
                  objc_msgSend_prepareForSaveWithCompletionHandler_(v44, v45, (uint64_t)v73);

                }
                else if (v22)
                {
                  if (*MEMORY[0x1E0C95300] != -1)
                    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                  v46 = (void *)*MEMORY[0x1E0C952B0];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
                  {
                    v48 = v46;
                    v51 = objc_msgSend_state(v44, v49, v50);
                    *(_DWORD *)buf = 138412802;
                    v84 = v21;
                    v85 = 2112;
                    v86 = v44;
                    v87 = 2048;
                    v88 = v51;
                    _os_log_debug_impl(&dword_1BE990000, v48, OS_LOG_TYPE_DEBUG, "Will skip zone %@ because handler isn't ready:\n%@. Handler state %lu", buf, 0x20u);

                  }
                  objc_msgSend_addObject_(v69, v47, (uint64_t)v21);
                  v19 = MEMORY[0x1E0C809B0];
                }
                ++v43;
              }
              while (v41 != v43);
              v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v75, v89, 16);
            }
            while (v41);
          }

          v20 = v68 + 1;
          v4 = v66;
        }
        while (v68 + 1 != v67);
        v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v79, v90, 16);
      }
      while (v67);
    }

    objc_msgSend_stateTransitionGroup(v4, v52, v53);
    v54 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v54);

    objc_msgSend_modifyRecordsQueue(v4, v55, v56);
    v57 = objc_claimAutoreleasedReturnValue();
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = sub_1BEBF611C;
    block[3] = &unk_1E7830158;
    block[4] = v4;
    v71 = v69;
    v72 = v63;
    v58 = v69;
    dispatch_group_notify(v8, v57, block);

    LOBYTE(haveOutstandingHandlers) = v62;
  }
  return haveOutstandingHandlers;
}

- (CKDProtocolTranslator)translator
{
  CKDProtocolTranslator *translator;
  CKDProtocolTranslator *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  CKDProtocolTranslator *v12;
  CKDProtocolTranslator *v13;

  translator = self->_translator;
  if (!translator)
  {
    v4 = [CKDProtocolTranslator alloc];
    objc_msgSend_container(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_databaseScope(self, v8, v9);
    v12 = (CKDProtocolTranslator *)objc_msgSend_initWithContainer_databaseScope_(v4, v11, (uint64_t)v7, v10);
    v13 = self->_translator;
    self->_translator = v12;

    translator = self->_translator;
  }
  return translator;
}

- (void)_handleDecryptionFailure:(id)a3 forRecordID:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  dispatch_block_t *v9;
  os_log_t *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  int v25;
  dispatch_block_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (_QWORD *)MEMORY[0x1E0C95300];
  v9 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v10 = (os_log_t *)MEMORY[0x1E0C952B0];
  v11 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v7;
    v35 = 2112;
    v36 = v6;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Failed to decrypt record with ID %@: %@.", buf, 0x16u);
  }
  if (objc_msgSend_code(v6, v12, v13) == 5004)
  {
    if (*v8 != -1)
      dispatch_once(MEMORY[0x1E0C95300], *v9);
    v15 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v7;
      v35 = 2112;
      v36 = v6;
      _os_log_fault_impl(&dword_1BE990000, v15, OS_LOG_TYPE_FAULT, "Failed to decrypt record with ID %@: %@", buf, 0x16u);
    }
  }
  objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v14, *MEMORY[0x1E0C94B20], 5004, v6, CFSTR("Couldn't decrypt data on record %@"), v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handlersByRecordID(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setError_(v21, v22, (uint64_t)v16);
  v25 = objc_msgSend_retryPCSFailures(self, v23, v24);
  v26 = *v9;
  if (v25)
  {
    if (*v8 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v26);
    v27 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v7;
      _os_log_debug_impl(&dword_1BE990000, v27, OS_LOG_TYPE_DEBUG, "Marking record %@ for another retry after fetching PCS data", buf, 0xCu);
    }
    objc_msgSend_clearProtectionDataForRecord(v21, v28, v29);
    objc_msgSend_setState_(v21, v30, 13);
  }
  else
  {
    if (*v8 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v26);
    v31 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v7;
      _os_log_debug_impl(&dword_1BE990000, v31, OS_LOG_TYPE_DEBUG, "Failing save of record %@ because we couldn't decrypt it", buf, 0xCu);
    }
    objc_msgSend_setState_(v21, v32, 12);
  }

}

- (void)_verifyRecordEncryption
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  int shouldDecryptRecordsBeforeSave;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  _BOOL8 v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  id v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  id v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  void *v82;
  const char *v83;
  void *v84;
  id v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t j;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  NSObject *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  void *v105;
  _QWORD v106[5];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  uint8_t v121[128];
  uint8_t buf[4];
  uint64_t v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_useEncryption(self, a2, v2))
  {
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    shouldDecryptRecordsBeforeSave = objc_msgSend_shouldDecryptRecordsBeforeSave(v6, v7, v8);

    if (shouldDecryptRecordsBeforeSave)
    {
      v105 = (void *)objc_opt_new();
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      v119 = 0u;
      objc_msgSend_recordsToSave(self, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v116, v124, 16);
      if (v14)
      {
        v18 = v14;
        v19 = *(_QWORD *)v117;
        *(_QWORD *)&v17 = 138412290;
        v104 = v17;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v117 != v19)
              objc_enumerationMutation(v12);
            v21 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v20);
            if (objc_msgSend_hasPropertiesRequiringEncryption(v21, v15, v16, v104))
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v22 = (void *)*MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
              {
                v41 = v22;
                objc_msgSend_recordID(v21, v42, v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v104;
                v123 = (uint64_t)v44;
                _os_log_debug_impl(&dword_1BE990000, v41, OS_LOG_TYPE_DEBUG, "Verifying encrypted data on record %@ before uploading it", buf, 0xCu);

              }
              objc_msgSend_translator(self, v23, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend_savePolicy(self, v26, v27) == 2;
              objc_msgSend_deltaPRecordFromRecord_withAllFields_outDeletedMergeFields_outKeysToSend_(v25, v29, (uint64_t)v21, v28, 0, 0);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_translator(self, v31, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = 0;
              objc_msgSend_recordFromPRecord_error_(v33, v34, (uint64_t)v30, &v115);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v115;

              if (v36 || !v35)
              {
                objc_msgSend_recordID(v21, v37, v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend__handleDecryptionFailure_forRecordID_(self, v40, (uint64_t)v36, v39);

              }
              else
              {
                objc_msgSend_addObject_(v105, v37, (uint64_t)v35);
              }

            }
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v116, v124, 16);
        }
        while (v18);
      }

      v45 = v105;
      if (objc_msgSend_count(v105, v46, v47))
      {
        v113 = 0u;
        v114 = 0u;
        v111 = 0u;
        v112 = 0u;
        v48 = v105;
        v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v111, v121, 16);
        if (v50)
        {
          v53 = v50;
          v54 = *(_QWORD *)v112;
          v55 = *MEMORY[0x1E0C949F0];
          do
          {
            for (i = 0; i != v53; ++i)
            {
              if (*(_QWORD *)v112 != v54)
                objc_enumerationMutation(v48);
              v57 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
              objc_msgSend_recordID(v57, v51, v52);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setPCSData_forFetchedRecordID_(self, v59, 0, v58);

              objc_msgSend_recordID(v57, v60, v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_zoneID(v62, v63, v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setPCSData_forFetchedZoneID_(self, v66, 0, v65);

              objc_msgSend_share(v57, v67, v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(v69, v70, v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setPCSData_forFetchedShareID_(self, v73, 0, v72);

              v74 = objc_alloc(MEMORY[0x1E0C95070]);
              objc_msgSend_recordID(v57, v75, v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_zoneID(v77, v78, v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = (void *)objc_msgSend_initWithRecordName_zoneID_(v74, v81, v55, v80);

              objc_msgSend_setPCSData_forFetchedShareID_(self, v83, 0, v82);
            }
            v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v51, (uint64_t)&v111, v121, 16);
          }
          while (v53);
        }

        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v84 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v100 = v84;
          v103 = objc_msgSend_count(v48, v101, v102);
          *(_DWORD *)buf = 134217984;
          v123 = v103;
          _os_log_debug_impl(&dword_1BE990000, v100, OS_LOG_TYPE_DEBUG, "Sending %ld records to the record decrypt operation before uploading them to the server", buf, 0xCu);

        }
        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        v85 = v48;
        v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v86, (uint64_t)&v107, v120, 16);
        if (v87)
        {
          v90 = v87;
          v91 = *(_QWORD *)v108;
          v92 = MEMORY[0x1E0C809B0];
          do
          {
            for (j = 0; j != v90; ++j)
            {
              if (*(_QWORD *)v108 != v91)
                objc_enumerationMutation(v85);
              v94 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j);
              objc_msgSend_stateTransitionGroup(self, v88, v89);
              v95 = objc_claimAutoreleasedReturnValue();
              dispatch_group_enter(v95);

              objc_msgSend_recordDecryptOperation(self, v96, v97);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v106[0] = v92;
              v106[1] = 3221225472;
              v106[2] = sub_1BEBF702C;
              v106[3] = &unk_1E7837518;
              v106[4] = self;
              objc_msgSend_decryptRecord_withCompletion_(v98, v99, v94, v106);

            }
            v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v88, (uint64_t)&v107, v120, 16);
          }
          while (v90);
        }

        v45 = v105;
      }

    }
  }
}

- (void)_handleRecordSaved:(id)a3 handler:(id)a4 etag:(id)a5 dateStatistics:(id)a6 expirationDate:(id)a7 responseCode:(id)a8 keysAssociatedWithETag:(id)a9 recordForOplockFailure:(id)a10 serverRecord:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  CKDModifyRecordsOperation *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  if (objc_msgSend_hasPropertiesRequiringEncryption(v25, v26, v27))
  {
    v43 = v22;
    objc_msgSend_stateTransitionGroup(self, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v30);

    v44 = v20;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v31 = v18;
    v32 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v37 = v32;
      objc_msgSend_recordID(v25, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v57 = v40;
      _os_log_debug_impl(&dword_1BE990000, v37, OS_LOG_TYPE_DEBUG, "Decrypting server record %@ returned from save", buf, 0xCu);

    }
    objc_msgSend_recordDecryptOperation(self, v33, v34);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_1BEBF74B0;
    v45[3] = &unk_1E7837540;
    v46 = v25;
    v47 = v31;
    v48 = self;
    v41 = v17;
    v49 = v17;
    v50 = v19;
    v51 = v44;
    v52 = v21;
    v22 = v43;
    v53 = v43;
    v54 = v23;
    v55 = v24;
    v35 = v31;
    v20 = v44;
    objc_msgSend_decryptRecord_withCompletion_(v42, v36, (uint64_t)v46, v45);

    v18 = v35;
    v17 = v41;

  }
  else
  {
    objc_msgSend__reallyHandleRecordSaved_handler_etag_dateStatistics_expirationDate_responseCode_keysAssociatedWithETag_recordForOplockFailure_decryptedServerRecord_(self, v28, (uint64_t)v17, v18, v19, v20, v21, v22, v23, v24, v25);
  }

}

- (void)_reallyHandleRecordSaved:(id)a3 handler:(id)a4 etag:(id)a5 dateStatistics:(id)a6 expirationDate:(id)a7 responseCode:(id)a8 keysAssociatedWithETag:(id)a9 recordForOplockFailure:(id)a10 decryptedServerRecord:(id)a11
{
  __CFString *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t hasParticipantPIIEntitlement;
  const char *v39;
  const char *v40;
  uint64_t v41;
  int v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  dispatch_once_t *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  int hasType;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  _BOOL4 v67;
  const char *v68;
  uint64_t v69;
  NSObject *v70;
  const char *v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  int hasTime;
  const char *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  int v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  NSObject *v109;
  const char *v110;
  void *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  const char *v117;
  void *v118;
  const char *v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  _BOOL4 v126;
  const char *v127;
  uint64_t v128;
  NSObject *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
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
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  BOOL v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  NSObject *v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  __CFString *v187;
  const char *v188;
  void *v189;
  void *v190;
  const char *v191;
  void *v192;
  const char *v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  _BOOL4 v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  void *v207;
  const char *v208;
  char hasPrefix;
  const char *v210;
  uint64_t v211;
  int v212;
  const __CFString *v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  _BOOL4 v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  _BOOL4 v225;
  const char *v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  NSObject *v231;
  const char *v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  void *v239;
  const char *v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  char v246;
  const char *v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  _BOOL4 v255;
  const char *v256;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  const char *v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  const char *v285;
  uint64_t v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  void *v298;
  const char *v299;
  NSObject *v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  const char *v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  int hasTypeCode;
  const char *v313;
  uint64_t v314;
  void *v315;
  void *v316;
  void *v317;
  const char *v318;
  void *v319;
  const char *v320;
  const char *v321;
  void *v322;
  void *v323;
  const char *v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  void *v332;
  const char *v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  const char *v338;
  uint64_t v339;
  void *v340;
  const char *v341;
  uint64_t v342;
  void *v343;
  const char *v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  void *v349;
  const char *v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  void *v354;
  const char *v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  void *v362;
  const char *v363;
  uint64_t v364;
  int hasOplockFailure;
  id v366;
  id v367;
  const char *v368;
  uint64_t v369;
  const char *v370;
  uint64_t v371;
  const char *v372;
  uint64_t v373;
  void *v374;
  const char *v375;
  const char *v376;
  uint64_t v377;
  void *v378;
  const char *v379;
  const char *v380;
  uint64_t v381;
  NSObject *v382;
  void *v383;
  const char *v384;
  uint64_t v385;
  void *v386;
  id v387;
  const char *v388;
  void *v389;
  uint64_t v390;
  const char *v391;
  uint64_t v392;
  void *v393;
  const char *v394;
  uint64_t v395;
  void *v396;
  const char *v397;
  void *v398;
  const char *v399;
  uint64_t v400;
  void *v401;
  const char *v402;
  uint64_t v403;
  _BOOL4 v404;
  NSObject *v405;
  NSObject *v406;
  const char *v407;
  uint64_t v408;
  __CFString *v409;
  NSObject *v410;
  const char *v411;
  uint64_t v412;
  __CFString *v413;
  void *v414;
  id v415;
  id v416;
  id v417;
  id v418;
  void *v419;
  id v420;
  void *v421;
  void *v422;
  id v423;
  id v424;
  __CFString *v425;
  CKDModifyRecordsOperation *val;
  _QWORD v427[4];
  id v428;
  id v429;
  __CFString *v430;
  __CFString *v431;
  CKDModifyRecordsOperation *v432;
  id v433;
  _QWORD aBlock[4];
  id v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  _QWORD v440[4];
  id v441;
  _BYTE v442[128];
  void *v443;
  uint8_t buf[4];
  const __CFString *v445;
  __int16 v446;
  __CFString *v447;
  uint64_t v448;

  v448 = *MEMORY[0x1E0C80C00];
  v425 = (__CFString *)a3;
  v424 = a4;
  v418 = a5;
  v420 = a6;
  v417 = a7;
  v17 = (__CFString *)a8;
  v415 = a9;
  v416 = a10;
  v423 = a11;
  val = self;
  objc_msgSend_container(self, v18, v19);
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  if (v425)
  {
    objc_msgSend_handlersByRecordID(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)v425);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_record(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }
  objc_opt_class();
  v422 = v27;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_entitlements(v421, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasOutOfProcessUIEntitlement(v30, v31, v32))
    {
      objc_msgSend_setSerializePersonalInfo_(v423, v33, 1);
    }
    else
    {
      objc_msgSend_entitlements(v421, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      hasParticipantPIIEntitlement = objc_msgSend_hasParticipantPIIEntitlement(v35, v36, v37);
      objc_msgSend_setSerializePersonalInfo_(v423, v39, hasParticipantPIIEntitlement);

    }
    v27 = v422;
  }
  objc_msgSend_setServerRecord_(v424, v28, (uint64_t)v423);
  v42 = objc_msgSend_code(v17, v40, v41);
  if (v425 && v42 == 1)
  {
    if (v27)
    {
      if (objc_msgSend_canSkipRecordSaveForMergeables(v27, v43, v44)
        && objc_msgSend_state(v424, v45, v46) == 11)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v47 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v445 = v425;
          _os_log_impl(&dword_1BE990000, v47, OS_LOG_TYPE_INFO, "Mergeable record already failed with an atomic failure %@", buf, 0xCu);
        }
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v72 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v445 = v425;
          _os_log_impl(&dword_1BE990000, v72, OS_LOG_TYPE_INFO, "Record %@ was successfully saved to the server", buf, 0xCu);
        }
        if (objc_msgSend_includeMergeableDeltasInModifyRecordsRequest(self, v73, v74))
          objc_msgSend_setState_(v424, v75, 8);
        else
          objc_msgSend_setState_(v424, v75, 7);
        objc_msgSend_setKnownToServer_(v422, v76, 1);
        if (v418)
          objc_msgSend_setEtag_(v422, v77, (uint64_t)v418);
        objc_msgSend_creation(v420, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        hasTime = objc_msgSend_hasTime(v79, v80, v81);

        if (hasTime)
        {
          v85 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend_creation(v420, v83, v84);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_time(v86, v87, v88);
          objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v85, v89, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          if (v91)
          {
            objc_msgSend_setCreationDate_(v422, v83, (uint64_t)v91);

          }
        }
        objc_msgSend_modification(v420, v83, v84);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend_hasTime(v92, v93, v94);

        if (v95)
        {
          v98 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend_modification(v420, v96, v97);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_time(v99, v100, v101);
          objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v98, v102, v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          if (v104)
          {
            objc_msgSend_setModificationDate_(v422, v96, (uint64_t)v104);

          }
        }
        objc_msgSend_setExpirationDate_(v422, v96, (uint64_t)v417);
        objc_msgSend_setHasUpdatedExpirationTimeInterval_(v422, v105, 0);
        objc_msgSend_setUpdatedExpirationTimeInterval_(v422, v106, 0);
        objc_msgSend_savePCSDataToCache(v424, v107, v108);
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v109 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v445 = v425;
        _os_log_error_impl(&dword_1BE990000, v109, OS_LOG_TYPE_ERROR, "Got a response for record with ID %@, but we didn't try to put that record.", buf, 0xCu);
      }
      objc_msgSend_setState_(v424, v110, 12);
      v111 = (void *)MEMORY[0x1E0C94FF8];
      v112 = sub_1BEB10D5C(v17);
      objc_msgSend_request(self, v113, v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BEB10290(v115, v17);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_format_(v111, v117, *MEMORY[0x1E0C94B20], v112, v116, CFSTR("Got a response for record with ID %@, but we didn't try to put that record."), v425);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v424, v119, (uint64_t)v118);

    }
    goto LABEL_132;
  }
  v48 = (dispatch_once_t *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v49 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v445 = v425;
    v446 = 2112;
    v447 = v17;
    _os_log_impl(&dword_1BE990000, v49, OS_LOG_TYPE_INFO, "Error when saving record %@ to the server: %@", buf, 0x16u);
  }
  objc_msgSend_error(v17, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientError(v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  hasType = objc_msgSend_hasType(v55, v56, v57);

  if (!hasType)
    goto LABEL_108;
  objc_msgSend_error(v17, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientError(v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend_type(v64, v65, v66) == 52;

  if (v67)
  {
    if (*v48 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v70 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v445 = v425;
      v71 = "Record PCS etag failed for record %@";
LABEL_54:
      _os_log_impl(&dword_1BE990000, v70, OS_LOG_TYPE_INFO, v71, buf, 0xCu);
LABEL_55:
      v414 = 0;
      goto LABEL_56;
    }
    goto LABEL_58;
  }
  objc_msgSend_error(v17, v68, v69);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientError(v120, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = objc_msgSend_type(v123, v124, v125) == 53;

  if (!v126)
  {
    objc_msgSend_error(v17, v127, v128);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientError(v194, v195, v196);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = objc_msgSend_type(v197, v198, v199) == 15;

    objc_msgSend_error(v17, v201, v202);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = v203;
    if (v200)
    {
      objc_msgSend_errorDescription(v203, v204, v205);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      hasPrefix = objc_msgSend_hasPrefix_(v207, v208, (uint64_t)CFSTR("Record PCS oplock failed"));

      if ((hasPrefix & 1) != 0)
      {
        v212 = 1;
        v213 = CFSTR("Record");
      }
      else
      {
        objc_msgSend_error(v17, v210, v211);
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDescription(v241, v242, v243);
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        v246 = objc_msgSend_hasPrefix_(v244, v245, (uint64_t)CFSTR("Zone PCS oplock failed"));

        if ((v246 & 1) != 0)
        {
          v212 = 1;
          v213 = CFSTR("Zone");
        }
        else
        {
          objc_msgSend_error(v17, v247, v248);
          v295 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorDescription(v295, v296, v297);
          v298 = (void *)objc_claimAutoreleasedReturnValue();
          v212 = objc_msgSend_hasPrefix_(v298, v299, (uint64_t)CFSTR("Share Etag Oplock failure"));

          if (v212)
            v213 = CFSTR("Share");
          else
            v213 = CFSTR("Unknown");
        }
      }
      if (*v48 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v300 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v445 = v213;
        v446 = 2112;
        v447 = v425;
        _os_log_impl(&dword_1BE990000, v300, OS_LOG_TYPE_INFO, "%{public}@ oplock failed for record %@", buf, 0x16u);
      }
      if (v212)
        goto LABEL_55;
    }
    else
    {
      objc_msgSend_clientError(v203, v204, v205);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      v217 = objc_msgSend_type(v214, v215, v216) == 48;

      if (!v217)
      {
        objc_msgSend_error(v17, v218, v219);
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clientError(v249, v250, v251);
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        v255 = objc_msgSend_type(v252, v253, v254) == 62;

        if (!v255)
        {
          objc_msgSend_error(v17, v256, v257);
          v398 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clientError(v398, v399, v400);
          v401 = (void *)objc_claimAutoreleasedReturnValue();
          v404 = objc_msgSend_type(v401, v402, v403) == 64;

          if (!v404)
            goto LABEL_108;
          if (*v48 != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v405 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BE990000, v405, OS_LOG_TYPE_INFO, "Record PCS chain was invalid", buf, 2u);
          }
        }
        v258 = (void *)MEMORY[0x1E0C94FF8];
        v259 = sub_1BEB10D5C(v17);
        objc_msgSend_recordID(v422, v260, v261);
        v262 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_error(v17, v263, v264);
        v265 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDescription(v265, v266, v267);
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_format_(v258, v269, *MEMORY[0x1E0C94B20], v259, 0, CFSTR("Error saving share %@ to server: \"%@\"), v262, v268);
        v414 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_56:
        if (*v48 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        goto LABEL_59;
      }
      objc_msgSend_options(v421, v218, v219);
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      if (((v425 != 0) & objc_msgSend_useAnonymousToServerShareParticipants(v220, v221, v222)) == 1)
      {
        v225 = objc_msgSend_databaseScope(self, v223, v224) == 3;

        if (v225)
        {
          if (*v48 != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v228 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v410 = v228;
            objc_msgSend_zoneID(v425, v411, v412);
            v413 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v445 = v413;
            _os_log_debug_impl(&dword_1BE990000, v410, OS_LOG_TYPE_DEBUG, "Possible anonymous share %@ not found. Removing share from anonymous share list", buf, 0xCu);

          }
          objc_initWeak((id *)buf, self);
          objc_msgSend_stateTransitionGroup(self, v229, v230);
          v231 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v231);

          objc_msgSend_anonymousSharingManager(v421, v232, v233);
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneID(v425, v235, v236);
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          v443 = v237;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v238, (uint64_t)&v443, 1);
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          v440[0] = MEMORY[0x1E0C809B0];
          v440[1] = 3221225472;
          v440[2] = sub_1BEBF8DD4;
          v440[3] = &unk_1E78309E8;
          objc_copyWeak(&v441, (id *)buf);
          objc_msgSend_removeAnonymousSharesFromSharedDB_operation_withCompletionBlock_(v234, v240, (uint64_t)v239, self, v440);

          objc_destroyWeak(&v441);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {

      }
      objc_msgSend_container(self, v226, v227);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordCache(v270, v271, v272);
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v425, v274, v275);
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clearAllRecordsForZoneWithID_(v273, v277, (uint64_t)v276);

      if (objc_msgSend_databaseScope(self, v278, v279) != 1)
      {
        objc_msgSend_recordID(v422, v59, v60);
        v280 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v280, v281, v282);
        v283 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPCSData_forFetchedZoneID_(self, v284, 0, v283);

        objc_msgSend_pcsCache(v421, v285, v286);
        v287 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v422, v288, v289);
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v290, v291, v292);
        v293 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removePCSDataForItemsInZoneWithID_(v287, v294, (uint64_t)v293);

      }
    }
LABEL_108:
    objc_msgSend_error(v17, v59, v60);
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_hasExtensionError(v301, v302, v303) & 1) != 0)
    {
      objc_msgSend_error(v17, v304, v305);
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_extensionError(v306, v307, v308);
      v309 = (void *)objc_claimAutoreleasedReturnValue();
      hasTypeCode = objc_msgSend_hasTypeCode(v309, v310, v311);

      if (hasTypeCode)
      {
        v315 = (void *)MEMORY[0x1E0C94FF8];
        objc_msgSend_request(self, v313, v314);
        v316 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1BEB10290(v316, v17);
        v317 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_format_(v315, v318, *MEMORY[0x1E0C94B20], 6000, v317, CFSTR("Plugin-Specific Error"));
        v319 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setError_(v424, v320, (uint64_t)v319);

        objc_msgSend_setState_(v424, v321, 12);
        goto LABEL_132;
      }
    }
    else
    {

    }
    objc_msgSend_request(self, v313, v314);
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v322, v17);
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    v326 = (void *)objc_msgSend_mutableCopy(v323, v324, v325);

    objc_msgSend_error(v17, v327, v328);
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientError(v329, v330, v331);
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_moveOplockFailure(v332, v333, v334);
    v335 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v323) = objc_msgSend_hasMovedRecordDestinationIdentifier(v335, v336, v337);

    if ((_DWORD)v323)
    {
      objc_msgSend_translator(self, v338, v339);
      v340 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v17, v341, v342);
      v343 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clientError(v343, v344, v345);
      v346 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_moveOplockFailure(v346, v347, v348);
      v349 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_movedRecordDestinationIdentifier(v349, v350, v351);
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordIDFromPRecordIdentifier_error_(v340, v353, (uint64_t)v352, 0);
      v354 = (void *)objc_claimAutoreleasedReturnValue();

      if (v354)
        objc_msgSend_setObject_forKeyedSubscript_(v326, v355, (uint64_t)v354, *MEMORY[0x1E0C949E8]);

    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1BEBF8EE4;
    aBlock[3] = &unk_1E782EDA8;
    v435 = v424;
    v356 = _Block_copy(aBlock);
    objc_msgSend_error(v17, v357, v358);
    v359 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientError(v359, v360, v361);
    v362 = (void *)objc_claimAutoreleasedReturnValue();
    hasOplockFailure = objc_msgSend_hasOplockFailure(v362, v363, v364);

    if (hasOplockFailure)
    {
      v366 = v416;
      v367 = v422;
      v419 = (void *)objc_msgSend_copyWithOriginalValues(v367, v368, v369);
      if (v419)
        objc_msgSend_setObject_forKeyedSubscript_(v326, v370, (uint64_t)v419, *MEMORY[0x1E0C949A8]);
      if (v366)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v326, v370, (uint64_t)v366, *MEMORY[0x1E0C949B8]);
        objc_msgSend_recordChangeTag(v366, v372, v373);
        v374 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v326, v375, (uint64_t)v374, *MEMORY[0x1E0C94818]);

      }
      if (v367)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v326, v370, (uint64_t)v367, *MEMORY[0x1E0C949B0]);
        objc_msgSend_recordChangeTag(v367, v376, v377);
        v378 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v326, v379, (uint64_t)v378, *MEMORY[0x1E0C947B8]);

      }
      if (objc_msgSend_hasPropertiesRequiringEncryption(v366, v370, v371))
      {
        objc_msgSend_stateTransitionGroup(val, v380, v381);
        v382 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v382);

        if (*v48 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v383 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v406 = v383;
          objc_msgSend_recordID(v366, v407, v408);
          v409 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v445 = v409;
          _os_log_debug_impl(&dword_1BE990000, v406, OS_LOG_TYPE_DEBUG, "Decrypting server record returned by oplock failure %@", buf, 0xCu);

        }
        objc_msgSend_recordDecryptOperation(val, v384, v385);
        v386 = (void *)objc_claimAutoreleasedReturnValue();
        v427[0] = MEMORY[0x1E0C809B0];
        v427[1] = 3221225472;
        v427[2] = sub_1BEBF8F40;
        v427[3] = &unk_1E7833398;
        v428 = v366;
        v429 = v326;
        v430 = v17;
        v431 = v425;
        v432 = val;
        v433 = v356;
        v387 = v366;
        objc_msgSend_decryptRecord_withCompletion_(v386, v388, (uint64_t)v387, v427);

        goto LABEL_131;
      }

    }
    v389 = (void *)MEMORY[0x1E0C94FF8];
    v390 = sub_1BEB10D5C(v17);
    objc_msgSend_error(v17, v391, v392);
    v393 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v393, v394, v395);
    v396 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v389, v397, *MEMORY[0x1E0C94B20], v390, v326, CFSTR("Error saving record %@ to server: %@"), v425, v396);
    v367 = (id)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void *, id))v356 + 2))(v356, v367);
LABEL_131:

    goto LABEL_132;
  }
  if (*v48 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v70 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v445 = v425;
    v71 = "Zone PCS etag failed for record %@";
    goto LABEL_54;
  }
LABEL_58:
  v414 = 0;
LABEL_59:
  v129 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v445 = v425;
    _os_log_impl(&dword_1BE990000, v129, OS_LOG_TYPE_INFO, "Handling error for record %@ as an oplock failure", buf, 0xCu);
  }
  if (objc_msgSend_retryPCSFailures(self, v130, v131))
  {
    objc_msgSend_clearProtectionDataForRecord(v424, v132, v133);
    objc_msgSend_recordID(v422, v134, v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v136, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();

    if (v139)
    {
      v438 = 0u;
      v439 = 0u;
      v437 = 0u;
      v436 = 0u;
      objc_msgSend_modifyHandlersByZoneID(self, v140, v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v422, v143, v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v145, v146, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v142, v149, (uint64_t)v148);
      v150 = (void *)objc_claimAutoreleasedReturnValue();

      v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v150, v151, (uint64_t)&v436, v442, 16);
      if (v152)
      {
        v153 = *(_QWORD *)v437;
        do
        {
          v154 = 0;
          do
          {
            if (*(_QWORD *)v437 != v153)
              objc_enumerationMutation(v150);
            v155 = *(void **)(*((_QWORD *)&v436 + 1) + 8 * v154);
            if (*v48 != -1)
              dispatch_once(v48, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v156 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              v181 = v156;
              objc_msgSend_record(v155, v182, v183);
              v184 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(v184, v185, v186);
              v187 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v445 = v187;
              _os_log_debug_impl(&dword_1BE990000, v181, OS_LOG_TYPE_DEBUG, "Clearing zone PCS tag for record %@", buf, 0xCu);

            }
            objc_msgSend_record(v155, v157, v158);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setZoneProtectionEtag_(v159, v160, 0);

            objc_msgSend_record(v155, v161, v162);
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setShareEtag_(v163, v164, 0);

            objc_msgSend_error(v17, v165, v166);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_clientError(v167, v168, v169);
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            v173 = objc_msgSend_type(v170, v171, v172) == 52;

            if (!v173)
            {
              objc_msgSend_record(v155, v174, v175);
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recordID(v176, v177, v178);
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setPCSData_forFetchedRecordID_(val, v180, 0, v179);

            }
            ++v154;
          }
          while (v152 != v154);
          v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v150, v174, (uint64_t)&v436, v442, 16);
        }
        while (v152);
      }

    }
    objc_msgSend_setState_(v424, v140, 13);
  }
  else
  {
    objc_msgSend_setState_(v424, v132, 12);
  }
  if (v414)
  {
    objc_msgSend_setError_(v424, v188, (uint64_t)v414);

  }
  else
  {
    v189 = (void *)MEMORY[0x1E0C94FF8];
    objc_msgSend_recordID(v422, v188, 0);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v189, v191, *MEMORY[0x1E0C94B20], 2037, 0, CFSTR("Error saving record %@ to server: Protection data didn't match"), v190);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(v424, v193, (uint64_t)v192);

  }
LABEL_132:

}

- (void)_handleRecordDeleted:(id)a3 handler:(id)a4 responseCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  int v13;
  dispatch_block_t *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  os_log_t *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  const char *v81;
  int isEqualToString;
  _QWORD v83[4];
  id v84;
  uint8_t buf[4];
  id v86;
  __int16 v87;
  id v88;
  _QWORD v89[2];

  v89[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13 = objc_msgSend_code(v10, v11, v12);
  v14 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
  v15 = (void *)*MEMORY[0x1E0C952F8];
  v16 = (_QWORD *)MEMORY[0x1E0C95300];
  v17 = *MEMORY[0x1E0C95300];
  v18 = (os_log_t *)MEMORY[0x1E0C952B0];
  if (v13 == 1)
  {
    if (v17 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v15);
    v19 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v86 = v8;
      _os_log_impl(&dword_1BE990000, v19, OS_LOG_TYPE_INFO, "Record %@ was successfully deleted from the server", buf, 0xCu);
    }
    objc_msgSend_container(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_useAnonymousToServerShareParticipants(v25, v26, v27)
      && objc_msgSend_databaseScope(self, v28, v29) == 3)
    {
      objc_msgSend_recordName(v8, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v32, v33, *MEMORY[0x1E0C949F0]);

      if (isEqualToString)
      {
        if (*v16 != -1)
          dispatch_once(MEMORY[0x1E0C95300], *v14);
        v35 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v8;
          _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Possible anonymous share deleted. Removing share from anonymous share list: %@", buf, 0xCu);
        }
        objc_initWeak((id *)buf, self);
        objc_msgSend_stateTransitionGroup(self, v36, v37);
        v38 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v38);

        objc_msgSend_container(self, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anonymousSharingManager(v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v8, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v89[0] = v47;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v48, (uint64_t)v89, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v83[0] = MEMORY[0x1E0C809B0];
        v83[1] = 3221225472;
        v83[2] = sub_1BEBF96F0;
        v83[3] = &unk_1E78309E8;
        objc_copyWeak(&v84, (id *)buf);
        objc_msgSend_removeAnonymousSharesFromSharedDB_operation_withCompletionBlock_(v44, v50, (uint64_t)v49, self, v83);

        objc_destroyWeak(&v84);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {

    }
    objc_msgSend_setState_(v9, v34, 8);
    objc_msgSend_container(self, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordCache(v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend_databaseScope(self, v76, v77);
    objc_msgSend_deleteRecordWithID_scope_(v75, v79, (uint64_t)v8, v78);

    objc_msgSend_setPCSData_forFetchedRecordID_(self, v80, 0, v8);
    objc_msgSend_setPCSData_forFetchedShareID_(self, v81, 0, v8);
  }
  else
  {
    if (v17 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v15);
    v51 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v86 = v10;
      v87 = 2112;
      v88 = v8;
      _os_log_impl(&dword_1BE990000, v51, OS_LOG_TYPE_INFO, "Error %@ when deleting record %@ from the server", buf, 0x16u);
    }
    v52 = (void *)MEMORY[0x1E0C94FF8];
    v53 = sub_1BEB10D5C(v10);
    objc_msgSend_request(self, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v56, v10);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v10, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v52, v64, *MEMORY[0x1E0C94B20], v53, v57, CFSTR("Error deleting record %@: %@"), v8, v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setError_(v9, v66, (uint64_t)v65);
    if (objc_msgSend_code(v65, v67, v68) == 2024)
      objc_msgSend_setState_(v9, v69, 11);
    else
      objc_msgSend_setState_(v9, v69, 12);

  }
}

- (void)_handleMergeableDeltaSavedForRecordID:(id)a3 key:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  id v10;
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
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  char isKindOfClass;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  id v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  NSObject *v61;
  objc_class *v62;
  void *v63;
  NSObject *v64;
  const char *v65;
  NSObject *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  uint8_t buf[4];
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_handlersByRecordID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_record(v15, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (objc_msgSend_code(v10, v18, v19) != 1)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v67 = v20;
      v31 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v72 = v9;
        v73 = 2112;
        v74 = v8;
        v75 = 2112;
        v76 = v10;
        _os_log_error_impl(&dword_1BE990000, v31, OS_LOG_TYPE_ERROR, "Error syncing mergeable delta for key %@ on record %@: %@", buf, 0x20u);
      }
      v32 = (void *)MEMORY[0x1E0C94FF8];
      v33 = *MEMORY[0x1E0C94B20];
      v34 = sub_1BEB10D5C(v10);
      objc_msgSend_request(self, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BEB10290(v37, v10);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v10;
      objc_msgSend_error(v10, v39, v40);
      v41 = v8;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDescription(v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v9;
      v70 = v41;
      objc_msgSend_errorWithDomain_code_userInfo_format_(v32, v46, v33, v34, v38, CFSTR("Error saving mergeable delta for key '%@' on record %@: %@"), v9, v41, v45);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_code(v24, v47, v48) == 2024)
      {
        v8 = v70;
        v20 = v67;
        v10 = v68;
        objc_msgSend_setState_(v15, v49, 11);
      }
      else
      {
        objc_msgSend_error(v15, v49, v50);
        v51 = objc_claimAutoreleasedReturnValue();
        v20 = v67;
        if (v51
          && (v54 = (void *)v51,
              objc_msgSend_error(v15, v52, v53),
              v55 = (void *)objc_claimAutoreleasedReturnValue(),
              v58 = objc_msgSend_code(v55, v56, v57),
              v55,
              v54,
              v58 != 2024))
        {
          v10 = v68;
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v64 = *MEMORY[0x1E0C952B0];
          v9 = v69;
          v8 = v70;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1BE990000, v64, OS_LOG_TYPE_DEBUG, "Not overwriting existing error for modify records handler", buf, 2u);
          }
          objc_msgSend_setState_(v15, v65, 12);
        }
        else
        {
          objc_msgSend_setError_(v15, v52, (uint64_t)v24);
          v9 = v69;
          v8 = v70;
          v10 = v68;
          objc_msgSend_setState_(v15, v59, 12);
        }
      }
      goto LABEL_32;
    }
    objc_msgSend_objectForKeyedSubscript_(v20, v21, (uint64_t)v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24
      || (objc_msgSend_encryptedValues(v20, v22, v23),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)v9),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25,
          v24))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v28 = (void *)*MEMORY[0x1E0C952F8];
      if ((isKindOfClass & 1) != 0)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v28);
        v29 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v72 = v9;
          v73 = 2112;
          v74 = v8;
          _os_log_debug_impl(&dword_1BE990000, v29, OS_LOG_TYPE_DEBUG, "Finished saving mergeable delta for key %@ on record %@", buf, 0x16u);
        }
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v28);
        v60 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          v61 = v60;
          v62 = (objc_class *)objc_opt_class();
          NSStringFromClass(v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v72 = v9;
          v73 = 2112;
          v74 = v63;
          _os_log_error_impl(&dword_1BE990000, v61, OS_LOG_TYPE_ERROR, "Value in record for key '%@' is not a mergeable record value: %@", buf, 0x16u);

        }
      }
LABEL_32:

      goto LABEL_33;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v66 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE990000, v66, OS_LOG_TYPE_ERROR, "No value on record after successful mergeable delta save", buf, 2u);
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v30 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v72 = v9;
      v73 = 2112;
      v74 = v8;
      _os_log_impl(&dword_1BE990000, v30, OS_LOG_TYPE_INFO, "No record on modify handler for mergeable delta save for key %@ on record %@", buf, 0x16u);
    }
  }
LABEL_33:

}

- (void)_handleReplaceDeltasRequest:(id)a3 result:(id)a4
{
  id v6;
  id v7;
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
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  NSObject *v66;
  id v67;
  uint8_t buf[4];
  NSObject *v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_handlersByRecordID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueID(v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v17, (uint64_t)v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_record(v18, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if (objc_msgSend_code(v7, v21, v22) == 1)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v24 = (void *)*MEMORY[0x1E0C952C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
      {
        v25 = v24;
        objc_msgSend_operationID(self, v26, v27);
        v28 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v28;
        v70 = 2112;
        v71 = v6;
        _os_log_debug_impl(&dword_1BE990000, v25, OS_LOG_TYPE_DEBUG, "Modify operation %{public}@ successfully replaced deltas for request: %@", buf, 0x16u);
LABEL_11:

      }
    }
    else
    {
      v67 = v6;
      v41 = sub_1BEB10D5C(v7);
      objc_msgSend_request(self, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BEB10290(v44, v7);
      v45 = objc_claimAutoreleasedReturnValue();

      v46 = (void *)MEMORY[0x1E0C94FF8];
      v47 = *MEMORY[0x1E0C94B20];
      objc_msgSend_error(v7, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDescription(v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v47;
      v55 = (void *)v45;
      objc_msgSend_errorWithDomain_code_userInfo_format_(v46, v56, v54, v41, v45, CFSTR("Error replacing mergeable deltas: %@"), v53);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v58 = (void *)*MEMORY[0x1E0C952C0];
      v6 = v67;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
      {
        v63 = v58;
        objc_msgSend_operationID(self, v64, v65);
        v66 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v69 = v66;
        v70 = 2112;
        v71 = v57;
        _os_log_error_impl(&dword_1BE990000, v63, OS_LOG_TYPE_ERROR, "Modify operation %{public}@ failed to replace deltas with error: %@", buf, 0x16u);

      }
      if (objc_msgSend_code(v57, v59, v60) == 2024)
      {
        objc_msgSend_setState_(v18, v61, 11);
      }
      else
      {
        objc_msgSend_setError_(v18, v61, (uint64_t)v57);
        objc_msgSend_setState_(v18, v62, 12);
      }

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v29 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v28 = v29;
      objc_msgSend_valueID(v6, v30, v31);
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_key(v25, v32, v33);
      v34 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_valueID(v6, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v69 = v34;
      v70 = 2112;
      v71 = v40;
      _os_log_impl(&dword_1BE990000, v28, OS_LOG_TYPE_INFO, "No record on modify handler for mergeable delta replacement for key %@ on record %@", buf, 0x16u);

      goto LABEL_11;
    }
  }

}

- (id)_createModifyRequestWithRecordsToSave:(id)a3 recordsToDelete:(id)a4 recordsToDeleteToEtags:(id)a5 recordIDsToDeleteToSigningPCSIdentity:(id)a6 handlersByRecordID:(id)a7 sendMergeableDeltas:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  CKDModifyRecordsURLRequest *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v58;
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  id location[2];

  v8 = a8;
  v14 = a3;
  v59 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v20 = objc_msgSend_savePolicy(self, v18, v19);
  v58 = v17;
  if (v20 == 2)
  {
    v21 = 0;
    v22 = 1;
  }
  else if (v20 == 1)
  {
    v21 = 0;
    v22 = 0;
  }
  else
  {
    v22 = 0;
    v21 = 1;
  }
  objc_initWeak(location, self);
  objc_msgSend_requestedFieldsByRecordIDForRecords_(self, v23, (uint64_t)v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = [CKDModifyRecordsURLRequest alloc];
  objc_msgSend_clientChangeTokenData(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend_initWithOperation_recordsToSave_recordIDsToDelete_recordIDsToDeleteToSigningPCSIdentity_oplock_sendAllFields_clientChangeTokenData_requestedFieldsByRecordId_(v25, v29, (uint64_t)self, v14, v59, v16, v21, v22, v28, v24);

  v33 = objc_msgSend_atomic(self, v31, v32);
  objc_msgSend_setAtomic_(v30, v34, v33);
  v37 = objc_msgSend_markAsParticipantNeedsNewInvitationToken(self, v35, v36);
  objc_msgSend_setMarkAsParticipantNeedsNewInvitationToken_(v30, v38, v37);
  objc_msgSend_userPublicKeys(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserPublicKeys_(v30, v42, (uint64_t)v41);

  objc_msgSend_setSendMergeableDeltas_(v30, v43, v8);
  v44 = MEMORY[0x1E0C809B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = sub_1BEBFA4FC;
  v64[3] = &unk_1E7837568;
  objc_copyWeak(&v65, location);
  objc_msgSend_setRecordPostedBlock_(v30, v45, (uint64_t)v64);
  v62[0] = v44;
  v62[1] = 3221225472;
  v62[2] = sub_1BEBFA64C;
  v62[3] = &unk_1E7837590;
  objc_copyWeak(&v63, location);
  objc_msgSend_setMergeableDeltaSavedBlock_(v30, v46, (uint64_t)v62);
  v60[0] = v44;
  v60[1] = 3221225472;
  v60[2] = sub_1BEBFA6C4;
  v60[3] = &unk_1E7831FF8;
  objc_copyWeak(&v61, location);
  objc_msgSend_setReplacedDeltasBlock_(v30, v47, (uint64_t)v60);
  objc_msgSend_setRecordIDsToDeleteToEtags_(v30, v48, (uint64_t)v15);
  objc_msgSend_conflictLosersToResolveByRecordID(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setConflictLosersToResolveByRecordID_(v30, v52, (uint64_t)v51);

  objc_msgSend_pluginFieldsForRecordDeletesByID(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPluginFieldsForRecordDeletesByID_(v30, v56, (uint64_t)v55);

  objc_destroyWeak(&v61);
  objc_destroyWeak(&v63);
  objc_destroyWeak(&v65);

  objc_destroyWeak(location);
  return v30;
}

- (id)requestedFieldsByRecordIDForRecords:(id)a3
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id obj;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a3;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v25, v29, 16);
  if (v4)
  {
    v7 = v4;
    v8 = 0;
    v9 = *(_QWORD *)v26;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend_allKeys(v12, v5, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v10;
        v24[1] = 3221225472;
        v24[2] = sub_1BEBFA8D0;
        v24[3] = &unk_1E78375B8;
        v24[4] = v12;
        objc_msgSend_CKFilter_(v13, v14, (uint64_t)v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_count(v15, v16, v17))
        {
          if (!v8)
            v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend_recordID(v12, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v8, v21, (uint64_t)v15, v20);

        }
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v25, v29, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_reportRecordsInFlight
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;

  objc_msgSend_recordsToSave(self, a2, v2);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v22, v4, v5))
  {
    objc_msgSend_recordsInFlightBlock(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend_setShouldReportRecordsInFlight_(self, v9, 0);
      objc_msgSend_recordsToSave(self, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_valueForKeyPath_(v12, v13, (uint64_t)CFSTR("recordID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_stateTransitionGroup(self, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v17);

      objc_msgSend_callbackQueue(self, v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BEBFAAA8;
      block[3] = &unk_1E782EE20;
      block[4] = self;
      v24 = v14;
      v21 = v14;
      dispatch_async(v20, block);

    }
  }
  else
  {

  }
}

- (void)_continueRecordsModify
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  int v46;
  const char *v47;
  void *v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  BOOL v76;
  _QWORD *v77;
  os_log_t *v78;
  void *v79;
  os_log_t v80;
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
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  void *v102;
  BOOL v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  char hasPrefix;
  const char *v112;
  uint64_t v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  NSObject *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  const char *v123;
  const char *v124;
  const char *v125;
  const char *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  NSObject *v131;
  const char *v132;
  uint64_t v133;
  int v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  NSObject *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  int v144;
  void *v145;
  const char *v146;
  void *v147;
  const char *v148;
  void *v149;
  const char *v150;
  void *v151;
  const char *v152;
  void *v154;
  _QWORD v155[5];
  id v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  uint8_t buf[4];
  _QWORD v162[3];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_shouldOnlySaveAssetContent(self, a2, v2))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v4, v5);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v145, v146, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 2635, CFSTR("We shouldn't get into this state if shouldOnlySaveAssetContent is true"));

  }
  if ((objc_msgSend_shouldModifyRecordsInDatabase(self, v4, v5) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v147, v148, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 2636, CFSTR("We shouldn't get into this state if shouldModifyRecordsInDatabase is false"));

  }
  objc_msgSend_container(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v149, v150, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 2637, CFSTR("Expected non-nil container"));

  }
  if (!objc_msgSend_haveOutstandingHandlers(self, v9, v10))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v70 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v70, OS_LOG_TYPE_DEBUG, "Not sending a modify request to the server", buf, 2u);
    }
    return;
  }
  v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend_recordsToSave(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v14, v15, v16);
  v154 = (void *)objc_msgSend_initWithCapacity_(v11, v18, v17);

  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  objc_msgSend_recordsToSave(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v157, v163, 16);
  if (!v25)
  {

    goto LABEL_46;
  }
  v26 = *(_QWORD *)v158;
  v27 = 1;
  do
  {
    v28 = 0;
    do
    {
      if (*(_QWORD *)v158 != v26)
        objc_enumerationMutation(v21);
      v29 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * v28);
      objc_msgSend_handlersByRecordID(self, v23, v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v29, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v30, v34, (uint64_t)v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_state(v35, v36, v37) == 6)
      {
        if (!objc_msgSend_canSkipRecordSaveForMergeables(v29, v38, v39))
          goto LABEL_17;
        if ((objc_msgSend_containsMergeableValuesWithDeltasToSave(v29, v40, v41) & 1) != 0)
        {
          if ((objc_msgSend_includeMergeableDeltasInModifyRecordsRequest(self, v42, v43) & 1) != 0)
          {
LABEL_17:
            objc_msgSend_addObject_(v154, v40, (uint64_t)v29);
            v46 = objc_msgSend_saveAttempts(v35, v44, v45);
            objc_msgSend_setSaveAttempts_(v35, v47, (v46 + 1));
            goto LABEL_23;
          }
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v51 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v61 = v51;
            objc_msgSend_recordID(v29, v62, v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v162[0] = v64;
            _os_log_debug_impl(&dword_1BE990000, v61, OS_LOG_TYPE_DEBUG, "Skipping record upload for purely mergeable record: %@", buf, 0xCu);

          }
          objc_msgSend_setState_(v35, v52, 7);
        }
        else
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v49 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v57 = v49;
            objc_msgSend_recordID(v29, v58, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v162[0] = v60;
            _os_log_debug_impl(&dword_1BE990000, v57, OS_LOG_TYPE_DEBUG, "Skipping record save for purely mergeable record without any deltas to save: %@", buf, 0xCu);

          }
          objc_msgSend_setState_(v35, v50, 8);
        }
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v48 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          v53 = v48;
          objc_msgSend_recordID(v35, v54, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v162[0] = v56;
          _os_log_debug_impl(&dword_1BE990000, v53, OS_LOG_TYPE_DEBUG, "Record %@ isn't ready, so we're going to skip the record upload phase.", buf, 0xCu);

        }
        v27 = 0;
      }
LABEL_23:

      ++v28;
    }
    while (v25 != v28);
    v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v157, v163, 16);
    v25 = v65;
  }
  while (v65);

  if ((v27 & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v68 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v69 = "Some records failed to prepare for this save. Skipping save to the server and retrying if possible";
      goto LABEL_64;
    }
    goto LABEL_58;
  }
LABEL_46:
  if (!objc_msgSend_count(v154, v66, v67)
    && (objc_msgSend_recordIDsToDelete(self, v71, v72),
        v73 = (void *)objc_claimAutoreleasedReturnValue(),
        v76 = objc_msgSend_count(v73, v74, v75) == 0,
        v73,
        v76))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v68 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v69 = "No records to save or delete. Skipping sending a request to the server.";
LABEL_64:
      _os_log_debug_impl(&dword_1BE990000, v68, OS_LOG_TYPE_DEBUG, v69, buf, 2u);
    }
  }
  else
  {
    v77 = (_QWORD *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v78 = (os_log_t *)MEMORY[0x1E0C952B0];
    v79 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v131 = v79;
      v134 = objc_msgSend_count(v154, v132, v133);
      objc_msgSend_clientChangeTokenData(self, v135, v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      LODWORD(v162[0]) = v134;
      WORD2(v162[0]) = 2112;
      *(_QWORD *)((char *)v162 + 6) = v137;
      _os_log_debug_impl(&dword_1BE990000, v131, OS_LOG_TYPE_DEBUG, "Saving %d records to the server with change token %@", buf, 0x12u);

      if (*v77 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    }
    v80 = *v78;
    if (os_log_type_enabled(*v78, OS_LOG_TYPE_DEBUG))
    {
      v138 = v80;
      objc_msgSend_recordIDsToDelete(self, v139, v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = objc_msgSend_count(v141, v142, v143);
      *(_DWORD *)buf = 67109120;
      LODWORD(v162[0]) = v144;
      _os_log_debug_impl(&dword_1BE990000, v138, OS_LOG_TYPE_DEBUG, "Deleting %d records from the server.", buf, 8u);

    }
    objc_msgSend_recordIDsToDelete(self, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordIDsToDeleteToEtags(self, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordIDsToDeleteToSigningPCSIdentity(self, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handlersByRecordID(self, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend_includeMergeableDeltasInModifyRecordsRequest(self, v93, v94);
    objc_msgSend__createModifyRequestWithRecordsToSave_recordsToDelete_recordsToDeleteToEtags_recordIDsToDeleteToSigningPCSIdentity_handlersByRecordID_sendMergeableDeltas_(self, v96, (uint64_t)v154, v83, v86, v89, v92, v95);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(self, v98, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v100, v101, (uint64_t)CFSTR("ModifyRecordsAlwaysUsesHTTPS"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = v102 == 0;

      if (!v103)
      {
        objc_msgSend_url(v97, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_absoluteString(v106, v107, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        hasPrefix = objc_msgSend_hasPrefix_(v109, v110, (uint64_t)CFSTR("https"));

        if ((hasPrefix & 1) == 0)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v112, v113);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v151, v152, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 2680, CFSTR("CKDModifyRecordsOperation must use https in its request URL."));

        }
      }
    }
    objc_initWeak((id *)buf, v97);
    v155[0] = MEMORY[0x1E0C809B0];
    v155[1] = 3221225472;
    v155[2] = sub_1BEBFB674;
    v155[3] = &unk_1E782EF60;
    v155[4] = self;
    objc_copyWeak(&v156, (id *)buf);
    objc_msgSend_setCompletionBlock_(v97, v114, (uint64_t)v155);
    objc_msgSend_stateTransitionGroup(self, v115, v116);
    v117 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v117);

    objc_msgSend_setRequest_(self, v118, (uint64_t)v97);
    objc_msgSend_requestOptions(v97, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStreamingAssetRequestOptions_(self, v122, (uint64_t)v121);

    objc_msgSend_setRecordsToSave_(self, v123, 0);
    objc_msgSend_setRecordIDsToDelete_(self, v124, 0);
    objc_msgSend_setRecordIDsToDeleteToEtags_(self, v125, 0);
    objc_msgSend_setRecordIDsToDeleteToSigningPCSIdentity_(self, v126, 0);
    objc_msgSend_container(self, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performRequest_(v129, v130, (uint64_t)v97);

    objc_destroyWeak(&v156);
    objc_destroyWeak((id *)buf);

  }
LABEL_58:

}

- (void)_uploadMergeableDeltas
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  CKDModifyRecordsOperation *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  NSObject *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_includeMergeableDeltasInModifyRecordsRequest(self, a2, v2))
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = sub_1BEBFBAC0;
    v41[3] = &unk_1E78375E0;
    v15 = v7;
    v42 = v15;
    v16 = v13;
    v43 = v16;
    v17 = v10;
    v44 = v17;
    objc_msgSend__enumerateHandlersInState_withBlock_(self, v18, 7, v41);
    if (objc_msgSend_count(v15, v19, v20) || objc_msgSend_count(v17, v21, v22))
    {
      objc_msgSend_CKMap_(v15, v21, (uint64_t)&unk_1E7837600);
      v23 = objc_claimAutoreleasedReturnValue();
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v24 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v34 = v24;
        objc_msgSend_operationID(self, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v37;
        v47 = 2112;
        v48 = v23;
        _os_log_debug_impl(&dword_1BE990000, v34, OS_LOG_TYPE_DEBUG, "Uploading mergeable deltas for operation %{public}@: %@", buf, 0x16u);

      }
      v25 = objc_alloc_init(MEMORY[0x1E0C95208]);
      objc_msgSend_setDeltas_(v25, v26, (uint64_t)v15);
      objc_msgSend_setReplacementRequests_(v25, v27, (uint64_t)v17);
      v28 = objc_opt_class();
      v38[0] = v14;
      v38[1] = 3221225472;
      v38[2] = sub_1BEBFBE00;
      v38[3] = &unk_1E782E558;
      v39 = v16;
      v40 = self;
      objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v29, v28, v25, v38);

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v30 = (void *)*MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        goto LABEL_14;
      v23 = v30;
      objc_msgSend_operationID(self, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v33;
      _os_log_debug_impl(&dword_1BE990000, v23, OS_LOG_TYPE_DEBUG, "No mergeable deltas or replacements for operation %{public}@", buf, 0xCu);

    }
LABEL_14:

    return;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BE990000, v6, OS_LOG_TYPE_DEBUG, "Not uploading mergeable deltas separately", buf, 2u);
  }
}

+ (int64_t)isPredominatelyDownload
{
  return 0;
}

- (void)main
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  objc_msgSend_hash(self, a2, v2);
  kdebug_trace();
  objc_msgSend__clearProtectionDataIfNotEntitled(self, v4, v5);
  v8 = objc_msgSend_haveOutstandingHandlers(self, v6, v7) ^ 1;
  objc_msgSend_makeStateTransition_(self, v9, v8);
}

- (void)_clearProtectionDataIfNotEntitled
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  char v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  id v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend_container(self, a2, v2);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v33, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasProtectionDataEntitlement(v6, v7, v8) & 1) != 0)
  {

  }
  else
  {
    v11 = objc_msgSend_trustProtectionData(self, v9, v10);

    if ((v11 & 1) == 0)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend_handlersByRecordID(self, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allValues(v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v34, v38, 16);
      if (v19)
      {
        v22 = v19;
        v23 = *(_QWORD *)v35;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v35 != v23)
              objc_enumerationMutation(v17);
            objc_msgSend_record(*(void **)(*((_QWORD *)&v34 + 1) + 8 * v24), v20, v21);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setProtectionData_(v25, v26, 0);
            objc_msgSend_setProtectionEtag_(v25, v27, 0);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = v25;
              objc_msgSend_setInvitedProtectionData_(v28, v29, 0);
              objc_msgSend_setInvitedProtectionEtag_(v28, v30, 0);
              objc_msgSend_setPublicProtectionData_(v28, v31, 0);
              objc_msgSend_setPublicProtectionEtag_(v28, v32, 0);

            }
            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v34, v38, 16);
        }
        while (v22);
      }

    }
  }
}

- (void)finishWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  dispatch_once_t *v9;
  os_log_t *v10;
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
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_finishDecryption(self, v5, v6);
  if (!v4 && (objc_msgSend_isCancelled(self, v7, v8) & 1) == 0)
  {
    v9 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = (os_log_t *)MEMORY[0x1E0C952B0];
    v11 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v35 = v11;
      objc_msgSend_operationID(self, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v38;
      _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Ensuring all handlers have completed for operation %{public}@", buf, 0xCu);

    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend_modifyHandlersByZoneID(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allValues(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v17;
    v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v48, v53, 16);
    if (v41)
    {
      v40 = *(_QWORD *)v49;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v49 != v40)
            objc_enumerationMutation(obj);
          v42 = v19;
          v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v19);
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v21 = v20;
          v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v44, v52, 16);
          if (v23)
          {
            v26 = v23;
            v27 = *(_QWORD *)v45;
            do
            {
              v28 = 0;
              do
              {
                if (*(_QWORD *)v45 != v27)
                  objc_enumerationMutation(v21);
                if (objc_msgSend_state(*(void **)(*((_QWORD *)&v44 + 1) + 8 * v28), v24, v25) != 14)
                {
                  if (*v9 != -1)
                    dispatch_once(v9, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                  v29 = *v10;
                  if (os_log_type_enabled(*v10, OS_LOG_TYPE_FAULT))
                  {
                    v30 = v29;
                    objc_msgSend_operationID(self, v31, v32);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v55 = v33;
                    _os_log_fault_impl(&dword_1BE990000, v30, OS_LOG_TYPE_FAULT, "Operation %{public}@ tried to finish without an error but it has outstanding handlers", buf, 0xCu);

                  }
                }
                ++v28;
              }
              while (v26 != v28);
              v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v44, v52, 16);
            }
            while (v26);
          }

          v19 = v42 + 1;
        }
        while (v42 + 1 != v41);
        v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v48, v53, 16);
      }
      while (v41);
    }

    v4 = 0;
  }
  v43.receiver = self;
  v43.super_class = (Class)CKDModifyRecordsOperation;
  -[CKDOperation finishWithError:](&v43, sel_finishWithError_, v4);

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  objc_super v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_hash(self, v5, v6);
  kdebug_trace();
  objc_msgSend_modifyHandlersByZoneID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v10, (uint64_t)&unk_1E7837670);

  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend_modifyHandlersByZoneID(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v34, v38, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v35;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v17);
        objc_msgSend_addObject_(v11, v20, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v23++));
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v34, v38, 16);
    }
    while (v21);
  }

  if (objc_msgSend_count(v11, v24, v25))
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_1BEBFD050;
    v32[3] = &unk_1E78305B0;
    v33 = v11;
    objc_msgSend_updateCloudKitMetrics_(self, v27, (uint64_t)v32);

  }
  objc_msgSend_setSaveProgressBlock_(self, v26, 0);
  objc_msgSend_setSaveCompletionBlock_(self, v28, 0);
  objc_msgSend_setDeleteCompletionBlock_(self, v29, 0);
  objc_msgSend_setUploadCompletionBlock_(self, v30, 0);
  v31.receiver = self;
  v31.super_class = (Class)CKDModifyRecordsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v31, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)analyticsPayload
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const __CFString *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)CKDModifyRecordsOperation;
  -[CKDDatabaseOperation analyticsPayload](&v37, sel_analyticsPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_recordsToSave(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);
  objc_msgSend_numberWithUnsignedInteger_(v4, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, 0x1E784B608);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_recordIDsToDelete(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_count(v17, v18, v19);
  objc_msgSend_numberWithUnsignedInteger_(v14, v21, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v23, (uint64_t)v22, 0x1E784B628);

  v26 = objc_msgSend_savePolicy(self, v24, v25);
  v28 = CFSTR("SaveIfServerRecordUnchanged");
  if (v26 == 1)
    v28 = CFSTR("SaveChangedKeys");
  if (v26 == 2)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v27, (uint64_t)CFSTR("SaveAllKeys"), 0x1E784B648);
  else
    objc_msgSend_setObject_forKeyedSubscript_(v3, v27, (uint64_t)v28, 0x1E784B648);
  v31 = (void *)MEMORY[0x1E0CB37E8];
  v32 = objc_msgSend_atomic(self, v29, v30);
  objc_msgSend_numberWithBool_(v31, v33, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v34, 0x1E784B668);

  return v3;
}

- (BOOL)supportsClearAssetEncryption
{
  return 1;
}

- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int isLongLived;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  BOOL v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  void *v48;
  id *v49;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  uint64_t *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD aBlock[5];
  id v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  objc_super v72;
  uint64_t v73;
  _BYTE v74[128];
  _QWORD v75[2];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v72.receiver = self;
  v72.super_class = (Class)CKDModifyRecordsOperation;
  v49 = a4;
  if (-[CKDOperation validateAgainstLiveContainer:error:](&v72, sel_validateAgainstLiveContainer_error_, v51, a4))
  {
    objc_msgSend_operationInfo(self, v5, v6);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = sub_1BE9BB190;
    v70 = sub_1BE9BAE70;
    v71 = 0;
    isLongLived = objc_msgSend_isLongLived(self, v7, v8);
    v10 = MEMORY[0x1E0C809B0];
    if (isLongLived)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1BEBFD688;
      aBlock[3] = &unk_1E7837698;
      v65 = &v66;
      aBlock[4] = self;
      v64 = v51;
      v11 = _Block_copy(aBlock);
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      objc_msgSend_recordsToSave(v48, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v59, v76, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v60;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v60 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v18);
            v75[0] = objc_opt_class();
            v75[1] = objc_opt_class();
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)v75, 2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v19) = objc_msgSend_containsValueOfClasses_passingTest_(v19, v22, (uint64_t)v21, v11);

            if ((_DWORD)v19 && !v67[5])
            {
              objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v23, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 2982, CFSTR("If you're gonna fail our value check, there better be a reason"));

            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v23, (uint64_t)&v59, v76, 16);
        }
        while (v16);
      }

      v27 = (void *)v67[5];
      if (v27)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v27);

        v28 = 0;
LABEL_33:
        _Block_object_dispose(&v66, 8);

        goto LABEL_34;
      }

      v10 = MEMORY[0x1E0C809B0];
    }
    v56[0] = v10;
    v56[1] = 3221225472;
    v56[2] = sub_1BEBFDAA0;
    v56[3] = &unk_1E78376C0;
    v57 = v51;
    v58 = &v66;
    v29 = _Block_copy(v56);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend_recordsToSave(v48, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v52, v74, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v53;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v53 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v36);
          v73 = objc_opt_class();
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v38, (uint64_t)&v73, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v37) = objc_msgSend_containsValueOfClasses_passingTest_(v37, v40, (uint64_t)v39, v29);

          if ((_DWORD)v37 && !v67[5])
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)a2, self, CFSTR("CKDModifyRecordsOperation.m"), 3008, CFSTR("If you're gonna fail our value check, there better be a reason"));

          }
          ++v36;
        }
        while (v34 != v36);
        v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v41, (uint64_t)&v52, v74, 16);
      }
      while (v34);
    }

    v45 = (void *)v67[5];
    v28 = v45 == 0;
    if (v49 && v45)
      *v49 = objc_retainAutorelease(v45);

    goto LABEL_33;
  }
  v28 = 0;
LABEL_34:

  return v28;
}

- (id)relevantZoneIDs
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordsToSave(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordIDsToDelete(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v8, v9) || objc_msgSend_count(v7, v10, v11))
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v13 = v4;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v41, v46, 16);
    if (v15)
    {
      v18 = v15;
      v19 = *(_QWORD *)v42;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(v13);
          objc_msgSend_recordID(*(void **)(*((_QWORD *)&v41 + 1) + 8 * v20), v16, v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneID(v21, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
            objc_msgSend_addObject_(v12, v25, (uint64_t)v24);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v41, v46, 16);
      }
      while (v18);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = v7;
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v37, v45, 16);
    if (v28)
    {
      v31 = v28;
      v32 = *(_QWORD *)v38;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v38 != v32)
            objc_enumerationMutation(v26);
          objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v37 + 1) + 8 * v33), v29, v30, (_QWORD)v37);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
            objc_msgSend_addObject_(v12, v34, (uint64_t)v35);

          ++v33;
        }
        while (v31 != v33);
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v37, v45, 16);
      }
      while (v31);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setRetryPCSFailures:(BOOL)a3
{
  self->_retryPCSFailures = a3;
}

- (BOOL)canSetPreviousProtectionEtag
{
  return self->_canSetPreviousProtectionEtag;
}

- (void)setCanSetPreviousProtectionEtag:(BOOL)a3
{
  self->_canSetPreviousProtectionEtag = a3;
}

- (BOOL)trustProtectionData
{
  return self->_trustProtectionData;
}

- (void)setTrustProtectionData:(BOOL)a3
{
  self->_trustProtectionData = a3;
}

- (BOOL)alwaysFetchPCSFromServer
{
  return self->_alwaysFetchPCSFromServer;
}

- (void)setAlwaysFetchPCSFromServer:(BOOL)a3
{
  self->_alwaysFetchPCSFromServer = a3;
}

- (NSData)cachedGlobalPerUserBoundaryKeyData
{
  return self->_cachedGlobalPerUserBoundaryKeyData;
}

- (void)setCachedGlobalPerUserBoundaryKeyData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (void)setTranslator:(id)a3
{
  objc_storeStrong((id *)&self->_translator, a3);
}

- (id)saveProgressBlock
{
  return self->_saveProgressBlock;
}

- (void)setSaveProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (id)saveCompletionBlock
{
  return self->_saveCompletionBlock;
}

- (void)setSaveCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (id)deleteCompletionBlock
{
  return self->_deleteCompletionBlock;
}

- (void)setDeleteCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (id)uploadCompletionBlock
{
  return self->_uploadCompletionBlock;
}

- (void)setUploadCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (id)recordsInFlightBlock
{
  return self->_recordsInFlightBlock;
}

- (void)setRecordsInFlightBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (NSArray)recordsToSave
{
  return self->_recordsToSave;
}

- (void)setRecordsToSave:(id)a3
{
  objc_storeStrong((id *)&self->_recordsToSave, a3);
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, a3);
}

- (NSDictionary)recordIDsToDeleteToEtags
{
  return self->_recordIDsToDeleteToEtags;
}

- (void)setRecordIDsToDeleteToEtags:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, a3);
}

- (NSDictionary)recordIDsToDeleteToSigningPCSIdentity
{
  return self->_recordIDsToDeleteToSigningPCSIdentity;
}

- (void)setRecordIDsToDeleteToSigningPCSIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToDeleteToSigningPCSIdentity, a3);
}

- (NSDictionary)conflictLosersToResolveByRecordID
{
  return self->_conflictLosersToResolveByRecordID;
}

- (void)setConflictLosersToResolveByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, a3);
}

- (NSDictionary)pluginFieldsForRecordDeletesByID
{
  return self->_pluginFieldsForRecordDeletesByID;
}

- (void)setPluginFieldsForRecordDeletesByID:(id)a3
{
  objc_storeStrong((id *)&self->_pluginFieldsForRecordDeletesByID, a3);
}

- (NSDictionary)handlersByRecordID
{
  return self->_handlersByRecordID;
}

- (void)setHandlersByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_handlersByRecordID, a3);
}

- (NSDictionary)parentsByRecordID
{
  return self->_parentsByRecordID;
}

- (void)setParentsByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_parentsByRecordID, a3);
}

- (NSMapTable)handlersByAssetNeedingRecordFetch
{
  return self->_handlersByAssetNeedingRecordFetch;
}

- (void)setHandlersByAssetNeedingRecordFetch:(id)a3
{
  objc_storeStrong((id *)&self->_handlersByAssetNeedingRecordFetch, a3);
}

- (NSMapTable)handlersByAsset
{
  return self->_handlersByAsset;
}

- (void)setHandlersByAsset:(id)a3
{
  objc_storeStrong((id *)&self->_handlersByAsset, a3);
}

- (NSMutableDictionary)modifyHandlersByZoneID
{
  return self->_modifyHandlersByZoneID;
}

- (void)setModifyHandlersByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_modifyHandlersByZoneID, a3);
}

- (int)saveAttempts
{
  return self->_saveAttempts;
}

- (void)setSaveAttempts:(int)a3
{
  self->_saveAttempts = a3;
}

- (int64_t)savePolicy
{
  return self->_savePolicy;
}

- (void)setSavePolicy:(int64_t)a3
{
  self->_savePolicy = a3;
}

- (NSData)clientChangeTokenData
{
  return self->_clientChangeTokenData;
}

- (void)setClientChangeTokenData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (BOOL)retriedRecords
{
  return self->_retriedRecords;
}

- (void)setRetriedRecords:(BOOL)a3
{
  self->_retriedRecords = a3;
}

- (BOOL)shouldOnlySaveAssetContent
{
  return self->_shouldOnlySaveAssetContent;
}

- (void)setShouldOnlySaveAssetContent:(BOOL)a3
{
  self->_shouldOnlySaveAssetContent = a3;
}

- (BOOL)haveOutstandingHandlers
{
  return self->_haveOutstandingHandlers;
}

- (void)setHaveOutstandingHandlers:(BOOL)a3
{
  self->_haveOutstandingHandlers = a3;
}

- (BOOL)atomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)a3
{
  self->_atomic = a3;
}

- (BOOL)shouldReportRecordsInFlight
{
  return self->_shouldReportRecordsInFlight;
}

- (void)setShouldReportRecordsInFlight:(BOOL)a3
{
  self->_shouldReportRecordsInFlight = a3;
}

- (OS_dispatch_queue)modifyRecordsQueue
{
  return self->_modifyRecordsQueue;
}

- (void)setModifyRecordsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_modifyRecordsQueue, a3);
}

- (NSDictionary)assetUUIDToExpectedProperties
{
  return self->_assetUUIDToExpectedProperties;
}

- (void)setAssetUUIDToExpectedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDToExpectedProperties, a3);
}

- (NSDictionary)packageUUIDToExpectedProperties
{
  return self->_packageUUIDToExpectedProperties;
}

- (void)setPackageUUIDToExpectedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_packageUUIDToExpectedProperties, a3);
}

- (BOOL)originatingFromDaemon
{
  return self->_originatingFromDaemon;
}

- (void)setOriginatingFromDaemon:(BOOL)a3
{
  self->_originatingFromDaemon = a3;
}

- (BOOL)markAsParticipantNeedsNewInvitationToken
{
  return self->_markAsParticipantNeedsNewInvitationToken;
}

- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3
{
  self->_markAsParticipantNeedsNewInvitationToken = a3;
}

- (BOOL)requestNeedsUserPublicKeys
{
  return self->_requestNeedsUserPublicKeys;
}

- (void)setRequestNeedsUserPublicKeys:(BOOL)a3
{
  self->_requestNeedsUserPublicKeys = a3;
}

- (NSArray)userPublicKeys
{
  return self->_userPublicKeys;
}

- (void)setUserPublicKeys:(id)a3
{
  objc_storeStrong((id *)&self->_userPublicKeys, a3);
}

- (C2RequestOptions)streamingAssetRequestOptions
{
  return self->_streamingAssetRequestOptions;
}

- (void)setStreamingAssetRequestOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (BOOL)shouldModifyRecordsInDatabase
{
  return self->_shouldModifyRecordsInDatabase;
}

- (void)setShouldModifyRecordsInDatabase:(BOOL)a3
{
  self->_shouldModifyRecordsInDatabase = a3;
}

- (BOOL)includeMergeableDeltasInModifyRecordsRequest
{
  return self->_includeMergeableDeltasInModifyRecordsRequest;
}

- (void)setIncludeMergeableDeltasInModifyRecordsRequest:(BOOL)a3
{
  self->_includeMergeableDeltasInModifyRecordsRequest = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingAssetRequestOptions, 0);
  objc_storeStrong((id *)&self->_userPublicKeys, 0);
  objc_storeStrong((id *)&self->_packageUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_assetUUIDToExpectedProperties, 0);
  objc_storeStrong((id *)&self->_modifyRecordsQueue, 0);
  objc_storeStrong((id *)&self->_clientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_modifyHandlersByZoneID, 0);
  objc_storeStrong((id *)&self->_handlersByAsset, 0);
  objc_storeStrong((id *)&self->_handlersByAssetNeedingRecordFetch, 0);
  objc_storeStrong((id *)&self->_parentsByRecordID, 0);
  objc_storeStrong((id *)&self->_handlersByRecordID, 0);
  objc_storeStrong((id *)&self->_pluginFieldsForRecordDeletesByID, 0);
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToSigningPCSIdentity, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong(&self->_recordsInFlightBlock, 0);
  objc_storeStrong(&self->_uploadCompletionBlock, 0);
  objc_storeStrong(&self->_deleteCompletionBlock, 0);
  objc_storeStrong(&self->_saveCompletionBlock, 0);
  objc_storeStrong(&self->_saveProgressBlock, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_cachedGlobalPerUserBoundaryKeyData, 0);
  objc_storeStrong((id *)&self->_cloneContextsBySignature, 0);
  objc_storeStrong((id *)&self->_decryptOperation, 0);
}

@end
