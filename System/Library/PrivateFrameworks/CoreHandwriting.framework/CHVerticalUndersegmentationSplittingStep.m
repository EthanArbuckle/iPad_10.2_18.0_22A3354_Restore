@implementation CHVerticalUndersegmentationSplittingStep

- (id)process:(id)a3 options:(id)a4
{
  _QWORD *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
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
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _BOOL4 v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t *v127;
  uint64_t i;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  char v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  char v208;
  uint64_t v209;
  uint64_t v210;
  unint64_t v211;
  unint64_t v212;
  char *v213;
  uint64_t *v214;
  uint64_t *v215;
  uint64_t *v216;
  const char *v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t *v225;
  uint64_t *v226;
  uint64_t v227;
  unint64_t v228;
  unint64_t v229;
  uint64_t *v230;
  uint64_t *v231;
  uint64_t *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  int64_t v238;
  unint64_t *v239;
  unint64_t *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  unint64_t m;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  unint64_t n;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  char isEqualToString;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  int v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  CHTokenizedMathResult *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  void *v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  int64_t v344;
  uint64_t *v345;
  uint64_t *v346;
  id v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  unint64_t v357;
  uint64_t *v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  BOOL v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  unint64_t ii;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  void *v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  void *v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  const char *v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  void *v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  void *v419;
  BOOL v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  void *v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  void *v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  CHStrokeGroup *v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  void *v447;
  const char *v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  const char *v453;
  void *StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
  void *v455;
  id v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  const char *v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  void *v471;
  BOOL v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  void *v478;
  const char *v479;
  void *v480;
  CHStrokeGroupRecognitionResult *v481;
  const char *v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  void *v486;
  const char *v487;
  void *v488;
  void *v489;
  id v490;
  void *v491;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  void *v502;
  const char *v503;
  uint64_t v504;
  uint64_t v505;
  void *v506;
  id v507;
  const char *v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  void *v512;
  id v513;
  void *v514;
  const char *v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  const char *v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  void *v525;
  const char *v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t jj;
  void *v533;
  id v534;
  void *v535;
  const char *v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  const char *v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  void *v546;
  const char *v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  const char *v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  id v556;
  const char *v557;
  uint64_t v558;
  uint64_t kk;
  void *v561;
  void *v562;
  uint64_t v563;
  const char *v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  void *v568;
  const char *v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  const char *v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  id v578;
  void *v579;
  unint64_t *__p;
  id v581;
  unint64_t *v582;
  uint64_t v583;
  void *v584;
  id v585;
  uint64_t v587;
  id obj;
  uint64_t v589;
  uint64_t v590;
  id v591;
  uint64_t v592;
  uint64_t *v593;
  uint64_t k;
  void *v595;
  id v596;
  void *v597;
  void *v598;
  void *v599;
  uint64_t v600;
  id v601;
  void *v602;
  void *v603;
  uint64_t v604;
  void *v605;
  id v606;
  unint64_t *j;
  void *v608;
  uint64_t *v609;
  uint64_t *v610;
  __int128 v611;
  __int128 v612;
  __int128 v613;
  __int128 v614;
  __int128 v615;
  __int128 v616;
  __int128 v617;
  __int128 v618;
  _BYTE v619[128];
  _QWORD v620[19];

  v620[16] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v581 = a4;
  v611 = 0u;
  v612 = 0u;
  v613 = 0u;
  v614 = 0u;
  if (v5)
    v11 = (void *)v5[6];
  else
    v11 = 0;
  v596 = v5;
  v12 = (void *)objc_msgSend_copy(v11, v6, v7, v8, v9, v10);
  v591 = v12;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v611, (uint64_t)v619, 16, v14);
  if (v20)
  {
    v592 = *(_QWORD *)v612;
    if (self)
    {
      while (1)
      {
        v587 = 0;
        v583 = v20;
        do
        {
          if (*(_QWORD *)v612 != v592)
            objc_enumerationMutation(v12);
          if (v596)
            v21 = (void *)*((_QWORD *)v596 + 7);
          else
            v21 = 0;
          v22 = *(void **)(*((_QWORD *)&v611 + 1) + 8 * v587);
          v23 = v21;
          v24 = (void *)MEMORY[0x1E0CB37E8];
          v30 = objc_msgSend_uniqueIdentifier(v22, v25, v26, v27, v28, v29);
          objc_msgSend_numberWithInteger_(v24, v31, v30, v32, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v23, v36, (uint64_t)v35, v37, v38, v39);
          v597 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_mathResult(v597, v40, v41, v42, v43, v44);
          v45 = (id)objc_claimAutoreleasedReturnValue();
          v585 = v22;
          if (!v45)
            goto LABEL_48;
          objc_msgSend_strokeIndexes(v45, v46, v47, v48, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend_count(v51, v52, v53, v54, v55, v56);
          objc_msgSend_strokeIdentifiers(v585, v58, v59, v60, v61, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v57) = v57 == objc_msgSend_count(v63, v64, v65, v66, v67, v68);

          if ((v57 & 1) == 0)
          {
LABEL_48:

            goto LABEL_49;
          }
          objc_msgSend_topTranscription(v45, v69, v70, v71, v72, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_componentsSeparatedByString_(v74, v75, (uint64_t)CFSTR("\\\\"), v76, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = objc_msgSend_count(v79, v80, v81, v82, v83, v84);

          objc_msgSend_topTranscription(v45, v86, v87, v88, v89, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_componentsSeparatedByString_(v91, v92, (uint64_t)CFSTR("\\\\ \\hline"), v93, v94, v95);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend_count(v96, v97, v98, v99, v100, v101);

          v104 = v85 > 1 && v85 != v102;
          if (v104)
          {
            objc_msgSend_mathResult(v597, v105, v106, v107, v108, v109);
            v606 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_transcriptionPaths(v606, v110, v111, v112, v113, v114);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_firstObject(v115, v116, v117, v118, v119, v120);
            v603 = (void *)objc_claimAutoreleasedReturnValue();

            v126 = 0;
            v593 = 0;
            v127 = 0;
            v600 = 0;
            for (i = 0; ; ++i)
            {
              if (i >= objc_msgSend_tokenColumnCount(v606, v121, v122, v123, v124, v125))
              {
                v610 = v127;
                v609 = v126;
                if (v600 >= objc_msgSend_tokenColumnCount(v606, v129, v130, v131, v132, v133))
                  goto LABEL_68;
                v224 = objc_msgSend_tokenColumnCount(v606, v219, v220, v221, v222, v223) - v600;
                v225 = v127;
                if (v127 < v593)
                {
                  *v127 = v600;
                  v127[1] = v224;
                  v226 = v127 + 2;
                  goto LABEL_67;
                }
                v227 = ((char *)v127 - (char *)v126) >> 4;
                v228 = v227 + 1;
                if ((unint64_t)(v227 + 1) >> 60)
                  sub_1BE61F930();
                if (v593 - v126 > v228)
                  v228 = v593 - v126;
                if ((unint64_t)((char *)v593 - (char *)v126) >= 0x7FFFFFFFFFFFFFF0)
                  v229 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v229 = v228;
                if (v229)
                {
                  if (v229 >> 60)
                    sub_1BE61F100();
                  v230 = (uint64_t *)((char *)operator new(16 * v229) + 16 * v227);
                  *v230 = v600;
                  v230[1] = v224;
                  if (v127 != v126)
                  {
LABEL_63:
                    v231 = v230;
                    do
                    {
                      v232 = v231 - 2;
                      *((_OWORD *)v231 - 1) = *((_OWORD *)v225 - 1);
                      v225 -= 2;
                      v231 -= 2;
                    }
                    while (v225 != v126);
                    v226 = v230 + 2;
                    v609 = v232;
                    if (v126)
LABEL_66:
                      operator delete(v126);
LABEL_67:
                    v610 = v226;
LABEL_68:

                    objc_msgSend_mathResult(v597, v233, v234, v235, v236, v237);
                    v579 = (void *)objc_claimAutoreleasedReturnValue();
                    v238 = (char *)v610 - (char *)v609;
                    if (v610 == v609)
                    {
                      v582 = 0;
                      __p = 0;
                    }
                    else
                    {
                      if (v238 < 0)
                        sub_1BE61F930();
                      v239 = (unint64_t *)operator new((char *)v610 - (char *)v609);
                      v240 = &v239[2 * (v238 >> 4)];
                      __p = v239;
                      memcpy(v239, v609, v238);
                      v582 = v240;
                    }
                    v601 = v579;
                    objc_msgSend_array(MEMORY[0x1E0C99DE8], v241, v242, v243, v244, v245);
                    v584 = (void *)objc_claimAutoreleasedReturnValue();
                    for (j = __p; j != v582; j += 2)
                    {
                      objc_msgSend_array(MEMORY[0x1E0C99DE8], v246, v247, v248, v249, v250);
                      v251 = (void *)objc_claimAutoreleasedReturnValue();
                      v617 = 0u;
                      v618 = 0u;
                      v615 = 0u;
                      v616 = 0u;
                      objc_msgSend_transcriptionPaths(v601, v252, v253, v254, v255, v256);
                      obj = (id)objc_claimAutoreleasedReturnValue();
                      v590 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v257, (uint64_t)&v615, (uint64_t)v620, 16, v258);
                      if (v590)
                      {
                        v264 = 0;
                        v589 = *(_QWORD *)v616;
                        do
                        {
                          for (k = 0; k != v590; ++k)
                          {
                            if (*(_QWORD *)v616 != v589)
                              objc_enumerationMutation(obj);
                            v604 = *(_QWORD *)(*((_QWORD *)&v615 + 1) + 8 * k);
                            objc_msgSend_array(MEMORY[0x1E0C99DE8], v259, v260, v261, v262, v263);
                            v265 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_addObject_(v251, v266, (uint64_t)v265, v267, v268, v269);

                            for (m = *j; m < j[1] + *j; ++m)
                            {
                              objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v601, v259, v604, m, v262, v263);
                              v276 = (void *)objc_claimAutoreleasedReturnValue();
                              for (n = 0; n < objc_msgSend_count(v276, v271, v272, v273, v274, v275); ++n)
                              {
                                objc_msgSend_objectAtIndexedSubscript_(v276, v278, n, v279, v280, v281);
                                v282 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_string(v282, v283, v284, v285, v286, v287);
                                v288 = (void *)objc_claimAutoreleasedReturnValue();
                                isEqualToString = objc_msgSend_isEqualToString_(v288, v289, (uint64_t)CFSTR("\\\\"), v290, v291, v292);

                                if ((isEqualToString & 1) == 0
                                  || n < objc_msgSend_count(v276, v294, v295, v296, v297, v298) - 1
                                  && (objc_msgSend_objectAtIndexedSubscript_(v276, v299, n + 1, v300, v301, v302),
                                      v303 = (void *)objc_claimAutoreleasedReturnValue(),
                                      objc_msgSend_string(v303, v304, v305, v306, v307, v308),
                                      v309 = (void *)objc_claimAutoreleasedReturnValue(),
                                      v314 = objc_msgSend_isEqualToString_(v309, v310, (uint64_t)CFSTR("\\hline"), v311, v312, v313), v309, v303, v314))
                                {
                                  objc_msgSend_objectAtIndexedSubscript_(v251, v294, v264, v296, v297, v298);
                                  v315 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend_addObject_(v315, v316, (uint64_t)v282, v317, v318, v319);

                                }
                              }

                            }
                            ++v264;
                          }
                          v590 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v259, (uint64_t)&v615, (uint64_t)v620, 16, v263);
                        }
                        while (v590);
                      }

                      v320 = [CHTokenizedMathResult alloc];
                      v325 = (void *)objc_msgSend_initWithBestPathTokens_(v320, v321, (uint64_t)v251, v322, v323, v324);
                      objc_msgSend_addObject_(v584, v326, (uint64_t)v325, v327, v328, v329);

                    }
                    if (__p)
                      operator delete(__p);

                    objc_msgSend_mathResult(v597, v330, v331, v332, v333, v334);
                    v335 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_updateStrokeIndexOffsetForSubResults_fromResult_(CHTokenizedMathResult, v336, (uint64_t)v584, (uint64_t)v335, v337, v338);
                    v602 = (void *)objc_claimAutoreleasedReturnValue();

                    v344 = (char *)v610 - (char *)v609;
                    if (v610 == v609)
                    {
                      v346 = 0;
                      v345 = 0;
                    }
                    else
                    {
                      if (v344 < 0)
                        sub_1BE61F930();
                      v345 = (uint64_t *)operator new((char *)v610 - (char *)v609);
                      v346 = &v345[2 * (v344 >> 4)];
                      memcpy(v345, v609, v344);
                    }
                    objc_msgSend_mathResult(v597, v339, v340, v341, v342, v343);
                    v347 = (id)objc_claimAutoreleasedReturnValue();
                    *(_QWORD *)&v615 = 0;
                    *((_QWORD *)&v615 + 1) = &v615;
                    *(_QWORD *)&v616 = 0x2020000000;
                    BYTE8(v616) = 1;
                    v620[0] = MEMORY[0x1E0C809B0];
                    v620[1] = 3221225472;
                    v620[2] = sub_1BE80AC60;
                    v620[3] = &unk_1E77F1FD0;
                    v620[4] = &v615;
                    objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v347, v348, (uint64_t)v620, v349, v350, v351);
                    if (*(_BYTE *)(*((_QWORD *)&v615 + 1) + 24))
                    {
                      v355 = (char *)v346 - (char *)v345;
                      if (v346 != v345)
                      {
                        v356 = 0;
                        v357 = v355 >> 4;
                        v358 = v345 + 1;
                        while (1)
                        {
                          objc_msgSend_strokeIndexesForColumnsInRange_(v347, v352, *(v358 - 1), *v358, v353, v354);
                          v359 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!objc_msgSend_count(v359, v360, v361, v362, v363, v364))
                            break;

                          v358 += 2;
                          if (++v356 >= v357)
                            goto LABEL_107;
                        }
                        *(_BYTE *)(*((_QWORD *)&v615 + 1) + 24) = 0;

                      }
LABEL_107:
                      v365 = *(_BYTE *)(*((_QWORD *)&v615 + 1) + 24) != 0;
                    }
                    else
                    {
                      v365 = 0;
                    }
                    _Block_object_dispose(&v615, 8);

                    if (v345)
                      operator delete(v345);
                    if (v365)
                    {
                      objc_msgSend_inputStrokeIdentifiers(v597, v366, v367, v368, v369, v370);
                      v595 = (void *)objc_claimAutoreleasedReturnValue();
                      for (ii = 0; ii < objc_msgSend_count(v584, v371, v372, v373, v374, v375); ++ii)
                      {
                        objc_msgSend_objectAtIndexedSubscript_(v584, v377, ii, v378, v379, v380);
                        v381 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_strokeIndexes(v381, v382, v383, v384, v385, v386);
                        v605 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_objectsAtIndexes_(v595, v387, (uint64_t)v605, v388, v389, v390);
                        v391 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_firstObject(v391, v392, v393, v394, v395, v396);
                        v397 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_lastObject(v391, v398, v399, v400, v401, v402);
                        v608 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_bounds(v381, v403, v404, v405, v406, v407);
                        objc_msgSend_groupingManager(self, v408, v409, v410, v411, v412);
                        v413 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_strokeProvider(v413, v414, v415, v416, v417, v418);
                        v419 = (void *)objc_claimAutoreleasedReturnValue();
                        v420 = v419 == 0;

                        if (!v420)
                        {
                          objc_msgSend_groupingManager(self, v421, v422, v423, v424, v425);
                          v426 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_strokeProvider(v426, v427, v428, v429, v430, v431);
                          v432 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v433, (uint64_t)v397, (uint64_t)v432, v434, v435);
                          v436 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_bounds(v436, v437, v438, v439, v440, v441);

                        }
                        v442 = [CHStrokeGroup alloc];
                        objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v443, (uint64_t)v391, v444, v445, v446);
                        v447 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_bounds(v381, v448, v449, v450, v451, v452);
                        StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (void *)objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v442, v453, (uint64_t)v447, (uint64_t)v397, (uint64_t)v608, 3, CFSTR("CHGroupingPostProcessingManager"));

                        if (v596)
                          v455 = (void *)*((_QWORD *)v596 + 6);
                        else
                          v455 = 0;
                        v456 = v455;
                        objc_msgSend_addObject_(v456, v457, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v458, v459, v460);

                        if (!objc_msgSend_saveInputDrawings(self, v461, v462, v463, v464, v465)
                          || (objc_msgSend_groupingManager(self, v466, v467, v468, v469, v470),
                              v471 = (void *)objc_claimAutoreleasedReturnValue(),
                              v472 = v471 == 0,
                              v471,
                              v472))
                        {
                          v480 = 0;
                        }
                        else
                        {
                          objc_msgSend_groupingManager(self, v473, v474, v475, v476, v477);
                          v478 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_recognizableDrawingForStrokeGroup_translationVector_originalDrawing_orderedStrokesIDs_rescalingFactor_replacementStrokeGroup_(v478, v479, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, 0, 0, 0, 0, 0.0, 0.0);
                          v480 = (void *)objc_claimAutoreleasedReturnValue();

                        }
                        v481 = [CHStrokeGroupRecognitionResult alloc];
                        objc_msgSend_objectAtIndexedSubscript_(v602, v482, ii, v483, v484, v485);
                        v486 = (void *)objc_claimAutoreleasedReturnValue();
                        v488 = (void *)objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_inputDrawing_inputDrawingCutPoints_(v481, v487, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], v486, v391, v480, 0);

                        if (v596)
                          v489 = (void *)*((_QWORD *)v596 + 7);
                        else
                          v489 = 0;
                        v490 = v489;
                        v491 = (void *)MEMORY[0x1E0CB37E8];
                        v497 = objc_msgSend_uniqueIdentifier(StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v492, v493, v494, v495, v496);
                        objc_msgSend_numberWithInteger_(v491, v498, v497, v499, v500, v501);
                        v502 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_setObject_forKey_(v490, v503, (uint64_t)v488, (uint64_t)v502, v504, v505);

                      }
                      if (v596)
                        v506 = (void *)*((_QWORD *)v596 + 6);
                      else
                        v506 = 0;
                      v507 = v506;
                      objc_msgSend_removeObject_(v507, v508, (uint64_t)v585, v509, v510, v511);

                      if (v596)
                        v512 = (void *)*((_QWORD *)v596 + 7);
                      else
                        v512 = 0;
                      v513 = v512;
                      v514 = (void *)MEMORY[0x1E0CB37E8];
                      v520 = objc_msgSend_uniqueIdentifier(v585, v515, v516, v517, v518, v519);
                      objc_msgSend_numberWithInteger_(v514, v521, v520, v522, v523, v524);
                      v525 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_removeObjectForKey_(v513, v526, (uint64_t)v525, v527, v528, v529);

                    }
                    if (v609)
                      operator delete(v609);
                    break;
                  }
                }
                else
                {
                  v230 = (uint64_t *)(16 * v227);
                  *v230 = v600;
                  v230[1] = v224;
                  if (v127 != v126)
                    goto LABEL_63;
                }
                v226 = v230 + 2;
                v609 = v230;
                if (v126)
                  goto LABEL_66;
                goto LABEL_67;
              }
              objc_msgSend_tokenRowsAtColumnIndex_(v606, v129, i, v131, v132, v133);
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              v139 = objc_msgSend_indexAtPosition_(v603, v135, i, v136, v137, v138);
              objc_msgSend_objectAtIndexedSubscript_(v134, v140, v139, v141, v142, v143);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v144, v145, 0, v146, v147, v148);
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_string(v149, v150, v151, v152, v153, v154);
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              v160 = objc_msgSend_isEqualToString_(v155, v156, (uint64_t)CFSTR("\\\\"), v157, v158, v159);

              if (v160)
              {
                if ((unint64_t)objc_msgSend_count(v144, v161, v162, v163, v164, v165) < 2)
                {
                  if (i >= objc_msgSend_tokenColumnCount(v606, v166, v167, v168, v169, v170) - 1)
                    goto LABEL_27;
                  v187 = objc_msgSend_indexAtPosition_(v603, v183, i + 1, v184, v185, v186);
                  objc_msgSend_objectAtIndexedSubscript_(v134, v188, v187, v189, v190, v191);
                  v192 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectAtIndexedSubscript_(v192, v193, 0, v194, v195, v196);
                  v197 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_string(v197, v198, v199, v200, v201, v202);
                  v203 = (void *)objc_claimAutoreleasedReturnValue();
                  v208 = objc_msgSend_isEqualToString_(v203, v204, (uint64_t)CFSTR("\\hline"), v205, v206, v207);

                  if ((v208 & 1) == 0)
                  {
LABEL_27:
                    v209 = i - v600;
                    if (v127 < v593)
                    {
                      *v127 = v600;
                      v127[1] = v209;
                      v127 += 2;
LABEL_43:
                      v600 = i;
                      goto LABEL_44;
                    }
                    v210 = ((char *)v127 - (char *)v126) >> 4;
                    v211 = v210 + 1;
                    if ((unint64_t)(v210 + 1) >> 60)
                      sub_1BE61F930();
                    if (v593 - v126 > v211)
                      v211 = v593 - v126;
                    if ((unint64_t)((char *)v593 - (char *)v126) >= 0x7FFFFFFFFFFFFFF0)
                      v212 = 0xFFFFFFFFFFFFFFFLL;
                    else
                      v212 = v211;
                    if (v212)
                    {
                      if (v212 >> 60)
                        sub_1BE61F100();
                      v213 = (char *)operator new(16 * v212);
                      v214 = (uint64_t *)&v213[16 * v210];
                      *v214 = v600;
                      v214[1] = v209;
                      if (v127 != v126)
                      {
LABEL_38:
                        v215 = v214;
                        do
                        {
                          v216 = v215 - 2;
                          *((_OWORD *)v215 - 1) = *((_OWORD *)v127 - 1);
                          v127 -= 2;
                          v215 -= 2;
                        }
                        while (v127 != v126);
                        v593 = (uint64_t *)&v213[16 * v212];
                        v127 = v214 + 2;
                        if (v126)
LABEL_41:
                          operator delete(v126);
LABEL_42:
                        v126 = v216;
                        goto LABEL_43;
                      }
                    }
                    else
                    {
                      v213 = 0;
                      v214 = (uint64_t *)(16 * v210);
                      *v214 = v600;
                      v214[1] = v209;
                      if (v127 != v126)
                        goto LABEL_38;
                    }
                    v216 = v214;
                    v593 = (uint64_t *)&v213[16 * v212];
                    v127 = v214 + 2;
                    if (v126)
                      goto LABEL_41;
                    goto LABEL_42;
                  }
                }
                else
                {
                  objc_msgSend_objectAtIndexedSubscript_(v144, v166, 1, v168, v169, v170);
                  v171 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_string(v171, v172, v173, v174, v175, v176);
                  v177 = (void *)objc_claimAutoreleasedReturnValue();
                  v182 = objc_msgSend_isEqualToString_(v177, v178, (uint64_t)CFSTR("\\hline"), v179, v180, v181);

                  if ((v182 & 1) == 0)
                    goto LABEL_27;
                }
              }
LABEL_44:

            }
          }
LABEL_49:

          ++v587;
          v12 = v591;
        }
        while (v587 != v583);
        v530 = objc_msgSend_countByEnumeratingWithState_objects_count_(v591, v217, (uint64_t)&v611, (uint64_t)v619, 16, v218);
        v20 = v530;
        if (!v530)
          goto LABEL_144;
      }
    }
    if (v596)
    {
      do
      {
        v531 = v20;
        for (jj = 0; jj != v531; ++jj)
        {
          if (*(_QWORD *)v612 != v592)
            objc_enumerationMutation(v591);
          v533 = *(void **)(*((_QWORD *)&v611 + 1) + 8 * jj);
          v534 = *((id *)v596 + 7);
          v535 = (void *)MEMORY[0x1E0CB37E8];
          v541 = objc_msgSend_uniqueIdentifier(v533, v536, v537, v538, v539, v540);
          objc_msgSend_numberWithInteger_(v535, v542, v541, v543, v544, v545);
          v546 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v534, v547, (uint64_t)v546, v548, v549, v550);
          v598 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_mathResult(v598, v551, v552, v553, v554, v555);
          v556 = (id)objc_claimAutoreleasedReturnValue();

        }
        v12 = v591;
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v591, v557, (uint64_t)&v611, (uint64_t)v619, 16, v558);
      }
      while (v20);
    }
    else
    {
      do
      {
        for (kk = 0; kk != v20; ++kk)
        {
          if (*(_QWORD *)v612 != v592)
            objc_enumerationMutation(v591);
          v561 = *(void **)(*((_QWORD *)&v611 + 1) + 8 * kk);
          v562 = (void *)MEMORY[0x1E0CB37E8];
          v563 = objc_msgSend_uniqueIdentifier(v561, v15, v16, v17, v18, v19);
          objc_msgSend_numberWithInteger_(v562, v564, v563, v565, v566, v567);
          v568 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(0, v569, (uint64_t)v568, v570, v571, v572);
          v599 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_mathResult(v599, v573, v574, v575, v576, v577);
          v578 = (id)objc_claimAutoreleasedReturnValue();

        }
        v12 = v591;
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v591, v15, (uint64_t)&v611, (uint64_t)v619, 16, v19);
      }
      while (v20);
    }
  }
LABEL_144:

  return v596;
}

@end
