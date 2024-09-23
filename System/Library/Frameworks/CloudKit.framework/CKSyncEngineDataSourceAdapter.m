@implementation CKSyncEngineDataSourceAdapter

- (CKSyncEngineDataSourceAdapter)initWithDataSource:(id)a3
{
  id v4;
  CKSyncEngineDataSourceAdapter *v5;
  CKSyncEngineDataSourceAdapter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKSyncEngineDataSourceAdapter;
  v5 = -[CKSyncEngineDataSourceAdapter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (void)syncEngine:(id)a3 handleEvent:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t j;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t k;
  void *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  char v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t m;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t n;
  void *v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  char v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t ii;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  char v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  const char *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  char v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  id v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  void *v218;
  id v219;
  const char *v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t nn;
  id v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t jj;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t kk;
  void *v273;
  void *v274;
  uint64_t v275;
  uint64_t v276;
  BOOL v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  const char *v309;
  void *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t mm;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  const char *v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  void *v322;
  id v323;
  id v324;
  id v325;
  id v326;
  const char *v327;
  uint64_t v328;
  CKSyncEngineBatch *v329;
  const char *v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  const char *v334;
  uint64_t v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  const char *v339;
  void *v340;
  const char *v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  const char *v351;
  void *v352;
  char v353;
  void *v354;
  void *v355;
  void *v356;
  id v357;
  id v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  _QWORD v364[4];
  id v365;
  id v366;
  id v367;
  id v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  _QWORD v381[4];
  id v382;
  id v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  void *v416;
  const __CFString *v417;
  id v418;
  _BYTE v419[128];
  _BYTE v420[128];
  _BYTE v421[128];
  _BYTE v422[128];
  _BYTE v423[128];
  _BYTE v424[128];
  _BYTE v425[128];
  _BYTE v426[128];
  _BYTE v427[128];
  uint8_t v428[128];
  uint8_t buf[4];
  CKSyncEngineDataSourceAdapter *v430;
  uint64_t v431;

  v431 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v8 = ck_log_facility_engine;
  if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v430 = self;
    _os_log_debug_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_DEBUG, "%@ is handling event for CKSyncEngineDataSourceAdapter", buf, 0xCu);
  }
  objc_msgSend_dataSource(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend_type(v7, v13, v14, v15))
  {
    case 0:
      objc_msgSend_stateUpdateEvent(v7, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stateSerialization(v19, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_syncEngine_didUpdateMetadata_(v12, v28, (uint64_t)v6, (uint64_t)v27);
      goto LABEL_91;
    case 1:
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_153;
      objc_msgSend_accountChangeEvent(v7, v29, v30, v31);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_previousUser(v19, v32, v33, v34);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_currentUser(v19, v35, v36, v37);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_syncEngine_accountChangedFromUserRecordID_toUserRecordID_(v12, v38, (uint64_t)v6, (uint64_t)v23, v27);
      goto LABEL_91;
    case 2:
      objc_msgSend_fetchedDatabaseChangesEvent(v7, v16, v17, v18);
      v408 = 0u;
      v409 = 0u;
      v410 = 0u;
      v411 = 0u;
      v359 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_modifications(v359, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v408, (uint64_t)v428, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v409;
        do
        {
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v409 != v46)
              objc_enumerationMutation(v42);
            v48 = *(void **)(*((_QWORD *)&v408 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend_zoneID(v48, v49, v50, v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_syncEngine_zoneWithIDChanged_(v12, v53, (uint64_t)v6, (uint64_t)v52);

            }
          }
          v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v49, (uint64_t)&v408, (uint64_t)v428, 16);
        }
        while (v45);
      }
      v357 = v7;

      v406 = 0u;
      v407 = 0u;
      v404 = 0u;
      v405 = 0u;
      objc_msgSend_deletions(v359, v54, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v404, (uint64_t)v427, 16);
      if (!v59)
        goto LABEL_36;
      v63 = v59;
      v64 = *(_QWORD *)v405;
      break;
    case 3:
      objc_msgSend_fetchedRecordZoneChangesEvent(v7, v16, v17, v18);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v400 = 0u;
      v401 = 0u;
      v402 = 0u;
      v403 = 0u;
      objc_msgSend_modifications(v78, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v83, (uint64_t)&v400, (uint64_t)v426, 16);
      if (v84)
      {
        v86 = v84;
        v87 = *(_QWORD *)v401;
        do
        {
          for (j = 0; j != v86; ++j)
          {
            if (*(_QWORD *)v401 != v87)
              objc_enumerationMutation(v82);
            objc_msgSend_syncEngine_didFetchRecord_(v12, v85, (uint64_t)v6, *(_QWORD *)(*((_QWORD *)&v400 + 1) + 8 * j));
          }
          v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v85, (uint64_t)&v400, (uint64_t)v426, 16);
        }
        while (v86);
      }

      v398 = 0u;
      v399 = 0u;
      v396 = 0u;
      v397 = 0u;
      objc_msgSend_deletions(v78, v89, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v93, (uint64_t)&v396, (uint64_t)v425, 16);
      if (v94)
      {
        v98 = v94;
        v99 = *(_QWORD *)v397;
        do
        {
          for (k = 0; k != v98; ++k)
          {
            if (*(_QWORD *)v397 != v99)
              objc_enumerationMutation(v92);
            v101 = *(void **)(*((_QWORD *)&v396 + 1) + 8 * k);
            objc_msgSend_recordID(v101, v95, v96, v97);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordType(v101, v103, v104, v105);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_syncEngine_recordWithIDWasDeleted_recordType_(v12, v107, (uint64_t)v6, (uint64_t)v102, v106);

          }
          v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v95, (uint64_t)&v396, (uint64_t)v425, 16);
        }
        while (v98);
      }

      goto LABEL_152;
    case 4:
      objc_msgSend_sentDatabaseChangesEvent(v7, v16, v17, v18);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_savedZones(v78, v108, v109, v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_count(v111, v112, v113, v114))
        goto LABEL_61;
      v115 = objc_opt_respondsToSelector();

      if ((v115 & 1) != 0)
      {
        v394 = 0u;
        v395 = 0u;
        v392 = 0u;
        v393 = 0u;
        objc_msgSend_savedZones(v78, v116, v117, v118);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v119, (uint64_t)&v392, (uint64_t)v424, 16);
        if (v120)
        {
          v122 = v120;
          v123 = *(_QWORD *)v393;
          do
          {
            for (m = 0; m != v122; ++m)
            {
              if (*(_QWORD *)v393 != v123)
                objc_enumerationMutation(v111);
              objc_msgSend_syncEngine_didSaveRecordZone_(v12, v121, (uint64_t)v6, *(_QWORD *)(*((_QWORD *)&v392 + 1) + 8 * m));
            }
            v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v121, (uint64_t)&v392, (uint64_t)v424, 16);
          }
          while (v122);
        }
LABEL_61:

      }
      objc_msgSend_failedZoneSaves(v78, v116, v117, v118);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_count(v125, v126, v127, v128))
        goto LABEL_71;
      v129 = objc_opt_respondsToSelector();

      if ((v129 & 1) != 0)
      {
        v390 = 0u;
        v391 = 0u;
        v388 = 0u;
        v389 = 0u;
        objc_msgSend_failedZoneSaves(v78, v130, v131, v132);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v133, (uint64_t)&v388, (uint64_t)v423, 16);
        if (v134)
        {
          v138 = v134;
          v139 = *(_QWORD *)v389;
          do
          {
            for (n = 0; n != v138; ++n)
            {
              if (*(_QWORD *)v389 != v139)
                objc_enumerationMutation(v125);
              v141 = *(void **)(*((_QWORD *)&v388 + 1) + 8 * n);
              objc_msgSend_recordZone(v141, v135, v136, v137);
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_error(v141, v143, v144, v145);
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_syncEngine_failedToSaveRecordZone_error_(v12, v147, (uint64_t)v6, (uint64_t)v142, v146);

            }
            v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v135, (uint64_t)&v388, (uint64_t)v423, 16);
          }
          while (v138);
        }
LABEL_71:

      }
      objc_msgSend_deletedZoneIDs(v78, v130, v131, v132);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_count(v148, v149, v150, v151))
        goto LABEL_81;
      v152 = objc_opt_respondsToSelector();

      if ((v152 & 1) != 0)
      {
        v386 = 0u;
        v387 = 0u;
        v384 = 0u;
        v385 = 0u;
        objc_msgSend_deletedZoneIDs(v78, v153, v154, v155);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v156, (uint64_t)&v384, (uint64_t)v422, 16);
        if (v157)
        {
          v159 = v157;
          v160 = *(_QWORD *)v385;
          do
          {
            for (ii = 0; ii != v159; ++ii)
            {
              if (*(_QWORD *)v385 != v160)
                objc_enumerationMutation(v148);
              objc_msgSend_syncEngine_didDeleteRecordZoneWithID_(v12, v158, (uint64_t)v6, *(_QWORD *)(*((_QWORD *)&v384 + 1) + 8 * ii));
            }
            v159 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v158, (uint64_t)&v384, (uint64_t)v422, 16);
          }
          while (v159);
        }
LABEL_81:

      }
      objc_msgSend_failedZoneDeletes(v78, v153, v154, v155);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_count(v162, v163, v164, v165))
        goto LABEL_151;
      v166 = objc_opt_respondsToSelector();

      if ((v166 & 1) == 0)
        goto LABEL_152;
      objc_msgSend_failedZoneDeletes(v78, v167, v168, v169);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v381[0] = MEMORY[0x1E0C809B0];
      v381[1] = 3221225472;
      v381[2] = sub_18A723560;
      v381[3] = &unk_1E1F62E10;
      v382 = v12;
      v383 = v6;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v170, v171, (uint64_t)v381, v172);

      v162 = v382;
      goto LABEL_151;
    case 5:
      v353 = objc_opt_respondsToSelector();
      if ((v353 & 1) != 0)
      {
        v176 = (void *)objc_opt_new();
        v352 = (void *)objc_opt_new();
        v177 = (void *)objc_opt_new();
        v354 = (void *)objc_opt_new();
        v362 = (void *)objc_opt_new();
      }
      else
      {
        v362 = 0;
        v177 = 0;
        v176 = 0;
        v352 = 0;
        v354 = 0;
      }
      objc_msgSend_sentRecordZoneChangesEvent(v7, v173, v174, v175);
      v377 = 0u;
      v378 = 0u;
      v379 = 0u;
      v380 = 0u;
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_savedRecords(v361, v246, v247, v248);
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      v251 = objc_msgSend_countByEnumeratingWithState_objects_count_(v249, v250, (uint64_t)&v377, (uint64_t)v421, 16);
      if (v251)
      {
        v253 = v251;
        v254 = *(_QWORD *)v378;
        do
        {
          for (jj = 0; jj != v253; ++jj)
          {
            if (*(_QWORD *)v378 != v254)
              objc_enumerationMutation(v249);
            v256 = *(_QWORD *)(*((_QWORD *)&v377 + 1) + 8 * jj);
            objc_msgSend_syncEngine_didSaveRecord_(v12, v252, (uint64_t)v6, v256);
            objc_msgSend_addObject_(v176, v257, v256, v258);
            objc_msgSend_addObject_(v177, v259, v256, v260);
          }
          v253 = objc_msgSend_countByEnumeratingWithState_objects_count_(v249, v252, (uint64_t)&v377, (uint64_t)v421, 16);
        }
        while (v253);
      }
      v356 = v177;
      v357 = v7;

      v375 = 0u;
      v376 = 0u;
      v373 = 0u;
      v374 = 0u;
      objc_msgSend_failedRecordSaves(v361, v261, v262, v263);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      v266 = objc_msgSend_countByEnumeratingWithState_objects_count_(v264, v265, (uint64_t)&v373, (uint64_t)v420, 16);
      if (v266)
      {
        v270 = v266;
        v271 = *(_QWORD *)v374;
        do
        {
          for (kk = 0; kk != v270; ++kk)
          {
            if (*(_QWORD *)v374 != v271)
              objc_enumerationMutation(v264);
            v273 = *(void **)(*((_QWORD *)&v373 + 1) + 8 * kk);
            objc_msgSend_error(v273, v267, v268, v269);
            v274 = (void *)objc_claimAutoreleasedReturnValue();
            v277 = sub_18A723574(v274, 0, v275, v276);

            if (!v277)
            {
              objc_msgSend_record(v273, v278, v279, v280);
              v281 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_error(v273, v282, v283, v284);
              v285 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_syncEngine_failedToSaveRecord_error_(v12, v286, (uint64_t)v6, (uint64_t)v281, v285);

            }
            objc_msgSend_record(v273, v278, v279, v280);
            v287 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v176, v288, (uint64_t)v287, v289);

            objc_msgSend_error(v273, v290, v291, v292);
            v293 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_record(v273, v294, v295, v296);
            v297 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v297, v298, v299, v300);
            v301 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v362, v302, (uint64_t)v293, (uint64_t)v301);

          }
          v270 = objc_msgSend_countByEnumeratingWithState_objects_count_(v264, v267, (uint64_t)&v373, (uint64_t)v420, 16);
        }
        while (v270);
      }

      v371 = 0u;
      v372 = 0u;
      v369 = 0u;
      v370 = 0u;
      objc_msgSend_deletedRecordIDs(v361, v303, v304, v305);
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      v308 = objc_msgSend_countByEnumeratingWithState_objects_count_(v306, v307, (uint64_t)&v369, (uint64_t)v419, 16);
      v310 = v354;
      if (v308)
      {
        v311 = v308;
        v312 = *(_QWORD *)v370;
        do
        {
          for (mm = 0; mm != v311; ++mm)
          {
            if (*(_QWORD *)v370 != v312)
              objc_enumerationMutation(v306);
            v314 = *(_QWORD *)(*((_QWORD *)&v369 + 1) + 8 * mm);
            objc_msgSend_syncEngine_didDeleteRecordWithID_(v12, v309, (uint64_t)v6, v314);
            objc_msgSend_addObject_(v352, v315, v314, v316);
            objc_msgSend_addObject_(v354, v317, v314, v318);
          }
          v311 = objc_msgSend_countByEnumeratingWithState_objects_count_(v306, v309, (uint64_t)&v369, (uint64_t)v419, 16);
        }
        while (v311);
      }

      objc_msgSend_failedRecordDeletes(v361, v319, v320, v321);
      v322 = (void *)objc_claimAutoreleasedReturnValue();
      v364[0] = MEMORY[0x1E0C809B0];
      v364[1] = 3221225472;
      v364[2] = sub_18A723818;
      v364[3] = &unk_1E1F62E38;
      v323 = v12;
      v365 = v323;
      v324 = v6;
      v366 = v324;
      v325 = v352;
      v367 = v325;
      v326 = v362;
      v368 = v326;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v322, v327, (uint64_t)v364, v328);

      if ((v353 & 1) != 0)
      {
        v329 = [CKSyncEngineBatch alloc];
        v331 = (void *)objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(v329, v330, (uint64_t)v176, (uint64_t)v325);
        objc_msgSend_setSavedRecords_(v331, v332, (uint64_t)v356, v333);
        objc_msgSend_setDeletedRecordIDs_(v331, v334, (uint64_t)v354, v335);
        if (objc_msgSend_count(v326, v336, v337, v338))
        {
          v417 = CFSTR("CKPartialErrors");
          v418 = v326;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v339, (uint64_t)&v418, (uint64_t)&v417, 1);
          v340 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithCode_userInfo_format_(CKPrettyError, v341, 2, (uint64_t)v340, CFSTR("Failed to send changes"));
          v342 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v342 = 0;
        }
        objc_msgSend_syncEngine_didCompleteModifyRecordsBatch_error_(v323, v339, (uint64_t)v324, (uint64_t)v331, v342);

        v310 = v354;
      }

      goto LABEL_140;
    case 6:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_syncEngineWillBeginFetchingChanges_(v12, v178, (uint64_t)v6, v179);
      goto LABEL_153;
    case 7:
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_153;
      objc_msgSend_willFetchRecordZoneChangesEvent(v7, v180, v181, v182);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v19, v183, v184, v185);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v416 = v23;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v186, (uint64_t)&v416, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_syncEngine_willBeginFetchingChangesForZoneIDs_(v12, v187, (uint64_t)v6, (uint64_t)v27);
LABEL_91:

      goto LABEL_153;
    case 8:
      objc_msgSend_didFetchRecordZoneChangesEvent(v7, v16, v17, v18);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v78, v188, v189, v190);
      v191 = objc_claimAutoreleasedReturnValue();
      if (!v191)
        goto LABEL_149;
      v192 = (void *)v191;
      v193 = objc_opt_respondsToSelector();

      if ((v193 & 1) == 0)
        goto LABEL_149;
      objc_msgSend_zoneID(v78, v194, v195, v196);
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v78, v198, v199, v200);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKClientSuitableError(v201, v202, v203, v204);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_code(v205, v206, v207, v208) == 2)
      {
        v360 = v201;
        v363 = v197;
        v358 = v7;
        v212 = objc_alloc(MEMORY[0x1E0C99E08]);
        objc_msgSend_userInfo(v205, v213, v214, v215);
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        v218 = (void *)objc_msgSend_initWithDictionary_copyItems_(v212, v217, (uint64_t)v216, 1);

        v219 = objc_alloc(MEMORY[0x1E0C99E08]);
        v355 = v218;
        objc_msgSend_objectForKeyedSubscript_(v218, v220, (uint64_t)CFSTR("CKPartialErrors"), v221);
        v222 = (void *)objc_claimAutoreleasedReturnValue();
        v224 = (void *)objc_msgSend_initWithDictionary_copyItems_(v219, v223, (uint64_t)v222, 1);

        v414 = 0u;
        v415 = 0u;
        v412 = 0u;
        v413 = 0u;
        objc_msgSend_allKeys(v224, v225, v226, v227);
        v228 = (void *)objc_claimAutoreleasedReturnValue();
        v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(v228, v229, (uint64_t)&v412, (uint64_t)buf, 16);
        if (!v230)
          goto LABEL_103;
        v233 = v230;
        v234 = *(_QWORD *)v413;
        while (1)
        {
          for (nn = 0; nn != v233; ++nn)
          {
            if (*(_QWORD *)v413 != v234)
              objc_enumerationMutation(v228);
            objc_msgSend_objectForKeyedSubscript_(v224, v231, *(_QWORD *)(*((_QWORD *)&v412 + 1) + 8 * nn), v232);
            v236 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_code(v236, v237, v238, v239) == 112)
            {

              goto LABEL_144;
            }

          }
          v233 = objc_msgSend_countByEnumeratingWithState_objects_count_(v228, v231, (uint64_t)&v412, (uint64_t)buf, 16);
          if (!v233)
          {
LABEL_103:

            v236 = 0;
LABEL_144:
            v7 = v358;
            v201 = v360;
            v197 = v363;
            goto LABEL_146;
          }
        }
      }
      if (objc_msgSend_code(v205, v209, v210, v211) == 112)
        v236 = v205;
      else
        v236 = 0;
LABEL_146:

      if (v236)
      {
        objc_msgSend_zoneID(v78, v343, v344, v345);
        v346 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_syncEngine_failedToFetchChangesForRecordZoneID_error_(v12, v347, (uint64_t)v6, (uint64_t)v346, v236);

      }
LABEL_149:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_zoneID(v78, v348, v349, v350);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_syncEngine_didEndFetchingChangesForZoneID_(v12, v351, (uint64_t)v6, (uint64_t)v162);
LABEL_151:

      }
LABEL_152:

LABEL_153:
      return;
    case 9:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_syncEngineDidEndFetchingChanges_(v12, v240, (uint64_t)v6, v241);
      goto LABEL_153;
    case 10:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_syncEngineWillBeginModifyingPendingChanges_(v12, v242, (uint64_t)v6, v243);
      goto LABEL_153;
    case 11:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_syncEngineDidEndModifyingPendingChanges_(v12, v244, (uint64_t)v6, v245);
      goto LABEL_153;
    default:
      goto LABEL_153;
  }
LABEL_20:
  v65 = 0;
  while (1)
  {
    if (*(_QWORD *)v405 != v64)
      objc_enumerationMutation(v57);
    v66 = *(void **)(*((_QWORD *)&v404 + 1) + 8 * v65);
    v67 = objc_msgSend_reason(v66, v60, v61, v62);
    if (v67 == 2)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_zoneID(v66, v68, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_syncEngine_zoneWithIDWasDeletedDueToUserEncryptedDataReset_(v12, v72, (uint64_t)v6, (uint64_t)v71);
LABEL_33:

        goto LABEL_34;
      }
    }
    else if (v67 == 1)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_zoneID(v66, v73, v74, v75);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_syncEngine_zoneWithIDWasPurged_(v12, v76, (uint64_t)v6, (uint64_t)v71);
        goto LABEL_33;
      }
    }
    else if (v67)
    {
      goto LABEL_34;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_zoneID(v66, v60, v61, v62);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_syncEngine_zoneWithIDWasDeleted_(v12, v77, (uint64_t)v6, (uint64_t)v71);
      goto LABEL_33;
    }
LABEL_34:
    if (v63 == ++v65)
    {
      v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v60, (uint64_t)&v404, (uint64_t)v427, 16);
      if (!v63)
      {
LABEL_36:

LABEL_140:
        v7 = v357;
        goto LABEL_153;
      }
      goto LABEL_20;
    }
  }
}

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  CKSyncEngineRecordZoneChangeBatch *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t isAtomic;
  const char *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  CKSyncEngineRecordZoneChangeBatch *v57;
  id v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  id (*v69)(uint64_t, void *);
  void *v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  uint8_t buf[4];
  CKSyncEngineDataSourceAdapter *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v8 = ck_log_facility_engine;
  if (os_log_type_enabled((os_log_t)ck_log_facility_engine, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v77 = self;
    v78 = 2112;
    v79 = v7;
    _os_log_debug_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_DEBUG, "%@ about to get next record change batch for context: %@", buf, 0x16u);
  }
  objc_msgSend_options(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scope(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dataSource(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_zoneIDs(v16, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_syncEngine_nextBatchOfRecordsToModifyForZoneIDs_(v20, v25, (uint64_t)v6, (uint64_t)v24);
      v26 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setCustomBatch_(v26, v27, 1, v28);
      v29 = [CKSyncEngineRecordZoneChangeBatch alloc];
      objc_msgSend_recordsToSave(v26, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordIDsToDelete(v26, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      isAtomic = objc_msgSend_isAtomic(v26, v38, v39, v40);
      v43 = (void *)objc_msgSend_initWithRecordsToSave_recordIDsToDelete_atomicByZone_(v29, v42, (uint64_t)v33, (uint64_t)v37, isAtomic);

    }
    else
    {
      v44 = (void *)objc_opt_new();
      objc_msgSend_state(v6, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pendingRecordZoneChanges(v48, v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = MEMORY[0x1E0C809B0];
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = sub_18A723BC8;
      v74[3] = &unk_1E1F62E60;
      v75 = v16;
      objc_msgSend_CKFilter_(v52, v54, (uint64_t)v74, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v57 = [CKSyncEngineRecordZoneChangeBatch alloc];
      v67 = v53;
      v68 = 3221225472;
      v69 = sub_18A723C0C;
      v70 = &unk_1E1F62E88;
      v71 = v20;
      v58 = v6;
      v72 = v58;
      v73 = v44;
      v26 = v44;
      v43 = (void *)objc_msgSend_initWithPendingChanges_recordProvider_(v57, v59, (uint64_t)v56, (uint64_t)&v67);
      objc_msgSend_state(v58, v60, v61, v62, v67, v68, v69, v70);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removePendingRecordZoneChanges_(v63, v64, (uint64_t)v26, v65);

      v33 = v75;
    }

  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  char ChangesForZoneID;

  v6 = a3;
  v7 = a4;
  objc_msgSend_dataSource(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      ChangesForZoneID = objc_msgSend_syncEngine_shouldFetchChangesForZoneID_(v11, v12, (uint64_t)v6, (uint64_t)v7);
    else
      ChangesForZoneID = 1;
  }
  else
  {
    ChangesForZoneID = 0;
  }

  return ChangesForZoneID;
}

- (BOOL)syncEngine:(id)a3 shouldFetchAssetContentsForZoneID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  char AssetContentsForZoneID;

  v6 = a3;
  v7 = a4;
  objc_msgSend_dataSource(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    AssetContentsForZoneID = objc_msgSend_syncEngine_shouldFetchAssetContentsForZoneID_(v11, v12, (uint64_t)v6, (uint64_t)v7);
  else
    AssetContentsForZoneID = 1;

  return AssetContentsForZoneID;
}

- (id)syncEngine:(id)a3 relatedApplicationBundleIdentifiersForZoneIDs:(id)a4 recordIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_dataSource(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_syncEngine_relatedApplicationBundleIdentifiersForZoneIDs_recordIDs_(v14, v15, (uint64_t)v8, (uint64_t)v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (CKSyncEngineDataSource)dataSource
{
  return (CKSyncEngineDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
