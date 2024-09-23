@implementation CHHorizontalUndersegmentationSplittingStep

- (id)process:(id)a3 options:(id)a4
{
  _QWORD *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
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
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
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
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  char *v114;
  char *v115;
  unint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  float Height;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
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
  int isEqualToString;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  unint64_t v152;
  _BYTE *v153;
  unint64_t *v154;
  int64_t v155;
  unint64_t v156;
  char *v157;
  unint64_t v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  _OWORD *v162;
  char *v163;
  uint64_t v164;
  __int128 v165;
  uint64_t v166;
  void *v167;
  uint64_t *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  float v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  float v182;
  double MaxX;
  CGFloat MinX;
  float v185;
  float v186;
  uint64_t v187;
  char *v188;
  uint64_t *v189;
  char *v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  unint64_t v194;
  char *v195;
  uint64_t *v196;
  int64_t v197;
  unint64_t v198;
  uint64_t v199;
  uint64_t v200;
  char *v201;
  char *v202;
  char *v203;
  uint64_t v204;
  __int128 v205;
  uint64_t v206;
  uint64_t v207;
  char *v208;
  uint64_t v209;
  uint64_t *v210;
  char *v211;
  uint64_t v212;
  unint64_t v213;
  uint64_t v214;
  unint64_t v215;
  char *v216;
  uint64_t *v217;
  int64_t v218;
  unint64_t v219;
  uint64_t v220;
  uint64_t v221;
  char *v222;
  char *v223;
  char *v224;
  uint64_t v225;
  __int128 v226;
  uint64_t v227;
  uint64_t *v228;
  NSObject *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
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
  void *v246;
  uint64_t i;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  CHTokenizedMathResult *v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  id v276;
  const char *v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t j;
  void *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  BOOL v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  unint64_t k;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  void *v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  BOOL v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  void *v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  void *v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  CHStrokeGroup *v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  void *v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  const char *v381;
  void *StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
  void *v383;
  id v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  void *v399;
  BOOL v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  void *v406;
  const char *v407;
  void *v408;
  CHStrokeGroupRecognitionResult *v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  void *v414;
  const char *v415;
  void *v416;
  void *v417;
  id v418;
  void *v419;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  const char *v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  void *v430;
  const char *v431;
  uint64_t v432;
  uint64_t v433;
  void *v434;
  id v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  void *v440;
  id v441;
  void *v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  const char *v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  void *v453;
  const char *v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v460;
  uint64_t m;
  void *v462;
  id v463;
  void *v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  const char *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  void *v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  const char *v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  id v485;
  const char *v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t n;
  void *v490;
  void *v491;
  uint64_t v492;
  const char *v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  void *v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  const char *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  id v507;
  id v508;
  void *v509;
  id obj;
  void *v511;
  uint64_t v512;
  uint64_t v513;
  void *v514;
  id v515;
  void *v516;
  id v518;
  uint64_t v519;
  void *v520;
  void *v521;
  void *v522;
  id v523;
  id v524;
  id v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  uint64_t *v530;
  char *v531;
  char *v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  uint8_t v537[128];
  uint8_t buf[16];
  char *v539;
  char *v540;
  uint64_t v541;
  uint64_t v542;
  CGRect v543;

  v542 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v508 = a4;
  v526 = 0u;
  v527 = 0u;
  v528 = 0u;
  v529 = 0u;
  if (v5)
    v11 = (void *)v5[6];
  else
    v11 = 0;
  v523 = v5;
  obj = (id)objc_msgSend_copy(v11, v6, v7, v8, v9, v10);
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v526, (uint64_t)v537, 16, v13);
  v20 = v14;
  if (v14)
  {
    v512 = *(_QWORD *)v527;
    if (self)
    {
      while (1)
      {
        v519 = 0;
        v513 = v20;
        do
        {
          if (*(_QWORD *)v527 != v512)
            objc_enumerationMutation(obj);
          if (v5)
            v21 = (void *)v5[7];
          else
            v21 = 0;
          v22 = *(void **)(*((_QWORD *)&v526 + 1) + 8 * v519);
          v23 = v21;
          v24 = (void *)MEMORY[0x1E0CB37E8];
          v30 = objc_msgSend_uniqueIdentifier(v22, v25, v26, v27, v28, v29);
          objc_msgSend_numberWithInteger_(v24, v31, v30, v32, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v23, v36, (uint64_t)v35, v37, v38, v39);
          v520 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_mathResult(v520, v40, v41, v42, v43, v44);
          v45 = (id)objc_claimAutoreleasedReturnValue();
          v518 = v22;
          objc_msgSend_topTranscription(v45, v46, v47, v48, v49, v50);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v45)
            goto LABEL_13;
          objc_msgSend_strokeIndexes(v45, v51, v52, v53, v54, v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend_count(v57, v58, v59, v60, v61, v62);
          objc_msgSend_strokeIdentifiers(v518, v64, v65, v66, v67, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v63) = v63 == objc_msgSend_count(v69, v70, v71, v72, v73, v74);

          if ((v63 & 1) == 0
            || (objc_msgSend_containsString_(v56, v75, (uint64_t)CFSTR("\\hline"), v76, v77, v78) & 1) != 0)
          {
LABEL_13:

            v524 = v45;
            goto LABEL_14;
          }
          objc_msgSend_componentsSeparatedByString_(v56, v79, (uint64_t)CFSTR("="), v80, v81, v82);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = (unint64_t)objc_msgSend_count(v85, v86, v87, v88, v89, v90) > 2;

          if (v91)
          {
            objc_msgSend_mathResult(v520, v92, v93, v94, v95, v96);
            v97 = (id)objc_claimAutoreleasedReturnValue();
            v539 = 0;
            v540 = 0;
            v541 = 0;
            v515 = v97;
            objc_msgSend_syntaxAllowedSplitsForResult_outSubResultBounds_(CHMathUtilities, v98, (uint64_t)v97, (uint64_t)&v539, v99, v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = objc_msgSend_count(v101, v102, v103, v104, v105, v106);
            if (v107 != (v540 - v539) >> 5)
            {
              v509 = 0;
              goto LABEL_128;
            }
            objc_msgSend_bounds(v515, v108, v109, v110, v111, v112);
            v113 = 0;
            v114 = 0;
            v115 = 0;
            v116 = 0;
            Height = CGRectGetHeight(v543);
            v533 = 0uLL;
            *(_QWORD *)&v534 = 0;
            v525 = v101;
            while (2)
            {
              if (v116 < objc_msgSend_count(v101, v117, v118, v119, v120, v121))
              {
                objc_msgSend_objectAtIndexedSubscript_(v101, v123, v116, v124, v125, v126);
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend_count(v127, v128, v129, v130, v131, v132) == 1)
                {
                  objc_msgSend_objectAtIndexedSubscript_(v127, v133, 0, v134, v135, v136);
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_string(v137, v138, v139, v140, v141, v142);
                  v143 = (void *)objc_claimAutoreleasedReturnValue();
                  isEqualToString = objc_msgSend_isEqualToString_(v143, v144, (uint64_t)CFSTR("="), v145, v146, v147);

                  v101 = v525;
                  if (isEqualToString)
                  {
                    if (v115 < v113)
                    {
                      *(_QWORD *)v115 = v116;
                      v149 = (uint64_t)(v115 + 8);
                      goto LABEL_41;
                    }
                    v150 = (v115 - v114) >> 3;
                    v151 = v150 + 1;
                    if ((unint64_t)(v150 + 1) >> 61)
                      sub_1BE61F930();
                    if ((v113 - v114) >> 2 > v151)
                      v151 = (v113 - v114) >> 2;
                    if ((unint64_t)(v113 - v114) >= 0x7FFFFFFFFFFFFFF8)
                      v152 = 0x1FFFFFFFFFFFFFFFLL;
                    else
                      v152 = v151;
                    if (v152)
                    {
                      if (v152 >> 61)
                        sub_1BE61F100();
                      v153 = operator new(8 * v152);
                      v154 = (unint64_t *)&v153[8 * v150];
                      *v154 = v116;
                      v149 = (uint64_t)(v154 + 1);
                      v155 = v115 - v114;
                      if (v115 != v114)
                      {
LABEL_35:
                        v156 = v155 - 8;
                        if (v156 < 0x168
                          || (v159 = (v115 - 8 - v114) & 0xFFFFFFFFFFFFFFF8,
                              &v153[v115 - v114 - 8 - v159] > &v153[v115 - v114 - 8])
                          || &v115[-v159 - 8] > v115 - 8
                          || (unint64_t)(v114 - v153) < 0x20)
                        {
                          v157 = v115;
                          v101 = v525;
                        }
                        else
                        {
                          v160 = (v156 >> 3) + 1;
                          v161 = 8 * (v160 & 0x3FFFFFFFFFFFFFFCLL);
                          v157 = &v115[-v161];
                          v154 = (unint64_t *)((char *)v154 - v161);
                          v162 = &v153[8 * v150 - 16];
                          v163 = v115 - 16;
                          v164 = v160 & 0x3FFFFFFFFFFFFFFCLL;
                          do
                          {
                            v165 = *(_OWORD *)v163;
                            *(v162 - 1) = *((_OWORD *)v163 - 1);
                            *v162 = v165;
                            v162 -= 2;
                            v163 -= 32;
                            v164 -= 4;
                          }
                          while (v164);
                          v101 = v525;
                          if (v160 == (v160 & 0x3FFFFFFFFFFFFFFCLL))
                          {
LABEL_38:
                            v113 = &v153[8 * v152];
                            *(_QWORD *)&v533 = v154;
                            *(_QWORD *)&v534 = v113;
                            if (v114)
                              goto LABEL_39;
                            goto LABEL_40;
                          }
                        }
                        do
                        {
                          v158 = *((_QWORD *)v157 - 1);
                          v157 -= 8;
                          *--v154 = v158;
                        }
                        while (v157 != v114);
                        goto LABEL_38;
                      }
                    }
                    else
                    {
                      v153 = 0;
                      v154 = (unint64_t *)(8 * v150);
                      *(_QWORD *)(8 * v150) = v116;
                      v149 = 8 * v150 + 8;
                      v155 = v115 - v114;
                      if (v115 != v114)
                        goto LABEL_35;
                    }
                    v101 = v525;
                    v113 = &v153[8 * v152];
                    *(_QWORD *)&v533 = v154;
                    *(_QWORD *)&v534 = v113;
                    if (v114)
LABEL_39:
                      operator delete(v114);
LABEL_40:
                    v114 = (char *)v154;
LABEL_41:
                    *((_QWORD *)&v533 + 1) = v149;
                    v115 = (char *)v149;
                  }
                }
                else
                {
                  v101 = v525;
                }

                ++v116;
                continue;
              }
              break;
            }
            v166 = v115 - v114;
            if ((unint64_t)(v115 - v114) < 0x10)
            {
              v167 = 0;
              goto LABEL_125;
            }
            v168 = (uint64_t *)operator new(8uLL);
            v174 = 0;
            *v168 = -1;
            v531 = (char *)(v168 + 1);
            v532 = (char *)(v168 + 1);
            v530 = v168;
            v175 = Height * 0.5;
            if ((unint64_t)((v166 >> 3) - 1) <= 1)
              v176 = 1;
            else
              v176 = (v166 >> 3) - 1;
            while (2)
            {
              v178 = *(_QWORD *)&v114[8 * v174++];
              v179 = *(_QWORD *)&v114[8 * v174];
              if (v178 >= v179)
                goto LABEL_61;
              v180 = 32 * v178 + 56;
              v181 = 0x7FFFFFFFFFFFFFFFLL;
              v182 = -INFINITY;
              do
              {
                MaxX = CGRectGetMaxX(*(CGRect *)&v539[v180 - 56]);
                MinX = CGRectGetMinX(*(CGRect *)&v539[v180 - 24]);
                v185 = MaxX;
                *(float *)&MinX = MinX;
                v186 = *(float *)&MinX - v185;
                if (v186 > v182)
                  v181 = v178;
                v187 = v178 + 1;
                if (v186 > v182)
                  v182 = v186;
                v180 += 32;
                ++v178;
              }
              while (v179 != v187);
              if (v182 <= v175)
                goto LABEL_61;
              v188 = v531;
              if (v531 < v532)
              {
                *(_QWORD *)v531 = v181;
                v177 = (uint64_t)(v188 + 8);
                goto LABEL_60;
              }
              v189 = v530;
              v190 = (char *)(v531 - (char *)v530);
              v191 = (v531 - (char *)v530) >> 3;
              v192 = v191 + 1;
              if ((unint64_t)(v191 + 1) >> 61)
                sub_1BE61F930();
              v193 = v532 - (char *)v530;
              if ((v532 - (char *)v530) >> 2 > v192)
                v192 = v193 >> 2;
              if ((unint64_t)v193 >= 0x7FFFFFFFFFFFFFF8)
                v194 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v194 = v192;
              if (v194)
              {
                if (v194 >> 61)
                  sub_1BE61F100();
                v195 = (char *)operator new(8 * v194);
                v196 = (uint64_t *)&v195[8 * v191];
                *v196 = v181;
                v177 = (uint64_t)(v196 + 1);
                v197 = v188 - (char *)v189;
                if (v188 == (char *)v189)
                {
LABEL_88:
                  v530 = v196;
                  v531 = (char *)v177;
                  v532 = &v195[8 * v194];
                  if (v189)
                    operator delete(v189);
                  v101 = v525;
LABEL_60:
                  v531 = (char *)v177;
LABEL_61:
                  if (v174 == v176)
                  {
                    v207 = objc_msgSend_count(v101, v169, v170, v171, v172, v173) - 1;
                    v208 = v531;
                    if (v531 < v532)
                    {
                      *(_QWORD *)v531 = v207;
                      v209 = (uint64_t)(v208 + 8);
                      goto LABEL_112;
                    }
                    v210 = v530;
                    v211 = (char *)(v531 - (char *)v530);
                    v212 = (v531 - (char *)v530) >> 3;
                    v213 = v212 + 1;
                    if ((unint64_t)(v212 + 1) >> 61)
                      sub_1BE61F930();
                    v214 = v532 - (char *)v530;
                    if ((v532 - (char *)v530) >> 2 > v213)
                      v213 = v214 >> 2;
                    if ((unint64_t)v214 >= 0x7FFFFFFFFFFFFFF8)
                      v215 = 0x1FFFFFFFFFFFFFFFLL;
                    else
                      v215 = v213;
                    if (v215)
                    {
                      if (v215 >> 61)
                        sub_1BE61F100();
                      v216 = (char *)operator new(8 * v215);
                      v217 = (uint64_t *)&v216[8 * v212];
                      *v217 = v207;
                      v209 = (uint64_t)(v217 + 1);
                      v218 = v208 - (char *)v210;
                      if (v208 == (char *)v210)
                        goto LABEL_110;
LABEL_104:
                      v219 = v218 - 8;
                      if (v219 < 0x58)
                        goto LABEL_187;
                      if ((unint64_t)(v208 - v216 - (_QWORD)v211) < 0x20)
                        goto LABEL_187;
                      v220 = (v219 >> 3) + 1;
                      v221 = 8 * (v220 & 0x3FFFFFFFFFFFFFFCLL);
                      v222 = &v208[-v221];
                      v217 = (uint64_t *)((char *)v217 - v221);
                      v223 = &v216[8 * v212 - 16];
                      v224 = v208 - 16;
                      v225 = v220 & 0x3FFFFFFFFFFFFFFCLL;
                      do
                      {
                        v226 = *(_OWORD *)v224;
                        *((_OWORD *)v223 - 1) = *((_OWORD *)v224 - 1);
                        *(_OWORD *)v223 = v226;
                        v223 -= 32;
                        v224 -= 32;
                        v225 -= 4;
                      }
                      while (v225);
                      v208 = v222;
                      if (v220 != (v220 & 0x3FFFFFFFFFFFFFFCLL))
                      {
LABEL_187:
                        do
                        {
                          v227 = *((_QWORD *)v208 - 1);
                          v208 -= 8;
                          *--v217 = v227;
                        }
                        while (v208 != (char *)v210);
                      }
                    }
                    else
                    {
                      v216 = 0;
                      v217 = (uint64_t *)(8 * v212);
                      *(_QWORD *)(8 * v212) = v207;
                      v209 = 8 * v212 + 8;
                      v218 = v208 - (char *)v210;
                      if (v208 != (char *)v210)
                        goto LABEL_104;
                    }
LABEL_110:
                    v530 = v217;
                    v531 = (char *)v209;
                    v532 = &v216[8 * v215];
                    if (v210)
                      operator delete(v210);
LABEL_112:
                    v531 = (char *)v209;
                    v228 = v530;
                    if (v209 - (_QWORD)v530 == 16)
                    {
                      v167 = 0;
                    }
                    else
                    {
                      if (qword_1EF568E88 != -1)
                        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                      v229 = (id)qword_1EF568E30;
                      if (os_log_type_enabled(v229, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1BE607000, v229, OS_LOG_TYPE_DEBUG, "CHHorizontalUndersegmentationSplittingStep found a viable split", buf, 2u);
                      }

                      objc_msgSend_array(MEMORY[0x1E0C99DE8], v230, v231, v232, v233, v234);
                      v167 = (void *)objc_claimAutoreleasedReturnValue();
                      v228 = v530;
                      if (v531 - (char *)v530 != 8)
                      {
                        v240 = 0;
                        v241 = v167;
                        do
                        {
                          objc_msgSend_array(MEMORY[0x1E0C99DE8], v235, v236, v237, v238, v239);
                          v246 = (void *)objc_claimAutoreleasedReturnValue();
                          for (i = v530[v240++]; i < v530[v240]; v167 = v241)
                          {
                            objc_msgSend_objectAtIndexedSubscript_(v101, v242, ++i, v243, v244, v245);
                            v248 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_addObjectsFromArray_(v246, v249, (uint64_t)v248, v250, v251, v252);

                          }
                          v253 = [CHTokenizedMathResult alloc];
                          *(_QWORD *)buf = v246;
                          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v254, (uint64_t)buf, 1, v255, v256);
                          v257 = (void *)objc_claimAutoreleasedReturnValue();
                          v262 = (void *)objc_msgSend_initWithBestPathTokens_(v253, v258, (uint64_t)v257, v259, v260, v261);
                          objc_msgSend_addObject_(v167, v263, (uint64_t)v262, v264, v265, v266);

                          v228 = v530;
                          v167 = v241;
                        }
                        while (v240 < ((v531 - (char *)v530) >> 3) - 1);
                      }
                    }
                    if (v228)
                    {
                      v531 = (char *)v228;
                      operator delete(v228);
                    }
LABEL_125:
                    if (v114)
                    {
                      *((_QWORD *)&v533 + 1) = v114;
                      operator delete(v114);
                    }
                    v509 = v167;
LABEL_128:

                    if (v539)
                    {
                      v540 = v539;
                      operator delete(v539);
                    }

                    objc_msgSend_mathResult(v520, v267, v268, v269, v270, v271);
                    v272 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_updateStrokeIndexOffsetForSubResults_fromResult_(CHTokenizedMathResult, v273, (uint64_t)v509, (uint64_t)v272, v274, v275);
                    v45 = (id)objc_claimAutoreleasedReturnValue();

                    if (v509)
                    {
                      v276 = v509;
                      v533 = 0u;
                      v534 = 0u;
                      v535 = 0u;
                      v536 = 0u;
                      v524 = v276;
                      v284 = objc_msgSend_countByEnumeratingWithState_objects_count_(v524, v277, (uint64_t)&v533, (uint64_t)&v539, 16, v278);
                      if (v284)
                      {
                        v285 = *(_QWORD *)v534;
                        while (2)
                        {
                          for (j = 0; j != v284; ++j)
                          {
                            if (*(_QWORD *)v534 != v285)
                              objc_enumerationMutation(v524);
                            objc_msgSend_strokeIndexes(*(void **)(*((_QWORD *)&v533 + 1) + 8 * j), v279, v280, v281, v282, v283);
                            v287 = (void *)objc_claimAutoreleasedReturnValue();
                            v293 = objc_msgSend_count(v287, v288, v289, v290, v291, v292) == 0;

                            if (v293)
                            {

                              goto LABEL_14;
                            }
                          }
                          v284 = objc_msgSend_countByEnumeratingWithState_objects_count_(v524, v279, (uint64_t)&v533, (uint64_t)&v539, 16, v283);
                          if (v284)
                            continue;
                          break;
                        }
                      }

                      objc_msgSend_inputStrokeIdentifiers(v520, v294, v295, v296, v297, v298);
                      v511 = (void *)objc_claimAutoreleasedReturnValue();
                      for (k = 0; k < objc_msgSend_count(v524, v299, v300, v301, v302, v303); ++k)
                      {
                        objc_msgSend_objectAtIndexedSubscript_(v524, v305, k, v306, v307, v308);
                        v309 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_strokeIndexes(v309, v310, v311, v312, v313, v314);
                        v514 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_objectsAtIndexes_(v511, v315, (uint64_t)v514, v316, v317, v318);
                        v319 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_firstObject(v319, v320, v321, v322, v323, v324);
                        v325 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_lastObject(v319, v326, v327, v328, v329, v330);
                        v516 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_bounds(v309, v331, v332, v333, v334, v335);
                        objc_msgSend_groupingManager(self, v336, v337, v338, v339, v340);
                        v341 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_strokeProvider(v341, v342, v343, v344, v345, v346);
                        v347 = (void *)objc_claimAutoreleasedReturnValue();
                        v348 = v347 == 0;

                        if (!v348)
                        {
                          objc_msgSend_groupingManager(self, v349, v350, v351, v352, v353);
                          v354 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_strokeProvider(v354, v355, v356, v357, v358, v359);
                          v360 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v361, (uint64_t)v325, (uint64_t)v360, v362, v363);
                          v364 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_bounds(v364, v365, v366, v367, v368, v369);

                        }
                        v370 = [CHStrokeGroup alloc];
                        objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v371, (uint64_t)v319, v372, v373, v374);
                        v375 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_bounds(v309, v376, v377, v378, v379, v380);
                        StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (void *)objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v370, v381, (uint64_t)v375, (uint64_t)v325, (uint64_t)v516, 3, CFSTR("CHGroupingPostProcessingManager"));

                        if (v523)
                          v383 = (void *)*((_QWORD *)v523 + 6);
                        else
                          v383 = 0;
                        v384 = v383;
                        objc_msgSend_addObject_(v384, v385, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v386, v387, v388);

                        if (!objc_msgSend_saveInputDrawings(self, v389, v390, v391, v392, v393)
                          || (objc_msgSend_groupingManager(self, v394, v395, v396, v397, v398),
                              v399 = (void *)objc_claimAutoreleasedReturnValue(),
                              v400 = v399 == 0,
                              v399,
                              v400))
                        {
                          v408 = 0;
                        }
                        else
                        {
                          objc_msgSend_groupingManager(self, v401, v402, v403, v404, v405);
                          v406 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_recognizableDrawingForStrokeGroup_translationVector_originalDrawing_orderedStrokesIDs_rescalingFactor_replacementStrokeGroup_(v406, v407, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, 0, 0, 0, 0, 0.0, 0.0);
                          v408 = (void *)objc_claimAutoreleasedReturnValue();

                        }
                        v409 = [CHStrokeGroupRecognitionResult alloc];
                        objc_msgSend_objectAtIndexedSubscript_(v45, v410, k, v411, v412, v413);
                        v414 = (void *)objc_claimAutoreleasedReturnValue();
                        v416 = (void *)objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_inputDrawing_inputDrawingCutPoints_(v409, v415, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], v414, v319, v408, 0, v508);

                        if (v523)
                          v417 = (void *)*((_QWORD *)v523 + 7);
                        else
                          v417 = 0;
                        v418 = v417;
                        v419 = (void *)MEMORY[0x1E0CB37E8];
                        v425 = objc_msgSend_uniqueIdentifier(StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v420, v421, v422, v423, v424);
                        objc_msgSend_numberWithInteger_(v419, v426, v425, v427, v428, v429);
                        v430 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_setObject_forKey_(v418, v431, (uint64_t)v416, (uint64_t)v430, v432, v433);

                      }
                      v434 = v523;
                      if (v523)
                        v434 = (void *)*((_QWORD *)v523 + 6);
                      v435 = v434;
                      objc_msgSend_removeObject_(v435, v436, (uint64_t)v518, v437, v438, v439);

                      if (v523)
                        v440 = (void *)*((_QWORD *)v523 + 7);
                      else
                        v440 = 0;
                      v441 = v440;
                      v442 = (void *)MEMORY[0x1E0CB37E8];
                      v448 = objc_msgSend_uniqueIdentifier(v518, v443, v444, v445, v446, v447);
                      objc_msgSend_numberWithInteger_(v442, v449, v448, v450, v451, v452);
                      v453 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_removeObjectForKey_(v441, v454, (uint64_t)v453, v455, v456, v457);

                    }
                    else
                    {
                      v524 = 0;
                    }
LABEL_14:

                    goto LABEL_15;
                  }
                  continue;
                }
              }
              else
              {
                v195 = 0;
                v196 = (uint64_t *)(8 * v191);
                *(_QWORD *)(8 * v191) = v181;
                v177 = 8 * v191 + 8;
                v197 = v188 - (char *)v189;
                if (v188 == (char *)v189)
                  goto LABEL_88;
              }
              break;
            }
            v198 = v197 - 8;
            if (v198 < 0x58)
              goto LABEL_188;
            if ((unint64_t)(v188 - v195 - (_QWORD)v190) < 0x20)
              goto LABEL_188;
            v199 = (v198 >> 3) + 1;
            v200 = 8 * (v199 & 0x3FFFFFFFFFFFFFFCLL);
            v201 = &v188[-v200];
            v196 = (uint64_t *)((char *)v196 - v200);
            v202 = &v195[8 * v191 - 16];
            v203 = v188 - 16;
            v204 = v199 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v205 = *(_OWORD *)v203;
              *((_OWORD *)v202 - 1) = *((_OWORD *)v203 - 1);
              *(_OWORD *)v202 = v205;
              v202 -= 32;
              v203 -= 32;
              v204 -= 4;
            }
            while (v204);
            v188 = v201;
            if (v199 != (v199 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_188:
              do
              {
                v206 = *((_QWORD *)v188 - 1);
                v188 -= 8;
                *--v196 = v206;
              }
              while (v188 != (char *)v189);
            }
            goto LABEL_88;
          }
LABEL_15:

          ++v519;
          v5 = v523;
        }
        while (v519 != v513);
        v458 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v83, (uint64_t)&v526, (uint64_t)v537, 16, v84);
        v20 = v458;
        if (!v458)
          goto LABEL_164;
      }
    }
    if (v5)
    {
      do
      {
        v460 = v14;
        for (m = 0; m != v460; ++m)
        {
          if (*(_QWORD *)v527 != v512)
            objc_enumerationMutation(obj);
          v462 = *(void **)(*((_QWORD *)&v526 + 1) + 8 * m);
          v463 = *((id *)v523 + 7);
          v464 = (void *)MEMORY[0x1E0CB37E8];
          v470 = objc_msgSend_uniqueIdentifier(v462, v465, v466, v467, v468, v469);
          objc_msgSend_numberWithInteger_(v464, v471, v470, v472, v473, v474);
          v475 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v463, v476, (uint64_t)v475, v477, v478, v479);
          v521 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_mathResult(v521, v480, v481, v482, v483, v484);
          v485 = (id)objc_claimAutoreleasedReturnValue();

        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v486, (uint64_t)&v526, (uint64_t)v537, 16, v487);
      }
      while (v14);
    }
    else
    {
      do
      {
        v488 = v14;
        for (n = 0; n != v488; ++n)
        {
          if (*(_QWORD *)v527 != v512)
            objc_enumerationMutation(obj);
          v490 = *(void **)(*((_QWORD *)&v526 + 1) + 8 * n);
          v491 = (void *)MEMORY[0x1E0CB37E8];
          v492 = objc_msgSend_uniqueIdentifier(v490, v15, v16, v17, v18, v19);
          objc_msgSend_numberWithInteger_(v491, v493, v492, v494, v495, v496);
          v497 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(0, v498, (uint64_t)v497, v499, v500, v501);
          v522 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_mathResult(v522, v502, v503, v504, v505, v506);
          v507 = (id)objc_claimAutoreleasedReturnValue();

        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v526, (uint64_t)v537, 16, v19);
      }
      while (v14);
    }
  }
LABEL_164:

  return v523;
}

@end
