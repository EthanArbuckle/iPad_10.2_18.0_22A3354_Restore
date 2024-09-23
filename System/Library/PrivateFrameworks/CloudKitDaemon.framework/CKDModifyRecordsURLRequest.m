@implementation CKDModifyRecordsURLRequest

- (CKDModifyRecordsURLRequest)initWithOperation:(id)a3 recordsToSave:(id)a4 recordIDsToDelete:(id)a5 recordIDsToDeleteToSigningPCSIdentity:(id)a6 oplock:(BOOL)a7 sendAllFields:(BOOL)a8 clientChangeTokenData:(id)a9 requestedFieldsByRecordId:(id)a10
{
  id v17;
  CKDModifyRecordsURLRequest *v18;
  CKDModifyRecordsURLRequest *v19;
  uint64_t v20;
  NSMutableDictionary *recordIDByRequestID;
  uint64_t v22;
  NSMutableDictionary *recordByRequestID;
  uint64_t v24;
  NSMutableDictionary *mergeableFieldKeyByRequestID;
  uint64_t v26;
  NSMutableDictionary *replacementRequestsByRequestID;
  const char *v28;
  uint64_t v29;
  NSMutableArray *skippedRecordsWithPurelyMergeableChanges;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v17 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a9;
  v32 = a10;
  v36.receiver = self;
  v36.super_class = (Class)CKDModifyRecordsURLRequest;
  v18 = -[CKDURLRequest initWithOperation:](&v36, sel_initWithOperation_, a3);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_records, a4);
    objc_storeStrong((id *)&v19->_recordIDsToDelete, a5);
    objc_storeStrong((id *)&v19->_recordIDsToDeleteToSigningPCSIdentity, a6);
    v19->_oplock = a7;
    v19->_sendAllFields = a8;
    objc_storeStrong((id *)&v19->_clientChangeTokenData, a9);
    objc_storeStrong((id *)&v19->_requestedFieldsByRecordID, a10);
    v20 = objc_opt_new();
    recordIDByRequestID = v19->_recordIDByRequestID;
    v19->_recordIDByRequestID = (NSMutableDictionary *)v20;

    v22 = objc_opt_new();
    recordByRequestID = v19->_recordByRequestID;
    v19->_recordByRequestID = (NSMutableDictionary *)v22;

    v24 = objc_opt_new();
    mergeableFieldKeyByRequestID = v19->_mergeableFieldKeyByRequestID;
    v19->_mergeableFieldKeyByRequestID = (NSMutableDictionary *)v24;

    v26 = objc_opt_new();
    replacementRequestsByRequestID = v19->_replacementRequestsByRequestID;
    v19->_replacementRequestsByRequestID = (NSMutableDictionary *)v26;

    v19->_containsMergeableValues = objc_msgSend_CKContains_(v19->_records, v28, (uint64_t)&unk_1E7838678);
    v29 = objc_opt_new();
    skippedRecordsWithPurelyMergeableChanges = v19->_skippedRecordsWithPurelyMergeableChanges;
    v19->_skippedRecordsWithPurelyMergeableChanges = (NSMutableArray *)v29;

  }
  return v19;
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
  v25.super_class = (Class)CKDModifyRecordsURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v25, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_records(self, v6, v7, v25.receiver, v25.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckEquivalencyProperties(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, CFSTR("modifyIDs"));
  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_recordIDsToDelete(self, v16, v17);
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
  objc_msgSend_records(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v7, v8, (uint64_t)&unk_1E7838698);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setModifyRecordIDs_(v4, v10, (uint64_t)v9);
  objc_msgSend_recordIDsToDelete(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeleteRecordIDs_(v4, v14, (uint64_t)v13);

  v15.receiver = self;
  v15.super_class = (Class)CKDModifyRecordsURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v15, sel_fillOutRequestProperties_, v4);

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
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend_records(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v39, v44, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v40;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v6);
        objc_msgSend_recordID(*(void **)(*((_QWORD *)&v39 + 1) + 8 * v13), v9, v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend_addObject_(v3, v18, (uint64_t)v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v39, v44, 16);
    }
    while (v11);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend_recordIDsToDelete(self, v19, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v35, v43, 16);
  if (v23)
  {
    v26 = v23;
    v27 = *(_QWORD *)v36;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v21);
        objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v35 + 1) + 8 * v28), v24, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          objc_msgSend_addObject_(v3, v29, (uint64_t)v30);

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v35, v43, 16);
    }
    while (v26);
  }

  objc_msgSend_allObjects(v3, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;

  v3 = (void *)objc_opt_new();
  objc_msgSend_records(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    v12 = objc_opt_class();
    objc_msgSend_addObject_(v3, v13, v12);
  }
  objc_msgSend_recordIDsToDelete(self, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v14, v15, v16);

  if (v17)
  {
    v20 = objc_opt_class();
    objc_msgSend_addObject_(v3, v21, v20);
  }
  if (objc_msgSend_containsMergeableValues(self, v18, v19))
  {
    v22 = objc_opt_class();
    objc_msgSend_addObject_(v3, v23, v22);
  }
  return v3;
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
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
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
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  int v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  id v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t i;
  uint64_t v105;
  void *v106;
  const char *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  id v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t j;
  uint64_t v167;
  void *v168;
  const char *v169;
  const char *v170;
  const char *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  const char *v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  const char *v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  const char *v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  void *v222;
  const char *v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  const char *v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  const char *v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  const char *v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  const char *v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  void (**v249)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v250;
  uint64_t v251;
  void *v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  void *v258;
  const char *v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  void *v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  void *v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  const char *v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  void *v286;
  const char *v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  void *v291;
  const char *v292;
  uint64_t v293;
  void *v294;
  void *v295;
  void *v296;
  const char *v297;
  const char *v298;
  uint64_t v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  const char *v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  const char *v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  void *v316;
  const char *v317;
  NSObject *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  void *v322;
  const char *v323;
  uint64_t v324;
  void *v325;
  NSObject *v326;
  const char *v327;
  uint64_t v328;
  void *v329;
  NSObject *v330;
  const char *v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  void *v335;
  const char *v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t k;
  uint64_t v350;
  void *v351;
  id v352;
  const char *v353;
  BOOL v354;
  const char *v355;
  const char *v356;
  uint64_t v357;
  void *v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  const char *v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  void *v367;
  const char *v368;
  uint64_t v369;
  void *v370;
  const char *v371;
  uint64_t v372;
  void *v373;
  const char *v374;
  uint64_t v375;
  void *v376;
  const char *v377;
  uint64_t v378;
  void *v379;
  const char *v380;
  void *v381;
  const char *v382;
  const char *v383;
  uint64_t v384;
  void *v385;
  const char *v386;
  void *v387;
  const char *v388;
  uint64_t v389;
  void *v390;
  const char *v391;
  const char *v392;
  uint64_t v393;
  void *v394;
  const char *v395;
  void *v396;
  id v397;
  const char *v398;
  uint64_t v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t m;
  uint64_t v405;
  void *v406;
  const char *v407;
  uint64_t v408;
  void *v409;
  const char *v410;
  void *v411;
  const char *v412;
  void *v413;
  const char *v414;
  const char *v415;
  uint64_t v416;
  const char *v417;
  uint64_t v418;
  void *v419;
  const char *v420;
  void *v421;
  void *v422;
  const char *v423;
  void *v424;
  const char *v425;
  uint64_t v426;
  void *v427;
  const char *v428;
  void *v429;
  const char *v430;
  uint64_t v431;
  void *v432;
  const char *v433;
  void *v434;
  const char *v435;
  uint64_t v436;
  void *v437;
  const char *v438;
  const char *v439;
  uint64_t v440;
  void *v441;
  const char *v442;
  int isEqualToString;
  uint64_t v444;
  void *v445;
  const char *v446;
  const char *v447;
  uint64_t v448;
  void *v449;
  const char *v450;
  uint64_t v451;
  void *v452;
  const char *v453;
  uint64_t v454;
  void *v455;
  const char *v456;
  const char *v457;
  uint64_t v458;
  void *v459;
  const char *v460;
  uint64_t v461;
  void *v462;
  const char *v463;
  uint64_t v464;
  void *v465;
  const char *v466;
  void *v467;
  void *v468;
  const char *v469;
  uint64_t v470;
  void *v471;
  const char *v472;
  void *v473;
  const char *v474;
  const char *v475;
  uint64_t v476;
  void *v477;
  const char *v478;
  uint64_t v479;
  void *v480;
  const char *v481;
  uint64_t v482;
  void *v483;
  const char *v484;
  void *v485;
  const char *v486;
  void *v487;
  void *v488;
  const char *v489;
  void *v490;
  const char *v491;
  const char *v492;
  uint64_t v493;
  void *v494;
  const char *v495;
  uint64_t v496;
  void *v497;
  const char *v498;
  uint64_t v499;
  void *v500;
  const char *v501;
  void *v502;
  const char *v503;
  void *v505;
  id v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  id obj;
  void *v513;
  uint64_t v514;
  id v515;
  id v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  void *v522;
  id v523;
  uint64_t v524;
  char v525;
  void *v526;
  void *v527;
  char v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  id v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  id v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  _BYTE v555[128];
  _BYTE v556[128];
  _BYTE v557[128];
  _BYTE v558[128];
  uint8_t v559[128];
  uint8_t buf[4];
  void *v561;
  __int16 v562;
  void *v563;
  __int16 v564;
  void *v565;
  _BYTE v566[128];
  uint64_t v567;

  v567 = *MEMORY[0x1E0C80C00];
  v511 = (void *)objc_opt_new();
  v551 = 0u;
  v552 = 0u;
  v553 = 0u;
  v554 = 0u;
  objc_msgSend_records(self, v3, v4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v521 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v551, v566, 16);
  v8 = 0;
  if (v521)
  {
    v519 = *(_QWORD *)v552;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v552 != v519)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v551 + 1) + 8 * v9);
      if (objc_msgSend_canSkipRecordSaveForMergeables(v10, v6, v7))
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v12 = (void *)*MEMORY[0x1E0C952E0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
        {
          v318 = v12;
          objc_msgSend_requestUUID(self, v319, v320);
          v321 = v9;
          v322 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v10, v323, v324);
          v325 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v561 = v322;
          v562 = 2112;
          v563 = v325;
          _os_log_debug_impl(&dword_1BE990000, v318, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Skipping record save due to purely mergeable changes in %@\", buf, 0x16u);

          v9 = v321;
        }
        objc_msgSend_skippedRecordsWithPurelyMergeableChanges(self, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v15, v16, (uint64_t)v10);
        goto LABEL_82;
      }
      v525 = v8;
      objc_msgSend_operationRequestWithType_(self, v11, 210);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_requiresCKAnonymousUserIDs(self, v17, v18))
      {
        v21 = v9;
        objc_msgSend_recordID(v10, v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anonymousCKUserID(v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          v467 = (void *)objc_opt_new();
          v468 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend_recordID(v10, v469, v470);
          v471 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v468, v472, (uint64_t)CFSTR("An anonymousCKUserID is required to modify record %@ in the shared database when using anonymous to server share participants"), v471);
          v473 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_setObject_forKeyedSubscript_(v467, v474, (uint64_t)v473, *MEMORY[0x1E0CB2D50]);
          objc_msgSend_operation(self, v475, v476);
          v477 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_topmostParentOperation(v477, v478, v479);
          v480 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_operationID(v480, v481, v482);
          v483 = (void *)objc_claimAutoreleasedReturnValue();

          if (v483)
            objc_msgSend_setObject_forKeyedSubscript_(v467, v484, (uint64_t)v483, *MEMORY[0x1E0C947F8]);
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v484, *MEMORY[0x1E0C94B20], 5015, v467);
          v485 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_finishWithError_(self, v486, (uint64_t)v485);

          v487 = obj;
LABEL_132:

          v506 = 0;
          goto LABEL_133;
        }
        objc_msgSend_recordID(v10, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anonymousCKUserID(v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKDPIdentifier_User(v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v15, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAnonymousCKUserID_(v43, v44, (uint64_t)v40);

        v9 = v21;
      }
      v45 = (void *)objc_opt_new();
      objc_msgSend_setRecordSaveRequest_(v15, v46, (uint64_t)v45);

      objc_msgSend_recordSaveRequest(v15, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setMerge_(v49, v50, 1);

      v53 = objc_msgSend_oplock(self, v51, v52);
      v56 = objc_msgSend_sendAllFields(self, v54, v55);
      objc_opt_class();
      v517 = v9;
      if ((objc_opt_isKindOfClass() & 1) != 0 && v53 ^ 1 | v56)
      {
        objc_msgSend_container(self, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_clientSDKVersion(v59, v60, v61);
        v62 = CKLinkCheckc809671068f5f334951d6b3e996f193c();

        v63 = (void *)*MEMORY[0x1E0C952F8];
        if (v62)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], v63);
          v64 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v326 = v64;
            objc_msgSend_recordID(v10, v327, v328);
            v329 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v561 = v329;
            _os_log_debug_impl(&dword_1BE990000, v326, OS_LOG_TYPE_DEBUG, "Enforcing savePolicy isServerRecordUnchanged for CKShare record %@", buf, 0xCu);

          }
          v56 = 0;
          LODWORD(v53) = 1;
        }
        else
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], v63);
          v65 = (void *)*MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            v330 = v65;
            objc_msgSend_recordID(v10, v331, v332);
            v333 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v334, v53);
            v335 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v336, v56);
            v337 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v561 = v333;
            v562 = 2112;
            v563 = v335;
            v564 = 2112;
            v565 = v337;
            _os_log_debug_impl(&dword_1BE990000, v330, OS_LOG_TYPE_DEBUG, "Warning: Unsupported savePolicy used when saving CKShare record %@, opLock: %@, sendAllFields: %@", buf, 0x20u);

          }
        }
      }
      objc_msgSend_translator(self, v57, v58);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v550 = 0;
      objc_msgSend_deltaPRecordFromRecord_withAllFields_outDeletedMergeFields_outKeysToSend_(v66, v67, (uint64_t)v10, v56, &v550, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v523 = v550;
      objc_msgSend_recordSaveRequest(v15, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRecord_(v71, v72, (uint64_t)v68);

      if ((_DWORD)v53)
      {
        objc_msgSend_etag(v10, v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordSaveRequest(v15, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setEtag_(v78, v79, (uint64_t)v75);

        LODWORD(v78) = objc_msgSend_isKnownToServer(v10, v80, v81);
        objc_msgSend_recordSaveRequest(v15, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v84;
        if ((_DWORD)v78)
          objc_msgSend_setSaveSemantics_(v84, v85, 1);
        else
          objc_msgSend_setSaveSemantics_(v84, v85, 2);
      }
      else
      {
        objc_msgSend_recordSaveRequest(v15, v73, v74);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSaveSemantics_(v86, v87, 3);
      }

      objc_msgSend_recordSaveRequest(v15, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend_saveSemantics(v90, v91, v92);

      if (v93 != 2)
      {
        v96 = v10;
        v548 = 0u;
        v549 = 0u;
        v546 = 0u;
        v547 = 0u;
        v97 = v523;
        v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v98, (uint64_t)&v546, v559, 16);
        if (v99)
        {
          v102 = v99;
          v103 = *(_QWORD *)v547;
          do
          {
            for (i = 0; i != v102; ++i)
            {
              if (*(_QWORD *)v547 != v103)
                objc_enumerationMutation(v97);
              v105 = *(_QWORD *)(*((_QWORD *)&v546 + 1) + 8 * i);
              objc_msgSend_recordSaveRequest(v15, v100, v101);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addFieldsToDeleteIfExistOnMerge_(v106, v107, v105);

            }
            v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v100, (uint64_t)&v546, v559, 16);
          }
          while (v102);
        }

        v10 = v96;
      }
      objc_msgSend_conflictLoserEtags(v10, v94, v95);
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      if (v108)
      {
        v111 = (void *)objc_opt_new();
        objc_msgSend_recordSaveRequest(v15, v112, v113);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setConflictLoserUpdate_(v114, v115, (uint64_t)v111);

        objc_msgSend_conflictLoserEtags(v10, v116, v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = (void *)objc_msgSend_mutableCopy(v118, v119, v120);
        objc_msgSend_recordSaveRequest(v15, v122, v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_conflictLoserUpdate(v124, v125, v126);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setConflictLoserEtags_(v127, v128, (uint64_t)v121);

      }
      objc_msgSend_conflictLosersToResolveByRecordID(self, v109, v110);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v10, v130, v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v129, v133, (uint64_t)v132);
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_count(v134, v135, v136))
      {
        v137 = (void *)objc_msgSend_mutableCopy(v134, v135, v136);
        objc_msgSend_recordSaveRequest(v15, v138, v139);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setConflictLosersToResolves_(v140, v141, (uint64_t)v137);

      }
      if ((v525 & 1) == 0)
      {
        objc_msgSend_header(v15, v135, v136);
        v142 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v142)
        {
          v145 = (void *)objc_opt_new();
          objc_msgSend_setHeader_(v15, v146, (uint64_t)v145);

        }
        objc_msgSend_clientChangeTokenData(self, v143, v144);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_header(v15, v148, v149);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setClientChangeToken_(v150, v151, (uint64_t)v147);

      }
      objc_msgSend_requestedFieldsByRecordID(self, v135, v136);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v10, v153, v154);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v152, v156, (uint64_t)v155);
      v157 = (void *)objc_claimAutoreleasedReturnValue();

      if (v157)
      {
        v515 = v134;
        v526 = v10;
        v160 = (void *)objc_opt_new();
        v542 = 0u;
        v543 = 0u;
        v544 = 0u;
        v545 = 0u;
        v513 = v157;
        v161 = v157;
        v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(v161, v162, (uint64_t)&v542, v558, 16);
        if (v163)
        {
          v164 = v163;
          v165 = *(_QWORD *)v543;
          do
          {
            for (j = 0; j != v164; ++j)
            {
              if (*(_QWORD *)v543 != v165)
                objc_enumerationMutation(v161);
              v167 = *(_QWORD *)(*((_QWORD *)&v542 + 1) + 8 * j);
              v168 = (void *)objc_opt_new();
              objc_msgSend_setName_(v168, v169, v167);
              objc_msgSend_addFields_(v160, v170, (uint64_t)v168);

            }
            v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v161, v171, (uint64_t)&v542, v558, 16);
          }
          while (v164);
        }

        objc_msgSend_recordSaveRequest(v15, v172, v173);
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRequestedFields_(v174, v175, (uint64_t)v160);

        v10 = v526;
        v157 = v513;
        v134 = v515;
      }
      objc_msgSend_recordSaveRequest(v15, v158, v159);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_record(v176, v177, v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();

      if (v179)
        break;
      v220 = (void *)objc_opt_new();
      objc_msgSend_setCode_(v220, v221, 3);
      v222 = (void *)objc_opt_new();
      objc_msgSend_setError_(v220, v223, (uint64_t)v222);

      v224 = (void *)objc_opt_new();
      objc_msgSend_error(v220, v225, v226);
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setClientError_(v227, v228, (uint64_t)v224);

      objc_msgSend_error(v220, v229, v230);
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clientError(v231, v232, v233);
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setType_(v234, v235, 7);

      objc_msgSend_error(v220, v236, v237);
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setErrorKey_(v238, v239, (uint64_t)CFSTR("Invalid values in record"));

      objc_msgSend_error(v220, v240, v241);
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setErrorDescription_(v242, v243, (uint64_t)CFSTR("The record could not be encoded because it has invalid values"));

      objc_msgSend_recordPostedBlock(self, v244, v245);
      v246 = (void *)objc_claimAutoreleasedReturnValue();

      if (v246)
      {
        objc_msgSend_recordPostedBlock(self, v247, v248);
        v249 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v10, v250, v251);
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD, _QWORD, _QWORD, void *, _QWORD, _QWORD, _QWORD))v249)[2](v249, v252, 0, 0, 0, v220, 0, 0, 0);
LABEL_80:

      }
      v9 = v517;

      v8 = 1;
LABEL_82:

      if (++v9 == v521)
      {
        v521 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v551, v566, 16);
        if (v521)
          goto LABEL_3;
        goto LABEL_84;
      }
    }
    objc_msgSend_previousProtectionEtag(v10, v180, v181);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordSaveRequest(v15, v183, v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecordProtectionInfoTag_(v185, v186, (uint64_t)v182);

    if (objc_msgSend_databaseScope(self, v187, v188) == 2 || objc_msgSend_databaseScope(self, v189, v190) == 3)
    {
      objc_msgSend_zoneProtectionEtag(v10, v189, v190);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordSaveRequest(v15, v192, v193);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneProtectionInfoTag_(v194, v195, (uint64_t)v191);

      if (objc_msgSend_hasUpdatedShare(v10, v196, v197))
      {
        objc_msgSend_shareEtag(v10, v189, v190);
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordSaveRequest(v15, v199, v200);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setShareEtag_(v201, v202, (uint64_t)v198);

        v203 = (void *)objc_opt_new();
        objc_msgSend_recordSaveRequest(v15, v204, v205);
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setShareIDUpdate_(v206, v207, (uint64_t)v203);

        objc_msgSend_share(v10, v208, v209);
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        if (v212)
        {
          objc_msgSend_translator(self, v210, v211);
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_share(v10, v214, v215);
          v509 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v509, v216, v217);
          v510 = v213;
          v508 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pShareIdentifierFromRecordID_(v213, v218, (uint64_t)v508);
          v219 = objc_claimAutoreleasedReturnValue();
          v507 = (void *)v219;
        }
        else
        {
          v219 = 0;
        }
        objc_msgSend_recordSaveRequest(v15, v210, v211);
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_shareIDUpdate(v253, v254, v255);
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setShareId_(v256, v257, v219);

        if (v212)
        {

        }
      }
    }
    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(self, v189, v190);
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v258, v259, (uint64_t)CFSTR("NoRecordProtectionInfoOnSaves"));
      v260 = (void *)objc_claimAutoreleasedReturnValue();

      if (v260)
      {
        objc_msgSend_recordSaveRequest(v15, v261, v262);
        v263 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_record(v263, v264, v265);
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setProtectionInfo_(v266, v267, 0);

      }
      objc_msgSend_pcsKeysToRemove(v10, v261, v262);
      v268 = objc_claimAutoreleasedReturnValue();
      if (v268)
      {
        v270 = (void *)v268;
        if (objc_msgSend_applyPCSKeysToRemoveForTesting(v10, v189, v269))
        {

LABEL_78:
          objc_msgSend_protectionEtag(v10, v189, v273);
          v277 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsKeysToRemove(v10, v278, v279);
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setEtag_(v280, v281, (uint64_t)v277);

          objc_msgSend_translator(self, v282, v283);
          v527 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pcsKeysToRemove(v10, v284, v285);
          v286 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_pProtectionInfoKeysToRemoveFromPCSKeysToRemove_(v527, v287, (uint64_t)v286);
          v288 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordSaveRequest(v15, v289, v290);
          v291 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_record(v291, v292, v293);
          v294 = v134;
          v295 = v157;
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setProtectionInfoKeysToRemove_(v296, v297, (uint64_t)v288);

          v157 = v295;
          v134 = v294;

          goto LABEL_79;
        }
        objc_msgSend_unitTestOverrides(self, v271, v272);
        v274 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v274, v275, (uint64_t)CFSTR("ApplyPCSKeysToRemoveForTesting"));
        v276 = (void *)objc_claimAutoreleasedReturnValue();

        if (v276)
          goto LABEL_78;
      }
    }
LABEL_79:
    objc_msgSend_addObject_(v511, v189, (uint64_t)v15);
    objc_msgSend_recordByRequestID(self, v298, v299);
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_request(v15, v301, v302);
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationUUID(v303, v304, v305);
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v300, v307, (uint64_t)v10, v306);

    objc_msgSend_recordID(v10, v308, v309);
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordIDByRequestID(self, v310, v311);
    v249 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_request(v15, v312, v313);
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationUUID(v252, v314, v315);
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v249, v317, (uint64_t)v220, v316);

    goto LABEL_80;
  }
LABEL_84:

  if (objc_msgSend_sendMergeableDeltas(self, v338, v339))
  {
    v540 = 0u;
    v541 = 0u;
    v538 = 0u;
    v539 = 0u;
    objc_msgSend_records(self, v340, v341);
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    v344 = objc_msgSend_countByEnumeratingWithState_objects_count_(v342, v343, (uint64_t)&v538, v557, 16);
    if (v344)
    {
      v346 = v344;
      v347 = *(_QWORD *)v539;
      do
      {
        v348 = v8;
        for (k = 0; k != v346; ++k)
        {
          if (*(_QWORD *)v539 != v347)
            objc_enumerationMutation(v342);
          v350 = *(_QWORD *)(*((_QWORD *)&v538 + 1) + 8 * k);
          v537 = 0;
          objc_msgSend_generateMergeableDeltaSaveOperationsForRecord_error_(self, v345, v350, &v537);
          v351 = (void *)objc_claimAutoreleasedReturnValue();
          v352 = v537;
          if (v351)
            v354 = v352 == 0;
          else
            v354 = 0;
          if (!v354)
          {
            v505 = v352;
            objc_msgSend_finishWithError_(self, v353, (uint64_t)v352);

            v506 = (id)MEMORY[0x1E0C9AA60];
            goto LABEL_133;
          }
          objc_msgSend_addObjectsFromArray_(v511, v353, (uint64_t)v351);

        }
        v346 = objc_msgSend_countByEnumeratingWithState_objects_count_(v342, v345, (uint64_t)&v538, v557, 16);
        v8 = v348;
      }
      while (v346);
    }

  }
  v535 = 0u;
  v536 = 0u;
  v533 = 0u;
  v534 = 0u;
  objc_msgSend_recordIDsToDelete(self, v340, v341);
  v516 = (id)objc_claimAutoreleasedReturnValue();
  v520 = objc_msgSend_countByEnumeratingWithState_objects_count_(v516, v355, (uint64_t)&v533, v556, 16);
  if (v520)
  {
    v518 = *(_QWORD *)v534;
    v514 = *MEMORY[0x1E0C949F0];
    while (2)
    {
      v357 = 0;
      do
      {
        if (*(_QWORD *)v534 != v518)
          objc_enumerationMutation(v516);
        v358 = *(void **)(*((_QWORD *)&v533 + 1) + 8 * v357);
        objc_msgSend_operationRequestWithType_(self, v356, 214);
        v359 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_requiresCKAnonymousUserIDs(self, v360, v361))
        {
          objc_msgSend_zoneID(v358, v362, v363);
          v364 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anonymousCKUserID(v364, v365, v366);
          v367 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v367)
          {
            v488 = (void *)objc_opt_new();
            objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v489, (uint64_t)CFSTR("An anonymousCKUserID is required to delete record %@ in the shared database when using anonymous to server share participants"), v358);
            v490 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v488, v491, (uint64_t)v490, *MEMORY[0x1E0CB2D50]);
            objc_msgSend_operation(self, v492, v493);
            v494 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_topmostParentOperation(v494, v495, v496);
            v497 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_operationID(v497, v498, v499);
            v500 = (void *)objc_claimAutoreleasedReturnValue();

            if (v500)
              objc_msgSend_setObject_forKeyedSubscript_(v488, v501, (uint64_t)v500, *MEMORY[0x1E0C947F8]);
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v501, *MEMORY[0x1E0C94B20], 5015, v488);
            v502 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_finishWithError_(self, v503, (uint64_t)v502);

            v487 = v516;
            goto LABEL_132;
          }
          objc_msgSend_zoneID(v358, v368, v369);
          v370 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anonymousCKUserID(v370, v371, v372);
          v373 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKDPIdentifier_User(v373, v374, v375);
          v376 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_request(v359, v377, v378);
          v379 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setAnonymousCKUserID_(v379, v380, (uint64_t)v376);

        }
        v524 = v357;
        v528 = v8;
        v381 = (void *)objc_opt_new();
        objc_msgSend_setRecordDeleteRequest_(v359, v382, (uint64_t)v381);

        objc_msgSend_translator(self, v383, v384);
        v385 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pRecordIdentifierFromRecordID_(v385, v386, (uint64_t)v358);
        v387 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordDeleteRequest(v359, v388, v389);
        v390 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRecordIdentifier_(v390, v391, (uint64_t)v387);

        objc_msgSend_pluginFieldsForRecordDeletesByID(self, v392, v393);
        v394 = (void *)objc_claimAutoreleasedReturnValue();
        v522 = v358;
        objc_msgSend_objectForKeyedSubscript_(v394, v395, (uint64_t)v358);
        v396 = (void *)objc_claimAutoreleasedReturnValue();

        v531 = 0u;
        v532 = 0u;
        v529 = 0u;
        v530 = 0u;
        v397 = v396;
        v399 = objc_msgSend_countByEnumeratingWithState_objects_count_(v397, v398, (uint64_t)&v529, v555, 16);
        if (v399)
        {
          v402 = v399;
          v403 = *(_QWORD *)v530;
          do
          {
            for (m = 0; m != v402; ++m)
            {
              if (*(_QWORD *)v530 != v403)
                objc_enumerationMutation(v397);
              v405 = *(_QWORD *)(*((_QWORD *)&v529 + 1) + 8 * m);
              objc_msgSend_recordDeleteRequest(v359, v400, v401);
              v406 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_translator(self, v407, v408);
              v409 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v397, v410, v405);
              v411 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_pFieldWithKey_value_(v409, v412, v405, v411);
              v413 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addPluginFields_(v406, v414, (uint64_t)v413);

            }
            v402 = objc_msgSend_countByEnumeratingWithState_objects_count_(v397, v400, (uint64_t)&v529, v555, 16);
          }
          while (v402);
        }

        if (objc_msgSend_oplock(self, v415, v416))
        {
          objc_msgSend_recordIDsToDeleteToEtags(self, v417, v418);
          v419 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v419, v420, (uint64_t)v522);
          v421 = (void *)objc_claimAutoreleasedReturnValue();

          if (v421)
          {
            objc_msgSend_recordIDsToDeleteToEtags(self, v417, v418);
            v422 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v422, v423, (uint64_t)v522);
            v424 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordDeleteRequest(v359, v425, v426);
            v427 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setEtag_(v427, v428, (uint64_t)v424);

          }
        }
        if ((v528 & 1) == 0)
        {
          objc_msgSend_header(v359, v417, v418);
          v429 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v429)
          {
            v432 = (void *)objc_opt_new();
            objc_msgSend_setHeader_(v359, v433, (uint64_t)v432);

          }
          objc_msgSend_clientChangeTokenData(self, v430, v431);
          v434 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_header(v359, v435, v436);
          v437 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setClientChangeToken_(v437, v438, (uint64_t)v434);

        }
        if (objc_msgSend_markAsParticipantNeedsNewInvitationToken(self, v417, v418))
        {
          objc_msgSend_recordName(v522, v439, v440);
          v441 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v441, v442, v514);

          if (isEqualToString)
          {
            objc_msgSend_recordDeleteRequest(v359, v439, v444);
            v445 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setParticipantKeyLost_(v445, v446, 1);

            objc_msgSend_userPublicKeys(self, v447, v448);
            v449 = (void *)objc_claimAutoreleasedReturnValue();
            v452 = (void *)objc_msgSend_mutableCopy(v449, v450, v451);
            objc_msgSend_recordDeleteRequest(v359, v453, v454);
            v455 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setPublicKeys_(v455, v456, (uint64_t)v452);

          }
        }
        objc_msgSend_addObject_(v511, v439, (uint64_t)v359);
        objc_msgSend_recordIDByRequestID(self, v457, v458);
        v459 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v359, v460, v461);
        v462 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationUUID(v462, v463, v464);
        v465 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v459, v466, (uint64_t)v522, v465);

        v357 = v524 + 1;
        LOBYTE(v8) = 1;
      }
      while (v524 + 1 != v520);
      v520 = objc_msgSend_countByEnumeratingWithState_objects_count_(v516, v356, (uint64_t)&v533, v556, 16);
      if (v520)
        continue;
      break;
    }
  }

  v506 = v511;
LABEL_133:

  return v506;
}

- (id)generateMergeableDeltaSaveOperationsForRecord:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t isEncrypted;
  void *v85;
  const char *v86;
  void *v87;
  const char *v88;
  void *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
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
  const char *v125;
  uint64_t v126;
  NSObject *v127;
  id v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t i;
  void *v138;
  const char *v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  id v143;
  void *v144;
  const char *v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  id *v149;
  const char *v150;
  uint64_t v151;
  const char *v152;
  void *v153;
  unint64_t v154;
  void *v155;
  const char *v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  const char *v168;
  uint64_t v169;
  NSObject *v170;
  __int128 v172;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  id obj;
  id v178;
  uint64_t v179;
  id v180;
  id v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  CKDModifyRecordsURLRequest *v191;
  void *v192;
  void *v193;
  void *v194;
  id v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  id v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  uint8_t v209[128];
  uint8_t buf[4];
  id v211;
  _BYTE v212[128];
  _BYTE v213[128];
  uint64_t v214;

  v214 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v186 = (id)objc_opt_new();
  v6 = v5;
  v7 = (void *)objc_opt_new();
  v205 = 0u;
  v206 = 0u;
  v207 = 0u;
  v208 = 0u;
  objc_msgSend_allKeys(v6, v8, v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v205, v213, 16);
  v190 = v6;
  v191 = self;
  if (v11)
  {
    v14 = v11;
    v15 = *(_QWORD *)v206;
    v174 = *MEMORY[0x1E0C94B20];
    *(_QWORD *)&v13 = 138412290;
    v172 = v13;
    v175 = *(_QWORD *)v206;
    while (2)
    {
      v16 = 0;
      v176 = v14;
      do
      {
        if (*(_QWORD *)v206 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v205 + 1) + 8 * v16);
        objc_msgSend_objectForKeyedSubscript_(v6, v12, v17, v172);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v6;
        v22 = v18;
        v189 = v17;
        if (v18)
        {
          v23 = v18;
        }
        else
        {
          objc_msgSend_encryptedValues(v21, v19, v20);
          v24 = v16;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v25, v26, v17);
          v23 = (id)objc_claimAutoreleasedReturnValue();

          v16 = v24;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v178 = v23;
          v27 = v23;
          v201 = 0u;
          v202 = 0u;
          v203 = 0u;
          v204 = 0u;
          objc_msgSend_deltasToSave(v27, v28, v29);
          v180 = (id)objc_claimAutoreleasedReturnValue();
          v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(v180, v30, (uint64_t)&v201, v212, 16);
          v179 = v16;
          v32 = 0;
          if (v188)
          {
            v187 = *(_QWORD *)v202;
            v192 = v27;
            while (2)
            {
              v33 = 0;
              v34 = v32;
              do
              {
                if (*(_QWORD *)v202 != v187)
                  objc_enumerationMutation(v180);
                v35 = *(_QWORD *)(*((_QWORD *)&v201 + 1) + 8 * v33);
                self = v191;
                objc_msgSend_operationRequestWithType_(v191, v31, 311);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = (void *)objc_opt_new();
                objc_msgSend_translator(v191, v38, v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_valueID(v192, v41, v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_pMergeableValueIdentifierFromMergeableValueID_(v40, v44, (uint64_t)v43);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setIdentifier_(v37, v46, (uint64_t)v45);

                v194 = v37;
                objc_msgSend_setMergeableDeltaSaveRequest_(v36, v47, (uint64_t)v37);
                objc_msgSend_translator(v191, v48, v49);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v200 = v34;
                objc_msgSend_pMergeableDeltaFromDelta_error_(v50, v51, v35, &v200);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v200;

                v193 = v52;
                if (*MEMORY[0x1E0C95280])
                {
                  objc_msgSend_unitTestOverrides(v191, v53, v54);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v55, v56, (uint64_t)CFSTR("FakeErrorDuringMergeableProtoGenerationDeltasToSave"));
                  v57 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v57)
                  {

                    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v125, v174, 1000, CFSTR("This is a fake error"));
                    v126 = objc_claimAutoreleasedReturnValue();

                    v32 = (id)v126;
LABEL_24:
                    v15 = v175;
                    if (*MEMORY[0x1E0C95300] != -1)
                      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                    v127 = *MEMORY[0x1E0C952B0];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = v172;
                      v211 = v32;
                      _os_log_fault_impl(&dword_1BE990000, v127, OS_LOG_TYPE_FAULT, "Failed to get data from delta for delta save request with error: %@", buf, 0xCu);
                    }

                    v27 = v192;
                    goto LABEL_29;
                  }
                  objc_msgSend_unitTestOverrides(v191, v58, v59);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v60, v61, (uint64_t)CFSTR("FakeInvalidMergeableValueID"));
                  v62 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v62)
                  {
                    objc_msgSend_translator(v191, v53, v63);
                    v183 = (void *)objc_claimAutoreleasedReturnValue();
                    v181 = objc_alloc(MEMORY[0x1E0C94ED8]);
                    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v64, v65);
                    v185 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_UUIDString(v185, v66, v67);
                    v182 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_valueID(v192, v68, v69);
                    v184 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_recordID(v184, v70, v71);
                    v72 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend_valueID(v192, v73, v74);
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_key(v75, v76, v77);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_valueID(v192, v79, v80);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    isEncrypted = objc_msgSend_isEncrypted(v81, v82, v83);
                    v85 = (void *)v72;
                    v87 = (void *)objc_msgSend_initWithName_recordID_key_encrypted_(v181, v86, (uint64_t)v182, v72, v78, isEncrypted);
                    objc_msgSend_pMergeableValueIdentifierFromMergeableValueID_(v183, v88, (uint64_t)v87);
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setIdentifier_(v194, v90, (uint64_t)v89);

                    v52 = v193;
                    self = v191;

                  }
                }
                if (!v52)
                  goto LABEL_24;
                objc_msgSend_setDelta_(v194, v53, (uint64_t)v52);
                objc_msgSend_addObject_(v186, v91, (uint64_t)v36);
                objc_msgSend_recordByRequestID(self, v92, v93);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_request(v36, v95, v96);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_operationUUID(v97, v98, v99);
                v34 = v32;
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v94, v101, (uint64_t)v190, v100);

                objc_msgSend_recordID(v190, v102, v103);
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_recordIDByRequestID(self, v105, v106);
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_request(v36, v108, v109);
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_operationUUID(v110, v111, v112);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v107, v114, (uint64_t)v104, v113);

                objc_msgSend_mergeableFieldKeyByRequestID(self, v115, v116);
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_request(v36, v118, v119);
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_operationUUID(v120, v121, v122);
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v117, v124, v189, v123);

                v32 = v34;
                ++v33;
              }
              while (v188 != v33);
              self = v191;
              v27 = v192;
              v15 = v175;
              v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(v180, v31, (uint64_t)&v201, v212, 16);
              if (v188)
                continue;
              break;
            }
          }
LABEL_29:
          v128 = v32;

          v198 = 0u;
          v199 = 0u;
          v196 = 0u;
          v197 = 0u;
          objc_msgSend_pendingReplacementRequests(v27, v129, v130);
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v131, v132, (uint64_t)&v196, v209, 16);
          if (v133)
          {
            v135 = v133;
            v136 = *(_QWORD *)v197;
            do
            {
              for (i = 0; i != v135; ++i)
              {
                if (*(_QWORD *)v197 != v136)
                  objc_enumerationMutation(v131);
                objc_msgSend_addObject_(v7, v134, *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * i));
              }
              v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(v131, v134, (uint64_t)&v196, v209, 16);
            }
            while (v135);
          }

          v14 = v176;
          v138 = v27;
          v23 = v178;
          v16 = v179;
          if (v128)
          {

            v149 = a4;
            v143 = v128;
            v140 = obj;
            goto LABEL_54;
          }
        }

        ++v16;
        v6 = v190;
      }
      while (v16 != v14);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v205, v213, 16);
      if (v14)
        continue;
      break;
    }
  }

  v195 = 0;
  objc_msgSend_requestOperationsForRequest_replaceDeltasRequests_ignoreMissingDeltas_error_(CKDReplaceMergeableDeltasURLRequest, v139, (uint64_t)self, v7, 1, &v195);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v195;
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(self, v141, v142);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v144, v145, (uint64_t)CFSTR("FakeErrorDuringMergeableProtoGenerationReplacementDeltas"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();

    if (v146)
    {

      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v147, *MEMORY[0x1E0C94B20], 1000, CFSTR("This is a fake error"));
      v148 = objc_claimAutoreleasedReturnValue();

      v140 = 0;
      v143 = (id)v148;
      goto LABEL_49;
    }
  }
  if (!v140 || (v149 = a4, v143))
  {
LABEL_49:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v170 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v211 = v143;
      _os_log_fault_impl(&dword_1BE990000, v170, OS_LOG_TYPE_FAULT, "Error generating replacement requests when modifying records: %@", buf, 0xCu);
    }
    v138 = v186;
    v149 = a4;
LABEL_54:

    v186 = 0;
    goto LABEL_55;
  }
  objc_msgSend_addObjectsFromArray_(v186, v141, (uint64_t)v140);
  if (!objc_msgSend_count(v140, v150, v151))
  {
    v143 = 0;
LABEL_55:
    v153 = v190;
    goto LABEL_56;
  }
  v153 = v190;
  v154 = 0;
  do
  {
    objc_msgSend_objectAtIndexedSubscript_(v140, v152, v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v7, v156, v154);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_replacementRequestsByRequestID(self, v158, v159);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_request(v155, v161, v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationUUID(v163, v164, v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v160, v167, (uint64_t)v157, v166);

    self = v191;
    ++v154;
  }
  while (v154 < objc_msgSend_count(v140, v168, v169));
  v143 = 0;
  v149 = a4;
LABEL_56:

  if (v149)
    *v149 = objc_retainAutorelease(v143);

  return v186;
}

- (id)returnVerificationKeyAndSignatureForRequestOperation:(id)a3 dataToBeSigned:(id)a4 error:(id *)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
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
  void *v22;
  const char *v23;
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
  int v36;
  const char *v37;
  uint64_t v38;
  _QWORD *v39;
  os_log_t *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  os_log_t *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  const void *v54;
  id v55;
  const char *v56;
  uint64_t v57;
  os_log_t *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  id v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  NSObject *v74;
  const char *v75;
  os_log_t v76;
  NSObject *v78;
  void *v79;
  NSObject *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  const char *v88;
  void *v89;
  void *v90;
  id *v91;
  id v92;
  id v93;
  id v94;
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  id v98;
  __int16 v99;
  id v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v92 = a4;
  if ((objc_msgSend_requiresCKAnonymousUserIDs(self, v10, v11) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v87, v88, (uint64_t)a2, self, CFSTR("CKDModifyRecordsURLRequest.m"), 432, CFSTR("Signature is only required for anonymous to server requests"));

  }
  objc_msgSend_recordIDByRequestID(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_request(v9, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v21, (uint64_t)v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recordByRequestID(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_request(v9, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v25, v32, (uint64_t)v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_msgSend_hasRecordDeleteRequest(v9, v34, v35);
  v39 = (_QWORD *)MEMORY[0x1E0C95300];
  v40 = (os_log_t *)MEMORY[0x1E0C952B0];
  if (!v36)
  {
    if (!objc_msgSend_hasRecordSaveRequest(v9, v37, v38))
    {
      v65 = 0;
LABEL_12:
      if (*v39 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v74 = *v40;
      if (os_log_type_enabled(*v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v96 = v22;
        _os_log_error_impl(&dword_1BE990000, v74, OS_LOG_TYPE_ERROR, "Missing required identity when creating a signature for record %@", buf, 0xCu);
        if (v65)
        {
LABEL_17:
          v71 = 0;
          v64 = 0;
          if (!a5)
            goto LABEL_19;
          goto LABEL_18;
        }
      }
      else if (v65)
      {
        goto LABEL_17;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v75, *MEMORY[0x1E0C94B20], 2006, CFSTR("Missing required identity for generating anonymous to server signature"));
      v65 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v90 = v22;
    v91 = a5;
    v54 = (const void *)objc_msgSend_signingPCSIdentity(v33, v72, v73);
    CFRetain(v54);
    v55 = 0;
    if (v54)
      goto LABEL_5;
LABEL_10:
    v65 = v55;
    v22 = v90;
    a5 = v91;
    v39 = (_QWORD *)MEMORY[0x1E0C95300];
    goto LABEL_12;
  }
  v91 = a5;
  objc_msgSend_container(self, v37, v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v41, v42, v43);
  v44 = v40;
  v45 = (uint64_t)v22;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordIDsToDeleteToSigningPCSIdentity(self, v47, v48);
  v49 = v33;
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)v45;
  objc_msgSend_objectForKeyedSubscript_(v50, v51, v45);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0;
  v54 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v46, v53, (uint64_t)v52, &v94);
  v55 = v94;

  v40 = v44;
  v33 = v49;

  if (!v54)
    goto LABEL_10;
LABEL_5:
  v58 = v40;
  objc_msgSend_container(self, v56, v57, v33);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v55;
  objc_msgSend_createSignatureWithIdentity_dataToBeSigned_useWholePublicKeyAsSigner_error_(v62, v63, (uint64_t)v54, v92, 0, &v93);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v93;

  if (!objc_msgSend_length(v64, v66, v67) || v65)
  {
    v40 = v58;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v33 = v89;
    v22 = v90;
    v78 = *v58;
    a5 = v91;
    if (os_log_type_enabled(*v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v96 = (void *)v54;
      v97 = 2112;
      v98 = v65;
      _os_log_error_impl(&dword_1BE990000, v78, OS_LOG_TYPE_ERROR, "Couldn't generate a request signature with signing identity %{public}@ because we got an error from PCS: %@", buf, 0x16u);
    }
    v71 = 0;
  }
  else
  {
    v68 = objc_alloc(MEMORY[0x1E0C951F8]);
    v69 = (void *)PCSIdentityCopyExportedPublicKey();
    v71 = (void *)objc_msgSend_initWithObject1_object2_(v68, v70, (uint64_t)v69, v64);

    v22 = v90;
    a5 = v91;
    v33 = v89;
    v40 = v58;
  }
  CFRelease(v54);
  v39 = (_QWORD *)MEMORY[0x1E0C95300];
  if (a5)
LABEL_18:
    *a5 = objc_retainAutorelease(v65);
LABEL_19:
  if (*v39 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v76 = *v40;
  if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEBUG))
  {
    v79 = v33;
    v80 = v76;
    objc_msgSend_v1(v71, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_v2(v71, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v96 = v83;
    v97 = 2112;
    v98 = v86;
    v99 = 2112;
    v100 = v92;
    _os_log_debug_impl(&dword_1BE990000, v80, OS_LOG_TYPE_DEBUG, "Signature generated. key: %@, signature: %@, data: %@", buf, 0x20u);

    v33 = v79;
  }

  return v71;
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
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
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
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
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
  id v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
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
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void (**v76)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  id v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  void *v102;
  id v103;
  const char *v104;
  uint64_t v105;
  os_log_t *v106;
  os_log_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  void *v113;
  NSObject *v114;
  const char *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t hasProtectionDataEntitlement;
  const char *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  double v137;
  double v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  void (**v145)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  id v159;
  id v160;
  void *v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  void (**v176)(_QWORD, _QWORD, _QWORD);
  const char *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  void (**v183)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v184;
  uint64_t v185;
  void *v186;
  NSObject *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  NSObject *v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  void *v196;
  const char *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  id v202;
  uint64_t v203;
  id v204;
  id v205;
  id v206;
  uint8_t buf[4];
  id v208;
  __int16 v209;
  uint64_t v210;
  uint64_t v211;

  v211 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_recordIDByRequestID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_hasRecordSaveResponse(v5, v17, v18))
  {
    if (!objc_msgSend_hasRecordDeleteResponse(v5, v19, v20))
    {
      if (objc_msgSend_hasMergeableDeltaSaveResponse(v5, v58, v59))
      {
        objc_msgSend_mergeableFieldKeyByRequestID(self, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_response(v5, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationUUID(v65, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v62, v69, (uint64_t)v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_mergeableDeltaSavedBlock(self, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73)
        {
          objc_msgSend_mergeableDeltaSavedBlock(self, v74, v75);
          v76 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend_result(v5, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *, void *))v76)[2](v76, v16, v70, v79);

        }
LABEL_44:
        v56 = 0;
        goto LABEL_45;
      }
      if (objc_msgSend_hasMergeableDeltaReplaceResponse(v5, v60, v61))
      {
        objc_msgSend_replacementRequestsByRequestID(self, v58, v59);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_response(v5, v163, v164);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationUUID(v165, v166, v167);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v162, v169, (uint64_t)v168);
        v170 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v170)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v171, v172);
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v196, v197, (uint64_t)a2, self, CFSTR("CKDModifyRecordsURLRequest.m"), 531, CFSTR("Expected non-nil replacement request for response %@"), v5);

        }
        objc_msgSend_replacedDeltasBlock(self, v171, v172);
        v173 = (void *)objc_claimAutoreleasedReturnValue();

        if (v173)
        {
          objc_msgSend_replacedDeltasBlock(self, v174, v175);
          v176 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend_result(v5, v177, v178);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *))v176)[2](v176, v170, v179);

        }
        goto LABEL_44;
      }
    }
    objc_msgSend_recordPostedBlock(self, v58, v59);
    v180 = (void *)objc_claimAutoreleasedReturnValue();

    if (v180)
    {
      objc_msgSend_recordPostedBlock(self, v181, v182);
      v183 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v5, v184, v185);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD, _QWORD, _QWORD, void *, _QWORD, _QWORD, _QWORD))v183)[2](v183, v16, 0, 0, 0, v186, 0, 0, 0);

    }
    goto LABEL_44;
  }
  objc_msgSend_recordByRequestID(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v5, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v21, v28, (uint64_t)v27);
  v29 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_result(v5, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientError(v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_oplockFailure(v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordForOplockFailure(v41, v42, v43);
  v44 = objc_claimAutoreleasedReturnValue();

  v200 = (void *)v44;
  if (v44)
  {
    objc_msgSend_translator(self, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v16, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_anonymousCKUserID(v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = 0;
    objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v47, v54, v44, v53, &v206);
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = v206;

    if (v55 || !v56)
    {
      v199 = (void *)v55;
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v57 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v208 = v56;
        _os_log_error_impl(&dword_1BE990000, v57, OS_LOG_TYPE_ERROR, "Invalid data from server in response to modifyRecords request: %@", buf, 0xCu);
      }
      v199 = 0;
    }
  }
  else
  {
    v199 = 0;
    v56 = 0;
  }
  objc_msgSend_translator(self, v45, v46);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend_sendAllFields(self, v81, v82);
  v205 = 0;
  v201 = (void *)v29;
  v85 = (id)objc_msgSend_deltaPRecordFromRecord_withAllFields_outDeletedMergeFields_outKeysToSend_(v80, v84, v29, v83, 0, &v205);
  v202 = v205;

  objc_msgSend_translator(self, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordSaveResponse(v5, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverFields(v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = (uint64_t)v16;
  objc_msgSend_zoneID(v16, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anonymousCKUserID(v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = 0;
  objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v88, v101, (uint64_t)v94, v100, &v204);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v204;

  v106 = (os_log_t *)MEMORY[0x1E0C952E0];
  if (v103)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v107 = *v106;
    if (os_log_type_enabled(*v106, OS_LOG_TYPE_DEBUG))
    {
      v188 = v107;
      objc_msgSend_requestUUID(self, v189, v190);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v208 = v191;
      v209 = 2112;
      v210 = (uint64_t)v103;
      _os_log_debug_impl(&dword_1BE990000, v188, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Error parsing server record returned for save: %@\", buf, 0x16u);

    }
  }
  objc_msgSend_fakeResponseOperationResultByItemID(self, v104, v105);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (v108)
  {
    objc_msgSend_fakeResponseOperationResultByItemID(self, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v111, v112, v203);
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    if (v113)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v114 = *v106;
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
      {
        v192 = v114;
        objc_msgSend_requestUUID(self, v193, v194);
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v208 = v195;
        v209 = 2114;
        v210 = v203;
        _os_log_error_impl(&dword_1BE990000, v192, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Inlining fake response operation result for item id %{public}@\", buf, 0x16u);

      }
      objc_msgSend_setResult_(v5, v115, (uint64_t)v113);
    }

  }
  objc_msgSend_container(self, v109, v110);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v116, v117, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  hasProtectionDataEntitlement = objc_msgSend_hasProtectionDataEntitlement(v119, v120, v121);
  objc_msgSend_setSerializeProtectionData_(v102, v123, hasProtectionDataEntitlement);

  objc_msgSend_recordSaveResponse(v5, v124, v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v119) = objc_msgSend_hasExpirationTime(v126, v127, v128);

  if ((_DWORD)v119)
  {
    objc_msgSend_recordSaveResponse(v5, v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_expirationTime(v131, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_time(v134, v135, v136);
    v138 = v137;

    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v139, v140, v138);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v141 = 0;
  }
  objc_msgSend_recordPostedBlock(self, v129, v130);
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  if (v142)
  {
    objc_msgSend_recordPostedBlock(self, v143, v144);
    v145 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordSaveResponse(v5, v146, v147);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_etag(v198, v148, v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordSaveResponse(v5, v151, v152);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeStatistics(v153, v154, v155);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v157, v158);
    v159 = v5;
    v160 = v56;
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *, void *, void *, void *, id, void *, void *))v145)[2](v145, v203, v150, v156, v141, v161, v202, v199, v102);

    v56 = v160;
    v5 = v159;

  }
  v16 = (void *)v203;
LABEL_45:

  return v56;
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
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void (**v43)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
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
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
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
  void *v76;
  id v77;
  NSObject *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void (**v82)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  uint8_t buf[4];
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_recordIDByRequestID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_mergeableFieldKeyByRequestID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v18, v25, (uint64_t)v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_replacementRequestsByRequestID(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v29, v36, (uint64_t)v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend_mergeableDeltaSavedBlock(self, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend_mergeableDeltaSavedBlock(self, v41, v42);
      v43 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v4, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, void *))v43)[2](v43, v15, v26, v46);
LABEL_7:

    }
  }
  else if (v37)
  {
    objc_msgSend_replacedDeltasBlock(self, v38, v39);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend_replacedDeltasBlock(self, v48, v49);
      v43 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v4, v50, v51);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD), void *, void *))v43[2])(v43, v37, v46);
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend_result(v4, v38, v39);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientError(v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_oplockFailure(v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordForOplockFailure(v61, v62, v63);
    v64 = objc_claimAutoreleasedReturnValue();

    v65 = (void *)v64;
    if (v64)
    {
      objc_msgSend_translator(self, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v15, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_anonymousCKUserID(v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v65;
      v87 = 0;
      objc_msgSend_recordFromPRecord_asAnonymousCKUserID_error_(v68, v75, (uint64_t)v65, v74, &v87);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v87;

      if (!v76 && v77)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v78 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v89 = v77;
          _os_log_error_impl(&dword_1BE990000, v78, OS_LOG_TYPE_ERROR, "Invalid data from server in response to modifyRecords request: %@", buf, 0xCu);
        }
      }

      v65 = v86;
    }
    else
    {
      v76 = 0;
    }
    objc_msgSend_recordPostedBlock(self, v66, v67);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (v79)
    {
      objc_msgSend_recordPostedBlock(self, v80, v81);
      v82 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v4, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD, _QWORD, _QWORD, void *, _QWORD, void *, _QWORD))v82)[2](v82, v15, 0, 0, 0, v85, 0, v76, 0);

    }
  }

}

- (void)requestDidComplete
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend_skippedRecordsWithPurelyMergeableChanges(self, a2, v2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v46, v54, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v47;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v10);
        objc_msgSend_translator(self, v6, v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend_sendAllFields(self, v13, v14);
        v45 = 0;
        v17 = (id)objc_msgSend_deltaPRecordFromRecord_withAllFields_outDeletedMergeFields_outKeysToSend_(v12, v16, (uint64_t)v11, v15, 0, &v45);
        v18 = v45;

        objc_msgSend_recordPostedBlock(self, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = (void *)objc_opt_new();
          objc_msgSend_setCode_(v22, v23, 1);
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v24 = (void *)*MEMORY[0x1E0C952E0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
          {
            v37 = v24;
            objc_msgSend_requestUUID(self, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v11, v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v51 = v40;
            v52 = 2112;
            v53 = v43;
            _os_log_debug_impl(&dword_1BE990000, v37, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Will call record save block for skipped record %@\", buf, 0x16u);

          }
          objc_msgSend_recordPostedBlock(self, v25, v26);
          v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v11, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_etag(v11, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_expirationDate(v11, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *, _QWORD, void *, void *, id, _QWORD, _QWORD))v27)[2](v27, v30, v33, 0, v36, v22, v18, 0, 0);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v46, v54, 16);
    }
    while (v8);
  }

}

- (NSDictionary)recordIDsToDeleteToEtags
{
  return self->_recordIDsToDeleteToEtags;
}

- (void)setRecordIDsToDeleteToEtags:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, a3);
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

- (BOOL)atomic
{
  return self->_atomic;
}

- (void)setAtomic:(BOOL)a3
{
  self->_atomic = a3;
}

- (BOOL)sendMergeableDeltas
{
  return self->_sendMergeableDeltas;
}

- (void)setSendMergeableDeltas:(BOOL)a3
{
  self->_sendMergeableDeltas = a3;
}

- (BOOL)markAsParticipantNeedsNewInvitationToken
{
  return self->_markAsParticipantNeedsNewInvitationToken;
}

- (void)setMarkAsParticipantNeedsNewInvitationToken:(BOOL)a3
{
  self->_markAsParticipantNeedsNewInvitationToken = a3;
}

- (NSArray)userPublicKeys
{
  return self->_userPublicKeys;
}

- (void)setUserPublicKeys:(id)a3
{
  objc_storeStrong((id *)&self->_userPublicKeys, a3);
}

- (id)recordPostedBlock
{
  return self->_recordPostedBlock;
}

- (void)setRecordPostedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (id)mergeableDeltaSavedBlock
{
  return self->_mergeableDeltaSavedBlock;
}

- (void)setMergeableDeltaSavedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (id)replacedDeltasBlock
{
  return self->_replacedDeltasBlock;
}

- (void)setReplacedDeltasBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (NSArray)recordIDsToDelete
{
  return self->_recordIDsToDelete;
}

- (void)setRecordIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, a3);
}

- (NSDictionary)recordIDsToDeleteToSigningPCSIdentity
{
  return self->_recordIDsToDeleteToSigningPCSIdentity;
}

- (void)setRecordIDsToDeleteToSigningPCSIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToDeleteToSigningPCSIdentity, a3);
}

- (BOOL)oplock
{
  return self->_oplock;
}

- (void)setOplock:(BOOL)a3
{
  self->_oplock = a3;
}

- (BOOL)sendAllFields
{
  return self->_sendAllFields;
}

- (void)setSendAllFields:(BOOL)a3
{
  self->_sendAllFields = a3;
}

- (NSData)clientChangeTokenData
{
  return self->_clientChangeTokenData;
}

- (void)setClientChangeTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_clientChangeTokenData, a3);
}

- (NSDictionary)requestedFieldsByRecordID
{
  return self->_requestedFieldsByRecordID;
}

- (void)setRequestedFieldsByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_requestedFieldsByRecordID, a3);
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

- (NSMutableDictionary)mergeableFieldKeyByRequestID
{
  return self->_mergeableFieldKeyByRequestID;
}

- (void)setMergeableFieldKeyByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableFieldKeyByRequestID, a3);
}

- (NSMutableDictionary)replacementRequestsByRequestID
{
  return self->_replacementRequestsByRequestID;
}

- (void)setReplacementRequestsByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_replacementRequestsByRequestID, a3);
}

- (BOOL)containsMergeableValues
{
  return self->_containsMergeableValues;
}

- (void)setContainsMergeableValues:(BOOL)a3
{
  self->_containsMergeableValues = a3;
}

- (NSMutableArray)skippedRecordsWithPurelyMergeableChanges
{
  return self->_skippedRecordsWithPurelyMergeableChanges;
}

- (void)setSkippedRecordsWithPurelyMergeableChanges:(id)a3
{
  objc_storeStrong((id *)&self->_skippedRecordsWithPurelyMergeableChanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skippedRecordsWithPurelyMergeableChanges, 0);
  objc_storeStrong((id *)&self->_replacementRequestsByRequestID, 0);
  objc_storeStrong((id *)&self->_mergeableFieldKeyByRequestID, 0);
  objc_storeStrong((id *)&self->_recordByRequestID, 0);
  objc_storeStrong((id *)&self->_recordIDByRequestID, 0);
  objc_storeStrong((id *)&self->_requestedFieldsByRecordID, 0);
  objc_storeStrong((id *)&self->_clientChangeTokenData, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToSigningPCSIdentity, 0);
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong(&self->_replacedDeltasBlock, 0);
  objc_storeStrong(&self->_mergeableDeltaSavedBlock, 0);
  objc_storeStrong(&self->_recordPostedBlock, 0);
  objc_storeStrong((id *)&self->_userPublicKeys, 0);
  objc_storeStrong((id *)&self->_pluginFieldsForRecordDeletesByID, 0);
  objc_storeStrong((id *)&self->_conflictLosersToResolveByRecordID, 0);
  objc_storeStrong((id *)&self->_recordIDsToDeleteToEtags, 0);
}

@end
