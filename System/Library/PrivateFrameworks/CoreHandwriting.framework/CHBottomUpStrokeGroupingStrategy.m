@implementation CHBottomUpStrokeGroupingStrategy

- (CHBottomUpStrokeGroupingStrategy)initWithStrokeProvider:(id)a3 defaultWritingOrientation:(int64_t)a4 locales:(id)a5 isInlineContinuousMode:(BOOL)a6 inlineContinuousModeTargets:(id)a7
{
  _BOOL4 v8;
  id v12;
  __int128 v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString *strategyIdentifier;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  int v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  char shouldAdjustGroupingForLocale;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v51;
  id v52;
  id v53;
  CHBottomUpStrokeGroupingStrategy *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  uint64_t v61;

  v8 = a6;
  v61 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v53 = a5;
  v51 = v12;
  v52 = a7;
  v59.receiver = self;
  v59.super_class = (Class)CHBottomUpStrokeGroupingStrategy;
  v54 = -[CHStrokeGroupingStrategy initWithStrokeProvider:](&v59, sel_initWithStrokeProvider_, v12);
  if (v54)
  {
    if (a4 == 2)
    {
      v13 = xmmword_1BE8E0240;
      v14 = CFSTR("right-to-left");
      v15 = 2;
    }
    else
    {
      if (a4 == 3)
      {
        v13 = xmmword_1BE8DFBD0;
        v14 = CFSTR("vertical");
      }
      else
      {
        v13 = xmmword_1BE8DFBC0;
        v14 = CFSTR("left-to-right");
      }
      v15 = 1;
    }
    v54->_defaultOrientationVector = (CGVector)v13;
    v54->_textStrokeClassification = v15;
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v16, v19, (uint64_t)CFSTR("%@_%@"), v20, v21, v22, v18, v14);
    v23 = objc_claimAutoreleasedReturnValue();
    strategyIdentifier = v54->_strategyIdentifier;
    v54->_strategyIdentifier = (NSString *)v23;

    v54->_isInlineContinuousMode = v8;
    objc_storeStrong((id *)&v54->_textInputTargets, a7);
    v54->_defaultDeviationVector = (CGVector)xmmword_1BE8E0298;
    v54->_strokeDeviationCapCoeff = 2.0;
    v54->_groupingMergingCostThresh = 6.0;
    v54->_groupingMergingEndCostLowThresh = 3.0;
    v54->_groupingSimilarCostThresh = 0.8;
    v54->_groupingContextSize = 6;
    v54->_mergeEndDxCostCoeff = 1.0;
    v54->_mergeEndDyCostCoeff = 2.0;
    v54->_mergeEndBelowModifier = 1.2;
    v54->_mergeEndLeftModifier = 5.0;
    v54->_mergeMiddleDxCostCoeff = 2.0;
    v54->_mergeMiddleDyCostCoeff = 4.0;
    v54->_mergeMiddleBelowModifier = 2.0;
    v54->_splitMinimumStrokeCount = 4;
    v54->_splitMaxNaturalIndexDiffThreshold = 8;
    v54->_shouldLimitDefaultWritingOrientationDeviation = 0;
    v54->_shouldAdjustDeviationOfSmallGroups = 0;
    v54->_shouldCoalesceLastSubstrokes = 0;
    if (v8)
      v54->_shouldLimitDefaultWritingOrientationDeviation = 1;
    if (v53)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v25 = v53;
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v55, (uint64_t)v60, 16, v27);
      if (v32)
      {
        v33 = 0;
        v34 = 0;
        v35 = 0;
        v36 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v56 != v36)
              objc_enumerationMutation(v25);
            v38 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
            shouldAdjustGroupingForLocale = objc_msgSend_shouldAdjustGroupingForLocale_(CHRecognizerConfiguration, v28, v38, v29, v30, v31);
            v34 |= shouldAdjustGroupingForLocale ^ 1;
            v33 |= shouldAdjustGroupingForLocale;
            v35 |= objc_msgSend_shouldAdjustGroupingHeuristicsForVeryComplexCharacters_(CHRecognizerConfiguration, v40, v38, v41, v42, v43);
          }
          v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v55, (uint64_t)v60, 16, v31);
        }
        while (v32);

        if ((v33 & 1) != 0)
        {
          v54->_mergeEndDyCostCoeff = 1.8;
          v54->_mergeEndLeftModifier = 4.5;
          v54->_splitMinimumStrokeCount = 6;
          v54->_splitMaxNaturalIndexDiffThreshold = 10;
          if ((v34 & 1) != 0)
            goto LABEL_25;
        }
        else if ((v34 & 1) != 0)
        {
          goto LABEL_25;
        }
        v54->_shouldAdjustDeviationOfSmallGroups = 1;
        v54->_shouldCoalesceLastSubstrokes = 1;
        __asm { FMOV            V0.2D, #14.0 }
        v54->_defaultDeviationVector = _Q0;
        v54->_groupingContextSize = 15;
        v54->_mergeEndDyCostCoeff = 1.4;
        v54->_mergeEndLeftModifier = 3.8;
        v54->_mergeEndBelowModifier = 1.42;
        if ((v35 & 1) != 0)
        {
          v54->_splitMinimumStrokeCount = 12;
          v54->_splitMaxNaturalIndexDiffThreshold = 16;
        }
      }
      else
      {

        v54->_shouldAdjustDeviationOfSmallGroups = 1;
        v54->_shouldCoalesceLastSubstrokes = 1;
        __asm { FMOV            V0.2D, #14.0 }
        v54->_defaultDeviationVector = _Q0;
        v54->_groupingContextSize = 15;
        v54->_mergeEndDyCostCoeff = 1.4;
        v54->_mergeEndLeftModifier = 3.8;
        v54->_mergeEndBelowModifier = 1.42;
      }
    }
  }
LABEL_25:

  return v54;
}

- (id)strategyIdentifier
{
  return self->_strategyIdentifier;
}

- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8
{
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
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
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
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
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
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t k;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t m;
  uint64_t v146;
  CHSubstrokePlacement *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  NSObject *v173;
  const char *v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
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
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t ii;
  uint64_t v199;
  CHSubstrokePlacement *v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  NSObject *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  id v270;
  const char *v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t jj;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  void *kk;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  char isSubsetOfSet;
  void *v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  id v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t mm;
  uint64_t v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  void *v345;
  const char *v346;
  uint64_t v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  _BOOL4 v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  char v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t nn;
  void *v395;
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
  _BOOL4 v407;
  int v408;
  unint64_t v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  char v420;
  void *v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  void *v441;
  void *v442;
  const char *v443;
  const char *v444;
  uint64_t v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  void *v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  const char *v457;
  uint64_t v458;
  void *v459;
  const char *v460;
  uint64_t v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  void *v470;
  void *v471;
  const char *v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  void *v477;
  const char *v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  int isEqualToSet;
  const char *v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  id v487;
  const char *v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  const char *v496;
  uint64_t v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  void *v502;
  CHBottomUpStrokeGroupingResult *v503;
  const char *v504;
  id v506;
  id v507;
  uint64_t v508;
  void *v509;
  id v510;
  id v511;
  uint64_t (**v512)(void);
  void *v513;
  uint64_t v514;
  void *v515;
  id v516;
  id v517;
  id v518;
  int v519;
  id v520;
  id v521;
  id obj;
  id obja;
  id objb;
  void *v525;
  id v526;
  uint64_t j;
  uint64_t v528;
  uint64_t v529;
  id v530;
  id v531;
  id v532;
  id v533;
  void *v534;
  uint64_t v535;
  uint64_t v536;
  void *v537;
  void *v538;
  void *i1;
  uint64_t v540;
  void *v541;
  void *v542;
  id v543;
  id n;
  id v545;
  id v546;
  id v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  _QWORD v560[4];
  id v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  __int128 v590;
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
  _BYTE v602[128];
  _BYTE v603[128];
  _BYTE v604[128];
  _BYTE v605[128];
  _BYTE v606[128];
  _BYTE v607[128];
  uint8_t v608[128];
  uint8_t buf[4];
  void *v610;
  __int16 v611;
  uint64_t v612;
  __int16 v613;
  uint64_t v614;
  _BYTE v615[128];
  _BYTE v616[128];
  _BYTE v617[128];
  _BYTE v618[128];
  _BYTE v619[128];
  _BYTE v620[128];
  uint64_t v621;

  v621 = *MEMORY[0x1E0C80C00];
  v511 = a3;
  v516 = a4;
  v521 = a5;
  v507 = a6;
  v526 = a7;
  v512 = (uint64_t (**)(void))a8;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v14, v15, v16, v17, v18);
  v534 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v19, v20, v21, v22, v23);
  v525 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v598 = 0u;
    v599 = 0u;
    v600 = 0u;
    v601 = 0u;
    obj = v511;
    objc_msgSend_strokeGroups(obj, v29, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v598, (uint64_t)v620, 16, v36);
    if (v37)
    {
      v38 = *(_QWORD *)v599;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v599 != v38)
            objc_enumerationMutation(v34);
          v40 = *(void **)(*((_QWORD *)&v598 + 1) + 8 * i);
          v41 = (void *)objc_opt_class();
          v47 = objc_msgSend_classification(v40, v42, v43, v44, v45, v46);
          if (objc_msgSend_isStrokeClassificationTextOrMath_(v41, v48, v47, v49, v50, v51))
            objc_msgSend_addObject_(v525, v52, (uint64_t)v40, v53, v54, v55);
        }
        v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v52, (uint64_t)&v598, (uint64_t)v620, 16, v55);
      }
      while (v37);
    }

    objc_msgSend_substrokePlacementsByStrokeIdentifier(obj, v56, v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addEntriesFromDictionary_(v534, v62, (uint64_t)v61, v63, v64, v65);

  }
  else
  {
    v596 = 0u;
    v597 = 0u;
    v594 = 0u;
    v595 = 0u;
    objc_msgSend_strokeGroups(v511, v24, v25, v26, v27, v28);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v66, (uint64_t)&v594, (uint64_t)v619, 16, v67);
    if (v68)
    {
      v514 = v68;
      v518 = *(id *)v595;
      do
      {
        for (j = 0; j != v514; ++j)
        {
          if (*(id *)v595 != v518)
            objc_enumerationMutation(obj);
          v71 = *(void **)(*((_QWORD *)&v594 + 1) + 8 * j);
          v72 = (void *)objc_opt_class();
          v78 = objc_msgSend_classification(v71, v73, v74, v75, v76, v77);
          if (objc_msgSend_isStrokeClassificationTextOrMath_(v72, v79, v78, v80, v81, v82))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_addObject_(v525, v83, (uint64_t)v71, v85, v86, v87);
            }
            else
            {
              objc_msgSend_strokeIdentifiers(v71, v83, v84, v85, v86, v87);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_allObjects(v93, v94, v95, v96, v97, v98);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeProvider(self, v100, v101, v102, v103, v104);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v106, (uint64_t)v99, (uint64_t)v105, v107, v108);
              v109 = (void *)objc_claimAutoreleasedReturnValue();

              v115 = objc_msgSend_ancestorIdentifier(v71, v110, v111, v112, v113, v114);
              objc_msgSend_strokeGroupFromStrokes_ancestorIdentifier_(self, v116, (uint64_t)v109, v115, v117, v118);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v525, v120, (uint64_t)v119, v121, v122, v123);

            }
            v592 = 0u;
            v593 = 0u;
            v590 = 0u;
            v591 = 0u;
            objc_msgSend_strokeIdentifiers(v71, v88, v89, v90, v91, v92);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            v530 = v124;
            v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v125, (uint64_t)&v590, (uint64_t)v618, 16, v126);
            if (v127)
            {
              v535 = *(_QWORD *)v591;
              do
              {
                v540 = v127;
                for (k = 0; k != v540; ++k)
                {
                  if (*(_QWORD *)v591 != v535)
                    objc_enumerationMutation(v530);
                  v134 = *(_QWORD *)(*((_QWORD *)&v590 + 1) + 8 * k);
                  objc_msgSend_array(MEMORY[0x1E0C99DE8], v128, v129, v130, v131, v132);
                  v135 = (void *)objc_claimAutoreleasedReturnValue();
                  v588 = 0u;
                  v589 = 0u;
                  v586 = 0u;
                  v587 = 0u;
                  v543 = (id)v134;
                  objc_msgSend_objectForKey_(v526, v136, v134, v137, v138, v139);
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v140, v141, (uint64_t)&v586, (uint64_t)v617, 16, v142);
                  if (v143)
                  {
                    v144 = *(_QWORD *)v587;
                    do
                    {
                      for (m = 0; m != v143; ++m)
                      {
                        if (*(_QWORD *)v587 != v144)
                          objc_enumerationMutation(v140);
                        v146 = *(_QWORD *)(*((_QWORD *)&v586 + 1) + 8 * m);
                        v147 = [CHSubstrokePlacement alloc];
                        v152 = (void *)objc_msgSend_initWithSubstroke_(v147, v148, v146, v149, v150, v151);
                        objc_msgSend_setWritingOrientation_(v152, v153, v154, v155, v156, v157, self->_defaultOrientationVector.dx, self->_defaultOrientationVector.dy);
                        objc_msgSend_addObject_(v135, v158, (uint64_t)v152, v159, v160, v161);

                      }
                      v143 = objc_msgSend_countByEnumeratingWithState_objects_count_(v140, v162, (uint64_t)&v586, (uint64_t)v617, 16, v163);
                    }
                    while (v143);
                  }

                  objc_msgSend_setObject_forKey_(v534, v164, (uint64_t)v135, (uint64_t)v543, v165, v166);
                }
                v124 = v530;
                v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v530, v128, (uint64_t)&v590, (uint64_t)v618, 16, v132);
              }
              while (v127);
            }

          }
        }
        v514 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v69, (uint64_t)&v594, (uint64_t)v619, 16, v70);
      }
      while (v514);
    }
  }

  objc_msgSend_strokeProvider(self, v167, v168, v169, v170, v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v172)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v173 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v173, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v173, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
    }

  }
  v584 = 0u;
  v585 = 0u;
  v582 = 0u;
  v583 = 0u;
  v517 = v516;
  v536 = objc_msgSend_countByEnumeratingWithState_objects_count_(v517, v174, (uint64_t)&v582, (uint64_t)v616, 16, v175);
  if (v536)
  {
    v531 = *(id *)v583;
    do
    {
      for (n = 0; n != (id)v536; n = (char *)n + 1)
      {
        if (*(id *)v583 != v531)
          objc_enumerationMutation(v517);
        v181 = *(void **)(*((_QWORD *)&v582 + 1) + 8 * (_QWORD)n);
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v176, v177, v178, v179, v180);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        v580 = 0u;
        v581 = 0u;
        v578 = 0u;
        v579 = 0u;
        v541 = v181;
        objc_msgSend_encodedStrokeIdentifier(v181, v183, v184, v185, v186, v187);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v526, v189, (uint64_t)v188, v190, v191, v192);
        v193 = (void *)objc_claimAutoreleasedReturnValue();

        v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v194, (uint64_t)&v578, (uint64_t)v615, 16, v195);
        if (v196)
        {
          v197 = *(_QWORD *)v579;
          do
          {
            for (ii = 0; ii != v196; ++ii)
            {
              if (*(_QWORD *)v579 != v197)
                objc_enumerationMutation(v193);
              v199 = *(_QWORD *)(*((_QWORD *)&v578 + 1) + 8 * ii);
              v200 = [CHSubstrokePlacement alloc];
              v205 = (void *)objc_msgSend_initWithSubstroke_(v200, v201, v199, v202, v203, v204);
              objc_msgSend_setWritingOrientation_(v205, v206, v207, v208, v209, v210, self->_defaultOrientationVector.dx, self->_defaultOrientationVector.dy);
              objc_msgSend_addObject_(v182, v211, (uint64_t)v205, v212, v213, v214);

            }
            v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v193, v215, (uint64_t)&v578, (uint64_t)v615, 16, v216);
          }
          while (v196);
        }

        objc_msgSend_encodedStrokeIdentifier(v541, v217, v218, v219, v220, v221);
        v222 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v534, v223, (uint64_t)v182, (uint64_t)v222, v224, v225);

      }
      v536 = objc_msgSend_countByEnumeratingWithState_objects_count_(v517, v176, (uint64_t)&v582, (uint64_t)v616, 16, v180);
    }
    while (v536);
  }

  objc_msgSend_set(MEMORY[0x1E0C99E20], v226, v227, v228, v229, v230);
  v510 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v231, v232, v233, v234, v235);
  v513 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v236, v237, v238, v239, v240);
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v241 = (id)qword_1EF568E30;
  if (os_log_type_enabled(v241, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_strategyIdentifier(self, v242, v243, v244, v245, v246);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    v253 = objc_msgSend_count(v517, v248, v249, v250, v251, v252);
    v259 = objc_msgSend_count(v521, v254, v255, v256, v257, v258);
    *(_DWORD *)buf = 138412802;
    v610 = v247;
    v611 = 2048;
    v612 = v253;
    v613 = 2048;
    v614 = v259;
    _os_log_impl(&dword_1BE607000, v241, OS_LOG_TYPE_DEBUG, "Stroke Grouping with strategy %@. Added strokes: %ld, removed strokes: %ld", buf, 0x20u);

  }
  if (objc_msgSend_count(v521, v260, v261, v262, v263, v264))
  {
    v576 = 0u;
    v577 = 0u;
    v574 = 0u;
    v575 = 0u;
    v270 = v521;
    v277 = objc_msgSend_countByEnumeratingWithState_objects_count_(v270, v271, (uint64_t)&v574, (uint64_t)v608, 16, v272);
    if (v277)
    {
      v278 = *(_QWORD *)v575;
      do
      {
        for (jj = 0; jj != v277; ++jj)
        {
          if (*(_QWORD *)v575 != v278)
            objc_enumerationMutation(v270);
          objc_msgSend_removeObjectForKey_(v534, v273, *(_QWORD *)(*((_QWORD *)&v574 + 1) + 8 * jj), v274, v275, v276);
        }
        v277 = objc_msgSend_countByEnumeratingWithState_objects_count_(v270, v273, (uint64_t)&v574, (uint64_t)v608, 16, v276);
      }
      while (v277);
    }

  }
  objc_msgSend_set(MEMORY[0x1E0C99E20], v265, v266, v267, v268, v269);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v280, v281, (uint64_t)v517, v282, v283, v284);
  v542 = (void *)objc_msgSend_mutableCopy(v507, v285, v286, v287, v288, v289);
  v519 = 0;
  do
  {
    if ((v512[2]() & 1) != 0)
      break;
    v508 = objc_msgSend_count(v542, v290, v291, v292, v293, v294);
    v572 = 0u;
    v573 = 0u;
    v570 = 0u;
    v571 = 0u;
    obja = v525;
    v297 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v295, (uint64_t)&v570, (uint64_t)v607, 16, v296);
    if (v297)
    {
      v528 = *(_QWORD *)v571;
      do
      {
        v532 = (id)v297;
        for (kk = 0; kk != v532; kk = (char *)kk + 1)
        {
          if (*(_QWORD *)v571 != v528)
            objc_enumerationMutation(obja);
          v545 = *(id *)(*((_QWORD *)&v570 + 1) + 8 * (_QWORD)kk);
          objc_msgSend_strokeIdentifiers(v545, v298, v299, v300, v301, v302);
          v304 = (void *)objc_claimAutoreleasedReturnValue();
          isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v304, v305, (uint64_t)v542, v306, v307, v308);

          if ((isSubsetOfSet & 1) == 0)
          {
            objc_msgSend_strokeIdentifiers(v545, v298, v299, v300, v301, v302);
            v310 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_minusSet_(v542, v311, (uint64_t)v310, v312, v313, v314);

            v315 = (void *)MEMORY[0x1E0C99E20];
            objc_msgSend_strokeIdentifiers(v545, v316, v317, v318, v319, v320);
            v321 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setWithSet_(v315, v322, (uint64_t)v321, v323, v324, v325);
            v537 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_minusSet_(v537, v326, (uint64_t)v521, v327, v328, v329);
            v568 = 0u;
            v569 = 0u;
            v566 = 0u;
            v567 = 0u;
            v330 = v537;
            v333 = objc_msgSend_countByEnumeratingWithState_objects_count_(v330, v331, (uint64_t)&v566, (uint64_t)v606, 16, v332);
            if (v333)
            {
              v334 = *(_QWORD *)v567;
              do
              {
                for (mm = 0; mm != v333; ++mm)
                {
                  if (*(_QWORD *)v567 != v334)
                    objc_enumerationMutation(v330);
                  v336 = *(_QWORD *)(*((_QWORD *)&v566 + 1) + 8 * mm);
                  v337 = (void *)objc_opt_class();
                  objc_msgSend_strokeForIdentifier_inStrokeProvider_(v337, v338, v336, (uint64_t)v172, v339, v340);
                  v345 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v345)
                    objc_msgSend_addObject_(v280, v341, (uint64_t)v345, v342, v343, v344);

                }
                v333 = objc_msgSend_countByEnumeratingWithState_objects_count_(v330, v346, (uint64_t)&v566, (uint64_t)v606, 16, v347);
              }
              while (v333);
            }

            v353 = objc_msgSend_count(v330, v348, v349, v350, v351, v352);
            objc_msgSend_strokeIdentifiers(v545, v354, v355, v356, v357, v358);
            v359 = (void *)objc_claimAutoreleasedReturnValue();
            v365 = v353 == objc_msgSend_count(v359, v360, v361, v362, v363, v364);

            if (v365)
            {
              objc_msgSend_addObject_(v515, v366, (uint64_t)v545, v367, v368, v369);
            }
            else
            {
              objc_msgSend_addObject_(v513, v366, (uint64_t)v545, v367, v368, v369);
              v519 |= objc_msgSend_count(v330, v370, v371, v372, v373, v374) != 0;
            }

          }
        }
        v297 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v298, (uint64_t)&v570, (uint64_t)v607, 16, v302);
      }
      while (v297);
    }

  }
  while (objc_msgSend_count(v542, v375, v376, v377, v378, v379) != v508);
  if (objc_msgSend_count(v517, v290, v291, v292, v293, v294))
  {
    objc_msgSend_firstObject(v517, v380, v381, v382, v383, v384);
    v538 = (void *)objc_claimAutoreleasedReturnValue();
    v564 = 0u;
    v565 = 0u;
    v562 = 0u;
    v563 = 0u;
    v546 = v280;
    v387 = 0;
    v392 = objc_msgSend_countByEnumeratingWithState_objects_count_(v546, v385, (uint64_t)&v562, (uint64_t)v605, 16, v386);
    if (v392)
    {
      v393 = *(_QWORD *)v563;
      do
      {
        for (nn = 0; nn != v392; ++nn)
        {
          if (*(_QWORD *)v563 != v393)
            objc_enumerationMutation(v546);
          v395 = *(void **)(*((_QWORD *)&v562 + 1) + 8 * nn);
          if ((objc_msgSend_containsObject_(v517, v388, (uint64_t)v395, v389, v390, v391) & 1) == 0)
          {
            objc_msgSend_strokeIdentifier(v395, v388, v396, v389, v390, v391);
            v397 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIdentifier(v538, v398, v399, v400, v401, v402);
            v403 = (void *)objc_claimAutoreleasedReturnValue();
            v407 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v172, v404, (uint64_t)v397, (uint64_t)v403, v405, v406) == -1;

            if (v407)
              v387 = 1;
          }
        }
        v392 = objc_msgSend_countByEnumeratingWithState_objects_count_(v546, v388, (uint64_t)&v562, (uint64_t)v605, 16, v391);
      }
      while (v392);
    }

    v408 = v387 & 1;
  }
  else
  {
    v408 = 0;
  }
  v409 = objc_msgSend_count(v280, v380, v381, v382, v383, v384);
  v420 = v519 | v408;
  if (((v409 > objc_msgSend_count(v517, v410, v411, v412, v413, v414)) & (v519 | v408)) == 1)
  {
    objc_msgSend_allObjects(v280, v415, v416, v417, v418, v419);
    v421 = (void *)objc_claimAutoreleasedReturnValue();
    v560[0] = MEMORY[0x1E0C809B0];
    v560[1] = 3221225472;
    v560[2] = sub_1BE860830;
    v560[3] = &unk_1E77F30F0;
    v561 = v172;
    objc_msgSend_sortedArrayUsingComparator_(v421, v422, (uint64_t)v560, v423, v424, v425);
    v426 = objc_claimAutoreleasedReturnValue();

    v517 = (id)v426;
  }
  if ((v420 & 1) != 0)
    objc_msgSend_minusSet_(v525, v415, (uint64_t)v515, v417, v418, v419);
  objc_msgSend_minusSet_(v525, v415, (uint64_t)v513, v417, v418, v419);
  v509 = (void *)objc_msgSend_mutableCopy(v513, v427, v428, v429, v430, v431);
  objc_msgSend_unionSet_(v509, v432, (uint64_t)v515, v433, v434, v435);
  v558 = 0u;
  v559 = 0u;
  v556 = 0u;
  v557 = 0u;
  v506 = v517;
  v438 = objc_msgSend_countByEnumeratingWithState_objects_count_(v506, v436, (uint64_t)&v556, (uint64_t)v604, 16, v437);
  if (v438)
  {
    v439 = *(_QWORD *)v557;
LABEL_115:
    v440 = 0;
    while (1)
    {
      if (*(_QWORD *)v557 != v439)
        objc_enumerationMutation(v506);
      v441 = *(void **)(*((_QWORD *)&v556 + 1) + 8 * v440);
      if ((v512[2]() & 1) != 0)
        break;
      v442 = (void *)MEMORY[0x1C3B818B0]();
      sub_1BE8608D8((uint64_t)self, v525, v510, v513, v441, 0, v534, v509, 1, v512);
      objc_msgSend_mergeGroupsPostProcessing_createdGroups_deletedGroups_availableGroupingStrategies_allowOppositeOrientations_(self, v443, (uint64_t)v525, (uint64_t)v510, (uint64_t)v513, 0, 0);
      objc_autoreleasePoolPop(v442);
      if (v438 == ++v440)
      {
        v438 = objc_msgSend_countByEnumeratingWithState_objects_count_(v506, v444, (uint64_t)&v556, (uint64_t)v604, 16, v445);
        if (v438)
          goto LABEL_115;
        break;
      }
    }
  }

  if ((v420 & 1) != 0)
  {
    v451 = v509;
    if (!objc_msgSend_count(v515, v446, v447, v448, v449, v450) || (v512[2]() & 1) != 0)
      goto LABEL_145;
    objc_msgSend_set(MEMORY[0x1E0C99E20], v452, v453, v454, v455, v456);
    objb = (id)objc_claimAutoreleasedReturnValue();
    v554 = 0u;
    v555 = 0u;
    v552 = 0u;
    v553 = 0u;
    v520 = v510;
    v533 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v520, v457, (uint64_t)&v552, (uint64_t)v603, 16, v458);
    if (v533)
    {
      v529 = *(_QWORD *)v553;
      do
      {
        for (i1 = 0; i1 != v533; i1 = (char *)i1 + 1)
        {
          if (*(_QWORD *)v553 != v529)
            objc_enumerationMutation(v520);
          v459 = *(void **)(*((_QWORD *)&v552 + 1) + 8 * (_QWORD)i1);
          v548 = 0u;
          v549 = 0u;
          v550 = 0u;
          v551 = 0u;
          v547 = v515;
          v467 = objc_msgSend_countByEnumeratingWithState_objects_count_(v547, v460, (uint64_t)&v548, (uint64_t)v602, 16, v461);
          if (v467)
          {
            v468 = *(_QWORD *)v549;
LABEL_131:
            v469 = 0;
            while (1)
            {
              if (*(_QWORD *)v549 != v468)
                objc_enumerationMutation(v547);
              v470 = *(void **)(*((_QWORD *)&v548 + 1) + 8 * v469);
              objc_msgSend_strokeIdentifiers(v459, v462, v463, v464, v465, v466);
              v471 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIdentifiers(v470, v472, v473, v474, v475, v476);
              v477 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToSet = objc_msgSend_isEqualToSet_(v471, v478, (uint64_t)v477, v479, v480, v481);

              if (isEqualToSet)
                break;
              if (v467 == ++v469)
              {
                v467 = objc_msgSend_countByEnumeratingWithState_objects_count_(v547, v462, (uint64_t)&v548, (uint64_t)v602, 16, v466);
                if (v467)
                  goto LABEL_131;
                goto LABEL_137;
              }
            }
            v487 = v470;
            objc_msgSend_removeObject_(v525, v488, (uint64_t)v459, v489, v490, v491);
            objc_msgSend_addObject_(v525, v492, (uint64_t)v487, v493, v494, v495);

            if (!v487)
              goto LABEL_140;
            objc_msgSend_removeObject_(v547, v483, (uint64_t)v487, v484, v485, v486);
          }
          else
          {
LABEL_137:

LABEL_140:
            v487 = 0;
            objc_msgSend_addObject_(objb, v483, (uint64_t)v459, v484, v485, v486);
          }

        }
        v533 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v520, v496, (uint64_t)&v552, (uint64_t)v603, 16, v497);
      }
      while (v533);
    }

    v510 = objb;
    objc_msgSend_unionSet_(v513, v498, (uint64_t)v515, v499, v500, v501);

  }
  v451 = v509;
LABEL_145:
  if ((v512[2]() & 1) != 0)
  {
    v502 = 0;
  }
  else
  {
    v503 = [CHBottomUpStrokeGroupingResult alloc];
    v502 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_substrokePlacementsByStrokeIdentifier_(v503, v504, (uint64_t)v525, (uint64_t)v510, (uint64_t)v513, (uint64_t)v534);
  }

  return v502;
}

- (id)strokeGroupFromStrokes:(id)a3 ancestorIdentifier:(int64_t)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
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
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  double x;
  double y;
  double width;
  double height;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  uint64_t v75;
  CHSubstrokePlacement *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGVector defaultOrientationVector;
  const char *v103;
  uint64_t v104;
  id v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  char *v113;
  void *v114;
  void *v115;
  CHTextLineStrokeGroup *v116;
  int64_t textStrokeClassification;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  CGVector v124;
  CGVector v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  int64_t v142;
  void *v143;
  void *v144;
  id v145;
  id obj;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  uint64_t i;
  double v151;
  void *__p;
  unint64_t v153;
  char *v154;
  id v155;
  CGVector defaultDeviationVector;
  CGVector v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _BYTE v166[128];
  _BYTE v167[128];
  uint64_t v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;

  v168 = *MEMORY[0x1E0C80C00];
  v145 = a3;
  objc_msgSend_firstObject(v145, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodedStrokeIdentifier(v11, v12, v13, v14, v15, v16);
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lastObject(v145, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodedStrokeIdentifier(v22, v23, v24, v25, v26, v27);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = a4;

  v28 = (void *)MEMORY[0x1E0C99E20];
  v34 = objc_msgSend_count(v145, v29, v30, v31, v32, v33);
  objc_msgSend_setWithCapacity_(v28, v35, v34, v36, v37, v38);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v39, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  obj = v145;
  v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v162, (uint64_t)v167, 16, v50);
  if (v51)
  {
    v149 = v51;
    v147 = *(_QWORD *)v163;
    do
    {
      for (i = 0; i != v149; ++i)
      {
        if (*(_QWORD *)v163 != v147)
          objc_enumerationMutation(obj);
        v57 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * i);
        objc_msgSend_encodedStrokeIdentifier(v57, v52, v53, v54, v55, v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v148, v59, (uint64_t)v58, v60, v61, v62);

        v63 = (void *)objc_opt_class();
        objc_msgSend_substrokesForStroke_(v63, v64, (uint64_t)v57, v65, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = 0u;
        v161 = 0u;
        v158 = 0u;
        v159 = 0u;
        v69 = v68;
        v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v158, (uint64_t)v166, 16, v71);
        if (v72)
        {
          v73 = *(_QWORD *)v159;
          do
          {
            for (j = 0; j != v72; ++j)
            {
              if (*(_QWORD *)v159 != v73)
                objc_enumerationMutation(v69);
              v75 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * j);
              v76 = [CHSubstrokePlacement alloc];
              v81 = (void *)objc_msgSend_initWithSubstroke_(v76, v77, v75, v78, v79, v80);
              objc_msgSend_setWritingOrientation_(v81, v82, v83, v84, v85, v86, self->_defaultOrientationVector.dx, self->_defaultOrientationVector.dy);
              objc_msgSend_addObject_(v44, v87, (uint64_t)v81, v88, v89, v90);

            }
            v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v91, (uint64_t)&v158, (uint64_t)v166, 16, v92);
          }
          while (v72);
        }

        objc_msgSend_bounds(v57, v93, v94, v95, v96, v97);
        v171.origin.x = v98;
        v171.origin.y = v99;
        v171.size.width = v100;
        v171.size.height = v101;
        v169.origin.x = x;
        v169.origin.y = y;
        v169.size.width = width;
        v169.size.height = height;
        v170 = CGRectUnion(v169, v171);
        x = v170.origin.x;
        y = v170.origin.y;
        width = v170.size.width;
        height = v170.size.height;

      }
      v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v162, (uint64_t)v167, 16, v56);
    }
    while (v149);
  }

  defaultOrientationVector = self->_defaultOrientationVector;
  defaultDeviationVector = self->_defaultDeviationVector;
  v157 = defaultOrientationVector;
  v155 = v44;
  objc_msgSend_estimateWritingDirectionAndSortSubstrokesAccordingly_averageWritingOrientation_averageStrokeDeviation_(self, v103, (uint64_t)&v155, (uint64_t)&v157, (uint64_t)&defaultDeviationVector, v104);
  v105 = v155;

  __p = 0;
  v153 = 0;
  v154 = 0;
  v111 = objc_msgSend_count(obj, v106, v107, v108, v109, v110);
  v112 = v111;
  if (v111)
  {
    if (v111 >> 60)
      sub_1BE61F930();
    v113 = (char *)operator new(16 * v111);
    __p = &v113[v153 & 0xFFFFFFFFFFFFFFF0];
    v153 = (unint64_t)__p;
    v154 = &v113[16 * v112];
  }
  sub_1BE8627BC((uint64_t)self, v105, (uint64_t *)&__p);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1BE862D88(self, v105, defaultDeviationVector.dx, defaultDeviationVector.dy);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = sub_1BE8636C8(self, v105, v114, v157.dx, v157.dy);
  v116 = [CHTextLineStrokeGroup alloc];
  textStrokeClassification = self->_textStrokeClassification;
  objc_msgSend_strategyIdentifier(self, v118, v119, v120, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v157;
  v125 = defaultDeviationVector;
  objc_msgSend_firstObject(obj, v126, v127, v128, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v131, v132, v133, v134, v135, v136);
  v140 = (void *)objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_strategyIdentifier_writingDirectionSortedSubstrokes_averageWritingOrientation_averageStrokeDeviation_writingDirectionSortedStrokeIdentifiers_localStrokeWritingOrientations_coalescedLastSubstrokes_groupingConfidence_firstStrokeOrigin_(v116, v137, v142, (uint64_t)v148, (uint64_t)v143, (uint64_t)v144, textStrokeClassification, v123, x, y, width, height, v124, v125, v105, v114, &__p, v115, *(_QWORD *)&v151,
                   v138,
                   v139);

  if (__p)
  {
    v153 = (unint64_t)__p;
    operator delete(__p);
  }

  return v140;
}

- (id)strokeGroupMergingGroup:(id)a3 withGroup:(id)a4
{
  sub_1BE863EF8(self, a3, a4, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8
{
  double v8;
  CGFloat dy;
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
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double *v53;
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
  double *v64;
  unint64_t v65;
  double v66;
  double *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  double *v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  _QWORD *v99;
  double v100;
  double v101;
  NSObject *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  double v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  double v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  double MidX;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  double MidY;
  double v146;
  float v147;
  __float2 v148;
  double v149;
  double v150;
  double v151;
  float v152;
  __float2 v153;
  void *v154;
  double v155;
  CHDrawing *v156;
  const char *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t *v163;
  _QWORD *v164;
  _BYTE *v165;
  _BYTE *v166;
  int64_t v167;
  char *v168;
  char *v169;
  _QWORD *v170;
  _QWORD *v171;
  unint64_t v172;
  uint64_t v173;
  const void *v174;
  unint64_t v175;
  unint64_t v176;
  char *v177;
  char *v178;
  char *v179;
  int64_t v180;
  char *v181;
  char *v182;
  char *v183;
  __int128 v184;
  _QWORD *v185;
  _QWORD *v186;
  void *v187;
  void *v188;
  CHDrawing *v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  CHDrawing *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  CHDrawing *v207;
  double v208;
  double v209;
  NSObject *v210;
  CHDrawing *v211;
  char *v212;
  unint64_t v213;
  uint64_t v214;
  char *v215;
  uint64_t v216;
  unint64_t v217;
  CHDrawing *v218;
  char *v219;
  char *v220;
  void *v221;
  char *v222;
  void *v223;
  void *v224;
  NSObject *v225;
  CHBottomUpStrokeGroupingStrategy *v227;
  double v228;
  double v229;
  void *v230;
  double *v231;
  double dx;
  id v233;
  id v234;
  id v238;
  id v239;
  double v240;
  double v241;
  id v242;
  _QWORD *v243;
  unint64_t v244;
  void *v245;
  CHDrawing *v246;
  double v247;
  void *v248;
  __int128 v249;
  uint64_t v250;
  uint64_t *v251;
  uint64_t v252;
  __n128 (*v253)(__n128 *, __n128 *);
  void (*v254)(uint64_t);
  void *v255;
  void *__p;
  void *v257;
  uint64_t v258;
  uint64_t v259;
  double *v260;
  uint64_t v261;
  unint64_t v262;
  uint64_t v263;
  double *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  double *v268;
  uint64_t v269;
  unint64_t v270;
  uint64_t v271;
  double *v272;
  uint64_t v273;
  uint64_t v274;
  char *v275;
  char *v276;
  __int128 v277;
  char *v278;
  _BYTE buf[24];
  void *v280;
  CHDrawing *v281;
  uint64_t *v282;
  uint64_t *v283;
  uint64_t *v284;
  uint64_t *v285;
  uint64_t *v286;
  double v287;
  double v288;
  double cosval;
  double v290;
  double v291;
  double sinval;
  uint64_t v293;
  CGRect v294;
  CGRect v295;

  dy = a4.dy;
  dx = a4.dx;
  v293 = *MEMORY[0x1E0C80C00];
  v238 = a3;
  objc_opt_class();
  v231 = a7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v238;
    v23 = 0;
    if (v22)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_strokeIdentifiers(v238, v12, v13, v14, v15, v16);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeProvider(self, v69, v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedStrokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v75, (uint64_t)v68, (uint64_t)v74, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v78, v79, v80, v81, v82, v83))
    {
      v89 = objc_msgSend_ancestorIdentifier(v238, v84, v85, v86, v87, v88);
      objc_msgSend_strokeGroupFromStrokes_ancestorIdentifier_(self, v90, (uint64_t)v78, v89, v91, v92);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      v22 = v23;
      if (v23)
      {
LABEL_3:
        objc_msgSend_writingDirectionSortedStrokeIdentifiers(v22, v17, v18, v19, v20, v21);
        v239 = v22;
        v233 = v23;
        v234 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokesForIdentifiers_(self, v24, (uint64_t)v234, v25, v26, v27);
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_writingDirectionSortedSubstrokes(v22, v28, v29, v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v33, v34, 0, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeDeviation(v38, v39, v40, v41, v42, v43);
        v45 = v44;
        v47 = v46;

        v248 = 0;
        v249 = 0uLL;
        v53 = *(double **)objc_msgSend_localStrokeWritingOrientations(v22, v48, v49, v50, v51, v52);
        v64 = *(double **)(objc_msgSend_localStrokeWritingOrientations(v22, v54, v55, v56, v57, v58) + 8);
        if (v53 == v64)
        {
          v66 = 0.0;
          goto LABEL_14;
        }
        v65 = (char *)v64 - (char *)v53 - 16;
        if (v65 >= 0x10)
        {
          v93 = (v65 >> 4) + 1;
          v67 = &v53[2 * (v93 & 0x1FFFFFFFFFFFFFFELL)];
          v94 = v53 + 2;
          v66 = 0.0;
          v95 = v93 & 0x1FFFFFFFFFFFFFFELL;
          do
          {
            v96 = *(v94 - 2);
            v97 = *v94;
            v94 += 4;
            v66 = v66 + v96 + v97;
            v95 -= 2;
          }
          while (v95);
          if (v93 == (v93 & 0x1FFFFFFFFFFFFFFELL))
          {
LABEL_14:
            v99 = (_QWORD *)objc_msgSend_localStrokeWritingOrientations(v22, v59, v60, v61, v62, v63);
            v229 = dy;
            v100 = (double)(unint64_t)((uint64_t)(v99[1] - *v99) >> 4);
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v101 = v66 / v100;
            v102 = (id)qword_1EF568E30;
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
            {
              v108 = **(_QWORD **)objc_msgSend_localStrokeWritingOrientations(v22, v103, v104, v105, v106, v107);
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)&buf[4] = v108;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v101;
              _os_log_impl(&dword_1BE607000, v102, OS_LOG_TYPE_DEBUG, "Normalizing a drawing here with a local orientations on x = %f (first), %f (average)", buf, 0x16u);
            }
            v228 = v101;

            v243 = (_QWORD *)objc_msgSend_localStrokeWritingOrientations(v22, v109, v110, v111, v112, v113);
            v114 = v230;
            v227 = self;
            if (self)
            {
              v115 = atan2(self->_defaultOrientationVector.dy, self->_defaultOrientationVector.dx);
              v242 = v114;
              v121 = objc_msgSend_count(v114, v116, v117, v118, v119, v120);
              sub_1BE7A45C8((uint64_t)&v248, v121);
              v271 = 0;
              v272 = (double *)&v271;
              v273 = 0x2020000000;
              v274 = 0x7FEFFFFFFFFFFFFFLL;
              v267 = 0;
              v268 = (double *)&v267;
              v269 = 0x2020000000;
              v270 = 0xFFEFFFFFFFFFFFFFLL;
              v263 = 0;
              v264 = (double *)&v263;
              v265 = 0x2020000000;
              v266 = 0x7FEFFFFFFFFFFFFFLL;
              v259 = 0;
              v260 = (double *)&v259;
              v261 = 0x2020000000;
              v262 = 0xFFEFFFFFFFFFFFFFLL;
              v246 = objc_alloc_init(CHDrawing);
              v127 = 0;
              v240 = v47 * -2.0;
              v241 = v45 * -2.0;
              while (v127 < objc_msgSend_count(v114, v122, v123, v124, v125, v126, v227, *(_QWORD *)&v228))
              {
                objc_msgSend_objectAtIndexedSubscript_(v114, v128, v127, v129, v130, v131);
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                v133 = atan2(*(long double *)(*v243 + 16 * v127 + 8), *(long double *)(*v243 + 16 * v127));
                objc_msgSend_bounds(v132, v134, v135, v136, v137, v138);
                MidX = CGRectGetMidX(v294);
                objc_msgSend_bounds(v132, v140, v141, v142, v143, v144);
                MidY = CGRectGetMidY(v295);
                v146 = v115 + v133;
                v147 = v146;
                v148 = __sincosf_stret(v147);
                if (v127)
                {
                  v149 = v101;
                  v101 = MidY;
                  v150 = v8;
                  v151 = v45;
                  v146 = atan2(*(double *)(*v243 + 16 * v127 - 8) + *(double *)(*v243 + 16 * v127 + 8), *(double *)(*v243 + 16 * v127 - 16) + *(double *)(*v243 + 16 * v127));
                }
                else
                {
                  v151 = MidX + v241 * v148.__cosval;
                  v101 = MidY;
                  v149 = MidY + v240 * v148.__sinval;
                  v247 = 0.0;
                  v150 = 0.0;
                }
                v152 = v115 + v146;
                v153 = __sincosf_stret(v152);
                v250 = 0;
                v251 = &v250;
                v252 = 0x4812000000;
                v253 = sub_1BE8654E0;
                v254 = sub_1BE865504;
                v255 = &unk_1BE94989A;
                v257 = 0;
                v258 = 0;
                __p = 0;
                v245 = v132;
                v154 = (void *)objc_opt_class();
                v155 = v247 + (v101 - v149) * v153.__sinval + (MidX - v151) * v153.__cosval;
                *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                *(_QWORD *)&buf[8] = 3221225472;
                v8 = v150 + (v101 - v149) * v153.__cosval - (MidX - v151) * v153.__sinval;
                *(_QWORD *)&buf[16] = sub_1BE86551C;
                v280 = &unk_1E77F6410;
                v156 = v246;
                v247 = v155;
                v287 = v155;
                v288 = v8;
                cosval = v148.__cosval;
                v290 = MidX;
                v291 = v101;
                sinval = v148.__sinval;
                v281 = v156;
                v282 = &v250;
                v283 = &v271;
                v284 = &v267;
                v285 = &v263;
                v286 = &v259;
                objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v154, v157, (uint64_t)v132, 0, 1, (uint64_t)buf);
                v163 = v251;
                v164 = (_QWORD *)v249;
                v244 = v127;
                if ((unint64_t)v249 >= *((_QWORD *)&v249 + 1))
                {
                  v171 = v248;
                  v172 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v249 - (_QWORD)v248) >> 3);
                  if (v172 + 1 > 0xAAAAAAAAAAAAAAALL)
                    sub_1BE61F930();
                  v174 = (const void *)v251[6];
                  v173 = v251[7];
                  v175 = 0x5555555555555556 * ((uint64_t)(*((_QWORD *)&v249 + 1) - (_QWORD)v248) >> 3);
                  if (v175 <= v172 + 1)
                    v175 = v172 + 1;
                  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v249 + 1) - (_QWORD)v248) >> 3) >= 0x555555555555555)
                    v176 = 0xAAAAAAAAAAAAAAALL;
                  else
                    v176 = v175;
                  v278 = (char *)&v249 + 8;
                  if (v176)
                  {
                    if (v176 > 0xAAAAAAAAAAAAAAALL)
                      sub_1BE61F100();
                    v177 = (char *)operator new(24 * v176);
                  }
                  else
                  {
                    v177 = 0;
                  }
                  v178 = &v177[24 * v172];
                  v275 = v177;
                  v276 = v178;
                  v179 = &v177[24 * v176];
                  *((_QWORD *)v178 + 1) = 0;
                  *(_QWORD *)&v277 = v178;
                  *((_QWORD *)&v277 + 1) = v179;
                  *((_QWORD *)v178 + 2) = 0;
                  *(_QWORD *)v178 = 0;
                  v180 = v173 - (_QWORD)v174;
                  if (v180)
                  {
                    if (v180 < 0)
                      sub_1BE61F930();
                    v181 = (char *)operator new(v180);
                    *(_QWORD *)v178 = v181;
                    v182 = &v181[16 * (v180 >> 4)];
                    *((_QWORD *)v178 + 2) = v182;
                    memcpy(v181, v174, v180);
                    *((_QWORD *)v178 + 1) = v182;
                    v22 = v239;
                  }
                  v170 = v178 + 24;
                  *(_QWORD *)&v277 = v178 + 24;
                  if (v164 == v171)
                  {
                    v248 = v178;
                    *(_QWORD *)&v249 = v178 + 24;
                    *((_QWORD *)&v249 + 1) = v179;
                    v114 = v242;
                  }
                  else
                  {
                    do
                    {
                      v183 = v178;
                      *((_QWORD *)v178 - 2) = 0;
                      *((_QWORD *)v178 - 1) = 0;
                      v184 = *(_OWORD *)(v164 - 3);
                      v164 -= 3;
                      *(_OWORD *)(v178 - 24) = v184;
                      v178 -= 24;
                      *((_QWORD *)v183 - 1) = v164[2];
                      *v164 = 0;
                      v164[1] = 0;
                      v164[2] = 0;
                    }
                    while (v164 != v171);
                    v164 = v248;
                    v185 = (_QWORD *)v249;
                    v248 = v178;
                    v249 = v277;
                    v170 = (_QWORD *)v277;
                    v114 = v242;
                    if (v185 != v164)
                    {
                      v186 = v185;
                      do
                      {
                        v188 = (void *)*(v186 - 3);
                        v186 -= 3;
                        v187 = v188;
                        if (v188)
                        {
                          *(v185 - 2) = v187;
                          operator delete(v187);
                        }
                        v185 = v186;
                      }
                      while (v186 != v164);
                    }
                  }
                  if (v164)
                    operator delete(v164);
                }
                else
                {
                  *(_OWORD *)v249 = 0uLL;
                  v164[2] = 0;
                  v166 = (_BYTE *)v163[6];
                  v165 = (_BYTE *)v163[7];
                  v167 = v165 - v166;
                  if (v165 != v166)
                  {
                    if (v167 < 0)
                      sub_1BE61F930();
                    v168 = (char *)operator new(v165 - v166);
                    *v164 = v168;
                    v164[1] = v168;
                    v169 = &v168[16 * (v167 >> 4)];
                    v164[2] = v169;
                    memcpy(v168, v166, v167);
                    v164[1] = v169;
                  }
                  v170 = v164 + 3;
                }
                *(_QWORD *)&v249 = v170;
                if (v246)
                  objc_msgSend_endStroke(v156, v158, v159, v160, v161, v162);

                _Block_object_dispose(&v250, 8);
                if (__p)
                {
                  v257 = __p;
                  operator delete(__p);
                }

                v127 = v244 + 1;
                v45 = MidX;
              }
              v189 = objc_retainAutorelease(v246);
              v190 = v272[3];
              v191 = v264[3];
              v192 = v268[3];
              v193 = v260[3];

              v194 = v192 - v190;
              v195 = v193 - v191;
              _Block_object_dispose(&v259, 8);
              _Block_object_dispose(&v263, 8);
              _Block_object_dispose(&v267, 8);
              _Block_object_dispose(&v271, 8);
            }
            else
            {
              v189 = 0;
              v195 = 0.0;
              v194 = 0.0;
              v191 = 0.0;
              v190 = 0.0;
            }

            v196 = v189;
            objc_msgSend_setNormalizedSize_(v238, v197, v198, v199, v200, v201, v194, v195);
            v207 = objc_alloc_init(CHDrawing);
            v208 = 2.0;
            if (v195 >= 82.5)
              v208 = 1.0;
            if (v227)
              v209 = v208;
            else
              v209 = 0.0;
            if (fabs(v228 + 1.0) >= 0.1)
            {
              v212 = (char *)v248;
              if ((void *)v249 != v248)
              {
                v213 = 0;
                do
                {
                  v215 = &v212[24 * v213];
                  v214 = *(_QWORD *)v215;
                  if (*((_QWORD *)v215 + 1) != *(_QWORD *)v215)
                  {
                    v216 = 0;
                    v217 = 0;
                    do
                    {
                      objc_msgSend_addPoint_(v207, v202, v203, v204, v205, v206, dx + v209 * (*(double *)(v214 + v216) - v190), v229 + v209 * (*(double *)(v214 + v216 + 8) - v191), v227);
                      ++v217;
                      v214 = *((_QWORD *)v248 + 3 * v213);
                      v216 += 16;
                    }
                    while (v217 < (*((_QWORD *)v248 + 3 * v213 + 1) - v214) >> 4);
                  }
                  objc_msgSend_endStroke(v207, v202, v203, v204, v205, v206, v227);
                  ++v213;
                  v212 = (char *)v248;
                }
                while (v213 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v249 - (_QWORD)v248) >> 3));
              }
              if (a5)
                *a5 = objc_retainAutorelease(v196);
              if (a6)
                *a6 = objc_retainAutorelease(v234);
              if (v231)
                *v231 = v209;
              v211 = v207;
              if (!a8)
                goto LABEL_90;
            }
            else
            {
              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v210 = (id)qword_1EF568E30;
              if (os_log_type_enabled(v210, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BE607000, v210, OS_LOG_TYPE_DEBUG, "Suspect normalizing of a drawing where stroke order is flipped. Reverting.", buf, 2u);
              }

              if (a5)
                *a5 = objc_retainAutorelease(v196);
              if (a6)
                *a6 = objc_retainAutorelease(v234);
              if (v231)
                *v231 = v209;
              v211 = v196;
              if (!a8)
                goto LABEL_90;
            }
            *a8 = objc_retainAutorelease(v233);
LABEL_90:
            v218 = v211;

            v219 = (char *)v248;
            if (v248)
            {
              v220 = (char *)v249;
              v221 = v248;
              if ((void *)v249 != v248)
              {
                v222 = (char *)v249;
                do
                {
                  v224 = (void *)*((_QWORD *)v222 - 3);
                  v222 -= 24;
                  v223 = v224;
                  if (v224)
                  {
                    *((_QWORD *)v220 - 2) = v223;
                    operator delete(v223);
                  }
                  v220 = v222;
                }
                while (v222 != v219);
                v221 = v248;
              }
              *(_QWORD *)&v249 = v219;
              operator delete(v221);
            }

            v23 = v233;
            goto LABEL_105;
          }
        }
        else
        {
          v66 = 0.0;
          v67 = v53;
        }
        do
        {
          v98 = *v67;
          v67 += 2;
          v66 = v66 + v98;
        }
        while (v67 != v64);
        goto LABEL_14;
      }
    }
    else
    {
      v23 = 0;

      v22 = 0;
    }
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v225 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v225, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v225, OS_LOG_TYPE_ERROR, "Stroke group can't be nil and must be of CHTextLineStrokeGroup class. Returning empty drawing.", buf, 2u);
  }

  v218 = objc_alloc_init(CHDrawing);
LABEL_105:

  return v218;
}

- (void)getMergingEndOfLineCost:(double *)a3 mergingEndOfLineStroke:(id *)a4 forStroke:(id)a5 consistingOfSubstrokes:(id)a6 toLineGroup:(id)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t SubstrokeIndexBeforeMerge;
  id v39;
  void *v40;
  id v41;
  id v42;
  double v43;
  id v44;
  double v45;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v44 = 0;
  v45 = 10000.0;
  objc_msgSend_writingDirectionSortedSubstrokes(v14, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_count(v20, v21, v22, v23, v24, v25);
  sub_1BE8658B0((uint64_t)self, &v45, &v44, v12, v13, v14, v26 - 1);
  v27 = v44;

  if ((objc_msgSend_lastSubstrokeIndexBeforeMerge(v14, v28, v29, v30, v31, v32) & 0x8000000000000000) == 0)
  {
    v42 = 0;
    v43 = 0.0;
    SubstrokeIndexBeforeMerge = objc_msgSend_lastSubstrokeIndexBeforeMerge(v14, v33, v34, v35, v36, v37);
    sub_1BE8658B0((uint64_t)self, &v43, &v42, v12, v13, v14, SubstrokeIndexBeforeMerge);
    v39 = v42;
    v40 = v39;
    if (v43 < v45)
    {
      v45 = v43;
      v41 = v39;

      v27 = v41;
    }

  }
  if (a3)
    *a3 = v45;
  if (a4)
    *a4 = objc_retainAutorelease(v27);

}

- (void)getMergingMiddleOfLineCost:(double *)a3 mergingMiddleOfLineStroke:(id *)a4 forStroke:(id)a5 consistingOfSubstrokes:(id)a6 toLineGroup:(id)a7
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t i;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _BOOL4 v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  double v109;
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
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char isEqual;
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
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  double v157;
  double v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  double v164;
  double v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  double v171;
  double v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  double v196;
  double v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  double v203;
  double v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  unint64_t v215;
  double v216;
  double dx;
  double dy;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  double v230;
  double v231;
  double v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  double v238;
  double mergeMiddleDyCostCoeff;
  double mergeMiddleDxCostCoeff;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  double v247;
  double v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  double v260;
  double v261;
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
  uint64_t v272;
  double v273;
  double v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  double v286;
  double v287;
  double v288;
  double v289;
  double v290;
  id v291;
  double *v292;
  void *v294;
  id obj;
  uint64_t v296;
  uint64_t v297;
  uint64_t j;
  id v299;
  void *v300;
  id v301;
  double v302;
  double v303;
  double v304;
  double v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  void *v310;
  _BYTE v311[128];
  uint64_t v312;
  CGRect v313;
  CGRect v314;
  CGRect v315;

  v312 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v299 = a7;
  v300 = v11;
  objc_msgSend_set(MEMORY[0x1E0C99E20], v13, v14, v15, v16, v17);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v11, v18, v19, v20, v21, v22);
  v24 = v23;
  objc_msgSend_bounds(v11, v25, v26, v27, v28, v29);
  v31 = v30;
  objc_msgSend_bounds(v11, v32, v33, v34, v35, v36);
  v38 = v37;
  objc_msgSend_bounds(v11, v39, v40, v41, v42, v43);
  v45 = v44;
  objc_msgSend_bounds(v11, v46, v47, v48, v49, v50);
  v55 = sqrt(v38 * v45 + v24 * v31);
  if (v55 < 100.0)
    v55 = 100.0;
  v313 = CGRectInset(*(CGRect *)&v51, -v55, -v55);
  x = v313.origin.x;
  y = v313.origin.y;
  width = v313.size.width;
  height = v313.size.height;
  for (i = 0; ; ++i)
  {
    objc_msgSend_writingDirectionSortedSubstrokes(v299, v56, v57, v58, v59, v60);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend_count(v66, v67, v68, v69, v70, v71) - 1;

    if (i >= v72)
      break;
    objc_msgSend_writingDirectionSortedSubstrokes(v299, v73, v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v78, v79, i, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_substroke(v83, v84, v85, v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bounds(v89, v90, v91, v92, v93, v94);
    v315.origin.x = x;
    v315.origin.y = y;
    v315.size.width = width;
    v315.size.height = height;
    v95 = CGRectIntersectsRect(v314, v315);

    if (v95)
      objc_msgSend_addObject_(v294, v96, (uint64_t)v83, v97, v98, v99);

  }
  v308 = 0u;
  v309 = 0u;
  v306 = 0u;
  v307 = 0u;
  obj = v294;
  v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v100, (uint64_t)&v306, (uint64_t)v311, 16, v101);
  v292 = a3;
  if (v102)
  {
    v108 = 0;
    v301 = 0;
    v296 = *(_QWORD *)v307;
    v297 = v102;
    v109 = 10000.0;
    do
    {
      for (j = 0; j != v297; ++j)
      {
        if (*(_QWORD *)v307 != v296)
          objc_enumerationMutation(obj);
        v110 = *(void **)(*((_QWORD *)&v306 + 1) + 8 * j);
        if (!v108)
          goto LABEL_16;
        objc_msgSend_encodedStrokeIdentifier(v108, v103, v104, v105, v106, v107);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substroke(v110, v112, v113, v114, v115, v116);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeIdentifier(v117, v118, v119, v120, v121, v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v111, v124, (uint64_t)v123, v125, v126, v127);

        if ((isEqual & 1) == 0)
        {
LABEL_16:
          v134 = (void *)objc_opt_class();
          objc_msgSend_substroke(v110, v135, v136, v137, v138, v139);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeIdentifier(v140, v141, v142, v143, v144, v145);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeProvider(self, v147, v148, v149, v150, v151);
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeForIdentifier_inStrokeProvider_(v134, v153, (uint64_t)v146, (uint64_t)v152, v154, v155);
          v156 = objc_claimAutoreleasedReturnValue();

          v108 = (void *)v156;
        }
        objc_msgSend_averageWritingOrientation(v299, v129, v130, v131, v132, v133);
        v158 = v157;
        objc_msgSend_writingOrientation(v110, v159, v160, v161, v162, v163);
        v165 = v164;
        objc_msgSend_averageWritingOrientation(v299, v166, v167, v168, v169, v170);
        v172 = v171;
        objc_msgSend_writingOrientation(v110, v173, v174, v175, v176, v177);
        v183 = (v158 + v165) * 0.5;
        v185 = (v172 + v184) * 0.5;
        v186 = sqrt(v185 * v185 + v183 * v183);
        if (v186 != 0.0)
        {
          v183 = v183 / v186;
          v185 = v185 / v186;
        }
        v302 = v185;
        v303 = v183;
        if (self->_shouldLimitDefaultWritingOrientationDeviation)
        {
          objc_msgSend_clippedWritingOrientation_(self, v178, v179, v180, v181, v182, v183, v185);
          v302 = v188;
          v303 = v187;
        }
        objc_msgSend_averageStrokeDeviation(v299, v178, v179, v180, v181, v182);
        v190 = v189;
        objc_msgSend_strokeDeviation(v110, v191, v192, v193, v194, v195);
        v197 = v196;
        objc_msgSend_averageStrokeDeviation(v299, v198, v199, v200, v201, v202);
        v204 = v203;
        objc_msgSend_strokeDeviation(v110, v205, v206, v207, v208, v209);
        v215 = 0;
        dx = (v190 + v197) * 0.5;
        dy = (v204 + v216) * 0.5;
        if (dx <= self->_defaultDeviationVector.dx)
          dx = self->_defaultDeviationVector.dx;
        if (dy <= self->_defaultDeviationVector.dy)
          dy = self->_defaultDeviationVector.dy;
        v305 = sqrt(dy * dy + dx * dx);
        while (v215 < objc_msgSend_count(v12, v210, v211, v212, v213, v214))
        {
          objc_msgSend_objectAtIndexedSubscript_(v12, v103, v215, v105, v106, v107);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          v310 = v110;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v220, (uint64_t)&v310, 1, v221, v222);
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_substroke(v219, v224, v225, v226, v227, v228);
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          v230 = sub_1BE866000(self, v223, v229, v108, v300, v303, v302);
          v232 = v231;

          v238 = v232 / v305;
          if (v232 / v305 >= 0.0)
            mergeMiddleDyCostCoeff = self->_mergeMiddleBelowModifier * self->_mergeMiddleDyCostCoeff;
          else
            mergeMiddleDyCostCoeff = self->_mergeMiddleDyCostCoeff;
          v304 = mergeMiddleDyCostCoeff;
          mergeMiddleDxCostCoeff = self->_mergeMiddleDxCostCoeff;
          objc_msgSend_substroke(v219, v233, v234, v235, v236, v237);
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v241, v242, v243, v244, v245, v246);
          v248 = v247;
          objc_msgSend_substroke(v219, v249, v250, v251, v252, v253);
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v254, v255, v256, v257, v258, v259);
          v261 = v260;
          objc_msgSend_substroke(v219, v262, v263, v264, v265, v266);
          v267 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v267, v268, v269, v270, v271, v272);
          v274 = v273;
          objc_msgSend_substroke(v219, v275, v276, v277, v278, v279);
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v280, v281, v282, v283, v284, v285);
          v287 = v286;

          v288 = fabs(v230 / v305) * mergeMiddleDxCostCoeff + fabs(v238) * v304;
          v289 = sqrt(v274 * v287 + v248 * v261) / v305;
          if (v289 < 0.8)
            v289 = 0.8;
          if (v289 > 1.0)
            v289 = 1.0;
          v290 = v288 * v289;
          if (v288 * v289 >= v109)
          {
            v290 = v109;
          }
          else
          {
            v291 = v108;

            v301 = v291;
          }

          ++v215;
          v109 = v290;
        }
      }
      v297 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v103, (uint64_t)&v306, (uint64_t)v311, 16, v107);
    }
    while (v297);
  }
  else
  {
    v108 = 0;
    v301 = 0;
    v109 = 10000.0;
  }

  if (v292)
    *v292 = v109;
  if (a4)
    *a4 = objc_retainAutorelease(v301);

}

- (int64_t)compareDistanceInWritingSequenceOfStroke:(id)a3 andStroke:(id)a4 toReferenceStroke:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = v10;
  v17 = 0;
  if (v8 && v9 && v10)
  {
    objc_msgSend_strokeProvider(self, v11, v12, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifier(v8, v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifier(v16, v25, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v18, v31, (uint64_t)v24, (uint64_t)v30, v32, v33);

    objc_msgSend_strokeProvider(self, v35, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifier(v9, v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifier(v16, v47, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v40, v53, (uint64_t)v46, (uint64_t)v52, v54, v55);

    objc_msgSend_strokeProvider(self, v57, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifier(v8, v63, v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifier(v9, v69, v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend_compareOrderOfStrokeWithIdentifier_toStrokeWithIdentifier_(v62, v75, (uint64_t)v68, (uint64_t)v74, v76, v77);

    if (v34 == -1 && v56 == 1)
    {
      v17 = 0;
    }
    else
    {
      v17 = 0;
      if (v56 != -1 || v34 != 1)
      {
        if (v78)
        {
          v17 = -1;
          if ((v34 != -1 || v78 != 1) && (v78 != -1 || v34 != 1) && v34 != 0)
            v17 = 1;
        }
      }
    }
  }

  return v17;
}

- (void)estimateWritingDirectionAndSortSubstrokesAccordingly:(id *)a3 averageWritingOrientation:(CGVector *)a4 averageStrokeDeviation:(CGVector *)a5
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  unint64_t v74;
  double v75;
  double v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  double v94;
  double v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  double v113;
  double v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  double v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  double v132;
  double v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  double v151;
  double v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  double v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t i;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  id v180;
  id v181;
  CGVector defaultDeviationVector;
  CGVector defaultOrientationVector;

  v14 = *a3;
  v15 = 0;
  defaultOrientationVector = self->_defaultOrientationVector;
  while (2)
  {
    v16 = (void *)objc_msgSend_mutableCopy(v14, v9, v10, v11, v12, v13);
    objc_msgSend_updateLocalWritingOrientationsForSubstrokes_useCoalescedCenter_(self, v17, (uint64_t)v14, 0, v18, v19);
    objc_msgSend_sortSubstrokesByWritingDirection_averageWritingOrientation_(self, v20, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v21, v22);
    v28 = 0;
    ++v15;
    do
    {
      if (v28 >= objc_msgSend_count(v14, v23, v24, v25, v26, v27))
      {

        goto LABEL_9;
      }
      objc_msgSend_objectAtIndexedSubscript_(v14, v29, v28, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writingOrientation(v33, v34, v35, v36, v37, v38);
      v40 = v39;
      v42 = v41;
      objc_msgSend_objectAtIndexedSubscript_(v16, v43, v28, v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writingOrientation(v47, v48, v49, v50, v51, v52);
      v54 = v53;
      v56 = v55;

      if (v40 != v54)
        break;
      ++v28;
    }
    while (v42 == v56);

    if (v15 != 10)
      continue;
    break;
  }
LABEL_9:
  if ((unint64_t)objc_msgSend_count(v14, v9, v10, v11, v12, v13) > self->_groupingContextSize)
  {
    objc_msgSend_refineLocalWritingOrientationsForSubstrokes_useCoalescedCenter_(self, v57, (uint64_t)v14, 0, v58, v59);
    objc_msgSend_sortSubstrokesByWritingDirection_averageWritingOrientation_(self, v60, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v61, v62);
    defaultDeviationVector = defaultOrientationVector;
    v63 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v67 = (void *)objc_msgSend_initWithArray_copyItems_(v63, v64, (uint64_t)v14, 1, v65, v66);
    v73 = atan2(defaultOrientationVector.dy, defaultOrientationVector.dx);
    v74 = 0;
    v75 = 0.0;
    v76 = 0.0;
    while (v74 < objc_msgSend_count(v14, v68, v69, v70, v71, v72, defaultDeviationVector))
    {
      objc_msgSend_objectAtIndexedSubscript_(v14, v77, v74, v78, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writingOrientation(v81, v82, v83, v84, v85, v86);
      v75 = v75 + 0.1;
      v76 = v76 + v87 * v75;

      ++v74;
    }
    if (objc_msgSend_refineWritingOrientationAndResortSubstrokes_averageWritingOrientation_(self, v77, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v79, v80))
    {
      v93 = 0;
      v94 = 0.0;
      v95 = 0.0;
      while (v93 < objc_msgSend_count(v14, v88, v89, v90, v91, v92))
      {
        objc_msgSend_objectAtIndexedSubscript_(v14, v96, v93, v97, v98, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_writingOrientation(v100, v101, v102, v103, v104, v105);
        v94 = v94 + 0.1;
        v95 = v95 + v106 * v94;

        ++v93;
      }
      if (v95 != v76)
      {
        if (objc_msgSend_refineWritingOrientationAndResortSubstrokes_averageWritingOrientation_(self, v96, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v98, v99))
        {
          v112 = 0;
          v113 = 0.0;
          v114 = 0.0;
          while (v112 < objc_msgSend_count(v14, v107, v108, v109, v110, v111))
          {
            objc_msgSend_objectAtIndexedSubscript_(v14, v115, v112, v116, v117, v118);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_writingOrientation(v119, v120, v121, v122, v123, v124);
            v113 = v113 + 0.1;
            v114 = v114 + v125 * v113;

            ++v112;
          }
          if (v114 != v95)
          {
            if (objc_msgSend_refineWritingOrientationAndResortSubstrokes_averageWritingOrientation_(self, v115, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v117, v118))
            {
              v131 = 0;
              v132 = 0.0;
              v133 = 0.0;
              while (v131 < objc_msgSend_count(v14, v126, v127, v128, v129, v130))
              {
                objc_msgSend_objectAtIndexedSubscript_(v14, v134, v131, v135, v136, v137);
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_writingOrientation(v138, v139, v140, v141, v142, v143);
                v132 = v132 + 0.1;
                v133 = v133 + v144 * v132;

                ++v131;
              }
              if (v133 != v114)
              {
                if (objc_msgSend_refineWritingOrientationAndResortSubstrokes_averageWritingOrientation_(self, v134, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v136, v137))
                {
                  v150 = 0;
                  v151 = 0.0;
                  v152 = 0.0;
                  while (v150 < objc_msgSend_count(v14, v145, v146, v147, v148, v149))
                  {
                    objc_msgSend_objectAtIndexedSubscript_(v14, v153, v150, v154, v155, v156);
                    v157 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_writingOrientation(v157, v158, v159, v160, v161, v162);
                    v151 = v151 + 0.1;
                    v152 = v152 + v163 * v151;

                    ++v150;
                  }
                  if (v152 != v133
                    && objc_msgSend_refineWritingOrientationAndResortSubstrokes_averageWritingOrientation_(self, v153, (uint64_t)v14, (uint64_t)&defaultOrientationVector, v155, v156))
                  {
                    for (i = 0; i < objc_msgSend_count(v14, v164, v165, v166, v167, v168); ++i)
                    {
                      objc_msgSend_objectAtIndexedSubscript_(v14, v170, i, v171, v172, v173);
                      v174 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_writingOrientation(v174, v175, v176, v177, v178, v179);

                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    if (vabdd_f64(atan2(defaultOrientationVector.dy, defaultOrientationVector.dx), v73) > 0.785398163)
    {
      v180 = objc_retainAutorelease(v67);
      *a3 = v180;
      v181 = v180;

      defaultOrientationVector = defaultDeviationVector;
      v14 = v181;
    }

  }
  defaultDeviationVector = self->_defaultDeviationVector;
  objc_msgSend_updateLocalStrokeDeviationsForSubstrokes_averageStrokeDeviation_(self, v57, (uint64_t)v14, (uint64_t)&defaultDeviationVector, v58, v59);
  if (a4)
    *a4 = defaultOrientationVector;
  if (a5)
    *a5 = defaultDeviationVector;

}

- (void)sortSubstrokesByWritingDirection:(id)a3 averageWritingOrientation:(CGVector *)a4
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
  unint64_t v15;
  double v16;
  double v17;
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
  double v29;
  double v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  _QWORD v48[6];

  v47 = a3;
  if (objc_msgSend_count(v47, v5, v6, v7, v8, v9))
  {
    v15 = 0;
    v16 = 0.0;
    v17 = 0.0;
    while (v15 < objc_msgSend_count(v47, v10, v11, v12, v13, v14))
    {
      objc_msgSend_objectAtIndexedSubscript_(v47, v18, v15, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writingOrientation(v23, v24, v25, v26, v27, v28);
      v30 = v29;
      v32 = v31;

      v16 = v16 + v30;
      v17 = v17 + v32;
      ++v15;
    }
    if (objc_msgSend_count(v47, v18, v19, v20, v21, v22))
    {
      v16 = v16 / (double)(unint64_t)objc_msgSend_count(v47, v33, v34, v35, v36, v37);
      v17 = v17 / (double)(unint64_t)objc_msgSend_count(v47, v38, v39, v40, v41, v42);
    }
    if (a4)
    {
      a4->dx = v16;
      a4->dy = v17;
    }
    if ((unint64_t)objc_msgSend_count(v47, v33, v34, v35, v36, v37) >= 2)
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = sub_1BE867AB8;
      v48[3] = &unk_1E77F6458;
      *(double *)&v48[4] = v16;
      *(double *)&v48[5] = v17;
      objc_msgSend_sortUsingComparator_(v47, v43, (uint64_t)v48, v44, v45, v46);
    }
  }
  else if (a4)
  {
    a4->dx = 0.0;
    a4->dy = 0.0;
  }

}

- (void)updateLocalWritingOrientationsForSubstrokes:(id)a3 useCoalescedCenter:(BOOL)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t i;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double dx;
  double dy;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  double v36;
  unint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  unint64_t v45;
  double v46;
  unint64_t j;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double MidX;
  double v70;
  double MidY;
  double v72;
  double v73;
  void *v74;
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
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
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
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  double v130;
  double v131;
  double v132;
  double v133;
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
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double *v159;
  double *v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  unint64_t v164;
  char *v165;
  double *v166;
  double *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t k;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  double v179;
  double v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  _BOOL4 v189;
  void *__p;
  double *v191;
  char *v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;

  v189 = a4;
  v5 = a3;
  if ((unint64_t)objc_msgSend_count(v5, v6, v7, v8, v9, v10) < self->_groupingContextSize)
  {
    for (i = 0; i < objc_msgSend_count(v5, v11, v12, v13, v14, v15); ++i)
    {
      dx = self->_defaultOrientationVector.dx;
      dy = self->_defaultOrientationVector.dy;
      objc_msgSend_objectAtIndexedSubscript_(v5, v17, i, v18, v19, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWritingOrientation_(v23, v24, v25, v26, v27, v28, dx, dy);

    }
    goto LABEL_60;
  }
  v29 = objc_msgSend_count(v5, v11, v12, v13, v14, v15);
  v35 = 2 * self->_groupingContextSize;
  v36 = 0.0;
  if (v29 < v35)
    v36 = (double)(v35 - objc_msgSend_count(v5, v30, v31, v32, v33, v34)) / (double)self->_groupingContextSize;
  __p = 0;
  v191 = 0;
  v192 = 0;
  v37 = objc_msgSend_count(v5, v30, v31, v32, v33, v34);
  v43 = v37;
  if (v37)
  {
    if (v37 >> 60)
      sub_1BE61F930();
    v44 = (char *)operator new(16 * v37);
    __p = &v44[(unint64_t)v191 & 0xFFFFFFFFFFFFFFF0];
    v191 = (double *)__p;
    v192 = &v44[16 * v43];
  }
  v45 = 0;
  v46 = 1.0 - v36;
  for (j = objc_msgSend_count(v5, v38, v39, v40, v41, v42, -1);
        v45 < j;
        j = objc_msgSend_count(v5, v53, v54, v55, v56, v57, v187 + 1))
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v48, v45, v49, v50, v51);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    if (v189)
    {
      objc_msgSend_coalescedCenter(v188, v58, v59, v60, v61, v62);
      MidX = v68;
      MidY = v70;
      v72 = 0.0;
      v73 = 0.0;
      if (self->_groupingContextSize < 2)
        goto LABEL_32;
    }
    else
    {
      objc_msgSend_substroke(v188, v58, v59, v60, v61, v62);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v74, v75, v76, v77, v78, v79);
      MidX = CGRectGetMidX(v193);
      objc_msgSend_substroke(v188, v80, v81, v82, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v85, v86, v87, v88, v89, v90);
      MidY = CGRectGetMidY(v194);

      v72 = 0.0;
      v73 = 0.0;
      if (self->_groupingContextSize < 2)
        goto LABEL_32;
    }
    v91 = 0;
    v92 = v187;
    v93 = 1;
    do
    {
      if (v45 >= v93)
      {
        objc_msgSend_objectAtIndexedSubscript_(v5, v63, v92, v65, v66, v67);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v94;
        if (v189)
        {
          objc_msgSend_coalescedCenter(v94, v95, v96, v97, v98, v99);
          v102 = v101;
          v104 = v103;
        }
        else
        {
          objc_msgSend_substroke(v94, v95, v96, v97, v98, v99);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v105, v106, v107, v108, v109, v110);
          v102 = CGRectGetMidX(v195);
          objc_msgSend_substroke(v100, v111, v112, v113, v114, v115);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v116, v117, v118, v119, v120, v121);
          v104 = CGRectGetMidY(v196);

        }
        v72 = v72 + MidX - v102;
        v73 = v73 + MidY - v104;
        ++v91;

      }
      v122 = objc_msgSend_count(v5, v63, v64, v65, v66, v67);
      v64 = v45 + v93;
      if (v45 + v93 < v122)
      {
        objc_msgSend_objectAtIndexedSubscript_(v5, v63, v64, v65, v66, v67);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = v123;
        if (v189)
        {
          objc_msgSend_coalescedCenter(v123, v124, v125, v126, v127, v128);
          v131 = v130;
          v133 = v132;
        }
        else
        {
          objc_msgSend_substroke(v123, v124, v125, v126, v127, v128);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v134, v135, v136, v137, v138, v139);
          v131 = CGRectGetMidX(v197);
          objc_msgSend_substroke(v129, v140, v141, v142, v143, v144);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v145, v146, v147, v148, v149, v150);
          v133 = CGRectGetMidY(v198);

        }
        v72 = v72 + v131 - MidX;
        v73 = v73 + v133 - MidY;
        ++v91;

      }
      ++v93;
      --v92;
    }
    while (v93 < self->_groupingContextSize);
    if (v91)
    {
      v72 = v72 / (double)v91;
      v73 = v73 / (double)v91;
    }
LABEL_32:
    v151 = sqrt(v73 * v73 + v72 * v72);
    if (v151 == 0.0)
    {
      v152 = self->_defaultOrientationVector.dx;
      v153 = self->_defaultOrientationVector.dy;
      if (v36 <= 0.0)
        goto LABEL_38;
    }
    else
    {
      v152 = v72 / v151;
      v153 = v73 / v151;
      if (v36 <= 0.0)
        goto LABEL_38;
    }
    v154 = v46 * v152;
    v155 = v46 * v153;
    v152 = self->_defaultOrientationVector.dx;
    v153 = self->_defaultOrientationVector.dy;
    v156 = v154 + v36 * v152;
    v157 = v155 + v36 * v153;
    v158 = sqrt(v157 * v157 + v156 * v156);
    if (v158 != 0.0)
    {
      v152 = v156 / v158;
      v153 = v157 / v158;
    }
LABEL_38:
    v159 = v191;
    if (v191 < (double *)v192)
    {
      *v191 = v152;
      v159[1] = v153;
      v52 = v159 + 2;
      goto LABEL_12;
    }
    v160 = (double *)__p;
    v161 = ((char *)v191 - (_BYTE *)__p) >> 4;
    v162 = v161 + 1;
    if ((unint64_t)(v161 + 1) >> 60)
      sub_1BE61F930();
    v163 = v192 - (_BYTE *)__p;
    if ((v192 - (_BYTE *)__p) >> 3 > v162)
      v162 = v163 >> 3;
    if ((unint64_t)v163 >= 0x7FFFFFFFFFFFFFF0)
      v164 = 0xFFFFFFFFFFFFFFFLL;
    else
      v164 = v162;
    if (v164)
    {
      if (v164 >> 60)
        sub_1BE61F100();
      v165 = (char *)operator new(16 * v164);
      v166 = (double *)&v165[16 * v161];
      *v166 = v152;
      v166[1] = v153;
      v167 = v166;
      if (v159 == v160)
      {
LABEL_53:
        v52 = v166 + 2;
        __p = v167;
        v192 = &v165[16 * v164];
        if (!v159)
          goto LABEL_12;
LABEL_54:
        operator delete(v159);
        goto LABEL_12;
      }
    }
    else
    {
      v165 = 0;
      v166 = (double *)(16 * v161);
      *v166 = v152;
      v166[1] = v153;
      v167 = (double *)(16 * v161);
      if (v159 == v160)
        goto LABEL_53;
    }
    do
    {
      *((_OWORD *)v167 - 1) = *((_OWORD *)v159 - 1);
      v167 -= 2;
      v159 -= 2;
    }
    while (v159 != v160);
    v159 = v160;
    v52 = v166 + 2;
    __p = v167;
    v192 = &v165[16 * v164];
    if (v159)
      goto LABEL_54;
LABEL_12:
    v191 = v52;

    ++v45;
  }
  objc_msgSend_smoothLocalWritingOrientations_(self, v48, (uint64_t)&__p, v49, v50, v51);
  v173 = 0;
  for (k = 0; k < objc_msgSend_count(v5, v168, v169, v170, v171, v172); ++k)
  {
    v179 = *(double *)((char *)__p + v173);
    v180 = *(double *)((char *)__p + v173 + 8);
    objc_msgSend_objectAtIndexedSubscript_(v5, v175, k, v176, v177, v178);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWritingOrientation_(v181, v182, v183, v184, v185, v186, v179, v180);

    v173 += 16;
  }
  if (__p)
  {
    v191 = (double *)__p;
    operator delete(__p);
  }
LABEL_60:

}

- (void)smoothLocalWritingOrientations:(void *)a3
{
  float64x2_t *v3;
  uint64_t v4;
  float64x2_t *v5;
  float64x2_t v6;
  float64x2_t v7;
  unint64_t v8;
  unint64_t v9;
  float64x2_t v15;
  float64x2_t v16;
  double v17;

  v3 = *(float64x2_t **)a3;
  v4 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  if ((unint64_t)v4 >= 0x11)
  {
    v6 = *v3;
    v5 = v3 + 1;
    v7 = v6;
    v8 = v4 >> 4;
    if (v8 <= 2)
      v8 = 2;
    v9 = v8 - 1;
    __asm { FMOV            V1.2D, #0.5 }
    do
    {
      v15 = v7;
      v7 = *v5;
      v16 = vmlaq_f64(vmulq_f64(*v5, _Q1), _Q1, v15);
      v17 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(_QWORD *)&vmulq_f64(v16, v16).f64[1]), v16.f64[0], v16.f64[0]));
      if (v17 != 0.0)
        *v5 = vdivq_f64(v16, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v17, 0));
      ++v5;
      --v9;
    }
    while (v9);
  }
}

- (CGVector)clippedWritingOrientation:(CGVector)a3
{
  long double dy;
  long double dx;
  double v5;
  double v6;
  double cosval;
  double sinval;
  double v9;
  double v10;
  __double2 v11;
  CGVector result;

  dy = a3.dy;
  dx = a3.dx;
  v5 = atan2(self->_defaultOrientationVector.dy, self->_defaultOrientationVector.dx);
  v6 = atan2(dy, dx) - v5;
  if (v6 <= 3.14159265)
  {
    if (v6 <= -3.14159265)
    {
      v6 = v6 + 3.14159265;
      if (fabs(v6) > 0.523598776)
        goto LABEL_8;
    }
    else if (fabs(v6) > 0.523598776)
    {
      goto LABEL_8;
    }
  }
  else
  {
    v6 = v6 + -3.14159265;
    if (fabs(v6) > 0.523598776)
    {
LABEL_8:
      v9 = v5 + dbl_1BE8E0250[v6 < 0.0];
      if (v9 <= 3.14159265)
      {
        if (v9 > -3.14159265)
        {
LABEL_13:
          v11 = __sincos_stret(v9);
          cosval = v11.__cosval;
          sinval = v11.__sinval;
          goto LABEL_14;
        }
        v10 = 6.28318531;
      }
      else
      {
        v10 = -6.28318531;
      }
      v9 = v9 + v10;
      goto LABEL_13;
    }
  }
  cosval = dx;
  sinval = dy;
LABEL_14:
  result.dy = sinval;
  result.dx = cosval;
  return result;
}

- (void)refineLocalWritingOrientationsForSubstrokes:(id)a3 useCoalescedCenter:(BOOL)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CGFloat MidX;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double MidY;
  double v59;
  double *v60;
  double *v61;
  double *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  CGFloat *v68;
  CGFloat *v69;
  unint64_t groupingContextSize;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  unint64_t v91;
  _OWORD *v92;
  _OWORD *v93;
  _OWORD *v94;
  _OWORD *v95;
  float64x2_t *v96;
  float64x2_t *v97;
  size_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  _OWORD *f64;
  uint64_t v105;
  float64x2_t v106;
  float64x2_t v107;
  float64x2_t *v108;
  double v109;
  uint64_t v110;
  unint64_t k;
  double v112;
  float64x2_t v113;
  float64x2_t defaultOrientationVector;
  char *v115;
  char *v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char *v121;
  float64x2_t *v122;
  float64x2_t *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  double v135;
  double v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  float64x2_t v146;
  float64x2_t v147;
  double v148;
  CHBottomUpStrokeGroupingStrategy *v149;
  void *j;
  void *v151;
  char *v152;
  void *v153;
  float64x2_t *v154;
  char *v155;
  void *v156;
  _OWORD *v157;
  void *v158;
  _OWORD *v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  void *__p;
  char *v165;
  char *v166;
  _BYTE v167[128];
  uint64_t v168;
  CGRect v169;
  CGRect v170;

  v168 = *MEMORY[0x1E0C80C00];
  __p = 0;
  v165 = 0;
  v166 = 0;
  v145 = a3;
  v11 = objc_msgSend_count(v145, v6, v7, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    if (v11 >> 60)
      sub_1BE61F930();
    __p = operator new(16 * v11);
    v165 = (char *)__p;
    v166 = (char *)__p + 16 * v12;
  }
  v149 = self;
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v13 = v145;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v160, (uint64_t)v167, 16, v15);
  if (v21)
  {
    v22 = *(_QWORD *)v161;
    if (a4)
    {
      while (1)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v161 != v22)
            objc_enumerationMutation(v13);
          objc_msgSend_coalescedCenter(*(void **)(*((_QWORD *)&v160 + 1) + 8 * i), v16, v17, v18, v19, v20);
          v27 = v25;
          v28 = v26;
          v29 = v165;
          if (v165 < v166)
          {
            *(_QWORD *)v165 = v25;
            *((_QWORD *)v29 + 1) = v26;
            v24 = v29 + 16;
            goto LABEL_8;
          }
          v30 = (char *)__p;
          v31 = (v165 - (_BYTE *)__p) >> 4;
          v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 60)
            sub_1BE61F930();
          v33 = v166 - (_BYTE *)__p;
          if ((v166 - (_BYTE *)__p) >> 3 > v32)
            v32 = v33 >> 3;
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF0)
            v34 = 0xFFFFFFFFFFFFFFFLL;
          else
            v34 = v32;
          if (v34)
          {
            if (v34 >> 60)
              sub_1BE61F100();
            v35 = (char *)operator new(16 * v34);
            v36 = &v35[16 * v31];
            *(_QWORD *)v36 = v27;
            *((_QWORD *)v36 + 1) = v28;
            v37 = v36;
            if (v29 == v30)
            {
LABEL_26:
              v24 = v36 + 16;
              __p = v37;
              v165 = v36 + 16;
              v166 = &v35[16 * v34];
              if (!v29)
                goto LABEL_8;
LABEL_27:
              operator delete(v29);
              goto LABEL_8;
            }
          }
          else
          {
            v35 = 0;
            v36 = (char *)(16 * v31);
            *(_QWORD *)v36 = v25;
            *((_QWORD *)v36 + 1) = v26;
            v37 = (char *)(16 * v31);
            if (v29 == v30)
              goto LABEL_26;
          }
          do
          {
            *((_OWORD *)v37 - 1) = *((_OWORD *)v29 - 1);
            v37 -= 16;
            v29 -= 16;
          }
          while (v29 != v30);
          v29 = (char *)__p;
          v24 = v36 + 16;
          __p = v37;
          v165 = v36 + 16;
          v166 = &v35[16 * v34];
          if (v29)
            goto LABEL_27;
LABEL_8:
          v165 = v24;
        }
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v160, (uint64_t)v167, 16, v20);
        if (!v21)
          goto LABEL_53;
      }
    }
LABEL_30:
    v38 = 0;
    while (1)
    {
      if (*(_QWORD *)v161 != v22)
        objc_enumerationMutation(v13);
      v39 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v38);
      objc_msgSend_substroke(v39, v16, v17, v18, v19, v20);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v40, v41, v42, v43, v44, v45);
      MidX = CGRectGetMidX(v169);
      objc_msgSend_substroke(v39, v47, v48, v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v52, v53, v54, v55, v56, v57);
      MidY = CGRectGetMidY(v170);
      v59 = MidY;
      v60 = (double *)v165;
      if (v165 >= v166)
      {
        v62 = (double *)__p;
        v63 = (v165 - (_BYTE *)__p) >> 4;
        v64 = v63 + 1;
        if ((unint64_t)(v63 + 1) >> 60)
          sub_1BE61F930();
        v65 = v166 - (_BYTE *)__p;
        if ((v166 - (_BYTE *)__p) >> 3 > v64)
          v64 = v65 >> 3;
        if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFF0)
          v66 = 0xFFFFFFFFFFFFFFFLL;
        else
          v66 = v64;
        if (v66)
        {
          if (v66 >> 60)
            sub_1BE61F100();
          v67 = (char *)operator new(16 * v66);
          v68 = (CGFloat *)&v67[16 * v63];
          *v68 = MidX;
          v68[1] = v59;
          v69 = v68;
          if (v60 != v62)
          {
            do
            {
LABEL_46:
              *((_OWORD *)v69 - 1) = *((_OWORD *)v60 - 1);
              v69 -= 2;
              v60 -= 2;
            }
            while (v60 != v62);
            v60 = (double *)__p;
            v61 = v68 + 2;
            __p = v69;
            v165 = (char *)(v68 + 2);
            v166 = &v67[16 * v66];
            if (!v60)
              goto LABEL_51;
LABEL_50:
            operator delete(v60);
            goto LABEL_51;
          }
        }
        else
        {
          v67 = 0;
          v68 = (CGFloat *)(16 * v63);
          *v68 = MidX;
          v68[1] = MidY;
          v69 = (CGFloat *)(16 * v63);
          if (v60 != v62)
            goto LABEL_46;
        }
        v61 = v68 + 2;
        __p = v69;
        v165 = (char *)(v68 + 2);
        v166 = &v67[16 * v66];
        if (v60)
          goto LABEL_50;
      }
      else
      {
        *(CGFloat *)v165 = MidX;
        v60[1] = MidY;
        v61 = v60 + 2;
      }
LABEL_51:
      v165 = (char *)v61;

      if (++v38 == v21)
      {
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v160, (uint64_t)v167, 16, v20);
        if (!v21)
          break;
        goto LABEL_30;
      }
    }
  }
LABEL_53:

  groupingContextSize = v149->_groupingContextSize;
  v76 = objc_msgSend_count(v13, v71, v72, v73, v74, v75);
  v81 = v149->_groupingContextSize;
  v82 = v81;
  if (groupingContextSize >= v76 - v81)
  {
    v83 = objc_msgSend_count(v13, v77, v78, v79, v81, v80);
    v81 = v149->_groupingContextSize;
    v82 = v83 - v81;
  }
  objc_msgSend_flippedCenters_ofSubstrokes_maxStrokesGap_begnning_(v149, v77, (uint64_t)&__p, (uint64_t)v13, v81, 1);
  objc_msgSend_flippedCenters_ofSubstrokes_maxStrokesGap_begnning_(v149, v84, (uint64_t)&__p, (uint64_t)v13, v149->_groupingContextSize, 0);
  v153 = 0;
  v154 = 0;
  v155 = 0;
  v90 = (char *)__p;
  v89 = v165;
  v91 = ((v165 - (_BYTE *)__p) >> 4) + 2 * v82;
  if (v91)
  {
    if (v91 >> 60)
      sub_1BE61F930();
    v153 = operator new(16 * v91);
    v154 = (float64x2_t *)v153;
    v155 = (char *)v153 + 16 * v91;
  }
  v92 = v158;
  v93 = v159;
  j = &v153;
  if (v158 != v159)
  {
    do
      sub_1BE86F380((char ***)&j, v92++);
    while (v92 != v93);
    v90 = (char *)__p;
    v89 = v165;
  }
  for (j = &v153; v90 != v89; v90 += 16)
    sub_1BE86F380((char ***)&j, v90);
  v95 = v156;
  v94 = v157;
  j = &v153;
  if (v156 != v157)
  {
    do
      sub_1BE86F380((char ***)&j, v95++);
    while (v95 != v94);
  }
  j = 0;
  v151 = 0;
  v152 = 0;
  v97 = (float64x2_t *)v153;
  v96 = v154;
  v98 = (char *)v154 - (_BYTE *)v153;
  v99 = ((char *)v154 - (_BYTE *)v153) >> 4;
  v143 = v82;
  if (v154 == v153)
  {
    v100 = 0;
  }
  else
  {
    if ((v98 & 0x8000000000000000) != 0)
      sub_1BE61F930();
    v100 = (char *)operator new(v98);
    j = v100;
    v151 = v100;
    v152 = &v100[16 * v99];
  }
  v101 = v149->_groupingContextSize;
  v148 = 0.0;
  if (2 * v101 > v99)
    v148 = (double)(2 * v101 - v99) / (double)v101;
  if (v96 != v97)
  {
    v102 = 0;
    v103 = 0;
    v146 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v148, 0);
    do
    {
      v105 = v149->_groupingContextSize;
      v106 = 0uLL;
      if (v105 < 2)
        goto LABEL_85;
      v107 = v97[v103];
      v108 = &v97[v102];
      v109 = 0.0;
      v110 = 0xFFFFFFFFFFFFFFFLL;
      for (k = 1; k != v105; ++k)
      {
        if (v103 >= k)
        {
          v106 = vaddq_f64(v106, vsubq_f64(v107, v108[v110]));
          v109 = v109 + 1.0;
          if (v103 + k >= v99)
            goto LABEL_77;
        }
        else if (v103 + k >= v99)
        {
          goto LABEL_77;
        }
        v106 = vaddq_f64(v106, vsubq_f64(v108[k], v107));
        v109 = v109 + 1.0;
LABEL_77:
        --v110;
      }
      if (v109 != 0.0)
        v106 = vdivq_f64(v106, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v109, 0));
LABEL_85:
      v112 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(_QWORD *)&vmulq_f64(v106, v106).f64[1]), v106.f64[0], v106.f64[0]));
      if (v112 == 0.0)
      {
        defaultOrientationVector = (float64x2_t)v149->_defaultOrientationVector;
        v115 = v152;
        if (v100 >= v152)
          goto LABEL_91;
LABEL_73:
        *(float64x2_t *)v100 = defaultOrientationVector;
        f64 = v100 + 16;
        goto LABEL_74;
      }
      v113 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v112, 0);
      defaultOrientationVector = vdivq_f64(v106, v113);
      if (v148 > 0.0)
        defaultOrientationVector = vdivq_f64(vmlaq_f64(vmulq_n_f64(defaultOrientationVector, 1.0 - v148), (float64x2_t)v149->_defaultOrientationVector, v146), v113);
      v115 = v152;
      if (v100 < v152)
        goto LABEL_73;
LABEL_91:
      v116 = (char *)j;
      v117 = (v100 - (_BYTE *)j) >> 4;
      v118 = v117 + 1;
      if ((unint64_t)(v117 + 1) >> 60)
        sub_1BE61F930();
      v119 = v115 - (_BYTE *)j;
      if (v119 >> 3 > v118)
        v118 = v119 >> 3;
      if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFF0)
        v120 = 0xFFFFFFFFFFFFFFFLL;
      else
        v120 = v118;
      if (!v120)
      {
        v121 = 0;
        v122 = (float64x2_t *)(16 * v117);
        v123 = (float64x2_t *)(16 * v117);
        *v123 = defaultOrientationVector;
        f64 = (_OWORD *)v123[1].f64;
        if (v100 == v116)
          goto LABEL_104;
        do
        {
LABEL_102:
          v122[-1] = *((float64x2_t *)v100 - 1);
          --v122;
          v100 -= 16;
        }
        while (v100 != v116);
        v100 = (char *)j;
        goto LABEL_104;
      }
      v147 = defaultOrientationVector;
      if (v120 >> 60)
        sub_1BE61F100();
      v121 = (char *)operator new(16 * v120);
      v122 = (float64x2_t *)&v121[16 * v117];
      *v122 = v147;
      f64 = (_OWORD *)v122[1].f64;
      if (v100 != v116)
        goto LABEL_102;
LABEL_104:
      j = v122;
      v151 = f64;
      v152 = &v121[16 * v120];
      if (v100)
        operator delete(v100);
LABEL_74:
      v151 = f64;
      ++v103;
      v97 = (float64x2_t *)v153;
      v99 = ((char *)v154 - (_BYTE *)v153) >> 4;
      ++v102;
      v100 = (char *)f64;
    }
    while (v103 < v99);
  }
  objc_msgSend_smoothLocalWritingOrientations_(v149, v85, (uint64_t)&j, v86, v87, v88, v143);
  v129 = 0;
  v130 = 16 * v144;
  while (v129 < objc_msgSend_count(v13, v124, v125, v126, v127, v128))
  {
    v135 = *(double *)((char *)j + v130);
    v136 = *(double *)((char *)j + v130 + 8);
    objc_msgSend_objectAtIndexedSubscript_(v13, v131, v129, v132, v133, v134);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWritingOrientation_(v137, v138, v139, v140, v141, v142, v135, v136);

    ++v129;
    v130 += 16;
  }
  if (j)
  {
    v151 = j;
    operator delete(j);
  }
  if (v153)
  {
    v154 = (float64x2_t *)v153;
    operator delete(v153);
  }
  if (v156)
  {
    v157 = v156;
    operator delete(v156);
  }
  if (v158)
  {
    v159 = v158;
    operator delete(v158);
  }
  if (__p)
  {
    v165 = (char *)__p;
    operator delete(__p);
  }

}

- (vector<CGPoint,)flippedCenters:(CHBottomUpStrokeGroupingStrategy *)self ofSubstrokes:(SEL)a3 maxStrokesGap:(const void *)a4 begnning:(id)a5
{
  id v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double *v21;
  uint64_t v22;
  double *v23;
  char *v24;
  char *v25;
  const void *v26;
  int64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGPoint *v50;
  double v51;
  double v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  CGPoint *v56;
  double *v57;
  double v58;
  CGFloat v59;
  float64x2_t v60;
  CGPoint *value;
  CGPoint *begin;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  CGPoint *v68;
  CGPoint *v69;
  CGPoint *v70;
  CGPoint *v71;
  CGPoint v72;
  vector<CGPoint, std::allocator<CGPoint>> *result;
  uint64_t __sz;
  vector<CGPoint, std::allocator<CGPoint>> *v76;
  void *v77;
  unint64_t v78;
  CGPoint v79;
  _BOOL4 v80;
  CGAffineTransform v81;
  CGAffineTransform v82;
  void *__p;
  char *v84;
  char *v85;
  CGPoint v86;

  v80 = a7;
  v10 = a5;
  if (a6 >= 0)
    v11 = a6;
  else
    v11 = a6 + 1;
  if (((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4) - a6 >= (unint64_t)a6)
    v12 = a6;
  else
    v12 = ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4) - a6;
  __p = 0;
  v84 = 0;
  v85 = 0;
  v76 = retstr;
  v77 = v10;
  __sz = 16 * v12;
  v78 = (unint64_t)v12 >> 60;
  if (v12)
  {
    if ((unint64_t)v12 >> 60)
      sub_1BE61F930();
    v13 = 0;
    v14 = v11 >> 1;
    __p = operator new(16 * v12);
    v84 = (char *)__p;
    v85 = (char *)__p + 16 * v12;
    v19 = 0.0;
    v20 = 0.0;
    while (1)
    {
      v21 = *(double **)a4;
      if (v80)
      {
        v22 = v13 + v14;
        v23 = &v21[2 * v13 + 2 * v14];
        v25 = v84;
        v24 = v85;
        if (v84 >= v85)
          goto LABEL_12;
      }
      else
      {
        v22 = ~v13 - v14 + ((uint64_t)(*((_QWORD *)a4 + 1) - (_QWORD)v21) >> 4);
        v23 = &v21[2 * v22];
        v25 = v84;
        v24 = v85;
        if (v84 >= v85)
        {
LABEL_12:
          v26 = a4;
          v27 = v12;
          v28 = v14;
          v29 = (char *)__p;
          v30 = (v25 - (_BYTE *)__p) >> 4;
          v31 = v30 + 1;
          if ((unint64_t)(v30 + 1) >> 60)
            sub_1BE61F930();
          v32 = v24 - (_BYTE *)__p;
          if (v32 >> 3 > v31)
            v31 = v32 >> 3;
          if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF0)
            v33 = 0xFFFFFFFFFFFFFFFLL;
          else
            v33 = v31;
          if (v33)
          {
            if (v33 >> 60)
              sub_1BE61F100();
            v34 = (char *)operator new(16 * v33);
          }
          else
          {
            v34 = 0;
          }
          v36 = &v34[16 * v30];
          *(_OWORD *)v36 = *(_OWORD *)v23;
          v37 = v36;
          v14 = v28;
          if (v25 != v29)
          {
            do
            {
              *((_OWORD *)v37 - 1) = *((_OWORD *)v25 - 1);
              v37 -= 16;
              v25 -= 16;
            }
            while (v25 != v29);
            v25 = v29;
          }
          v12 = v27;
          v38 = &v34[16 * v33];
          v35 = v36 + 16;
          __p = v37;
          v85 = v38;
          v10 = v77;
          a4 = v26;
          if (v25)
            operator delete(v25);
          retstr = v76;
          goto LABEL_30;
        }
      }
      *(_OWORD *)v25 = *(_OWORD *)v23;
      v35 = v25 + 16;
LABEL_30:
      v84 = v35;
      objc_msgSend_objectAtIndexedSubscript_(v10, v15, v22, v16, v17, v18);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writingOrientation(v39, v40, v41, v42, v43, v44);
      v46 = v45;
      v48 = v47;

      v19 = v19 + v46;
      v20 = v20 + v48;
      if (++v13 == v12)
        goto LABEL_33;
    }
  }
  v20 = 0.0;
  v19 = 0.0;
LABEL_33:
  v49 = atan2(v20 / (double)v12, v19 / (double)v12);
  memset(&v82, 0, sizeof(v82));
  CGAffineTransformMakeRotation(&v82, -v49);
  memset(&v81, 0, sizeof(v81));
  CGAffineTransformMakeRotation(&v81, v49);
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  if (v12)
  {
    if (v78)
      sub_1BE61F930();
    v50 = (CGPoint *)operator new(__sz);
    retstr->__begin_ = v50;
    retstr->__end_ = v50;
    retstr->__end_cap_.__value_ = &v50[v12];
    if (v80)
      goto LABEL_36;
  }
  else
  {
    v50 = 0;
    if (v80)
    {
LABEL_36:
      v51 = **(double **)a4;
      v52 = *(double *)(*(_QWORD *)a4 + 8);
      goto LABEL_39;
    }
  }
  v53 = *((_QWORD *)a4 + 1);
  v51 = *(double *)(v53 - 16);
  v52 = *(double *)(v53 - 8);
LABEL_39:
  v54 = v82.tx + v52 * v82.c + v82.a * v51;
  if (v12)
  {
    v55 = 0;
    while (1)
    {
      v57 = (double *)((char *)__p + 16 * v55);
      v58 = v57[1];
      v59 = v82.tx + v58 * v82.c + v82.a * *v57;
      v60 = vaddq_f64(*(float64x2_t *)&v81.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v81.c, v82.ty + v58 * v82.d + v82.b * *v57), *(float64x2_t *)&v81.a, v59 + v54 - v59 + v54 - v59));
      value = retstr->__end_cap_.__value_;
      if (v50 >= value)
        break;
      *v50 = (CGPoint)v60;
      v56 = v50 + 1;
LABEL_42:
      retstr->__end_ = v56;
      ++v55;
      v50 = v56;
      if (v55 == v12)
        goto LABEL_60;
    }
    begin = retstr->__begin_;
    v63 = v50 - retstr->__begin_;
    v64 = v63 + 1;
    if ((unint64_t)(v63 + 1) >> 60)
      sub_1BE61F930();
    v65 = (char *)value - (char *)begin;
    if (v65 >> 3 > v64)
      v64 = v65 >> 3;
    if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFF0)
      v66 = 0xFFFFFFFFFFFFFFFLL;
    else
      v66 = v64;
    if (v66)
    {
      v79 = (CGPoint)v60;
      if (v66 >> 60)
        sub_1BE61F100();
      v67 = (char *)operator new(16 * v66);
      v68 = (CGPoint *)&v67[16 * v63];
      *v68 = v79;
      v56 = v68 + 1;
      if (v50 == begin)
        goto LABEL_57;
    }
    else
    {
      v67 = 0;
      v68 = (CGPoint *)(16 * v63);
      *(float64x2_t *)(16 * v63) = v60;
      v56 = (CGPoint *)(16 * v63 + 16);
      if (v50 == begin)
        goto LABEL_57;
    }
    do
    {
      v68[-1] = v50[-1];
      --v68;
      --v50;
    }
    while (v50 != begin);
    v50 = retstr->__begin_;
LABEL_57:
    retstr->__begin_ = v68;
    retstr->__end_ = v56;
    retstr->__end_cap_.__value_ = (CGPoint *)&v67[16 * v66];
    if (v50)
      operator delete(v50);
    goto LABEL_42;
  }
  v56 = v50;
LABEL_60:
  if (v80)
  {
    v69 = retstr->__begin_;
    if (retstr->__begin_ != v56)
    {
      v70 = v56 - 1;
      if (&v56[-1] > v69)
      {
        v71 = v69 + 1;
        do
        {
          v86 = v71[-1];
          v72 = v86;
          v71[-1] = *v70;
          *v70-- = v72;
        }
        while (v71++ < v70);
      }
    }
  }
  if (__p)
  {
    v84 = (char *)__p;
    operator delete(__p);
  }

  return result;
}

- (BOOL)refineWritingOrientationAndResortSubstrokes:(id)a3 averageWritingOrientation:(CGVector *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  unint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  long double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  long double v51;
  double v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double MidX;
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
  double MidY;
  float v77;
  const char *v78;
  __float2 v79;
  __float2 v80;
  __float2 v81;
  __float2 v82;
  __float2 v83;
  double sinval;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  double v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  double v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  double v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  double v118;
  float v119;
  const char *v120;
  __float2 v121;
  __float2 v122;
  __float2 v123;
  __float2 v124;
  __float2 v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  double v137;
  uint64_t v138;
  unint64_t v139;
  double v140;
  double v141;
  double v142;
  double v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD *v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  double *v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double *v176;
  double *v177;
  CGRect *v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t v181;
  unint64_t v182;
  char *v183;
  double *v184;
  CGRect *v185;
  CGSize v186;
  double v187;
  double v188;
  double *v189;
  double *v190;
  int64_t v191;
  uint64_t v192;
  unint64_t v193;
  uint64_t v194;
  unint64_t v195;
  char *v196;
  double *v197;
  int64_t v198;
  unint64_t v199;
  uint64_t v200;
  uint64_t v201;
  double *v202;
  char *v203;
  double *v204;
  uint64_t v205;
  __int128 v206;
  uint64_t v207;
  uint64_t v208;
  CGRect *v209;
  CGRect *v210;
  unint64_t v211;
  int64x2_t *v212;
  uint64_t *v213;
  uint64_t v214;
  uint64_t *v215;
  unint64_t v216;
  int64x2_t v217;
  int64x2_t *v218;
  int64x2_t v219;
  int64x2_t v220;
  uint64_t v221;
  unint64_t v222;
  unint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  size_t v231;
  uint64_t v232;
  char *v233;
  double *v234;
  double v235;
  uint64_t v236;
  uint64_t *v237;
  _QWORD *v238;
  uint64_t v239;
  unint64_t v240;
  double v241;
  int64_t groupingContextSize;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  unint64_t v264;
  unint64_t v265;
  uint64_t v266;
  char *v267;
  char *v268;
  int64_t v269;
  char *v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  double v276;
  double v277;
  uint64_t v278;
  char *v280;
  char *v281;
  int64_t v282;
  uint64_t v283;
  unint64_t v284;
  uint64_t v285;
  unint64_t v286;
  char *v287;
  char *v288;
  int64_t v289;
  unint64_t v290;
  uint64_t v291;
  uint64_t v292;
  char *v293;
  char *v294;
  char *v295;
  uint64_t v296;
  __int128 v297;
  uint64_t v298;
  unint64_t v299;
  uint64_t v300;
  char *v301;
  char *v302;
  int64_t v303;
  uint64_t v304;
  unint64_t v305;
  uint64_t v306;
  unint64_t v307;
  char *v308;
  char *v309;
  int64_t v310;
  unint64_t v311;
  uint64_t v312;
  uint64_t v313;
  char *v314;
  char *v315;
  char *v316;
  uint64_t v317;
  __int128 v318;
  uint64_t v319;
  void *v320;
  uint64_t v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  void *v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  double v338;
  CGFloat v339;
  double v340;
  CGFloat v341;
  double v342;
  CGFloat v343;
  double v344;
  CGFloat v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  _QWORD *v350;
  CGRect *v351;
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  unint64_t v356;
  uint64_t v357;
  void *v358;
  CGRect *v359;
  double v360;
  double v361;
  double v362;
  double v363;
  double v365;
  CGFloat v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  id v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  void *v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  double v388;
  double v389;
  double v390;
  double v391;
  CGRect *v392;
  id v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  void *v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  CGFloat v405;
  CGFloat v406;
  CGFloat v407;
  CGFloat v408;
  double v410;
  CGFloat v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  const char *v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  BOOL v440;
  char *v441;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  const char *v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  unint64_t i;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  void *v460;
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
  uint64_t v471;
  double v472;
  double v473;
  double v474;
  double v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  void *v480;
  const char *v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  unint64_t j;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  void *v491;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  double v497;
  double v498;
  double v499;
  double v500;
  const char *v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  void *v505;
  const char *v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  CGVector *v511;
  CHBottomUpStrokeGroupingStrategy *v512;
  double v513;
  double v514;
  double v515;
  id v516;
  double v517;
  double v518;
  double v519;
  uint64_t v520;
  double cosval;
  double v522;
  int64_t v523;
  void *__p;
  void *v525;
  char *v526;
  void *v527;
  char *v528;
  char *v529;
  int64x2_t *v530;
  int64x2_t *v531;
  __int8 *v532;
  void *v533;
  unint64_t v534;
  char *v535;
  CGRect *v536;
  double *p_x;
  CGRect *v538;
  CGRect v539;
  CGRect v540;
  CGRect v541;
  CGRect v542;
  CGRect v543;
  CGRect v544;
  CGRect v545;
  CGRect v546;
  CGRect v547;
  CGRect v548;
  CGRect v549;
  CGRect v550;
  CGRect v551;
  CGRect v552;

  v536 = 0;
  p_x = 0;
  v538 = 0;
  v516 = a3;
  v11 = objc_msgSend_count(v516, v6, v7, v8, v9, v10);
  v17 = v11;
  if (v11)
  {
    if (v11 >> 59)
      sub_1BE61F930();
    v536 = (CGRect *)operator new(32 * v11);
    p_x = &v536->origin.x;
    v538 = &v536[v17];
  }
  v511 = a4;
  v512 = self;
  v533 = 0;
  v534 = 0;
  v535 = 0;
  v18 = objc_msgSend_count(v516, v12, v13, v14, v15, v16);
  v24 = v18;
  if (v18)
  {
    if (v18 >> 61)
      sub_1BE61F930();
    v25 = (char *)operator new(8 * v18);
    v533 = &v25[v534 & 0xFFFFFFFFFFFFFFF8];
    v534 = (unint64_t)v533;
    v535 = &v25[8 * v24];
  }
  v26 = 0;
  v27 = 0.0;
  while (v26 < objc_msgSend_count(v516, v19, v20, v21, v22, v23))
  {
    objc_msgSend_objectAtIndexedSubscript_(v516, v29, v26, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOriginalWritingDirectionIndex_(v34, v35, v26, v36, v37, v38);
    objc_msgSend_writingOrientation(v34, v39, v40, v41, v42, v43);
    v45 = v44;
    objc_msgSend_writingOrientation(v34, v46, v47, v48, v49, v50);
    v52 = atan2(v45, v51);
    objc_msgSend_substroke(v34, v53, v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bounds(v58, v59, v60, v61, v62, v63);
    MidX = CGRectGetMidX(v539);
    objc_msgSend_substroke(v34, v65, v66, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bounds(v70, v71, v72, v73, v74, v75);
    MidY = CGRectGetMidY(v540);

    v77 = v52;
    v83 = __sincosf_stret(v77);
    cosval = v83.__cosval;
    sinval = v83.__sinval;
    v515 = v27;
    if (v26)
    {
      objc_msgSend_objectAtIndexedSubscript_(v516, v78, v26 - 1, *(_QWORD *)&v80, *(_QWORD *)&v81, *(_QWORD *)&v82);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writingOrientation(v85, v86, v87, v88, v89, v90);
      v92 = v91;
      objc_msgSend_writingOrientation(v34, v93, v94, v95, v96, v97);
      v99 = v98;
      objc_msgSend_objectAtIndexedSubscript_(v516, v100, v26 - 1, v101, v102, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writingOrientation(v104, v105, v106, v107, v108, v109);
      v111 = v110;
      objc_msgSend_writingOrientation(v34, v112, v113, v114, v115, v116);
      v118 = atan2(v92 + v99, v111 + v117);

      v119 = v118;
      v125 = __sincosf_stret(v119);
      v126 = v125.__cosval;
      v127 = v125.__sinval;
      v129 = v513;
      v128 = v514;
    }
    else
    {
      objc_msgSend_strokeDeviation(v34, v78, *(_QWORD *)&v79, *(_QWORD *)&v80, *(_QWORD *)&v81, *(_QWORD *)&v82);
      v131 = v130;
      objc_msgSend_strokeDeviation(v34, v132, v133, v134, v135, v136);
      v128 = MidX + v131 * -2.0 * cosval;
      v129 = MidY + v137 * -2.0 * sinval;
      v127 = v83.__sinval;
      v126 = v83.__cosval;
    }
    v138 = 0;
    v139 = 0;
    v140 = 1.79769313e308;
    v141 = -1.79769313e308;
    v513 = v129;
    v514 = v128;
    v518 = v126 * (MidY - v129) - (MidX - v128) * v127 + 0.0;
    v519 = v127 * (MidY - v129) + (MidX - v128) * v126 + 0.0;
    v517 = -sinval;
    v142 = -1.79769313e308;
    v143 = 1.79769313e308;
    while (1)
    {
      objc_msgSend_substroke(v34, v120, *(_QWORD *)&v121, *(_QWORD *)&v122, *(_QWORD *)&v123, *(_QWORD *)&v124);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = (_QWORD *)objc_msgSend_convexHull(v144, v145, v146, v147, v148, v149);
      v151 = v150[1] - *v150;

      if (v139 >= v151 >> 4)
        break;
      objc_msgSend_substroke(v34, v152, v153, v154, v155, v156);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = (double *)(*(_QWORD *)objc_msgSend_convexHull(v157, v158, v159, v160, v161, v162) + v138);
      v164 = v141;
      v165 = MidY;
      v522 = v143;
      v166 = v140;
      v167 = sinval;
      v168 = *v163;
      v169 = v163[1];

      v170 = v168 - MidX;
      MidY = v165;
      v171 = v169 - v165;
      sinval = v167;
      v140 = v166;
      v143 = v522;
      v172 = v519 + cosval * v170 + sinval * v171;
      v173 = v518 + v517 * v170 + cosval * v171;
      if (v172 < v522)
        v143 = v172;
      if (v172 > v142)
        v142 = v172;
      if (v173 < v140)
        v140 = v173;
      if (v173 <= v164)
        v141 = v164;
      else
        v141 = v173;
      ++v139;
      v138 += 16;
    }
    v174 = v142 - v143;
    v175 = v141 - v140;
    v176 = p_x;
    if (p_x < (double *)v538)
    {
      *p_x = v143;
      v176[1] = v140;
      v177 = v176 + 4;
      v176[2] = v174;
      v176[3] = v175;
      goto LABEL_44;
    }
    v178 = v536;
    v179 = ((char *)p_x - (char *)v536) >> 5;
    v180 = v179 + 1;
    if ((unint64_t)(v179 + 1) >> 59)
      sub_1BE61F930();
    v181 = (char *)v538 - (char *)v536;
    if (((char *)v538 - (char *)v536) >> 4 > v180)
      v180 = v181 >> 4;
    if ((unint64_t)v181 >= 0x7FFFFFFFFFFFFFE0)
      v182 = 0x7FFFFFFFFFFFFFFLL;
    else
      v182 = v180;
    if (v182)
    {
      if (v182 >> 59)
        sub_1BE61F100();
      v183 = (char *)operator new(32 * v182);
      v184 = (double *)&v183[32 * v179];
      *v184 = v143;
      v184[1] = v140;
      v184[2] = v174;
      v184[3] = v175;
      v185 = (CGRect *)v184;
      if (v176 == (double *)v178)
      {
LABEL_42:
        v177 = v184 + 4;
        v536 = v185;
        v538 = (CGRect *)&v183[32 * v182];
        if (!v176)
          goto LABEL_44;
LABEL_43:
        operator delete(v176);
        goto LABEL_44;
      }
    }
    else
    {
      v183 = 0;
      v184 = (double *)(32 * v179);
      *v184 = v143;
      v184[1] = v140;
      v184[2] = v174;
      v184[3] = v175;
      v185 = (CGRect *)(32 * v179);
      if (v176 == (double *)v178)
        goto LABEL_42;
    }
    do
    {
      v186 = (CGSize)*((_OWORD *)v176 - 1);
      v185[-1].origin = (CGPoint)*((_OWORD *)v176 - 2);
      v185[-1].size = v186;
      --v185;
      v176 -= 4;
    }
    while (v176 != (double *)v178);
    v176 = &v178->origin.x;
    v177 = v184 + 4;
    v536 = v185;
    v538 = (CGRect *)&v183[32 * v182];
    if (v176)
      goto LABEL_43;
LABEL_44:
    p_x = v177;
    v541.origin.x = v143;
    v541.origin.y = v140;
    v541.size.width = v142 - v143;
    v541.size.height = v175;
    v187 = CGRectGetMidY(v541);
    v188 = v187;
    v189 = (double *)v534;
    if (v534 < (unint64_t)v535)
    {
      *(double *)v534 = v187;
      v28 = (uint64_t)(v189 + 1);
      goto LABEL_9;
    }
    v190 = (double *)v533;
    v191 = v534 - (_QWORD)v533;
    v192 = (uint64_t)(v534 - (_QWORD)v533) >> 3;
    v193 = v192 + 1;
    if ((unint64_t)(v192 + 1) >> 61)
      sub_1BE61F930();
    v194 = v535 - (_BYTE *)v533;
    if ((v535 - (_BYTE *)v533) >> 2 > v193)
      v193 = v194 >> 2;
    if ((unint64_t)v194 >= 0x7FFFFFFFFFFFFFF8)
      v195 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v195 = v193;
    if (v195)
    {
      if (v195 >> 61)
        sub_1BE61F100();
      v196 = (char *)operator new(8 * v195);
      v197 = (double *)&v196[8 * v192];
      *v197 = v188;
      v28 = (uint64_t)(v197 + 1);
      v198 = (char *)v189 - (char *)v190;
      if (v189 == v190)
        goto LABEL_62;
LABEL_56:
      v199 = v198 - 8;
      if (v199 < 0x58)
        goto LABEL_215;
      if ((unint64_t)((char *)v189 - v196 - v191) < 0x20)
        goto LABEL_215;
      v200 = (v199 >> 3) + 1;
      v201 = 8 * (v200 & 0x3FFFFFFFFFFFFFFCLL);
      v202 = &v189[v201 / 0xFFFFFFFFFFFFFFF8];
      v197 = (double *)((char *)v197 - v201);
      v203 = &v196[8 * v192 - 16];
      v204 = v189 - 2;
      v205 = v200 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v206 = *(_OWORD *)v204;
        *((_OWORD *)v203 - 1) = *((_OWORD *)v204 - 1);
        *(_OWORD *)v203 = v206;
        v203 -= 32;
        v204 -= 4;
        v205 -= 4;
      }
      while (v205);
      v189 = v202;
      if (v200 != (v200 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_215:
        do
        {
          v207 = *((_QWORD *)v189-- - 1);
          *((_QWORD *)v197-- - 1) = v207;
        }
        while (v189 != v190);
      }
      goto LABEL_62;
    }
    v196 = 0;
    v197 = (double *)(8 * v192);
    *(double *)(8 * v192) = v187;
    v28 = 8 * v192 + 8;
    v198 = (char *)v189 - (char *)v190;
    if (v189 != v190)
      goto LABEL_56;
LABEL_62:
    v533 = v197;
    v535 = &v196[8 * v195];
    if (v190)
      operator delete(v190);
LABEL_9:
    v534 = v28;
    v27 = v515 + sqrt(v175 * v175 + v174 * v174);

    ++v26;
  }
  v208 = objc_msgSend_count(v516, v29, v30, v31, v32, v33);
  v210 = v536;
  v209 = (CGRect *)p_x;
  v531 = 0;
  v532 = 0;
  v530 = 0;
  v211 = (char *)p_x - (char *)v536;
  if (p_x == (double *)v536)
  {
    v212 = 0;
    v213 = 0;
  }
  else
  {
    if ((v211 & 0x8000000000000000) != 0)
      sub_1BE61F930();
    v212 = (int64x2_t *)operator new(v211 >> 2);
    v530 = v212;
    v532 = &v212->i8[8 * ((uint64_t)v211 >> 5)];
    bzero(v212, v211 >> 2);
    v213 = (uint64_t *)((char *)v212->i64 + (v211 >> 2));
    v531 = (int64x2_t *)v213;
    if ((v211 >> 2) - 8 < 0x18)
    {
      v214 = 0;
      v215 = (uint64_t *)v212;
      goto LABEL_72;
    }
    v216 = (((v211 >> 2) - 8) >> 3) + 1;
    v214 = v216 & 0x3FFFFFFFFFFFFFFCLL;
    v215 = &v212->i64[v216 & 0x3FFFFFFFFFFFFFFCLL];
    v217 = (int64x2_t)xmmword_1BE8D5080;
    v218 = v212 + 1;
    v219 = vdupq_n_s64(2uLL);
    v220 = vdupq_n_s64(4uLL);
    v221 = v216 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v218[-1] = v217;
      *v218 = vaddq_s64(v217, v219);
      v217 = vaddq_s64(v217, v220);
      v218 += 2;
      v221 -= 4;
    }
    while (v221);
    if (v216 != v214)
    {
      do
LABEL_72:
        *v215++ = v214++;
      while (v215 != v213);
    }
  }
  v527 = &v536;
  v222 = ((char *)v213 - (char *)v212) >> 3;
  v223 = 126 - 2 * __clz(v222);
  if (v209 == v210)
    v224 = 0;
  else
    v224 = v223;
  sub_1BE86F490(v212->i64, v213, (uint64_t **)&v527, v224, 1);
  v527 = 0;
  v528 = 0;
  v529 = 0;
  v230 = v533;
  v231 = v534 - (_QWORD)v533;
  v232 = (uint64_t)(v534 - (_QWORD)v533) >> 3;
  if ((void *)v534 == v533)
  {
    v234 = 0;
    v233 = 0;
    v235 = v27 / (double)(unint64_t)v208;
    if (v213 == (uint64_t *)v212)
      goto LABEL_88;
  }
  else
  {
    if ((v231 & 0x8000000000000000) != 0)
      sub_1BE61F930();
    v233 = (char *)operator new(v534 - (_QWORD)v533);
    v234 = (double *)&v233[8 * v232];
    memcpy(v233, v230, v231);
    v235 = v27 / (double)(unint64_t)v208;
    if (v213 == (uint64_t *)v212)
    {
LABEL_88:
      if (v230)
        goto LABEL_89;
      goto LABEL_90;
    }
  }
  if (v232 != v222)
    goto LABEL_88;
  if (v222 <= 1)
    v236 = 1;
  else
    v236 = ((char *)v213 - (char *)v212) >> 3;
  v237 = (uint64_t *)v212;
  v238 = v233;
  do
  {
    v239 = *v237++;
    *v238++ = *((_QWORD *)v230 + v239);
    --v236;
  }
  while (v236);
LABEL_89:
  v534 = (unint64_t)v230;
  operator delete(v230);
LABEL_90:
  v240 = 0;
  v533 = v233;
  v534 = (unint64_t)v234;
  v535 = (char *)v234;
  v241 = v235 * 0.7;
  v527 = 0;
  v528 = 0;
  groupingContextSize = v512->_groupingContextSize;
  v529 = 0;
  v523 = groupingContextSize;
  v520 = 2 * groupingContextSize;
  while (2)
  {
    if (v240 < objc_msgSend_count(v516, v225, v226, v227, v228, v229))
    {
      v253 = v240 + v520;
      if (objc_msgSend_count(v516, v243, v244, v245, v246, v247) - 1 < v240 + v520)
        v253 = objc_msgSend_count(v516, v248, v249, v250, v251, v252) - 1;
      if ((double)v512->_groupingContextSize * 1.5 > (double)(unint64_t)(objc_msgSend_count(v516, v248, v249, v250, v251, v252)+ ~v253))v253 = objc_msgSend_count(v516, v254, v255, v256, v257, v258) - 1;
      v264 = objc_msgSend_count(v516, v254, v255, v256, v257, v258);
      v265 = v253 + 1 + v523;
      if (v264 < v265)
        v265 = objc_msgSend_count(v516, v259, v260, v261, v262, v263);
      v525 = 0;
      v526 = 0;
      v266 = (v240 - v523) & ~((uint64_t)(v240 - v523) >> 63);
      __p = 0;
      if (v265 != v266)
      {
        v267 = (char *)v533 + 8 * v266;
        v268 = (char *)v533 + 8 * v265;
        v269 = v268 - v267;
        if (v268 - v267 < 0)
          sub_1BE61F930();
        __p = operator new(v268 - v267);
        v525 = __p;
        v270 = (char *)__p + 8 * (v269 >> 3);
        v526 = v270;
        memmove(__p, v267, v269);
        v525 = v270;
      }
      v271 = (void *)objc_opt_class();
      objc_msgSend_vectorMeanWithoutOutliers_(v271, v272, (uint64_t)&__p, v273, v274, v275);
      v277 = v276;
      if ((uint64_t)v240 > v253)
      {
LABEL_103:
        if (__p)
        {
          v525 = __p;
          operator delete(__p);
        }
        v240 = v253 + 1;
        continue;
      }
      while (2)
      {
        if (vabdd_f64(*((double *)v533 + v240), v277) >= v241)
          goto LABEL_107;
        v280 = v528;
        if (v528 < v529)
        {
          *(_QWORD *)v528 = v212->i64[v240];
          v278 = (uint64_t)(v280 + 8);
          goto LABEL_106;
        }
        v281 = (char *)v527;
        v282 = v528 - (_BYTE *)v527;
        v283 = (v528 - (_BYTE *)v527) >> 3;
        v284 = v283 + 1;
        if ((unint64_t)(v283 + 1) >> 61)
          sub_1BE61F930();
        v285 = v529 - (_BYTE *)v527;
        if ((v529 - (_BYTE *)v527) >> 2 > v284)
          v284 = v285 >> 2;
        if ((unint64_t)v285 >= 0x7FFFFFFFFFFFFFF8)
          v286 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v286 = v284;
        if (v286)
        {
          if (v286 >> 61)
            sub_1BE61F100();
          v287 = (char *)operator new(8 * v286);
          v288 = &v287[8 * v283];
          *(_QWORD *)v288 = v212->i64[v240];
          v278 = (uint64_t)(v288 + 8);
          v289 = v280 - v281;
          if (v280 == v281)
          {
LABEL_127:
            v527 = v288;
            v528 = (char *)v278;
            v529 = &v287[8 * v286];
            if (v281)
              operator delete(v281);
LABEL_106:
            v528 = (char *)v278;
LABEL_107:
            if (v240++ == v253)
              goto LABEL_103;
            continue;
          }
        }
        else
        {
          v287 = 0;
          v288 = (char *)(8 * v283);
          *(_QWORD *)(8 * v283) = v212->i64[v240];
          v278 = 8 * v283 + 8;
          v289 = v280 - v281;
          if (v280 == v281)
            goto LABEL_127;
        }
        break;
      }
      v290 = v289 - 8;
      if (v290 < 0x58)
        goto LABEL_216;
      if ((unint64_t)(v280 - v287 - v282) < 0x20)
        goto LABEL_216;
      v291 = (v290 >> 3) + 1;
      v292 = 8 * (v291 & 0x3FFFFFFFFFFFFFFCLL);
      v293 = &v280[-v292];
      v288 -= v292;
      v294 = &v287[8 * v283 - 16];
      v295 = v280 - 16;
      v296 = v291 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v297 = *(_OWORD *)v295;
        *((_OWORD *)v294 - 1) = *((_OWORD *)v295 - 1);
        *(_OWORD *)v294 = v297;
        v294 -= 32;
        v295 -= 32;
        v296 -= 4;
      }
      while (v296);
      v280 = v293;
      if (v291 != (v291 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_216:
        do
        {
          v298 = *((_QWORD *)v280 - 1);
          v280 -= 8;
          *((_QWORD *)v288 - 1) = v298;
          v288 -= 8;
        }
        while (v280 != v281);
      }
      goto LABEL_127;
    }
    break;
  }
  if (v512->_groupingContextSize > (unint64_t)((v528 - (_BYTE *)v527) >> 3))
  {
    v299 = 0;
    v528 = (char *)v527;
    while (1)
    {
      if (v299 >= objc_msgSend_count(v516, v243, v244, v245, v246, v247))
        goto LABEL_154;
      v301 = v528;
      if (v528 < v529)
      {
        *(_QWORD *)v528 = v212->i64[v299];
        v300 = (uint64_t)(v301 + 8);
        goto LABEL_132;
      }
      v302 = (char *)v527;
      v303 = v528 - (_BYTE *)v527;
      v304 = (v528 - (_BYTE *)v527) >> 3;
      v305 = v304 + 1;
      if ((unint64_t)(v304 + 1) >> 61)
        sub_1BE61F930();
      v306 = v529 - (_BYTE *)v527;
      if ((v529 - (_BYTE *)v527) >> 2 > v305)
        v305 = v306 >> 2;
      v307 = (unint64_t)v306 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v305;
      if (v307)
        break;
      v308 = 0;
      v309 = (char *)(8 * v304);
      *(_QWORD *)(8 * v304) = v212->i64[v299];
      v300 = 8 * v304 + 8;
      v310 = v301 - v302;
      if (v301 != v302)
        goto LABEL_146;
LABEL_152:
      v527 = v309;
      v528 = (char *)v300;
      v529 = &v308[8 * v307];
      if (v302)
        operator delete(v302);
LABEL_132:
      v528 = (char *)v300;
      ++v299;
    }
    if (v307 >> 61)
      sub_1BE61F100();
    v308 = (char *)operator new(8 * v307);
    v309 = &v308[8 * v304];
    *(_QWORD *)v309 = v212->i64[v299];
    v300 = (uint64_t)(v309 + 8);
    v310 = v301 - v302;
    if (v301 == v302)
      goto LABEL_152;
LABEL_146:
    v311 = v310 - 8;
    if (v311 < 0x58)
      goto LABEL_217;
    if ((unint64_t)(v301 - v308 - v303) < 0x20)
      goto LABEL_217;
    v312 = (v311 >> 3) + 1;
    v313 = 8 * (v312 & 0x3FFFFFFFFFFFFFFCLL);
    v314 = &v301[-v313];
    v309 -= v313;
    v315 = &v308[8 * v304 - 16];
    v316 = v301 - 16;
    v317 = v312 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v318 = *(_OWORD *)v316;
      *((_OWORD *)v315 - 1) = *((_OWORD *)v316 - 1);
      *(_OWORD *)v315 = v318;
      v315 -= 32;
      v316 -= 32;
      v317 -= 4;
    }
    while (v317);
    v301 = v314;
    if (v312 != (v312 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_217:
      do
      {
        v319 = *((_QWORD *)v301 - 1);
        v301 -= 8;
        *((_QWORD *)v309 - 1) = v319;
        v309 -= 8;
      }
      while (v301 != v302);
    }
    goto LABEL_152;
  }
LABEL_154:
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v243, v244, v245, v246, v247);
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  v321 = *(_QWORD *)v527;
  objc_msgSend_objectAtIndexedSubscript_(v516, v322, *(_QWORD *)v527, v323, v324, v325);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substroke(v326, v327, v328, v329, v330, v331);
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v332, v333, v334, v335, v336, v337);
  v339 = v338;
  v341 = v340;
  v343 = v342;
  v345 = v344;

  v350 = v527;
  if ((unint64_t)(v528 - (_BYTE *)v527) >= 9)
  {
    v351 = &v536[v321];
    width = v351->size.width;
    height = v351->size.height;
    x = v351->origin.x;
    y = v351->origin.y;
    v356 = 1;
    while (1)
    {
      v357 = v350[v356];
      objc_msgSend_objectAtIndexedSubscript_(v516, v346, v357, v347, v348, v349);
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      v542.origin.x = x;
      v542.origin.y = y;
      v542.size.width = width;
      v542.size.height = height;
      v543 = CGRectIntersection(v542, v536[v357]);
      v359 = &v536[v357];
      v360 = v359->size.width;
      if (width >= v360)
        v361 = v359->size.width;
      else
        v361 = width;
      if (v361 == 0.0)
      {
        v362 = v536[v357].origin.x;
        if (width == 0.0)
        {
          v363 = v360 + v362;
          if (x >= v362 && x <= v363)
            goto LABEL_169;
        }
        else if (v362 >= x && v362 <= width + x)
        {
LABEL_169:
          v393 = v358;

          objc_msgSend_substroke(v393, v394, v395, v396, v397, v398);
          v399 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v399, v400, v401, v402, v403, v404);
          v552.origin.x = v405;
          v552.origin.y = v406;
          v552.size.width = v407;
          v552.size.height = v408;
          v546.origin.x = v339;
          v546.origin.y = v341;
          v546.size.width = v343;
          v546.size.height = v345;
          v547 = CGRectUnion(v546, v552);
          v339 = v547.origin.x;
          v341 = v547.origin.y;
          v343 = v547.size.width;
          v345 = v547.size.height;

          v548.origin.x = x;
          v548.origin.y = y;
          v548.size.width = width;
          v548.size.height = height;
          v549 = CGRectUnion(v548, v536[v357]);
          x = v549.origin.x;
          y = v549.origin.y;
          width = v549.size.width;
          height = v549.size.height;
          goto LABEL_156;
        }
      }
      else if (v543.size.width / v361 > 0.8)
      {
        goto LABEL_169;
      }
      v544.origin.x = v339;
      v544.origin.y = v341;
      v544.size.width = v343;
      v544.size.height = v345;
      v365 = CGRectGetMidX(v544);
      v545.origin.x = v339;
      v545.origin.y = v341;
      v545.size.width = v343;
      v545.size.height = v345;
      v366 = CGRectGetMidY(v545);
      objc_msgSend_setCoalescedCenter_(v326, v367, v368, v369, v370, v371, v365, v366);
      objc_msgSend_addObject_(v320, v372, (uint64_t)v326, v373, v374, v375);
      v376 = v358;

      objc_msgSend_substroke(v376, v377, v378, v379, v380, v381);
      v382 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v382, v383, v384, v385, v386, v387);
      v339 = v388;
      v341 = v389;
      v343 = v390;
      v345 = v391;

      v392 = &v536[v357];
      x = v392->origin.x;
      y = v392->origin.y;
      width = v392->size.width;
      height = v392->size.height;
LABEL_156:

      ++v356;
      v350 = v527;
      v326 = v358;
      if (v356 >= (v528 - (_BYTE *)v527) >> 3)
        goto LABEL_176;
    }
  }
  v358 = v326;
LABEL_176:
  v550.origin.x = v339;
  v550.origin.y = v341;
  v550.size.width = v343;
  v550.size.height = v345;
  v410 = CGRectGetMidX(v550);
  v551.origin.x = v339;
  v551.origin.y = v341;
  v551.size.width = v343;
  v551.size.height = v345;
  v411 = CGRectGetMidY(v551);
  objc_msgSend_setCoalescedCenter_(v358, v412, v413, v414, v415, v416, v410, v411);
  objc_msgSend_addObject_(v320, v417, (uint64_t)v358, v418, v419, v420);
  v426 = objc_msgSend_count(v516, v421, v422, v423, v424, v425);
  if (v426 == objc_msgSend_count(v320, v427, v428, v429, v430, v431)
    || (unint64_t)objc_msgSend_count(v320, v432, v433, v434, v435, v436) < v512->_groupingContextSize)
  {
    v440 = 0;

    v441 = (char *)v527;
    if (!v527)
      goto LABEL_180;
    goto LABEL_179;
  }
  objc_msgSend_updateLocalWritingOrientationsForSubstrokes_useCoalescedCenter_(v512, v437, (uint64_t)v320, 1, v438, v439);
  if ((unint64_t)objc_msgSend_count(v320, v443, v444, v445, v446, v447) > v512->_groupingContextSize)
    objc_msgSend_refineLocalWritingOrientationsForSubstrokes_useCoalescedCenter_(v512, v448, (uint64_t)v320, 1, v451, v452);
  v453 = 0;
  for (i = 0; i < objc_msgSend_count(v320, v448, v449, v450, v451, v452); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v320, v455, i, v457, v458, v459);
    v460 = (void *)objc_claimAutoreleasedReturnValue();
    v471 = objc_msgSend_originalWritingDirectionIndex(v460, v461, v462, v463, v464, v465);
    if (v453 < v471)
    {
      do
      {
        objc_msgSend_writingOrientation(v460, v466, v467, v468, v469, v470);
        v473 = v472;
        v475 = v474;
        objc_msgSend_objectAtIndexedSubscript_(v516, v476, v453, v477, v478, v479);
        v480 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setWritingOrientation_(v480, v481, v482, v483, v484, v485, v473, v475);

        ++v453;
      }
      while (v471 != v453);
    }

    v453 = v471;
  }
  for (j = v453 + 1; j < objc_msgSend_count(v516, v455, v456, v457, v458, v459); ++j)
  {
    objc_msgSend_objectAtIndexedSubscript_(v516, v487, v453, v488, v489, v490);
    v491 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writingOrientation(v491, v492, v493, v494, v495, v496);
    v498 = v497;
    v500 = v499;
    objc_msgSend_objectAtIndexedSubscript_(v516, v501, j, v502, v503, v504);
    v505 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWritingOrientation_(v505, v506, v507, v508, v509, v510, v498, v500);

  }
  objc_msgSend_sortSubstrokesByWritingDirection_averageWritingOrientation_(v512, v487, (uint64_t)v516, (uint64_t)v511, v489, v490);
  v440 = 1;

  v441 = (char *)v527;
  if (v527)
  {
LABEL_179:
    v528 = v441;
    operator delete(v441);
  }
LABEL_180:
  if (v212)
  {
    v531 = v212;
    operator delete(v212);
  }
  if (v533)
  {
    v534 = (unint64_t)v533;
    operator delete(v533);
  }
  if (v536)
  {
    p_x = &v536->origin.x;
    operator delete(v536);
  }

  return v440;
}

- (void)updateLocalStrokeDeviationsForSubstrokes:(id)a3 averageStrokeDeviation:(CGVector *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t i;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double dx;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double dy;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t j;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
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
  double MidX;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double MidY;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  double v89;
  double v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  double v99;
  double v100;
  _QWORD *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
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
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  double v145;
  double v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  double v169;
  double v170;
  unint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  unint64_t v177;
  unint64_t k;
  double *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  double v191;
  double v192;
  double v193;
  double v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  double v200;
  double v201;
  double v202;
  double v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  double v210;
  double v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  double v218;
  double v219;
  double v220;
  double v221;
  float64x2_t *v222;
  uint64_t v223;
  unint64_t v224;
  uint64_t v225;
  unint64_t v226;
  char *v227;
  double *v228;
  uint64_t v229;
  unint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  double *f64;
  double v236;
  double v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  double v244;
  double v245;
  double strokeDeviationCapCoeff;
  double v247;
  float64x2_t v248;
  id v249;
  float64x2_t *__p;
  double *v251;
  float64x2_t *v252;
  CGRect v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;

  v249 = a3;
  if ((unint64_t)objc_msgSend_count(v249, v6, v7, v8, v9, v10) < 2)
  {
    for (i = 0; i < objc_msgSend_count(v249, v11, v12, v13, v14, v15); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v249, v17, i, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substroke(v21, v22, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_bounds(v27, v28, v29, v30, v31, v32);
      dx = v33;
      objc_msgSend_bounds(v27, v35, v36, v37, v38, v39);
      if (dx < self->_defaultDeviationVector.dx)
        dx = self->_defaultDeviationVector.dx;
      if (v44 >= self->_defaultDeviationVector.dy)
        dy = v44;
      else
        dy = self->_defaultDeviationVector.dy;
      objc_msgSend_objectAtIndexedSubscript_(v249, v40, i, v41, v42, v43);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setStrokeDeviation_(v46, v47, v48, v49, v50, v51, dx, dy);

      if (a4)
      {
        a4->dx = dx;
        a4->dy = dy;
      }

    }
    goto LABEL_70;
  }
  for (j = 0; j < objc_msgSend_count(v249, v11, v12, v13, v14, v15); ++j)
  {
    objc_msgSend_objectAtIndexedSubscript_(v249, v53, j, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substroke(v58, v59, v60, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_bounds(v64, v65, v66, v67, v68, v69);
    MidX = CGRectGetMidX(v253);
    objc_msgSend_bounds(v64, v71, v72, v73, v74, v75);
    MidY = CGRectGetMidY(v254);
    objc_msgSend_objectAtIndexedSubscript_(v249, v77, j, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writingOrientation(v81, v82, v83, v84, v85, v86);
    v88 = v87;
    v90 = v89;

    v96 = 0;
    v97 = 0;
    v98 = 0.0;
    v99 = 0.0;
    v100 = 0.0;
    while (1)
    {
      v101 = (_QWORD *)objc_msgSend_convexHull(v64, v91, v92, v93, v94, v95);
      if (v97 >= (unint64_t)((uint64_t)(v101[1] - *v101) >> 4))
        break;
      v107 = (double *)(*(_QWORD *)objc_msgSend_convexHull(v64, v102, v103, v104, v105, v106) + v96);
      v108 = MidX - *v107;
      v109 = MidY - v107[1];
      v100 = v100 + fabs(v90 * v109 + v108 * v88) * 2.0;
      v110 = fabs(v88 * v109 - v108 * v90);
      v99 = v99 + v110 * 2.0;
      if (v110 > v98)
        v98 = v110;
      ++v97;
      v96 += 16;
    }
    if ((unint64_t)v97 > 1)
    {
      v100 = v100 / (double)v97;
      v99 = v99 / (double)v97;
    }
    if (v100 <= v99)
      v111 = v99;
    else
      v111 = v100;
    strokeDeviationCapCoeff = self->_strokeDeviationCapCoeff;
    v247 = v111;
    if (j)
    {
      objc_msgSend_objectAtIndexedSubscript_(v249, v102, j - 1, v104, v105, v106);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substroke(v112, v113, v114, v115, v116, v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v118, v119, v120, v121, v122, v123);
      v245 = CGRectGetMidX(v255);
      objc_msgSend_substroke(v112, v124, v125, v126, v127, v128);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v129, v130, v131, v132, v133, v134);
      v244 = CGRectGetMidY(v256);

      objc_msgSend_objectAtIndexedSubscript_(v249, v135, j - 1, v136, v137, v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writingOrientation(v139, v140, v141, v142, v143, v144);
      v146 = v145;
      objc_msgSend_objectAtIndexedSubscript_(v249, v147, j - 1, v148, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writingOrientation(v151, v152, v153, v154, v155, v156);
      v157 = (v88 + v146) * 0.5;
      v159 = (v90 + v158) * 0.5;

      v100 = v100 + fabs((MidY - v244) * v159 + (MidX - v245) * v157);
      v160 = fabs((MidY - v244) * v157 - (MidX - v245) * v159);
      if (v160 > v98)
        v98 = v160;

      v161 = 3.0;
    }
    else
    {
      v161 = 2.0;
    }
    objc_msgSend_objectAtIndexedSubscript_(v249, v102, j, v104, v105, v106);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = v162;
    v169 = v247 * strokeDeviationCapCoeff;
    if (v98 >= v247 * strokeDeviationCapCoeff)
      v170 = v247 * strokeDeviationCapCoeff;
    else
      v170 = v98;
    if (v100 / v161 < v169)
      v169 = v100 / v161;
    objc_msgSend_setStrokeDeviation_(v162, v163, v164, v165, v166, v167, v169, v170);

  }
  __p = 0;
  v251 = 0;
  v252 = 0;
  v171 = objc_msgSend_count(v249, v53, v54, v55, v56, v57);
  v177 = v171;
  if (v171)
  {
    if (v171 >> 60)
      sub_1BE61F930();
    __p = (float64x2_t *)operator new(16 * v171);
    v251 = (double *)__p;
    v252 = &__p[v177];
  }
  for (k = 0; k < objc_msgSend_count(v249, v172, v173, v174, v175, v176); ++k)
  {
    objc_msgSend_objectAtIndexedSubscript_(v249, v180, k, v182, v183, v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeDeviation(v185, v186, v187, v188, v189, v190);
    v192 = v191;
    v194 = v193;

    v201 = self->_defaultDeviationVector.dx;
    v200 = self->_defaultDeviationVector.dy;
    v202 = v200;
    v203 = v201;
    if (k)
    {
      objc_msgSend_objectAtIndexedSubscript_(v249, v195, k - 1, v197, v198, v199);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeDeviation(v204, v205, v206, v207, v208, v209);
      v203 = v210;
      v202 = v211;

    }
    if (k < objc_msgSend_count(v249, v195, v196, v197, v198, v199) - 1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v249, v172, k + 1, v174, v175, v176);
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeDeviation(v212, v213, v214, v215, v216, v217);
      v201 = v218;
      v200 = v219;

    }
    v220 = v192 * 0.5 + v203 * 0.25 + v201 * 0.25;
    v221 = v194 * 0.5 + v202 * 0.25 + v200 * 0.25;
    v222 = (float64x2_t *)v251;
    if (v251 < (double *)v252)
    {
      *v251 = v220;
      v251[1] = v221;
      v179 = v251 + 2;
      goto LABEL_40;
    }
    v223 = ((char *)v251 - (char *)__p) >> 4;
    v224 = v223 + 1;
    if ((unint64_t)(v223 + 1) >> 60)
      sub_1BE61F930();
    v225 = (char *)v252 - (char *)__p;
    if (((char *)v252 - (char *)__p) >> 3 > v224)
      v224 = v225 >> 3;
    if ((unint64_t)v225 >= 0x7FFFFFFFFFFFFFF0)
      v226 = 0xFFFFFFFFFFFFFFFLL;
    else
      v226 = v224;
    if (v226)
    {
      if (v226 >> 60)
        sub_1BE61F100();
      v227 = (char *)operator new(16 * v226);
      v228 = (double *)&v227[16 * v223];
      *v228 = v220;
      v228[1] = v221;
      v229 = (uint64_t)v228;
      if (v251 == (double *)__p)
      {
LABEL_61:
        v179 = v228 + 2;
        __p = (float64x2_t *)v229;
        v252 = (float64x2_t *)&v227[16 * v226];
        if (!v251)
          goto LABEL_40;
LABEL_62:
        operator delete(v222);
        goto LABEL_40;
      }
    }
    else
    {
      v227 = 0;
      v228 = (double *)(16 * v223);
      *v228 = v220;
      v228[1] = v221;
      v229 = 16 * v223;
      if (v251 == (double *)__p)
        goto LABEL_61;
    }
    do
    {
      *(float64x2_t *)(v229 - 16) = v222[-1];
      v229 -= 16;
      --v222;
    }
    while (v222 != __p);
    v222 = __p;
    v179 = v228 + 2;
    __p = (float64x2_t *)v229;
    v252 = (float64x2_t *)&v227[16 * v226];
    if (v222)
      goto LABEL_62;
LABEL_40:
    v251 = v179;
  }
  v230 = 0;
  v248 = 0u;
  while (v230 < objc_msgSend_count(v249, v180, v181, v182, v183, v184))
  {
    f64 = __p[v230].f64;
    v236 = *f64;
    v237 = f64[1];
    objc_msgSend_objectAtIndexedSubscript_(v249, v231, v230, v232, v233, v234);
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStrokeDeviation_(v238, v239, v240, v241, v242, v243, v236, v237);

    v248 = vaddq_f64(v248, __p[v230++]);
  }
  if (a4)
    *(float64x2_t *)a4 = vdivq_f64(v248, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(unint64_t)(((char *)v251 - (char *)__p) >> 4)), 0));
  if (__p)
    operator delete(__p);
LABEL_70:

}

- (void)mergeGroupsPostProcessing:(id)a3 createdGroups:(id)a4 deletedGroups:(id)a5 availableGroupingStrategies:(id)a6 allowOppositeOrientations:(BOOL)a7
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char isMemberOfClass;
  void *v50;
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
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  float v95;
  float v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  float v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  double v123;
  int v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  double MinY;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  double v153;
  CGFloat v154;
  double v155;
  CGFloat v156;
  double v157;
  CGFloat v158;
  double v159;
  CGFloat v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  double v170;
  double v171;
  double v172;
  double v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  double v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t *v198;
  uint64_t **v199;
  uint64_t v200;
  uint64_t *v201;
  void *v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  int v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  float v241;
  float v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  float v253;
  float v254;
  double v255;
  int v256;
  uint64_t *v257;
  uint64_t **v258;
  uint64_t **v259;
  uint64_t v260;
  uint64_t *v261;
  uint64_t *v262;
  id v263;
  id v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  double v271;
  double v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  double v284;
  double v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  double v291;
  double v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  double v298;
  double v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  double v305;
  double v306;
  const char *v307;
  uint64_t v308;
  __int128 v309;
  double *v310;
  char *v311;
  char *v312;
  __int128 v313;
  __int128 v314;
  BOOL v315;
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
  double v326;
  double v327;
  double v328;
  double v329;
  double v330;
  double v331;
  double v332;
  double v333;
  const char *v334;
  uint64_t v335;
  CGFloat v336;
  CGFloat v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  double v341;
  double v342;
  BOOL v343;
  double v344;
  CGFloat v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  double v349;
  double v350;
  double v351;
  double v352;
  double v353;
  double v354;
  const char *v355;
  uint64_t v356;
  double v357;
  double v358;
  double v359;
  double v360;
  double MidX;
  CGFloat v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  double v366;
  double v367;
  double v368;
  double v369;
  const char *v370;
  uint64_t v371;
  double v372;
  double v373;
  char v374;
  int v375;
  _BOOL4 v376;
  double v377;
  double v378;
  double v379;
  double v380;
  double v381;
  double MaxX;
  double v383;
  double v384;
  int v385;
  double v386;
  double v387;
  double v388;
  CGFloat v389;
  CGFloat v390;
  double v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  double v397;
  double v398;
  double v399;
  double v400;
  void *v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  double v407;
  id v410;
  const char *v411;
  uint64_t v412;
  void *v413;
  uint64_t v414;
  uint64_t v415;
  int v416;
  double v417;
  uint64_t v418;
  uint64_t v419;
  id v420;
  double v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  double v427;
  long double v428;
  const char *v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  long double v434;
  double v435;
  double v436;
  id v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  const char *v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t *v446;
  uint64_t **v447;
  uint64_t **v448;
  uint64_t v449;
  uint64_t *v450;
  uint64_t *v451;
  char v452;
  char *v453;
  void *v454;
  uint64_t v455;
  const char *v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  void *v460;
  const char *v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  const char *v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  const char *v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  const char *v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
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
  uint64_t v495;
  uint64_t v496;
  const char *v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  const char *v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  const char *v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  double v510;
  double v511;
  const char *v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  const char *v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  unint64_t v522;
  double v523;
  double v524;
  const char *v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  void *v529;
  const char *v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  double v535;
  double v536;
  const char *v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  void *v541;
  const char *v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  double v547;
  double v548;
  id v549;
  id v550;
  uint64_t v551;
  void *v552;
  id v553;
  void *v554;
  double height;
  double v556;
  double v557;
  double width;
  double v559;
  _BOOL4 v560;
  double v561;
  double MaxY;
  CGFloat rect;
  CGFloat MinX;
  double v565;
  double v566;
  uint64_t v567;
  double r1;
  float v569;
  void *v571;
  double v572;
  int v573;
  void *v574;
  void *v575;
  void *v576;
  void *v577;
  id v578;
  void *v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  void *__p;
  char *v585;
  void *v586[3];
  uint64_t **v587;
  uint64_t *v588;
  uint64_t v589;
  _BYTE v590[128];
  uint64_t v591;
  CGRect v592;
  CGRect v593;
  CGRect v594;
  CGRect v595;
  CGRect v596;
  CGRect v597;
  CGRect v598;
  CGRect v599;
  CGRect v600;
  CGRect v601;
  CGRect v602;
  CGRect v603;
  CGRect v604;
  CGRect v605;
  CGRect v606;
  CGRect v607;
  CGRect v608;
  CGRect v609;
  CGRect v610;
  CGRect v611;
  CGRect v612;
  CGRect v613;
  CGRect v614;
  CGRect v615;
  CGRect v616;
  CGRect v617;

  v560 = a7;
  v591 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v553 = a4;
  v549 = a5;
  v550 = a6;
  v552 = v10;
  objc_msgSend_allObjects(v10, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v16, v17, (uint64_t)&unk_1E77F1AF0, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v579 = (void *)objc_msgSend_mutableCopy(v21, v22, v23, v24, v25, v26);

  v588 = 0;
  v589 = 0;
  v587 = &v588;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v27, v28, v29, v30, v31);
  v574 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = 20;
  if (v560)
    v38 = 0x7FFFFFFFFFFFFFFFLL;
  v551 = v38;
  while (v37 < objc_msgSend_count(v579, v32, v33, v34, v35, v36))
  {
    objc_msgSend_objectAtIndexedSubscript_(v579, v39, v37, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_opt_class();
    isMemberOfClass = objc_msgSend_isMemberOfClass_(v43, v45, v44, v46, v47, v48);

    if ((isMemberOfClass & 1) == 0)
      goto LABEL_4;
    objc_msgSend_objectAtIndexedSubscript_(v579, v32, v37, v34, v35, v36);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)MEMORY[0x1E0CB37E8];
    v576 = v50;
    v57 = objc_msgSend_uniqueIdentifier(v50, v52, v53, v54, v55, v56);
    objc_msgSend_numberWithInteger_(v51, v58, v57, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v574, v63, (uint64_t)v62, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v67)
    {
      v72 = self->_shouldLimitDefaultWritingOrientationDeviation && !v560;
      sub_1BE86C4CC(self, v576, v72);
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = (void *)MEMORY[0x1E0CB37E8];
      v80 = objc_msgSend_uniqueIdentifier(v576, v75, v76, v77, v78, v79);
      objc_msgSend_numberWithInteger_(v74, v81, v80, v82, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v574, v86, v73, (uint64_t)v85, v87, v88);

      v67 = (void *)v73;
    }
    v571 = v67;
    objc_msgSend_objectAtIndexedSubscript_(v67, v68, 0, v69, v70, v71);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v89, v90, v91, v92, v93, v94);
    v96 = v95;

    objc_msgSend_objectAtIndexedSubscript_(v67, v97, 1, v98, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v101, v102, v103, v104, v105, v106);
    v569 = v107;

    objc_msgSend_bounds(v576, v108, v109, v110, v111, v112);
    MinX = CGRectGetMinX(v592);
    objc_msgSend_bounds(v576, v113, v114, v115, v116, v117);
    MaxY = CGRectGetMaxY(v593);
    v123 = v569;
    v559 = fabs(v96);
    v124 = v569 > 1.4 && !v560;
    v573 = v124;
    v572 = v96;
    v561 = v96;
    v567 = v37;
    while (++v37 < objc_msgSend_count(v579, v118, v119, v120, v121, v122, v123))
    {
      objc_msgSend_objectAtIndexedSubscript_(v579, v125, v37, v126, v127, v128);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = objc_opt_class();
      v135 = objc_msgSend_isMemberOfClass_(v129, v131, v130, v132, v133, v134);

      if ((v135 & 1) != 0)
      {
        objc_msgSend_objectAtIndexedSubscript_(v579, v118, v37, v120, v121, v122);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bounds(v576, v137, v138, v139, v140, v141);
        MinY = CGRectGetMinY(v594);
        objc_msgSend_bounds(v136, v143, v144, v145, v146, v147);
        if (MinY >= CGRectGetMinY(v595))
        {
          objc_msgSend_bounds(v136, v148, v149, v150, v151, v152);
          v154 = v170;
          v156 = v171;
          v158 = v172;
          v160 = v173;
          objc_msgSend_bounds(v576, v174, v175, v176, v177, v178);
        }
        else
        {
          objc_msgSend_bounds(v576, v148, v149, v150, v151, v152);
          v154 = v153;
          v156 = v155;
          v158 = v157;
          v160 = v159;
          objc_msgSend_bounds(v136, v161, v162, v163, v164, v165);
        }
        v179 = CGRectGetMinY(*(CGRect *)&v166);
        v596.origin.x = v154;
        v596.origin.y = v156;
        v596.size.width = v158;
        v596.size.height = v160;
        v577 = v136;
        if (v179 > CGRectGetMaxY(v596) + 200.0)
          goto LABEL_18;
        v185 = objc_msgSend_uniqueIdentifier(v576, v180, v181, v182, v183, v184);
        v191 = objc_msgSend_uniqueIdentifier(v136, v186, v187, v188, v189, v190);
        v197 = v191;
        v198 = v588;
        if (v588)
        {
          v199 = &v588;
          do
          {
            v200 = v198[4];
            if (v200 < v185)
            {
              ++v198;
            }
            else if (v185 >= v200)
            {
              if (v198[5] < v191)
                ++v198;
              else
                v199 = (uint64_t **)v198;
            }
            else
            {
              v199 = (uint64_t **)v198;
            }
            v198 = (uint64_t *)*v198;
          }
          while (v198);
          if (v199 != &v588)
          {
            v201 = v199[4];
            if (v185 >= (uint64_t)v201 && ((uint64_t)v201 < v185 || v191 >= (uint64_t)v199[5]))
              goto LABEL_18;
          }
        }
        v202 = (void *)MEMORY[0x1E0CB37E8];
        v203 = objc_msgSend_uniqueIdentifier(v136, v192, v193, v194, v195, v196);
        objc_msgSend_numberWithInteger_(v202, v204, v203, v205, v206, v207);
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v574, v209, (uint64_t)v208, v210, v211, v212);
        v213 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v213)
        {
          v218 = self->_shouldLimitDefaultWritingOrientationDeviation && !v560;
          sub_1BE86C4CC(self, v577, v218);
          v219 = objc_claimAutoreleasedReturnValue();
          v220 = (void *)MEMORY[0x1E0CB37E8];
          v226 = objc_msgSend_uniqueIdentifier(v577, v221, v222, v223, v224, v225);
          objc_msgSend_numberWithInteger_(v220, v227, v226, v228, v229, v230);
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v574, v232, v219, (uint64_t)v231, v233, v234);

          v213 = (void *)v219;
        }
        objc_msgSend_objectAtIndexedSubscript_(v213, v214, 0, v215, v216, v217);
        v235 = (void *)objc_claimAutoreleasedReturnValue();
        v575 = v213;
        objc_msgSend_floatValue(v235, v236, v237, v238, v239, v240);
        v242 = v241;

        objc_msgSend_objectAtIndexedSubscript_(v213, v243, 1, v244, v245, v246);
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_floatValue(v247, v248, v249, v250, v251, v252);
        v254 = v253;

        v255 = v242;
        v256 = v573;
        if (v254 <= 1.4)
          v256 = 0;
        if (v256 == 1 && vabdd_f64(v572, v255) > 0.523598776)
        {
          v257 = v588;
          v258 = &v588;
LABEL_48:
          v259 = v258;
          if (v257)
          {
            do
            {
              v258 = (uint64_t **)v257;
              v260 = v257[4];
              if (v185 < v260)
              {
LABEL_47:
                v257 = *v258;
                goto LABEL_48;
              }
              if (v260 >= v185)
              {
                v261 = v258[5];
                if (v197 < (uint64_t)v261)
                  goto LABEL_47;
                if ((uint64_t)v261 >= v197)
                  goto LABEL_17;
              }
              v257 = v258[1];
            }
            while (v257);
            v259 = v258 + 1;
          }
          v262 = (uint64_t *)operator new(0x30uLL);
          v262[4] = v185;
          v262[5] = v197;
          *v262 = 0;
          v262[1] = 0;
          v262[2] = (uint64_t)v258;
          *v259 = v262;
          if (*v587)
          {
            v587 = (uint64_t **)*v587;
            v262 = *v259;
          }
          sub_1BE61F5C0(v588, v262);
          ++v589;
LABEL_17:

LABEL_18:
        }
        else
        {
          v263 = v576;
          v264 = v577;
          v270 = v264;
          *(float *)&v271 = v569;
          v272 = MinX;
          if (v569 <= v254)
          {
            v273 = v264;

            v578 = v263;
            objc_msgSend_bounds(v270, v274, v275, v276, v277, v278);
            v272 = CGRectGetMinX(v597);
            objc_msgSend_bounds(v273, v279, v280, v281, v282, v283);
            v271 = CGRectGetMaxY(v598);
            MaxY = v271;
            v263 = v273;
            v561 = v255;
          }
          else
          {
            v578 = v264;
          }
          objc_msgSend_averageStrokeDeviation(v263, v265, v266, v267, v268, v269, v271);
          v285 = v284;
          objc_msgSend_averageStrokeDeviation(v263, v286, v287, v288, v289, v290);
          v292 = v291;
          objc_msgSend_averageStrokeDeviation(v263, v293, v294, v295, v296, v297);
          v299 = v298;
          v554 = v270;
          MinX = v272;
          objc_msgSend_averageStrokeDeviation(v263, v300, v301, v302, v303, v304);
          v306 = v305;
          sub_1BE86C790((uint64_t *)v586, v272, MaxY, -v561, (uint64_t)CHBottomUpStrokeGroupingStrategy, v263);
          sub_1BE86C790((uint64_t *)&__p, v272, MaxY, -v561, (uint64_t)CHBottomUpStrokeGroupingStrategy, v578);
          v556 = v292;
          v557 = v285;
          *(double *)&v309 = v559;
          v310 = (double *)__p;
          if (v559 <= 2.35619449 == fabs(v255) > 2.35619449 && __p != v585)
          {
            v311 = v585 - 32;
            if (v585 - 32 > __p)
            {
              v312 = (char *)__p + 32;
              do
              {
                v313 = *((_OWORD *)v312 - 2);
                v309 = *((_OWORD *)v312 - 1);
                v314 = *((_OWORD *)v311 + 1);
                *((_OWORD *)v312 - 2) = *(_OWORD *)v311;
                *((_OWORD *)v312 - 1) = v314;
                *(_OWORD *)v311 = v313;
                *((_OWORD *)v311 + 1) = v309;
                v311 -= 32;
                v315 = v312 >= v311;
                v312 += 32;
              }
              while (!v315);
            }
          }
          v316 = *(double *)v586[0];
          v317 = *v310;
          if (*(double *)v586[0] <= *v310)
          {
            objc_msgSend_unionStrokeBounds_usingStrokeCountLimit_reverseOrder_(CHStrokeUtilities, v307, (uint64_t)v586, v551, 1, v308, *(double *)&v309);
            rect = v330;
            r1 = v331;
            v321 = v332;
            v323 = v333;
            objc_msgSend_unionStrokeBounds_usingStrokeCountLimit_reverseOrder_(CHStrokeUtilities, v334, (uint64_t)&__p, 20, 0, v335);
          }
          else
          {
            objc_msgSend_unionStrokeBounds_usingStrokeCountLimit_reverseOrder_(CHStrokeUtilities, v307, (uint64_t)v586, v551, 0, v308, *(double *)&v309);
            rect = v318;
            r1 = v319;
            v321 = v320;
            v323 = v322;
            objc_msgSend_unionStrokeBounds_usingStrokeCountLimit_reverseOrder_(CHStrokeUtilities, v324, (uint64_t)&__p, 20, 1, v325);
          }
          v565 = v329;
          v566 = v328;
          v336 = v326;
          v337 = v327;
          v599.origin.x = v321;
          v599.origin.y = rect;
          v599.size.width = v323;
          v599.size.height = r1;
          v617.origin.x = v336;
          v617.origin.y = v337;
          v617.size.height = v565;
          v617.size.width = v566;
          v600 = CGRectIntersection(v599, v617);
          width = v600.size.width;
          height = v600.size.height;
          v341 = sqrt(v299 * v306 + v557 * v556);
          if (!v560
            || ((objc_msgSend_horizontalOverlapOfIndividualStrokeBounds_otherStrokeBounds_(CHStrokeUtilities, v338, (uint64_t)v586, (uint64_t)&__p, v339, v340), v342 < v341)? (v343 = width <= v341): (v343 = 1), v343))
          {
            if (v316 <= v317)
            {
              v604.origin.x = v336;
              v604.origin.y = v337;
              v604.size.height = v565;
              v604.size.width = v566;
              MidX = CGRectGetMidX(v604);
              v605.origin.x = v321;
              v605.origin.y = rect;
              v605.size.width = v323;
              v605.size.height = r1;
              if (MidX < CGRectGetMaxX(v605))
              {
                v606.origin.x = v336;
                v606.origin.y = v337;
                v606.size.height = v565;
                v606.size.width = v566;
                v362 = CGRectGetMidX(v606);
                objc_msgSend_unionStrokeBounds_aroundXPosition_usingOneSideStrokeCountLimit_(CHStrokeUtilities, v363, (uint64_t)v586, 10, v364, v365, v362);
                rect = v366;
                r1 = v367;
                v352 = v368;
                v354 = v369;
                objc_msgSend_unionStrokeBounds_usingStrokeCountLimit_reverseOrder_(CHStrokeUtilities, v370, (uint64_t)&__p, 0x7FFFFFFFFFFFFFFFLL, 0, v371);
                goto LABEL_83;
              }
              v374 = 0;
              v377 = v341 * 5.5;
LABEL_90:
              v611.origin.x = v336;
              v611.origin.y = v337;
              v611.size.height = v565;
              v611.size.width = v566;
              v383 = CGRectGetMinX(v611);
              v612.origin.x = v321;
              v612.origin.y = rect;
              v612.size.width = v323;
              v612.size.height = r1;
              v384 = v383 - CGRectGetMaxX(v612);
              v380 = 0.0;
              if (v384 >= 0.0)
              {
                v613.origin.x = v336;
                v613.origin.y = v337;
                v613.size.height = v565;
                v613.size.width = v566;
                v381 = CGRectGetMinX(v613);
                v614.origin.x = v321;
                v614.origin.y = rect;
                v614.size.width = v323;
                v614.size.height = r1;
                MaxX = CGRectGetMaxX(v614);
                goto LABEL_92;
              }
              goto LABEL_93;
            }
            v601.origin.x = v321;
            v601.origin.y = rect;
            v601.size.width = v323;
            v601.size.height = r1;
            v344 = CGRectGetMidX(v601);
            v602.origin.x = v336;
            v602.origin.y = v337;
            v602.size.height = v565;
            v602.size.width = v566;
            if (v344 < CGRectGetMaxX(v602))
            {
              v603.origin.x = v321;
              v603.origin.y = rect;
              v603.size.width = v323;
              v603.size.height = r1;
              v345 = CGRectGetMidX(v603);
              objc_msgSend_unionStrokeBounds_aroundXPosition_usingOneSideStrokeCountLimit_(CHStrokeUtilities, v346, (uint64_t)&__p, 10, v347, v348, v345);
              rect = v349;
              r1 = v350;
              v352 = v351;
              v354 = v353;
              objc_msgSend_unionStrokeBounds_usingStrokeCountLimit_reverseOrder_(CHStrokeUtilities, v355, (uint64_t)v586, 0x7FFFFFFFFFFFFFFFLL, 0, v356);
LABEL_83:
              v336 = v357;
              v337 = v358;
              v372 = v359;
              v373 = v360;
              v374 = 0;
              v375 = 1;
              v376 = 1;
              goto LABEL_101;
            }
            v374 = 0;
            v377 = v341 * 5.5;
          }
          else
          {
            v377 = v341 * 5.5;
            v374 = 1;
            if (v316 <= v317)
              goto LABEL_90;
          }
          v607.origin.x = v321;
          v607.origin.y = rect;
          v607.size.width = v323;
          v607.size.height = r1;
          v378 = CGRectGetMinX(v607);
          v608.origin.x = v336;
          v608.origin.y = v337;
          v608.size.height = v565;
          v608.size.width = v566;
          v379 = v378 - CGRectGetMaxX(v608);
          v380 = 0.0;
          if (v379 >= 0.0)
          {
            v609.origin.x = v321;
            v609.origin.y = rect;
            v609.size.width = v323;
            v609.size.height = r1;
            v381 = CGRectGetMinX(v609);
            v610.origin.x = v336;
            v610.origin.y = v337;
            v610.size.height = v565;
            v610.size.width = v566;
            MaxX = CGRectGetMaxX(v610);
LABEL_92:
            v380 = v381 - MaxX;
          }
LABEL_93:
          v375 = 0;
          v376 = v380 < v377;
          v385 = v316 > v317 || v560;
          v373 = v565;
          v372 = v566;
          v386 = v566 + v380;
          v387 = v323 + v386;
          v388 = 0.0;
          if (v385)
            v388 = v386;
          v352 = v321 - v388;
          if (!v560)
            v386 = -0.0;
          v354 = v387 + v386;
LABEL_101:
          v615.origin.x = v352;
          v615.origin.y = rect;
          v615.size.width = v354;
          v615.size.height = r1;
          v389 = v336;
          v390 = v337;
          v391 = v372;
          v616 = CGRectIntersection(v615, *(CGRect *)(&v373 - 3));
          v397 = v616.size.width;
          v398 = v616.size.height;
          v399 = width * height;
          v400 = v566 * v565;
          if (((v375 | v560) & 1) != 0)
          {
            if ((v375 & 1) != 0)
              goto LABEL_114;
          }
          else
          {
            objc_msgSend_writingDirectionSortedSubstrokes(v578, v392, v393, v394, v395, v396);
            v401 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend_count(v401, v402, v403, v404, v405, v406) >= self->_groupingContextSize)
            {

              if (v399 > v400 * 0.4)
                goto LABEL_114;
            }
            else
            {

            }
          }
          v407 = 0.4;
          if ((v374 & 1) == 0 && v560 && v399 > v400 * 0.4 && (width > v354 * 0.95 || width > v372 * 0.95))
          {
LABEL_114:
            v407 = 0.7;
            goto LABEL_117;
          }
          if (v398 == r1)
            v407 = 0.2;
LABEL_117:
          if (v397 * v398 > v400 * v407 && v376)
          {
            if (v550)
            {
              v582 = 0u;
              v583 = 0u;
              v580 = 0u;
              v581 = 0u;
              v410 = v550;
              v413 = 0;
              v414 = objc_msgSend_countByEnumeratingWithState_objects_count_(v410, v411, (uint64_t)&v580, (uint64_t)v590, 16, v412);
              if (v414)
              {
                v415 = *(_QWORD *)v581;
                v416 = v375 ^ 1;
                v417 = 3.40282347e38;
                do
                {
                  v418 = 0;
                  do
                  {
                    if (*(_QWORD *)v581 != v415)
                      objc_enumerationMutation(v410);
                    v419 = *(_QWORD *)(*((_QWORD *)&v580 + 1) + 8 * v418);
                    sub_1BE863EF8((_OWORD *)v419, v263, v578, v316 > v317, v416);
                    v420 = (id)objc_claimAutoreleasedReturnValue();
                    if (v419)
                    {
                      v421 = atan2(*(long double *)(v419 + 24), *(long double *)(v419 + 16));
                      objc_msgSend_averageWritingOrientation(v420, v422, v423, v424, v425, v426);
                      v428 = v427;
                      objc_msgSend_averageWritingOrientation(v420, v429, v430, v431, v432, v433);
                      v435 = vabdd_f64(atan2(v428, v434), v421);
                      if (v435 <= 3.14159265)
                        v436 = v435;
                      else
                        v436 = 6.28318531 - v435;
                    }
                    else
                    {
                      v436 = 0.0;
                    }

                    if (!v413 || v436 < v417)
                    {
                      v437 = v420;

                      v413 = v437;
                      v417 = v436;
                    }

                    ++v418;
                  }
                  while (v414 != v418);
                  v440 = objc_msgSend_countByEnumeratingWithState_objects_count_(v410, v438, (uint64_t)&v580, (uint64_t)v590, 16, v439);
                  v414 = v440;
                }
                while (v440);
              }

              if (v413)
              {
LABEL_159:
                v454 = (void *)MEMORY[0x1E0CB37E8];
                v455 = objc_msgSend_uniqueIdentifier(v413, v441, v442, v443, v444, v445);
                objc_msgSend_numberWithInteger_(v454, v456, v455, v457, v458, v459);
                v460 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_removeObjectForKey_(v574, v461, (uint64_t)v460, v462, v463, v464);

                if ((objc_msgSend_containsObject_(v553, v465, (uint64_t)v263, v466, v467, v468) & 1) == 0)
                  objc_msgSend_addObject_(v549, v469, (uint64_t)v263, v470, v471, v472);
                if ((objc_msgSend_containsObject_(v553, v469, (uint64_t)v578, v470, v471, v472) & 1) == 0)
                  objc_msgSend_addObject_(v549, v473, (uint64_t)v578, v474, v475, v476);
                objc_msgSend_addObject_(v553, v473, (uint64_t)v413, v474, v475, v476);
                objc_msgSend_addObject_(v552, v477, (uint64_t)v413, v478, v479, v480);
                objc_msgSend_removeObject_(v553, v481, (uint64_t)v263, v482, v483, v484);
                objc_msgSend_removeObject_(v553, v485, (uint64_t)v578, v486, v487, v488);
                objc_msgSend_removeObject_(v552, v489, (uint64_t)v263, v490, v491, v492);
                objc_msgSend_removeObject_(v552, v493, (uint64_t)v578, v494, v495, v496);
                objc_msgSend_removeObjectAtIndex_(v579, v497, v37, v498, v499, v500);
                objc_msgSend_removeObjectAtIndex_(v579, v501, v567, v502, v503, v504);
                objc_msgSend_bounds(v413, v505, v506, v507, v508, v509);
                v511 = v510;
                objc_msgSend_bounds(v413, v512, v513, v514, v515, v516);
                v522 = 0;
                v524 = v511 * v523;
                while (1)
                {
                  if (v522 >= objc_msgSend_count(v579, v517, v518, v519, v520, v521))
                  {
                    objc_msgSend_addObject_(v579, v525, (uint64_t)v413, v526, v527, v528);
                    goto LABEL_169;
                  }
                  objc_msgSend_objectAtIndexedSubscript_(v579, v525, v522, v526, v527, v528);
                  v529 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_bounds(v529, v530, v531, v532, v533, v534);
                  v536 = v535;
                  objc_msgSend_objectAtIndexedSubscript_(v579, v537, v522, v538, v539, v540);
                  v541 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_bounds(v541, v542, v543, v544, v545, v546);
                  v548 = v547;

                  if (v524 <= v536 * v548)
                    break;
                  ++v522;
                }
                objc_msgSend_insertObject_atIndex_(v579, v517, (uint64_t)v413, v522, v520, v521);
LABEL_169:

                v452 = 0;
                v567 = -1;
                v453 = (char *)__p;
                if (!__p)
                  goto LABEL_154;
LABEL_153:
                v585 = v453;
                operator delete(v453);
                goto LABEL_154;
              }
            }
            else
            {
              sub_1BE863EF8(self, v263, v578, v316 > v317, v375 ^ 1);
              v413 = (void *)objc_claimAutoreleasedReturnValue();
              if (v413)
                goto LABEL_159;
            }
          }
          else
          {
            v446 = v588;
            v447 = &v588;
LABEL_142:
            v448 = v447;
            if (v446)
            {
              do
              {
                v447 = (uint64_t **)v446;
                v449 = v446[4];
                if (v185 < v449)
                {
LABEL_141:
                  v446 = *v447;
                  goto LABEL_142;
                }
                if (v449 >= v185)
                {
                  v450 = v447[5];
                  if (v197 < (uint64_t)v450)
                    goto LABEL_141;
                  if ((uint64_t)v450 >= v197)
                    goto LABEL_152;
                }
                v446 = v447[1];
              }
              while (v446);
              v448 = v447 + 1;
            }
            v451 = (uint64_t *)operator new(0x30uLL);
            v451[4] = v185;
            v451[5] = v197;
            *v451 = 0;
            v451[1] = 0;
            v451[2] = (uint64_t)v447;
            *v448 = v451;
            if (*v587)
            {
              v587 = (uint64_t **)*v587;
              v451 = *v448;
            }
            sub_1BE61F5C0(v588, v451);
            ++v589;
          }
LABEL_152:
          v452 = 1;
          v453 = (char *)__p;
          if (__p)
            goto LABEL_153;
LABEL_154:
          if (v586[0])
          {
            v586[1] = v586[0];
            operator delete(v586[0]);
          }

          if ((v452 & 1) == 0)
            break;
        }
      }
    }

    v37 = v567;
LABEL_4:
    ++v37;
  }

  sub_1BE671438(v588);
}

- (id)tryRegroupingStrokesInGroup:(id)a3 substrokePlacementsByStrokeIdentifier:(id)a4 cancellationBlock:(id)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t splitMinimumStrokeCount;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CGFloat x;
  CGFloat y;
  double height;
  CGFloat width;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  uint64_t i;
  void *v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
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
  int isEqual;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  double MaxX;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  float v144;
  double v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  double v180;
  double v181;
  double MinY;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  double v187;
  id v188;
  id v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  double v200;
  uint64_t j;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  float v208;
  float v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  double v215;
  double v216;
  double v217;
  double v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  double splitMaxNaturalIndexDiffThreshold;
  double v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  unint64_t k;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  BOOL v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
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
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  id v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  void *v317;
  const char *v318;
  uint64_t v319;
  void *v320;
  id v321;
  double v323;
  double v324;
  void *v325;
  void *v326;
  void *v327;
  id v328;
  CHBottomUpStrokeGroupingStrategy *v329;
  id v330;
  uint64_t (**v331)(void);
  id v332;
  void *v333;
  id r1[5];
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  _QWORD v345[4];
  id v346;
  _BYTE v347[128];
  _BYTE v348[128];
  _BYTE v349[128];
  uint64_t v350;
  CGRect v351;
  CGRect v352;
  CGRect v353;
  CGRect v354;
  CGRect v355;
  CGRect v356;
  CGRect v357;
  CGRect v358;
  CGRect v359;
  CGRect v360;
  CGRect v361;

  v350 = *MEMORY[0x1E0C80C00];
  v332 = a3;
  v328 = a4;
  v331 = (uint64_t (**)(void))a5;
  v329 = self;
  objc_msgSend_strokeProvider(self, v8, v9, v10, v11, v12);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v330 = v18;
  objc_msgSend_strokeIdentifiers(v332, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_count(v24, v25, v26, v27, v28, v29);
  splitMinimumStrokeCount = self->_splitMinimumStrokeCount;

  if (v30 >= splitMinimumStrokeCount)
  {
    objc_msgSend_strokeIdentifiers(v332, v32, v33, v34, v35, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v38, v39, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v345[0] = MEMORY[0x1E0C809B0];
    v345[1] = 3221225472;
    v345[2] = sub_1BE86D5F4;
    v345[3] = &unk_1E77F2B30;
    v45 = v326;
    v346 = v45;
    objc_msgSend_sortedArrayUsingComparator_(v44, v46, (uint64_t)v345, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v325 = v50;
    objc_msgSend_lastObject(v50, v51, v52, v53, v54, v55);
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v60, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v343 = 0u;
    v344 = 0u;
    v341 = 0u;
    v342 = 0u;
    objc_msgSend_writingDirectionSortedSubstrokes(v332, v66, v67, v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v72, (uint64_t)&v341, (uint64_t)v349, 16, v73);
    v327 = v45;
    r1[0] = *(id *)&x;
    if (v79)
    {
      v80 = *(_QWORD *)v342;
      v81 = y;
      v82 = width;
      v83 = height;
      do
      {
        for (i = 0; i != v79; ++i)
        {
          if (*(_QWORD *)v342 != v80)
            objc_enumerationMutation(v71);
          v85 = *(void **)(*((_QWORD *)&v341 + 1) + 8 * i);
          objc_msgSend_rotatedBounds(v85, v74, v75, v76, v77, v78);
          v360.origin.x = v86;
          v360.origin.y = v87;
          v360.size.width = v88;
          v360.size.height = v89;
          v351.origin.x = x;
          v351.origin.y = y;
          v351.size.width = width;
          v351.size.height = height;
          v352 = CGRectUnion(v351, v360);
          x = v352.origin.x;
          y = v352.origin.y;
          width = v352.size.width;
          height = v352.size.height;
          objc_msgSend_substroke(v85, v90, v91, v92, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeIdentifier(v95, v96, v97, v98, v99, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v101, v102, (uint64_t)v333, v103, v104, v105);

          if (isEqual)
          {
            objc_msgSend_rotatedBounds(v85, v107, v108, v109, v110, v111);
            v361.origin.x = v112;
            v361.origin.y = v113;
            v361.size.width = v114;
            v361.size.height = v115;
            *(id *)&v353.origin.x = r1[0];
            v353.origin.y = v81;
            v353.size.width = v82;
            v353.size.height = v83;
            v354 = CGRectUnion(v353, v361);
            r1[0] = *(id *)&v354.origin.x;
            v81 = v354.origin.y;
            v82 = v354.size.width;
            v83 = v354.size.height;
          }
          objc_msgSend_rotatedBounds(v85, v107, v108, v109, v110, v111);
          MaxX = CGRectGetMaxX(v355);
          objc_msgSend_substroke(v85, v117, v118, v119, v120, v121);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeIdentifier(v122, v123, v124, v125, v126, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v65, v129, (uint64_t)v128, v130, v131, v132);
          v133 = (void *)objc_claimAutoreleasedReturnValue();

          if (v133)
          {
            objc_msgSend_floatValue(v133, v134, v135, v136, v137, v138);
            v145 = v144;
            if (MaxX >= v145)
              v145 = MaxX;
            objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v139, v140, v141, v142, v143, v145);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_substroke(v85, v147, v148, v149, v150, v151);
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIdentifier(v152, v153, v154, v155, v156, v157);
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v65, v159, (uint64_t)v146, (uint64_t)v158, v160, v161);
          }
          else
          {
            objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v134, v135, v136, v137, v138, MaxX);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_substroke(v85, v162, v163, v164, v165, v166);
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIdentifier(v152, v167, v168, v169, v170, v171);
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v65, v172, (uint64_t)v146, (uint64_t)v158, v173, v174);
          }

        }
        v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v74, (uint64_t)&v341, (uint64_t)v349, 16, v78);
      }
      while (v79);
    }
    else
    {
      v81 = y;
      v82 = width;
      v83 = height;
    }

    v356.origin.x = x;
    v356.origin.y = y;
    v356.size.width = width;
    v356.size.height = height;
    v324 = CGRectGetMaxX(v356);
    *(id *)&v357.origin.x = r1[0];
    v357.origin.y = v81;
    v357.size.width = v82;
    v357.size.height = v83;
    v323 = CGRectGetMaxX(v357);
    objc_msgSend_averageStrokeDeviation(v332, v175, v176, v177, v178, v179);
    v181 = v180;
    *(id *)&v358.origin.x = r1[0];
    v358.origin.y = v81;
    v358.size.width = v82;
    v358.size.height = v83;
    MinY = CGRectGetMinY(v358);
    v359.origin.x = x;
    v359.origin.y = y;
    v359.size.width = width;
    v359.size.height = height;
    v187 = CGRectGetMinY(v359);
    if (v324 - v323 >= v181 || MinY - v187 >= height * 0.5)
    {
      v339 = 0u;
      v340 = 0u;
      v337 = 0u;
      v338 = 0u;
      v189 = v325;
      v192 = 0;
      v193 = 0;
      v198 = objc_msgSend_countByEnumeratingWithState_objects_count_(v189, v190, (uint64_t)&v337, (uint64_t)v348, 16, v191);
      if (v198)
      {
        v199 = *(_QWORD *)v338;
        v200 = -3.40282347e38;
        do
        {
          for (j = 0; j != v198; ++j)
          {
            if (*(_QWORD *)v338 != v199)
              objc_enumerationMutation(v189);
            objc_msgSend_objectForKeyedSubscript_(v65, v194, *(_QWORD *)(*((_QWORD *)&v337 + 1) + 8 * j), v195, v196, v197);
            v202 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v202, v203, v204, v205, v206, v207);
            v209 = v208;

            objc_msgSend_averageStrokeDeviation(v332, v210, v211, v212, v213, v214);
            v215 = v209;
            v217 = v200 - v216;
            if (v200 <= v209)
              v218 = v209;
            else
              v218 = v200;
            if (v192 <= v193)
              v219 = v193;
            else
              v219 = v192;
            if (v217 <= v215)
            {
              ++v193;
            }
            else
            {
              v192 = v219;
              v193 = 0;
            }
            if (v217 > v215)
              v200 = -3.40282347e38;
            else
              v200 = v218;
          }
          v198 = objc_msgSend_countByEnumeratingWithState_objects_count_(v189, v194, (uint64_t)&v337, (uint64_t)v348, 16, v197);
        }
        while (v198);
      }

      if (v192 <= v193)
        v225 = v193;
      else
        v225 = v192;
      splitMaxNaturalIndexDiffThreshold = (double)v329->_splitMaxNaturalIndexDiffThreshold;
      if ((double)v225 * 0.8 <= splitMaxNaturalIndexDiffThreshold)
        splitMaxNaturalIndexDiffThreshold = (double)v225 * 0.8;
      if (splitMaxNaturalIndexDiffThreshold >= (double)v329->_splitMinimumStrokeCount)
        v227 = splitMaxNaturalIndexDiffThreshold;
      else
        v227 = (double)v329->_splitMinimumStrokeCount;
      objc_msgSend_writingDirectionSortedStrokeIdentifiers(v332, v220, v221, v222, v223, v224);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v228, v229, v230, v231, v232, v233);
      r1[0] = (id)objc_claimAutoreleasedReturnValue();

      v243 = objc_msgSend_indexOfObject_(v189, v234, (uint64_t)r1[0], v235, v236, v237);
      v244 = 0;
      for (k = 1; ; ++k)
      {
        objc_msgSend_writingDirectionSortedStrokeIdentifiers(v332, v238, v239, v240, v241, v242);
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        v252 = k < objc_msgSend_count(v246, v247, v248, v249, v250, v251);

        if (!v252)
          break;
        objc_msgSend_writingDirectionSortedStrokeIdentifiers(v332, v253, v254, v255, v256, v257);
        v258 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v258, v259, k, v260, v261, v262);
        v263 = (void *)objc_claimAutoreleasedReturnValue();

        v268 = objc_msgSend_indexOfObject_(v189, v264, (uint64_t)v263, v265, v266, v267);
        v269 = v268;
        v270 = v268 - v243;
        if (v268 - v243 < 0)
          v270 = v243 - v268;
        if (v270 > (uint64_t)v227)
          ++v244;

        v243 = v269;
      }
      objc_msgSend_writingDirectionSortedStrokeIdentifiers(v332, v253, v254, v255, v256, v257);
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      if ((double)(unint64_t)(objc_msgSend_count(v271, v272, v273, v274, v275, v276) - 1) * 0.3 < 2.0)
      {
        v289 = 2;
      }
      else
      {
        objc_msgSend_writingDirectionSortedStrokeIdentifiers(v332, v277, v278, v279, v280, v281);
        v282 = (void *)objc_claimAutoreleasedReturnValue();
        v288 = objc_msgSend_count(v282, v283, v284, v285, v286, v287);

        v289 = (uint64_t)((double)(unint64_t)(v288 - 1) * 0.3);
      }

      if (v244 <= v289)
      {
        v320 = v330;
        objc_msgSend_addObject_(v330, v290, (uint64_t)v332, v292, v293, v294);
      }
      else
      {
        objc_msgSend_set(MEMORY[0x1E0C99E20], v290, v291, v292, v293, v294);
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v295, v296, (uint64_t)v332, v297, v298, v299);
        v335 = 0u;
        v336 = 0u;
        memset(&r1[1], 0, 32);
        v300 = v189;
        v303 = objc_msgSend_countByEnumeratingWithState_objects_count_(v300, v301, (uint64_t)&r1[1], (uint64_t)v347, 16, v302);
        if (v303)
        {
          v304 = *(_QWORD *)r1[3];
LABEL_62:
          v305 = 0;
          while (1)
          {
            if (*(_QWORD *)r1[3] != v304)
              objc_enumerationMutation(v300);
            v306 = *((_QWORD *)r1[2] + v305);
            if ((v331[2]() & 1) != 0)
              break;
            v307 = (void *)MEMORY[0x1C3B818B0]();
            objc_msgSend_strokeIdentifierFromData_(v327, v308, v306, v309, v310, v311);
            v312 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeForIdentifier_(v327, v313, (uint64_t)v312, v314, v315, v316);
            v317 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1BE8608D8((uint64_t)v329, v330, 0, 0, v317, 0, v328, v295, 0, v331);

            objc_autoreleasePoolPop(v307);
            if (v303 == ++v305)
            {
              v303 = objc_msgSend_countByEnumeratingWithState_objects_count_(v300, v318, (uint64_t)&r1[1], (uint64_t)v347, 16, v319);
              if (v303)
                goto LABEL_62;
              break;
            }
          }
        }

        v320 = v330;
      }
      v321 = v320;

    }
    else
    {
      objc_msgSend_addObject_(v330, v183, (uint64_t)v332, v184, v185, v186);
      v188 = v330;
    }

    v18 = v330;
  }
  else
  {
    objc_msgSend_addObject_(v18, v32, (uint64_t)v332, v34, v35, v36);
    v37 = v18;
  }

  return v330;
}

- (id)regroupedStrokeGroup:(id)a3 fromResult:(id)a4 withAdversarialGroup:(id)a5 allSubstrokesByStrokeIdentifier:(id)a6 cancellationBlock:(id)a7
{
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
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
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
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
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t j;
  uint64_t v114;
  CHSubstrokePlacement *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  id v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  const char *v170;
  uint64_t v171;
  void *v173;
  void *v174;
  id v175;
  id v176;
  id v177;
  id v178;
  uint64_t (**v179)(void);
  id obj;
  uint64_t v181;
  uint64_t v182;
  id v183;
  void *v184;
  id v185;
  void *v186;
  void *v187;
  void *v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _QWORD v201[4];
  id v202;
  uint8_t buf[16];
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  uint64_t v207;

  v207 = *MEMORY[0x1E0C80C00];
  v177 = a3;
  v176 = a4;
  v175 = a5;
  v183 = a6;
  v179 = (uint64_t (**)(void))a7;
  v12 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v177, v13, v12, v14, v15, v16)
    && (v21 = objc_opt_class(), (objc_msgSend_isMemberOfClass_(v176, v22, v21, v23, v24, v25) & 1) != 0))
  {
    objc_msgSend_strokeProvider(self, v17, v26, v18, v19, v20);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v174)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v32 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v32, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
      }

    }
    objc_msgSend_set(MEMORY[0x1E0C99E20], v27, v28, v29, v30, v31);
    v178 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifiers(v177, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v38, v39, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v201[0] = MEMORY[0x1E0C809B0];
    v201[1] = 3221225472;
    v201[2] = sub_1BE86DE44;
    v201[3] = &unk_1E77F2B30;
    v185 = v174;
    v202 = v185;
    objc_msgSend_sortedArrayUsingComparator_(v44, v45, (uint64_t)v201, v46, v47, v48);
    v173 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v49, v50, v51, v52, v53);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substrokePlacementsByStrokeIdentifier(v176, v54, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addEntriesFromDictionary_(v186, v60, (uint64_t)v59, v61, v62, v63);

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v64, v65, v66, v67, v68);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = 0u;
    v200 = 0u;
    v197 = 0u;
    v198 = 0u;
    objc_msgSend_strokeIdentifiers(v175, v69, v70, v71, v72, v73);
    v74 = v185;
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v75;
    v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v197, (uint64_t)v206, 16, v77);
    if (v78)
    {
      v181 = *(_QWORD *)v198;
      do
      {
        v182 = v78;
        for (i = 0; i != v182; ++i)
        {
          if (*(_QWORD *)v198 != v181)
            objc_enumerationMutation(obj);
          objc_msgSend_strokeIdentifierFromData_(v74, v79, *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * i), v80, v81, v82);
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeForIdentifier_(v74, v84, (uint64_t)v187, v85, v86, v87);
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v184, v88, (uint64_t)v188, v89, v90, v91);
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v92, v93, v94, v95, v96);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v195 = 0u;
          v196 = 0u;
          v193 = 0u;
          v194 = 0u;
          objc_msgSend_encodedStrokeIdentifier(v188, v98, v99, v100, v101, v102);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v183, v104, (uint64_t)v103, v105, v106, v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v109, (uint64_t)&v193, (uint64_t)v205, 16, v110);
          if (v111)
          {
            v112 = *(_QWORD *)v194;
            do
            {
              for (j = 0; j != v111; ++j)
              {
                if (*(_QWORD *)v194 != v112)
                  objc_enumerationMutation(v108);
                v114 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * j);
                v115 = [CHSubstrokePlacement alloc];
                v120 = (void *)objc_msgSend_initWithSubstroke_(v115, v116, v114, v117, v118, v119);
                objc_msgSend_setWritingOrientation_(v120, v121, v122, v123, v124, v125, self->_defaultOrientationVector.dx, self->_defaultOrientationVector.dy);
                objc_msgSend_addObject_(v97, v126, (uint64_t)v120, v127, v128, v129);

              }
              v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v130, (uint64_t)&v193, (uint64_t)v205, 16, v131);
            }
            while (v111);
          }

          objc_msgSend_encodedStrokeIdentifier(v188, v132, v133, v134, v135, v136);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKey_(v186, v138, (uint64_t)v97, (uint64_t)v137, v139, v140);

          v74 = v185;
        }
        v75 = obj;
        v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v79, (uint64_t)&v197, (uint64_t)v206, 16, v82);
      }
      while (v78);
    }

    objc_msgSend_set(MEMORY[0x1E0C99E20], v141, v142, v143, v144, v145);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v146, v147, (uint64_t)v177, v148, v149, v150);
    v191 = 0u;
    v192 = 0u;
    v189 = 0u;
    v190 = 0u;
    v151 = v173;
    v154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v151, v152, (uint64_t)&v189, (uint64_t)v204, 16, v153);
    if (v154)
    {
      v155 = *(_QWORD *)v190;
LABEL_25:
      v156 = 0;
      while (1)
      {
        if (*(_QWORD *)v190 != v155)
          objc_enumerationMutation(v151);
        v157 = *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * v156);
        if ((v179[2]() & 1) != 0)
          break;
        v158 = (void *)MEMORY[0x1C3B818B0]();
        objc_msgSend_strokeIdentifierFromData_(v185, v159, v157, v160, v161, v162);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeForIdentifier_(v185, v164, (uint64_t)v163, v165, v166, v167);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1BE8608D8((uint64_t)self, v178, 0, 0, v168, v184, v186, v146, 0, v179);
        objc_msgSend_mergeGroupsPostProcessing_createdGroups_deletedGroups_availableGroupingStrategies_allowOppositeOrientations_(self, v169, (uint64_t)v178, 0, 0, 0, 0);

        objc_autoreleasePoolPop(v158);
        if (v154 == ++v156)
        {
          v154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v151, v170, (uint64_t)&v189, (uint64_t)v204, 16, v171);
          if (v154)
            goto LABEL_25;
          break;
        }
      }
    }

  }
  else
  {
    objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], v17, (uint64_t)v177, v18, v19, v20);
    v178 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v178;
}

- (double)relativeOverlapOfGroup:(id)a3 withGroup:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  float v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  float v47;
  float v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double MinX;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double MaxY;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  float v72;
  float v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  float v84;
  float v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  double v108;
  double v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  double v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  double v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  double v129;
  double v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  double v141;
  double v142;
  double v143;
  double v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  double v150;
  double v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  double v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  double v168;
  const char *v169;
  uint64_t v170;
  double v171;
  CGFloat v172;
  double v173;
  CGFloat v174;
  double v175;
  double v176;
  double v177;
  double v178;
  const char *v179;
  uint64_t v180;
  CGFloat v181;
  CGFloat v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double width;
  double height;
  double v189;
  id v191;
  void *__p[3];
  void *v193[3];
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v6, v9, v8, v10, v11, v12)
    && (v18 = objc_opt_class(), (objc_msgSend_isMemberOfClass_(v7, v19, v18, v20, v21, v22) & 1) != 0))
  {
    v23 = v6;
    v191 = v7;
    sub_1BE86C4CC(self, v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v24, v25, 0, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v29, v30, v31, v32, v33, v34);
    v36 = v35;

    objc_msgSend_objectAtIndexedSubscript_(v24, v37, 1, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v41, v42, v43, v44, v45, v46);
    v48 = v47;

    objc_msgSend_bounds(v23, v49, v50, v51, v52, v53);
    MinX = CGRectGetMinX(v194);
    objc_msgSend_bounds(v23, v55, v56, v57, v58, v59);
    MaxY = CGRectGetMaxY(v195);
    sub_1BE86C4CC(self, v191, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v61, v62, 0, v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v66, v67, v68, v69, v70, v71);
    v73 = v72;

    objc_msgSend_objectAtIndexedSubscript_(v61, v74, 1, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v78, v79, v80, v81, v82, v83);
    v85 = v84;

    v86 = v23;
    v87 = v191;
    v88 = v87;
    if (v48 <= v85)
    {

      v89 = v86;
      objc_msgSend_bounds(v88, v158, v159, v160, v161, v162);
      MinX = CGRectGetMinX(v198);
      objc_msgSend_bounds(v88, v163, v164, v165, v166, v167);
      MaxY = CGRectGetMaxY(v199);
      v90 = v88;
      v36 = v73;
    }
    else
    {
      v89 = v87;
      v90 = v86;
    }
    v168 = -v36;
    sub_1BE86C790((uint64_t *)v193, MinX, MaxY, v168, (uint64_t)CHBottomUpStrokeGroupingStrategy, v90);
    sub_1BE86C790((uint64_t *)__p, MinX, MaxY, v168, (uint64_t)CHBottomUpStrokeGroupingStrategy, v89);
    objc_msgSend_unionStrokeBounds_usingStrokeCountLimit_reverseOrder_(CHStrokeUtilities, v169, (uint64_t)v193, 0x7FFFFFFFFFFFFFFFLL, 0, v170);
    v172 = v171;
    v174 = v173;
    v176 = v175;
    v178 = v177;
    objc_msgSend_unionStrokeBounds_usingStrokeCountLimit_reverseOrder_(CHStrokeUtilities, v179, (uint64_t)__p, 0x7FFFFFFFFFFFFFFFLL, 0, v180);
    v203.origin.x = v181;
    v203.origin.y = v182;
    v184 = v183;
    v186 = v185;
    v200.origin.x = v172;
    v200.origin.y = v174;
    v200.size.width = v176;
    v200.size.height = v178;
    v203.size.width = v184;
    v203.size.height = v186;
    v201 = CGRectIntersection(v200, v203);
    width = v201.size.width;
    height = v201.size.height;
    if (v176 * v178 >= v184 * v186)
      v189 = v184 * v186;
    else
      v189 = v176 * v178;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v193[0])
    {
      v193[1] = v193[0];
      operator delete(v193[0]);
    }
    v157 = width * height / v189;

  }
  else
  {
    objc_msgSend_bounds(v6, v13, v14, v15, v16, v17);
    v92 = v91;
    v94 = v93;
    v96 = v95;
    v98 = v97;
    objc_msgSend_bounds(v7, v99, v100, v101, v102, v103);
    v202.origin.x = v104;
    v202.origin.y = v105;
    v202.size.width = v106;
    v202.size.height = v107;
    v196.origin.x = v92;
    v196.origin.y = v94;
    v196.size.width = v96;
    v196.size.height = v98;
    v197 = CGRectIntersection(v196, v202);
    v108 = v197.size.width;
    v109 = v197.size.height;
    objc_msgSend_bounds(v6, v110, v111, v112, v113, v114, v197.origin.x, v197.origin.y);
    v116 = v115;
    objc_msgSend_bounds(v6, v117, v118, v119, v120, v121);
    v123 = v122;
    objc_msgSend_bounds(v7, v124, v125, v126, v127, v128);
    v130 = v129;
    objc_msgSend_bounds(v7, v131, v132, v133, v134, v135);
    v141 = v116 * v123;
    if (v116 * v123 >= v130 * v142)
    {
      objc_msgSend_bounds(v7, v136, v137, v138, v139, v140, v141);
      v144 = v151;
      objc_msgSend_bounds(v7, v152, v153, v154, v155, v156);
    }
    else
    {
      objc_msgSend_bounds(v6, v136, v137, v138, v139, v140, v141);
      v144 = v143;
      objc_msgSend_bounds(v6, v145, v146, v147, v148, v149);
    }
    v157 = v108 * v109 / (v144 * v150);
  }

  return v157;
}

- (BOOL)isInlineContinuousMode
{
  return self->_isInlineContinuousMode;
}

- (NSArray)textInputTargets
{
  return self->_textInputTargets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInputTargets, 0);
  objc_storeStrong((id *)&self->_strategyIdentifier, 0);
}

@end
