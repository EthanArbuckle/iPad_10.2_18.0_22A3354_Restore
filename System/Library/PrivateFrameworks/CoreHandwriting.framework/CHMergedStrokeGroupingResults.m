@implementation CHMergedStrokeGroupingResults

- (CHMergedStrokeGroupingResults)initWithStrokeGroups:(id)a3 createdStrokeGroups:(id)a4 deletedStrokeGroups:(id)a5 groupingResultsByStrategyIdentifier:(id)a6
{
  id v11;
  CHMergedStrokeGroupingResults *v12;
  CHMergedStrokeGroupingResults *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CHMergedStrokeGroupingResults;
  v12 = -[CHStrokeGroupingResult initWithStrokeGroups:createdStrokeGroups:deletedStrokeGroups:](&v15, sel_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_groupingResultsByStrategyIdentifier, a6);

  return v13;
}

- (id)groupingResultUpdatedWithGroupReplacements:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CHMergedStrokeGroupingResults *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
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
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t j;
  void *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  _BOOL4 v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t k;
  void *v209;
  void *v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
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
  void *v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  void *v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  void *v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  void *v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  const char *v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  const char *v364;
  uint64_t v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  void *v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  void *v382;
  char isKindOfClass;
  const char *v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  void *v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  void *v394;
  CHBottomUpStrokeGroupingResult *v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  void *v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  void *v405;
  const char *v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  void *v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  void *v416;
  const char *v417;
  void *v418;
  const char *v419;
  uint64_t v420;
  uint64_t v421;
  void *v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  void *v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  _QWORD *v442;
  _QWORD *v443;
  _QWORD *v444;
  _QWORD *v445;
  _QWORD *v446;
  _QWORD *v447;
  uint64_t v448;
  uint64_t v449;
  char *v450;
  uint64_t v451;
  size_t prime;
  _QWORD *m;
  int8x8_t v454;
  BOOL v455;
  unint64_t v456;
  uint8x8_t v457;
  uint64_t v458;
  uint64_t v459;
  _QWORD *v460;
  BOOL v461;
  uint64_t v462;
  _QWORD *v463;
  uint64_t v464;
  _BYTE *v465;
  int v466;
  uint64_t v467;
  int v468;
  uint64_t *v469;
  uint64_t v470;
  uint64_t v471;
  _QWORD *v472;
  uint64_t v473;
  uint64_t *v474;
  uint64_t v475;
  CHStrokeGroupingResult *v476;
  const char *v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  void *v481;
  const char *v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  void *v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  void *v491;
  const char *v492;
  void *v493;
  const char *v494;
  uint64_t v495;
  uint64_t v496;
  CHMergedStrokeGroupingResults *v497;
  const char *v498;
  uint64_t v500;
  id v501;
  void *v502;
  void *v503;
  void *v504;
  uint64_t v505;
  void *v506;
  _QWORD *v507;
  id v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  uint64_t v513;
  void *v514;
  id obj;
  id obja;
  void *v518;
  _QWORD *v519;
  _QWORD *v520;
  uint64_t v521;
  __int128 v522;
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
  _QWORD *v538;
  _QWORD **v539;
  char v540;
  uint64_t v541;
  _QWORD v542[2];
  char v543;
  _BYTE v544[128];
  _BYTE v545[128];
  _QWORD v546[3];
  _BYTE v547[128];
  _QWORD v548[3];
  _BYTE v549[128];
  uint64_t v550;

  v550 = *MEMORY[0x1E0C80C00];
  v508 = a3;
  if (objc_msgSend_count(v508, v3, v4, v5, v6, v7))
  {
    objc_msgSend_strokeGroups(self, v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v510 = (void *)objc_msgSend_mutableCopy(v13, v14, v15, v16, v17, v18);

    objc_msgSend_createdStrokeGroups(self, v19, v20, v21, v22, v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend_createdStrokeGroups(self, v24, v25, v26, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v509 = (void *)objc_msgSend_mutableCopy(v30, v31, v32, v33, v34, v35);

    }
    else
    {
      objc_msgSend_set(MEMORY[0x1E0C99E20], v24, v25, v26, v27, v28);
      v509 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend_deletedStrokeGroups(self, v37, v38, v39, v40, v41);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend_deletedStrokeGroups(self, v42, v43, v44, v45, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v504 = (void *)objc_msgSend_mutableCopy(v48, v49, v50, v51, v52, v53);

    }
    else
    {
      objc_msgSend_set(MEMORY[0x1E0C99E20], v42, v43, v44, v45, v46);
      v504 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v54, v55, v56, v57, v58);
    v518 = (void *)objc_claimAutoreleasedReturnValue();
    v536 = 0u;
    v537 = 0u;
    v534 = 0u;
    v535 = 0u;
    objc_msgSend_groupingResultsByStrategyIdentifier(self, v59, v60, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keyEnumerator(v64, v65, v66, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v70;
    v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v534, (uint64_t)v549, 16, v72);
    if (v78)
    {
      v79 = *(_QWORD *)v535;
      do
      {
        for (i = 0; i != v78; ++i)
        {
          if (*(_QWORD *)v535 != v79)
            objc_enumerationMutation(obj);
          v81 = *(_QWORD *)(*((_QWORD *)&v534 + 1) + 8 * i);
          objc_msgSend_groupingResultsByStrategyIdentifier(self, v73, v74, v75, v76, v77);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v82, v83, v81, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_strokeGroups(v87, v88, v89, v90, v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = (void *)objc_msgSend_mutableCopy(v93, v94, v95, v96, v97, v98);

          objc_msgSend_createdStrokeGroups(v87, v100, v101, v102, v103, v104);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          if (v110)
          {
            objc_msgSend_createdStrokeGroups(v87, v105, v106, v107, v108, v109);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = (void *)objc_msgSend_mutableCopy(v111, v112, v113, v114, v115, v116);

          }
          else
          {
            objc_msgSend_set(MEMORY[0x1E0C99E20], v105, v106, v107, v108, v109);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend_deletedStrokeGroups(v87, v118, v119, v120, v121, v122);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          if (v128)
          {
            objc_msgSend_deletedStrokeGroups(v87, v123, v124, v125, v126, v127);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            v135 = (void *)objc_msgSend_mutableCopy(v129, v130, v131, v132, v133, v134);

          }
          else
          {
            objc_msgSend_set(MEMORY[0x1E0C99E20], v123, v124, v125, v126, v127);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
          }

          v548[0] = v99;
          v548[1] = v117;
          v548[2] = v135;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v136, (uint64_t)v548, 3, v137, v138);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v518, v140, (uint64_t)v139, v81, v141, v142);

        }
        v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v73, (uint64_t)&v534, (uint64_t)v549, 16, v77);
      }
      while (v78);
    }

    v532 = 0u;
    v533 = 0u;
    v530 = 0u;
    v531 = 0u;
    objc_msgSend_allValues(v508, v143, v144, v145, v146, v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v149, (uint64_t)&v530, (uint64_t)v547, 16, v150);
    if (v156)
    {
      v157 = *(_QWORD *)v531;
      do
      {
        for (j = 0; j != v156; ++j)
        {
          if (*(_QWORD *)v531 != v157)
            objc_enumerationMutation(v148);
          v159 = *(void **)(*((_QWORD *)&v530 + 1) + 8 * j);
          objc_msgSend_strategyIdentifier(v159, v151, v152, v153, v154, v155);
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v518, v161, (uint64_t)v160, v162, v163, v164);
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          v166 = v165 == 0;

          if (v166)
          {
            objc_msgSend_set(MEMORY[0x1E0C99E20], v151, v152, v153, v154, v155);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            v546[0] = v167;
            objc_msgSend_set(MEMORY[0x1E0C99E20], v168, v169, v170, v171, v172);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            v546[1] = v173;
            objc_msgSend_set(MEMORY[0x1E0C99E20], v174, v175, v176, v177, v178);
            v179 = (void *)objc_claimAutoreleasedReturnValue();
            v546[2] = v179;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v180, (uint64_t)v546, 3, v181, v182);
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strategyIdentifier(v159, v184, v185, v186, v187, v188);
            v189 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v518, v190, (uint64_t)v183, (uint64_t)v189, v191, v192);

          }
        }
        v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v151, (uint64_t)&v530, (uint64_t)v547, 16, v155);
      }
      while (v156);
    }

    v529 = 0u;
    v527 = 0u;
    v528 = 0u;
    v526 = 0u;
    objc_msgSend_strokeGroups(self, v193, v194, v195, v196, v197);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v198, v199, (uint64_t)&v526, (uint64_t)v545, 16, v200);
    if (v206)
    {
      v207 = *(_QWORD *)v527;
      do
      {
        for (k = 0; k != v206; ++k)
        {
          if (*(_QWORD *)v527 != v207)
            objc_enumerationMutation(v198);
          v209 = *(void **)(*((_QWORD *)&v526 + 1) + 8 * k);
          v210 = (void *)MEMORY[0x1E0CB37E8];
          v211 = objc_msgSend_uniqueIdentifier(v209, v201, v202, v203, v204, v205);
          objc_msgSend_numberWithInteger_(v210, v212, v211, v213, v214, v215);
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v508, v217, (uint64_t)v216, v218, v219, v220);
          v221 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_strategyIdentifier(v209, v222, v223, v224, v225, v226);
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          v233 = objc_msgSend_classification(v209, v228, v229, v230, v231, v232);
          objc_msgSend_updateStrategyIdentifier_classification_(v221, v234, (uint64_t)v227, v233, v235, v236);

          if (v221)
          {
            objc_msgSend_removeObject_(v510, v237, (uint64_t)v209, v238, v239, v240);
            objc_msgSend_strategyIdentifier(v209, v241, v242, v243, v244, v245);
            v246 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v518, v247, (uint64_t)v246, v248, v249, v250);
            v251 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v251, v252, 0, v253, v254, v255);
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeObject_(v256, v257, (uint64_t)v209, v258, v259, v260);

            objc_msgSend_addObject_(v510, v261, (uint64_t)v221, v262, v263, v264);
            objc_msgSend_strategyIdentifier(v221, v265, v266, v267, v268, v269);
            v270 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v518, v271, (uint64_t)v270, v272, v273, v274);
            v275 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v275, v276, 0, v277, v278, v279);
            v280 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v280, v281, (uint64_t)v221, v282, v283, v284);

            if (objc_msgSend_containsObject_(v509, v285, (uint64_t)v209, v286, v287, v288))
            {
              objc_msgSend_removeObject_(v509, v289, (uint64_t)v209, v290, v291, v292);
              objc_msgSend_strategyIdentifier(v209, v293, v294, v295, v296, v297);
              v298 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v518, v299, (uint64_t)v298, v300, v301, v302);
              v303 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v303, v304, 1, v305, v306, v307);
              v308 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_removeObject_(v308, v309, (uint64_t)v209, v310, v311, v312);

              objc_msgSend_addObject_(v509, v313, (uint64_t)v221, v314, v315, v316);
              objc_msgSend_strategyIdentifier(v221, v317, v318, v319, v320, v321);
              v322 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v518, v323, (uint64_t)v322, v324, v325, v326);
              v327 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v327, v328, 1, v329, v330, v331);
              v332 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v332, v333, (uint64_t)v221, v334, v335, v336);
            }
            else
            {
              objc_msgSend_addObject_(v504, v289, (uint64_t)v209, v290, v291, v292);
              objc_msgSend_strategyIdentifier(v209, v337, v338, v339, v340, v341);
              v322 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v518, v342, (uint64_t)v322, v343, v344, v345);
              v327 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v327, v346, 2, v347, v348, v349);
              v332 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v332, v350, (uint64_t)v209, v351, v352, v353);
            }

          }
        }
        v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v198, v201, (uint64_t)&v526, (uint64_t)v545, 16, v205);
      }
      while (v206);
    }

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v354, v355, v356, v357, v358);
    v506 = (void *)objc_claimAutoreleasedReturnValue();
    v524 = 0u;
    v525 = 0u;
    v522 = 0u;
    v523 = 0u;
    objc_msgSend_keyEnumerator(v518, v359, v360, v361, v362, v363);
    v501 = (id)objc_claimAutoreleasedReturnValue();
    v370 = objc_msgSend_countByEnumeratingWithState_objects_count_(v501, v364, (uint64_t)&v522, (uint64_t)v544, 16, v365);
    if (v370)
    {
      v505 = *(_QWORD *)v523;
      do
      {
        obja = 0;
        v500 = v370;
        do
        {
          if (*(_QWORD *)v523 != v505)
            objc_enumerationMutation(v501);
          v371 = *(_QWORD *)(*((_QWORD *)&v522 + 1) + 8 * (_QWORD)obja);
          objc_msgSend_objectForKeyedSubscript_(v518, v366, v371, v367, v368, v369);
          v514 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_groupingResultsByStrategyIdentifier(self, v372, v373, v374, v375, v376);
          v377 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v377, v378, v371, v379, v380, v381);
          v382 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          v513 = v371;
          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend_groupingResultsByStrategyIdentifier(self, v384, v385, v386, v387, v388);
            v389 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v389, v390, v371, v391, v392, v393);
            v394 = (void *)objc_claimAutoreleasedReturnValue();

            v395 = [CHBottomUpStrokeGroupingResult alloc];
            objc_msgSend_objectAtIndexedSubscript_(v514, v396, 0, v397, v398, v399);
            v400 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v514, v401, 1, v402, v403, v404);
            v405 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v514, v406, 2, v407, v408, v409);
            v410 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_substrokePlacementsByStrokeIdentifier(v394, v411, v412, v413, v414, v415);
            v416 = (void *)objc_claimAutoreleasedReturnValue();
            v418 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_substrokePlacementsByStrokeIdentifier_(v395, v417, (uint64_t)v400, (uint64_t)v405, (uint64_t)v410, (uint64_t)v416);
            objc_msgSend_setObject_forKeyedSubscript_(v506, v419, (uint64_t)v418, v513, v420, v421);

            goto LABEL_121;
          }
          objc_msgSend_groupingResultsByStrategyIdentifier(self, v384, v385, v386, v387, v388);
          v422 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v422, v423, v371, v424, v425, v426);
          v432 = (void *)objc_claimAutoreleasedReturnValue();
          if (v432)
          {
            objc_msgSend_groupingResultsByStrategyIdentifier(self, v427, v428, v429, v430, v431);
            v502 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v502, v433, v371, v434, v435, v436);
            v503 = (void *)objc_claimAutoreleasedReturnValue();
            v442 = (_QWORD *)objc_msgSend_cachedAdjacencies(v503, v437, v438, v439, v440, v441);
            v520 = 0;
            v521 = 0;
            v519 = &v520;
            v443 = v442 + 1;
            v444 = (_QWORD *)*v442;
            if ((_QWORD *)*v442 != v442 + 1)
            {
              v511 = v432;
              v512 = v422;
              v507 = v442 + 1;
              do
              {
                v445 = sub_1BE6B47D4(&v519, &v520, v542, &v541, v444 + 4);
                if (*v445)
                {
                  v446 = (_QWORD *)v444[1];
                  if (!v446)
                    goto LABEL_113;
                  goto LABEL_103;
                }
                v447 = operator new(0x50uLL);
                v538 = v447;
                v539 = &v520;
                v540 = 0;
                v447[5] = 0;
                v447[4] = v447 + 5;
                v447[6] = 0;
                sub_1BE66AAE8(v447 + 4, (_QWORD *)v444[4], v444 + 5);
                v447[7] = 0;
                v447[8] = 0;
                v447[9] = 0;
                v448 = v444[7];
                v449 = v444[8];
                v542[1] = v447 + 7;
                v543 = 0;
                if (v449 != v448)
                {
                  if (0xCCCCCCCCCCCCCCCDLL * ((v449 - v448) >> 3) >= 0x666666666666667)
                    sub_1BE61F930();
                  v450 = (char *)operator new(v449 - v448);
                  v447[7] = v450;
                  v447[8] = v450;
                  v447[9] = &v450[8 * ((v449 - v448) >> 3)];
                  v451 = (uint64_t)v450;
                  while (1)
                  {
                    *(_OWORD *)v451 = 0u;
                    *(_OWORD *)(v451 + 16) = 0u;
                    *(_DWORD *)(v451 + 32) = *(_DWORD *)(v448 + 32);
                    prime = *(_QWORD *)(v448 + 8);
                    if (prime == 1)
                    {
                      prime = 2;
                    }
                    else if ((prime & (prime - 1)) != 0)
                    {
                      prime = std::__next_prime(*(_QWORD *)(v448 + 8));
                      v454 = *(int8x8_t *)(v451 + 8);
                      v455 = prime >= *(_QWORD *)&v454;
                      if (prime <= *(_QWORD *)&v454)
                      {
LABEL_71:
                        if (v455)
                          goto LABEL_64;
                        v456 = vcvtps_u32_f32((float)*(unint64_t *)(v451 + 24) / *(float *)(v451 + 32));
                        if (*(_QWORD *)&v454 < 3uLL
                          || (v457 = (uint8x8_t)vcnt_s8(v454), v457.i16[0] = vaddlv_u8(v457), v457.u32[0] > 1uLL))
                        {
                          v456 = std::__next_prime(v456);
                        }
                        else
                        {
                          v458 = 1 << -(char)__clz(v456 - 1);
                          if (v456 >= 2)
                            v456 = v458;
                        }
                        if (prime <= v456)
                          prime = v456;
                        if (prime >= *(_QWORD *)&v454)
                          goto LABEL_64;
                      }
                    }
                    else
                    {
                      v454 = 0;
                      v455 = 1;
                      if (!prime)
                        goto LABEL_71;
                    }
                    sub_1BE61F23C(v451, prime);
LABEL_64:
                    for (m = *(_QWORD **)(v448 + 16); m; m = (_QWORD *)*m)
                      sub_1BE6B5194(v451, m + 2, (_OWORD *)m + 1);
                    v448 += 40;
                    v451 += 40;
                    if (v448 == v449)
                    {
                      v447[8] = v451;
                      v447 = v538;
                      v371 = v513;
                      v443 = v507;
                      break;
                    }
                  }
                }
                v540 = 1;
                v459 = v542[0];
                *v447 = 0;
                v447[1] = 0;
                v447[2] = v459;
                *v445 = v447;
                v432 = v511;
                v422 = v512;
                if (*v519)
                {
                  v519 = (_QWORD *)*v519;
                  v447 = (_QWORD *)*v445;
                }
                v460 = v520;
                v461 = v447 == v520;
                *((_BYTE *)v447 + 24) = v447 == v520;
                if (v461)
                {
LABEL_102:
                  ++v521;
                  v446 = (_QWORD *)v444[1];
                  if (!v446)
                    goto LABEL_113;
                  goto LABEL_103;
                }
                while (1)
                {
                  v462 = v447[2];
                  if (*(_BYTE *)(v462 + 24))
                    goto LABEL_102;
                  v463 = *(_QWORD **)(v462 + 16);
                  v464 = *v463;
                  if (*v463 != v462)
                    break;
                  v467 = v463[1];
                  if (!v467 || (v468 = *(unsigned __int8 *)(v467 + 24), v465 = (_BYTE *)(v467 + 24), v468))
                  {
                    if (*(_QWORD **)v462 == v447)
                    {
                      *(_BYTE *)(v462 + 24) = 1;
                      *((_BYTE *)v463 + 24) = 0;
                      v471 = *(_QWORD *)(v462 + 8);
                      *v463 = v471;
                      if (v471)
                        goto LABEL_100;
                    }
                    else
                    {
                      v469 = *(uint64_t **)(v462 + 8);
                      v470 = *v469;
                      *(_QWORD *)(v462 + 8) = *v469;
                      if (v470)
                      {
                        *(_QWORD *)(v470 + 16) = v462;
                        v463 = *(_QWORD **)(v462 + 16);
                      }
                      v469[2] = (uint64_t)v463;
                      *(_QWORD *)(*(_QWORD *)(v462 + 16) + 8 * (**(_QWORD **)(v462 + 16) != v462)) = v469;
                      *v469 = v462;
                      *(_QWORD *)(v462 + 16) = v469;
                      v463 = (_QWORD *)v469[2];
                      v462 = *v463;
                      *((_BYTE *)v469 + 24) = 1;
                      *((_BYTE *)v463 + 24) = 0;
                      v471 = *(_QWORD *)(v462 + 8);
                      *v463 = v471;
                      if (v471)
LABEL_100:
                        *(_QWORD *)(v471 + 16) = v463;
                    }
                    *(_QWORD *)(v462 + 16) = v463[2];
                    *(_QWORD *)(v463[2] + 8 * (*(_QWORD *)v463[2] != (_QWORD)v463)) = v462;
                    *(_QWORD *)(v462 + 8) = v463;
                    v463[2] = v462;
                    goto LABEL_102;
                  }
LABEL_88:
                  *(_BYTE *)(v462 + 24) = 1;
                  v447 = v463;
                  *((_BYTE *)v463 + 24) = v463 == v460;
                  *v465 = 1;
                  if (v463 == v460)
                    goto LABEL_102;
                }
                if (v464)
                {
                  v466 = *(unsigned __int8 *)(v464 + 24);
                  v465 = (_BYTE *)(v464 + 24);
                  if (!v466)
                    goto LABEL_88;
                }
                if (*(_QWORD **)v462 == v447)
                {
                  v473 = v447[1];
                  *(_QWORD *)v462 = v473;
                  if (v473)
                  {
                    *(_QWORD *)(v473 + 16) = v462;
                    v463 = *(_QWORD **)(v462 + 16);
                  }
                  v447[2] = v463;
                  *(_QWORD *)(*(_QWORD *)(v462 + 16) + 8 * (**(_QWORD **)(v462 + 16) != v462)) = v447;
                  v447[1] = v462;
                  *(_QWORD *)(v462 + 16) = v447;
                  v463 = (_QWORD *)v447[2];
                }
                else
                {
                  v447 = (_QWORD *)v447[2];
                }
                *((_BYTE *)v447 + 24) = 1;
                *((_BYTE *)v463 + 24) = 0;
                v474 = (uint64_t *)v463[1];
                v475 = *v474;
                v463[1] = *v474;
                if (v475)
                  *(_QWORD *)(v475 + 16) = v463;
                v474[2] = v463[2];
                *(_QWORD *)(v463[2] + 8 * (*(_QWORD *)v463[2] != (_QWORD)v463)) = v474;
                *v474 = (uint64_t)v463;
                v463[2] = v474;
                ++v521;
                v446 = (_QWORD *)v444[1];
                if (!v446)
                {
                  do
                  {
LABEL_113:
                    v472 = (_QWORD *)v444[2];
                    v461 = *v472 == (_QWORD)v444;
                    v444 = v472;
                  }
                  while (!v461);
                  goto LABEL_53;
                }
                do
                {
LABEL_103:
                  v472 = v446;
                  v446 = (_QWORD *)*v446;
                }
                while (v446);
LABEL_53:
                v444 = v472;
              }
              while (v472 != v443);
            }

            v370 = v500;
          }
          else
          {
            v520 = 0;
            v521 = 0;
            v519 = &v520;
          }

          v476 = [CHStrokeGroupingResult alloc];
          objc_msgSend_objectAtIndexedSubscript_(v514, v477, 0, v478, v479, v480);
          v481 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v514, v482, 1, v483, v484, v485);
          v486 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v514, v487, 2, v488, v489, v490);
          v491 = (void *)objc_claimAutoreleasedReturnValue();
          v493 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_cachedAdjacencies_(v476, v492, (uint64_t)v481, (uint64_t)v486, (uint64_t)v491, (uint64_t)&v519);
          objc_msgSend_setObject_forKeyedSubscript_(v506, v494, (uint64_t)v493, v371, v495, v496);

          sub_1BE6B4610((uint64_t)&v519, v520);
LABEL_121:

          obja = (char *)obja + 1;
        }
        while (obja != (id)v370);
        v370 = objc_msgSend_countByEnumeratingWithState_objects_count_(v501, v366, (uint64_t)&v522, (uint64_t)v544, 16, v369);
      }
      while (v370);
    }

    v497 = [CHMergedStrokeGroupingResults alloc];
    v36 = (CHMergedStrokeGroupingResults *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_groupingResultsByStrategyIdentifier_(v497, v498, (uint64_t)v510, (uint64_t)v509, (uint64_t)v504, (uint64_t)v506);

  }
  else
  {
    v36 = self;
  }

  return v36;
}

- (id)strokeGroupsOfClass:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id obj;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend_set(MEMORY[0x1E0C99E20], a2, a3, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend_groupingResultsByStrategyIdentifier(self, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v14, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v20;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v45, (uint64_t)v49, 16, v22);
  if (v28)
  {
    v29 = *(_QWORD *)v46;
    v30 = MEMORY[0x1E0C809B0];
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v46 != v29)
          objc_enumerationMutation(obj);
        objc_msgSend_strokeGroups(*(void **)(*((_QWORD *)&v45 + 1) + 8 * v31), v23, v24, v25, v26, v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v30;
        v44[1] = 3221225472;
        v44[2] = sub_1BE6AE64C;
        v44[3] = &unk_1E77F2F90;
        v44[4] = a3;
        objc_msgSend_objectsPassingTest_(v32, v33, (uint64_t)v44, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_unionSet_(v8, v38, (uint64_t)v37, v39, v40, v41);
        ++v31;
      }
      while (v28 != v31);
      v20 = obj;
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v45, (uint64_t)v49, 16, v27);
    }
    while (v28);
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  objc_msgSend_strokeGroups(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v16, v10, (uint64_t)v9, (uint64_t)CFSTR("strokeGroups"), v11, v12);

  objc_msgSend_encodeObject_forKey_(v16, v13, (uint64_t)self->_groupingResultsByStrategyIdentifier, (uint64_t)CFSTR("groupingResultsByStrategyIdentifier"), v14, v15);
}

- (CHMergedStrokeGroupingResults)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  CHMergedStrokeGroupingResults *v34;
  _QWORD v36[3];
  _QWORD v37[4];

  v37[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v37[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v37, 3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v10, (uint64_t)v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("strokeGroups"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E60];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)v36, 3, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v19, v24, (uint64_t)v23, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, (uint64_t)CFSTR("groupingResultsByStrategyIdentifier"), v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (CHMergedStrokeGroupingResults *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_groupingResultsByStrategyIdentifier_(self, v33, (uint64_t)v18, (uint64_t)v18, 0, (uint64_t)v32);
  return v34;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)groupingResultsByStrategyIdentifier
{
  return self->_groupingResultsByStrategyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingResultsByStrategyIdentifier, 0);
}

@end
