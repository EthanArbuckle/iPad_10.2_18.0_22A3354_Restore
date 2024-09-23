@implementation CHStrokeGroupingManager

- (CHStrokeGroupingManager)initWithStrokeProvider:(id)a3 sessionLastResult:(id)a4 strokeGroupingModel:(id)a5 locales:(id)a6 isInlineContinuousMode:(BOOL)a7 inlineContinuousModeTargets:(id)a8 isMathMode:(BOOL)a9
{
  _BOOL4 v10;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  CHTopDownStrokeGroupingStrategy *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  CHBottomUpStrokeGroupingStrategy *v59;
  const char *v60;
  void *isInlineContinuousMode_inlineContinuousModeTargets;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  CHMathStrokeGroupingStrategy *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSDictionary *groupingStrategiesByIdentifierForTextStrokeClasses;
  id v106;
  id v107;
  CHStrokeGroupingManager *v108;
  id v109;
  id v110;
  id v111;
  uint8_t buf[16];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  objc_super v117;
  _BYTE v118[128];
  uint64_t v119;

  v10 = a7;
  v119 = *MEMORY[0x1E0C80C00];
  v111 = a3;
  v106 = a4;
  v107 = a5;
  v109 = a6;
  v110 = a8;
  v117.receiver = self;
  v117.super_class = (Class)CHStrokeGroupingManager;
  v108 = -[CHStrokeGroupingManager init](&v117, sel_init);
  if (v108)
  {
    objc_storeStrong((id *)&v108->_strokeProvider, a3);
    objc_storeStrong((id *)&v108->_sessionLastResult, a4);
    objc_storeStrong((id *)&v108->_strokeGroupingModel, a5);
    objc_storeStrong((id *)&v108->_locales, a6);
    v108->_isInlineContinuousMode = v10;
    objc_storeStrong((id *)&v108->_textInputTargets, a8);
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v16, v17, v18, v19, v20, v106, v107);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E7827C80, v22, (uint64_t)&v113, (uint64_t)v118, 16, v23);
    if (v29)
    {
      v30 = *(_QWORD *)v114;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v114 != v30)
            objc_enumerationMutation(&unk_1E7827C80);
          v32 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v31);
          v33 = objc_msgSend_integerValue(v32, v24, v25, v26, v27, v28);
          objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v34, v35, v36, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v40 = [CHTopDownStrokeGroupingStrategy alloc];
            objc_msgSend_firstObject(v109, v41, v42, v43, v44, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (void *)objc_msgSend_initWithStrokeProvider_locale_textInputTargets_(v40, v47, (uint64_t)v111, (uint64_t)v46, (uint64_t)v110, v48);

            objc_msgSend_strategyIdentifier(v49, v50, v51, v52, v53, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v39, v56, (uint64_t)v49, (uint64_t)v55, v57, v58);
          }
          else if (a9 || v33 == 3)
          {
            v70 = [CHMathStrokeGroupingStrategy alloc];
            objc_msgSend_strokeGroupingModel(v108, v71, v72, v73, v74, v75);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (void *)objc_msgSend_initWithStrokeProvider_strokeGroupingModel_(v70, v77, (uint64_t)v111, (uint64_t)v76, v78, v79);

            objc_msgSend_strategyIdentifier(v49, v80, v81, v82, v83, v84);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v39, v85, (uint64_t)v49, (uint64_t)v55, v86, v87);
          }
          else
          {
            v59 = [CHBottomUpStrokeGroupingStrategy alloc];
            if (v33 == 2)
              isInlineContinuousMode_inlineContinuousModeTargets = (void *)objc_msgSend_initWithStrokeProvider_defaultWritingOrientation_locales_isInlineContinuousMode_inlineContinuousModeTargets_(v59, v60, (uint64_t)v111, 2, (uint64_t)v109, 0, v110);
            else
              isInlineContinuousMode_inlineContinuousModeTargets = (void *)objc_msgSend_initWithStrokeProvider_defaultWritingOrientation_locales_isInlineContinuousMode_inlineContinuousModeTargets_(v59, v60, (uint64_t)v111, 1, (uint64_t)v109, 0, v110);
            v49 = isInlineContinuousMode_inlineContinuousModeTargets;
            objc_msgSend_strategyIdentifier(isInlineContinuousMode_inlineContinuousModeTargets, v62, v63, v64, v65, v66);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v39, v67, (uint64_t)v49, (uint64_t)v55, v68, v69);
          }

          if (!objc_msgSend_count(v39, v88, v89, v90, v91, v92))
          {
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v98 = (id)qword_1EF568E18[0];
            if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BE607000, v98, OS_LOG_TYPE_FAULT, "At least one stroke grouping strategy must be set.", buf, 2u);
            }

          }
          v99 = (void *)objc_msgSend_copy(v39, v93, v94, v95, v96, v97);
          objc_msgSend_setObject_forKeyedSubscript_(v21, v100, (uint64_t)v99, (uint64_t)v32, v101, v102);

          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E7827C80, v24, (uint64_t)&v113, (uint64_t)v118, 16, v28);
      }
      while (v29);
    }
    v103 = objc_msgSend_copy(v21, v24, v25, v26, v27, v28);
    groupingStrategiesByIdentifierForTextStrokeClasses = v108->_groupingStrategiesByIdentifierForTextStrokeClasses;
    v108->_groupingStrategiesByIdentifierForTextStrokeClasses = (NSDictionary *)v103;

  }
  return v108;
}

+ (id)sortedGroupsBySizeDescending:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  objc_msgSend_allObjects(a3, a2, (uint64_t)a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v6, v7, (uint64_t)&unk_1E77F15B0, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_mutableCopy(v11, v12, v13, v14, v15, v16);

  return v17;
}

- (id)updatedGroupingResultByAddingStrokes:(id)a3 removingStrokeIdentifiers:(id)a4 orderedStrokeIdentifiers:(id)a5 strokeClassificationResult:(id)a6 cancellationBlock:(id)a7
{
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
  NSObject *v22;
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
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  NSDictionary *v57;
  const char *v58;
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
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  id v105;
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
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t k;
  unint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  int isStrokeClassificationTextOrMath;
  void *v185;
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
  int v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  int v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t m;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
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
  uint64_t v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
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
  void *v331;
  char isKindOfClass;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  void *v349;
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
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  void *v371;
  id v372;
  id v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  void *v388;
  id v389;
  id v390;
  id v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  id v396;
  const char *v397;
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
  uint64_t v409;
  uint64_t v410;
  void *v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  const char *v416;
  uint64_t v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t n;
  uint64_t v424;
  void *v425;
  const char *v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  void *v431;
  const char *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  void *v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  CHStrokeGroup *v443;
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
  void *v455;
  const char *v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  void *v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  void *v467;
  const char *v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  double v473;
  double v474;
  double v475;
  double v476;
  double v477;
  double v478;
  double v479;
  double v480;
  const char *v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  const char *v486;
  double v487;
  double v488;
  void *StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
  const char *v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  const char *v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  void *v503;
  uint64_t v504;
  const char *v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  void *v509;
  id v510;
  const char *v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  CHFastStrokeGroupingStrategy *v515;
  const char *v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  void *v521;
  const char *v522;
  uint64_t v523;
  const char *v524;
  const char *v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  void *v530;
  id v531;
  const char *v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  const char *v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  const char *v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  char *v546;
  uint64_t v547;
  char *v548;
  const char *v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  void *v553;
  char *v554;
  char *v555;
  id v556;
  void *v557;
  uint64_t v558;
  double v559;
  double v560;
  double x;
  double y;
  double width;
  double height;
  void *v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  void *v571;
  const char *v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  void *v576;
  const char *v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  const char *v583;
  uint64_t v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  const char *v588;
  uint64_t v589;
  uint64_t v590;
  uint64_t v591;
  uint64_t v592;
  const char *v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  double v598;
  double v599;
  CGFloat v600;
  CGFloat v601;
  CGFloat v602;
  CGFloat v603;
  char *v604;
  char *v605;
  BOOL v606;
  CHStrokeGroup *v607;
  const char *v608;
  void *v609;
  const char *v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  void *v614;
  id v615;
  char *v616;
  char *v617;
  char *v618;
  id v619;
  CHCTLD *v620;
  const char *v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  void *v625;
  const char *v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  void *v631;
  const char *v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  void *v636;
  const char *v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  const char *v641;
  uint64_t v642;
  uint64_t v643;
  uint64_t v644;
  NSDictionary *groupingStrategiesByIdentifierForTextStrokeClasses;
  uint64_t v646;
  const char *v647;
  uint64_t v648;
  void *v649;
  id v650;
  id v651;
  id v652;
  const char *v653;
  uint64_t v654;
  uint64_t v655;
  uint64_t v656;
  uint64_t v657;
  void *v658;
  id v659;
  id v660;
  const char *v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  const char *v665;
  uint64_t v666;
  uint64_t v667;
  uint64_t v668;
  uint64_t v669;
  void *v670;
  id v671;
  id v672;
  id v673;
  const char *v674;
  uint64_t v675;
  uint64_t v676;
  uint64_t v677;
  const char *v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  const char *v682;
  uint64_t v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  const char *v687;
  uint64_t v688;
  uint64_t v689;
  uint64_t v690;
  uint64_t v691;
  const char *v692;
  uint64_t v693;
  uint64_t v694;
  uint64_t v695;
  uint64_t v696;
  void *v697;
  const char *v698;
  uint64_t v699;
  uint64_t v700;
  uint64_t v701;
  const char *v702;
  uint64_t v703;
  uint64_t v704;
  uint64_t v705;
  const char *v706;
  uint64_t v707;
  uint64_t v708;
  uint64_t v709;
  void *v710;
  const char *v711;
  uint64_t v712;
  uint64_t v713;
  uint64_t v714;
  uint64_t v715;
  void *v716;
  const char *v717;
  uint64_t v718;
  uint64_t v719;
  uint64_t v720;
  uint64_t v721;
  uint64_t v722;
  const char *v723;
  uint64_t v724;
  uint64_t v725;
  uint64_t v726;
  void *v727;
  const char *v728;
  uint64_t v729;
  uint64_t v730;
  uint64_t v731;
  void *v732;
  const char *v733;
  uint64_t v734;
  uint64_t v735;
  uint64_t v736;
  uint64_t v737;
  void *v738;
  const char *v739;
  void *v740;
  const char *v741;
  uint64_t v742;
  uint64_t v743;
  const char *v744;
  uint64_t v745;
  const char *v746;
  uint64_t v747;
  uint64_t v748;
  uint64_t v749;
  uint64_t v750;
  const char *v751;
  uint64_t v752;
  uint64_t v753;
  uint64_t v754;
  uint64_t v755;
  const char *v756;
  uint64_t v757;
  uint64_t v758;
  uint64_t v759;
  const char *v760;
  uint64_t v761;
  uint64_t v762;
  uint64_t v763;
  uint64_t v764;
  const char *v765;
  uint64_t v766;
  uint64_t v767;
  uint64_t v768;
  uint64_t v769;
  void *v770;
  const char *v771;
  uint64_t v772;
  uint64_t v773;
  uint64_t v774;
  uint64_t v775;
  void *v776;
  const char *v777;
  uint64_t v778;
  const char *v779;
  uint64_t v780;
  uint64_t v781;
  uint64_t v782;
  uint64_t v783;
  uint64_t v784;
  uint64_t ii;
  void *v786;
  void *v787;
  const char *v788;
  uint64_t v789;
  uint64_t v790;
  uint64_t v791;
  uint64_t v792;
  uint64_t v793;
  const char *v794;
  uint64_t v795;
  uint64_t v796;
  uint64_t v797;
  uint64_t v798;
  void *v799;
  const char *v800;
  uint64_t v801;
  uint64_t v802;
  uint64_t v803;
  uint64_t v804;
  void *v805;
  const char *v806;
  uint64_t v807;
  uint64_t v808;
  const char *v809;
  uint64_t v810;
  uint64_t v811;
  uint64_t v812;
  uint64_t v813;
  void *v814;
  const char *v815;
  uint64_t v816;
  const char *v817;
  uint64_t v818;
  uint64_t v819;
  uint64_t v820;
  uint64_t v821;
  uint64_t v822;
  double v823;
  uint64_t jj;
  void *v825;
  const char *v826;
  uint64_t v827;
  uint64_t v828;
  uint64_t v829;
  uint64_t v830;
  void *v831;
  const char *v832;
  uint64_t v833;
  uint64_t v834;
  uint64_t v835;
  uint64_t v836;
  void *v837;
  const char *v838;
  uint64_t v839;
  uint64_t v840;
  uint64_t v841;
  void *v842;
  const char *v843;
  uint64_t v844;
  uint64_t v845;
  uint64_t v846;
  uint64_t v847;
  void *v848;
  const char *v849;
  uint64_t v850;
  uint64_t v851;
  uint64_t v852;
  uint64_t v853;
  void *v854;
  const char *v855;
  uint64_t v856;
  uint64_t v857;
  uint64_t v858;
  uint64_t v859;
  double v860;
  double v861;
  id v862;
  const char *v863;
  uint64_t v864;
  uint64_t v865;
  uint64_t v866;
  const char *v867;
  uint64_t v868;
  uint64_t v869;
  uint64_t v870;
  uint64_t v871;
  void *v872;
  const char *v873;
  uint64_t v874;
  uint64_t v875;
  uint64_t v876;
  uint64_t kk;
  uint64_t v878;
  NSDictionary *v879;
  const char *v880;
  uint64_t v881;
  uint64_t v882;
  uint64_t v883;
  void *v884;
  const char *v885;
  uint64_t v886;
  uint64_t v887;
  uint64_t v888;
  void *v889;
  const char *v890;
  uint64_t v891;
  uint64_t v892;
  uint64_t v893;
  void *v894;
  const char *v895;
  uint64_t v896;
  uint64_t v897;
  uint64_t v898;
  uint64_t v899;
  void *v900;
  const char *v901;
  void *v902;
  const char *v903;
  uint64_t v904;
  uint64_t v905;
  const char *v906;
  uint64_t v907;
  const char *v908;
  uint64_t v909;
  uint64_t v910;
  uint64_t v911;
  uint64_t v912;
  const char *v913;
  uint64_t v914;
  uint64_t v915;
  uint64_t v916;
  void *v917;
  const char *v918;
  uint64_t v919;
  uint64_t v920;
  uint64_t v921;
  uint64_t v922;
  uint64_t v923;
  const char *v924;
  uint64_t v925;
  uint64_t v926;
  uint64_t v927;
  void *v928;
  const char *v929;
  uint64_t v930;
  uint64_t v931;
  uint64_t v932;
  const char *v933;
  uint64_t v934;
  uint64_t v935;
  uint64_t v936;
  uint64_t v937;
  uint64_t v938;
  const char *v939;
  uint64_t v940;
  uint64_t v941;
  uint64_t v942;
  void *v943;
  const char *v944;
  uint64_t v945;
  uint64_t v946;
  uint64_t v947;
  uint64_t v948;
  const char *v949;
  uint64_t v950;
  void *v951;
  const char *v952;
  uint64_t v953;
  const char *v954;
  uint64_t v955;
  uint64_t v956;
  uint64_t v957;
  uint64_t v958;
  uint64_t v959;
  uint64_t v960;
  uint64_t v961;
  void *v962;
  void *v963;
  const char *v964;
  uint64_t v965;
  uint64_t v966;
  uint64_t v967;
  uint64_t v968;
  void *v969;
  const char *v970;
  uint64_t v971;
  uint64_t v972;
  uint64_t v973;
  const char *v974;
  uint64_t v975;
  uint64_t v976;
  uint64_t v977;
  uint64_t v978;
  void *v979;
  const char *v980;
  uint64_t v981;
  uint64_t v982;
  uint64_t v983;
  uint64_t v984;
  void *v985;
  const char *v986;
  uint64_t v987;
  uint64_t v988;
  uint64_t v989;
  char isEqualToSet;
  id v991;
  const char *v992;
  uint64_t v993;
  uint64_t v994;
  uint64_t v995;
  const char *v996;
  uint64_t v997;
  uint64_t v998;
  uint64_t v999;
  const char *v1000;
  uint64_t v1001;
  uint64_t v1002;
  uint64_t v1003;
  const char *v1004;
  uint64_t v1005;
  const char *v1006;
  uint64_t v1007;
  uint64_t v1008;
  uint64_t v1009;
  const char *v1010;
  uint64_t v1011;
  uint64_t v1012;
  void *v1013;
  id v1014;
  id v1015;
  id v1016;
  id v1017;
  id v1018;
  id v1019;
  id v1020;
  id v1021;
  id v1022;
  const char *v1023;
  uint64_t v1024;
  uint64_t v1025;
  uint64_t v1026;
  const char *v1027;
  uint64_t v1028;
  uint64_t v1029;
  uint64_t v1030;
  uint64_t v1031;
  const char *v1032;
  uint64_t v1033;
  uint64_t v1034;
  uint64_t v1035;
  uint64_t v1036;
  const char *v1037;
  uint64_t v1038;
  uint64_t v1039;
  uint64_t v1040;
  uint64_t v1041;
  const char *v1042;
  uint64_t v1043;
  uint64_t v1044;
  uint64_t v1045;
  const char *v1046;
  uint64_t v1047;
  uint64_t v1048;
  uint64_t v1049;
  const char *v1050;
  uint64_t v1051;
  uint64_t v1052;
  uint64_t v1053;
  const char *v1054;
  uint64_t v1055;
  uint64_t v1056;
  uint64_t v1057;
  uint64_t v1058;
  void *v1059;
  const char *v1060;
  uint64_t v1061;
  uint64_t v1062;
  const char *v1063;
  uint64_t v1064;
  uint64_t v1065;
  uint64_t v1066;
  uint64_t i1;
  uint64_t v1068;
  void *v1069;
  uint64_t v1070;
  const char *v1071;
  uint64_t v1072;
  uint64_t v1073;
  uint64_t v1074;
  const char *v1075;
  uint64_t v1076;
  uint64_t v1077;
  uint64_t v1078;
  uint64_t v1079;
  void *v1080;
  const char *v1081;
  uint64_t v1082;
  uint64_t v1083;
  uint64_t v1084;
  int v1085;
  const char *v1086;
  uint64_t v1087;
  uint64_t v1088;
  uint64_t v1089;
  uint64_t v1090;
  void *v1091;
  const char *v1092;
  uint64_t v1093;
  uint64_t v1094;
  uint64_t v1095;
  uint64_t v1096;
  void *v1097;
  const char *v1098;
  uint64_t v1099;
  uint64_t v1100;
  uint64_t v1101;
  uint64_t v1102;
  void *v1103;
  const char *v1104;
  uint64_t v1105;
  uint64_t v1106;
  uint64_t v1107;
  uint64_t v1108;
  void *v1109;
  const char *v1110;
  uint64_t v1111;
  uint64_t v1112;
  uint64_t v1113;
  uint64_t v1114;
  void *v1115;
  const char *v1116;
  uint64_t v1117;
  uint64_t v1118;
  uint64_t v1119;
  uint64_t v1120;
  void *v1121;
  uint64_t v1122;
  const char *v1123;
  uint64_t v1124;
  uint64_t v1125;
  uint64_t v1126;
  void *v1127;
  const char *v1128;
  uint64_t v1129;
  uint64_t v1130;
  uint64_t v1131;
  void *v1132;
  const char *v1133;
  uint64_t v1134;
  uint64_t v1135;
  uint64_t v1136;
  const char *v1137;
  uint64_t v1138;
  uint64_t v1139;
  uint64_t v1140;
  const char *v1141;
  uint64_t v1142;
  uint64_t v1143;
  uint64_t v1144;
  const char *v1145;
  uint64_t v1146;
  uint64_t v1147;
  uint64_t v1148;
  const char *v1149;
  uint64_t v1150;
  uint64_t v1151;
  uint64_t v1152;
  CHBottomUpStrokeGroupingResult *v1153;
  const char *v1154;
  uint64_t v1155;
  uint64_t v1156;
  uint64_t v1157;
  uint64_t v1158;
  void *v1159;
  const char *v1160;
  void *v1161;
  const char *v1162;
  uint64_t v1163;
  uint64_t v1164;
  const char *v1165;
  uint64_t v1166;
  uint64_t v1167;
  uint64_t v1168;
  const char *v1169;
  uint64_t v1170;
  uint64_t v1171;
  uint64_t v1172;
  const char *v1173;
  uint64_t v1174;
  uint64_t v1175;
  uint64_t v1176;
  const char *v1177;
  uint64_t v1178;
  uint64_t v1179;
  uint64_t v1180;
  const char *v1181;
  uint64_t v1182;
  uint64_t v1183;
  uint64_t v1184;
  const char *v1185;
  uint64_t v1186;
  uint64_t v1187;
  uint64_t v1188;
  uint64_t v1189;
  const char *v1190;
  uint64_t v1191;
  uint64_t v1192;
  uint64_t v1193;
  uint64_t v1194;
  const char *v1195;
  uint64_t v1196;
  const char *v1197;
  uint64_t v1198;
  uint64_t v1199;
  uint64_t v1200;
  uint64_t v1201;
  void *v1202;
  void *v1203;
  const char *v1204;
  uint64_t v1205;
  uint64_t v1206;
  uint64_t v1207;
  uint64_t v1208;
  void *v1209;
  uint64_t v1210;
  const char *v1211;
  uint64_t v1212;
  uint64_t v1213;
  uint64_t v1214;
  const char *v1215;
  uint64_t v1216;
  uint64_t v1217;
  uint64_t v1218;
  const char *v1219;
  uint64_t v1220;
  uint64_t v1221;
  uint64_t v1222;
  uint64_t v1223;
  void *v1224;
  const char *v1225;
  uint64_t v1226;
  uint64_t v1227;
  uint64_t v1228;
  void *v1229;
  const char *v1230;
  uint64_t v1231;
  uint64_t v1232;
  uint64_t v1233;
  uint64_t v1234;
  void *v1235;
  const char *v1236;
  uint64_t v1237;
  uint64_t v1238;
  uint64_t v1239;
  uint64_t v1240;
  BOOL v1241;
  uint64_t v1242;
  uint64_t v1243;
  uint64_t v1244;
  void *v1245;
  const char *v1246;
  uint64_t v1247;
  uint64_t v1248;
  uint64_t v1249;
  void *v1250;
  const char *v1251;
  uint64_t v1252;
  uint64_t v1253;
  uint64_t v1254;
  uint64_t v1255;
  void *v1256;
  const char *v1257;
  uint64_t v1258;
  char *v1259;
  const char *v1260;
  uint64_t v1261;
  uint64_t v1262;
  uint64_t v1263;
  uint64_t v1264;
  uint64_t v1265;
  uint64_t v1266;
  uint64_t i3;
  void *v1268;
  const char *v1269;
  uint64_t v1270;
  uint64_t v1271;
  uint64_t v1272;
  uint64_t v1273;
  uint64_t v1274;
  id v1275;
  const char *v1276;
  void *v1277;
  unint64_t v1278;
  void *v1279;
  NSDictionary *v1280;
  void *v1281;
  const char *v1282;
  uint64_t v1283;
  uint64_t v1284;
  uint64_t v1285;
  uint64_t v1286;
  uint64_t v1287;
  const char *v1288;
  uint64_t v1289;
  uint64_t v1290;
  uint64_t v1291;
  void *v1292;
  const char *v1293;
  uint64_t v1294;
  uint64_t v1295;
  uint64_t v1296;
  void *v1297;
  const char *v1298;
  uint64_t v1299;
  uint64_t v1300;
  uint64_t v1301;
  uint64_t v1302;
  void *v1303;
  const char *v1304;
  uint64_t v1305;
  uint64_t v1306;
  uint64_t v1307;
  void *v1308;
  uint64_t v1309;
  const char *v1310;
  uint64_t v1311;
  uint64_t v1312;
  uint64_t v1313;
  const char *v1314;
  uint64_t v1315;
  uint64_t v1316;
  uint64_t v1317;
  uint64_t v1318;
  unint64_t v1319;
  const char *v1320;
  uint64_t v1321;
  uint64_t v1322;
  uint64_t v1323;
  void *v1324;
  NSDictionary *v1325;
  void *v1326;
  const char *v1327;
  uint64_t v1328;
  uint64_t v1329;
  uint64_t v1330;
  uint64_t v1331;
  uint64_t v1332;
  const char *v1333;
  uint64_t v1334;
  uint64_t v1335;
  uint64_t v1336;
  void *v1337;
  const char *v1338;
  uint64_t v1339;
  uint64_t v1340;
  uint64_t v1341;
  void *v1342;
  const char *v1343;
  uint64_t v1344;
  uint64_t v1345;
  uint64_t v1346;
  uint64_t v1347;
  void *v1348;
  const char *v1349;
  uint64_t v1350;
  uint64_t v1351;
  uint64_t v1352;
  void *v1353;
  uint64_t v1354;
  const char *v1355;
  uint64_t v1356;
  uint64_t v1357;
  uint64_t v1358;
  char isMemberOfClass;
  const char *v1360;
  uint64_t v1361;
  uint64_t v1362;
  uint64_t v1363;
  char v1364;
  const char *v1365;
  uint64_t v1366;
  uint64_t v1367;
  uint64_t v1368;
  const char *v1369;
  uint64_t v1370;
  uint64_t v1371;
  const char *v1372;
  uint64_t v1373;
  uint64_t v1374;
  uint64_t v1375;
  uint64_t v1376;
  double v1377;
  void *v1378;
  const char *v1379;
  uint64_t v1380;
  uint64_t v1381;
  uint64_t v1382;
  void *v1383;
  const char *v1384;
  uint64_t v1385;
  uint64_t v1386;
  uint64_t v1387;
  uint64_t v1388;
  void *v1389;
  const char *v1390;
  void *v1391;
  const char *v1392;
  uint64_t v1393;
  uint64_t v1394;
  uint64_t v1395;
  uint64_t v1396;
  const char *v1397;
  uint64_t v1398;
  uint64_t v1399;
  uint64_t v1400;
  uint64_t v1401;
  const char *v1402;
  uint64_t v1403;
  uint64_t v1404;
  uint64_t v1405;
  const char *v1406;
  uint64_t v1407;
  uint64_t v1408;
  uint64_t v1409;
  void *v1410;
  const char *v1411;
  uint64_t v1412;
  uint64_t v1413;
  uint64_t v1414;
  void *v1415;
  const char *v1416;
  uint64_t v1417;
  uint64_t v1418;
  uint64_t v1419;
  void *v1420;
  const char *v1421;
  uint64_t v1422;
  uint64_t v1423;
  uint64_t v1424;
  uint64_t v1425;
  void *v1426;
  const char *v1427;
  void *v1428;
  const char *v1429;
  uint64_t v1430;
  uint64_t v1431;
  uint64_t v1432;
  uint64_t v1433;
  const char *v1434;
  uint64_t v1435;
  uint64_t v1436;
  uint64_t v1437;
  const char *v1438;
  uint64_t v1439;
  uint64_t v1440;
  uint64_t v1441;
  const char *v1442;
  uint64_t v1443;
  uint64_t v1444;
  uint64_t v1445;
  void *v1446;
  const char *v1447;
  uint64_t v1448;
  uint64_t v1449;
  uint64_t v1450;
  const char *v1451;
  uint64_t v1452;
  uint64_t v1453;
  uint64_t v1454;
  uint64_t v1455;
  void *v1456;
  const char *v1457;
  uint64_t v1458;
  uint64_t v1459;
  uint64_t v1460;
  uint64_t v1461;
  id v1462;
  const char *v1463;
  uint64_t v1464;
  const char *v1465;
  uint64_t v1466;
  uint64_t v1467;
  uint64_t v1468;
  uint64_t v1469;
  uint64_t v1470;
  uint64_t v1471;
  uint64_t i4;
  uint64_t v1473;
  void *v1474;
  const char *v1475;
  uint64_t v1476;
  uint64_t v1477;
  uint64_t v1478;
  char v1479;
  const char *v1480;
  uint64_t v1481;
  uint64_t v1482;
  uint64_t v1483;
  uint64_t v1484;
  void *v1485;
  const char *v1486;
  uint64_t v1487;
  const char *v1488;
  uint64_t v1489;
  uint64_t v1490;
  uint64_t v1491;
  uint64_t v1492;
  uint64_t v1493;
  uint64_t i5;
  uint64_t v1495;
  const char *v1496;
  uint64_t v1497;
  uint64_t v1498;
  uint64_t v1499;
  void *v1500;
  const char *v1501;
  uint64_t v1502;
  uint64_t v1503;
  uint64_t v1504;
  uint64_t v1505;
  void *v1506;
  const char *v1507;
  uint64_t v1508;
  uint64_t v1509;
  uint64_t v1510;
  void *v1511;
  const char *v1512;
  uint64_t v1513;
  uint64_t v1514;
  uint64_t v1515;
  uint64_t v1516;
  void *v1517;
  const char *v1518;
  uint64_t v1519;
  uint64_t v1520;
  uint64_t v1521;
  void *v1522;
  const char *v1523;
  uint64_t v1524;
  uint64_t v1525;
  uint64_t v1526;
  uint64_t v1527;
  void *v1528;
  CHMergedStrokeGroupingResults *v1529;
  const char *v1530;
  BOOL v1532;
  id v1533;
  id v1534;
  id v1535;
  void *v1536;
  id v1537;
  id v1538;
  void *v1539;
  void *v1540;
  void *v1541;
  void *v1542;
  void *v1543;
  void *v1544;
  void *v1545;
  void *v1546;
  void *v1547;
  id v1548;
  id v1549;
  id v1550;
  id v1551;
  uint64_t v1552;
  uint64_t v1553;
  id v1554;
  id v1555;
  id v1556;
  void *v1557;
  void *v1558;
  void *v1559;
  void *v1560;
  void *v1561;
  void *v1562;
  id v1563;
  void *v1564;
  void *v1565;
  void *v1566;
  id v1567;
  void *v1568;
  id v1569;
  void *v1570;
  void *v1571;
  id v1572;
  id v1573;
  id v1574;
  void *v1575;
  void *v1576;
  id v1577;
  id v1578;
  id v1579;
  uint64_t (**v1580)(void);
  id v1581;
  id v1582;
  uint64_t v1583;
  id v1584;
  id v1585;
  id v1586;
  id v1587;
  id v1588;
  void *v1589;
  id v1590;
  id v1591;
  id v1592;
  id v1593;
  id v1594;
  uint64_t v1595;
  id v1596;
  id v1597;
  id v1598;
  id v1599;
  id v1600;
  id v1601;
  id v1602;
  void *v1603;
  uint64_t (**v1604)(void);
  uint64_t (**v1605)(void);
  id v1606;
  id v1607;
  id v1608;
  id v1609;
  uint64_t (**v1610)(void);
  id v1611;
  void *v1612;
  id v1613;
  id v1614;
  id v1615;
  id v1616;
  id v1617;
  id v1618;
  id v1619;
  id v1620;
  id v1621;
  uint64_t v1622;
  id v1623;
  void *v1624;
  uint64_t i2;
  id v1626;
  id v1627;
  id v1628;
  id v1629;
  id v1630;
  id v1631;
  id v1632;
  id v1633;
  char *v1634;
  id v1635;
  id v1636;
  id v1637;
  id v1638;
  id v1639;
  id v1640;
  uint64_t v1641;
  id v1642;
  id v1643;
  uint64_t v1644;
  id v1645;
  uint64_t v1646;
  void *v1647;
  unint64_t nn;
  id v1649;
  void *v1650;
  uint64_t (**v1651)(void);
  uint64_t mm;
  id v1653;
  void *v1654;
  uint64_t v1655;
  CHStrokeGroupingManager *v1656;
  uint64_t v1657;
  id obj;
  id obja;
  id objb;
  id objc;
  id objd;
  id objf;
  id obje;
  __int128 v1665;
  __int128 v1666;
  __int128 v1667;
  __int128 v1668;
  __int128 v1669;
  __int128 v1670;
  __int128 v1671;
  __int128 v1672;
  __int128 v1673;
  __int128 v1674;
  __int128 v1675;
  __int128 v1676;
  __int128 v1677;
  __int128 v1678;
  __int128 v1679;
  __int128 v1680;
  __int128 v1681;
  __int128 v1682;
  __int128 v1683;
  __int128 v1684;
  __int128 v1685;
  __int128 v1686;
  __int128 v1687;
  __int128 v1688;
  __int128 v1689;
  __int128 v1690;
  __int128 v1691;
  __int128 v1692;
  _QWORD v1693[4];
  id v1694;
  id v1695;
  id v1696;
  id v1697;
  id v1698;
  id v1699;
  id v1700;
  __int128 v1701;
  __int128 v1702;
  __int128 v1703;
  __int128 v1704;
  __int128 v1705;
  __int128 v1706;
  __int128 v1707;
  __int128 v1708;
  __int128 v1709;
  __int128 v1710;
  __int128 v1711;
  __int128 v1712;
  _QWORD v1713[4];
  id v1714;
  uint64_t v1715;
  uint64_t v1716;
  void *v1717;
  void *v1718;
  id v1719;
  id v1720;
  id v1721;
  id v1722;
  id v1723;
  _QWORD v1724[4];
  id v1725;
  id v1726;
  id v1727;
  _QWORD v1728[4];
  id v1729;
  id v1730;
  id v1731;
  __int128 v1732;
  __int128 v1733;
  __int128 v1734;
  __int128 v1735;
  void *__p[2];
  __int128 v1737;
  __int128 v1738;
  __int128 v1739;
  __int128 v1740;
  __int128 v1741;
  __int128 v1742;
  __int128 v1743;
  _BYTE v1744[128];
  _BYTE v1745[128];
  _BYTE v1746[128];
  _BYTE v1747[128];
  _BYTE v1748[128];
  _BYTE v1749[128];
  _BYTE v1750[128];
  _QWORD v1751[4];
  id v1752;
  id v1753;
  id v1754;
  _BYTE v1755[24];
  void *v1756;
  id v1757;
  id v1758;
  id v1759;
  __int128 v1760;
  __int128 v1761;
  __int128 v1762;
  __int128 v1763;
  __int128 v1764;
  __int128 v1765;
  __int128 v1766;
  __int128 v1767;
  id v1768;
  id v1769;
  __int128 *v1770;
  __int128 v1771;
  __int128 v1772;
  __int128 v1773;
  __int128 v1774;
  id v1775;
  id v1776;
  __int128 *v1777;
  uint8_t buf[136];
  uint64_t v1779;
  CGRect v1780;
  CGRect v1781;
  CGRect v1782;

  v1779 = *MEMORY[0x1E0C80C00];
  v1548 = a3;
  v1549 = a4;
  v1554 = a5;
  v1584 = a6;
  v1605 = (uint64_t (**)(void))a7;
  v1656 = self;
  objc_msgSend_strokeProvider(self, v12, v13, v14, v15, v16);
  v1536 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1536)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v22 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v22, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
    }

  }
  objc_msgSend_sessionLastResult(self, v17, v18, v19, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeClassificationResult(v23, v24, v25, v26, v27, v28);
  v1560 = (void *)objc_claimAutoreleasedReturnValue();

  v1551 = v1548;
  v1649 = v1549;
  if (self)
  {
    objc_msgSend_string(MEMORY[0x1E0CB37A0], v29, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v1767 = 0u;
    v1766 = 0u;
    v1765 = 0u;
    v1764 = 0u;
    objc_msgSend_allKeys(self->_groupingStrategiesByIdentifierForTextStrokeClasses, v35, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v40;
    v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v1764, (uint64_t)buf, 16, v42);
    if (v47)
    {
      v48 = *(_QWORD *)v1765;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v1765 != v48)
            objc_enumerationMutation(obj);
          v50 = *(_QWORD *)(*((_QWORD *)&v1764 + 1) + 8 * i);
          objc_msgSend_appendFormat_(v34, v43, (uint64_t)CFSTR("%@: "), v44, v45, v46, v50, v1536);
          objc_msgSend_string(MEMORY[0x1E0CB37A0], v51, v52, v53, v54, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v1763 = 0u;
          v1762 = 0u;
          v1761 = 0u;
          v1760 = 0u;
          v57 = v1656->_groupingStrategiesByIdentifierForTextStrokeClasses;
          objc_msgSend_objectForKeyedSubscript_(v57, v58, v50, v59, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allKeys(v62, v63, v64, v65, v66, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v1760, (uint64_t)&v1771, 16, v70);
          if (v75)
          {
            v76 = *(_QWORD *)v1761;
            do
            {
              for (j = 0; j != v75; ++j)
              {
                if (*(_QWORD *)v1761 != v76)
                  objc_enumerationMutation(v68);
                objc_msgSend_appendFormat_(v56, v71, (uint64_t)CFSTR("%@, "), v72, v73, v74, *(_QWORD *)(*((_QWORD *)&v1760 + 1) + 8 * j));
              }
              v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v71, (uint64_t)&v1760, (uint64_t)&v1771, 16, v74);
            }
            while (v75);
          }

          v83 = objc_msgSend_length(v56, v78, v79, v80, v81, v82);
          objc_msgSend_substringToIndex_(v56, v84, v83 - 2, v85, v86, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v34, v89, (uint64_t)v88, v90, v91, v92);

        }
        v40 = obj;
        v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v1764, (uint64_t)buf, 16, v46);
      }
      while (v47);
    }

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v93 = (id)qword_1EF568E30;
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v1755 = 138412802;
      *(_QWORD *)&v1755[4] = v34;
      *(_WORD *)&v1755[12] = 2048;
      *(_QWORD *)&v1755[14] = objc_msgSend_count(v1551, v94, v95, v96, v97, v98);
      *(_WORD *)&v1755[22] = 2048;
      v1756 = (void *)objc_msgSend_count(v1649, v99, v100, v101, v102, v103);
      _os_log_impl(&dword_1BE607000, v93, OS_LOG_TYPE_DEBUG, "Stroke Grouping with strategies [%@]. Added strokes: %ld, removed strokes: %ld", v1755, 0x20u);
    }

    v104 = v1554;
    obja = v1584;
    v105 = v1560;
    objc_msgSend_set(MEMORY[0x1E0C99E20], v106, v107, v108, v109, v110);
    v1589 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sessionLastResult(v1656, v111, v112, v113, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_orderedStrokeIdentifiers(v116, v117, v118, v119, v120, v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();

    for (k = 0; ; ++k)
    {
      v129 = objc_msgSend_count(v104, v123, v124, v125, v126, v127);
      v140 = v129 >= objc_msgSend_count(v122, v130, v131, v132, v133, v134)
           ? objc_msgSend_count(v122, v135, v136, v137, v138, v139)
           : objc_msgSend_count(v104, v135, v136, v137, v138, v139);
      if (k >= v140)
        break;
      objc_msgSend_objectAtIndexedSubscript_(v104, v141, k, v142, v143, v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v122, v146, k, v147, v148, v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeClassificationsByStrokeIdentifier(obja, v151, v152, v153, v154, v155);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v156, v157, (uint64_t)v145, v158, v159, v160);
      v161 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_strokeClassificationsByStrokeIdentifier(v105, v162, v163, v164, v165, v166);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v167, v168, (uint64_t)v150, v169, v170, v171);
      v172 = (void *)objc_claimAutoreleasedReturnValue();

      v173 = (void *)objc_opt_class();
      v179 = objc_msgSend_integerValue(v161, v174, v175, v176, v177, v178);
      isStrokeClassificationTextOrMath = objc_msgSend_isStrokeClassificationTextOrMath_(v173, v180, v179, v181, v182, v183);
      v185 = (void *)objc_opt_class();
      v191 = objc_msgSend_integerValue(v172, v186, v187, v188, v189, v190);
      v196 = objc_msgSend_isStrokeClassificationTextOrMath_(v185, v192, v191, v193, v194, v195);
      if ((isStrokeClassificationTextOrMath & v196) == 1)
      {
        v202 = objc_msgSend_integerValue(v161, v197, v198, v199, v200, v201);
        v208 = v202 == objc_msgSend_integerValue(v172, v203, v204, v205, v206, v207);
      }
      else
      {
        v208 = isStrokeClassificationTextOrMath ^ v196 ^ 1;
      }
      if ((objc_msgSend_isEqual_(v145, v197, (uint64_t)v150, v199, v200, v201) & v208) != 1)
      {

        break;
      }
      objc_msgSend_addObject_(v1589, v209, (uint64_t)v145, v210, v211, v212);

    }
  }
  else
  {

    v1533 = v1554;
    v1534 = v1584;
    v1535 = v1560;
    v1589 = 0;
  }

  objc_msgSend_set(MEMORY[0x1E0C99E20], v213, v214, v215, v216, v217);
  v1545 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v218, v219, v220, v221, v222);
  v1543 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v223, v224, v225, v226, v227);
  v1542 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v228, v229, v230, v231, v232);
  v1544 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v233, v234, v235, v236, v237);
  v1546 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v238, v239, v240, v241, v242);
  v1547 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeClassificationsByStrokeIdentifier(v1584, v243, v244, v245, v246, v247);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v1693[0] = MEMORY[0x1E0C809B0];
  v1693[1] = 3221225472;
  v1693[2] = sub_1BE6B2DE0;
  v1693[3] = &unk_1E77F2FD8;
  v1621 = v1560;
  v1694 = v1621;
  v1555 = v1545;
  v1695 = v1555;
  v1537 = v1542;
  v1696 = v1537;
  v1556 = v1546;
  v1697 = v1556;
  v1538 = v1547;
  v1698 = v1538;
  v1619 = v1544;
  v1699 = v1619;
  v1620 = v1543;
  v1700 = v1620;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v248, v249, (uint64_t)v1693, v250, v251, v252);

  v1691 = 0u;
  v1692 = 0u;
  v1689 = 0u;
  v1690 = 0u;
  v1613 = v1649;
  v260 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1613, v253, (uint64_t)&v1689, (uint64_t)v1750, 16, v254);
  if (v260)
  {
    v261 = *(_QWORD *)v1690;
    do
    {
      for (m = 0; m != v260; ++m)
      {
        if (*(_QWORD *)v1690 != v261)
          objc_enumerationMutation(v1613);
        v263 = *(_QWORD *)(*((_QWORD *)&v1689 + 1) + 8 * m);
        objc_msgSend_strokeClassificationsByStrokeIdentifier(v1621, v255, v256, v257, v258, v259);
        v264 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v264, v265, v263, v266, v267, v268);
        v269 = (void *)objc_claimAutoreleasedReturnValue();
        v275 = objc_msgSend_integerValue(v269, v270, v271, v272, v273, v274);

        v276 = (void *)objc_opt_class();
        if (objc_msgSend_isStrokeClassificationTextOrMath_(v276, v277, v275, v278, v279, v280))
          objc_msgSend_addObject_(v1620, v281, v263, v282, v283, v284);
        else
          objc_msgSend_addObject_(v1619, v281, v263, v282, v283, v284);
      }
      v260 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1613, v255, (uint64_t)&v1689, (uint64_t)v1750, 16, v259);
    }
    while (v260);
  }

  objc_msgSend_set(MEMORY[0x1E0C99E20], v285, v286, v287, v288, v289);
  v1539 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v290, v291, v292, v293, v294);
  v1540 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v295, v296, v297, v298, v299);
  v1541 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v300, v301, v302, v303, v304);
  v1557 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v305, v306, v307, v308, v309);
  v1558 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v310, v311, v312, v313, v314);
  v1559 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v315, v316, v317, v318, v319);
  v1562 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sessionLastResult(v1656, v320, v321, v322, v323, v324);
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rawStrokeGroupingResult(v325, v326, v327, v328, v329, v330);
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend_sessionLastResult(v1656, v333, v334, v335, v336, v337);
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rawStrokeGroupingResult(v338, v339, v340, v341, v342, v343);
    v1612 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_groupingResultsByStrategyIdentifier(v1612, v344, v345, v346, v347, v348);
    v349 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addEntriesFromDictionary_(v1562, v350, (uint64_t)v349, v351, v352, v353);

  }
  else
  {
    v1612 = 0;
  }
  if ((v1605[2]() & 1) == 0)
  {
    v1596 = v1537;
    v1593 = v1619;
    v1590 = v1538;
    v1582 = v1613;
    v1602 = v1584;
    v1599 = v1621;
    v1606 = v1612;
    objb = v1539;
    v1642 = v1540;
    v1587 = v1541;
    v1580 = v1605;
    if (!v1656)
    {
LABEL_99:

      goto LABEL_100;
    }
    objc_msgSend_set(MEMORY[0x1E0C99E20], v359, v360, v361, v362, v363);
    v1564 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set(MEMORY[0x1E0C99E20], v364, v365, v366, v367, v368);
    v369 = objc_claimAutoreleasedReturnValue();
    v370 = MEMORY[0x1E0C809B0];
    v371 = (void *)v369;
    *(_QWORD *)v1755 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v1755[8] = 3221225472;
    *(_QWORD *)&v1755[16] = sub_1BE6B2FB4;
    v1756 = &unk_1E77F3000;
    v372 = v1602;
    v1757 = v372;
    v373 = v1564;
    v1758 = v373;
    v1574 = v371;
    v1759 = v1574;
    objc_msgSend_enumerateObjectsUsingBlock_(v1596, v374, (uint64_t)v1755, v375, v376, v377);
    objc_msgSend_set(MEMORY[0x1E0C99E20], v378, v379, v380, v381, v382);
    v1576 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set(MEMORY[0x1E0C99E20], v383, v384, v385, v386, v387);
    v388 = (void *)objc_claimAutoreleasedReturnValue();
    v1751[0] = v370;
    v1751[1] = 3221225472;
    v1751[2] = sub_1BE6B308C;
    v1751[3] = &unk_1E77F3000;
    v389 = v1599;
    v1752 = v389;
    v390 = v1576;
    v1753 = v390;
    v391 = v388;
    v1754 = v391;
    objc_msgSend_enumerateObjectsUsingBlock_(v1593, v392, (uint64_t)v1751, v393, v394, v395);
    *(_QWORD *)&v1740 = 0;
    *((_QWORD *)&v1740 + 1) = &v1740;
    *(_QWORD *)&v1741 = 0x2020000000;
    BYTE8(v1741) = 0;
    *(_QWORD *)&v1771 = v370;
    *((_QWORD *)&v1771 + 1) = 3221225472;
    *(_QWORD *)&v1772 = sub_1BE6B3164;
    *((_QWORD *)&v1772 + 1) = &unk_1E77F3028;
    v1635 = v372;
    *(_QWORD *)&v1773 = v1635;
    *((_QWORD *)&v1773 + 1) = v389;
    v1578 = v390;
    *(_QWORD *)&v1774 = v1578;
    v396 = v1574;
    *((_QWORD *)&v1774 + 1) = v396;
    v1585 = v391;
    v1775 = v1585;
    v1609 = v373;
    v1776 = v1609;
    v1777 = &v1740;
    objc_msgSend_enumerateObjectsUsingBlock_(v1590, v397, (uint64_t)&v1771, v398, v399, v400);
    if (*(_BYTE *)(*((_QWORD *)&v1740 + 1) + 24) || objc_msgSend_count(v1609, v401, v402, v403, v404, v405))
    {
      *(_BYTE *)(*((_QWORD *)&v1740 + 1) + 24) = 1;
      if (!v1606)
      {
LABEL_57:
        objc_msgSend_strokeProvider(v1656, v401, v402, v403, v404, v405);
        v1650 = (void *)objc_claimAutoreleasedReturnValue();
        v1763 = 0u;
        v1762 = 0u;
        v1761 = 0u;
        v1760 = 0u;
        v1631 = v396;
        v421 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1631, v416, (uint64_t)&v1760, (uint64_t)buf, 16, v417);
        if (v421)
        {
          v422 = *(_QWORD *)v1761;
          do
          {
            for (n = 0; n != v421; ++n)
            {
              if (*(_QWORD *)v1761 != v422)
                objc_enumerationMutation(v1631);
              v424 = *(_QWORD *)(*((_QWORD *)&v1760 + 1) + 8 * n);
              objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v418, v424, (uint64_t)v1650, v419, v420);
              v425 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeClassificationsByStrokeIdentifier(v1635, v426, v427, v428, v429, v430);
              v431 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(v431, v432, v424, v433, v434, v435);
              v436 = (void *)objc_claimAutoreleasedReturnValue();
              v442 = objc_msgSend_integerValue(v436, v437, v438, v439, v440, v441);

              v443 = [CHStrokeGroup alloc];
              v444 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend_encodedStrokeIdentifier(v425, v445, v446, v447, v448, v449);
              v450 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setWithObject_(v444, v451, (uint64_t)v450, v452, v453, v454);
              v455 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_encodedStrokeIdentifier(v425, v456, v457, v458, v459, v460);
              v461 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_encodedStrokeIdentifier(v425, v462, v463, v464, v465, v466);
              v467 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_bounds(v425, v468, v469, v470, v471, v472);
              v474 = v473;
              v476 = v475;
              v478 = v477;
              v480 = v479;
              objc_msgSend_bounds(v425, v481, v482, v483, v484, v485);
              StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (void *)objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v443, v486, (uint64_t)v455, (uint64_t)v461, (uint64_t)v467, v442, CFSTR("groupingManagerNonText"), v474, v476, v478, v480, 1.0, v487, v488);

              objc_msgSend_addObject_(objb, v490, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v491, v492, v493);
              objc_msgSend_addObject_(v1642, v494, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v495, v496, v497);

            }
            v421 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1631, v418, (uint64_t)&v1760, (uint64_t)buf, 16, v420);
          }
          while (v421);
        }

        if (*(_BYTE *)(*((_QWORD *)&v1740 + 1) + 24))
        {
          v503 = (void *)MEMORY[0x1E0C99DE8];
          v504 = objc_msgSend_count(v1609, v498, v499, v500, v501, v502);
          objc_msgSend_arrayWithCapacity_(v503, v505, v504, v506, v507, v508);
          v509 = (void *)objc_claimAutoreleasedReturnValue();
          v1715 = MEMORY[0x1E0C809B0];
          v1716 = 3221225472;
          v1717 = sub_1BE6B35EC;
          v1718 = &unk_1E77F3078;
          v510 = v1650;
          v1719 = v510;
          v1572 = v509;
          v1720 = v1572;
          objc_msgSend_enumerateObjectsUsingBlock_(v1609, v511, (uint64_t)&v1715, v512, v513, v514);
          v515 = [CHFastStrokeGroupingStrategy alloc];
          objc_msgSend_locales(v1656, v516, v517, v518, v519, v520);
          v521 = (void *)objc_claimAutoreleasedReturnValue();
          v1570 = (void *)objc_msgSend_initWithStrokeProvider_locales_clutterFilter_(v515, v522, (uint64_t)v510, (uint64_t)v521, 0, v523);

          objc_msgSend_groupingResultUsingStrokes_distanceMetric_mergingDistanceThreshold_clusteringLinkage_anchorPoints_shouldCancel_(v1570, v524, (uint64_t)v1572, 0, 1, 1, v1580, 125.0);
          v1566 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeClassificationsByStrokeIdentifier(v1635, v525, v526, v527, v528, v529);
          v530 = (void *)objc_claimAutoreleasedReturnValue();
          v531 = v1566;
          v1636 = v1572;
          v1626 = v530;
          v1568 = v531;
          objc_msgSend_set(MEMORY[0x1E0C99E20], v532, v533, v534, v535, v536);
          v1614 = (id)objc_claimAutoreleasedReturnValue();
          if (v531)
          {
            objc_msgSend_fastGroupingClusters(v531, v537, v538, v539, v540, v541);
            v546 = (char *)__p[1];
            if (__p[1] != __p[0])
            {
              v547 = 0;
              v546 = (char *)__p[0];
              do
              {
                v1622 = v547;
                v548 = &v546[72 * v547];
                objc_msgSend_setWithCapacity_(MEMORY[0x1E0C99E20], v542, *((_QWORD *)v548 + 7), v543, v544, v545);
                v553 = (void *)objc_claimAutoreleasedReturnValue();
                v554 = v548 + 48;
                v555 = (char *)*((_QWORD *)v548 + 5);
                if (v555 == v548 + 48)
                {
                  v556 = 0;
                  v571 = 0;
                }
                else
                {
                  v556 = 0;
                  v557 = 0;
                  v558 = 0;
                  v559 = *MEMORY[0x1E0C9D538];
                  v560 = *(double *)(MEMORY[0x1E0C9D538] + 8);
                  x = *MEMORY[0x1E0C9D628];
                  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
                  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
                  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
                  do
                  {
                    objc_msgSend_objectAtIndexedSubscript_(v1636, v549, *((_QWORD *)v555 + 4), v550, v551, v552);
                    v565 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_encodedStrokeIdentifier(v565, v566, v567, v568, v569, v570);
                    v571 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKey_(v1626, v572, (uint64_t)v571, v573, v574, v575);
                    v576 = (void *)objc_claimAutoreleasedReturnValue();
                    v582 = objc_msgSend_integerValue(v576, v577, v578, v579, v580, v581);

                    if (v558)
                      v587 = v558;
                    else
                      v587 = v582;
                    if (v587 == v582)
                      v558 = v587;
                    else
                      v558 = 5;
                    objc_msgSend_addObject_(v553, v583, (uint64_t)v571, v584, v585, v586);
                    if (!v556)
                    {
                      v556 = v571;
                      objc_msgSend_bounds(v565, v593, v594, v595, v596, v597);
                      v559 = v598;
                      v560 = v599;
                    }
                    objc_msgSend_bounds(v565, v588, v589, v590, v591, v592);
                    v1782.origin.x = v600;
                    v1782.origin.y = v601;
                    v1782.size.width = v602;
                    v1782.size.height = v603;
                    v1780.origin.x = x;
                    v1780.origin.y = y;
                    v1780.size.width = width;
                    v1780.size.height = height;
                    v1781 = CGRectUnion(v1780, v1782);
                    x = v1781.origin.x;
                    y = v1781.origin.y;
                    width = v1781.size.width;
                    height = v1781.size.height;

                    v604 = (char *)*((_QWORD *)v555 + 1);
                    if (v604)
                    {
                      do
                      {
                        v605 = v604;
                        v604 = *(char **)v604;
                      }
                      while (v604);
                    }
                    else
                    {
                      do
                      {
                        v605 = (char *)*((_QWORD *)v555 + 2);
                        v606 = *(_QWORD *)v605 == (_QWORD)v555;
                        v555 = v605;
                      }
                      while (!v606);
                    }
                    v557 = v571;
                    v555 = v605;
                  }
                  while (v605 != v554);
                  if (v556 && v571)
                  {
                    v607 = [CHStrokeGroup alloc];
                    v609 = (void *)objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v607, v608, (uint64_t)v553, (uint64_t)v556, (uint64_t)v571, v558, CFSTR("groupingManagerNonText"), x, y, width, height, 1.0, v559, v560);
                    objc_msgSend_addObject_(v1614, v610, (uint64_t)v609, v611, v612, v613);

                  }
                }

                v547 = v1622 + 1;
                v546 = (char *)__p[0];
              }
              while (v1622 + 1 < 0x8E38E38E38E38E39 * (((char *)__p[1] - (char *)__p[0]) >> 3));
            }
            v614 = v1614;
            v615 = v1614;
            if (v546)
            {
              v616 = v546;
              if (__p[1] != v546)
              {
                v617 = (char *)__p[1] - 32;
                do
                {
                  v618 = v617 - 40;
                  sub_1BE62033C((uint64_t)v617, *((_QWORD **)v617 + 1));
                  sub_1BE67AC7C((uint64_t)(v617 - 40), *((_QWORD **)v617 - 4));
                  v617 -= 72;
                }
                while (v618 != v546);
                v616 = (char *)__p[0];
              }
              __p[1] = v546;
              operator delete(v616);
              v614 = v1614;
            }
          }
          else
          {
            v614 = v1614;
            v619 = v1614;
          }

          v620 = [CHCTLD alloc];
          v625 = (void *)objc_msgSend_initWithType_(v620, v621, 2, v622, v623, v624);
          objc_msgSend_allObjects(v1614, v626, v627, v628, v629, v630);
          v631 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_mergeStrokeGroups_(v625, v632, (uint64_t)v631, v633, v634, v635);
          v636 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_addObjectsFromArray_(objb, v637, (uint64_t)v636, v638, v639, v640);
          objc_msgSend_addObjectsFromArray_(v1642, v641, (uint64_t)v636, v642, v643, v644);

        }
        _Block_object_dispose(&v1740, 8);

        goto LABEL_99;
      }
    }
    else
    {
      v1532 = objc_msgSend_count(v1578, v401, v402, v403, v404, v405) != 0;
      *(_BYTE *)(*((_QWORD *)&v1740 + 1) + 24) = v1532;
      if (!v1606)
        goto LABEL_57;
    }
    objc_msgSend_strokeGroups(v1606, v401, v402, v403, v404, v405);
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v1764 = v370;
    *((_QWORD *)&v1764 + 1) = 3221225472;
    *(_QWORD *)&v1765 = sub_1BE6B3344;
    *((_QWORD *)&v1765 + 1) = &unk_1E77F3050;
    v1770 = &v1740;
    *(_QWORD *)&v1766 = v1585;
    *((_QWORD *)&v1766 + 1) = v1587;
    *(_QWORD *)&v1767 = v1582;
    *((_QWORD *)&v1767 + 1) = v1635;
    v1768 = v1609;
    v1769 = v396;
    objc_msgSend_objectsPassingTest_(v406, v407, (uint64_t)&v1764, v408, v409, v410);
    v411 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionSet_(objb, v412, (uint64_t)v411, v413, v414, v415);

    goto LABEL_57;
  }
LABEL_100:
  v1687 = 0u;
  v1688 = 0u;
  v1685 = 0u;
  v1686 = 0u;
  if (v1656)
    groupingStrategiesByIdentifierForTextStrokeClasses = v1656->_groupingStrategiesByIdentifierForTextStrokeClasses;
  else
    groupingStrategiesByIdentifierForTextStrokeClasses = 0;
  v646 = MEMORY[0x1E0C809B0];
  objc_msgSend_allKeys(groupingStrategiesByIdentifierForTextStrokeClasses, v354, v355, v356, v357, v358);
  v1550 = (id)objc_claimAutoreleasedReturnValue();
  v1552 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1550, v647, (uint64_t)&v1685, (uint64_t)v1749, 16, v648);
  if (v1552)
  {
    v1553 = *(_QWORD *)v1686;
LABEL_104:
    if (v1656)
    {
      v1583 = 0;
      while (1)
      {
        if (*(_QWORD *)v1686 != v1553)
          objc_enumerationMutation(v1550);
        v649 = *(void **)(*((_QWORD *)&v1685 + 1) + 8 * v1583);
        if ((v1605[2]() & 1) != 0)
          goto LABEL_193;
        v650 = v649;
        v651 = v1555;
        v1581 = v1620;
        v1579 = v1556;
        v652 = v1584;
        v1569 = v1621;
        v1577 = v1612;
        v1600 = v1589;
        v1632 = v1557;
        v1623 = v1558;
        v1573 = v1559;
        v1607 = v1562;
        v1610 = v1605;
        v1565 = v651;
        objc_msgSend_set(MEMORY[0x1E0C99E20], v653, v654, v655, v656, v657);
        v658 = (void *)objc_claimAutoreleasedReturnValue();
        v1728[0] = v646;
        v1728[1] = 3221225472;
        v1728[2] = sub_1BE6B3650;
        v1728[3] = &unk_1E77F3000;
        v659 = v652;
        v1729 = v659;
        v660 = v650;
        v1730 = v660;
        v1567 = v658;
        v1731 = v1567;
        objc_msgSend_enumerateObjectsUsingBlock_(v651, v661, (uint64_t)v1728, v662, v663, v664);
        objc_msgSend_set(MEMORY[0x1E0C99E20], v665, v666, v667, v668, v669);
        v670 = (void *)objc_claimAutoreleasedReturnValue();
        v1724[0] = v646;
        v1724[1] = 3221225472;
        v1724[2] = sub_1BE6B3714;
        v1724[3] = &unk_1E77F3000;
        v671 = v1569;
        v1725 = v671;
        v672 = v660;
        v1726 = v672;
        v673 = v670;
        v1727 = v673;
        objc_msgSend_enumerateObjectsUsingBlock_(v1581, v674, (uint64_t)v1724, v675, v676, v677);
        v1715 = v646;
        v1716 = 3221225472;
        v1717 = sub_1BE6B37D8;
        v1718 = &unk_1E77F30A0;
        v1594 = v659;
        v1719 = v1594;
        v1588 = v672;
        v1720 = v1588;
        v1586 = v1567;
        v1721 = v1586;
        v1563 = v671;
        v1722 = v1563;
        v1597 = v673;
        v1723 = v1597;
        objc_msgSend_enumerateObjectsUsingBlock_(v1579, v678, (uint64_t)&v1715, v679, v680, v681);
        objc_msgSend_strokeProvider(v1656, v682, v683, v684, v685, v686);
        v1575 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_count(v1586, v687, v688, v689, v690, v691)
          && !objc_msgSend_count(v1597, v692, v693, v694, v695, v696))
        {
          v923 = objc_msgSend_integerValue(v1588, v692, v693, v694, v695, v696);
          objc_msgSend_strokeGroupsOfClass_(v1577, v924, v923, v925, v926, v927);
          v928 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionSet_(v1632, v929, (uint64_t)v928, v930, v931, v932);
          goto LABEL_184;
        }
        objc_msgSend_allObjects(v1586, v692, v693, v694, v695, v696);
        v697 = (void *)objc_claimAutoreleasedReturnValue();
        v1713[0] = v646;
        v1713[1] = 3221225472;
        v1713[2] = sub_1BE6B38FC;
        v1713[3] = &unk_1E77F2B30;
        v1714 = v1575;
        objc_msgSend_sortedArrayUsingComparator_(v697, v698, (uint64_t)v1713, v699, v700, v701);
        v1571 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_strokesForIdentifiers_(v1656, v702, (uint64_t)v1571, v703, v704, v705);
        v1591 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v1656->_groupingStrategiesByIdentifierForTextStrokeClasses, v706, (uint64_t)v1588, v707, v708, v709);
        v710 = (void *)objc_claimAutoreleasedReturnValue();
        v1712 = 0u;
        v1711 = 0u;
        v1710 = 0u;
        v1709 = 0u;
        v1603 = v710;
        objc_msgSend_allKeys(v710, v711, v712, v713, v714, v715);
        v716 = (void *)objc_claimAutoreleasedReturnValue();
        v719 = objc_msgSend_countByEnumeratingWithState_objects_count_(v716, v717, (uint64_t)&v1709, (uint64_t)&v1760, 16, v718);
        if (v719)
        {
          v720 = *(_QWORD *)v1710;
LABEL_113:
          v721 = 0;
          while (1)
          {
            if (*(_QWORD *)v1710 != v720)
              objc_enumerationMutation(v716);
            v722 = *(_QWORD *)(*((_QWORD *)&v1709 + 1) + 8 * v721);
            if ((((uint64_t (*)(uint64_t (**)(void)))v1605[2])(v1610) & 1) != 0)
              break;
            objc_msgSend_objectForKey_(v1603, v723, v722, v724, v725, v726);
            v727 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v1607, v728, v722, v729, v730, v731);
            v732 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_substrokesByStrokeIdentifier(v1594, v733, v734, v735, v736, v737);
            v738 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_updatedGroupingResult_byAddingStrokes_removingStrokeIdentifiers_stableStrokeIdentifiers_allSubstrokesByStrokeIdentifier_withCancellationBlock_(v727, v739, (uint64_t)v732, (uint64_t)v1591, (uint64_t)v1597, (uint64_t)v1600, v738, v1610);
            v740 = (void *)objc_claimAutoreleasedReturnValue();

            if (v740)
              objc_msgSend_setObject_forKey_(v1607, v741, (uint64_t)v740, v722, v742, v743);

            if (v719 == ++v721)
            {
              v719 = objc_msgSend_countByEnumeratingWithState_objects_count_(v716, v744, (uint64_t)&v1709, (uint64_t)&v1760, 16, v745);
              if (v719)
                goto LABEL_113;
              break;
            }
          }
        }

        if ((unint64_t)objc_msgSend_count(v1603, v746, v747, v748, v749, v750) < 2)
        {
          objc_msgSend_allKeys(v1603, v751, v752, v753, v754, v755);
          v1561 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v1561, v908, v909, v910, v911, v912);
          v1627 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v1607, v913, (uint64_t)v1627, v914, v915, v916);
          v917 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_textStrokeGroups(v917, v918, v919, v920, v921, v922);
          v1615 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend_allKeys(v1603, v751, v752, v753, v754, v755);
          v1561 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dictionaryWithValuesForKeys_(v1607, v756, (uint64_t)v1561, v757, v758, v759);
          v1627 = (id)objc_claimAutoreleasedReturnValue();
          v1643 = v1600;
          objc = v1588;
          v1651 = v1610;
          objc_msgSend_set(MEMORY[0x1E0C99E20], v760, v761, v762, v763, v764);
          v1615 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v765, v766, v767, v768, v769);
          v770 = (void *)objc_claimAutoreleasedReturnValue();
          v1743 = 0u;
          v1742 = 0u;
          v1741 = 0u;
          v1740 = 0u;
          objc_msgSend_allKeys(v1627, v771, v772, v773, v774, v775);
          v776 = (void *)objc_claimAutoreleasedReturnValue();
          v783 = objc_msgSend_countByEnumeratingWithState_objects_count_(v776, v777, (uint64_t)&v1740, (uint64_t)buf, 16, v778);
          if (v783)
          {
            v784 = *(_QWORD *)v1741;
            do
            {
              for (ii = 0; ii != v783; ++ii)
              {
                if (*(_QWORD *)v1741 != v784)
                  objc_enumerationMutation(v776);
                v786 = *(void **)(*((_QWORD *)&v1740 + 1) + 8 * ii);
                objc_msgSend_substringToIndex_(v786, v779, 1, v780, v781, v782);
                v787 = (void *)objc_claimAutoreleasedReturnValue();
                v793 = objc_msgSend_integerValue(v787, v788, v789, v790, v791, v792);
                LODWORD(v793) = v793 == objc_msgSend_integerValue(objc, v794, v795, v796, v797, v798);

                if ((_DWORD)v793)
                {
                  objc_msgSend_objectForKey_(v1627, v779, (uint64_t)v786, v780, v781, v782);
                  v799 = (void *)objc_claimAutoreleasedReturnValue();
                  v805 = (void *)objc_msgSend_copy(v799, v800, v801, v802, v803, v804);

                  objc_msgSend_setObject_forKey_(v770, v806, (uint64_t)v805, (uint64_t)v786, v807, v808);
                }
              }
              v783 = objc_msgSend_countByEnumeratingWithState_objects_count_(v776, v779, (uint64_t)&v1740, (uint64_t)buf, 16, v782);
            }
            while (v783);
          }
          while (1)
          {

            if ((((uint64_t (*)(uint64_t (**)(void)))v1605[2])(v1651) & 1) != 0)
              break;
            v1739 = 0u;
            v1738 = 0u;
            v1737 = 0u;
            *(_OWORD *)__p = 0u;
            objc_msgSend_allKeys(v770, v809, v810, v811, v812, v813);
            v814 = (void *)objc_claimAutoreleasedReturnValue();
            v821 = objc_msgSend_countByEnumeratingWithState_objects_count_(v814, v815, (uint64_t)__p, (uint64_t)&v1771, 16, v816);
            if (!v821)
            {

              break;
            }
            v776 = 0;
            v822 = *(_QWORD *)v1737;
            v823 = -1.79769313e308;
            do
            {
              for (jj = 0; jj != v821; ++jj)
              {
                if (*(_QWORD *)v1737 != v822)
                  objc_enumerationMutation(v814);
                objc_msgSend_objectForKey_(v770, v817, *((_QWORD *)__p[1] + jj), v818, v819, v820);
                v825 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_textStrokeGroups(v825, v826, v827, v828, v829, v830);
                v831 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_allObjects(v831, v832, v833, v834, v835, v836);
                v837 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_sortedArrayUsingComparator_(v837, v838, (uint64_t)&unk_1E77EF548, v839, v840, v841);
                v842 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_firstObject(v842, v843, v844, v845, v846, v847);
                v848 = (void *)objc_claimAutoreleasedReturnValue();
                v854 = v848;
                if (v848)
                {
                  objc_msgSend_groupingConfidence(v848, v849, v850, v851, v852, v853);
                  if (v860 > v823)
                  {
                    objc_msgSend_groupingConfidence(v854, v855, v856, v857, v858, v859);
                    v823 = v861;
                    v862 = v854;

                    v776 = v862;
                  }
                }

              }
              v821 = objc_msgSend_countByEnumeratingWithState_objects_count_(v814, v817, (uint64_t)__p, (uint64_t)&v1771, 16, v820);
            }
            while (v821);

            if (!v776)
              break;
            objc_msgSend_addObject_(v1615, v863, (uint64_t)v776, v864, v865, v866);
            v1735 = 0u;
            v1734 = 0u;
            v1733 = 0u;
            v1732 = 0u;
            objc_msgSend_allKeys(v770, v867, v868, v869, v870, v871);
            v872 = (void *)objc_claimAutoreleasedReturnValue();
            v875 = objc_msgSend_countByEnumeratingWithState_objects_count_(v872, v873, (uint64_t)&v1732, (uint64_t)&v1764, 16, v874);
            if (v875)
            {
              v876 = *(_QWORD *)v1733;
              v1637 = v872;
              do
              {
                for (kk = 0; kk != v875; ++kk)
                {
                  if (*(_QWORD *)v1733 != v876)
                    objc_enumerationMutation(v1637);
                  v878 = *(_QWORD *)(*((_QWORD *)&v1732 + 1) + 8 * kk);
                  v879 = v1656->_groupingStrategiesByIdentifierForTextStrokeClasses;
                  objc_msgSend_objectForKeyedSubscript_(v879, v880, (uint64_t)objc, v881, v882, v883);
                  v884 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKey_(v884, v885, v878, v886, v887, v888);
                  v889 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_objectForKey_(v770, v890, v878, v891, v892, v893);
                  v894 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_strokeIdentifiers(v776, v895, v896, v897, v898, v899);
                  v900 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_updatedGroupingResult_byAddingStrokes_removingStrokeIdentifiers_stableStrokeIdentifiers_allSubstrokesByStrokeIdentifier_withCancellationBlock_(v889, v901, (uint64_t)v894, 0, (uint64_t)v900, (uint64_t)v1643, 0, v1651);
                  v902 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v902)
                    objc_msgSend_setObject_forKey_(v770, v903, (uint64_t)v902, v878, v904, v905);

                }
                v872 = v1637;
                v875 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1637, v906, (uint64_t)&v1732, (uint64_t)&v1764, 16, v907);
              }
              while (v875);
            }

          }
          if (((unsigned int (*)(uint64_t (**)(void)))v1605[2])(v1651))
          {

            v1615 = 0;
          }

        }
        v938 = objc_msgSend_integerValue(v1588, v933, v934, v935, v936, v937);
        objc_msgSend_strokeGroupsOfClass_(v1577, v939, v938, v940, v941, v942);
        v943 = (void *)objc_claimAutoreleasedReturnValue();
        v1638 = (id)objc_msgSend_mutableCopy(v943, v944, v945, v946, v947, v948);

        v1708 = 0u;
        v1707 = 0u;
        v1706 = 0u;
        v1705 = 0u;
        v1616 = v1615;
        v1644 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1616, v949, (uint64_t)&v1705, (uint64_t)v1755, 16, v950);
        if (!v1644)
          goto LABEL_183;
        v1628 = *(id *)v1706;
        do
        {
          for (mm = 0; mm != v1644; ++mm)
          {
            if (*(id *)v1706 != v1628)
              objc_enumerationMutation(v1616);
            v951 = *(void **)(*((_QWORD *)&v1705 + 1) + 8 * mm);
            v1701 = 0u;
            v1702 = 0u;
            v1703 = 0u;
            v1704 = 0u;
            objd = v1638;
            v959 = objc_msgSend_countByEnumeratingWithState_objects_count_(objd, v952, (uint64_t)&v1701, (uint64_t)v1751, 16, v953);
            if (!v959)
            {
LABEL_177:

              goto LABEL_180;
            }
            v960 = *(_QWORD *)v1702;
LABEL_168:
            v961 = 0;
            while (1)
            {
              if (*(_QWORD *)v1702 != v960)
                objc_enumerationMutation(objd);
              v962 = *(void **)(*((_QWORD *)&v1701 + 1) + 8 * v961);
              objc_msgSend_strategyIdentifier(v951, v954, v955, v956, v957, v958);
              v963 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strategyIdentifier(v962, v964, v965, v966, v967, v968);
              v969 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend_isEqualToString_(v963, v970, (uint64_t)v969, v971, v972, v973) & 1) == 0)
              {

                goto LABEL_169;
              }
              objc_msgSend_strokeIdentifiers(v951, v974, v975, v976, v977, v978);
              v979 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIdentifiers(v962, v980, v981, v982, v983, v984);
              v985 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToSet = objc_msgSend_isEqualToSet_(v979, v986, (uint64_t)v985, v987, v988, v989);

              if ((isEqualToSet & 1) != 0)
                break;
LABEL_169:
              if (v959 == ++v961)
              {
                v959 = objc_msgSend_countByEnumeratingWithState_objects_count_(objd, v954, (uint64_t)&v1701, (uint64_t)v1751, 16, v958);
                if (v959)
                  goto LABEL_168;
                goto LABEL_177;
              }
            }
            v991 = v962;

            if (v991)
            {
              objc_msgSend_addObject_(v1632, v992, (uint64_t)v991, v993, v994, v995);
              objc_msgSend_removeObject_(objd, v996, (uint64_t)v991, v997, v998, v999);
              goto LABEL_181;
            }
LABEL_180:
            objc_msgSend_addObject_(v1632, v992, (uint64_t)v951, v993, v994, v995);
            v991 = 0;
            objc_msgSend_addObject_(v1623, v1000, (uint64_t)v951, v1001, v1002, v1003);
LABEL_181:

          }
          v1644 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1616, v1004, (uint64_t)&v1705, (uint64_t)v1755, 16, v1005);
        }
        while (v1644);
LABEL_183:

        objc_msgSend_unionSet_(v1573, v1006, (uint64_t)v1638, v1007, v1008, v1009);
        v928 = v1714;
LABEL_184:

        ++v1583;
        v646 = MEMORY[0x1E0C809B0];
        if (v1583 == v1552)
        {
LABEL_185:
          v1552 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1550, v1010, (uint64_t)&v1685, (uint64_t)v1749, 16, v1011);
          if (!v1552)
            goto LABEL_193;
          goto LABEL_104;
        }
      }
    }
    v1012 = 0;
    while (1)
    {
      if (*(_QWORD *)v1686 != v1553)
        objc_enumerationMutation(v1550);
      v1013 = *(void **)(*((_QWORD *)&v1685 + 1) + 8 * v1012);
      if ((v1605[2]() & 1) != 0)
        break;
      v1645 = v1013;
      v1653 = v1555;
      objf = v1620;
      v1014 = v1556;
      v1015 = v1584;
      v1016 = v1621;
      v1017 = v1612;
      v1018 = v1589;
      v1019 = v1557;
      v1020 = v1558;
      v1021 = v1559;
      v1022 = v1562;

      ++v1012;
      v646 = MEMORY[0x1E0C809B0];
      if (v1552 == v1012)
        goto LABEL_185;
    }
  }
LABEL_193:

  v1598 = v1557;
  v1611 = v1558;
  v1608 = v1559;
  obje = v1562;
  v1601 = v1584;
  v1604 = v1605;
  if (v1656)
  {
    objc_msgSend_sortedGroupsBySizeDescending_(CHStrokeGroupingManager, v1023, (uint64_t)v1598, v1024, v1025, v1026);
    v1633 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set(MEMORY[0x1E0C99E20], v1027, v1028, v1029, v1030, v1031);
    v1624 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set(MEMORY[0x1E0C99E20], v1032, v1033, v1034, v1035, v1036);
    v1654 = (void *)objc_claimAutoreleasedReturnValue();
    if ((((uint64_t (*)(uint64_t (**)(void)))v1605[2])(v1604) & 1) == 0)
    {
      v1641 = 1;
      for (nn = 0; ; ++nn)
      {
        v1278 = objc_msgSend_count(v1633, v1037, v1038, v1039, v1040, v1041);
        v1038 = nn;
        if (nn >= v1278)
          break;
        objc_msgSend_objectAtIndexedSubscript_(v1633, v1037, nn, v1039, v1040, v1041);
        v1279 = (void *)objc_claimAutoreleasedReturnValue();
        v1280 = v1656->_groupingStrategiesByIdentifierForTextStrokeClasses;
        v1281 = (void *)MEMORY[0x1E0CB37E8];
        v1287 = objc_msgSend_classification(v1279, v1282, v1283, v1284, v1285, v1286);
        objc_msgSend_numberWithInteger_(v1281, v1288, v1287, v1289, v1290, v1291);
        v1292 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v1280, v1293, (uint64_t)v1292, v1294, v1295, v1296);
        v1297 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strategyIdentifier(v1279, v1298, v1299, v1300, v1301, v1302);
        v1303 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v1297, v1304, (uint64_t)v1303, v1305, v1306, v1307);
        v1308 = (void *)objc_claimAutoreleasedReturnValue();

        v1309 = objc_opt_class();
        v1319 = v1641;
        if (objc_msgSend_isMemberOfClass_(v1308, v1310, v1309, v1311, v1312, v1313))
        {
          while (v1319 < objc_msgSend_count(v1633, v1314, v1315, v1316, v1317, v1318))
          {
            objc_msgSend_objectAtIndexedSubscript_(v1633, v1320, v1319, v1321, v1322, v1323);
            v1324 = (void *)objc_claimAutoreleasedReturnValue();
            v1325 = v1656->_groupingStrategiesByIdentifierForTextStrokeClasses;
            v1326 = (void *)MEMORY[0x1E0CB37E8];
            v1332 = objc_msgSend_classification(v1324, v1327, v1328, v1329, v1330, v1331);
            objc_msgSend_numberWithInteger_(v1326, v1333, v1332, v1334, v1335, v1336);
            v1337 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v1325, v1338, (uint64_t)v1337, v1339, v1340, v1341);
            v1342 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strategyIdentifier(v1324, v1343, v1344, v1345, v1346, v1347);
            v1348 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v1342, v1349, (uint64_t)v1348, v1350, v1351, v1352);
            v1353 = (void *)objc_claimAutoreleasedReturnValue();

            v1354 = objc_opt_class();
            isMemberOfClass = objc_msgSend_isMemberOfClass_(v1353, v1355, v1354, v1356, v1357, v1358);
            if (v1308 == v1353)
              v1364 = 0;
            else
              v1364 = isMemberOfClass;
            if ((v1364 & 1) != 0
              && (objc_msgSend_containsObject_(v1654, v1360, (uint64_t)v1279, v1361, v1362, v1363) & 1) == 0
              && (objc_msgSend_containsObject_(v1654, v1365, (uint64_t)v1324, v1366, v1367, v1368) & 1) == 0)
            {
              objc_msgSend_relativeOverlapOfGroup_withGroup_(v1308, v1369, (uint64_t)v1279, (uint64_t)v1324, v1370, v1371);
              if (v1377 > 0.4)
              {
                objc_msgSend_strategyIdentifier(v1279, v1372, v1373, v1374, v1375, v1376);
                v1378 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(obje, v1379, (uint64_t)v1378, v1380, v1381, v1382);
                v1383 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_substrokesByStrokeIdentifier(v1601, v1384, v1385, v1386, v1387, v1388);
                v1389 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_regroupedStrokeGroup_fromResult_withAdversarialGroup_allSubstrokesByStrokeIdentifier_cancellationBlock_(v1308, v1390, (uint64_t)v1279, (uint64_t)v1383, (uint64_t)v1324, (uint64_t)v1389, v1604);
                v1391 = (void *)objc_claimAutoreleasedReturnValue();

                if ((unint64_t)objc_msgSend_count(v1391, v1392, v1393, v1394, v1395, v1396) >= 2)
                {
                  objc_msgSend_unionSet_(v1624, v1397, (uint64_t)v1391, v1399, v1400, v1401);
                  objc_msgSend_addObject_(v1654, v1402, (uint64_t)v1279, v1403, v1404, v1405);
                  objc_msgSend_sortedGroupsBySizeDescending_(CHStrokeGroupingManager, v1406, (uint64_t)v1391, v1407, v1408, v1409);
                  v1410 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_addObjectsFromArray_(v1633, v1411, (uint64_t)v1410, v1412, v1413, v1414);

                }
                objc_msgSend_strategyIdentifier(v1324, v1397, v1398, v1399, v1400, v1401);
                v1415 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(obje, v1416, (uint64_t)v1415, v1417, v1418, v1419);
                v1420 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_substrokesByStrokeIdentifier(v1601, v1421, v1422, v1423, v1424, v1425);
                v1426 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_regroupedStrokeGroup_fromResult_withAdversarialGroup_allSubstrokesByStrokeIdentifier_cancellationBlock_(v1353, v1427, (uint64_t)v1324, (uint64_t)v1420, (uint64_t)v1279, (uint64_t)v1426, v1604);
                v1428 = (void *)objc_claimAutoreleasedReturnValue();

                if ((unint64_t)objc_msgSend_count(v1428, v1429, v1430, v1431, v1432, v1433) >= 2)
                {
                  objc_msgSend_unionSet_(v1624, v1434, (uint64_t)v1428, v1435, v1436, v1437);
                  objc_msgSend_addObject_(v1654, v1438, (uint64_t)v1324, v1439, v1440, v1441);
                  objc_msgSend_sortedGroupsBySizeDescending_(CHStrokeGroupingManager, v1442, (uint64_t)v1428, v1443, v1444, v1445);
                  v1446 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_addObjectsFromArray_(v1633, v1447, (uint64_t)v1446, v1448, v1449, v1450);

                }
              }
            }

            ++v1319;
          }
        }

        ++v1641;
      }
    }
    v1617 = (id)objc_msgSend_mutableCopy(v1654, v1037, v1038, v1039, v1040, v1041);
    objc_msgSend_minusSet_(v1617, v1042, (uint64_t)v1624, v1043, v1044, v1045);
    objc_msgSend_minusSet_(v1617, v1046, (uint64_t)v1611, v1047, v1048, v1049);
    objc_msgSend_minusSet_(v1624, v1050, (uint64_t)v1654, v1051, v1052, v1053);
    v1774 = 0u;
    v1773 = 0u;
    v1772 = 0u;
    v1771 = 0u;
    objc_msgSend_allKeys(obje, v1054, v1055, v1056, v1057, v1058);
    v1059 = (void *)objc_claimAutoreleasedReturnValue();
    v1629 = v1059;
    v1062 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1059, v1060, (uint64_t)&v1771, (uint64_t)buf, 16, v1061);
    if (v1062)
    {
      v1639 = *(id *)v1772;
      do
      {
        v1646 = v1062;
        for (i1 = 0; i1 != v1646; ++i1)
        {
          if (*(id *)v1772 != v1639)
            objc_enumerationMutation(v1629);
          v1068 = *(_QWORD *)(*((_QWORD *)&v1771 + 1) + 8 * i1);
          objc_msgSend_objectForKeyedSubscript_(obje, v1063, v1068, v1064, v1065, v1066);
          v1069 = (void *)objc_claimAutoreleasedReturnValue();
          v1070 = objc_opt_class();
          if ((objc_msgSend_isMemberOfClass_(v1069, v1071, v1070, v1072, v1073, v1074) & 1) != 0)
          {
            objc_msgSend_strokeGroups(v1069, v1075, v1076, v1077, v1078, v1079);
            v1080 = (void *)objc_claimAutoreleasedReturnValue();
            v1085 = objc_msgSend_intersectsSet_(v1654, v1081, (uint64_t)v1080, v1082, v1083, v1084);

            if (v1085)
            {
              objc_msgSend_strokeGroups(v1069, v1086, v1087, v1088, v1089, v1090);
              v1091 = (void *)objc_claimAutoreleasedReturnValue();
              v1097 = (void *)objc_msgSend_mutableCopy(v1091, v1092, v1093, v1094, v1095, v1096);

              objc_msgSend_createdStrokeGroups(v1069, v1098, v1099, v1100, v1101, v1102);
              v1103 = (void *)objc_claimAutoreleasedReturnValue();
              v1109 = (void *)objc_msgSend_mutableCopy(v1103, v1104, v1105, v1106, v1107, v1108);

              objc_msgSend_deletedStrokeGroups(v1069, v1110, v1111, v1112, v1113, v1114);
              v1115 = (void *)objc_claimAutoreleasedReturnValue();
              v1121 = (void *)objc_msgSend_mutableCopy(v1115, v1116, v1117, v1118, v1119, v1120);

              v1122 = MEMORY[0x1E0C809B0];
              *(_QWORD *)&v1764 = MEMORY[0x1E0C809B0];
              *((_QWORD *)&v1764 + 1) = 3221225472;
              *(_QWORD *)&v1765 = sub_1BE6B39A8;
              *((_QWORD *)&v1765 + 1) = &unk_1E77F30C8;
              *(_QWORD *)&v1766 = v1068;
              objc_msgSend_objectsPassingTest_(v1624, v1123, (uint64_t)&v1764, v1124, v1125, v1126);
              v1127 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&v1760 = v1122;
              *((_QWORD *)&v1760 + 1) = 3221225472;
              *(_QWORD *)&v1761 = sub_1BE6B39F8;
              *((_QWORD *)&v1761 + 1) = &unk_1E77F30C8;
              *(_QWORD *)&v1762 = v1068;
              objc_msgSend_objectsPassingTest_(v1617, v1128, (uint64_t)&v1760, v1129, v1130, v1131);
              v1132 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_minusSet_(v1097, v1133, (uint64_t)v1654, v1134, v1135, v1136);
              objc_msgSend_unionSet_(v1097, v1137, (uint64_t)v1127, v1138, v1139, v1140);
              objc_msgSend_minusSet_(v1109, v1141, (uint64_t)v1654, v1142, v1143, v1144);
              objc_msgSend_unionSet_(v1109, v1145, (uint64_t)v1127, v1146, v1147, v1148);
              objc_msgSend_unionSet_(v1121, v1149, (uint64_t)v1132, v1150, v1151, v1152);
              v1153 = [CHBottomUpStrokeGroupingResult alloc];
              objc_msgSend_substrokePlacementsByStrokeIdentifier(v1069, v1154, v1155, v1156, v1157, v1158);
              v1159 = (void *)objc_claimAutoreleasedReturnValue();
              v1161 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_substrokePlacementsByStrokeIdentifier_(v1153, v1160, (uint64_t)v1097, (uint64_t)v1109, (uint64_t)v1121, (uint64_t)v1159);

              objc_msgSend_setObject_forKeyedSubscript_(obje, v1162, (uint64_t)v1161, v1068, v1163, v1164);
            }
          }

        }
        v1059 = v1629;
        v1062 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1629, v1063, (uint64_t)&v1771, (uint64_t)buf, 16, v1066);
      }
      while (v1062);
    }

    objc_msgSend_minusSet_(v1598, v1165, (uint64_t)v1654, v1166, v1167, v1168);
    objc_msgSend_unionSet_(v1598, v1169, (uint64_t)v1624, v1170, v1171, v1172);
    objc_msgSend_minusSet_(v1611, v1173, (uint64_t)v1654, v1174, v1175, v1176);
    objc_msgSend_unionSet_(v1611, v1177, (uint64_t)v1624, v1178, v1179, v1180);
    objc_msgSend_unionSet_(v1608, v1181, (uint64_t)v1617, v1182, v1183, v1184);

  }
  if ((((uint64_t (*)(uint64_t (**)(void)))v1605[2])(v1604) & 1) == 0)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v1185, v1186, v1187, v1188, v1189);
    v1647 = (void *)objc_claimAutoreleasedReturnValue();
    v1683 = 0u;
    v1684 = 0u;
    v1681 = 0u;
    v1682 = 0u;
    if (v1656)
      objc_msgSend_allValues(v1656->_groupingStrategiesByIdentifierForTextStrokeClasses, v1190, v1191, v1192, v1193, v1194);
    else
      objc_msgSend_allValues(0, v1190, v1191, v1192, v1193, v1194);
    v1592 = (id)objc_claimAutoreleasedReturnValue();
    v1595 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1592, v1195, (uint64_t)&v1681, (uint64_t)v1748, 16, v1196);
    if (v1595)
    {
      v1657 = 0;
      v1630 = 0;
      v1634 = 0;
      v1618 = *(id *)v1682;
      do
      {
        for (i2 = 0; i2 != v1595; ++i2)
        {
          if (*(id *)v1682 != v1618)
            objc_enumerationMutation(v1592);
          v1202 = *(void **)(*((_QWORD *)&v1681 + 1) + 8 * i2);
          v1677 = 0u;
          v1678 = 0u;
          v1679 = 0u;
          v1680 = 0u;
          objc_msgSend_allValues(v1202, v1197, v1198, v1199, v1200, v1201);
          v1203 = (void *)objc_claimAutoreleasedReturnValue();
          v1206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1203, v1204, (uint64_t)&v1677, (uint64_t)v1747, 16, v1205);
          if (v1206)
          {
            v1207 = *(_QWORD *)v1678;
            v1640 = v1203;
            do
            {
              v1208 = 0;
              v1655 = v1206;
              do
              {
                if (*(_QWORD *)v1678 != v1207)
                  objc_enumerationMutation(v1203);
                v1209 = *(void **)(*((_QWORD *)&v1677 + 1) + 8 * v1208);
                v1210 = objc_opt_class();
                if (objc_msgSend_isMemberOfClass_(v1209, v1211, v1210, v1212, v1213, v1214))
                {
                  objc_msgSend_addObject_(v1647, v1215, (uint64_t)v1209, v1216, v1217, v1218);
                  objc_msgSend_strategyIdentifier(v1209, v1219, v1220, v1221, v1222, v1223);
                  v1224 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(obje, v1225, (uint64_t)v1224, v1226, v1227, v1228);
                  v1229 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_strokeGroups(v1229, v1230, v1231, v1232, v1233, v1234);
                  v1235 = (void *)objc_claimAutoreleasedReturnValue();
                  v1241 = objc_msgSend_count(v1235, v1236, v1237, v1238, v1239, v1240) == 0;

                  if (!v1241)
                  {
                    v1675 = 0u;
                    v1676 = 0u;
                    v1673 = 0u;
                    v1674 = 0u;
                    objc_msgSend_strategyIdentifier(v1209, v1215, v1242, v1243, v1244, v1218);
                    v1245 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(obje, v1246, (uint64_t)v1245, v1247, v1248, v1249);
                    v1250 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_strokeGroups(v1250, v1251, v1252, v1253, v1254, v1255);
                    v1256 = (void *)objc_claimAutoreleasedReturnValue();

                    v1259 = 0;
                    v1265 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1256, v1257, (uint64_t)&v1673, (uint64_t)v1746, 16, v1258);
                    if (v1265)
                    {
                      v1266 = *(_QWORD *)v1674;
                      do
                      {
                        for (i3 = 0; i3 != v1265; ++i3)
                        {
                          if (*(_QWORD *)v1674 != v1266)
                            objc_enumerationMutation(v1256);
                          objc_msgSend_strokeIdentifiers(*(void **)(*((_QWORD *)&v1673 + 1) + 8 * i3), v1260, v1261, v1262, v1263, v1264);
                          v1268 = (void *)objc_claimAutoreleasedReturnValue();
                          v1274 = objc_msgSend_count(v1268, v1269, v1270, v1271, v1272, v1273);

                          v1259 += v1274;
                        }
                        v1265 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1256, v1260, (uint64_t)&v1673, (uint64_t)v1746, 16, v1264);
                      }
                      while (v1265);
                    }

                    ++v1657;
                    if ((uint64_t)v1259 > (uint64_t)v1634)
                    {
                      v1275 = v1209;

                      v1630 = v1275;
                      v1634 = v1259;
                    }
                  }
                  v1203 = v1640;
                  v1206 = v1655;
                }
                ++v1208;
              }
              while (v1208 != v1206);
              v1206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1203, v1215, (uint64_t)&v1677, (uint64_t)v1747, 16, v1218);
            }
            while (v1206);
          }

        }
        v1595 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1592, v1197, (uint64_t)&v1681, (uint64_t)v1748, 16, v1201);
      }
      while (v1595);

      if (v1630 && v1657 >= 2)
        objc_msgSend_mergeGroupsPostProcessing_createdGroups_deletedGroups_availableGroupingStrategies_allowOppositeOrientations_(v1630, v1276, (uint64_t)v1598, (uint64_t)v1611, (uint64_t)v1608, (uint64_t)v1647, 1);
      v1277 = v1630;
    }
    else
    {

      v1277 = 0;
    }

  }
  if ((((uint64_t (*)(uint64_t (**)(void)))v1605[2])(v1604) & 1) != 0)
  {
    v1456 = 0;
  }
  else
  {
    objc_msgSend_removeAllObjects(v1611, v1451, v1452, v1453, v1454, v1455);
    objc_msgSend_removeAllObjects(v1608, v1457, v1458, v1459, v1460, v1461);
    v1671 = 0u;
    v1672 = 0u;
    v1669 = 0u;
    v1670 = 0u;
    v1462 = v1598;
    v1470 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1462, v1463, (uint64_t)&v1669, (uint64_t)v1745, 16, v1464);
    if (v1470)
    {
      v1471 = *(_QWORD *)v1670;
      do
      {
        for (i4 = 0; i4 != v1470; ++i4)
        {
          if (*(_QWORD *)v1670 != v1471)
            objc_enumerationMutation(v1462);
          v1473 = *(_QWORD *)(*((_QWORD *)&v1669 + 1) + 8 * i4);
          objc_msgSend_strokeGroups(v1612, v1465, v1466, v1467, v1468, v1469);
          v1474 = (void *)objc_claimAutoreleasedReturnValue();
          v1479 = objc_msgSend_containsObject_(v1474, v1475, v1473, v1476, v1477, v1478);

          if ((v1479 & 1) == 0)
            objc_msgSend_addObject_(v1611, v1465, v1473, v1467, v1468, v1469);
        }
        v1470 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1462, v1465, (uint64_t)&v1669, (uint64_t)v1745, 16, v1469);
      }
      while (v1470);
    }

    v1667 = 0u;
    v1668 = 0u;
    v1665 = 0u;
    v1666 = 0u;
    objc_msgSend_textStrokeGroups(v1612, v1480, v1481, v1482, v1483, v1484);
    v1485 = (void *)objc_claimAutoreleasedReturnValue();
    v1492 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1485, v1486, (uint64_t)&v1665, (uint64_t)v1744, 16, v1487);
    if (v1492)
    {
      v1493 = *(_QWORD *)v1666;
      do
      {
        for (i5 = 0; i5 != v1492; ++i5)
        {
          if (*(_QWORD *)v1666 != v1493)
            objc_enumerationMutation(v1485);
          v1495 = *(_QWORD *)(*((_QWORD *)&v1665 + 1) + 8 * i5);
          if ((objc_msgSend_containsObject_(v1462, v1488, v1495, v1489, v1490, v1491) & 1) == 0)
            objc_msgSend_addObject_(v1608, v1488, v1495, v1489, v1490, v1491);
        }
        v1492 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1485, v1488, (uint64_t)&v1665, (uint64_t)v1744, 16, v1491);
      }
      while (v1492);
    }

    objc_msgSend_setByAddingObjectsFromSet_(v1462, v1496, (uint64_t)v1539, v1497, v1498, v1499);
    v1500 = (void *)objc_claimAutoreleasedReturnValue();
    v1506 = (void *)objc_msgSend_mutableCopy(v1500, v1501, v1502, v1503, v1504, v1505);

    objc_msgSend_setByAddingObjectsFromSet_(v1611, v1507, (uint64_t)v1540, v1508, v1509, v1510);
    v1511 = (void *)objc_claimAutoreleasedReturnValue();
    v1517 = (void *)objc_msgSend_mutableCopy(v1511, v1512, v1513, v1514, v1515, v1516);

    objc_msgSend_setByAddingObjectsFromSet_(v1608, v1518, (uint64_t)v1541, v1519, v1520, v1521);
    v1522 = (void *)objc_claimAutoreleasedReturnValue();
    v1528 = (void *)objc_msgSend_mutableCopy(v1522, v1523, v1524, v1525, v1526, v1527);

    v1529 = [CHMergedStrokeGroupingResults alloc];
    v1456 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_groupingResultsByStrategyIdentifier_(v1529, v1530, (uint64_t)v1506, (uint64_t)v1517, (uint64_t)v1528, (uint64_t)obje);

  }
  return v1456;
}

- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8
{
  double dy;
  double dx;
  NSDictionary *groupingStrategiesByIdentifierForTextStrokeClasses;
  NSDictionary *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
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
  void *v43;
  const char *v44;
  CHDrawing *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
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
  void *v81;
  id v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i;
  void *v92;
  void *v93;
  CHDrawing *v94;
  CHDrawing *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t j;
  void *v120;
  void *v121;
  CHDrawing *v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
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
  const char *v139;
  uint64_t v140;
  void *v142;
  void *v143;
  id v144;
  double *v145;
  id v148;
  id obj;
  CHDrawing *v150;
  CHDrawing *v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t (*v155)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t, double, double);
  void *v156;
  CHDrawing *v157;
  CHDrawing *v158;
  uint64_t v159;
  uint64_t v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  _QWORD v165[4];
  id v166;
  _BYTE v167[128];
  uint64_t v168;

  dy = a4.dy;
  dx = a4.dx;
  v168 = *MEMORY[0x1E0C80C00];
  v148 = a3;
  v145 = a7;
  if (self)
    groupingStrategiesByIdentifierForTextStrokeClasses = self->_groupingStrategiesByIdentifierForTextStrokeClasses;
  else
    groupingStrategiesByIdentifierForTextStrokeClasses = 0;
  v14 = groupingStrategiesByIdentifierForTextStrokeClasses;
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v21 = objc_msgSend_classification(v148, v16, v17, v18, v19, v20);
  objc_msgSend_numberWithInteger_(v15, v22, v21, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v27, (uint64_t)v26, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v148;
  objc_msgSend_strategyIdentifier(v148, v33, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v31, v39, (uint64_t)v38, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend_recognizableDrawingForStrokeGroup_translationVector_originalDrawing_orderedStrokesIDs_rescalingFactor_replacementStrokeGroup_(v43, v44, (uint64_t)v148, (uint64_t)a5, (uint64_t)a6, (uint64_t)v145, a8, dx, dy);
    v45 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v144 = v148;
    if (self)
    {
      v151 = objc_alloc_init(CHDrawing);
      if (a5)
        v150 = objc_alloc_init(CHDrawing);
      else
        v150 = 0;
      objc_msgSend_bounds(v144, v46, v47, v48, v49, v50);
      v52 = v51;
      v54 = v53;
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v55, v56, v57, v58, v59);
      v152 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeProvider(self, v60, v61, v62, v63, v64);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeIdentifiers(v144, v65, v66, v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allObjects(v70, v71, v72, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokesForIdentifiers_(self, v77, (uint64_t)v76, v78, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      v165[0] = MEMORY[0x1E0C809B0];
      v165[1] = 3221225472;
      v165[2] = sub_1BE6B41C0;
      v165[3] = &unk_1E77F30F0;
      v82 = v142;
      v166 = v82;
      objc_msgSend_sortedArrayUsingComparator_(v81, v83, (uint64_t)v165, v84, v85, v86);
      v143 = v82;
      v163 = 0u;
      v164 = 0u;
      v161 = 0u;
      v162 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v87, (uint64_t)&v161, (uint64_t)v167, 16, v88);
      if (v89)
      {
        v90 = *(_QWORD *)v162;
        if (v150)
        {
          do
          {
            for (i = 0; i != v89; ++i)
            {
              if (*(_QWORD *)v162 != v90)
                objc_enumerationMutation(obj);
              v92 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * i);
              v93 = (void *)objc_opt_class();
              v153 = MEMORY[0x1E0C809B0];
              v154 = 3221225472;
              v155 = sub_1BE6B4268;
              v156 = &unk_1E77F3118;
              v94 = v150;
              v157 = v94;
              v159 = v52;
              v160 = v54;
              v95 = v151;
              v158 = v95;
              objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v93, v96, (uint64_t)v92, 0, 1, (uint64_t)&v153);
              objc_msgSend_endStroke(v95, v97, v98, v99, v100, v101);
              objc_msgSend_endStroke(v94, v102, v103, v104, v105, v106);
              objc_msgSend_encodedStrokeIdentifier(v92, v107, v108, v109, v110, v111);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v152, v113, (uint64_t)v112, v114, v115, v116);

            }
            v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v117, (uint64_t)&v161, (uint64_t)v167, 16, v118);
          }
          while (v89);
        }
        else
        {
          do
          {
            for (j = 0; j != v89; ++j)
            {
              if (*(_QWORD *)v162 != v90)
                objc_enumerationMutation(obj);
              v120 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * j);
              v121 = (void *)objc_opt_class();
              v153 = MEMORY[0x1E0C809B0];
              v154 = 3221225472;
              v155 = sub_1BE6B4268;
              v156 = &unk_1E77F3118;
              v157 = 0;
              v159 = v52;
              v160 = v54;
              v122 = v151;
              v158 = v122;
              objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v121, v123, (uint64_t)v120, 0, 1, (uint64_t)&v153);
              objc_msgSend_endStroke(v122, v124, v125, v126, v127, v128);
              objc_msgSend_encodedStrokeIdentifier(v120, v129, v130, v131, v132, v133);
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v152, v135, (uint64_t)v134, v136, v137, v138);

            }
            v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v139, (uint64_t)&v161, (uint64_t)v167, 16, v140);
          }
          while (v89);
        }
      }

      if (a5)
        *a5 = objc_retainAutorelease(v150);
      if (a6)
        *a6 = objc_retainAutorelease(v152);
      v45 = v151;

    }
    else
    {
      v45 = 0;
    }

    if (v145)
      *v145 = 1.0;
    v32 = v148;
  }

  return v45;
}

- (id)strokesForIdentifiers:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v55;
  id obj;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5, v6, v7, v8);
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v55;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v58, (uint64_t)v66, 16, v10);
  if (v16)
  {
    v17 = *(_QWORD *)v59;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v59 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v18);
        objc_msgSend_strokeProvider(self, v11, v12, v13, v14, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeIdentifierFromData_(v20, v21, v19, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_strokeProvider(self, v26, v27, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeForIdentifier_(v31, v32, (uint64_t)v25, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend_addObject_(v57, v37, (uint64_t)v36, v38, v39, v40);
        }
        else
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v41 = (id)qword_1EF568E30;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_strokeProvider(self, v42, v43, v44, v45, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeProviderVersion(v47, v48, v49, v50, v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v63 = v19;
            v64 = 2112;
            v65 = v53;
            _os_log_impl(&dword_1BE607000, v41, OS_LOG_TYPE_DEFAULT, "Failed to get stroke with id: %@ from stroke provider version %@", buf, 0x16u);

          }
        }

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v58, (uint64_t)v66, 16, v15);
    }
    while (v16);
  }

  return v57;
}

- (CHStrokeProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (CHGroupingModel)strokeGroupingModel
{
  return self->_strokeGroupingModel;
}

- (CHRecognitionSessionResult)sessionLastResult
{
  return self->_sessionLastResult;
}

- (NSArray)locales
{
  return self->_locales;
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
  objc_storeStrong((id *)&self->_groupingStrategiesByIdentifierForTextStrokeClasses, 0);
  objc_storeStrong((id *)&self->_textInputTargets, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_sessionLastResult, 0);
  objc_storeStrong((id *)&self->_strokeGroupingModel, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
}

@end
