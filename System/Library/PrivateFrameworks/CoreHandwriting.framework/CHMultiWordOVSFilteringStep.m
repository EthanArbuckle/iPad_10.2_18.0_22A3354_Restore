@implementation CHMultiWordOVSFilteringStep

- (CHMultiWordOVSFilteringStep)initWithOVSStringChecker:(id)a3
{
  id v5;
  CHMultiWordOVSFilteringStep *v6;
  CHMultiWordOVSFilteringStep *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHMultiWordOVSFilteringStep;
  v6 = -[CHMultiWordOVSFilteringStep init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ovsStringChecker, a3);

  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  id *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
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
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __CFString *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  int v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  unint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  int v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  unint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
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
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
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
  unint64_t v246;
  uint64_t v247;
  unint64_t v248;
  uint64_t v249;
  uint64_t j;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  char v262;
  CHTokenizedTextResultToken *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  double v293;
  double v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  double v300;
  double v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  double v307;
  double v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
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
  uint64_t v325;
  uint64_t v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  double v338;
  double v339;
  double v340;
  double v341;
  double v342;
  double v343;
  double v344;
  double v345;
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
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  void *v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  void *v394;
  CHMutableTokenizedResultColumn *v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  void *v406;
  const char *v407;
  uint64_t v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t m;
  void *v417;
  void *v418;
  id v419;
  const char *v420;
  uint64_t v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t n;
  uint64_t v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  void *v434;
  const char *v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  const char *v443;
  uint64_t v444;
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
  CHMutableTokenizedTextResult *v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  void *v462;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  void *v468;
  const char *v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  void *v474;
  const char *v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  void *v480;
  const char *v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  void *v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  void *v492;
  const char *v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  void *v498;
  const char *v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  const char *v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  void *v510;
  const char *v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  const char *v517;
  void *v518;
  const char *v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  void *v524;
  const char *v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  void *v530;
  const char *v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  void *v535;
  const char *v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  void *v540;
  const char *v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  void *v545;
  const char *v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  void *v550;
  const char *v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  void *v556;
  const char *v557;
  uint64_t v558;
  uint64_t v559;
  uint64_t v560;
  const char *v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  id v565;
  void *v566;
  void *v567;
  id *v568;
  __CFString *v570;
  uint64_t v571;
  void *v572;
  unint64_t v573;
  uint64_t isInappropriateString;
  double v575;
  uint64_t v576;
  double v577;
  uint64_t v578;
  double v579;
  void *v580;
  id obj;
  id obja;
  unint64_t i;
  uint64_t k;
  id v585;
  id v586;
  id v587;
  void *v588;
  uint64_t v589;
  void *v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  _OWORD v603[8];
  _QWORD v604[4];
  id v605;
  uint8_t buf[16];
  _BYTE v607[128];
  _BYTE v608[128];
  _BYTE v609[128];
  uint64_t v610;

  v610 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  v565 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v568 = v5;
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHMultiWordOVSFilteringStep is running", buf, 2u);
  }

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9, v10, v11);
  v590 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14, v15, v16);
  v572 = (void *)objc_claimAutoreleasedReturnValue();
  v573 = 0;
  objc_msgSend_result(v5, v17, v18, v19, v20, v21);
  while (1)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v22, v23, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v573 < objc_msgSend_count(v28, v29, v30, v31, v32, v33);

    if (!v34)
      break;
    objc_msgSend_result(v568, v35, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v40, v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v46, v47, v573, v48, v49, v50);
    v567 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v51, v52, v53, v54, v55);
    v566 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v568, v56, v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v568, v62, v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend_tokenColumnCount(v67, v68, v69, v70, v71, v72);
    v604[0] = MEMORY[0x1E0C809B0];
    v604[1] = 3221225472;
    v604[2] = sub_1BE8BD4C0;
    v604[3] = &unk_1E77F4928;
    v587 = v566;
    v605 = v587;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v61, v74, (uint64_t)v567, 0, v73, (uint64_t)v604);

    for (i = 0; i < objc_msgSend_count(v587, v75, v76, v77, v78, v79); ++i)
    {
      v85 = objc_msgSend_count(v587, v80, v81, v82, v83, v84);
      v90 = &stru_1E77F6F28;
      if (i <= 0xFFFFFFFFFFFFFFFCLL && i < v85)
      {
        objc_msgSend_objectAtIndexedSubscript_(v587, v86, i, v87, v88, v89);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_string(v91, v92, v93, v94, v95, v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(&stru_1E77F6F28, v98, (uint64_t)v97, v99, v100, v101);
        v570 = (__CFString *)objc_claimAutoreleasedReturnValue();

        isInappropriateString = objc_msgSend_isInappropriateString_(self->_ovsStringChecker, v102, (uint64_t)v570, v103, v104, v105);
        v116 = i + 1;
        if (i + 1 < objc_msgSend_count(v587, v106, v107, v108, v109, v110))
        {
          objc_msgSend_result(v568, v111, v112, v113, v114, v115);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v587, v118, v116, v119, v120, v121);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_precedingSeparatorForToken_(v117, v123, (uint64_t)v122, v124, v125, v126);
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingString_(v570, v128, (uint64_t)v127, v129, v130, v131);
          v132 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_objectAtIndexedSubscript_(v587, v133, v116, v134, v135, v136);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_string(v137, v138, v139, v140, v141, v142);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingString_(v132, v144, (uint64_t)v143, v145, v146, v147);
          v570 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v152 = objc_msgSend_isInappropriateString_(self->_ovsStringChecker, v148, (uint64_t)v570, v149, v150, v151);
          v158 = isInappropriateString;
          if (v152)
            v158 = 2;
          isInappropriateString = v158;
          v160 = i + 2;
          if (i + 2 < objc_msgSend_count(v587, v153, v154, v155, v156, v157))
          {
            v161 = i + 3;
            if (v116 < i + 3)
            {
              objc_msgSend_result(v568, v111, v159, v113, v114, v115);
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v587, v163, v160, v164, v165, v166);
              v167 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_precedingSeparatorForToken_(v162, v168, (uint64_t)v167, v169, v170, v171);
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringByAppendingString_(v570, v173, (uint64_t)v172, v174, v175, v176);
              v177 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_objectAtIndexedSubscript_(v587, v178, v160, v179, v180, v181);
              v182 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_string(v182, v183, v184, v185, v186, v187);
              v188 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringByAppendingString_(v177, v189, (uint64_t)v188, v190, v191, v192);
              v570 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v197 = objc_msgSend_isInappropriateString_(self->_ovsStringChecker, v193, (uint64_t)v570, v194, v195, v196);
              v203 = isInappropriateString;
              if (v197)
                v203 = 3;
              isInappropriateString = v203;
              v205 = i + 3;
              if (i + 3 < objc_msgSend_count(v587, v198, v199, v200, v201, v202) && v160 < v161)
              {
                objc_msgSend_result(v568, v111, v204, v113, v114, v115);
                v206 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(v587, v207, v205, v208, v209, v210);
                v211 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_precedingSeparatorForToken_(v206, v212, (uint64_t)v211, v213, v214, v215);
                v216 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringByAppendingString_(v570, v217, (uint64_t)v216, v218, v219, v220);
                v221 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_objectAtIndexedSubscript_(v587, v222, v205, v223, v224, v225);
                v226 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_string(v226, v227, v228, v229, v230, v231);
                v232 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringByAppendingString_(v221, v233, (uint64_t)v232, v234, v235, v236);
                v570 = (__CFString *)objc_claimAutoreleasedReturnValue();

                LODWORD(v221) = objc_msgSend_isInappropriateString_(self->_ovsStringChecker, v237, (uint64_t)v570, v238, v239, v240);
                v246 = objc_msgSend_count(v587, v241, v242, v243, v244, v245);
                v248 = i + 4;
                v249 = isInappropriateString;
                if ((_DWORD)v221)
                  v249 = 4;
                isInappropriateString = v249;
                if (v248 < v246 && v205 < v161)
                {
                  objc_msgSend_result(v568, v111, v247, v113, v114, v115);
                  v530 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectAtIndexedSubscript_(v587, v531, v248, v532, v533, v534);
                  v535 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_precedingSeparatorForToken_(v530, v536, (uint64_t)v535, v537, v538, v539);
                  v540 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_stringByAppendingString_(v570, v541, (uint64_t)v540, v542, v543, v544);
                  v545 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_objectAtIndexedSubscript_(v587, v546, v248, v547, v548, v549);
                  v550 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_string(v550, v551, v552, v553, v554, v555);
                  v556 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_stringByAppendingString_(v545, v557, (uint64_t)v556, v558, v559, v560);
                  v571 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend_isInappropriateString_(self->_ovsStringChecker, v561, v571, v562, v563, v564);
                  __break(1u);
                }
              }
            }
          }
        }
        if (isInappropriateString)
        {
          for (j = 0; j != isInappropriateString; ++j)
          {
            objc_msgSend_objectAtIndexedSubscript_(v587, v111, i + j, v113, v114, v115);
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v573
              || (objc_msgSend_firstObject(v572, v251, v252, v253, v254, v255),
                  v257 = (void *)objc_claimAutoreleasedReturnValue(),
                  v262 = objc_msgSend_containsObject_(v257, v258, (uint64_t)v256, v259, v260, v261),
                  v257,
                  (v262 & 1) == 0))
            {
              v263 = [CHTokenizedTextResultToken alloc];
              objc_msgSend_string(v256, v264, v265, v266, v267, v268);
              v585 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIndexes(v256, v269, v270, v271, v272, v273);
              v274 = (void *)objc_claimAutoreleasedReturnValue();
              v280 = objc_msgSend_wordID(v256, v275, v276, v277, v278, v279);
              objc_msgSend_modelScore(v256, v281, v282, v283, v284, v285);
              v287 = v286;
              objc_msgSend_recognitionScore(v256, v288, v289, v290, v291, v292);
              v294 = v293;
              objc_msgSend_combinedScore(v256, v295, v296, v297, v298, v299);
              v301 = v300;
              objc_msgSend_alignmentScore(v256, v302, v303, v304, v305, v306);
              v308 = v307;
              v314 = objc_msgSend_properties(v256, v309, v310, v311, v312, v313);
              objc_msgSend_recognizerSourceLocale(v256, v315, v316, v317, v318, v319);
              v320 = (void *)objc_claimAutoreleasedReturnValue();
              v575 = v308;
              v577 = v301;
              v579 = v294;
              obj = v287;
              v326 = objc_msgSend_inputSources(v256, v321, v322, v323, v324, v325);
              v332 = objc_msgSend_substrokeCount(v256, v327, v328, v329, v330, v331);
              objc_msgSend_bounds(v256, v333, v334, v335, v336, v337);
              v339 = v338;
              v341 = v340;
              v343 = v342;
              v345 = v344;
              objc_msgSend_originalBounds(v256, v346, v347, v348, v349, v350);
              v357 = v356;
              v359 = v358;
              v361 = v360;
              v363 = v362;
              if (v256)
                objc_msgSend_principalLines(v256, v351, v352, v353, v354, v355);
              else
                memset(v603, 0, sizeof(v603));
              v364 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v263, v351, (uint64_t)v585, (uint64_t)v274, v280, v314 | 0x10, v320, v326, *(double *)&obj, v579, v577, v575, v339, v341, v343, v345, v332, v357, v359,
                               v361,
                               v363,
                               v603,
                               v565);

              objc_msgSend_setObject_atIndexedSubscript_(v587, v365, (uint64_t)v364, i + j, v366, v367);
              objc_msgSend_setObject_forKeyedSubscript_(v590, v368, (uint64_t)v364, (uint64_t)v256, v369, v370);

            }
          }
        }
        v90 = v570;
      }

    }
    objc_msgSend_addObject_(v572, v80, (uint64_t)v587, v82, v83, v84);

    ++v573;
    objc_msgSend_result(v568, v371, v372, v373, v374, v375);
  }
  if (objc_msgSend_count(v590, v35, v36, v37, v38, v39))
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v376, v377, v378, v379, v380);
    v580 = (void *)objc_claimAutoreleasedReturnValue();
    v601 = 0u;
    v602 = 0u;
    v599 = 0u;
    v600 = 0u;
    objc_msgSend_result(v568, v381, v382, v383, v384, v385);
    v386 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenColumns(v386, v387, v388, v389, v390, v391);
    obja = (id)objc_claimAutoreleasedReturnValue();

    v576 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v392, (uint64_t)&v599, (uint64_t)v609, 16, v393);
    if (v576)
    {
      v578 = *(_QWORD *)v600;
      do
      {
        for (k = 0; k != v576; ++k)
        {
          if (*(_QWORD *)v600 != v578)
            objc_enumerationMutation(obja);
          v394 = *(void **)(*((_QWORD *)&v599 + 1) + 8 * k);
          v395 = [CHMutableTokenizedResultColumn alloc];
          v400 = objc_msgSend_initWithTokenRows_(v395, v396, MEMORY[0x1E0C9AA60], v397, v398, v399);
          v597 = 0u;
          v598 = 0u;
          v595 = 0u;
          v596 = 0u;
          v588 = (void *)v400;
          objc_msgSend_textTokenRows(v394, v401, v402, v403, v404, v405);
          v406 = (void *)objc_claimAutoreleasedReturnValue();
          v586 = v406;
          v414 = objc_msgSend_countByEnumeratingWithState_objects_count_(v406, v407, (uint64_t)&v595, (uint64_t)v608, 16, v408);
          if (v414)
          {
            v415 = *(_QWORD *)v596;
            do
            {
              for (m = 0; m != v414; ++m)
              {
                if (*(_QWORD *)v596 != v415)
                  objc_enumerationMutation(v586);
                v417 = *(void **)(*((_QWORD *)&v595 + 1) + 8 * m);
                objc_msgSend_array(MEMORY[0x1E0C99DE8], v409, v410, v411, v412, v413);
                v418 = (void *)objc_claimAutoreleasedReturnValue();
                v593 = 0u;
                v594 = 0u;
                v591 = 0u;
                v592 = 0u;
                v419 = v417;
                v426 = objc_msgSend_countByEnumeratingWithState_objects_count_(v419, v420, (uint64_t)&v591, (uint64_t)v607, 16, v421);
                if (v426)
                {
                  v427 = *(_QWORD *)v592;
                  do
                  {
                    for (n = 0; n != v426; ++n)
                    {
                      if (*(_QWORD *)v592 != v427)
                        objc_enumerationMutation(v419);
                      v429 = *(_QWORD *)(*((_QWORD *)&v591 + 1) + 8 * n);
                      objc_msgSend_objectForKeyedSubscript_(v590, v422, v429, v423, v424, v425);
                      v434 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v434)
                        objc_msgSend_addObject_(v418, v430, (uint64_t)v434, v431, v432, v433);
                      else
                        objc_msgSend_addObject_(v418, v430, v429, v431, v432, v433);

                    }
                    v426 = objc_msgSend_countByEnumeratingWithState_objects_count_(v419, v422, (uint64_t)&v591, (uint64_t)v607, 16, v425);
                  }
                  while (v426);
                }

                objc_msgSend_addTokenRowWithTokens_(v588, v435, (uint64_t)v418, v436, v437, v438);
              }
              v406 = v586;
              v414 = objc_msgSend_countByEnumeratingWithState_objects_count_(v586, v409, (uint64_t)&v595, (uint64_t)v608, 16, v413);
            }
            while (v414);
          }

          objc_msgSend_addObject_(v580, v439, (uint64_t)v588, v440, v441, v442);
        }
        v576 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v443, (uint64_t)&v599, (uint64_t)v609, 16, v444);
      }
      while (v576);
    }

    objc_msgSend_result(v568, v445, v446, v447, v448, v449);
    v450 = (void *)objc_claimAutoreleasedReturnValue();
    v589 = objc_msgSend_baseWritingDirection(v450, v451, v452, v453, v454, v455);

    v456 = [CHMutableTokenizedTextResult alloc];
    objc_msgSend_result(v568, v457, v458, v459, v460, v461);
    v462 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v462, v463, v464, v465, v466, v467);
    v468 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v568, v469, v470, v471, v472, v473);
    v474 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v474, v475, v476, v477, v478, v479);
    v480 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v568, v481, v482, v483, v484, v485);
    v486 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trailingSeparator(v486, v487, v488, v489, v490, v491);
    v492 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v568, v493, v494, v495, v496, v497);
    v498 = (void *)objc_claimAutoreleasedReturnValue();
    v504 = objc_msgSend_recognizerGenerationIdentifier(v498, v499, v500, v501, v502, v503);
    objc_msgSend_result(v568, v505, v506, v507, v508, v509);
    v510 = (void *)objc_claimAutoreleasedReturnValue();
    v516 = objc_msgSend_changeableTokenColumnCount(v510, v511, v512, v513, v514, v515);
    v518 = (void *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(v456, v517, (uint64_t)v580, (uint64_t)v468, (uint64_t)v480, (uint64_t)v492, v504, v516);
    if (v568)
      objc_storeStrong(v568 + 3, v518);

    objc_msgSend_result(v568, v519, v520, v521, v522, v523);
    v524 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBaseWritingDirection_(v524, v525, v589, v526, v527, v528);

  }
  return v568;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ovsStringChecker, 0);
}

@end
