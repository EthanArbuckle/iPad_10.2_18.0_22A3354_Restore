@implementation CKDRecordResolveTokenURLRequest

- (CKDRecordResolveTokenURLRequest)initWithOperation:(id)a3 shortTokenLookupInfos:(id)a4
{
  id v7;
  CKDRecordResolveTokenURLRequest *v8;
  CKDRecordResolveTokenURLRequest *v9;
  uint64_t v10;
  NSMutableDictionary *lookupInfosByRequestID;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDRecordResolveTokenURLRequest;
  v8 = -[CKDURLRequest initWithOperation:](&v13, sel_initWithOperation_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lookupInfos, a4);
    v10 = objc_opt_new();
    lookupInfosByRequestID = v9->_lookupInfosByRequestID;
    v9->_lookupInfosByRequestID = (NSMutableDictionary *)v10;

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
  v15.super_class = (Class)CKDRecordResolveTokenURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v15, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_lookupInfos(self, v6, v7, v15.receiver, v15.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, CFSTR("lookupInfos"));
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

- (id)applicationBundleIdentifierForContainerAccess
{
  return CFSTR("com.apple.cloudd");
}

- (id)sourceApplicationSecondaryIdentifier
{
  return 0;
}

- (int64_t)databaseScope
{
  return 3;
}

- (BOOL)sendRequestAnonymously
{
  const char *v3;
  uint64_t v4;
  char v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKDRecordResolveTokenURLRequest;
  if (-[CKDURLRequest sendRequestAnonymously](&v13, sel_sendRequestAnonymously))
    return 1;
  objc_msgSend_container(self, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_useAnonymousToServerShareParticipants(v9, v10, v11);

  return v5;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  return 0;
}

- (id)generateRequestOperations
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend_lookupInfos(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BEAB7530;
  v8[3] = &unk_1E7832AA0;
  v8[4] = self;
  objc_msgSend_CKMap_(v4, v5, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  int hasOwnerParticipant;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  CKDProtocolTranslator *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
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
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  id v80;
  void *v81;
  const char *v82;
  id v83;
  id v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  id v89;
  const char *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  int hasParticipantType;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  int hasParticipantState;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  int hasParticipantPermission;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
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
  void *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  id v153;
  const char *v154;
  uint64_t v155;
  id v156;
  NSObject *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  const char *v166;
  const char *v167;
  uint64_t v168;
  unsigned int RootRecord;
  const char *v170;
  uint64_t v171;
  const char *v172;
  unint64_t v173;
  id v174;
  NSObject *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  unint64_t v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  void *v189;
  id v190;
  NSObject *v191;
  const char *v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  void *v198;
  id v199;
  uint64_t v200;
  NSObject *v201;
  const char *v202;
  const char *v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  unint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  NSObject *v219;
  const char *v220;
  uint64_t v221;
  const char *v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  int hasCallerParticipant;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  void *v234;
  NSObject *v235;
  const char *v236;
  const char *v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  void *v241;
  void *v242;
  NSObject *v243;
  const char *v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  void *v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  void *v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  void *v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t i;
  void *v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  void *v279;
  const char *v280;
  int isEqualToString;
  void *v282;
  const char *v283;
  uint64_t v284;
  void *v285;
  id v286;
  NSObject *v287;
  const char *v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  int v295;
  const char *v296;
  uint64_t v297;
  void *v298;
  const char *v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  void *v303;
  id v304;
  const char *v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  const char *v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  void *v326;
  const char *v327;
  const char *v328;
  uint64_t v329;
  void *v330;
  const char *v331;
  void *v332;
  void *v333;
  NSObject *v334;
  const char *v335;
  uint64_t v336;
  id v337;
  NSObject *v338;
  const char *v339;
  uint64_t v340;
  const char *v341;
  void *v342;
  uint64_t v343;
  CKDRecordResolveTokenURLRequest *v344;
  void *v345;
  const char *v346;
  uint64_t v347;
  void (**v348)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v349;
  uint64_t v350;
  void *v351;
  id v352;
  void *v354;
  const char *v355;
  uint64_t v356;
  void *v357;
  uint64_t v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  const char *v362;
  uint64_t v363;
  const __CFString *v364;
  const char *v365;
  uint64_t v366;
  void *v367;
  const __CFString *v368;
  const char *v369;
  uint64_t v370;
  __CFString *v371;
  uint64_t v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  CKDRecordResolveTokenURLRequest *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  id v385;
  _QWORD v386[4];
  id v387;
  id v388;
  id v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  id v394;
  id v395;
  id v396;
  id v397;
  uint8_t buf[4];
  unint64_t v399;
  __int16 v400;
  id v401;
  __int16 v402;
  const __CFString *v403;
  __int16 v404;
  void *v405;
  _BYTE v406[128];
  uint64_t v407;

  v407 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_response(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lookupInfosByRequestID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_hasRecordResolveTokenResponse(v4, v16, v17))
  {
    v79 = 0;
    v80 = 0;
    goto LABEL_120;
  }
  objc_msgSend_recordResolveTokenResponse(v4, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v20, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_containerEnvironment(v20, v24, v25) == 1)
    v26 = 1;
  else
    v26 = 2;
  v27 = objc_alloc(MEMORY[0x1E0C94C40]);
  v375 = (void *)v23;
  v380 = (void *)objc_msgSend_initWithContainerIdentifier_environment_(v27, v28, v23, v26);
  objc_msgSend_translator(self, v29, v30);
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareMetadata(v20, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v378 = v15;
  if (objc_msgSend_hasParticipantType(v33, v34, v35))
  {
    objc_msgSend_shareMetadata(v20, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_participantType(v38, v39, v40) == 1)
    {
      objc_msgSend_shareMetadata(v20, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      hasOwnerParticipant = objc_msgSend_hasOwnerParticipant(v43, v44, v45);

      if (!hasOwnerParticipant)
        goto LABEL_14;
      objc_msgSend_privateDBTranslator(self, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v49)
      {
        v52 = [CKDProtocolTranslator alloc];
        objc_msgSend_container(self, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)objc_msgSend_initWithContainer_databaseScope_(v52, v56, (uint64_t)v55, 2);
        objc_msgSend_setPrivateDBTranslator_(self, v58, (uint64_t)v57);

        objc_msgSend_shareMetadata(v20, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ownerParticipant(v61, v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userId(v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_privateDBTranslator(self, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setOverriddenContainerScopedUserID_(v73, v74, (uint64_t)v70);

        objc_msgSend_privateDBTranslator(self, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setOverriddenDatabaseScope_(v77, v78, 2);

      }
      objc_msgSend_privateDBTranslator(self, v50, v51);
      v33 = v383;
      v383 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

    }
  }

LABEL_14:
  objc_msgSend_shareRecord(v20, v47, v48);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v397 = 0;
  objc_msgSend_recordFromPRecord_error_(v383, v82, (uint64_t)v81, &v397);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v397;

  if (v83)
  {
    v84 = (id)*MEMORY[0x1E0C952F8];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v84);

    v85 = (id)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_shareRecord(v20, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v399 = (unint64_t)v88;
      v400 = 2112;
      v401 = v83;
      _os_log_impl(&dword_1BE990000, v85, OS_LOG_TYPE_INFO, "Warn: Couldn't get a shareRecord from %@: %@", buf, 0x16u);

    }
  }
  v89 = objc_alloc(MEMORY[0x1E0C95128]);
  v91 = (void *)objc_msgSend_initWithShare_containerID_(v89, v90, (uint64_t)v379, v380);
  objc_msgSend_shareMetadata(v20, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  hasParticipantType = objc_msgSend_hasParticipantType(v94, v95, v96);

  if (hasParticipantType)
  {
    objc_msgSend_shareMetadata(v20, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend_participantType(v100, v101, v102) - 1;
    if (v104 < 4)
      objc_msgSend_setParticipantRole_(v91, v103, v104 + 1);
    else
      objc_msgSend_setParticipantRole_(v91, v103, 0);

  }
  objc_msgSend_shareMetadata(v20, v98, v99);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  hasParticipantState = objc_msgSend_hasParticipantState(v105, v106, v107);

  if (hasParticipantState)
  {
    objc_msgSend_shareMetadata(v20, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend_participantState(v111, v112, v113) - 2;
    if (v115 >= 3)
      objc_msgSend_setParticipantStatus_(v91, v114, 1);
    else
      objc_msgSend_setParticipantStatus_(v91, v114, v115 + 2);

  }
  objc_msgSend_shareMetadata(v20, v109, v110);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  hasParticipantPermission = objc_msgSend_hasParticipantPermission(v116, v117, v118);

  if (hasParticipantPermission)
  {
    objc_msgSend_shareMetadata(v20, v120, v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = objc_msgSend_participantPermission(v122, v123, v124) - 1;
    if (v126 < 4)
      objc_msgSend_setParticipantPermission_(v91, v125, v126 + 1);
    else
      objc_msgSend_setParticipantPermission_(v91, v125, 0);

  }
  objc_msgSend_shareMetadata(v20, v120, v121);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_protectedFullToken(v127, v128, v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProtectedFullToken_(v91, v131, (uint64_t)v130);

  objc_msgSend_shareMetadata(v20, v132, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootRecordType(v134, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v137, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v384 = v91;
  objc_msgSend_setRootRecordType_(v91, v141, (uint64_t)v140);

  v381 = v20;
  if (objc_msgSend_recordsCount(v20, v142, v143))
  {
    v374 = (void *)MEMORY[0x1C3B83E24]();
    objc_msgSend_records(v20, v146, v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v148, v149, v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v396 = 0;
    objc_msgSend_recordFromPRecord_error_(v383, v152, (uint64_t)v151, &v396);
    v376 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = v396;

    if (v153)
    {
      v156 = (id)*MEMORY[0x1E0C952F8];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v156);

      v157 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_records(v20, v158, v159);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v160, v161, v162);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v399 = (unint64_t)v163;
        v400 = 2112;
        v401 = v153;
        _os_log_impl(&dword_1BE990000, v157, OS_LOG_TYPE_INFO, "Warn: Couldn't get a root record from %@: %@", buf, 0x16u);

      }
    }
    v164 = v376;
    objc_msgSend_recordID(v376, v154, v155);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHierarchicalRootRecordID_(v91, v166, (uint64_t)v165);

    RootRecord = objc_msgSend_shouldFetchRootRecord(self, v167, v168);
    if (objc_msgSend_recordsCount(v20, v170, v171) <= (unint64_t)RootRecord)
    {
      v178 = 0;
      v216 = v374;
      objc_msgSend_setSharedItemHierarchyIDs_(v91, v172, 0);
    }
    else
    {
      v173 = RootRecord;
      v174 = (id)*MEMORY[0x1E0C952F8];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v174);

      v175 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v175, OS_LOG_TYPE_DEBUG))
      {
        v358 = objc_msgSend_recordsCount(v20, v176, v177);
        *(_DWORD *)buf = 134217984;
        v399 = v358 - v173;
        _os_log_debug_impl(&dword_1BE990000, v175, OS_LOG_TYPE_DEBUG, "Found %lu additional share hierarchy records", buf, 0xCu);
      }

      v178 = (void *)objc_opt_new();
      objc_msgSend_records(v20, v179, v180);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = objc_msgSend_count(v181, v182, v183);

      if (v184 > v173)
      {
        v372 = 138543362;
        while (1)
        {
          objc_msgSend_records(v20, v185, v186, v372);
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndex_(v187, v188, v173);
          v189 = (void *)objc_claimAutoreleasedReturnValue();

          v190 = (id)*MEMORY[0x1E0C952F8];
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], v190);

          v191 = (id)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled(v191, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_recordIdentifier(v189, v192, v193);
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_value(v209, v210, v211);
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_name(v212, v213, v214);
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v372;
            v399 = (unint64_t)v215;
            _os_log_debug_impl(&dword_1BE990000, v191, OS_LOG_TYPE_DEBUG, "Parsing share hierarchy record %{public}@", buf, 0xCu);

            v20 = v381;
          }

          objc_msgSend_recordIdentifier(v189, v194, v195);
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          v395 = 0;
          objc_msgSend_recordIDFromPRecordIdentifier_error_(v383, v197, (uint64_t)v196, &v395);
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          v199 = v395;

          v200 = *MEMORY[0x1E0C95300];
          if (v199 || !v198)
            break;
          if (v200 != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v201 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v372;
            v399 = (unint64_t)v198;
            _os_log_debug_impl(&dword_1BE990000, v201, OS_LOG_TYPE_DEBUG, "Parsed share hierarchy record ID %{public}@", buf, 0xCu);
          }
          objc_msgSend_addObject_(v178, v202, (uint64_t)v198);

          ++v173;
          objc_msgSend_records(v20, v203, v204);
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          v208 = objc_msgSend_count(v205, v206, v207);

          if (v173 >= v208)
            goto LABEL_67;
        }
        if (v200 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v219 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v399 = (unint64_t)v189;
          v400 = 2112;
          v401 = v199;
          _os_log_impl(&dword_1BE990000, v219, OS_LOG_TYPE_INFO, "Warn: Couldn't get a shared hierarchy record ID from %@: %@", buf, 0x16u);
        }
        objc_msgSend_removeAllObjects(v178, v220, v221);

      }
LABEL_67:
      v91 = v384;
      v216 = v374;
      v164 = v376;
      objc_msgSend_setSharedItemHierarchyIDs_(v384, v185, (uint64_t)v178);
    }
    if (objc_msgSend_shouldFetchRootRecord(self, v217, v218))
      objc_msgSend_setRootRecord_(v91, v222, (uint64_t)v164);

    objc_autoreleasePoolPop(v216);
  }
  objc_msgSend_shareMetadata(v20, v144, v145);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  hasCallerParticipant = objc_msgSend_hasCallerParticipant(v223, v224, v225);

  v79 = v384;
  if (!hasCallerParticipant)
    goto LABEL_82;
  objc_msgSend_shareMetadata(v20, v227, v228);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callerParticipant(v229, v230, v231);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v394 = 0;
  objc_msgSend_shareParticipantFromPParticipant_error_(v383, v233, (uint64_t)v232, &v394);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v235 = v394;
  objc_msgSend_setCallingParticipant_(v384, v236, (uint64_t)v234);

  v79 = v384;
  objc_msgSend_callingParticipant(v384, v237, v238);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIsCurrentUser_(v239, v240, 1);

  v241 = (void *)*MEMORY[0x1E0C952F8];
  if (v235)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v241);
    v242 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v243 = v242;
      objc_msgSend_shareMetadata(v20, v244, v245);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_callerParticipant(v246, v247, v248);
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v399 = (unint64_t)v249;
      v400 = 2112;
      v401 = v235;
      _os_log_impl(&dword_1BE990000, v243, OS_LOG_TYPE_INFO, "Warn: Couldn't get a calling participant from %@: %@", buf, 0x16u);

      v79 = v384;
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v241);
    v250 = (void *)*MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      goto LABEL_82;
    v235 = v250;
    objc_msgSend_callingParticipant(v384, v251, v252);
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v399 = (unint64_t)v253;
    _os_log_impl(&dword_1BE990000, v235, OS_LOG_TYPE_INFO, "Parsed calling participant: %@", buf, 0xCu);

  }
LABEL_82:
  v377 = self;
  objc_msgSend_share(v79, v227, v228);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentUserParticipant(v254, v255, v256);
  v257 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v257)
  {
    objc_msgSend_callingParticipant(v79, v258, v259);
    v260 = (void *)objc_claimAutoreleasedReturnValue();

    if (v260)
    {
      v373 = v10;
      v374 = v4;
      v392 = 0u;
      v393 = 0u;
      v390 = 0u;
      v391 = 0u;
      objc_msgSend_share(v79, v258, v259);
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_participants(v261, v262, v263);
      v264 = (void *)objc_claimAutoreleasedReturnValue();

      v266 = objc_msgSend_countByEnumeratingWithState_objects_count_(v264, v265, (uint64_t)&v390, v406, 16);
      if (v266)
      {
        v269 = v266;
        v270 = *(_QWORD *)v391;
        while (2)
        {
          for (i = 0; i != v269; ++i)
          {
            if (*(_QWORD *)v391 != v270)
              objc_enumerationMutation(v264);
            v272 = *(void **)(*((_QWORD *)&v390 + 1) + 8 * i);
            objc_msgSend_participantID(v272, v267, v268);
            v273 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_callingParticipant(v384, v274, v275);
            v276 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_participantID(v276, v277, v278);
            v279 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v273, v280, (uint64_t)v279);

            if (isEqualToString)
            {
              objc_msgSend_setIsCurrentUser_(v272, v267, 1);
              v20 = v381;
              goto LABEL_94;
            }
            v20 = v381;
          }
          v269 = objc_msgSend_countByEnumeratingWithState_objects_count_(v264, v267, (uint64_t)&v390, v406, 16);
          if (v269)
            continue;
          break;
        }
      }
LABEL_94:

      v4 = v374;
      v10 = v373;
      v79 = v384;
    }
  }
  objc_msgSend_share(v79, v258, v259);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentUserParticipant(v282, v283, v284);
  v285 = (void *)objc_claimAutoreleasedReturnValue();

  v286 = (id)*MEMORY[0x1E0C952F8];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v286);

  v287 = (id)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled(v287, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_share(v79, v288, v289);
    v354 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v354, v355, v356);
    v357 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v399 = (unint64_t)v357;
    v400 = 2112;
    v401 = v285;
    _os_log_debug_impl(&dword_1BE990000, v287, OS_LOG_TYPE_DEBUG, "Found current user participant on share %{public}@: %@", buf, 0x16u);

  }
  objc_msgSend_shareMetadata(v20, v290, v291);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  v295 = objc_msgSend_hasOwnerParticipant(v292, v293, v294);

  if (v295)
  {
    objc_msgSend_shareMetadata(v20, v296, v297);
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ownerParticipant(v298, v299, v300);
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    v389 = 0;
    objc_msgSend_shareParticipantFromPParticipant_error_(v383, v302, (uint64_t)v301, &v389);
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    v304 = v389;

    objc_msgSend_userIdentity(v303, v305, v306);
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOwnerIdentity_(v79, v308, (uint64_t)v307);

  }
  else
  {
    v304 = 0;
  }
  objc_msgSend_shareRecord(v20, v296, v297);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareInfo(v309, v310, v311);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  v315 = objc_msgSend_potentialMatchsCount(v312, v313, v314);

  if (v315)
  {
    objc_msgSend_shareRecord(v20, v316, v317);
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareInfo(v318, v319, v320);
    v321 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_potentialMatchs(v321, v322, v323);
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    v386[0] = MEMORY[0x1E0C809B0];
    v386[1] = 3221225472;
    v386[2] = sub_1BEAB8A50;
    v386[3] = &unk_1E7832AC8;
    v387 = v383;
    v388 = v304;
    objc_msgSend_CKCompactMap_(v324, v325, (uint64_t)v386);
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOutOfNetworkMatches_(v79, v327, (uint64_t)v326);

  }
  if (objc_msgSend_hasRecordZone(v20, v316, v317))
  {
    objc_msgSend_recordZone(v20, v328, v329);
    v330 = (void *)objc_claimAutoreleasedReturnValue();
    v385 = v304;
    objc_msgSend_recordZoneFromPRecordZone_error_(v383, v331, (uint64_t)v330, &v385);
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v385;

    v333 = (void *)*MEMORY[0x1E0C952F8];
    if (v80)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v333);
      v334 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v399 = (unint64_t)v80;
        _os_log_error_impl(&dword_1BE990000, v334, OS_LOG_TYPE_ERROR, "Couldn't parse shared zone from resolve token response: %@", buf, 0xCu);
      }
    }
    else
    {
      v337 = v333;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v337);

      v338 = (id)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled(v338, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_zoneID(v332, v339, v340);
        v359 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_share(v332, v360, v361);
        v382 = (void *)objc_claimAutoreleasedReturnValue();
        if (v382)
          v364 = CFSTR(" with shareID ");
        else
          v364 = CFSTR(" without any shareID ");
        objc_msgSend_share(v332, v362, v363);
        v367 = (void *)objc_claimAutoreleasedReturnValue();
        if (v367)
        {
          objc_msgSend_share(v332, v365, v366);
          v374 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v374, v369, v370);
          v368 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v368 = &stru_1E7838F48;
        }
        *(_DWORD *)buf = 138544130;
        v399 = (unint64_t)v359;
        v400 = 2114;
        v401 = (id)v364;
        v402 = 2114;
        v371 = (__CFString *)v368;
        v403 = v368;
        v404 = 2112;
        v405 = v384;
        _os_log_debug_impl(&dword_1BE990000, v338, OS_LOG_TYPE_DEBUG, "Parsed zone %{public}@%{public}@%{public}@from response for share metadata %@", buf, 0x2Au);
        if (v367)
        {

        }
      }

    }
    objc_msgSend_share(v332, v335, v336);
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    if (v342)
      v343 = (uint64_t)v332;
    else
      v343 = 0;
    v79 = v384;
    objc_msgSend_setSharedZone_(v384, v341, v343);

  }
  else
  {
    v80 = v304;
  }
  self = v377;

  v15 = v378;
LABEL_120:
  objc_msgSend_tokenResolveBlock(self, v18, v19);
  v344 = self;
  v345 = (void *)objc_claimAutoreleasedReturnValue();

  if (v345)
  {
    objc_msgSend_tokenResolveBlock(v344, v346, v347);
    v348 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v349, v350);
    v351 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v348)[2](v348, v15, v79, v351);

  }
  v352 = v80;

  return v352;
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
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend_response(v24, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lookupInfosByRequestID(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_tokenResolveBlock(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_tokenResolveBlock(self, v18, v19);
    v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v24, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD, void *))v20)[2](v20, v14, 0, v23);

  }
}

- (NSSet)rootRecordDesiredKeySet
{
  return self->_rootRecordDesiredKeySet;
}

- (void)setRootRecordDesiredKeySet:(id)a3
{
  objc_storeStrong((id *)&self->_rootRecordDesiredKeySet, a3);
}

- (BOOL)shouldFetchRootRecord
{
  return self->_shouldFetchRootRecord;
}

- (void)setShouldFetchRootRecord:(BOOL)a3
{
  self->_shouldFetchRootRecord = a3;
}

- (id)tokenResolveBlock
{
  return self->_tokenResolveBlock;
}

- (void)setTokenResolveBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSArray)lookupInfos
{
  return self->_lookupInfos;
}

- (void)setLookupInfos:(id)a3
{
  objc_storeStrong((id *)&self->_lookupInfos, a3);
}

- (NSMutableDictionary)lookupInfosByRequestID
{
  return self->_lookupInfosByRequestID;
}

- (void)setLookupInfosByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_lookupInfosByRequestID, a3);
}

- (CKDProtocolTranslator)privateDBTranslator
{
  return self->_privateDBTranslator;
}

- (void)setPrivateDBTranslator:(id)a3
{
  objc_storeStrong((id *)&self->_privateDBTranslator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDBTranslator, 0);
  objc_storeStrong((id *)&self->_lookupInfosByRequestID, 0);
  objc_storeStrong((id *)&self->_lookupInfos, 0);
  objc_storeStrong(&self->_tokenResolveBlock, 0);
  objc_storeStrong((id *)&self->_rootRecordDesiredKeySet, 0);
}

@end
