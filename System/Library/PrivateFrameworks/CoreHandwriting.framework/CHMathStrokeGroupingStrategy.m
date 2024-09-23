@implementation CHMathStrokeGroupingStrategy

- (CHMathStrokeGroupingStrategy)initWithStrokeProvider:(id)a3 strokeGroupingModel:(id)a4
{
  id v6;
  id v7;
  CHMathStrokeGroupingStrategy *v8;
  objc_class *v9;
  uint64_t v10;
  NSString *strategyIdentifier;
  CHFastStrokeGroupingStrategy *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CHFastStrokeGroupingStrategy *fastGroupingStrategy;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CHMathStrokeGroupingStrategy;
  v8 = -[CHStrokeGroupingStrategy initWithStrokeProvider:](&v20, sel_initWithStrokeProvider_, v6);
  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    strategyIdentifier = v8->_strategyIdentifier;
    v8->_strategyIdentifier = (NSString *)v10;

    v12 = [CHFastStrokeGroupingStrategy alloc];
    v17 = objc_msgSend_initWithStrokeProvider_(v12, v13, (uint64_t)v6, v14, v15, v16);
    fastGroupingStrategy = v8->_fastGroupingStrategy;
    v8->_fastGroupingStrategy = (CHFastStrokeGroupingStrategy *)v17;

    objc_storeStrong((id *)&v8->_model, a4);
  }

  return v8;
}

- (id)strategyIdentifier
{
  return self->_strategyIdentifier;
}

- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8
{
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t j;
  void *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int isEqualToString;
  void *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t k;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t m;
  void *v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  int v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  int isEqualToSet;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  int isSubsetOfSet;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  _BOOL4 v251;
  id *v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  int v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  _BOOL4 v291;
  CHStrokeGroup *v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  void *v298;
  const char *v299;
  uint64_t v300;
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
  uint64_t v315;
  double v316;
  double v317;
  double v318;
  double v319;
  double v320;
  double v321;
  double v322;
  double v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  double v329;
  double v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  double v343;
  double v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  CHStrokeGroup *v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  const char *v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  void *v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  void *v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  double v387;
  double v388;
  double v389;
  double v390;
  double v391;
  double v392;
  double v393;
  double v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  double v400;
  double v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  void *v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  const char *v413;
  double v414;
  double v415;
  void *StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
  const char *v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  id *v425;
  CHStrokeGroup *v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  void *v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  void *v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  void *v450;
  const char *v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  double v456;
  double v457;
  double v458;
  double v459;
  double v460;
  double v461;
  double v462;
  double v463;
  const char *v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  double v469;
  double v470;
  const char *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  void *v476;
  const char *v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  const char *v482;
  double v483;
  double v484;
  const char *v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  const char *v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  const char *v493;
  uint64_t v494;
  void *v495;
  CHStrokeGroupingResult *v496;
  const char *v497;
  void *v499;
  void *v500;
  id v501;
  void *v502;
  void *v503;
  void *v504;
  id v505;
  void *v506;
  uint64_t v507;
  uint64_t v508;
  void *v509;
  uint64_t (**v510)(void);
  id v511;
  uint64_t n;
  id v513;
  void *v514;
  id obj;
  id obja;
  CHMathStrokeGroupingStrategy *v517;
  void *v518;
  _QWORD v519[4];
  id v520;
  _QWORD v521[4];
  id v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  _BYTE v547[128];
  _BYTE v548[128];
  _BYTE v549[128];
  _BYTE v550[128];
  uint8_t v551[128];
  _BYTE buf[24];
  uint64_t v553;
  uint64_t v554;

  v554 = *MEMORY[0x1E0C80C00];
  v511 = a3;
  v501 = a4;
  v12 = a5;
  v510 = (uint64_t (**)(void))a8;
  v517 = self;
  objc_msgSend_strokeProvider(self, v13, v14, v15, v16, v17);
  v502 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v502)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v18 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v18, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
    }

  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v19 = (id)qword_1EF568E30;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_strategyIdentifier(self, v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_count(v501, v26, v27, v28, v29, v30);
    v37 = objc_msgSend_count(v12, v32, v33, v34, v35, v36);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v31;
    *(_WORD *)&buf[22] = 2048;
    v553 = v37;
    _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_DEBUG, "Stroke Grouping with strategy %@. Added strokes: %ld, removed strokes: %ld", buf, 0x20u);

  }
  objc_msgSend_orderedStrokes(v502, v38, v39, v40, v41, v42);
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v501;
  v503 = v43;
  if (v517)
  {
    v49 = v43;
    objc_msgSend_set(MEMORY[0x1E0C99E20], v44, v45, v46, v47, v48);
    v518 = (void *)objc_claimAutoreleasedReturnValue();
    v545 = 0u;
    v546 = 0u;
    v543 = 0u;
    v544 = 0u;
    v50 = v49;
    v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v543, (uint64_t)buf, 16, v52);
    if (v58)
    {
      v59 = *(_QWORD *)v544;
      do
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v544 != v59)
            objc_enumerationMutation(v50);
          objc_msgSend_encodedStrokeIdentifier(*(void **)(*((_QWORD *)&v543 + 1) + 8 * i), v53, v54, v55, v56, v57);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v518, v62, (uint64_t)v61, v63, v64, v65);

        }
        v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v53, (uint64_t)&v543, (uint64_t)buf, 16, v57);
      }
      while (v58);
    }

  }
  else
  {
    v518 = 0;
  }

  objc_msgSend_set(MEMORY[0x1E0C99E20], v66, v67, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v541 = 0u;
  v542 = 0u;
  v539 = 0u;
  v540 = 0u;
  objc_msgSend_strokeGroups(v511, v72, v73, v74, v75, v76);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v77, (uint64_t)&v539, (uint64_t)v551, 16, v78);
  if (v84)
  {
    v85 = *(_QWORD *)v540;
    do
    {
      for (j = 0; j != v84; ++j)
      {
        if (*(_QWORD *)v540 != v85)
          objc_enumerationMutation(obj);
        v87 = *(void **)(*((_QWORD *)&v539 + 1) + 8 * j);
        objc_msgSend_strategyIdentifier(v87, v79, v80, v81, v82, v83);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strategyIdentifier(v517, v89, v90, v91, v92, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v88, v95, (uint64_t)v94, v96, v97, v98);

        if (isEqualToString)
        {
          v537 = 0u;
          v538 = 0u;
          v535 = 0u;
          v536 = 0u;
          objc_msgSend_strokeIdentifiers(v87, v79, v80, v81, v82, v83);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v101, (uint64_t)&v535, (uint64_t)v550, 16, v102);
          if (v107)
          {
            v108 = *(_QWORD *)v536;
            do
            {
              for (k = 0; k != v107; ++k)
              {
                if (*(_QWORD *)v536 != v108)
                  objc_enumerationMutation(v100);
                v110 = *(_QWORD *)(*((_QWORD *)&v535 + 1) + 8 * k);
                if ((objc_msgSend_containsObject_(v12, v103, v110, v104, v105, v106) & 1) == 0)
                  objc_msgSend_addObject_(v71, v103, v110, v104, v105, v106);
              }
              v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v103, (uint64_t)&v535, (uint64_t)v550, 16, v106);
            }
            while (v107);
          }

        }
      }
      v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v79, (uint64_t)&v539, (uint64_t)v551, 16, v83);
    }
    while (v84);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v111, v112, v113, v114, v115);
  v514 = (void *)objc_claimAutoreleasedReturnValue();
  v533 = 0u;
  v534 = 0u;
  v531 = 0u;
  v532 = 0u;
  obja = v500;
  v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v116, (uint64_t)&v531, (uint64_t)v549, 16, v117);
  if (v123)
  {
    v124 = *(_QWORD *)v532;
    do
    {
      for (m = 0; m != v123; ++m)
      {
        if (*(_QWORD *)v532 != v124)
          objc_enumerationMutation(obja);
        v126 = *(void **)(*((_QWORD *)&v531 + 1) + 8 * m);
        objc_msgSend_encodedStrokeIdentifier(v126, v118, v119, v120, v121, v122);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = objc_msgSend_containsObject_(v71, v128, (uint64_t)v127, v129, v130, v131);

        if (v132)
          objc_msgSend_addObject_(v514, v118, (uint64_t)v126, v120, v121, v122);
      }
      v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v118, (uint64_t)&v531, (uint64_t)v549, 16, v122);
    }
    while (v123);
  }

  objc_msgSend_addObjectsFromArray_(v514, v133, (uint64_t)v503, v134, v135, v136);
  if (v511)
  {
    v142 = objc_msgSend_cachedAdjacencies(v511, v137, v138, v139, v140, v141);
    *(_QWORD *)&buf[16] = 0;
    *(_QWORD *)&buf[8] = 0;
    *(_QWORD *)buf = &buf[8];
    sub_1BE6B46CC(buf, *(_QWORD **)v142, (_QWORD *)(v142 + 8));
  }
  else
  {
    *(_QWORD *)&buf[16] = 0;
    *(_QWORD *)&buf[8] = 0;
    *(_QWORD *)buf = &buf[8];
  }
  *(_QWORD *)&v544 = 0;
  *((_QWORD *)&v543 + 1) = 0;
  *(_QWORD *)&v543 = (char *)&v543 + 8;
  objc_msgSend_groupStrokes_previousAdjacencies_updatedAdjacencies_(v517->_model, v137, (uint64_t)v514, (uint64_t)buf, (uint64_t)&v543, v141);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = (void *)MEMORY[0x1E0C99E20];
  v499 = v143;
  v150 = objc_msgSend_count(v143, v145, v146, v147, v148, v149);
  objc_msgSend_setWithCapacity_(v144, v151, v150, v152, v153, v154);
  v509 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v155, v156, v157, v158, v159);
  v506 = (void *)objc_claimAutoreleasedReturnValue();
  if (v511)
  {
    objc_msgSend_strokeGroups(v511, v160, v161, v162, v163, v164);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v504 = (void *)objc_msgSend_mutableCopy(v165, v166, v167, v168, v169, v170);

  }
  else
  {
    objc_msgSend_set(MEMORY[0x1E0C99E20], v160, v161, v162, v163, v164);
    v504 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v529 = 0u;
  v530 = 0u;
  v527 = 0u;
  v528 = 0u;
  v505 = v499;
  v508 = objc_msgSend_countByEnumeratingWithState_objects_count_(v505, v171, (uint64_t)&v527, (uint64_t)v548, 16, v172);
  if (v508)
  {
    v507 = *(_QWORD *)v528;
    do
    {
      for (n = 0; n != v508; ++n)
      {
        if (*(_QWORD *)v528 != v507)
          objc_enumerationMutation(v505);
        v173 = *(void **)(*((_QWORD *)&v527 + 1) + 8 * n);
        if ((v510[2]() & 1) != 0)
          goto LABEL_82;
        v525 = 0u;
        v526 = 0u;
        v523 = 0u;
        v524 = 0u;
        objc_msgSend_strokeGroups(v511, v174, v175, v176, v177, v178);
        v513 = (id)objc_claimAutoreleasedReturnValue();
        v186 = objc_msgSend_countByEnumeratingWithState_objects_count_(v513, v179, (uint64_t)&v523, (uint64_t)v547, 16, v180);
        if (v186)
        {
          v187 = *(_QWORD *)v524;
LABEL_62:
          v188 = 0;
          while (1)
          {
            if (*(_QWORD *)v524 != v187)
              objc_enumerationMutation(v513);
            v189 = *(void **)(*((_QWORD *)&v523 + 1) + 8 * v188);
            objc_msgSend_strokeIdentifiers(v173, v181, v182, v183, v184, v185);
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIdentifiers(v189, v191, v192, v193, v194, v195);
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToSet = objc_msgSend_isEqualToSet_(v190, v197, (uint64_t)v196, v198, v199, v200);

            if (isEqualToSet)
            {
              objc_msgSend_addObject_(v509, v202, (uint64_t)v189, v204, v205, v206);
              objc_msgSend_removeObject_(v504, v353, (uint64_t)v189, v354, v355, v356);
              goto LABEL_80;
            }
            objc_msgSend_strokeIdentifiers(v189, v202, v203, v204, v205, v206);
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIdentifiers(v173, v208, v209, v210, v211, v212);
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v207, v214, (uint64_t)v213, v215, v216, v217);

            if (isSubsetOfSet)
              break;
            objc_msgSend_strokeIdentifiers(v173, v219, v220, v221, v222, v223);
            v253 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIdentifiers(v189, v254, v255, v256, v257, v258);
            v259 = (void *)objc_claimAutoreleasedReturnValue();
            v264 = objc_msgSend_isSubsetOfSet_(v253, v260, (uint64_t)v259, v261, v262, v263);

            if (v264)
            {
              objc_msgSend_strokeIdentifiers(v189, v181, v182, v183, v184, v185);
              v265 = (void *)objc_claimAutoreleasedReturnValue();
              v230 = (void *)objc_msgSend_mutableCopy(v265, v266, v267, v268, v269, v270);

              objc_msgSend_strokeIdentifiers(v173, v271, v272, v273, v274, v275);
              v276 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_minusSet_(v230, v277, (uint64_t)v276, v278, v279, v280);

              v519[0] = MEMORY[0x1E0C809B0];
              v519[1] = 3221225472;
              v519[2] = sub_1BE7188B8;
              v519[3] = &unk_1E77F41D8;
              v520 = v12;
              objc_msgSend_objectsPassingTest_(v230, v281, (uint64_t)v519, v282, v283, v284);
              v285 = (void *)objc_claimAutoreleasedReturnValue();
              v291 = objc_msgSend_count(v285, v286, v287, v288, v289, v290) == 0;

              if (v291)
              {
                v426 = [CHStrokeGroup alloc];
                v432 = objc_msgSend_ancestorIdentifier(v189, v427, v428, v429, v430, v431);
                objc_msgSend_strokeIdentifiers(v173, v433, v434, v435, v436, v437);
                v438 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_firstStrokeIdentifier(v173, v439, v440, v441, v442, v443);
                v444 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_lastStrokeIdentifier(v173, v445, v446, v447, v448, v449);
                v450 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_bounds(v173, v451, v452, v453, v454, v455);
                v457 = v456;
                v459 = v458;
                v461 = v460;
                v463 = v462;
                objc_msgSend_groupingConfidence(v173, v464, v465, v466, v467, v468);
                v470 = v469;
                objc_msgSend_strategyIdentifier(v517, v471, v472, v473, v474, v475);
                v476 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_firstStrokeOrigin(v173, v477, v478, v479, v480, v481);
                StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (void *)objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v426, v482, v432, (uint64_t)v438, (uint64_t)v444, (uint64_t)v450, 3, v476, v457, v459, v461, v463, v470, v483, v484);

                objc_msgSend_addObject_(v509, v485, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v486, v487, v488);
                objc_msgSend_addObject_(v506, v489, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v490, v491, v492);
                v425 = &v520;
                goto LABEL_79;
              }
              v252 = &v520;
              goto LABEL_73;
            }
LABEL_63:
            if (v186 == ++v188)
            {
              v186 = objc_msgSend_countByEnumeratingWithState_objects_count_(v513, v181, (uint64_t)&v523, (uint64_t)v547, 16, v185);
              if (v186)
                goto LABEL_62;
              goto LABEL_75;
            }
          }
          objc_msgSend_strokeIdentifiers(v173, v219, v220, v221, v222, v223);
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          v230 = (void *)objc_msgSend_mutableCopy(v224, v225, v226, v227, v228, v229);

          objc_msgSend_strokeIdentifiers(v189, v231, v232, v233, v234, v235);
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_minusSet_(v230, v237, (uint64_t)v236, v238, v239, v240);

          v521[0] = MEMORY[0x1E0C809B0];
          v521[1] = 3221225472;
          v521[2] = sub_1BE718880;
          v521[3] = &unk_1E77F41D8;
          v522 = v518;
          objc_msgSend_objectsPassingTest_(v230, v241, (uint64_t)v521, v242, v243, v244);
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          v251 = objc_msgSend_count(v245, v246, v247, v248, v249, v250) == 0;

          if (v251)
          {
            v357 = [CHStrokeGroup alloc];
            v363 = objc_msgSend_ancestorIdentifier(v189, v358, v359, v360, v361, v362);
            objc_msgSend_strokeIdentifiers(v173, v364, v365, v366, v367, v368);
            v369 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_firstStrokeIdentifier(v173, v370, v371, v372, v373, v374);
            v375 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lastStrokeIdentifier(v173, v376, v377, v378, v379, v380);
            v381 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_bounds(v173, v382, v383, v384, v385, v386);
            v388 = v387;
            v390 = v389;
            v392 = v391;
            v394 = v393;
            objc_msgSend_groupingConfidence(v173, v395, v396, v397, v398, v399);
            v401 = v400;
            objc_msgSend_strategyIdentifier(v517, v402, v403, v404, v405, v406);
            v407 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_firstStrokeOrigin(v173, v408, v409, v410, v411, v412);
            StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (void *)objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v357, v413, v363, (uint64_t)v369, (uint64_t)v375, (uint64_t)v381, 3, v407, v388, v390, v392, v394, v401, v414, v415);

            objc_msgSend_addObject_(v509, v417, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v418, v419, v420);
            objc_msgSend_addObject_(v506, v421, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v422, v423, v424);
            v425 = &v522;
LABEL_79:

            goto LABEL_80;
          }
          v252 = &v522;
LABEL_73:

          goto LABEL_63;
        }
LABEL_75:

        v292 = [CHStrokeGroup alloc];
        objc_msgSend_strokeIdentifiers(v173, v293, v294, v295, v296, v297);
        v298 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstStrokeIdentifier(v173, v299, v300, v301, v302, v303);
        v304 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastStrokeIdentifier(v173, v305, v306, v307, v308, v309);
        v310 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bounds(v173, v311, v312, v313, v314, v315);
        v317 = v316;
        v319 = v318;
        v321 = v320;
        v323 = v322;
        objc_msgSend_groupingConfidence(v173, v324, v325, v326, v327, v328);
        v330 = v329;
        objc_msgSend_strategyIdentifier(v517, v331, v332, v333, v334, v335);
        v336 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstStrokeOrigin(v173, v337, v338, v339, v340, v341);
        v513 = (id)objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v292, v342, (uint64_t)v298, (uint64_t)v304, (uint64_t)v310, 3, v336, v317, v319, v321, v323, v330, v343, v344);

        objc_msgSend_addObject_(v509, v345, (uint64_t)v513, v346, v347, v348);
        objc_msgSend_addObject_(v506, v349, (uint64_t)v513, v350, v351, v352);
LABEL_80:

      }
      v508 = objc_msgSend_countByEnumeratingWithState_objects_count_(v505, v493, (uint64_t)&v527, (uint64_t)v548, 16, v494);
    }
    while (v508);
  }
LABEL_82:

  if ((v510[2]() & 1) != 0)
  {
    v495 = 0;
  }
  else
  {
    v496 = [CHStrokeGroupingResult alloc];
    v495 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_cachedAdjacencies_(v496, v497, (uint64_t)v509, (uint64_t)v506, (uint64_t)v504, (uint64_t)&v543);
  }

  sub_1BE6B4610((uint64_t)&v543, *((_QWORD **)&v543 + 1));
  sub_1BE6B4610((uint64_t)buf, *(_QWORD **)&buf[8]);

  return v495;
}

- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8
{
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  CHDrawing *v34;
  CHDrawing *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  CHDrawing *v43;
  CHDrawing *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  double *v94;
  id *v95;
  id v96;
  id *v97;
  id v99;
  id obj;
  _QWORD v101[4];
  CHDrawing *v102;
  CHDrawing *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[5];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v96 = a3;
  objc_msgSend_strokeIdentifiers(v96, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v17, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = MEMORY[0x1E0C809B0];
  v108[1] = 3221225472;
  v108[2] = sub_1BE718CA8;
  v108[3] = &unk_1E77F2B30;
  v108[4] = self;
  objc_msgSend_sortedArrayUsingComparator_(v23, v24, (uint64_t)v108, v25, v26, v27);
  v28 = objc_claimAutoreleasedReturnValue();

  v99 = (id)v28;
  objc_msgSend_strokesForIdentifiers_(self, v29, v28, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    v34 = objc_alloc_init(CHDrawing);
  else
    v34 = 0;
  v97 = a5;
  v35 = objc_alloc_init(CHDrawing);
  v94 = a7;
  v95 = a8;
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  obj = v33;
  v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v104, (uint64_t)v109, 16, v37, v33);
  if (v38)
  {
    v39 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v105 != v39)
          objc_enumerationMutation(obj);
        v41 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
        v42 = (void *)objc_opt_class();
        v101[0] = MEMORY[0x1E0C809B0];
        v101[1] = 3221225472;
        v101[2] = sub_1BE718DD0;
        v101[3] = &unk_1E77F4200;
        v43 = v34;
        v102 = v43;
        v44 = v35;
        v103 = v44;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v42, v45, (uint64_t)v41, 0, 1, (uint64_t)v101);
        if (v34)
        {
          objc_msgSend_endStroke(v43, v46, v47, v48, v49, v50);
          objc_msgSend_startTimestamp(v41, v51, v52, v53, v54, v55);
          objc_msgSend_addStartTime_(v43, v56, v57, v58, v59, v60);
          objc_msgSend_endTimestamp(v41, v61, v62, v63, v64, v65);
          objc_msgSend_addEndTime_(v43, v66, v67, v68, v69, v70);
        }
        objc_msgSend_endStroke(v44, v46, v47, v48, v49, v50);
        objc_msgSend_startTimestamp(v41, v71, v72, v73, v74, v75);
        objc_msgSend_addStartTime_(v44, v76, v77, v78, v79, v80);
        objc_msgSend_endTimestamp(v41, v81, v82, v83, v84, v85);
        objc_msgSend_addEndTime_(v44, v86, v87, v88, v89, v90);

      }
      v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v91, (uint64_t)&v104, (uint64_t)v109, 16, v92);
    }
    while (v38);
  }

  if (v97)
    *v97 = objc_retainAutorelease(v34);
  if (a6)
    *a6 = objc_retainAutorelease(v99);
  if (v94)
    *v94 = 1.0;
  if (v95)
    *v95 = 0;

  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_fastGroupingStrategy, 0);
  objc_storeStrong((id *)&self->_strategyIdentifier, 0);
}

@end
