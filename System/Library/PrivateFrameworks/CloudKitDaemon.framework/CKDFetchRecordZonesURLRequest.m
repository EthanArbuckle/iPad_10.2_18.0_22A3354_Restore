@implementation CKDFetchRecordZonesURLRequest

- (CKDFetchRecordZonesURLRequest)initWithOperation:(id)a3 recordZoneIDs:(id)a4
{
  id v7;
  CKDFetchRecordZonesURLRequest *v8;
  CKDFetchRecordZonesURLRequest *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *recordZones;
  uint64_t v14;
  NSMutableDictionary *zoneIDByRequestID;
  objc_super v17;

  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKDFetchRecordZonesURLRequest;
  v8 = -[CKDURLRequest initWithOperation:](&v17, sel_initWithOperation_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_zoneIDs, a4);
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    recordZones = v9->_recordZones;
    v9->_recordZones = (NSArray *)v12;

    v14 = objc_opt_new();
    zoneIDByRequestID = v9->_zoneIDByRequestID;
    v9->_zoneIDByRequestID = (NSMutableDictionary *)v14;

  }
  return v9;
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
  v15.super_class = (Class)CKDFetchRecordZonesURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v15, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_zoneIDs(self, v6, v7, v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, CFSTR("zoneIDs"));
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
  objc_msgSend_zoneIDs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFetchRecordZoneIDs_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDFetchRecordZonesURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v9, sel_fillOutRequestProperties_, v4);

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

- (BOOL)handlesAnonymousCKUserIDPropagation
{
  return 1;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKDFetchRecordZonesURLRequest;
  if (!-[CKDURLRequest requiresCKAnonymousUserIDs](&v10, sel_requiresCKAnonymousUserIDs))
    return 0;
  objc_msgSend_zoneIDs(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v5, v6, v7) != 0;

  return v8;
}

- (id)generateRequestOperations
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
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
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
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t PCSInfo;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  void *v69;
  void *v70;
  const char *v71;
  const char *v72;
  id v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  void *v87;
  void *v88;
  const char *v89;
  id obj;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend_zoneIDs(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    objc_msgSend_zoneIDs(self, v10, v11);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v92, v96, 16);
    if (v13)
    {
      v16 = v13;
      v17 = *(_QWORD *)v93;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v93 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v18);
          v20 = objc_msgSend_operationType(self, v14, v15);
          objc_msgSend_operationRequestWithType_(self, v21, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_requiresCKAnonymousUserIDs(self, v23, v24))
          {
            objc_msgSend_anonymousCKUserID(v19, v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v27)
            {
              v74 = (void *)objc_opt_new();
              objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v75, (uint64_t)CFSTR("An anonymousCKUserID is required to fetch zone %@ in the shared database when using anonymous to server share participants"), v19);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v74, v77, (uint64_t)v76, *MEMORY[0x1E0CB2D50]);
              objc_msgSend_operation(self, v78, v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_topmostParentOperation(v80, v81, v82);
              v83 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_operationID(v83, v84, v85);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              if (v87)
                objc_msgSend_setObject_forKeyedSubscript_(v74, v86, (uint64_t)v87, *MEMORY[0x1E0C947F8]);
              objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v86, *MEMORY[0x1E0C94B20], 5015, v74);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_finishWithError_(self, v89, (uint64_t)v88);

              v73 = 0;
              goto LABEL_18;
            }
            objc_msgSend_anonymousCKUserID(v19, v28, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_CKDPIdentifier_User(v30, v31, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_request(v22, v34, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setAnonymousCKUserID_(v36, v37, (uint64_t)v33);

          }
          v38 = (void *)objc_opt_new();
          objc_msgSend_setZoneRetrieveRequest_(v22, v39, (uint64_t)v38);

          objc_msgSend_translator(self, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pRecordZoneIdentifierFromRecordZoneID_(v42, v43, (uint64_t)v19);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneRetrieveRequest(v22, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setZoneIdentifier_(v47, v48, (uint64_t)v44);

          PCSInfo = objc_msgSend_onlyFetchPCSInfo(self, v49, v50);
          objc_msgSend_zoneRetrieveRequest(v22, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setOnlyFetchPCSInfo_(v54, v55, PCSInfo);

          objc_msgSend_addObject_(v3, v56, (uint64_t)v22);
          objc_msgSend_zoneIDByRequestID(self, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_request(v22, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_operationUUID(v62, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v59, v66, (uint64_t)v19, v65);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v92, v96, 16);
        if (v16)
          continue;
        break;
      }
    }

  }
  else
  {
    v67 = objc_msgSend_operationType(self, v10, v11);
    objc_msgSend_operationRequestWithType_(self, v68, v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)objc_opt_new();
    objc_msgSend_setZoneRetrieveRequest_(v69, v71, (uint64_t)v70);

    objc_msgSend_addObject_(v3, v72, (uint64_t)v69);
  }
  v73 = v3;
LABEL_18:

  return v73;
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
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t i;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  char isEqual;
  const char *v47;
  uint64_t v48;
  id v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  int v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  id v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  double v131;
  double v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  int SavedPerZone;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  const char *v154;
  const char *v155;
  void *v156;
  const char *v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  void (**v161)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v162;
  uint64_t v163;
  void *v164;
  CKDFetchRecordZonesURLRequest *v165;
  void *v166;
  id v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  id v174;
  const char *v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t j;
  void *v182;
  const char *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  void (**v193)(_QWORD, _QWORD, _QWORD);
  const char *v194;
  uint64_t v195;
  void *v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  int hasError;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  void (**v212)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v213;
  uint64_t v214;
  void *v215;
  NSObject *v216;
  const char *v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  const char *v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  const char *v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  const char *v264;
  uint64_t v265;
  id v266;
  void *v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  void (**v276)(_QWORD, _QWORD);
  const char *v277;
  uint64_t v278;
  void *v279;
  id v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  void *v287;
  const char *v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  CKDFetchRecordZonesURLRequest *v293;
  int isEqualToString;
  id obj;
  uint64_t v296;
  uint64_t v297;
  id v298;
  void *v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  id v304;
  id v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  uint8_t v310[128];
  uint8_t buf[4];
  id v312;
  _BYTE v313[128];
  uint64_t v314;

  v314 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_zoneIDByRequestID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_hasZoneRetrieveResponse(v4, v16, v17))
  {
    objc_msgSend_result(v4, v18, v19);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    hasError = objc_msgSend_hasError(v197, v198, v199);

    if (hasError)
    {
      objc_msgSend_zoneIDs(self, v201, v202);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v206 = objc_msgSend_count(v203, v204, v205);

      if (v206)
      {
        objc_msgSend_recordZoneFetchedBlock(self, v207, v208);
        v209 = (void *)objc_claimAutoreleasedReturnValue();

        if (v209)
        {
          objc_msgSend_recordZoneFetchedBlock(self, v210, v211);
          v212 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend_result(v4, v213, v214);
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, void *, void *, _QWORD))v212)[2](v212, 0, v15, v215, 0);
LABEL_76:

        }
      }
      else
      {
        objc_msgSend_errorFetchingAllRecordZonesBlock(self, v207, v208);
        v281 = (void *)objc_claimAutoreleasedReturnValue();

        if (v281)
        {
          objc_msgSend_errorFetchingAllRecordZonesBlock(self, v282, v283);
          v212 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend_result(v4, v284, v285);
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD), void *))v212[2])(v212, v215);
          goto LABEL_76;
        }
      }
    }
    v27 = 0;
    goto LABEL_78;
  }
  v308 = 0u;
  v309 = 0u;
  v306 = 0u;
  v307 = 0u;
  objc_msgSend_zoneRetrieveResponse(v4, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneSummarys(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v23;
  v297 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v306, v313, 16);
  v27 = 0;
  if (!v297)
    goto LABEL_48;
  v296 = *(_QWORD *)v307;
  v292 = *MEMORY[0x1E0C94730];
  v293 = self;
  while (2)
  {
    for (i = 0; i != v297; ++i)
    {
      if (*(_QWORD *)v307 != v296)
        objc_enumerationMutation(obj);
      v29 = *(void **)(*((_QWORD *)&v306 + 1) + 8 * i);
      objc_msgSend_targetZone(v29, v25, v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        v41 = 0;
        goto LABEL_44;
      }
      objc_msgSend_translator(self, v30, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_anonymousCKUserID(v15, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_databaseScope(self, v37, v38);
      v305 = v27;
      objc_msgSend_recordZoneFromPRecordZone_asAnonymousCKUserID_databaseScope_error_(v33, v40, (uint64_t)v32, v36, v39, &v305);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v298 = v305;

      v299 = v32;
      if (!v41)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v216 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v312 = v298;
          _os_log_error_impl(&dword_1BE990000, v216, OS_LOG_TYPE_ERROR, "Failed to convert record zone: %@", buf, 0xCu);
        }
        objc_msgSend_result(v4, v217, v218);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCode_(v219, v220, 3);

        v221 = (void *)objc_opt_new();
        objc_msgSend_result(v4, v222, v223);
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setError_(v224, v225, (uint64_t)v221);

        v226 = (void *)objc_opt_new();
        objc_msgSend_result(v4, v227, v228);
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_error(v229, v230, v231);
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setClientError_(v232, v233, (uint64_t)v226);

        objc_msgSend_result(v4, v234, v235);
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_error(v236, v237, v238);
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clientError(v239, v240, v241);
        v242 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setType_(v242, v243, 7);

        objc_msgSend_result(v4, v244, v245);
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_error(v246, v247, v248);
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setErrorKey_(v249, v250, (uint64_t)CFSTR("Invalid record zone"));

        v251 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_localizedDescription(v298, v252, v253);
        v254 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v251, v255, (uint64_t)CFSTR("The record zone could not be converted because it is invalid: %@"), v254);
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v4, v257, v258);
        v259 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_error(v259, v260, v261);
        v262 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setErrorDescription_(v262, v263, (uint64_t)v256);

        if (v15)
        {
          v266 = v298;
          v267 = v299;
        }
        else
        {
          objc_msgSend_translator(self, v264, v265);
          v268 = (void *)objc_claimAutoreleasedReturnValue();
          v267 = v299;
          objc_msgSend_zoneIdentifier(v299, v269, v270);
          v271 = (void *)objc_claimAutoreleasedReturnValue();
          v304 = v298;
          objc_msgSend_recordZoneIDFromPRecordZoneIdentifier_asAnonymousCKUserID_error_(v268, v272, (uint64_t)v271, 0, &v304);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v266 = v304;

          if (!v15)
          {
            objc_msgSend_errorFetchingAllRecordZonesBlock(self, v264, v265);
            v287 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v287)
            {
              v15 = 0;
              goto LABEL_73;
            }
            objc_msgSend_errorFetchingAllRecordZonesBlock(self, v288, v289);
            v276 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            objc_msgSend_result(v4, v290, v291);
            v279 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v276)[2](v276, v279);
            v15 = 0;
            goto LABEL_72;
          }
        }
        objc_msgSend_recordZoneFetchedBlock(self, v264, v265);
        v273 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v273)
        {
LABEL_73:
          v280 = v266;

          goto LABEL_79;
        }
        objc_msgSend_recordZoneFetchedBlock(self, v274, v275);
        v276 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v4, v277, v278);
        v279 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(void (**)(_QWORD, _QWORD), _QWORD, void *, void *, id))v276[2])(v276, 0, v15, v279, v266);
LABEL_72:

        goto LABEL_73;
      }
      objc_msgSend_zoneID(v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v44, v45, (uint64_t)v15);

      if ((isEqual & 1) == 0)
      {
        v49 = v4;
        objc_msgSend_ownerName(v15, v47, v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v50, v51, v292);

        objc_msgSend_zoneID(v41, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ownerName(v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend_isEqualToString_(v57, v58, v292);

        objc_msgSend_zoneID(v41, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneName(v62, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneName(v15, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v65, v69, (uint64_t)v68))
        {

          v4 = v49;
          self = v293;
          if (isEqualToString != v59)
            objc_msgSend_setZoneID_(v41, v47, (uint64_t)v15);
        }
        else
        {

          v4 = v49;
          self = v293;
        }
      }
      if (objc_msgSend_hasClientChangeToken(v29, v47, v48))
      {
        objc_msgSend_clientChangeToken(v29, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setClientChangeToken_(v41, v73, (uint64_t)v72);

      }
      if (objc_msgSend_hasCurrentServerContinuationToken(v29, v70, v71))
      {
        v76 = objc_alloc(MEMORY[0x1E0C95100]);
        objc_msgSend_currentServerContinuationToken(v29, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = (void *)objc_msgSend_initWithData_(v76, v80, (uint64_t)v79);

        objc_msgSend_setCurrentServerChangeToken_(v41, v82, (uint64_t)v81);
      }
      if (objc_msgSend_hasDeviceCount(v29, v74, v75))
      {
        v85 = objc_msgSend_deviceCount(v29, v83, v84);
        objc_msgSend_setDeviceCount_(v41, v86, v85);
      }
      if (objc_msgSend_hasAssetQuotaUsage(v29, v83, v84))
      {
        v89 = objc_msgSend_assetQuotaUsage(v29, v87, v88);
        objc_msgSend_setAssetQuotaUsage_(v41, v90, v89);
      }
      if (objc_msgSend_hasMetadataQuotaUsage(v29, v87, v88))
      {
        v93 = objc_msgSend_metadataQuotaUsage(v29, v91, v92);
        objc_msgSend_setMetadataQuotaUsage_(v41, v94, v93);
      }
      if (objc_msgSend_hasZoneishPcsNeedsRolled(v29, v91, v92))
      {
        v97 = objc_msgSend_zoneishPcsNeedsRolled(v29, v95, v96);
        objc_msgSend_setNeedsZoneishPCSRolled_(v41, v98, v97);
      }
      if (objc_msgSend_hasCapabilities(v29, v95, v96))
      {
        objc_msgSend_translator(self, v99, v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_capabilities(v29, v102, v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_msgSend_capabilitiesFromPZoneCapabilities_(v101, v105, (uint64_t)v104);
        objc_msgSend_setCapabilities_(v41, v107, v106);

      }
      if (objc_msgSend_hasZoneKeyRollAllowed(v29, v99, v100))
      {
        v110 = objc_msgSend_zoneKeyRollAllowed(v29, v108, v109);
        objc_msgSend_setZoneKeyRollAllowed_(v41, v111, v110);
      }
      if (objc_msgSend_hasZonePcsModificationTime(v29, v108, v109))
      {
        v114 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend_zonePcsModificationTime(v29, v112, v113);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_time(v115, v116, v117);
        objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v114, v118, v119);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setZonePCSModificationDate_(v41, v121, (uint64_t)v120);

      }
      if (objc_msgSend_hasZonePcsModificationDevice(v29, v112, v113))
      {
        objc_msgSend_zonePcsModificationDevice(v29, v122, v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setZonePCSLastModifierDevice_(v41, v125, (uint64_t)v124);

      }
      if (objc_msgSend_hasExpirationTime(v29, v122, v123))
      {
        objc_msgSend_expirationTime(v29, v126, v127);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_time(v128, v129, v130);
        v132 = v131;

        objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v133, v134, v132);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setExpirationDate_(v41, v136, (uint64_t)v135);

      }
      if (objc_msgSend_hasExpired(v29, v126, v127))
      {
        v139 = objc_msgSend_expired(v29, v137, v138);
        objc_msgSend_setExpired_(v41, v140, v139);
      }
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v137, v138);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isAppleInternalInstall(v141, v142, v143))
        goto LABEL_42;
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v144, v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      SavedPerZone = objc_msgSend_stubRequiredFeaturesUsingLastSavedPerZone(v146, v147, v148);

      if (SavedPerZone)
      {
        objc_msgSend_sharedCache(CKDRequiredFeaturesCache, v150, v151);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_requiredFeaturesForZoneID_(v152, v153, (uint64_t)v15);
        v141 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setRequiredFeatures_(v41, v154, (uint64_t)v141);
        objc_msgSend_setOriginalRequiredFeatures_(v41, v155, (uint64_t)v141);
LABEL_42:

      }
      objc_msgSend_recordZones(self, v150, v151);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v156, v157, (uint64_t)v41);

      v27 = v298;
      v32 = v299;
LABEL_44:
      objc_msgSend_recordZoneFetchedBlock(self, v30, v31);
      v158 = (void *)objc_claimAutoreleasedReturnValue();

      if (v158)
      {
        objc_msgSend_recordZoneFetchedBlock(self, v159, v160);
        v161 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v4, v162, v163);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *, void *, _QWORD))v161)[2](v161, v41, v15, v164, 0);

      }
    }
    v297 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v306, v313, 16);
    if (v297)
      continue;
    break;
  }
LABEL_48:
  v165 = self;
  v166 = v15;

  v167 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend_zoneRetrieveResponse(v4, v168, v169);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anonymousZoneInfos(v170, v171, v172);
  v173 = (void *)objc_claimAutoreleasedReturnValue();

  v302 = 0u;
  v303 = 0u;
  v300 = 0u;
  v301 = 0u;
  v174 = v173;
  v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v174, v175, (uint64_t)&v300, v310, 16);
  if (v176)
  {
    v179 = v176;
    v180 = *(_QWORD *)v301;
    do
    {
      for (j = 0; j != v179; ++j)
      {
        if (*(_QWORD *)v301 != v180)
          objc_enumerationMutation(v174);
        objc_msgSend_anonymousZoneInfoData(*(void **)(*((_QWORD *)&v300 + 1) + 8 * j), v177, v178);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v167, v183, (uint64_t)v182);

      }
      v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v174, v177, (uint64_t)&v300, v310, 16);
    }
    while (v179);
  }

  objc_msgSend_anonymousRecordZoneTuplesFetchedBlock(v165, v184, v185);
  v186 = objc_claimAutoreleasedReturnValue();
  if (v186)
  {
    v189 = (void *)v186;
    v190 = objc_msgSend_count(v167, v187, v188);

    if (v190)
    {
      objc_msgSend_anonymousRecordZoneTuplesFetchedBlock(v165, v191, v192);
      v193 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v4, v194, v195);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *))v193)[2](v193, v167, v196);

    }
  }

  v15 = v166;
LABEL_78:
  v280 = v27;
LABEL_79:

  return v280;
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  id v35;

  v35 = a3;
  objc_msgSend_zoneIDByRequestID(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v35, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_zoneIDs(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_count(v17, v18, v19);

  if (v20)
  {
    objc_msgSend_recordZoneFetchedBlock(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend_recordZoneFetchedBlock(self, v24, v25);
      v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v35, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *, void *, _QWORD))v26)[2](v26, 0, v14, v29, 0);
LABEL_6:

    }
  }
  else
  {
    objc_msgSend_errorFetchingAllRecordZonesBlock(self, v21, v22);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend_errorFetchingAllRecordZonesBlock(self, v31, v32);
      v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v35, v33, v34);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD), void *))v26[2])(v26, v29);
      goto LABEL_6;
    }
  }

}

- (NSArray)recordZones
{
  return self->_recordZones;
}

- (BOOL)onlyFetchPCSInfo
{
  return self->_onlyFetchPCSInfo;
}

- (void)setOnlyFetchPCSInfo:(BOOL)a3
{
  self->_onlyFetchPCSInfo = a3;
}

- (id)recordZoneFetchedBlock
{
  return self->_recordZoneFetchedBlock;
}

- (void)setRecordZoneFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (id)errorFetchingAllRecordZonesBlock
{
  return self->_errorFetchingAllRecordZonesBlock;
}

- (void)setErrorFetchingAllRecordZonesBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (id)anonymousRecordZoneTuplesFetchedBlock
{
  return self->_anonymousRecordZoneTuplesFetchedBlock;
}

- (void)setAnonymousRecordZoneTuplesFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (void)setZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDs, a3);
}

- (NSMutableDictionary)zoneIDByRequestID
{
  return self->_zoneIDByRequestID;
}

- (void)setZoneIDByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDByRequestID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIDByRequestID, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong(&self->_anonymousRecordZoneTuplesFetchedBlock, 0);
  objc_storeStrong(&self->_errorFetchingAllRecordZonesBlock, 0);
  objc_storeStrong(&self->_recordZoneFetchedBlock, 0);
  objc_storeStrong((id *)&self->_recordZones, 0);
}

@end
