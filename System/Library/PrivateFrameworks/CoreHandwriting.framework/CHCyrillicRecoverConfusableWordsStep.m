@implementation CHCyrillicRecoverConfusableWordsStep

- (id)process:(id)a3 options:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  BOOL v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  BOOL v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char v141;
  void *v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  _BOOL4 v154;
  BOOL v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  int v168;
  _BOOL4 v169;
  int v170;
  _BOOL4 v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t *v186;
  _BOOL4 v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  double v231;
  uint64_t i;
  void *v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  char isEqualToString;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  _BOOL4 v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  _BOOL4 v291;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  double v299;
  _BOOL4 v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  double v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  int v324;
  void *v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  double v331;
  _BOOL4 v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  double v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  void *v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  void *v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  void *v385;
  const char *v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  void *v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  void *v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  void *v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  void *v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  unint64_t j;
  void *v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  void *v428;
  const char *v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  BOOL v434;
  const char *v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  void *v440;
  const char *v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  void *v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  void *v452;
  const char *v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  void *v458;
  const char *v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  void *v463;
  const char *v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  void *v469;
  const char *v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  id v476;
  const char *v477;
  const char *v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  const char *v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  void *v487;
  const char *v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  void *v493;
  const char *v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  void *v498;
  const char *v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  void *v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  void *v507;
  id *v508;
  id v510;
  void *v511;
  void *v512;
  void *v513;
  void *v514;
  void *v515;
  uint64_t v516;
  uint64_t v517;
  void *v518;
  unint64_t v519;
  id *v520;
  int v522;
  char v523;
  int v524;
  void *v525;
  void *v526;
  void *v527;
  id obj;
  uint64_t v529;
  _QWORD v530[4];
  id v531;
  __int16 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int16 v537;
  __int16 v538;
  __int16 v539;
  _QWORD v540[7];
  uint64_t v541;
  uint64_t *v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t *v546;
  uint64_t v547;
  uint64_t v548;
  _BYTE v549[128];
  uint64_t v550;

  v550 = *MEMORY[0x1E0C80C00];
  v520 = (id *)a3;
  v510 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13, v14);
  v514 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leftContext(v520, v15, v16, v17, v18, v19);
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastWordInString(v20);
  v511 = (void *)objc_claimAutoreleasedReturnValue();

  v545 = 0;
  v546 = &v545;
  v547 = 0x2020000000;
  v548 = 0;
  v541 = 0;
  v542 = &v541;
  v543 = 0x2020000000;
  v544 = 0;
  objc_msgSend_leftContext(v520, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leftContext(v520, v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_length(v32, v33, v34, v35, v36, v37);
  v540[0] = MEMORY[0x1E0C809B0];
  v540[1] = 3221225472;
  v540[2] = sub_1BE8C3370;
  v540[3] = &unk_1E77F6A90;
  v540[4] = self;
  v540[5] = &v545;
  v540[6] = &v541;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v26, v39, 0, v38, 3, (uint64_t)v540);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v40, v41, v42, v43, v44);
  v518 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v516 = 0;
  v517 = 0;
  while (1)
  {
    objc_msgSend_result(v520, v45, v46, v47, v48, v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v50 < objc_msgSend_tokenColumnCount(v51, v52, v53, v54, v55, v56);

    if (!v57)
      break;
    objc_msgSend_result(v520, v58, v59, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v520, v64, v65, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v69, v70, v71, v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v75, v76, 0, v77, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v63, v81, (uint64_t)v80, v50, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(v518, v85, (uint64_t)v84, v86, v87, v88);
    v539 = 0;
    sub_1BE8C1E50((uint64_t)self, v84, (_BYTE *)&v539 + 1, &v539);
    v89 = v539;
    v90 = HIBYTE(v539);

    v516 += v89;
    v517 += v90;
    ++v50;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v58, v59, v60, v61, v62);
  v512 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v91, v92, v93, v94, v95);
  v513 = (void *)objc_claimAutoreleasedReturnValue();
  v519 = 0;
  objc_msgSend_result(v520, v96, v97, v98, v99, v100);
  while (1)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v519 < objc_msgSend_tokenColumnCount(v101, v102, v103, v104, v105, v106);

    if (!v107)
      break;
    objc_msgSend_objectAtIndexedSubscript_(v518, v108, v519, v109, v110, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v539 = 0;
    sub_1BE8C1E50((uint64_t)self, v112, (_BYTE *)&v539 + 1, &v539);
    v118 = objc_msgSend_count(v112, v113, v114, v115, v116, v117);
    objc_msgSend_objectAtIndexedSubscript_(v112, v119, 0, v120, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v526 = v112;
    objc_msgSend_string(v123, v124, v125, v126, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend_length(v129, v130, v131, v132, v133, v134);
    v136 = v118 != 1;

    v141 = v135 > 6 || v136;
    if ((v141 & 1) != 0 || v539 == HIBYTE(v539))
    {
      v149 = v526;
      objc_msgSend_addObjectsFromArray_(v512, v137, (uint64_t)v526, v138, v139, v140);
      objc_msgSend_addObjectsFromArray_(v513, v150, (uint64_t)v526, v151, v152, v153);
      goto LABEL_87;
    }
    v538 = 0;
    v142 = v526;
    if (v519)
    {
      objc_msgSend_objectAtIndexedSubscript_(v518, v137, v519 - 1, v138, v139, v140);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BE8C1E50((uint64_t)self, v143, (_BYTE *)&v538 + 1, &v538);

      v142 = v526;
    }
    else
    {
      sub_1BE8C20BC((uint64_t)self, v511, (_BYTE *)&v538 + 1, &v538);
    }
    v154 = 0;
    v156 = HIBYTE(v539) == HIBYTE(v538) && v539 == v538;
    if (HIBYTE(v538) | v538 && !v156)
    {
      objc_msgSend_firstObject(v142, v144, v145, v146, v147, v148);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = (objc_msgSend_properties(v157, v158, v159, v160, v161, v162) & 0x20) == 0;

      v142 = v526;
    }
    v537 = 0;
    if (v519 < objc_msgSend_count(v518, v144, v145, v146, v147, v148) - 1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v518, v163, v519 + 1, v164, v165, v166);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BE8C1E50((uint64_t)self, v167, (_BYTE *)&v537 + 1, &v537);

      v142 = v526;
    }
    v168 = v539;
    if (v156 || HIBYTE(v539) == HIBYTE(v537) && v539 == v537)
    {
      v169 = 0;
      if (!(_BYTE)v539)
        goto LABEL_33;
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(v142, v163, 0, v164, v165, v166);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v172, v173, v174, v175, v176, v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = (unint64_t)objc_msgSend_length(v178, v179, v180, v181, v182, v183) < 3;

      v168 = v539;
      if (!(_BYTE)v539)
      {
LABEL_33:
        v170 = HIBYTE(v539);
        goto LABEL_34;
      }
    }
    v170 = HIBYTE(v539);
    if (HIBYTE(v538) | HIBYTE(v537))
    {
      v171 = 1;
      goto LABEL_36;
    }
LABEL_34:
    if (v170)
    {
      v171 = (v538 | v537) != 0;
      if (!v168)
        goto LABEL_38;
    }
    else
    {
      v171 = 0;
      if (!v168)
      {
LABEL_38:
        v184 = v517;
        v185 = v546[3] + v516;
        v186 = v542;
        goto LABEL_39;
      }
    }
LABEL_36:
    v184 = v516;
    v185 = v542[3] + v517;
    v186 = v546;
LABEL_39:
    v187 = (double)v185 / (double)(unint64_t)(v186[3] + v184) > 1.0 && v171;
    if (v170)
    {
      objc_msgSend_objectAtIndexedSubscript_(v526, v163, 0, v164, v165, v166);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v188, v189, v190, v191, v192, v193);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transformLatinToCyrillic_(CHLanguageUtilities, v195, (uint64_t)v194, v196, v197, v198);
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(v526, v163, 0, v164, v165, v166);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v188, v199, v200, v201, v202, v203);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transformCyrillicToLatin_(CHLanguageUtilities, v204, (uint64_t)v194, v205, v206, v207);
    }
    v525 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectAtIndexedSubscript_(v526, v208, 0, v209, v210, v211);
    v527 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v520, v212, v213, v214, v215, v216);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenRowsAtColumnIndex_(v217, v218, v519, v219, v220, v221);
    v222 = (void *)objc_claimAutoreleasedReturnValue();

    v535 = 0u;
    v536 = 0u;
    v533 = 0u;
    v534 = 0u;
    obj = v222;
    v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v223, (uint64_t)&v533, (uint64_t)v549, 16, v224);
    if (!v230)
    {

      goto LABEL_85;
    }
    v529 = *(_QWORD *)v534;
    v523 = 0;
    v524 = v169 || v154;
    v522 = v187 || v154;
    v231 = -1.0;
    do
    {
      for (i = 0; i != v230; ++i)
      {
        if (*(_QWORD *)v534 != v529)
          objc_enumerationMutation(obj);
        v233 = *(void **)(*((_QWORD *)&v533 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend_count(v233, v225, v226, v227, v228, v229) <= 1)
        {
          objc_msgSend_objectAtIndexedSubscript_(v233, v225, 0, v227, v228, v229);
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_string(v234, v235, v236, v237, v238, v239);
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend_length(v240, v241, v242, v243, v244, v245) >= 7)
          {

LABEL_55:
            continue;
          }
          objc_msgSend_objectAtIndexedSubscript_(v233, v246, 0, v247, v248, v249);
          v250 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_string(v250, v251, v252, v253, v254, v255);
          v256 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v526, v257, 0, v258, v259, v260);
          v261 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_string(v261, v262, v263, v264, v265, v266);
          v267 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v256, v268, (uint64_t)v267, v269, v270, v271);

          if ((isEqualToString & 1) == 0)
          {
            objc_msgSend_objectAtIndexedSubscript_(v233, v225, 0, v227, v228, v229);
            v273 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_string(v273, v274, v275, v276, v277, v278);
            v279 = (void *)objc_claimAutoreleasedReturnValue();
            v285 = objc_msgSend_length(v279, v280, v281, v282, v283, v284) == 1;

            if ((v285 & v524) != 1)
              goto LABEL_74;
            v532 = 0;
            sub_1BE8C1E50((uint64_t)self, v233, (_BYTE *)&v532 + 1, &v532);
            v291 = HIBYTE(v532) == HIBYTE(v538) && v532 == v538;
            if (HIBYTE(v532) == HIBYTE(v537) && v532 == v537)
              v291 = 1;
            if (HIBYTE(v532) | v532
              && v291
              && (objc_msgSend_objectAtIndexedSubscript_(v233, v286, 0, v287, v288, v289),
                  v293 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend_recognitionScore(v293, v294, v295, v296, v297, v298),
                  v300 = v299 > v231,
                  v293,
                  v300))
            {
              objc_msgSend_objectAtIndexedSubscript_(v233, v286, 0, v287, v288, v289);
              v301 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_objectAtIndexedSubscript_(v233, v302, 0, v303, v304, v305);
              v306 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recognitionScore(v306, v307, v308, v309, v310, v311);
              v231 = v312;

              v523 = 1;
            }
            else
            {
LABEL_74:
              v301 = v527;
            }
            objc_msgSend_objectAtIndexedSubscript_(v233, v286, 0, v287, v288, v289);
            v313 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_string(v313, v314, v315, v316, v317, v318);
            v319 = (void *)objc_claimAutoreleasedReturnValue();
            v324 = objc_msgSend_containsObject_(v525, v320, (uint64_t)v319, v321, v322, v323);

            if (!v324
              || ((objc_msgSend_objectAtIndexedSubscript_(v233, v225, 0, v227, v228, v229),
                   v325 = (void *)objc_claimAutoreleasedReturnValue(),
                   objc_msgSend_recognitionScore(v325, v326, v327, v328, v329, v330),
                   ((v331 > v231) & v523) == 0)
                ? (v332 = v331 > v231)
                : (v332 = v522),
                  v325,
                  !v332))
            {
              v527 = v301;
              continue;
            }
            objc_msgSend_objectAtIndexedSubscript_(v233, v225, 0, v227, v228, v229);
            v527 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_objectAtIndexedSubscript_(v233, v333, 0, v334, v335, v336);
            v234 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recognitionScore(v234, v337, v338, v339, v340, v341);
            v231 = v342;
            v523 = v522;
            goto LABEL_55;
          }
        }
      }
      v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v225, (uint64_t)&v533, (uint64_t)v549, 16, v229);
    }
    while (v230);

    if ((v523 & 1) != 0)
    {
      objc_msgSend_addObject_(v512, v343, (uint64_t)v527, v344, v345, v346);
      objc_msgSend_objectAtIndexedSubscript_(v526, v347, 0, v348, v349, v350);
      v351 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v513, v352, (uint64_t)v351, v353, v354, v355);

      goto LABEL_86;
    }
LABEL_85:
    objc_msgSend_objectAtIndexedSubscript_(v526, v343, 0, v344, v345, v346);
    v356 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v512, v357, (uint64_t)v356, v358, v359, v360);

    objc_msgSend_addObject_(v513, v361, (uint64_t)v527, v362, v363, v364);
LABEL_86:

    v149 = v526;
LABEL_87:

    ++v519;
    objc_msgSend_result(v520, v365, v366, v367, v368, v369);
  }
  if ((objc_msgSend_isEqual_(v512, v108, (uint64_t)v513, v109, v110, v111) & 1) == 0)
  {
    objc_msgSend_addObject_(v515, v370, (uint64_t)v512, v371, v372, v373);
    objc_msgSend_result(v520, v374, v375, v376, v377, v378);
    v379 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v379, v380, v381, v382, v383, v384);
    v385 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v385, v386, 0, v387, v388, v389);
    v390 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v514, v391, (uint64_t)v390, v392, v393, v394);

  }
  objc_msgSend_addObject_(v515, v370, (uint64_t)v513, v371, v372, v373);
  objc_msgSend_result(v520, v395, v396, v397, v398, v399);
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPathScores(v400, v401, v402, v403, v404, v405);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v406, v407, 0, v408, v409, v410);
  v411 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v514, v412, (uint64_t)v411, v413, v414, v415);

  for (j = 1; ; ++j)
  {
    objc_msgSend_result(v520, v416, v417, v418, v419, v420);
    v422 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v422, v423, v424, v425, v426, v427);
    v428 = (void *)objc_claimAutoreleasedReturnValue();
    v434 = j < objc_msgSend_count(v428, v429, v430, v431, v432, v433);

    if (!v434)
      break;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v435, v436, v437, v438, v439);
    v440 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v520, v441, v442, v443, v444, v445);
    v446 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v520, v447, v448, v449, v450, v451);
    v452 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v452, v453, v454, v455, v456, v457);
    v458 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v458, v459, j, v460, v461, v462);
    v463 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v520, v464, v465, v466, v467, v468);
    v469 = (void *)objc_claimAutoreleasedReturnValue();
    v475 = objc_msgSend_tokenColumnCount(v469, v470, v471, v472, v473, v474);
    v530[0] = MEMORY[0x1E0C809B0];
    v530[1] = 3221225472;
    v530[2] = sub_1BE8C33E0;
    v530[3] = &unk_1E77F4928;
    v476 = v440;
    v531 = v476;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v446, v477, (uint64_t)v463, 0, v475, (uint64_t)v530);

    objc_msgSend_addObject_(v515, v478, (uint64_t)v476, v479, v480, v481);
    objc_msgSend_result(v520, v482, v483, v484, v485, v486);
    v487 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v487, v488, v489, v490, v491, v492);
    v493 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v493, v494, j, v495, v496, v497);
    v498 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v514, v499, (uint64_t)v498, v500, v501, v502);

  }
  objc_msgSend_result(v520, v435, v436, v437, v438, v439);
  v503 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v503, v504, (uint64_t)v515, (uint64_t)v514, v505, v506);
  v507 = (void *)objc_claimAutoreleasedReturnValue();
  if (v520)
    objc_storeStrong(v520 + 3, v507);

  v508 = v520;
  _Block_object_dispose(&v541, 8);
  _Block_object_dispose(&v545, 8);

  return v508;
}

@end
