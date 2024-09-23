@implementation CHDataDetectorQuery

- (CHDataDetectorQuery)initWithRecognitionSession:(id)a3
{
  id v4;
  CHDataDetectorQuery *v5;
  NSArray *v6;
  NSArray *foundItems;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  DDScannerServiceConfiguration *dataDetectorConfiguration;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CHDataDetectorQuery;
  v5 = -[CHQuery initWithRecognitionSession:](&v19, sel_initWithRecognitionSession_, v4);
  if (v5)
  {
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    foundItems = v5->_foundItems;
    v5->_foundItems = v6;

    v8 = objc_alloc(MEMORY[0x1E0D1CE78]);
    v12 = objc_msgSend_initWithScannerType_passiveIntent_(v8, v9, 0, 1, v10, v11);
    dataDetectorConfiguration = v5->_dataDetectorConfiguration;
    v5->_dataDetectorConfiguration = (DDScannerServiceConfiguration *)v12;

    objc_msgSend_setSpotlightSuggestionsEnabled_(v5->_dataDetectorConfiguration, v14, 1, v15, v16, v17);
  }

  return v5;
}

- (void)q_updateQueryResult
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int isEqualToString;
  const __CFString *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  CHContextualTextResult *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  NSObject *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  CHContextualTextResults *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  id v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  NSString *v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  _NSRange v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  NSUInteger location;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  unint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  const char *v290;
  uint64_t v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t k;
  void *v298;
  unsigned int isGibberish;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  void *v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  uint64_t v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  NSObject *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  void *v362;
  NSObject *v363;
  const char *v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  NSArray *v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  NSArray *v376;
  NSArray *v377;
  NSArray *foundItems;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  NSObject *v384;
  NSObject *v385;
  NSObject *v386;
  void *v387;
  uint64_t v388;
  _QWORD *v389;
  uint64_t v390;
  NSString *v391;
  NSIndexSet *v392;
  uint64_t v393;
  int v394;
  uint64_t v395;
  os_signpost_id_t spid;
  void *v397;
  id obj;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  id v402;
  id v403;
  id v405;
  void *v406;
  id v407;
  void *v408;
  void *v409;
  uint64_t v410;
  void *v411;
  uint64_t v412;
  void *v413;
  uint64_t j;
  void *v415;
  void *v416;
  void *v417;
  id v418;
  id v419;
  id v420;
  uint64_t v421;
  void *v422;
  objc_super v423;
  _QWORD v424[2];
  void (*v425)(uint64_t, void *, void *, void *);
  void *v426;
  id v427;
  id v428;
  CHDataDetectorQuery *v429;
  id v430;
  _QWORD v431[5];
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  id v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  id v453;
  _BYTE v454[5];
  uint8_t v455[128];
  uint8_t v456[4];
  void *v457;
  _BYTE v458[128];
  uint8_t v459[128];
  __int128 buf;
  uint64_t v461;
  int v462;
  uint64_t v463;

  v463 = *MEMORY[0x1E0C80C00];
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v2 = (id)qword_1EF568E50;
  spid = os_signpost_id_generate(v2);

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E50;
  v4 = v3;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v4, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHDataDetectorQuery_update", ", (uint8_t *)&buf, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHDataDetectorQuery_update\", (uint8_t *)&buf, 2u);
  }

  v423.receiver = self;
  v423.super_class = (Class)CHDataDetectorQuery;
  -[CHQuery q_updateQueryResult](&v423, sel_q_updateQueryResult);
  objc_msgSend_q_sessionResult(self, v6, v7, v8, v9, v10);
  v418 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v11 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BE607000, v11, OS_LOG_TYPE_DEFAULT, "CHDataDetectorQuery._dataDetectorResultsForSessionResult: start", (uint8_t *)&buf, 2u);
    }

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14, v15, v16);
    v397 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeGroupingResult(v418, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_textStrokeGroupClusters(v22, v23, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v438 = 0u;
    v439 = 0u;
    v436 = 0u;
    v437 = 0u;
    obj = v28;
    v393 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v436, (uint64_t)v455, 16, v30);
    if (v393)
    {
      v395 = *(_QWORD *)v437;
      do
      {
        v400 = 0;
        do
        {
          if (*(_QWORD *)v437 != v395)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v436 + 1) + 8 * v400);
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v31, v32, v33, v34, v35);
          v416 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v37, v38, v39, v40, v41);
          v417 = (void *)objc_claimAutoreleasedReturnValue();
          v434 = 0u;
          v435 = 0u;
          v433 = 0u;
          v432 = 0u;
          v419 = v36;
          v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v419, v42, (uint64_t)&v432, (uint64_t)v454, 16, v43);
          if (v49)
          {
            v421 = *(_QWORD *)v433;
            do
            {
              for (i = 0; i != v49; ++i)
              {
                if (*(_QWORD *)v433 != v421)
                  objc_enumerationMutation(v419);
                v51 = *(void **)(*((_QWORD *)&v432 + 1) + 8 * i);
                v52 = objc_msgSend_uniqueIdentifier(v51, v44, v45, v46, v47, v48);
                objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v418, v53, v52, v54, v55, v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_preferredLocale(v57, v58, v59, v60, v61, v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = (void *)objc_opt_class();
                objc_msgSend_recognitionResultsByLocale(v57, v65, v66, v67, v68, v69);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_locales(v418, v71, v72, v73, v74, v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_languageFitnessByLocale(v57, v77, v78, v79, v80, v81);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_filteredResultsByLocale_orderedLocales_usingLanguageFitness_outSortedLocales_(v64, v83, (uint64_t)v70, (uint64_t)v76, (uint64_t)v82, 0);
                v84 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_objectForKeyedSubscript_(v84, v85, (uint64_t)v63, v86, v87, v88);
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                if (v93)
                {
                  objc_msgSend_addObject_(v416, v89, (uint64_t)v51, v90, v91, v92);
                  objc_msgSend_languageCode(v63, v94, v95, v96, v97, v98);
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend_isEqualToString_(v99, v100, (uint64_t)CFSTR("zh"), v101, v102, v103))
                  {

LABEL_31:
                    *(_QWORD *)&buf = 0;
                    *((_QWORD *)&buf + 1) = &buf;
                    v461 = 0x2020000000;
                    v462 = 103;
                    objc_msgSend_topTranscription(v93, v109, v110, v111, v112, v113);
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_topTranscription(v93, v122, v123, v124, v125, v126);
                    v127 = (void *)objc_claimAutoreleasedReturnValue();
                    v133 = objc_msgSend_length(v127, v128, v129, v130, v131, v132);
                    v431[0] = MEMORY[0x1E0C809B0];
                    v431[1] = 3221225472;
                    v431[2] = sub_1BE7D3320;
                    v431[3] = &unk_1E77F2388;
                    v431[4] = &buf;
                    objc_msgSend_enumerateCodepointsInRange_reverse_usingBlock_(v121, v134, 0, v133, 1, (uint64_t)v431);

                    LODWORD(v127) = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);
                    _Block_object_dispose(&buf, 8);
                    if ((_DWORD)v127 == 17)
                      v120 = 0;
                    else
                      v120 = CFSTR("\n");
                  }
                  else
                  {
                    objc_msgSend_languageCode(v63, v104, v105, v106, v107, v108);
                    v114 = (void *)objc_claimAutoreleasedReturnValue();
                    isEqualToString = objc_msgSend_isEqualToString_(v114, v115, (uint64_t)CFSTR("yue"), v116, v117, v118);

                    v120 = CFSTR("\n");
                    if (isEqualToString)
                      goto LABEL_31;
                  }
                  v135 = [CHContextualTextResult alloc];
                  v138 = (void *)objc_msgSend_initWithTextResult_terminatingSpecialCharacter_strokeGroup_(v135, v136, (uint64_t)v93, (uint64_t)v120, (uint64_t)v51, v137);
                  objc_msgSend_addObject_(v417, v139, (uint64_t)v138, v140, v141, v142);

                }
              }
              v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v419, v44, (uint64_t)&v432, (uint64_t)v454, 16, v48);
            }
            while (v49);
          }

          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v143 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
          {
            v149 = objc_msgSend_count(v417, v144, v145, v146, v147, v148);
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = v149;
            _os_log_impl(&dword_1BE607000, v143, OS_LOG_TYPE_DEFAULT, "CHDataDetectorQuery._dataDetectorResultsForSessionResult: contextualTextResults.count = %lu", (uint8_t *)&buf, 0xCu);
          }

          if (objc_msgSend_count(v417, v150, v151, v152, v153, v154))
          {
            v155 = [CHContextualTextResults alloc];
            v160 = (void *)objc_msgSend_initWithTextResults_(v155, v156, (uint64_t)v417, v157, v158, v159);
            v424[0] = MEMORY[0x1E0C809B0];
            v424[1] = 3221225472;
            v425 = sub_1BE7D3380;
            v426 = &unk_1E77F5320;
            v427 = v416;
            v428 = v418;
            v429 = self;
            v430 = v397;
            v161 = v160;
            v389 = v424;
            v401 = v161;
            objc_msgSend_topTranscription(v161, v162, v163, v164, v165, v166);
            v167 = (NSString *)objc_claimAutoreleasedReturnValue();
            v168 = (void *)MEMORY[0x1E0D1CE70];
            v391 = v167;
            v174 = objc_msgSend_length(v167, v169, v170, v171, v172, v173);
            objc_msgSend_scanString_range_configuration_(v168, v175, (uint64_t)v167, 0, v174, (uint64_t)self->_dataDetectorConfiguration);
            v402 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_count(v402, v176, v177, v178, v179, v180)
              || !isUndetectableAddressCandidate(v167, v181, v182, v183, v184, v185))
            {
              v394 = 0;
              v392 = 0;
            }
            else
            {
              v453 = 0;
              reformatToBetterAddressMatching(v167, (char *)&v453, v186, v187, v188, v189);
              v190 = (void *)objc_claimAutoreleasedReturnValue();
              v392 = (NSIndexSet *)v453;
              v191 = (void *)MEMORY[0x1E0D1CE70];
              v197 = objc_msgSend_length(v190, v192, v193, v194, v195, v196);
              objc_msgSend_scanString_range_configuration_(v191, v198, (uint64_t)v190, 0, v197, (uint64_t)self->_dataDetectorConfiguration);
              v199 = objc_claimAutoreleasedReturnValue();

              v394 = 1;
              v402 = (id)v199;
            }
            v451 = 0u;
            v452 = 0u;
            v449 = 0u;
            v450 = 0u;
            v403 = v402;
            v388 = objc_msgSend_countByEnumeratingWithState_objects_count_(v403, v200, (uint64_t)&v449, (uint64_t)&buf, 16, v201);
            if (v388)
            {
              v390 = *(_QWORD *)v450;
              do
              {
                v399 = 0;
                do
                {
                  if (*(_QWORD *)v450 != v390)
                    objc_enumerationMutation(v403);
                  v387 = *(void **)(*((_QWORD *)&v449 + 1) + 8 * v399);
                  v207.location = objc_msgSend_urlificationRange(v387, v202, v203, v204, v205, v206);
                  location = v207.location;
                  if (v394)
                    location = rangeFromRangeRemovingIndexes(v207, v392, v208, v209, v210);
                  v448 = 0;
                  objc_msgSend_textResultToIndexMappingFromTopTranscriptionWithCharacterRange_intersectionRanges_(v401, (const char *)v207.length, location, v207.length, (uint64_t)&v448, v210);
                  v411 = (void *)objc_claimAutoreleasedReturnValue();
                  v407 = v448;
                  objc_msgSend_array(MEMORY[0x1E0C99DE8], v212, v213, v214, v215, v216);
                  v409 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v217, v218, v219, v220, v221);
                  v408 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v222, v223, v224, v225, v226);
                  v406 = (void *)objc_claimAutoreleasedReturnValue();
                  v446 = 0u;
                  v447 = 0u;
                  v444 = 0u;
                  v445 = 0u;
                  objc_msgSend_textResults(v401, v227, v228, v229, v230, v231);
                  v405 = (id)objc_claimAutoreleasedReturnValue();
                  v234 = objc_msgSend_countByEnumeratingWithState_objects_count_(v405, v232, (uint64_t)&v444, (uint64_t)v459, 16, v233);
                  if (v234)
                  {
                    v412 = v234;
                    v240 = 0;
                    v410 = *(_QWORD *)v445;
                    do
                    {
                      for (j = 0; j != v412; ++j)
                      {
                        if (*(_QWORD *)v445 != v410)
                          objc_enumerationMutation(v405);
                        objc_msgSend_textResult(*(void **)(*((_QWORD *)&v444 + 1) + 8 * j), v235, v236, v237, v238, v239);
                        v241 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_objectForKeyedSubscript_(v411, v242, (uint64_t)v241, v243, v244, v245);
                        v251 = objc_claimAutoreleasedReturnValue();
                        v415 = (void *)v251;
                        if (v251)
                        {
                          objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v246, v247, v248, v249, v250);
                          v252 = objc_claimAutoreleasedReturnValue();
                          objc_msgSend_objectForKey_(v407, v253, v251, v254, v255, v256);
                          v257 = (void *)objc_claimAutoreleasedReturnValue();
                          v422 = (void *)v252;
                          v263 = objc_msgSend_rangeValue(v257, v258, v259, v260, v261, v262);
                          v265 = v264;

                          objc_msgSend_transcriptionPaths(v241, v266, v267, v268, v269, v270);
                          v271 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_firstObject(v271, v272, v273, v274, v275, v276);
                          v277 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_tokensFromTranscriptionPath_characterRange_(v241, v278, (uint64_t)v277, v263, v265, v279);
                          v413 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend_addObjectsFromArray_(v409, v280, (uint64_t)v413, v281, v282, v283);
                          objc_msgSend_string(MEMORY[0x1E0CB37A0], v284, v285, v286, v287, v288);
                          v289 = (void *)objc_claimAutoreleasedReturnValue();
                          v442 = 0u;
                          v443 = 0u;
                          v440 = 0u;
                          v441 = 0u;
                          v420 = v413;
                          v295 = objc_msgSend_countByEnumeratingWithState_objects_count_(v420, v290, (uint64_t)&v440, (uint64_t)v458, 16, v291);
                          if (v295)
                          {
                            v296 = *(_QWORD *)v441;
                            do
                            {
                              for (k = 0; k != v295; ++k)
                              {
                                if (*(_QWORD *)v441 != v296)
                                  objc_enumerationMutation(v420);
                                v298 = *(void **)(*((_QWORD *)&v440 + 1) + 8 * k);
                                isGibberish = objc_msgSend_shouldFilterOutStringForToken_isGibberish_(v241, v292, (uint64_t)v298, 0, v293, v294);
                                objc_msgSend_precedingSeparatorForToken_(v241, v300, (uint64_t)v298, v301, v302, v303);
                                v304 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_string(v298, v305, v306, v307, v308, v309);
                                v310 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_appendFormat_(v289, v311, (uint64_t)CFSTR("%@%@"), v312, v313, v314, v304, v310);

                                objc_msgSend_strokeIndexes(v298, v315, v316, v317, v318, v319);
                                v320 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_addIndexes_(v422, v321, (uint64_t)v320, v322, v323, v324);

                                v240 += isGibberish;
                              }
                              v295 = objc_msgSend_countByEnumeratingWithState_objects_count_(v420, v292, (uint64_t)&v440, (uint64_t)v458, 16, v294);
                            }
                            while (v295);
                          }

                          objc_msgSend_setObject_forKey_(v408, v325, (uint64_t)v422, (uint64_t)v415, v326, v327);
                          objc_msgSend_setObject_forKey_(v406, v328, (uint64_t)v289, (uint64_t)v415, v329, v330);
                          objc_msgSend_lastIndex(v422, v331, v332, v333, v334, v335);

                          v336 = v422;
                        }
                        else
                        {
                          v337 = objc_msgSend_tokenColumnCount(v241, v246, v247, v248, v249, v250);
                          objc_msgSend_strokeIndexesForColumnsInRange_(v241, v338, 0, v337 - 1, v339, v340);
                          v336 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_lastIndex(v336, v341, v342, v343, v344, v345);
                        }

                      }
                      v412 = objc_msgSend_countByEnumeratingWithState_objects_count_(v405, v235, (uint64_t)&v444, (uint64_t)v459, 16, v239);
                    }
                    while (v412);
                  }
                  else
                  {
                    v240 = 0;
                  }

                  if (v240 < objc_msgSend_count(v409, v346, v347, v348, v349, v350))
                  {
                    if (!objc_msgSend_count(v408, v351, v352, v353, v354, v355))
                    {
                      if (qword_1EF568E88 != -1)
                        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                      v356 = (id)qword_1EF568E18[0];
                      if (os_log_type_enabled(v356, OS_LOG_TYPE_FAULT))
                      {
                        objc_msgSend_matchedString(v387, v357, v358, v359, v360, v361);
                        v362 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v456 = 138412290;
                        v457 = v362;
                        _os_log_impl(&dword_1BE607000, v356, OS_LOG_TYPE_FAULT, "The stroke indexes matching data detected content should be non-empty [%@]", v456, 0xCu);

                      }
                    }
                    v425((uint64_t)v389, v408, v406, v387);
                  }

                  ++v399;
                }
                while (v399 != v388);
                v388 = objc_msgSend_countByEnumeratingWithState_objects_count_(v403, v202, (uint64_t)&v449, (uint64_t)&buf, 16, v206);
              }
              while (v388);
            }

          }
          ++v400;
        }
        while (v400 != v393);
        v393 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v436, (uint64_t)v455, 16, v35);
      }
      while (v393);
    }

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v363 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v363, OS_LOG_TYPE_DEFAULT))
    {
      v369 = objc_msgSend_count(v397, v364, v365, v366, v367, v368);
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v369;
      _os_log_impl(&dword_1BE607000, v363, OS_LOG_TYPE_DEFAULT, "CHDataDetectorQuery._dataDetectorResultsForSessionResult: found %lu items", (uint8_t *)&buf, 0xCu);
    }

    v370 = v397;
    v376 = v370;
    if (self->_foundItems != v370)
    {
      v377 = (NSArray *)objc_msgSend_copy(v370, v371, v372, v373, v374, v375);
      foundItems = self->_foundItems;
      self->_foundItems = v377;

      objc_msgSend_q_queryResultDidChange(self, v379, v380, v381, v382, v383);
    }
  }
  else
  {

    v376 = 0;
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v384 = (id)qword_1EF568E50;
  v385 = v384;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v384))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v385, OS_SIGNPOST_INTERVAL_END, spid, "CHDataDetectorQuery_update", ", (uint8_t *)&buf, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v386 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v386, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BE607000, v386, OS_LOG_TYPE_DEFAULT, "END \"CHDataDetectorQuery_update\", (uint8_t *)&buf, 2u);
  }

}

- (NSArray)foundItems
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1BE7D4198;
  v15 = sub_1BE7D41A8;
  v16 = 0;
  objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE7D41B0;
  v10[3] = &unk_1E77F23B0;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v8;
}

- (BOOL)q_resultWantedForCompleteness:(int64_t)a3
{
  return a3 == 2;
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 0;
}

- (id)debugName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Data Detector Query %p"), v2, v3, v4, self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundItems, 0);
  objc_storeStrong((id *)&self->_dataDetectorConfiguration, 0);
}

@end
