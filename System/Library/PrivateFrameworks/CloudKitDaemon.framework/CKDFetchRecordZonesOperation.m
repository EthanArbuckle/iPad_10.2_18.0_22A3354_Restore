@implementation CKDFetchRecordZonesOperation

- (CKDFetchRecordZonesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchRecordZonesOperation *v9;
  uint64_t v10;
  NSArray *recordZoneIDs;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *zonesToSaveForPCSUpdateByZoneID;
  uint64_t v18;
  NSMutableArray *zoneIDsNeedingPCSUpdateRetry;
  uint64_t v20;
  NSMutableDictionary *pcsUpdateErrorsByZoneID;
  uint64_t v22;
  NSMutableSet *zoneIDsNeedingDugongKeyRoll;
  objc_super v25;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKDFetchRecordZonesOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v25, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_recordZoneIDs(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    recordZoneIDs = v9->_recordZoneIDs;
    v9->_recordZoneIDs = (NSArray *)v10;

    v9->_isFetchAllRecordZonesOperation = objc_msgSend_isFetchAllRecordZonesOperation(v6, v12, v13);
    v9->_ignorePCSFailures = objc_msgSend_ignorePCSFailures(v6, v14, v15);
    v16 = objc_opt_new();
    zonesToSaveForPCSUpdateByZoneID = v9->_zonesToSaveForPCSUpdateByZoneID;
    v9->_zonesToSaveForPCSUpdateByZoneID = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    zoneIDsNeedingPCSUpdateRetry = v9->_zoneIDsNeedingPCSUpdateRetry;
    v9->_zoneIDsNeedingPCSUpdateRetry = (NSMutableArray *)v18;

    v20 = objc_opt_new();
    pcsUpdateErrorsByZoneID = v9->_pcsUpdateErrorsByZoneID;
    v9->_pcsUpdateErrorsByZoneID = (NSMutableDictionary *)v20;

    v22 = objc_opt_new();
    zoneIDsNeedingDugongKeyRoll = v9->_zoneIDsNeedingDugongKeyRoll;
    v9->_zoneIDsNeedingDugongKeyRoll = (NSMutableSet *)v22;

  }
  return v9;
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;

  v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      if (objc_msgSend_shouldRetry(self, v5, v6))
      {
        v11 = objc_msgSend_numZoneSaveAttempts(self, v9, v10);
        objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 >= (int)objc_msgSend_PCSRetryCount(v14, v15, v16))
        {

        }
        else
        {
          objc_msgSend_zoneIDsNeedingPCSUpdateRetry(self, v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend_count(v19, v20, v21);

          if (v22)
          {
            objc_msgSend_setShouldRetry_(self, v9, 0);
            objc_msgSend_zonesToSaveForPCSUpdateByZoneID(self, v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeAllObjects(v25, v26, v27);

            objc_msgSend_zoneIDsNeedingPCSUpdateRetry(self, v28, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)objc_msgSend_copy(v30, v31, v32);
            objc_msgSend_setRecordZoneIDs_(self, v34, (uint64_t)v33);

            objc_msgSend_zoneIDsNeedingPCSUpdateRetry(self, v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeAllObjects(v37, v38, v39);

LABEL_4:
            objc_msgSend_setState_(self, v5, 2);
            objc_msgSend_fetchZonesFromServer(self, v7, v8);
            return 1;
          }
        }
      }
      objc_msgSend__sendErrorForFailedZones(self, v9, v10);
      objc_msgSend_setState_(self, v42, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v46, (uint64_t)v45);

      return 1;
    case 2:
      objc_msgSend_setState_(self, v5, 3);
      objc_msgSend_saveZonesWithUpdatedZonePCS(self, v40, v41);
      return 1;
    case 1:
      goto LABEL_4;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 2)
    return CFSTR("Fetching Zones");
  if (a3 == 3)
  {
    v5 = CFSTR("Updating Zone PCS");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchRecordZonesOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-record-zones", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (id)relevantZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)_sendErrorForFailedZones
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD block[5];
  id v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend_zoneIDsNeedingPCSUpdateRetry(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v51, v61, 16);
  if (v6)
  {
    v9 = v6;
    v10 = 0;
    v11 = *(_QWORD *)v52;
    v46 = *MEMORY[0x1E0C94B20];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v52 != v11)
          objc_enumerationMutation(v4);
        v13 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v12);
        objc_msgSend_zonesToSaveForPCSUpdateByZoneID(self, v7, v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v14, v15, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_pcsUpdateErrorsByZoneID(self, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v19, v20, v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E0C94FF8], v22, v46, 2037, 0, CFSTR("Error saving record zone %@ to server: Protection data didn't match"), v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v23 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          v26 = v23;
          v29 = objc_msgSend_numZoneSaveAttempts(self, v27, v28);
          *(_DWORD *)buf = 138412802;
          v56 = v13;
          v57 = 2048;
          v58 = v29;
          v59 = 2112;
          v60 = v21;
          _os_log_impl(&dword_1BE990000, v26, OS_LOG_TYPE_INFO, "Failed to save zone %@ to the server %ld times with error %@", buf, 0x20u);

        }
        if (objc_msgSend_code(v21, v24, v25) == 2053)
          v10 |= objc_msgSend_numZoneSaveAttempts(self, v30, v31) > 1;
        objc_msgSend_callbackQueue(self, v30, v31);
        v32 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1BEC20030;
        block[3] = &unk_1E782F4A8;
        block[4] = self;
        v48 = v16;
        v49 = v13;
        v50 = v21;
        v33 = v21;
        v34 = v16;
        dispatch_async(v32, block);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v51, v61, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v35 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
      {
        v36 = v35;
        objc_msgSend_zoneIDsNeedingPCSUpdateRetry(self, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend_count(v39, v40, v41);
        objc_msgSend_operationID(self, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v56 = v42;
        v57 = 2114;
        v58 = (uint64_t)v45;
        _os_log_fault_impl(&dword_1BE990000, v36, OS_LOG_TYPE_FAULT, "Failed to save %lu zones for operation %{public}@ despite user key sync.", buf, 0x16u);

      }
    }
  }
  else
  {

  }
}

- (void)_locked_callbackForRecordZone:(id)a3 zoneID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  int v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void (**v31)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_callbackQueue(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  objc_msgSend_zoneID(v8, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v9;
  v19 = v18;

  if (v19)
  {
    objc_msgSend_zoneIDsNeedingDugongKeyRoll(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_containsObject_(v22, v23, (uint64_t)v19);

    if (v24)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v25 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        v32 = v25;
        objc_msgSend_operationID(self, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543618;
        v37 = v35;
        v38 = 2114;
        v39 = CFSTR("com.apple.cloudkit.dugongKeyRollOperationFinished");
        _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Operation %{public}@ sending CoreAnalytics event %{public}@", (uint8_t *)&v36, 0x16u);

      }
      objc_msgSend_dugongKeyRollAnalyticsPayloadWithError_(self, v26, (uint64_t)v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

    }
  }
  objc_msgSend_recordZoneFetchedProgressBlock(self, v20, v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend_recordZoneFetchedProgressBlock(self, v29, v30);
    v31 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id))v31)[2](v31, v8, v19, v10);

  }
}

- (BOOL)_locked_checkAndUpdateZonePCSIfNeededForZone:(id)a3 error:(id *)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
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
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  char isEqualToString;
  const char *v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const void *v62;
  const char *v63;
  id v64;
  CKDFetchRecordZonesOperation *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  void *v80;
  CKDFetchRecordZonesOperation *v81;
  uint64_t v82;
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
  uint64_t v95;
  int v96;
  void *v97;
  const char *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  _BOOL4 v102;
  void *v103;
  const char *v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  int v109;
  void *v110;
  const char *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  void *v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  void *v132;
  const char *v133;
  void *v134;
  NSObject *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const void *v142;
  const char *v143;
  int isZoneishZone_bypassAllowlistedContainers;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  int isRemindersZoneThatNeedsUpdate;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  int v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  void *v164;
  CKDFetchRecordZonesOperation *v165;
  const char *v166;
  uint64_t v167;
  NSObject *v168;
  void *v169;
  const char *v170;
  void *v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  const void *v177;
  const char *v178;
  const char *v179;
  uint64_t v180;
  NSObject *v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  int v191;
  int v192;
  int v193;
  int v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  void *v207;
  const char *v208;
  NSObject *v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  void *v213;
  char v214;
  id v215;
  dispatch_once_t *v216;
  _BYTE *v217;
  NSObject *v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  void *v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  const char *v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  void *v248;
  id v249;
  NSObject *v250;
  const char *v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  const char *v258;
  void *v259;
  NSObject *v260;
  const char *v261;
  uint64_t v262;
  void *v263;
  void *v264;
  NSObject *v265;
  void *v266;
  void *v268;
  const char *v269;
  CKDFetchRecordZonesOperation *v270;
  void *v271;
  NSObject *v272;
  const char *v273;
  uint64_t v274;
  void *v275;
  id v276;
  _QWORD *v277;
  NSObject *v278;
  const char *v279;
  uint64_t v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  CKDFetchRecordZonesOperation *v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  void *v290;
  id v291;
  _QWORD *v292;
  NSObject *v293;
  const char *v294;
  uint64_t v295;
  const char *v296;
  uint64_t v297;
  void *v298;
  const char *v299;
  CKDFetchRecordZonesOperation *v300;
  const char *v301;
  uint64_t v302;
  NSObject *v303;
  const char *v304;
  void *v305;
  uint64_t v306;
  const char *v307;
  int v308;
  const char *v309;
  uint64_t v310;
  id v311;
  _QWORD *v312;
  os_log_t *v313;
  NSObject *v314;
  const char *v315;
  uint64_t v316;
  void *v317;
  const char *v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  NSObject *v322;
  dispatch_block_t *v323;
  id v324;
  _QWORD *v325;
  os_log_t *v326;
  NSObject *v327;
  const char *v328;
  uint64_t v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  void *v335;
  const char *v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  void *v340;
  const char *v341;
  const void *v342;
  const char *v343;
  uint64_t v344;
  void *v345;
  const char *v346;
  const char *v347;
  void *v348;
  NSObject *v349;
  const char *v350;
  uint64_t v351;
  void *v352;
  char v353;
  void *v354;
  const char *v355;
  void *v356;
  void *v357;
  const char *v358;
  void *v359;
  const char *v360;
  void *v361;
  const char *v362;
  const char *v363;
  uint64_t v364;
  void *v365;
  const char *v366;
  const char *v367;
  uint64_t v368;
  void *v369;
  const char *v370;
  void *v371;
  const char *v372;
  const char *v373;
  uint64_t v374;
  const char *v375;
  id v376;
  NSObject *v377;
  const char *v378;
  uint64_t v379;
  void *v380;
  NSObject *v381;
  id v382;
  id v383;
  NSObject *v384;
  const char *v385;
  uint64_t v386;
  NSObject *v387;
  void *v388;
  NSObject *v389;
  const char *v390;
  uint64_t v391;
  void *v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  const char *v396;
  uint64_t v397;
  void *v398;
  const char *v399;
  void *v400;
  const char *v401;
  const char *v402;
  uint64_t v403;
  void *v404;
  const char *v405;
  void *v406;
  NSObject *v407;
  const char *v408;
  uint64_t v409;
  void *v410;
  NSObject *v411;
  const char *v412;
  uint64_t v413;
  void *v414;
  void *v415;
  const char *v416;
  char v417;
  int v418;
  int v419;
  CKDFetchRecordZonesOperation *v420;
  CKDFetchRecordZonesOperation *v421;
  CKDFetchRecordZonesOperation *v422;
  uint64_t v423;
  int v424;
  SEL v425;
  uint64_t v426;
  int v427;
  int v428;
  uint64_t v429;
  unsigned int v430;
  void *v431;
  int v432;
  _BOOL4 v433;
  id *v434;
  _BOOL4 v435;
  void *v436;
  void *v437;
  uint64_t v438;
  uint64_t v439;
  void *v440;
  id v441;
  id v442;
  id v443;
  id v444;
  id v445;
  id v446;
  id v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  id v452;
  id v453;
  _QWORD v454[6];
  id v455;
  id v456;
  id v457;
  uint8_t buf[4];
  uint64_t v459;
  __int16 v460;
  id v461;
  __int16 v462;
  void *v463;
  _BYTE v464[128];
  uint64_t v465;

  v465 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend_callbackQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (objc_msgSend_databaseScope(self, v11, v12) != 2)
    goto LABEL_4;
  objc_msgSend_container(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_useAnonymousToServerShareParticipants(v18, v19, v20) & 1) != 0)
  {
    objc_msgSend_zoneID(v7, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneName(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v26, v27, *MEMORY[0x1E0C94A38]);

    if ((isEqualToString & 1) != 0)
    {
LABEL_4:
      v31 = 0;
      goto LABEL_117;
    }
  }
  else
  {

  }
  objc_msgSend_container(self, v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_zonePCS(v7, v36, v37);
  v439 = objc_msgSend_zoneishPCS(v7, v39, v40);
  v440 = v32;
  objc_msgSend_deviceContext(v32, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testDeviceReference(v43, v44, v45);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    objc_msgSend_zoneID(v7, v46, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneName(v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v432 = objc_msgSend_isEqualToString_(v52, v53, (uint64_t)CFSTR("UpdateBreakerZone"));

  }
  else
  {
    v432 = 0;
  }

  if (!*MEMORY[0x1E0C95280])
  {
    v425 = a2;
    v65 = self;
    v434 = a4;
    v435 = 0;
    v427 = 0;
    v433 = 0;
    v61 = v440;
    goto LABEL_15;
  }
  objc_msgSend_unitTestOverrides(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v56, v57, (uint64_t)CFSTR("ZonePCSIdentityRollPartialFailure"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = v440;
  if (!v58)
  {
    v434 = a4;
    objc_msgSend_unitTestOverrides(self, v59, v60);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v97, v98, (uint64_t)CFSTR("RollZoneishMasterKeyOnFetch"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    v102 = v99 != 0;
    if (v99)
      _PCSFPSetShouldRoll();
    objc_msgSend_unitTestOverrides(self, v100, v101);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v103, v104, (uint64_t)CFSTR("RollZoneAndZoneishPCSForShareDelete"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    v435 = v105 != 0;
    v109 = objc_msgSend_checkAndClearUnitTestOverrides_(self, v106, (uint64_t)CFSTR("ForceShouldRollOnceForZonePCSOnDecrypt"));
    if (v109)
      _PCSFPSetShouldRoll();
    objc_msgSend_unitTestOverrides(self, v107, v108);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v110, v111, (uint64_t)CFSTR("ForceShouldRollAlwaysForZonePCSOnDecrypt"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    if (v112)
    {
      v109 = 1;
      _PCSFPSetShouldRoll();
    }
    objc_msgSend_unitTestOverrides(self, v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v115, v116, (uint64_t)CFSTR("ForceZoneResaveButNoKeysRolled"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    if (v117)
    {
      objc_msgSend_pcsManager(v440, v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v457 = 0;
      objc_msgSend_dataFromZonePCS_error_(v120, v121, v38, &v457);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v457;

      if (v64 || !v122)
      {
        a4 = v434;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v265 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v459 = (uint64_t)v64;
          _os_log_error_impl(&dword_1BE990000, v265, OS_LOG_TYPE_ERROR, "Couldn't serialize zone PCS for tests: %@", buf, 0xCu);
        }
      }
      else
      {
        objc_msgSend_setProtectionData_(v7, v123, (uint64_t)v122);
        objc_msgSend_protectionEtag(v7, v124, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPreviousProtectionEtag_(v7, v127, (uint64_t)v126);

        objc_msgSend_pcsManager(v440, v128, v129);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v456 = 0;
        objc_msgSend_etagFromZonePCS_error_(v130, v131, v38, &v456);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v456;
        objc_msgSend_setProtectionEtag_(v7, v133, (uint64_t)v132);

        a4 = v434;
        if (!v64)
        {
          v31 = 1;
          goto LABEL_102;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v134 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          v135 = v134;
          objc_msgSend_zoneID(v7, v136, v137);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v459 = (uint64_t)v138;
          v460 = 2112;
          v461 = v64;
          _os_log_error_impl(&dword_1BE990000, v135, OS_LOG_TYPE_ERROR, "Couldn't create a PCS etag for zone for tests %@: %@", buf, 0x16u);

        }
      }
      v31 = 0;
LABEL_102:

      goto LABEL_103;
    }
    v425 = a2;
    v65 = self;
    objc_msgSend_unitTestOverrides(self, v118, v119);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v169, v170, (uint64_t)CFSTR("RollZoneIdentityOnFetch"));
    v171 = (void *)objc_claimAutoreleasedReturnValue();

    if (v171)
    {
      objc_msgSend_pcsManager(v440, v54, v55);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protectionData(v7, v173, v174);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      v455 = 0;
      v177 = (const void *)objc_msgSend_createSharePCSFromData_ofType_withService_error_(v172, v176, (uint64_t)v175, 3, 3, &v455);
      v64 = v455;

      objc_msgSend_setZonePCS_(v7, v178, (uint64_t)v177);
      if (v177)
        CFRelease(v177);
      if (v64)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        a4 = v434;
        v181 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v459 = (uint64_t)v64;
          _os_log_error_impl(&dword_1BE990000, v181, OS_LOG_TYPE_ERROR, "Couldn't create zone PCS from data: %@", buf, 0xCu);
        }
        goto LABEL_13;
      }
      v433 = v102;
      v38 = objc_msgSend_zonePCS(v7, v179, v180);
      v427 = 1;
    }
    else
    {
      v427 = v109;
      v433 = v102;
    }
LABEL_15:
    objc_msgSend_zonePCSKeysToRemove(v7, v54, v55);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionEtag(v7, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v35, v70, (uint64_t)v66, v38, v69, v65);

    objc_msgSend_zoneishPCSKeysToRemove(v7, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishProtectionData(v7, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_etagFromPCSData_(CKDPCSManager, v78, (uint64_t)v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v431 = v35;
    v80 = v35;
    v81 = v65;
    v82 = v439;
    v84 = objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v80, v83, (uint64_t)v74, v439, v79, v65);

    v426 = v71;
    if (v71 | v84)
    {
      v454[0] = MEMORY[0x1E0C809B0];
      v454[1] = 3221225472;
      v454[2] = sub_1BEC2233C;
      v454[3] = &unk_1E7837D08;
      v454[4] = v71;
      v454[5] = v84;
      objc_msgSend_updateCloudKitMetrics_(v81, v85, (uint64_t)v454);
    }
    objc_msgSend_pcsManager(v61, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v423 = v84;
    if (objc_msgSend_canRollShareKeys(v87, v88, v89))
    {
      objc_msgSend_invitedKeysToRemove(v7, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend_count(v92, v93, v94);
      v96 = v435;
      if (v95)
        v96 = 1;
      v430 = v96;

    }
    else
    {
      v430 = 0;
    }

    objc_msgSend_pcsManager(v61, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = (const void *)v38;
    isZoneishZone_bypassAllowlistedContainers = objc_msgSend_zonePCSNeedsKeyRolled_isZoneishZone_bypassAllowlistedContainers_(v141, v143, v38, v439 != 0, 0);

    objc_msgSend_pcsManager(v61, v145, v146);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    isRemindersZoneThatNeedsUpdate = objc_msgSend_isRemindersZoneThatNeedsUpdate_(v147, v148, v38);

    objc_msgSend_containerID(v81, v150, v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = objc_msgSend_specialContainerType(v152, v153, v154);

    v429 = 0;
    v158 = 0;
    if (v155 == 25 && (isRemindersZoneThatNeedsUpdate & 1) == 0)
    {
      objc_msgSend_container(v81, v156, v157);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v159, v160, v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v453 = 0;
      objc_msgSend_dataFromZonePCS_error_(v162, v163, v38, &v453);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = v81;
      v64 = v453;

      if (v64)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v35 = v431;
        a4 = v434;
        v168 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v459 = (uint64_t)v64;
          _os_log_impl(&dword_1BE990000, v168, OS_LOG_TYPE_INFO, "Warn: Couldn't export protection data for decrypting with Reminders identity: %@", buf, 0xCu);
        }
        v142 = 0;
LABEL_108:

LABEL_109:
        v213 = 0;
LABEL_110:
        v31 = 0;
        goto LABEL_111;
      }
      v420 = v165;
      objc_msgSend_container(v165, v166, v167);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v182, v183, v184);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      v452 = 0;
      v142 = (const void *)objc_msgSend_createSharePCSFromData_ofType_withService_error_(v185, v186, (uint64_t)v164, 3, 4, &v452);
      v64 = v452;

      if (!v142 || v64)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v35 = v431;
        a4 = v434;
        v266 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          v389 = v266;
          objc_msgSend_zoneID(v7, v390, v391);
          v392 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v459 = (uint64_t)v392;
          v460 = 2112;
          v461 = v64;
          _os_log_error_impl(&dword_1BE990000, v389, OS_LOG_TYPE_ERROR, "Couldn't decrypt zone %@ with Reminders identity: %@", buf, 0x16u);

        }
        goto LABEL_108;
      }
      v82 = v439;
      objc_msgSend_pcsManager(v440, v187, v188);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      v429 = (uint64_t)v142;
      v158 = objc_msgSend_zonePCSNeedsKeyRolled_isZoneishZone_bypassAllowlistedContainers_(v189, v190, (uint64_t)v142, v439 != 0, 0);

      v61 = v440;
      v81 = v420;
      v142 = (const void *)v38;
    }
    v191 = isZoneishZone_bypassAllowlistedContainers | v427 | v430;
    v192 = v82 != 0;
    if (v82)
      v193 = isZoneishZone_bypassAllowlistedContainers | v427 | v430;
    else
      v193 = 1;
    if (!v193)
      v192 = v433 | v158;
    v428 = v192;
    v424 = v191;
    if (((v191 | v158) & 1) != 0 || v192)
    {
      objc_msgSend_pcsManager(v61, v156, v157);
      v436 = v7;
      v194 = v158;
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v197 = objc_msgSend_sizeOfPCS_(v195, v196, (uint64_t)v142);
      objc_msgSend_pcsManager(v61, v198, v199);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      v202 = objc_msgSend_sizeOfPCS_(v200, v201, v82) + v197;

      objc_msgSend_pcsManager(v61, v203, v204);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v202) = objc_msgSend_isPCSSizeTooBigForKeyRoll_(v205, v206, v202);

      v158 = v194;
      v7 = v436;
      if ((_DWORD)v202)
      {
        v35 = v431;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        a4 = v434;
        v142 = (const void *)v429;
        v207 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
        {
          v209 = v207;
          objc_msgSend_zoneID(v436, v210, v211);
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v459 = (uint64_t)v212;
          _os_log_impl(&dword_1BE990000, v209, OS_LOG_TYPE_INFO, "Skipping PCS key roll for zone %@ because the combined PCS size is too big", buf, 0xCu);

        }
        objc_msgSend_updateCloudKitMetrics_(v81, v208, (uint64_t)&unk_1E7837DE8);
        v213 = 0;
        v31 = 0;
        v64 = 0;
        goto LABEL_111;
      }
    }
    v418 = isRemindersZoneThatNeedsUpdate;
    v419 = v158;
    v214 = v424;
    if (!v424)
    {
      v213 = 0;
      v35 = v431;
      a4 = v434;
      goto LABEL_130;
    }
    v215 = (id)*MEMORY[0x1E0C952F8];
    v216 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    a4 = v434;
    v217 = (_BYTE *)MEMORY[0x1E0C95280];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v215);

    v218 = (id)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled(v218, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_zoneID(v7, v219, v220);
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v459 = (uint64_t)v221;
      _os_log_impl(&dword_1BE990000, v218, OS_LOG_TYPE_INFO, "Updating identity on zone PCS for zone %@", buf, 0xCu);

    }
    if (*v217)
    {
      objc_msgSend_unitTestOverrides(v81, v222, v223);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v224, v225, (uint64_t)CFSTR("testUpdatingZonePCSAfterIdentityRoll"));
      v226 = (void *)objc_claimAutoreleasedReturnValue();

      if (v226)
        v227 = 3;
      else
        v227 = 0;
      if (v430)
        goto LABEL_78;
    }
    else
    {
      v227 = 0;
      if (v430)
      {
LABEL_78:
        objc_msgSend_setDidAttemptDugongKeyRoll_(v81, v222, 1);
        v421 = v81;
        objc_msgSend_zoneIDsNeedingDugongKeyRoll(v81, v228, v229);
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v7, v231, v232);
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v230, v234, (uint64_t)v233);

        v450 = 0u;
        v451 = 0u;
        v448 = 0u;
        v449 = 0u;
        v437 = v7;
        objc_msgSend_invitedKeysToRemove(v7, v235, v236);
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        v239 = objc_msgSend_countByEnumeratingWithState_objects_count_(v237, v238, (uint64_t)&v448, v464, 16);
        if (v239)
        {
          v242 = v239;
          v243 = *(_QWORD *)v449;
          do
          {
            v244 = 0;
            do
            {
              if (*(_QWORD *)v449 != v243)
                objc_enumerationMutation(v237);
              v245 = *(_QWORD *)(*((_QWORD *)&v448 + 1) + 8 * v244);
              objc_msgSend_pcsManager(v61, v240, v241);
              v246 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_removePublicKeyID_fromPCS_(v246, v247, v245, v38);
              v248 = (void *)objc_claimAutoreleasedReturnValue();

              if (v248)
              {
                v249 = (id)*MEMORY[0x1E0C952F8];
                if (*v216 != -1)
                  dispatch_once(v216, v249);

                v250 = (id)*MEMORY[0x1E0C952D8];
                if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend_zoneID(v437, v251, v252);
                  v253 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v459 = v245;
                  v460 = 2112;
                  v461 = v253;
                  v462 = 2112;
                  v463 = v248;
                  _os_log_error_impl(&dword_1BE990000, v250, OS_LOG_TYPE_ERROR, "Failed to remove server provided invited key %{public}@ from zone %@: %@", buf, 0x20u);

                  v61 = v440;
                }

              }
              ++v244;
            }
            while (v242 != v244);
            v242 = objc_msgSend_countByEnumeratingWithState_objects_count_(v237, v240, (uint64_t)&v448, v464, 16);
          }
          while (v242);
        }

        objc_msgSend_pcsManager(v61, v254, v255);
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        v447 = 0;
        objc_msgSend_rollIdentityForSharePCS_ofType_removeAllExistingPrivateKeys_error_(v256, v257, v38, 3, 0, &v447);
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v447;

        if (v64)
        {
          a4 = v434;
          if (*v216 != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v7 = v437;
          v35 = v431;
          v142 = (const void *)v429;
          v259 = (void *)*MEMORY[0x1E0C952D8];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
            goto LABEL_110;
          v260 = v259;
          objc_msgSend_zoneID(v437, v261, v262);
          v263 = v213;
          v264 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v459 = (uint64_t)v264;
          v460 = 2112;
          v461 = v64;
          _os_log_error_impl(&dword_1BE990000, v260, OS_LOG_TYPE_ERROR, "Failed to roll identity for zone PCS for zone %@: %@", buf, 0x16u);

          v213 = v263;
          goto LABEL_140;
        }
        v81 = v421;
        objc_msgSend_updateCloudKitMetrics_(v421, v258, (uint64_t)&unk_1E7837E08);
        a4 = v434;
        v7 = v437;
        v35 = v431;
        goto LABEL_129;
      }
    }
    objc_msgSend_pcsManager(v61, v222, v223);
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updateIdentityAndRollKeyForZonePCS_usingServiceIdentityWithType_forOperation_(v268, v269, v38, v227, v81);
    v270 = v81;
    v64 = (id)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      if (*v216 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v35 = v431;
      v142 = (const void *)v429;
      v271 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        v272 = v271;
        objc_msgSend_zoneID(v7, v273, v274);
        v275 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v459 = (uint64_t)v275;
        v460 = 2112;
        v461 = v64;
        _os_log_error_impl(&dword_1BE990000, v272, OS_LOG_TYPE_ERROR, "Couldn't update identity on zone PCS for zone %@: %@", buf, 0x16u);

      }
      goto LABEL_109;
    }
    v213 = 0;
    v35 = v431;
    v81 = v270;
LABEL_129:
    v142 = (const void *)v38;
    v158 = v419;
    v214 = v424;
LABEL_130:
    v438 = (uint64_t)v213;
    if (v158)
    {
      v276 = (id)*MEMORY[0x1E0C952F8];
      v277 = (_QWORD *)MEMORY[0x1E0C95300];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v276);
      v142 = (const void *)v429;

      v278 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v278, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_zoneID(v7, v279, v280);
        v281 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v459 = (uint64_t)v281;
        _os_log_impl(&dword_1BE990000, v278, OS_LOG_TYPE_INFO, "Reminders zone %@ needs to be rolled for the Reminders identity", buf, 0xCu);

      }
      objc_msgSend_pcsManager(v61, v282, v283);
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateIdentityAndRollKeyForZonePCS_usingServiceIdentityWithType_forOperation_(v284, v285, v429, 4, v81);
      v286 = v81;
      v64 = (id)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (*v277 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v213 = (void *)v438;
        v287 = (void *)*MEMORY[0x1E0C952D8];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
          goto LABEL_110;
        v260 = v287;
        objc_msgSend_zoneID(v7, v288, v289);
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v459 = (uint64_t)v290;
        v460 = 2112;
        v461 = v64;
        _os_log_error_impl(&dword_1BE990000, v260, OS_LOG_TYPE_ERROR, "Couldn't roll Reminders identity on zone PCS for zone %@: %@", buf, 0x16u);

        v213 = (void *)v438;
LABEL_140:

        goto LABEL_110;
      }
      v214 = 1;
      v81 = v286;
      v213 = (void *)v438;
    }
    if (v428)
    {
      v291 = (id)*MEMORY[0x1E0C952F8];
      v292 = (_QWORD *)MEMORY[0x1E0C95300];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v291);

      v293 = (id)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled(v293, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_zoneID(v7, v294, v295);
        v388 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v459 = (uint64_t)v388;
        _os_log_debug_impl(&dword_1BE990000, v293, OS_LOG_TYPE_DEBUG, "Updating zoneish PCS on zone %@", buf, 0xCu);

      }
      objc_msgSend_pcsManager(v440, v296, v297);
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rollMasterKeyForRecordPCS_isZoneishRecord_bypassAllowlistedContainers_forOperation_(v298, v299, v439, 1, v430, v81);
      v300 = v81;
      v64 = (id)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (*v292 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v213 = (void *)v438;
        v142 = (const void *)v429;
        v303 = *MEMORY[0x1E0C952D8];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
          goto LABEL_110;
        *(_DWORD *)buf = 138412290;
        v459 = (uint64_t)v64;
        v304 = "Couldn't roll master key for zoneish PCS: %@";
        goto LABEL_174;
      }
      v422 = v300;
      objc_msgSend_pcsManager(v440, v301, v302);
      v335 = (void *)objc_claimAutoreleasedReturnValue();
      v446 = 0;
      objc_msgSend_dataFromRecordPCS_error_(v335, v336, v439, &v446);
      v337 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v446;

      if (v64 || !v337)
      {
        v213 = (void *)v438;
        if (*v292 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v381 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v459 = (uint64_t)v64;
          _os_log_error_impl(&dword_1BE990000, v381, OS_LOG_TYPE_ERROR, "Couldn't serialize zoneish PCS: %@", buf, 0xCu);
        }
        goto LABEL_227;
      }
      objc_msgSend_pcsManager(v440, v338, v339);
      v340 = (void *)objc_claimAutoreleasedReturnValue();
      v445 = 0;
      v342 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v340, v341, (uint64_t)v337, 1, v142, &v445);
      v64 = v445;

      if (v64 || !v342)
      {
        v213 = (void *)v438;
        if (*v292 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v387 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v459 = (uint64_t)v64;
          _os_log_error_impl(&dword_1BE990000, v387, OS_LOG_TYPE_ERROR, "Couldn't decode zoneishPCS data: %@", buf, 0xCu);
          if (!v342)
            goto LABEL_227;
        }
        else if (!v342)
        {
LABEL_227:

          v31 = 0;
          v35 = v431;
          goto LABEL_228;
        }
LABEL_226:
        CFRelease(v342);
        goto LABEL_227;
      }
      objc_msgSend_pcsManager(v440, v343, v344);
      v345 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateZoneIdentityForRecordPCS_usingZonePCS_isZoneishRecord_bypassAllowlistedContainers_(v345, v346, (uint64_t)v342, v142, 1, v430);
      v64 = (id)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (*v292 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v213 = (void *)v438;
        v348 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          v349 = v348;
          objc_msgSend_zoneID(v7, v350, v351);
          v352 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v459 = (uint64_t)v352;
          v460 = 2112;
          v461 = v64;
          _os_log_error_impl(&dword_1BE990000, v349, OS_LOG_TYPE_ERROR, "Couldn't update identity on zoneish PCS for zone %@: %@", buf, 0x16u);

          v213 = (void *)v438;
        }
        goto LABEL_226;
      }
      objc_msgSend_setZoneishPCS_(v7, v347, (uint64_t)v342);
      CFRelease(v342);
      v395 = objc_msgSend_zoneishPCS(v7, v393, v394);
      objc_msgSend_pcsManager(v440, v396, v397);
      v398 = (void *)objc_claimAutoreleasedReturnValue();
      v444 = 0;
      v439 = v395;
      objc_msgSend_dataFromRecordPCS_error_(v398, v399, v395, &v444);
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v444;

      if (v64 || !v400)
      {
        v213 = (void *)v438;
        if (*v292 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v411 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v459 = (uint64_t)v64;
          _os_log_error_impl(&dword_1BE990000, v411, OS_LOG_TYPE_ERROR, "Couldn't serialize zoneish PCS: %@", buf, 0xCu);
        }
        goto LABEL_240;
      }
      objc_msgSend_setZoneishProtectionData_(v7, v401, (uint64_t)v400);
      objc_msgSend_pcsManager(v440, v402, v403);
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      v213 = (void *)v438;
      objc_msgSend_removePrivateKeysForKeyIDs_fromPCS_(v404, v405, v438, v142);
      v64 = (id)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (*v292 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v406 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          v407 = v406;
          objc_msgSend_zoneID(v7, v408, v409);
          v410 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v459 = (uint64_t)v410;
          v460 = 2112;
          v461 = v64;
          _os_log_error_impl(&dword_1BE990000, v407, OS_LOG_TYPE_ERROR, "Couldn't clean up old private keys from PCS for zone %@: %@", buf, 0x16u);

          v213 = (void *)v438;
        }
LABEL_240:
        v337 = v400;
        goto LABEL_227;
      }

      v417 = 1;
      v35 = v431;
      objc_msgSend_pcsManager(v440, v412, v413);
    }
    else
    {
      v417 = v214;
      v422 = v81;
      objc_msgSend_pcsManager(v61, v156, v157);
    }
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    v306 = (uint64_t)v142;
    v308 = objc_msgSend_zonePCSNeedsUpdate_(v305, v307, (uint64_t)v142) | v432;

    if (v308 == 1)
    {
      v311 = (id)*MEMORY[0x1E0C952F8];
      v312 = (_QWORD *)MEMORY[0x1E0C95300];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v311);

      v313 = (os_log_t *)MEMORY[0x1E0C952D8];
      v314 = (id)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled(v314, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_zoneID(v7, v315, v316);
        v317 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v459 = (uint64_t)v317;
        _os_log_impl(&dword_1BE990000, v314, OS_LOG_TYPE_INFO, "Updating service identity in zone PCS for zone %@", buf, 0xCu);

        v213 = (void *)v438;
      }

      objc_msgSend_pcsManager(v440, v318, v319);
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateServiceIdentityOnZonePCS_(v320, v321, v306);
      v64 = (id)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (*v312 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v322 = *v313;
        if (os_log_type_enabled(*v313, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v459 = (uint64_t)v64;
          _os_log_error_impl(&dword_1BE990000, v322, OS_LOG_TYPE_ERROR, "Couldn't add our updated service identity to zone PCS: %@", buf, 0xCu);
        }
        v31 = 0;
        goto LABEL_228;
      }
    }
    if (v418)
    {
      v323 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
      v324 = (id)*MEMORY[0x1E0C952F8];
      v325 = (_QWORD *)MEMORY[0x1E0C95300];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v324);

      v326 = (os_log_t *)MEMORY[0x1E0C952D8];
      v327 = (id)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled(v327, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_zoneID(v7, v328, v329);
        v330 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v459 = (uint64_t)v330;
        _os_log_impl(&dword_1BE990000, v327, OS_LOG_TYPE_INFO, "Adding Reminders specific identity for Reminders zone %@", buf, 0xCu);

        v213 = (void *)v438;
      }

      objc_msgSend_pcsManager(v440, v331, v332);
      v333 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addIdentityForService_toPCS_(v333, v334, 4, v306);
      v64 = (id)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        if (*v325 != -1)
          dispatch_once(MEMORY[0x1E0C95300], *v323);
        v303 = *v326;
        v142 = (const void *)v429;
        if (!os_log_type_enabled(*v326, OS_LOG_TYPE_ERROR))
          goto LABEL_110;
        *(_DWORD *)buf = 138412290;
        v459 = (uint64_t)v64;
        v304 = "Couldn't add Reminders specific identity for Reminders zone PCS: %@";
LABEL_174:
        _os_log_error_impl(&dword_1BE990000, v303, OS_LOG_TYPE_ERROR, v304, buf, 0xCu);
        goto LABEL_110;
      }
    }
    else if (!v426 && ((v428 | v424 | v419 | v308) & 1) == 0 && !v423)
    {
      v31 = 0;
      v64 = 0;
LABEL_228:
      v142 = (const void *)v429;
LABEL_111:
      if (v142)
        CFRelease(v142);
      goto LABEL_113;
    }
    v353 = v417 ^ 1;
    if (!*MEMORY[0x1E0C95280])
      v353 = 1;
    if ((v353 & 1) == 0)
    {
      objc_msgSend_unitTestOverrides(v422, v309, v310);
      v354 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v354, v355, (uint64_t)CFSTR("ShouldNotKeyRoll"));
      v356 = (void *)objc_claimAutoreleasedReturnValue();

      if (v356)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v309, v310);
        v415 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v415, v416, (uint64_t)v425, v422, CFSTR("CKDFetchRecordZonesOperation.m"), 474, CFSTR("Did not expect a key roll"));

      }
    }
    if (v423)
    {
      v443 = 0;
      objc_msgSend_dataFromRecordPCS_error_(v35, v309, v439, &v443);
      v357 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v443;
      if (v64 || !v357)
      {
        v383 = (id)*MEMORY[0x1E0C952F8];
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], v383);
        v142 = (const void *)v429;

        v384 = (id)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled(v384, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_zoneID(v7, v385, v386);
          v414 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v459 = (uint64_t)v414;
          v460 = 2112;
          v461 = v64;
          _os_log_error_impl(&dword_1BE990000, v384, OS_LOG_TYPE_ERROR, "Failed to serialize zoneish PCS for zone ID: %@: %@", buf, 0x16u);

        }
        v31 = 1;
        v213 = (void *)v438;
        goto LABEL_111;
      }
      objc_msgSend_setZoneishProtectionData_(v7, v358, (uint64_t)v357);

    }
    objc_msgSend_pcsManager(v440, v309, v310);
    v359 = (void *)objc_claimAutoreleasedReturnValue();
    v442 = 0;
    objc_msgSend_dataFromZonePCS_error_(v359, v360, v306, &v442);
    v361 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v442;

    if (v64 || !v361)
    {
      v382 = (id)*MEMORY[0x1E0C952F8];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v382);
      v142 = (const void *)v429;

      v377 = (id)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled(v377, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v459 = (uint64_t)v64;
        _os_log_error_impl(&dword_1BE990000, v377, OS_LOG_TYPE_ERROR, "Couldn't serialize zone PCS: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend_setProtectionData_(v7, v362, (uint64_t)v361);
      objc_msgSend_protectionEtag(v7, v363, v364);
      v365 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPreviousProtectionEtag_(v7, v366, (uint64_t)v365);

      objc_msgSend_pcsManager(v440, v367, v368);
      v369 = (void *)objc_claimAutoreleasedReturnValue();
      v441 = 0;
      objc_msgSend_etagFromZonePCS_error_(v369, v370, v306, &v441);
      v371 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v441;
      objc_msgSend_setProtectionEtag_(v7, v372, (uint64_t)v371);

      if (v432 && !objc_msgSend_numZoneSaveAttempts(v422, v373, v374))
        objc_msgSend_setPreviousProtectionEtag_(v7, v375, (uint64_t)CFSTR("NO_ETAG_FOR_YOU"));
      v213 = (void *)v438;
      v142 = (const void *)v429;
      if (!v64)
        goto LABEL_216;
      v376 = (id)*MEMORY[0x1E0C952F8];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v376);

      v377 = (id)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled(v377, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_zoneID(v7, v378, v379);
        v380 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v459 = (uint64_t)v380;
        v460 = 2112;
        v461 = v64;
        _os_log_error_impl(&dword_1BE990000, v377, OS_LOG_TYPE_ERROR, "Couldn't create a PCS etag for zone %@: %@", buf, 0x16u);

      }
    }

    v213 = (void *)v438;
LABEL_216:

    v31 = 1;
    goto LABEL_111;
  }
  v62 = (const void *)PCSFPCreatePrivateKey();
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v63, *MEMORY[0x1E0C94B20], 5018, CFSTR("Partially failing zone identity update because unit tests"));
  v64 = (id)objc_claimAutoreleasedReturnValue();
  if (v62)
    CFRelease(v62);
LABEL_13:
  v31 = 0;
LABEL_103:
  v213 = 0;
LABEL_113:
  if (a4 && v64)
    *a4 = objc_retainAutorelease(v64);

LABEL_117:
  return v31;
}

- (void)_handleRecordZoneSaved:(id)a3 error:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  __CFString *v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v20 = CFSTR(" with error ");
    v21 = &stru_1E7838F48;
    *(_DWORD *)buf = 138412802;
    v33 = v6;
    if (v7)
      v21 = v7;
    else
      v20 = &stru_1E7838F48;
    v34 = 2114;
    v35 = v20;
    v36 = 2112;
    v37 = v21;
    _os_log_debug_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEBUG, "Saved updated zone %@%{public}@%@", buf, 0x20u);
    if (!v7)
      goto LABEL_12;
  }
  else if (!v7)
  {
    goto LABEL_12;
  }
  if (objc_msgSend_code(v7, v9, v10) == 2037 || objc_msgSend_code(v7, v9, v11) == 2053)
  {
    objc_msgSend_setShouldRetry_(self, v9, 1);
    objc_msgSend_zoneIDsNeedingPCSUpdateRetry(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v14, v15, (uint64_t)v6);

    objc_msgSend_pcsUpdateErrorsByZoneID(self, v16, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v18, v19, (uint64_t)v7, v6);
    goto LABEL_16;
  }
LABEL_12:
  objc_msgSend_zonesToSaveForPCSUpdateByZoneID(self, v9, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 && v24)
    objc_msgSend__cachePCSOnRecordZone_(self, v25, (uint64_t)v24);
  objc_msgSend_callbackQueue(self, v25, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1BEC2265C;
  v28[3] = &unk_1E782F4A8;
  v28[4] = self;
  v29 = v24;
  v30 = v6;
  v31 = v7;
  v18 = v24;
  dispatch_async(v27, v28);

LABEL_16:
}

- (void)saveZonesWithUpdatedZonePCS
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[5];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend_zonesToSaveForPCSUpdateByZoneID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    v10 = objc_msgSend_numZoneSaveAttempts(self, v8, v9);
    objc_msgSend_setNumZoneSaveAttempts_(self, v11, v10 + 1);
    objc_msgSend_stateTransitionGroup(self, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v14);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v15 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v28 = v15;
      objc_msgSend_zonesToSaveForPCSUpdateByZoneID(self, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allKeys(v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v34;
      _os_log_debug_impl(&dword_1BE990000, v28, OS_LOG_TYPE_DEBUG, "Saving the following zones with updated zone PCS to the server:\n%@", buf, 0xCu);

    }
    v16 = (void *)objc_opt_new();
    objc_msgSend_zonesToSaveForPCSUpdateByZoneID(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allValues(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecordZonesToSave_(v16, v23, (uint64_t)v22);

    objc_msgSend_setAllowDefaultZoneSave_(v16, v24, 1);
    objc_msgSend_setMaxZoneSaveAttempts_(v16, v25, 1);
    v26 = objc_opt_class();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = sub_1BEC2286C;
    v35[3] = &unk_1E782E508;
    v35[4] = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v27, v26, v16, v35);

  }
}

- (void)_handleAnonymousZoneDataObjects:(id)a3 responsecode:(id)a4
{
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  char v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  id v36;
  id v37;
  id obj;
  _QWORD v39[7];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[8];
  uint8_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[3];
  uint64_t v52;
  id location;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v36 = a4;
  objc_msgSend_container(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_useAnonymousToServerShareParticipants(v11, v12, v13);

  if ((v14 & 1) != 0)
  {
    objc_msgSend_stateTransitionGroup(self, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v17);

    objc_initWeak(&location, self);
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    v52 = 0;
    v52 = objc_msgSend_count(v37, v18, v19);
    *(_QWORD *)buf = 0;
    v46 = buf;
    v47 = 0x3032000000;
    v48 = sub_1BE9BB1D0;
    v49 = sub_1BE9BAE90;
    v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v37;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v41, v54, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v42 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend_container(self, v21, v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anonymousSharingManager(v27, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_encryptedTupleData(v26, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = sub_1BEC22E30;
          v39[3] = &unk_1E7837E30;
          v39[5] = buf;
          v39[6] = v51;
          objc_copyWeak(&v40, &location);
          v39[4] = self;
          objc_msgSend_decryptShareTuple_withCompletionBlock_(v30, v34, (uint64_t)v33, v39);

          objc_destroyWeak(&v40);
        }
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v41, v54, 16);
      }
      while (v23);
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v51, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v35 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "useAnonymousToServerShareParticipants is not enabled", buf, 2u);
    }
  }

}

- (void)_handleRecordZoneFetch:(id)a3 zoneID:(id)a4 responseCode:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  int v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  _BOOL4 v50;
  const char *v51;
  uint64_t v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  NSObject *v79;
  id v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  _QWORD block[5];
  id v85;
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  _BYTE location[12];
  __int16 v92;
  id v93;
  __int16 v94;
  uint64_t v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v14 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v81 = v14;
    *(_DWORD *)location = 138412802;
    *(_QWORD *)&location[4] = v10;
    v92 = 2112;
    v93 = v11;
    v94 = 2048;
    v95 = (int)objc_msgSend_code(v12, v82, v83);
    _os_log_debug_impl(&dword_1BE990000, v81, OS_LOG_TYPE_DEBUG, "Fetched record zone %@ (id %@) with response code %ld", location, 0x20u);

  }
  v17 = objc_msgSend_code(v12, v15, v16);
  if (v13 || v17 != 1)
  {
    if (!v13)
    {
      v29 = (void *)MEMORY[0x1E0C94FF8];
      v30 = sub_1BEB10D5C(v12);
      objc_msgSend_request(self, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BEB10290(v33, v12);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v12, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDescription(v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_format_(v29, v41, *MEMORY[0x1E0C94B20], v30, v34, CFSTR("Error fetching record zone %@ from server: %@"), v11, v40);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend_CKIsNotFoundError(v13, v18, v19))
    {
      objc_msgSend_container(self, v20, v21);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_options(v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_useAnonymousToServerShareParticipants(v45, v46, v47))
      {
        v50 = objc_msgSend_databaseScope(self, v48, v49) == 3;

        if (v50)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v53 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)location = 138412290;
            *(_QWORD *)&location[4] = v11;
            _os_log_debug_impl(&dword_1BE990000, v53, OS_LOG_TYPE_DEBUG, "Possible anonymous share %@ not found. Removing share from anonymous share list", location, 0xCu);
          }
          objc_initWeak((id *)location, self);
          objc_msgSend_stateTransitionGroup(self, v54, v55);
          v56 = objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v56);

          objc_msgSend_container(self, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anonymousSharingManager(v59, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v11;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v63, (uint64_t)&v90, 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v88[0] = MEMORY[0x1E0C809B0];
          v88[1] = 3221225472;
          v88[2] = sub_1BEC23434;
          v88[3] = &unk_1E78309E8;
          objc_copyWeak(&v89, (id *)location);
          objc_msgSend_removeAnonymousSharesFromSharedDB_operation_withCompletionBlock_(v62, v65, (uint64_t)v64, self, v88);

          objc_destroyWeak(&v89);
          objc_destroyWeak((id *)location);
        }
      }
      else
      {

      }
      objc_msgSend_container(self, v51, v52);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordCache(v66, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clearAllRecordsForZoneWithID_(v69, v70, (uint64_t)v11);

      objc_msgSend_setPCSData_forFetchedZoneID_(self, v71, 0, v11);
      objc_msgSend_container(self, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsCache(v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removePCSDataForItemsInZoneWithID_(v77, v78, (uint64_t)v11);

    }
    goto LABEL_23;
  }
  objc_msgSend_protectionData(v10, v18, v19);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_23:
    objc_msgSend_callbackQueue(self, v20, v21);
    v79 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEC23544;
    block[3] = &unk_1E782F4A8;
    block[4] = self;
    v85 = v10;
    v86 = v11;
    v87 = v13;
    v80 = v13;
    dispatch_async(v79, block);

    goto LABEL_24;
  }
  objc_msgSend_container(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_bypassPCSEncryption(v25, v26, v27);

  if (v28)
  {
    v13 = 0;
    goto LABEL_23;
  }
  objc_msgSend__continueHandlingFetchedRecordZone_zoneID_(self, v20, (uint64_t)v10, v11);
LABEL_24:

}

- (void)_continueHandlingFetchedRecordZone:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t hasZoneProtectionDataEntitlement;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
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
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  id v57;
  NSObject *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  NSObject *v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  _QWORD block[5];
  id v82;
  id v83;
  _QWORD *v84;
  _QWORD *v85;
  _QWORD *v86;
  _QWORD v87[4];
  id v88;
  NSObject *v89;
  _QWORD v90[4];
  id v91;
  CKDFetchRecordZonesOperation *v92;
  NSObject *v93;
  _QWORD *v94;
  _QWORD *v95;
  id v96;
  id location;
  _QWORD v98[5];
  id v99;
  _QWORD v100[5];
  id v101;
  _QWORD v102[3];
  char v103;

  v6 = a3;
  v7 = a4;
  v102[0] = 0;
  v102[1] = v102;
  v102[2] = 0x2020000000;
  v103 = 1;
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x3032000000;
  v100[3] = sub_1BE9BB1D0;
  v100[4] = sub_1BE9BAE90;
  v101 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x3032000000;
  v98[3] = sub_1BE9BB1D0;
  v98[4] = sub_1BE9BAE90;
  v99 = 0;
  v8 = dispatch_group_create();
  objc_msgSend_stateTransitionGroup(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v11);

  objc_msgSend_container(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  hasZoneProtectionDataEntitlement = objc_msgSend_hasZoneProtectionDataEntitlement(v17, v18, v19);
  objc_msgSend_setSerializeProtectionData_(v6, v21, hasZoneProtectionDataEntitlement);

  v24 = objc_msgSend_databaseScope(self, v22, v23);
  v27 = MEMORY[0x1E0C809B0];
  if (v24 == 2)
  {
    dispatch_group_enter(v8);
    objc_msgSend_noteOperationWillWaitOnPCS(self, v28, v29);
    objc_msgSend_zonePCSModificationDate(v6, v30, v31);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(self, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v34, v35, (uint64_t)CFSTR("OverrideZonePCSModificationDate"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend_unitTestOverrides(self, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v39, v40, (uint64_t)CFSTR("OverrideZonePCSModificationDate"));
        v41 = objc_claimAutoreleasedReturnValue();

        v80 = (void *)v41;
      }
    }
    v79 = v7;
    objc_initWeak(&location, self);
    objc_msgSend_topmostParentOperation(self, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_container(self, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionData(v6, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v27;
    v90[1] = 3221225472;
    v90[2] = sub_1BEC23A08;
    v90[3] = &unk_1E7837E58;
    objc_copyWeak(&v96, &location);
    v94 = v100;
    v57 = v6;
    v91 = v57;
    v92 = self;
    v95 = v98;
    v58 = v8;
    v93 = v58;
    objc_msgSend_createZonePCSFromData_usingServiceIdentityWithType_zonePCSModificationDate_requestorOperationID_completionHandler_(v53, v59, (uint64_t)v56, 0, v80, v47, v90);

    objc_msgSend_containerID(self, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend_specialContainerType(v62, v63, v64);

    if (v65 == 25)
    {
      dispatch_group_enter(v58);
      objc_msgSend_container(self, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protectionData(v57, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = sub_1BEC23C50;
      v87[3] = &unk_1E7837E80;
      v88 = v57;
      v89 = v58;
      objc_msgSend_createZonePCSFromData_usingServiceIdentityWithType_zonePCSModificationDate_requestorOperationID_completionHandler_(v71, v75, (uint64_t)v74, 4, v80, v47, v87);

    }
    objc_destroyWeak(&v96);

    objc_destroyWeak(&location);
    v7 = v79;
    v27 = MEMORY[0x1E0C809B0];
  }
  objc_msgSend_callbackQueue(self, v25, v26, v79);
  v76 = objc_claimAutoreleasedReturnValue();
  block[0] = v27;
  block[1] = 3221225472;
  block[2] = sub_1BEC23D88;
  block[3] = &unk_1E7837EA8;
  block[4] = self;
  v82 = v6;
  v85 = v100;
  v86 = v102;
  v83 = v7;
  v84 = v98;
  v77 = v7;
  v78 = v6;
  dispatch_group_notify(v8, v76, block);

  _Block_object_dispose(v98, 8);
  _Block_object_dispose(v100, 8);

  _Block_object_dispose(v102, 8);
}

- (void)_cachePCSOnRecordZone:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;

  v4 = a3;
  objc_msgSend_dataWithZone_(CKDZonePCSData, v5, (uint64_t)v4);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_zonePCS(v4, v6, v7);
  objc_msgSend_setPcs_(v18, v9, v8);
  v12 = objc_msgSend_zoneishPCS(v4, v10, v11);
  objc_msgSend_setZoneishPCS_(v18, v13, v12);
  objc_msgSend_zoneID(v4, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setPCSData_forFetchedZoneID_(self, v17, (uint64_t)v18, v16);
}

- (int)operationType
{
  return 201;
}

- (void)fetchZonesFromServer
{
  objc_msgSend_fetchZonesFromServer_(self, a2, 0);
}

- (void)fetchZonesFromServer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  CKDFetchRecordZonesURLRequest *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t PCSInfo;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t);
  void *v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  id from;
  _BYTE location[12];
  __int16 v65;
  CKDFetchRecordZonesOperation *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_recordZoneIDs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v8, v9))
  {
    v12 = v4;

    v7 = v12;
  }
  if (objc_msgSend_count(v7, v10, v11) || objc_msgSend_isFetchAllRecordZonesOperation(self, v13, v14))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v15 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      v45 = v15;
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v47;
      v65 = 2048;
      v66 = self;
      v67 = 2114;
      v68 = v50;
      _os_log_debug_impl(&dword_1BE990000, v45, OS_LOG_TYPE_DEBUG, "Fetch record zones operation <%{public}@: %p; %{public}@> is starting",
        location,
        0x20u);

    }
    objc_msgSend_stateTransitionGroup(self, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v18);

    v19 = [CKDFetchRecordZonesURLRequest alloc];
    v21 = (void *)objc_msgSend_initWithOperation_recordZoneIDs_(v19, v20, (uint64_t)self, v7);
    PCSInfo = objc_msgSend_onlyFetchPCSInfo(self, v22, v23);
    objc_msgSend_setOnlyFetchPCSInfo_(v21, v25, PCSInfo);
    objc_initWeak((id *)location, self);
    objc_initWeak(&from, v21);
    objc_msgSend_container(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_options(v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_useAnonymousToServerShareParticipants(v31, v32, v33);

    v35 = MEMORY[0x1E0C809B0];
    if (v34)
    {
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = sub_1BEC245A8;
      v61[3] = &unk_1E7837ED0;
      objc_copyWeak(&v62, (id *)location);
      objc_msgSend_setAnonymousRecordZoneTuplesFetchedBlock_(v21, v36, (uint64_t)v61);
      objc_destroyWeak(&v62);
    }
    v59[0] = v35;
    v59[1] = 3221225472;
    v59[2] = sub_1BEC24710;
    v59[3] = &unk_1E7837EF8;
    objc_copyWeak(&v60, (id *)location);
    objc_msgSend_setRecordZoneFetchedBlock_(v21, v37, (uint64_t)v59);
    v57[0] = v35;
    v57[1] = 3221225472;
    v57[2] = sub_1BEC247A4;
    v57[3] = &unk_1E7833C78;
    objc_copyWeak(&v58, (id *)location);
    objc_msgSend_setErrorFetchingAllRecordZonesBlock_(v21, v38, (uint64_t)v57);
    v51 = v35;
    v52 = 3221225472;
    v53 = sub_1BEC24A70;
    v54 = &unk_1E782E468;
    objc_copyWeak(&v55, (id *)location);
    objc_copyWeak(&v56, &from);
    objc_msgSend_setCompletionBlock_(v21, v39, (uint64_t)&v51);
    objc_msgSend_setRequest_(self, v40, (uint64_t)v21, v51, v52, v53, v54);
    objc_msgSend_container(self, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performRequest_(v43, v44, (uint64_t)v21);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&v55);
    objc_destroyWeak(&v58);
    objc_destroyWeak(&v60);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);

  }
}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  objc_msgSend_recordZoneIDs(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
    v9 = 0;
  else
    v9 = objc_msgSend_isFetchAllRecordZonesOperation(self, v7, v8) ^ 1;

  objc_msgSend_makeStateTransition_(self, v10, v9);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend_recordZoneIDs(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v4, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v10, v11, v12))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1BEC24E38;
    v16[3] = &unk_1E78305B0;
    v17 = v10;
    objc_msgSend_updateCloudKitMetrics_(self, v14, (uint64_t)v16);

  }
  objc_msgSend_setRecordZoneFetchedProgressBlock_(self, v13, 0);
  v15.receiver = self;
  v15.super_class = (Class)CKDFetchRecordZonesOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v15, sel__finishOnCallbackQueueWithError_, v5);

}

- (id)recordZoneFetchedProgressBlock
{
  return self->_recordZoneFetchedProgressBlock;
}

- (void)setRecordZoneFetchedProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSArray)recordZoneIDs
{
  return self->_recordZoneIDs;
}

- (void)setRecordZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordZoneIDs, a3);
}

- (BOOL)isFetchAllRecordZonesOperation
{
  return self->_isFetchAllRecordZonesOperation;
}

- (void)setIsFetchAllRecordZonesOperation:(BOOL)a3
{
  self->_isFetchAllRecordZonesOperation = a3;
}

- (NSMutableDictionary)zonesToSaveForPCSUpdateByZoneID
{
  return self->_zonesToSaveForPCSUpdateByZoneID;
}

- (void)setZonesToSaveForPCSUpdateByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_zonesToSaveForPCSUpdateByZoneID, a3);
}

- (BOOL)shouldRetry
{
  return self->_shouldRetry;
}

- (void)setShouldRetry:(BOOL)a3
{
  self->_shouldRetry = a3;
}

- (NSMutableArray)zoneIDsNeedingPCSUpdateRetry
{
  return self->_zoneIDsNeedingPCSUpdateRetry;
}

- (void)setZoneIDsNeedingPCSUpdateRetry:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDsNeedingPCSUpdateRetry, a3);
}

- (NSMutableDictionary)pcsUpdateErrorsByZoneID
{
  return self->_pcsUpdateErrorsByZoneID;
}

- (void)setPcsUpdateErrorsByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_pcsUpdateErrorsByZoneID, a3);
}

- (int64_t)numZoneSaveAttempts
{
  return self->_numZoneSaveAttempts;
}

- (void)setNumZoneSaveAttempts:(int64_t)a3
{
  self->_numZoneSaveAttempts = a3;
}

- (BOOL)onlyFetchPCSInfo
{
  return self->_onlyFetchPCSInfo;
}

- (void)setOnlyFetchPCSInfo:(BOOL)a3
{
  self->_onlyFetchPCSInfo = a3;
}

- (NSMutableSet)zoneIDsNeedingDugongKeyRoll
{
  return self->_zoneIDsNeedingDugongKeyRoll;
}

- (void)setZoneIDsNeedingDugongKeyRoll:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDsNeedingDugongKeyRoll, a3);
}

- (BOOL)ignorePCSFailures
{
  return self->_ignorePCSFailures;
}

- (void)setIgnorePCSFailures:(BOOL)a3
{
  self->_ignorePCSFailures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIDsNeedingDugongKeyRoll, 0);
  objc_storeStrong((id *)&self->_pcsUpdateErrorsByZoneID, 0);
  objc_storeStrong((id *)&self->_zoneIDsNeedingPCSUpdateRetry, 0);
  objc_storeStrong((id *)&self->_zonesToSaveForPCSUpdateByZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
  objc_storeStrong(&self->_recordZoneFetchedProgressBlock, 0);
}

@end
