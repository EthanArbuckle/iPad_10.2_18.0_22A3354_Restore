@implementation CHVerticalMathLinkingStep

- (id)process:(id)a3 options:(id)a4
{
  id *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id *v31;
  id *v32;
  void **v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  _BOOL4 v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  double x;
  double y;
  double width;
  double height;
  CHStrokeGroup *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
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
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  double v121;
  double v122;
  void *StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
  id v124;
  _QWORD *v125;
  id v126;
  id v127;
  id v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  id v146;
  id v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  id v164;
  id v165;
  id v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  int v187;
  id *v188;
  id *v189;
  char *v190;
  char *v191;
  id *v192;
  id v193;
  id v194;
  void *v195;
  char *v196;
  void *v197;
  uint64_t v198;
  void *v199;
  char *v200;
  char *i;
  void *v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  id v210;
  void *v211;
  id v212;
  id v213;
  id v214;
  char *v215;
  char *v216;
  char *v217;
  uint64_t v218;
  void *v219;
  void *v220;
  id v221;
  id v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  id v227;
  id v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  id v245;
  const char *v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  id v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  id v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  char *v295;
  char *v296;
  uint64_t v297;
  uint64_t v298;
  unint64_t v299;
  unint64_t v300;
  char *v301;
  char *v302;
  char *v303;
  char *v304;
  char *v305;
  unint64_t v306;
  unint64_t v307;
  uint64_t v308;
  uint64_t v309;
  char *v310;
  char *v311;
  char *v312;
  uint64_t v313;
  __int128 v314;
  __int128 v315;
  uint64_t v316;
  char *v317;
  void *v318;
  id v319;
  id v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  id v325;
  id v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  const char *v347;
  uint64_t v348;
  char *v349;
  void *v350;
  char *v351;
  uint64_t v352;
  uint64_t v353;
  unint64_t v354;
  unint64_t v355;
  char *v356;
  char *v357;
  char *v358;
  char *v359;
  char *v360;
  unint64_t v361;
  unint64_t v362;
  uint64_t v363;
  uint64_t v364;
  char *v365;
  char *v366;
  char *v367;
  uint64_t v368;
  __int128 v369;
  __int128 v370;
  uint64_t v371;
  char *v372;
  void *v373;
  id *v374;
  char *v375;
  id v376;
  id v377;
  id v378;
  CHStrokeGroup *v379;
  id v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  void *v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  void *v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  void *v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  double v409;
  double v410;
  id *v411;
  id *v412;
  CHStrokeGroup *v413;
  double v414;
  CHStrokeGroup *v415;
  double v416;
  CHStrokeGroup *v417;
  NSObject *v418;
  id v419;
  id v420;
  id v421;
  id v422;
  id v423;
  id v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  id v429;
  id v430;
  void *v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  void *v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  id *v447;
  id *v448;
  void **v449;
  void *v450;
  id v451;
  void *v452;
  id v453;
  id v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  id v459;
  id v460;
  void *v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  const char *v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  void *v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  id v477;
  id v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  id v483;
  id v484;
  void *v485;
  const char *v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  void *v496;
  const char *v497;
  uint64_t v498;
  uint64_t v499;
  id v500;
  const char *v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  void *v505;
  void *v506;
  const char *v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  id v512;
  const char *v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t j;
  id v517;
  void *v518;
  id v519;
  void *v520;
  const char *v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  void *v531;
  const char *v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  void *v536;
  const char *v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  void *v542;
  const char *v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  void *v548;
  const char *v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  CHStrokeGroupRecognitionResult *v553;
  const char *v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  void *v559;
  const char *v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  const char *v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  const char *v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  void *v575;
  const char *v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  void *v581;
  const char *v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  uint64_t v586;
  void *v587;
  const char *v588;
  uint64_t v589;
  uint64_t v590;
  uint64_t v591;
  uint64_t v592;
  void *v593;
  const char *v594;
  void *v595;
  id v596;
  id v597;
  void *v598;
  const char *v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  const char *v605;
  uint64_t v606;
  uint64_t v607;
  uint64_t v608;
  void *v609;
  const char *v610;
  uint64_t v611;
  uint64_t v612;
  const char *v613;
  uint64_t v614;
  void *v616;
  id v617;
  void *v618;
  id v619;
  id obj;
  unsigned int v621;
  uint64_t v622;
  CHVerticalMathLinkingStep *v623;
  uint64_t v624;
  void *v625;
  void *v626;
  void *v627;
  uint64_t v628;
  void *v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  id v634;
  id v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  __int128 v639;
  __int128 v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  id v644;
  id v645;
  id v646;
  id v647;
  unsigned __int8 v648;
  void *__p;
  char *v650;
  _QWORD *v651;
  char *v652;
  char *v653;
  unint64_t v654;
  id *v655;
  id *v656;
  id *v657[3];
  uint64_t *v658[3];
  _BYTE v659[128];
  _BYTE v660[128];
  uint8_t v661[128];
  _BYTE buf[22];
  uint64_t v663;
  CGRect v664;
  CGRect v665;
  CGRect v666;

  v663 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v617 = a4;
  v623 = self;
  objc_msgSend_groupingManager(self, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeProvider(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  findStemsAndEntryCandidates(v6, v18, &v652);

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v19 = (id)qword_1EF568E30;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = (v653 - v652) >> 3;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v656 - v655;
    _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_DEBUG, "Got %lu stems and %lu entries", buf, 0x16u);
  }

  objc_msgSend_set(MEMORY[0x1E0C99E20], v20, v21, v22, v23, v24);
  v618 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v25 = v6 ? v6[7] : 0;
    v26 = v25;
    sub_1BE806818((id *)buf, (id **)&v652, &v655, v657, v618, v26);

    if (!buf[16])
      break;
    v31 = v656;
    if (v655 == v656)
    {
      v32 = v655;
LABEL_18:
      if (v32 == v656)
        goto LABEL_27;
LABEL_24:
      while (v31 != v32)
      {
        v36 = *--v31;

      }
      v656 = v32;
      goto LABEL_27;
    }
    v32 = v655;
    while (*v32 != *(id *)&buf[8])
    {
      if (++v32 == v656)
      {
        v32 = v656;
        break;
      }
    }
    if (v32 == v656)
      goto LABEL_18;
    v33 = v32 + 1;
    if (v32 + 1 == v656)
      goto LABEL_18;
    do
    {
      v34 = *v33;
      if (*v33 != *(void **)&buf[8])
      {
        *v33 = 0;
        v35 = *v32;
        *v32 = v34;

        ++v32;
      }
      ++v33;
    }
    while (v33 != v31);
    v31 = v656;
    if (v32 != v656)
      goto LABEL_24;
LABEL_27:
    objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v27, *(uint64_t *)&buf[8], v28, v29, v30);
    v627 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v37 = v6[7];
    else
      v37 = 0;
    v38 = v37;
    v39 = (void *)MEMORY[0x1E0CB37E8];
    v45 = objc_msgSend_uniqueIdentifier(*(void **)buf, v40, v41, v42, v43, v44);
    objc_msgSend_numberWithInteger_(v39, v46, v45, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v38, v51, (uint64_t)v50, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mathResult(v55, v56, v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61 == 0;

    if (!v62)
      goto LABEL_84;
    objc_msgSend_bounds(*(void **)buf, v63, v64, v65, v66, v67);
    v69 = v68;
    v71 = v70;
    v73 = v72;
    v75 = v74;
    objc_msgSend_bounds(*(void **)&buf[8], v76, v77, v78, v79, v80);
    v666.origin.x = v81;
    v666.origin.y = v82;
    v666.size.width = v83;
    v666.size.height = v84;
    v664.origin.x = v69;
    v664.origin.y = v71;
    v664.size.width = v73;
    v664.size.height = v75;
    v665 = CGRectUnion(v664, v666);
    x = v665.origin.x;
    y = v665.origin.y;
    width = v665.size.width;
    height = v665.size.height;
    v89 = [CHStrokeGroup alloc];
    objc_msgSend_strokeIdentifiers(*(void **)buf, v90, v91, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstStrokeIdentifier(*(void **)buf, v96, v97, v98, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastStrokeIdentifier(*(void **)buf, v102, v103, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_groupingConfidence(*(void **)buf, v108, v109, v110, v111, v112);
    v114 = v113;
    objc_msgSend_firstStrokeOrigin(*(void **)buf, v115, v116, v117, v118, v119);
    StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (void *)objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v89, v120, (uint64_t)v95, (uint64_t)v101, (uint64_t)v107, 3, CFSTR("CHGroupingPostProcessingManager"), x, y, width, height, v114, v121, v122);

    v124 = StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
    v125 = operator new(8uLL);
    __p = v125;
    v651 = v125 + 1;
    v126 = v124;
    *v125 = v126;
    v650 = (char *)(v125 + 1);

    if (v6)
      v127 = v6[7];
    else
      v127 = 0;
    v128 = v127;
    v129 = (void *)MEMORY[0x1E0CB37E8];
    v135 = objc_msgSend_uniqueIdentifier(*(void **)&buf[8], v130, v131, v132, v133, v134);
    objc_msgSend_numberWithInteger_(v129, v136, v135, v137, v138, v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v128, v141, (uint64_t)v140, v142, v143, v144);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v146 = v6[7];
    else
      v146 = 0;
    v147 = v146;
    v148 = (void *)MEMORY[0x1E0CB37E8];
    v154 = objc_msgSend_uniqueIdentifier(v126, v149, v150, v151, v152, v153);
    objc_msgSend_numberWithInteger_(v148, v155, v154, v156, v157, v158);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v147, v160, (uint64_t)v145, (uint64_t)v159, v161, v162);

    if (v6)
      v163 = v6[7];
    else
      v163 = 0;
    v164 = v163;
    sub_1BE806818(&v646, (id **)&__p, &v655, v657, v618, v164);

    if (v6)
      v165 = v6[7];
    else
      v165 = 0;
    v166 = v165;
    v167 = (void *)MEMORY[0x1E0CB37E8];
    v173 = objc_msgSend_uniqueIdentifier(v126, v168, v169, v170, v171, v172);
    objc_msgSend_numberWithInteger_(v167, v174, v173, v175, v176, v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v166, v179, (uint64_t)v178, v180, v181, v182);

    v187 = v648;
    if (v648)
    {
      objc_msgSend_addObject_(v627, v183, (uint64_t)v647, v184, v185, v186);
      v188 = v656;
      if (v655 == v656)
      {
        v189 = v655;
LABEL_55:
        if (v189 == v656)
          goto LABEL_76;
      }
      else
      {
        v189 = v655;
        while (*v189 != v647)
        {
          if (++v189 == v656)
          {
            v189 = v656;
            break;
          }
        }
        if (v189 == v656)
          goto LABEL_55;
        v192 = v189 + 1;
        if (v189 + 1 == v656)
          goto LABEL_55;
        do
        {
          v193 = *v192;
          if (*v192 != v647)
          {
            *v192 = 0;
            v194 = *v189;
            *v189 = v193;

            ++v189;
          }
          ++v192;
        }
        while (v192 != v188);
        v188 = v656;
        if (v189 == v656)
          goto LABEL_76;
      }
      while (v188 != v189)
      {
        v195 = *--v188;

      }
      v656 = v189;
      if (v648)
        goto LABEL_77;
      goto LABEL_78;
    }
    v190 = v653;
    if (v652 == v653)
    {
      v191 = v652;
    }
    else
    {
      v191 = v652;
      while (*(_QWORD *)v191 != *(_QWORD *)buf)
      {
        v191 += 8;
        if (v191 == v653)
        {
          v191 = v653;
          break;
        }
      }
      if (v191 != v653)
      {
        v196 = v191 + 8;
        if (v191 + 8 != v653)
        {
          do
          {
            v198 = *(_QWORD *)v196;
            if (*(_QWORD *)v196 != *(_QWORD *)buf)
            {
              *(_QWORD *)v196 = 0;
              v199 = *(void **)v191;
              *(_QWORD *)v191 = v198;

              v191 += 8;
            }
            v196 += 8;
          }
          while (v196 != v190);
          v190 = v653;
          if (v191 == v653)
          {
LABEL_76:
            if (!v648)
              goto LABEL_78;
LABEL_77:

            goto LABEL_78;
          }
          goto LABEL_68;
        }
      }
    }
    if (v191 == v653)
      goto LABEL_76;
LABEL_68:
    while (v190 != v191)
    {
      v197 = (void *)*((_QWORD *)v190 - 1);
      v190 -= 8;

    }
    v653 = v191;
    if (v648)
      goto LABEL_77;
LABEL_78:
    v200 = (char *)__p;
    if (__p)
    {
      for (i = v650; i != v200; i -= 8)
      {
        v202 = (void *)*((_QWORD *)i - 1);

      }
      operator delete(v200);
    }

    if (!v187)
    {
      v213 = 0;
      goto LABEL_151;
    }
LABEL_84:
    objc_msgSend_reverseObjectEnumerator(v627, v63, v64, v65, v66, v67);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v203, v204, v205, v206, v207, v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v210 = v6[7];
    else
      v210 = 0;
    v211 = *(void **)buf;
    v212 = v210;
    v644 = 0;
    v645 = 0;
    sub_1BE808EC8(v623, v209, v211, 0, v658, v212, &v645, &v644);
    v213 = v645;
    v214 = v644;

    v215 = v653;
    if (v652 == v653)
    {
      v216 = v652;
    }
    else
    {
      v216 = v652;
      while (*(_QWORD *)v216 != *(_QWORD *)buf)
      {
        v216 += 8;
        if (v216 == v653)
        {
          v216 = v653;
          break;
        }
      }
      if (v216 != v653)
      {
        v217 = v216 + 8;
        if (v216 + 8 != v653)
        {
          do
          {
            v218 = *(_QWORD *)v217;
            if (*(_QWORD *)v217 != *(_QWORD *)buf)
            {
              *(_QWORD *)v217 = 0;
              v219 = *(void **)v216;
              *(_QWORD *)v216 = v218;

              v216 += 8;
            }
            v217 += 8;
          }
          while (v217 != v215);
          v215 = v653;
          if (v216 == v653)
            goto LABEL_104;
LABEL_101:
          while (v215 != v216)
          {
            v220 = (void *)*((_QWORD *)v215 - 1);
            v215 -= 8;

          }
          v653 = v216;
          goto LABEL_104;
        }
      }
    }
    if (v216 != v653)
      goto LABEL_101;
LABEL_104:
    if (v6)
      v221 = v6[6];
    else
      v221 = 0;
    v222 = v221;
    objc_msgSend_removeObject_(v222, v223, *(uint64_t *)buf, v224, v225, v226);

    if (v6)
      v227 = v6[7];
    else
      v227 = 0;
    v228 = v227;
    v229 = (void *)MEMORY[0x1E0CB37E8];
    v235 = objc_msgSend_uniqueIdentifier(*(void **)buf, v230, v231, v232, v233, v234);
    objc_msgSend_numberWithInteger_(v229, v236, v235, v237, v238, v239);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v228, v241, (uint64_t)v240, v242, v243, v244);

    v642 = 0u;
    v643 = 0u;
    v640 = 0u;
    v641 = 0u;
    v245 = v627;
    v252 = objc_msgSend_countByEnumeratingWithState_objects_count_(v245, v246, (uint64_t)&v640, (uint64_t)v661, 16, v247);
    if (v252)
    {
      v253 = *(_QWORD *)v641;
      do
      {
        v254 = 0;
        if (v6)
        {
          do
          {
            if (*(_QWORD *)v641 != v253)
              objc_enumerationMutation(v245);
            v255 = *(void **)(*((_QWORD *)&v640 + 1) + 8 * v254);
            v256 = v6[6];
            objc_msgSend_removeObject_(v256, v257, (uint64_t)v255, v258, v259, v260);

            v261 = v6[7];
            v262 = (void *)MEMORY[0x1E0CB37E8];
            v268 = objc_msgSend_uniqueIdentifier(v255, v263, v264, v265, v266, v267);
            objc_msgSend_numberWithInteger_(v262, v269, v268, v270, v271, v272);
            v273 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeObjectForKey_(v261, v274, (uint64_t)v273, v275, v276, v277);

            ++v254;
          }
          while (v252 != v254);
        }
        else
        {
          do
          {
            if (*(_QWORD *)v641 != v253)
              objc_enumerationMutation(v245);
            v278 = *(void **)(*((_QWORD *)&v640 + 1) + 8 * v254);
            objc_msgSend_removeObject_(0, v248, (uint64_t)v278, v249, v250, v251);
            v279 = (void *)MEMORY[0x1E0CB37E8];
            v285 = objc_msgSend_uniqueIdentifier(v278, v280, v281, v282, v283, v284);
            objc_msgSend_numberWithInteger_(v279, v286, v285, v287, v288, v289);
            v290 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeObjectForKey_(0, v291, (uint64_t)v290, v292, v293, v294);

            ++v254;
          }
          while (v252 != v254);
        }
        v252 = objc_msgSend_countByEnumeratingWithState_objects_count_(v245, v248, (uint64_t)&v640, (uint64_t)v661, 16, v251);
      }
      while (v252);
    }

    v295 = v653;
    if ((unint64_t)v653 >= v654)
    {
      v297 = v653 - v652;
      v298 = (v653 - v652) >> 3;
      if ((unint64_t)(v298 + 1) >> 61)
        sub_1BE61F930();
      v299 = (uint64_t)(v654 - (_QWORD)v652) >> 2;
      if (v299 <= v298 + 1)
        v299 = v298 + 1;
      if (v654 - (unint64_t)v652 >= 0x7FFFFFFFFFFFFFF8)
        v300 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v300 = v299;
      if (v300)
      {
        if (v300 >> 61)
          sub_1BE61F100();
        v301 = (char *)operator new(8 * v300);
      }
      else
      {
        v301 = 0;
      }
      v302 = &v301[8 * v298];
      v303 = &v301[8 * v300];
      *(_QWORD *)v302 = v213;
      v296 = v302 + 8;
      v304 = v652;
      v305 = v653;
      if (v653 == v652)
      {
        v652 = &v301[8 * v298];
        v653 = v302 + 8;
        v654 = (unint64_t)v303;
      }
      else
      {
        v306 = v653 - v652 - 8;
        if (v306 < 0x78)
          goto LABEL_289;
        v307 = (v653 - 8 - v652) & 0xFFFFFFFFFFFFFFF8;
        if (&v653[-v307 - 8] < v302 && &v301[v297 - v307 - 8] < v653)
          goto LABEL_289;
        v308 = (v306 >> 3) + 1;
        v309 = 8 * (v308 & 0x3FFFFFFFFFFFFFFCLL);
        v302 -= v309;
        v310 = &v653[-v309];
        v311 = v653 - 16;
        v312 = &v301[8 * v298 - 16];
        v313 = v308 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v315 = *((_OWORD *)v311 - 1);
          v314 = *(_OWORD *)v311;
          *((_OWORD *)v311 - 1) = 0uLL;
          *(_OWORD *)v311 = 0uLL;
          *((_OWORD *)v312 - 1) = v315;
          *(_OWORD *)v312 = v314;
          v311 -= 32;
          v312 -= 32;
          v313 -= 4;
        }
        while (v313);
        v305 = v310;
        if (v308 != (v308 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_289:
          do
          {
            v316 = *((_QWORD *)v305 - 1);
            v305 -= 8;
            *(_QWORD *)v305 = 0;
            *((_QWORD *)v302 - 1) = v316;
            v302 -= 8;
          }
          while (v305 != v304);
        }
        v305 = v652;
        v317 = v653;
        v652 = v302;
        v653 = v296;
        v654 = (unint64_t)v303;
        while (v317 != v305)
        {
          v318 = (void *)*((_QWORD *)v317 - 1);
          v317 -= 8;

        }
      }
      if (v305)
        operator delete(v305);
    }
    else
    {
      *(_QWORD *)v295 = v213;
      v296 = v295 + 8;
    }
    v653 = v296;
    if (v6)
      v319 = v6[6];
    else
      v319 = 0;
    v320 = v319;
    objc_msgSend_addObject_(v320, v321, (uint64_t)v213, v322, v323, v324);

    if (v6)
      v325 = v6[7];
    else
      v325 = 0;
    v326 = v325;
    v327 = (void *)MEMORY[0x1E0CB37E8];
    v333 = objc_msgSend_uniqueIdentifier(v213, v328, v329, v330, v331, v332);
    objc_msgSend_numberWithInteger_(v327, v334, v333, v335, v336, v337);
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v326, v339, (uint64_t)v214, (uint64_t)v338, v340, v341);

LABEL_151:
    if (buf[16])
    {

    }
  }
  v636 = 0u;
  v637 = 0u;
  v638 = 0u;
  v639 = 0u;
  obj = v618;
  v344 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v342, (uint64_t)&v636, (uint64_t)v660, 16, v343);
  if (!v344)
    goto LABEL_201;
  v345 = *(_QWORD *)v637;
  v628 = *(_QWORD *)v637;
  while (2)
  {
    v346 = 0;
    while (2)
    {
      if (*(_QWORD *)v637 != v345)
        objc_enumerationMutation(obj);
      v350 = *(void **)(*((_QWORD *)&v636 + 1) + 8 * v346);
      v351 = v653;
      if ((unint64_t)v653 < v654)
      {
        *(_QWORD *)v351 = v350;
        v349 = v351 + 8;
        goto LABEL_169;
      }
      v352 = v653 - v652;
      v353 = (v653 - v652) >> 3;
      if ((unint64_t)(v353 + 1) >> 61)
        sub_1BE61F930();
      v354 = (uint64_t)(v654 - (_QWORD)v652) >> 2;
      if (v354 <= v353 + 1)
        v354 = v353 + 1;
      if (v654 - (unint64_t)v652 >= 0x7FFFFFFFFFFFFFF8)
        v355 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v355 = v354;
      if (v355)
      {
        if (v355 >> 61)
          sub_1BE61F100();
        v356 = (char *)operator new(8 * v355);
      }
      else
      {
        v356 = 0;
      }
      v357 = &v356[8 * v353];
      v358 = &v356[8 * v355];
      *(_QWORD *)v357 = v350;
      v349 = v357 + 8;
      v359 = v652;
      v360 = v653;
      if (v653 == v652)
      {
        v652 = &v356[8 * v353];
        v653 = v357 + 8;
        v654 = (unint64_t)v358;
        v345 = v628;
        if (!v360)
          goto LABEL_169;
        goto LABEL_199;
      }
      v361 = v653 - v652 - 8;
      if (v361 < 0x78)
        goto LABEL_290;
      v362 = (v653 - 8 - v652) & 0xFFFFFFFFFFFFFFF8;
      if (&v653[-v362 - 8] < v357 && &v356[v352 - v362 - 8] < v653)
        goto LABEL_290;
      v363 = (v361 >> 3) + 1;
      v364 = 8 * (v363 & 0x3FFFFFFFFFFFFFFCLL);
      v357 -= v364;
      v365 = &v653[-v364];
      v366 = v653 - 16;
      v367 = &v356[8 * v353 - 16];
      v368 = v363 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v370 = *((_OWORD *)v366 - 1);
        v369 = *(_OWORD *)v366;
        *((_OWORD *)v366 - 1) = 0uLL;
        *(_OWORD *)v366 = 0uLL;
        *((_OWORD *)v367 - 1) = v370;
        *(_OWORD *)v367 = v369;
        v366 -= 32;
        v367 -= 32;
        v368 -= 4;
      }
      while (v368);
      v360 = v365;
      if (v363 != (v363 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_290:
        do
        {
          v371 = *((_QWORD *)v360 - 1);
          v360 -= 8;
          *(_QWORD *)v360 = 0;
          *((_QWORD *)v357 - 1) = v371;
          v357 -= 8;
        }
        while (v360 != v359);
      }
      v360 = v652;
      v372 = v653;
      v652 = v357;
      v653 = v349;
      v654 = (unint64_t)v358;
      if (v372 == v360)
      {
        v345 = v628;
        if (!v360)
          goto LABEL_169;
        goto LABEL_199;
      }
      v345 = v628;
      do
      {
        v373 = (void *)*((_QWORD *)v372 - 1);
        v372 -= 8;

      }
      while (v372 != v360);
      if (v360)
LABEL_199:
        operator delete(v360);
LABEL_169:
      v653 = v349;
      if (++v346 != v344)
        continue;
      break;
    }
    v344 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v347, (uint64_t)&v636, (uint64_t)v660, 16, v348);
    if (v344)
      continue;
    break;
  }
LABEL_201:

  v374 = (id *)v652;
  v375 = v653;
  if (v652 != v653)
  {
    while (2)
    {
      v376 = *v374;
      if (v6)
        v377 = v6[7];
      else
        v377 = 0;
      v378 = v377;
      v379 = (CHStrokeGroup *)v376;
      v380 = v378;
      v381 = (void *)MEMORY[0x1E0CB37E8];
      v387 = objc_msgSend_uniqueIdentifier(v379, v382, v383, v384, v385, v386);
      objc_msgSend_numberWithInteger_(v381, v388, v387, v389, v390, v391);
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v380, v393, (uint64_t)v392, v394, v395, v396);
      v397 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mathResult(v397, v398, v399, v400, v401, v402);
      v403 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_baseCharacterHeight(v403, v404, v405, v406, v407, v408);
      v410 = v409;

      v411 = v655;
      v412 = v656;
      if (v655 == v656)
      {
        v413 = 0;
        if (qword_1EF568E88 == -1)
          goto LABEL_210;
      }
      else
      {
        v413 = 0;
        v414 = 0.0;
        do
        {
          v415 = (CHStrokeGroup *)*v411;
          v416 = scoreStemEntry(v379, v415, v410, 1);
          if (v416 > v414)
          {
            v417 = v415;

            v413 = v417;
            v414 = v416;
          }

          ++v411;
        }
        while (v411 != v412);
        if (qword_1EF568E88 == -1)
        {
LABEL_210:
          v418 = (id)qword_1EF568E30;
          if (os_log_type_enabled(v418, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v413;
            _os_log_impl(&dword_1BE607000, v418, OS_LOG_TYPE_DEBUG, "findBestResultForStem: %@", buf, 0xCu);
          }

          if (v413)
          {
            if (v6)
              v419 = v6[7];
            else
              v419 = 0;
            v420 = v419;
            v634 = 0;
            v635 = 0;
            sub_1BE808EC8(v623, MEMORY[0x1E0C9AA60], v379, v413, v658, v420, &v635, &v634);
            v421 = v635;
            v422 = v634;

            if (v6)
              v423 = v6[6];
            else
              v423 = 0;
            v424 = v423;
            objc_msgSend_removeObject_(v424, v425, (uint64_t)v379, v426, v427, v428);

            if (v6)
              v429 = v6[7];
            else
              v429 = 0;
            v430 = v429;
            v431 = (void *)MEMORY[0x1E0CB37E8];
            v437 = objc_msgSend_uniqueIdentifier(v379, v432, v433, v434, v435, v436);
            objc_msgSend_numberWithInteger_(v431, v438, v437, v439, v440, v441);
            v442 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeObjectForKey_(v430, v443, (uint64_t)v442, v444, v445, v446);

            v447 = v656;
            v448 = v655;
            if (v655 != v656)
            {
              while (*v448 != v413)
              {
                if (++v448 == v656)
                {
                  v448 = v656;
                  break;
                }
              }
            }
            if (v448 == v656 || (v449 = v448 + 1, v448 + 1 == v656))
            {
              if (v448 == v656)
                goto LABEL_236;
LABEL_233:
              while (v447 != v448)
              {
                v452 = *--v447;

              }
              v656 = v448;
            }
            else
            {
              do
              {
                v450 = *v449;
                if (*v449 != v413)
                {
                  *v449 = 0;
                  v451 = *v448;
                  *v448 = v450;

                  ++v448;
                }
                ++v449;
              }
              while (v449 != v447);
              v447 = v656;
              if (v448 != v656)
                goto LABEL_233;
            }
LABEL_236:
            if (v6)
              v453 = v6[6];
            else
              v453 = 0;
            v454 = v453;
            objc_msgSend_removeObject_(v454, v455, (uint64_t)v413, v456, v457, v458);

            if (v6)
              v459 = v6[7];
            else
              v459 = 0;
            v460 = v459;
            v461 = (void *)MEMORY[0x1E0CB37E8];
            v467 = objc_msgSend_uniqueIdentifier(v413, v462, v463, v464, v465, v466);
            objc_msgSend_numberWithInteger_(v461, v468, v467, v469, v470, v471);
            v472 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeObjectForKey_(v460, v473, (uint64_t)v472, v474, v475, v476);

            if (v6)
              v477 = v6[6];
            else
              v477 = 0;
            v478 = v477;
            objc_msgSend_addObject_(v478, v479, (uint64_t)v421, v480, v481, v482);

            if (v6)
              v483 = v6[7];
            else
              v483 = 0;
            v484 = v483;
            v485 = (void *)MEMORY[0x1E0CB37E8];
            v491 = objc_msgSend_uniqueIdentifier(v421, v486, v487, v488, v489, v490);
            objc_msgSend_numberWithInteger_(v485, v492, v491, v493, v494, v495);
            v496 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v484, v497, (uint64_t)v422, (uint64_t)v496, v498, v499);

          }
          if (++v374 == (id *)v375)
            goto LABEL_255;
          continue;
        }
      }
      break;
    }
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    goto LABEL_210;
  }
LABEL_255:
  v500 = v617;
  objc_opt_self();
  v505 = v500;
  if (v500)
  {
    objc_msgSend_objectForKey_(v500, v501, (uint64_t)CHGroupingPostProcessingManagerOptionExplicitOperators, v502, v503, v504);
    v506 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v621 = objc_msgSend_BOOLValue(v506, v507, v508, v509, v510, v511);
    else
      v621 = 0;

    v505 = v500;
  }
  else
  {
    v621 = 0;
  }
  v616 = v505;

  v632 = 0u;
  v633 = 0u;
  v630 = 0u;
  v631 = 0u;
  if (v6)
    v512 = v6[6];
  else
    v512 = 0;
  v619 = v512;
  v515 = objc_msgSend_countByEnumeratingWithState_objects_count_(v619, v513, (uint64_t)&v630, (uint64_t)v659, 16, v514);
  if (v515)
  {
    v622 = *(_QWORD *)v631;
    do
    {
      v624 = v515;
      for (j = 0; j != v624; ++j)
      {
        if (*(_QWORD *)v631 != v622)
          objc_enumerationMutation(v619);
        if (v6)
          v517 = v6[7];
        else
          v517 = 0;
        v518 = *(void **)(*((_QWORD *)&v630 + 1) + 8 * j);
        v519 = v517;
        v520 = (void *)MEMORY[0x1E0CB37E8];
        v526 = objc_msgSend_uniqueIdentifier(v518, v521, v522, v523, v524, v525);
        objc_msgSend_numberWithInteger_(v520, v527, v526, v528, v529, v530);
        v531 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v519, v532, (uint64_t)v531, v533, v534, v535);
        v536 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_mathResult(v536, v537, v538, v539, v540, v541);
        v542 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v519) = v542 == 0;

        if ((v519 & 1) == 0)
        {
          objc_msgSend_mathResult(v536, v543, v544, v545, v546, v547);
          v548 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_resultTransformedToOfficialNotationWithExplicitOperators_(v548, v549, v621, v550, v551, v552);
          v629 = (void *)objc_claimAutoreleasedReturnValue();

          if (v629)
          {
            v553 = [CHStrokeGroupRecognitionResult alloc];
            objc_msgSend_orderedLocales(v536, v554, v555, v556, v557, v558);
            v559 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recognitionResultsByLocale(v536, v560, v561, v562, v563, v564);
            v626 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorsByLocale(v536, v565, v566, v567, v568, v569);
            v625 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_languageFitnessByLocale(v536, v570, v571, v572, v573, v574);
            v575 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_inputStrokeIdentifiers(v536, v576, v577, v578, v579, v580);
            v581 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_inputDrawing(v536, v582, v583, v584, v585, v586);
            v587 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_inputDrawingCutPoints(v536, v588, v589, v590, v591, v592);
            v593 = (void *)objc_claimAutoreleasedReturnValue();
            v595 = (void *)objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_inputDrawing_inputDrawingCutPoints_(v553, v594, (uint64_t)v559, (uint64_t)v626, (uint64_t)v625, (uint64_t)v575, v629, v581, v587, v593);

            if (v6)
              v596 = v6[7];
            else
              v596 = 0;
            v597 = v596;
            v598 = (void *)MEMORY[0x1E0CB37E8];
            v604 = objc_msgSend_uniqueIdentifier(v518, v599, v600, v601, v602, v603);
            objc_msgSend_numberWithInteger_(v598, v605, v604, v606, v607, v608);
            v609 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v597, v610, (uint64_t)v595, (uint64_t)v609, v611, v612);

          }
        }

      }
      v515 = objc_msgSend_countByEnumeratingWithState_objects_count_(v619, v613, (uint64_t)&v630, (uint64_t)v659, 16, v614);
    }
    while (v515);
  }

  sub_1BE81147C(&v652);
  return v6;
}

@end
