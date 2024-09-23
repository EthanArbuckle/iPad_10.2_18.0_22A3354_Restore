@implementation CHRecognitionSessionTask

- (CHRecognitionSessionTask)init
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_FAULT, "Use designated initializer instead", v5, 2u);
  }

  return 0;
}

- (CHRecognitionSessionTask)initWithSessionMode:(int64_t)a3 locales:(id)a4 preferredLocales:(id)a5 strokeProvider:(id)a6 calculateDocumentProvider:(id)a7 inputResult:(id)a8 recognitionQOSClass:(unsigned int)a9 recognitionEnvironment:(int64_t)a10 isHighResponsivenessTask:(BOOL)a11 strokeClassificationModel:(id)a12 strokeGroupingModel:(id)a13 strokeGroupingRequirement:(int64_t)a14 principalLineRequirement:(int64_t)a15 subjectStrokeIdentifiers:(id)a16 recognitionOptions:(id)a17 disableMathTextSwapping:(BOOL)a18 partialResultBlock:(id)a19 wantsAutoRefine:(BOOL)a20
{
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  CHRecognitionSessionTask *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id *p_isa;
  CHRecognitionSessionTask *v44;
  uint64_t v45;
  NSArray *recognitionLocales;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSArray *preferredLocales;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id partialResultBlock;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSDictionary *recognitionOptions;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSMutableSet *intermediateDeclaredVariables;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  BOOL v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
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
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  NSObject *v110;
  id v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  CalculateUnitsTrie *unitsTrie;
  NSObject *v118;
  NSObject *v119;
  dispatch_queue_t v120;
  OS_dispatch_queue *recognizersQueue;
  id obj;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  objc_super v133;
  uint8_t buf[16];

  v25 = a4;
  v26 = a5;
  obj = a6;
  v130 = a6;
  v129 = a7;
  v128 = a8;
  v127 = a12;
  v126 = a13;
  v27 = v25;
  v28 = v26;
  v125 = a16;
  v131 = a17;
  v29 = a19;
  v35 = objc_msgSend_count(v26, v30, v31, v32, v33, v34);
  if (a3 != 2 && !v35)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v36 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v36, OS_LOG_TYPE_FAULT, "The preferred locales list cannot be empty unless it's math mode.", buf, 2u);
    }

  }
  v133.receiver = self;
  v133.super_class = (Class)CHRecognitionSessionTask;
  v37 = -[CHRecognitionSessionTask init](&v133, sel_init);
  p_isa = (id *)&v37->super.isa;
  v44 = v37;
  if (v37)
  {
    v37->_sessionMode = a3;
    v45 = objc_msgSend_copy(v27, v38, v39, v40, v41, v42);
    recognitionLocales = v44->_recognitionLocales;
    v44->_recognitionLocales = (NSArray *)v45;

    v52 = objc_msgSend_copy(v28, v47, v48, v49, v50, v51);
    v124 = v29;
    preferredLocales = v44->_preferredLocales;
    v44->_preferredLocales = (NSArray *)v52;

    objc_storeStrong(p_isa + 69, obj);
    objc_storeStrong(p_isa + 70, a7);
    objc_storeStrong(p_isa + 63, a8);
    v44->_status = 0;
    v44->_recognitionEnvironment = a10;
    objc_storeStrong(p_isa + 78, a12);
    objc_storeStrong(p_isa + 79, a13);
    v44->_isHighResponsivenessTask = a11;
    v44->_strokeGroupingRequirement = a14;
    v44->_principalLineRequirement = a15;
    objc_storeStrong(p_isa + 80, a16);
    v59 = objc_msgSend_copy(v29, v54, v55, v56, v57, v58);
    partialResultBlock = v44->_partialResultBlock;
    v44->_partialResultBlock = (id)v59;

    v66 = objc_msgSend_copy(v131, v61, v62, v63, v64, v65);
    recognitionOptions = v44->_recognitionOptions;
    v44->_recognitionOptions = (NSDictionary *)v66;

    v44->_disableMathTextSwapping = a18;
    v44->_wantsAutoRefine = a20;
    objc_msgSend_set(MEMORY[0x1E0C99E20], v68, v69, v70, v71, v72);
    v73 = objc_claimAutoreleasedReturnValue();
    intermediateDeclaredVariables = v44->_intermediateDeclaredVariables;
    v44->_intermediateDeclaredVariables = (NSMutableSet *)v73;

    if (_os_feature_enabled_impl() && CHHasPersonalizedSynthesisSupport())
    {
      v79 = !a3 || a3 == 2;
      v80 = v79;
      objc_msgSend_objectForKeyedSubscript_(v44->_recognitionOptions, v75, (uint64_t)CFSTR("CHRecognitionTaskSkipPopulatingInventory"), v76, v77, v78, v28);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend_BOOLValue(v81, v82, v83, v84, v85, v86);

      v44->_allowContributionToStyle = v80 & (v87 ^ 1);
      v29 = v124;
      if (os_variant_has_internal_diagnostics())
      {
        objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v88, v89, v90, v91, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionaryForKey_(v93, v94, (uint64_t)CFSTR("com.apple.corehandwriting"), v95, v96, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKey_(v98, v99, (uint64_t)CFSTR("kCHFreezeStyleInventory"), v100, v101, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = objc_msgSend_BOOLValue(v103, v104, v105, v106, v107, v108);

        if (v109)
        {
          v44->_allowContributionToStyle = 0;
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v110 = (id)qword_1EF568E60;
          if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BE607000, v110, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: the inventory is frozen", buf, 2u);
          }

        }
      }
    }
    v111 = objc_alloc(MEMORY[0x1E0D09EC8]);
    v116 = objc_msgSend_initWithLocales_(v111, v112, (uint64_t)v44->_recognitionLocales, v113, v114, v115);
    unitsTrie = v44->_unitsTrie;
    v44->_unitsTrie = (CalculateUnitsTrie *)v116;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v118 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v118, (dispatch_qos_class_t)a9, 0);
    v119 = objc_claimAutoreleasedReturnValue();

    v120 = dispatch_queue_create("com.apple.CoreHandwriting.RecognitionSessionRecognizers", v119);
    recognizersQueue = v44->__recognizersQueue;
    v44->__recognizersQueue = (OS_dispatch_queue *)v120;

  }
  return v44;
}

- (void)main
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _BOOL4 v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
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
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  NSObject *v104;
  const char *v105;
  uint64_t v106;
  NSObject *v107;
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
  id v118;
  double v119;
  double v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
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
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  BOOL v173;
  void *v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  double v195;
  double v196;
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
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  double v212;
  double v213;
  NSArray *subjectStrokeIdentifiers;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
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
  uint64_t v240;
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
  uint64_t v261;
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
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  void *v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  const char *v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  void *v316;
  const char *v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t i;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  NSArray *v343;
  void *v344;
  uint64_t v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  const char *v350;
  uint64_t v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  NSObject *v375;
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
  void *v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  id v400;
  NSObject *v401;
  os_signpost_id_t v402;
  NSObject *v403;
  NSObject *v404;
  unint64_t v405;
  NSObject *v406;
  void *v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  void *v413;
  const char *v414;
  NSObject *v415;
  NSObject *v416;
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
  uint64_t v427;
  uint64_t j;
  void *v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  NSObject *v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  _BOOL4 wantsAutoRefine;
  void *v443;
  const char *v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  void *v449;
  const char *v450;
  uint64_t v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  void *v462;
  uint64_t v463;
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
  const char *v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  double v480;
  double v481;
  NSObject *v482;
  os_signpost_id_t v483;
  NSObject *v484;
  NSObject *v485;
  unint64_t v486;
  NSObject *v487;
  const char *v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
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
  void *v505;
  NSObject *v506;
  NSObject *v507;
  double v508;
  double v509;
  const char *v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  const char *v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  const char *v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  void *partialResultBlock;
  id v531;
  BOOL v532;
  double v533;
  double v534;
  const char *v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  void *v540;
  CHRecognitionSessionResult *v541;
  const char *v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  void *v547;
  const char *v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  void *v553;
  const char *v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  const char *v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
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
  uint64_t v576;
  void *v577;
  const char *v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  void *v583;
  const char *v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  const char *v590;
  void *v591;
  id v592;
  void (**v593)(id, void *);
  uint64_t v594;
  const char *v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  NSObject *v600;
  os_signpost_id_t v601;
  NSObject *v602;
  NSObject *v603;
  NSObject *v604;
  const char *v605;
  uint64_t v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  const char *v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  const char *v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  double v620;
  double v621;
  CHFastStrokeGroupingStrategy *v622;
  const char *v623;
  uint64_t v624;
  const char *v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  NSObject *v630;
  const char *v631;
  uint64_t v632;
  uint64_t v633;
  id v634;
  const char *v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  double v640;
  double v641;
  const char *v642;
  uint64_t v643;
  uint64_t v644;
  uint64_t v645;
  uint64_t v646;
  const char *v647;
  uint64_t v648;
  uint64_t v649;
  uint64_t v650;
  uint64_t v651;
  void *v652;
  const char *v653;
  uint64_t v654;
  uint64_t v655;
  uint64_t v656;
  uint64_t v657;
  uint64_t v658;
  double v659;
  NSObject *v660;
  os_signpost_id_t v661;
  NSObject *v662;
  NSObject *v663;
  unint64_t v664;
  NSObject *v665;
  const char *v666;
  NSObject *v667;
  NSObject *v668;
  const char *v669;
  uint64_t v670;
  uint64_t v671;
  uint64_t v672;
  uint64_t v673;
  const char *v674;
  uint64_t v675;
  uint64_t v676;
  uint64_t v677;
  uint64_t v678;
  double v679;
  void *strokeClassificationModel;
  id v681;
  BOOL v682;
  NSObject *v683;
  os_signpost_id_t v684;
  NSObject *v685;
  NSObject *v686;
  NSObject *v687;
  const char *v688;
  uint64_t v689;
  uint64_t v690;
  uint64_t v691;
  uint64_t v692;
  double v693;
  double v694;
  CHStrokeClassificationModel *v695;
  CHStrokeClassificationModel *v696;
  const char *v697;
  const char *v698;
  uint64_t v699;
  uint64_t v700;
  uint64_t v701;
  uint64_t v702;
  double v703;
  double v704;
  NSObject *v705;
  const char *v706;
  uint64_t v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  uint64_t v711;
  const char *v712;
  uint64_t v713;
  uint64_t v714;
  uint64_t v715;
  NSObject *v716;
  NSObject *v717;
  NSObject *v718;
  double v719;
  double v720;
  const char *v721;
  uint64_t v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  char v726;
  const char *v727;
  uint64_t v728;
  uint64_t v729;
  uint64_t v730;
  uint64_t v731;
  char v732;
  void *v733;
  NSObject *v734;
  os_signpost_id_t v735;
  NSObject *v736;
  NSObject *v737;
  unint64_t v738;
  NSObject *v739;
  uint64_t v740;
  const char *v741;
  const char *v742;
  uint64_t v743;
  uint64_t v744;
  uint64_t v745;
  uint64_t v746;
  void *v747;
  const char *v748;
  uint64_t v749;
  uint64_t v750;
  uint64_t v751;
  void *v752;
  void *v753;
  const char *v754;
  uint64_t v755;
  void *v756;
  const char *v757;
  uint64_t v758;
  uint64_t v759;
  uint64_t v760;
  const char *v761;
  uint64_t v762;
  uint64_t v763;
  uint64_t v764;
  uint64_t v765;
  uint64_t v766;
  void *v767;
  const char *v768;
  uint64_t v769;
  uint64_t v770;
  uint64_t v771;
  uint64_t v772;
  uint64_t v773;
  const char *v774;
  uint64_t v775;
  uint64_t v776;
  uint64_t v777;
  uint64_t v778;
  double v779;
  double v780;
  NSObject *v781;
  NSObject *v782;
  NSObject *v783;
  const char *v784;
  uint64_t v785;
  uint64_t v786;
  uint64_t v787;
  uint64_t v788;
  void *v789;
  const char *v790;
  uint64_t v791;
  uint64_t v792;
  const char *v793;
  uint64_t v794;
  NSObject *v795;
  NSObject *v796;
  double v797;
  const char *v798;
  uint64_t v799;
  uint64_t v800;
  uint64_t v801;
  uint64_t v802;
  uint64_t v803;
  const char *v804;
  uint64_t v805;
  uint64_t v806;
  uint64_t v807;
  const char *v808;
  uint64_t v809;
  uint64_t v810;
  uint64_t v811;
  uint64_t v812;
  double v813;
  double v814;
  NSObject *v815;
  NSObject *v816;
  NSObject *v817;
  NSObject *v818;
  const char *v819;
  uint64_t v820;
  uint64_t v821;
  uint64_t v822;
  uint64_t v823;
  id v824;
  const char *v825;
  uint64_t v826;
  uint64_t v827;
  uint64_t v828;
  uint64_t v829;
  void *v830;
  const char *v831;
  uint64_t v832;
  uint64_t v833;
  uint64_t v834;
  uint64_t v835;
  const char *v836;
  uint64_t v837;
  uint64_t v838;
  uint64_t v839;
  uint64_t v840;
  const char *v841;
  uint64_t v842;
  uint64_t v843;
  uint64_t v844;
  uint64_t v845;
  void *v846;
  const char *v847;
  uint64_t v848;
  uint64_t v849;
  uint64_t v850;
  void *v851;
  const char *v852;
  uint64_t v853;
  uint64_t v854;
  uint64_t v855;
  void *v856;
  const char *v857;
  uint64_t v858;
  uint64_t v859;
  uint64_t v860;
  uint64_t v861;
  const char *v862;
  uint64_t v863;
  uint64_t v864;
  uint64_t v865;
  uint64_t v866;
  void *v867;
  void *v868;
  const char *v869;
  uint64_t v870;
  uint64_t v871;
  uint64_t v872;
  uint64_t v873;
  NSObject *v874;
  const char *v875;
  uint64_t v876;
  uint64_t v877;
  uint64_t v878;
  uint64_t v879;
  int v880;
  const char *v881;
  uint64_t v882;
  uint64_t v883;
  uint64_t v884;
  uint64_t v885;
  void *v886;
  const char *v887;
  uint64_t v888;
  uint64_t v889;
  uint64_t v890;
  uint64_t v891;
  const char *v892;
  uint64_t v893;
  uint64_t v894;
  uint64_t v895;
  uint64_t v896;
  void *v897;
  void *v898;
  const char *v899;
  uint64_t v900;
  uint64_t v901;
  uint64_t v902;
  uint64_t v903;
  const char *v904;
  uint64_t v905;
  uint64_t v906;
  uint64_t v907;
  uint64_t v908;
  const char *v909;
  uint64_t v910;
  uint64_t v911;
  uint64_t v912;
  uint64_t v913;
  const char *v914;
  uint64_t v915;
  uint64_t v916;
  uint64_t v917;
  void *v918;
  char isEqualToSet;
  const char *v920;
  uint64_t v921;
  uint64_t v922;
  uint64_t v923;
  uint64_t v924;
  void *v925;
  const char *v926;
  uint64_t v927;
  uint64_t v928;
  uint64_t v929;
  uint64_t v930;
  void *v931;
  const char *v932;
  uint64_t v933;
  uint64_t v934;
  uint64_t v935;
  uint64_t v936;
  const char *v937;
  uint64_t v938;
  uint64_t v939;
  uint64_t v940;
  uint64_t v941;
  void *v942;
  const char *v943;
  uint64_t v944;
  uint64_t v945;
  uint64_t v946;
  uint64_t v947;
  void *v948;
  const char *v949;
  uint64_t v950;
  uint64_t v951;
  uint64_t v952;
  const char *v953;
  uint64_t v954;
  uint64_t v955;
  uint64_t v956;
  uint64_t v957;
  void *v958;
  const char *v959;
  uint64_t v960;
  uint64_t v961;
  uint64_t v962;
  uint64_t v963;
  void *v964;
  const char *v965;
  uint64_t v966;
  uint64_t v967;
  uint64_t v968;
  uint64_t v969;
  const char *v970;
  uint64_t v971;
  uint64_t v972;
  uint64_t v973;
  uint64_t v974;
  void *v975;
  const char *v976;
  uint64_t v977;
  uint64_t v978;
  uint64_t v979;
  uint64_t v980;
  void *v981;
  const char *v982;
  uint64_t v983;
  uint64_t v984;
  uint64_t v985;
  const char *v986;
  uint64_t v987;
  uint64_t v988;
  uint64_t v989;
  void *v990;
  const char *v991;
  uint64_t v992;
  uint64_t v993;
  uint64_t v994;
  uint64_t v995;
  const char *v996;
  uint64_t v997;
  uint64_t v998;
  uint64_t v999;
  uint64_t v1000;
  void *v1001;
  const char *v1002;
  uint64_t v1003;
  uint64_t v1004;
  uint64_t v1005;
  uint64_t v1006;
  void *v1007;
  const char *v1008;
  uint64_t v1009;
  uint64_t v1010;
  const char *v1011;
  uint64_t v1012;
  uint64_t v1013;
  uint64_t v1014;
  uint64_t v1015;
  unint64_t v1016;
  uint64_t v1017;
  const char *v1018;
  uint64_t v1019;
  uint64_t v1020;
  uint64_t v1021;
  uint64_t v1022;
  void *v1023;
  const char *v1024;
  uint64_t v1025;
  uint64_t v1026;
  uint64_t v1027;
  uint64_t v1028;
  void *v1029;
  const char *v1030;
  uint64_t v1031;
  uint64_t v1032;
  uint64_t v1033;
  uint64_t v1034;
  void *v1035;
  void *v1036;
  const char *v1037;
  uint64_t v1038;
  uint64_t v1039;
  uint64_t v1040;
  uint64_t v1041;
  uint64_t v1042;
  const char *v1043;
  uint64_t v1044;
  uint64_t v1045;
  uint64_t v1046;
  void *v1047;
  const char *v1048;
  uint64_t v1049;
  uint64_t v1050;
  uint64_t v1051;
  void *v1052;
  const char *v1053;
  uint64_t v1054;
  uint64_t v1055;
  uint64_t v1056;
  uint64_t v1057;
  const char *v1058;
  uint64_t v1059;
  uint64_t v1060;
  uint64_t v1061;
  uint64_t v1062;
  void *v1063;
  void *v1064;
  const char *v1065;
  uint64_t v1066;
  uint64_t v1067;
  uint64_t v1068;
  uint64_t v1069;
  const char *v1070;
  uint64_t v1071;
  uint64_t v1072;
  uint64_t v1073;
  uint64_t v1074;
  void *v1075;
  void *v1076;
  const char *v1077;
  uint64_t v1078;
  uint64_t v1079;
  uint64_t v1080;
  uint64_t v1081;
  void *v1082;
  const char *v1083;
  uint64_t v1084;
  uint64_t v1085;
  uint64_t v1086;
  int v1087;
  const char *v1088;
  uint64_t v1089;
  uint64_t v1090;
  uint64_t v1091;
  uint64_t v1092;
  const char *v1093;
  uint64_t v1094;
  uint64_t v1095;
  uint64_t v1096;
  uint64_t v1097;
  const char *v1098;
  uint64_t v1099;
  uint64_t v1100;
  uint64_t v1101;
  const char *v1102;
  uint64_t v1103;
  uint64_t v1104;
  uint64_t v1105;
  uint64_t v1106;
  void *v1107;
  const char *v1108;
  uint64_t v1109;
  uint64_t v1110;
  uint64_t v1111;
  uint64_t k;
  void *v1113;
  void *v1114;
  const char *v1115;
  uint64_t v1116;
  uint64_t v1117;
  uint64_t v1118;
  uint64_t v1119;
  uint64_t v1120;
  const char *v1121;
  uint64_t v1122;
  uint64_t v1123;
  uint64_t v1124;
  const char *v1125;
  uint64_t v1126;
  uint64_t v1127;
  uint64_t v1128;
  const char *v1129;
  uint64_t v1130;
  uint64_t v1131;
  uint64_t v1132;
  uint64_t v1133;
  void *v1134;
  const char *v1135;
  uint64_t v1136;
  uint64_t v1137;
  uint64_t v1138;
  char v1139;
  void *v1141;
  BOOL v1142;
  id v1143;
  const char *v1144;
  uint64_t v1145;
  const char *v1146;
  uint64_t v1147;
  uint64_t v1148;
  uint64_t v1149;
  uint64_t m;
  void *v1151;
  void *v1152;
  const char *v1153;
  uint64_t v1154;
  uint64_t v1155;
  uint64_t v1156;
  uint64_t v1157;
  uint64_t v1158;
  const char *v1159;
  uint64_t v1160;
  uint64_t v1161;
  uint64_t v1162;
  uint64_t v1163;
  uint64_t v1164;
  void *v1165;
  const char *v1166;
  uint64_t v1167;
  uint64_t v1168;
  uint64_t v1169;
  uint64_t v1170;
  void *v1171;
  _BOOL4 v1172;
  const char *v1173;
  uint64_t v1174;
  uint64_t v1175;
  uint64_t v1176;
  uint64_t v1177;
  void *v1178;
  const char *v1179;
  uint64_t v1180;
  uint64_t v1181;
  uint64_t v1182;
  uint64_t v1183;
  void *v1184;
  const char *v1185;
  uint64_t v1186;
  uint64_t v1187;
  uint64_t v1188;
  uint64_t v1189;
  void *v1190;
  const char *v1191;
  uint64_t v1192;
  const char *v1193;
  uint64_t v1194;
  uint64_t v1195;
  uint64_t v1196;
  uint64_t v1197;
  uint64_t v1198;
  uint64_t v1199;
  uint64_t n;
  void *v1201;
  void *v1202;
  const char *v1203;
  uint64_t v1204;
  uint64_t v1205;
  uint64_t v1206;
  uint64_t v1207;
  void *v1208;
  void *v1209;
  const char *v1210;
  uint64_t v1211;
  uint64_t v1212;
  uint64_t v1213;
  uint64_t v1214;
  uint64_t v1215;
  const char *v1216;
  uint64_t v1217;
  uint64_t v1218;
  uint64_t v1219;
  void *v1220;
  const char *v1221;
  uint64_t v1222;
  uint64_t v1223;
  uint64_t v1224;
  void *v1225;
  const char *v1226;
  uint64_t v1227;
  uint64_t v1228;
  uint64_t v1229;
  uint64_t v1230;
  const char *v1231;
  uint64_t v1232;
  uint64_t v1233;
  uint64_t v1234;
  uint64_t v1235;
  void *v1236;
  void *v1237;
  const char *v1238;
  uint64_t v1239;
  uint64_t v1240;
  uint64_t v1241;
  uint64_t v1242;
  void *v1243;
  BOOL v1244;
  const char *v1245;
  uint64_t v1246;
  uint64_t v1247;
  uint64_t v1248;
  uint64_t v1249;
  NSMutableSet *intermediateDeclaredVariables;
  void *v1251;
  const char *v1252;
  uint64_t v1253;
  uint64_t v1254;
  uint64_t v1255;
  uint64_t v1256;
  void *v1257;
  const char *v1258;
  uint64_t v1259;
  uint64_t v1260;
  uint64_t v1261;
  const char *v1262;
  uint64_t v1263;
  id v1264;
  const char *v1265;
  uint64_t v1266;
  uint64_t v1267;
  uint64_t v1268;
  const char *v1269;
  uint64_t v1270;
  uint64_t v1271;
  uint64_t v1272;
  const char *v1273;
  uint64_t v1274;
  uint64_t v1275;
  uint64_t v1276;
  uint64_t v1277;
  const char *v1278;
  uint64_t v1279;
  uint64_t v1280;
  uint64_t v1281;
  uint64_t v1282;
  void *v1283;
  const char *v1284;
  uint64_t v1285;
  uint64_t v1286;
  uint64_t v1287;
  uint64_t v1288;
  uint64_t v1289;
  const char *v1290;
  uint64_t v1291;
  uint64_t v1292;
  uint64_t v1293;
  NSObject *v1294;
  void *v1295;
  const char *v1296;
  uint64_t v1297;
  uint64_t v1298;
  uint64_t v1299;
  uint64_t v1300;
  uint64_t v1301;
  const char *v1302;
  uint64_t v1303;
  uint64_t v1304;
  uint64_t v1305;
  void *v1306;
  const char *v1307;
  uint64_t v1308;
  uint64_t v1309;
  uint64_t v1310;
  void *v1311;
  NSObject *v1312;
  NSObject *v1313;
  const char *v1314;
  uint64_t v1315;
  uint64_t v1316;
  uint64_t v1317;
  uint64_t v1318;
  void *v1319;
  const char *v1320;
  uint64_t v1321;
  uint64_t v1322;
  uint64_t v1323;
  uint64_t v1324;
  uint64_t v1325;
  const char *v1326;
  uint64_t v1327;
  uint64_t v1328;
  uint64_t v1329;
  uint64_t v1330;
  uint64_t v1331;
  NSObject *v1332;
  NSObject *v1333;
  NSObject *v1334;
  const char *v1335;
  uint64_t v1336;
  uint64_t v1337;
  uint64_t v1338;
  uint64_t v1339;
  double v1340;
  double v1341;
  const char *v1342;
  uint64_t v1343;
  uint64_t v1344;
  uint64_t v1345;
  uint64_t v1346;
  void *v1347;
  const char *v1348;
  uint64_t v1349;
  uint64_t v1350;
  uint64_t v1351;
  float v1352;
  float v1353;
  const char *v1354;
  uint64_t v1355;
  uint64_t v1356;
  uint64_t v1357;
  uint64_t v1358;
  NSObject *v1359;
  double v1360;
  const char *v1361;
  uint64_t v1362;
  uint64_t v1363;
  uint64_t v1364;
  uint64_t v1365;
  char v1366;
  char v1367;
  const char *v1368;
  uint64_t v1369;
  uint64_t v1370;
  uint64_t v1371;
  uint64_t v1372;
  CHGroupingAndRecognitionResults *v1373;
  const char *v1374;
  uint64_t v1375;
  uint64_t v1376;
  uint64_t v1377;
  uint64_t v1378;
  void *v1379;
  void *v1380;
  const char *v1381;
  uint64_t v1382;
  uint64_t v1383;
  uint64_t v1384;
  uint64_t v1385;
  void *v1386;
  const char *v1387;
  uint64_t v1388;
  uint64_t v1389;
  uint64_t v1390;
  void *v1391;
  const char *v1392;
  void *v1393;
  const char *v1394;
  uint64_t v1395;
  uint64_t v1396;
  uint64_t v1397;
  uint64_t v1398;
  void *v1399;
  const char *v1400;
  uint64_t v1401;
  uint64_t v1402;
  uint64_t v1403;
  uint64_t v1404;
  void *v1405;
  const char *v1406;
  uint64_t v1407;
  uint64_t v1408;
  uint64_t v1409;
  uint64_t v1410;
  void *v1411;
  const char *v1412;
  uint64_t v1413;
  uint64_t v1414;
  const char *v1415;
  uint64_t v1416;
  uint64_t v1417;
  void *v1418;
  const char *v1419;
  uint64_t v1420;
  uint64_t v1421;
  uint64_t v1422;
  uint64_t v1423;
  uint64_t v1424;
  const char *v1425;
  uint64_t v1426;
  uint64_t v1427;
  uint64_t v1428;
  uint64_t v1429;
  double v1430;
  double v1431;
  const char *v1432;
  uint64_t v1433;
  uint64_t v1434;
  uint64_t v1435;
  uint64_t v1436;
  const char *v1437;
  uint64_t v1438;
  uint64_t v1439;
  uint64_t v1440;
  uint64_t v1441;
  void *v1442;
  const char *v1443;
  uint64_t v1444;
  uint64_t v1445;
  uint64_t v1446;
  uint64_t v1447;
  void *v1448;
  void *v1449;
  const char *v1450;
  uint64_t v1451;
  const char *v1452;
  uint64_t v1453;
  uint64_t v1454;
  uint64_t v1455;
  uint64_t v1456;
  uint64_t v1457;
  uint64_t v1458;
  uint64_t ii;
  void *v1460;
  void *v1461;
  uint64_t v1462;
  const char *v1463;
  uint64_t v1464;
  uint64_t v1465;
  uint64_t v1466;
  void *v1467;
  const char *v1468;
  uint64_t v1469;
  uint64_t v1470;
  uint64_t v1471;
  void *v1472;
  void *v1473;
  void *v1474;
  const char *v1475;
  uint64_t v1476;
  uint64_t v1477;
  uint64_t v1478;
  uint64_t v1479;
  uint64_t v1480;
  const char *v1481;
  uint64_t v1482;
  uint64_t v1483;
  uint64_t v1484;
  void *v1485;
  const char *v1486;
  uint64_t v1487;
  uint64_t v1488;
  const char *v1489;
  uint64_t v1490;
  uint64_t v1491;
  uint64_t v1492;
  uint64_t v1493;
  double v1494;
  double v1495;
  double v1496;
  double v1497;
  void *v1498;
  const char *v1499;
  uint64_t v1500;
  uint64_t v1501;
  uint64_t v1502;
  uint64_t v1503;
  uint64_t v1504;
  const char *v1505;
  uint64_t v1506;
  uint64_t v1507;
  uint64_t v1508;
  void *v1509;
  const char *v1510;
  uint64_t v1511;
  uint64_t v1512;
  uint64_t v1513;
  const char *v1514;
  uint64_t v1515;
  uint64_t v1516;
  uint64_t v1517;
  uint64_t v1518;
  const char *v1519;
  uint64_t v1520;
  uint64_t v1521;
  int isSupportedLatinScriptLocale_withMode;
  const char *v1523;
  uint64_t v1524;
  uint64_t v1525;
  uint64_t v1526;
  uint64_t v1527;
  void *v1528;
  const char *v1529;
  uint64_t v1530;
  uint64_t v1531;
  uint64_t v1532;
  uint64_t v1533;
  void *v1534;
  float v1535;
  double v1536;
  const char *v1537;
  uint64_t v1538;
  uint64_t v1539;
  int isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold;
  const char *v1541;
  uint64_t v1542;
  uint64_t v1543;
  uint64_t v1544;
  uint64_t v1545;
  void *v1546;
  const char *v1547;
  uint64_t v1548;
  uint64_t v1549;
  uint64_t v1550;
  const char *v1551;
  uint64_t v1552;
  uint64_t v1553;
  uint64_t v1554;
  uint64_t v1555;
  void *v1556;
  const char *v1557;
  uint64_t v1558;
  uint64_t v1559;
  uint64_t v1560;
  uint64_t v1561;
  unint64_t v1562;
  const char *v1563;
  uint64_t v1564;
  uint64_t v1565;
  uint64_t v1566;
  uint64_t v1567;
  const char *v1568;
  uint64_t v1569;
  uint64_t v1570;
  uint64_t v1571;
  CHMutableTokenizedTextResult *v1572;
  id v1573;
  const char *v1574;
  uint64_t v1575;
  uint64_t v1576;
  uint64_t v1577;
  uint64_t v1578;
  void *v1579;
  const char *v1580;
  uint64_t v1581;
  uint64_t v1582;
  const char *v1583;
  uint64_t v1584;
  uint64_t v1585;
  uint64_t v1586;
  void *v1587;
  const char *v1588;
  uint64_t v1589;
  uint64_t v1590;
  uint64_t v1591;
  uint64_t v1592;
  const char *v1593;
  uint64_t v1594;
  uint64_t v1595;
  uint64_t v1596;
  uint64_t v1597;
  uint64_t v1598;
  uint64_t v1599;
  const char *v1600;
  uint64_t v1601;
  uint64_t v1602;
  uint64_t v1603;
  uint64_t v1604;
  void *v1605;
  const char *v1606;
  uint64_t v1607;
  uint64_t v1608;
  uint64_t v1609;
  uint64_t v1610;
  void *v1611;
  const char *v1612;
  const char *v1613;
  uint64_t v1614;
  uint64_t v1615;
  uint64_t v1616;
  NSObject *v1617;
  const char *v1618;
  uint64_t v1619;
  uint64_t v1620;
  uint64_t v1621;
  uint64_t v1622;
  int isCandidateMathGroup;
  _BOOL4 v1624;
  const char *v1625;
  uint64_t v1626;
  uint64_t v1627;
  uint64_t v1628;
  uint64_t v1629;
  void *v1630;
  const char *v1631;
  uint64_t v1632;
  uint64_t v1633;
  uint64_t v1634;
  uint64_t v1635;
  void *v1636;
  const char *v1637;
  uint64_t v1638;
  uint64_t v1639;
  uint64_t v1640;
  void *v1641;
  const char *v1642;
  uint64_t v1643;
  uint64_t v1644;
  uint64_t v1645;
  uint64_t v1646;
  void *v1647;
  const char *v1648;
  uint64_t v1649;
  uint64_t v1650;
  uint64_t v1651;
  uint64_t v1652;
  void *v1653;
  const char *v1654;
  uint64_t v1655;
  uint64_t v1656;
  uint64_t v1657;
  uint64_t v1658;
  void *v1659;
  const char *v1660;
  uint64_t v1661;
  uint64_t v1662;
  uint64_t v1663;
  void *v1664;
  const char *v1665;
  uint64_t v1666;
  uint64_t v1667;
  uint64_t v1668;
  uint64_t v1669;
  void *v1670;
  _BOOL4 v1671;
  BOOL v1672;
  CHMutableTokenizedTextResult *v1673;
  void *v1674;
  CHMutableTokenizedTextResult *v1675;
  const char *v1676;
  uint64_t v1677;
  uint64_t v1678;
  uint64_t v1679;
  uint64_t v1680;
  uint64_t v1681;
  void (**v1682)(_QWORD);
  CHMutableTokenizedTextResult *v1683;
  const char *v1684;
  uint64_t v1685;
  uint64_t v1686;
  uint64_t v1687;
  id v1688;
  const char *v1689;
  uint64_t v1690;
  uint64_t v1691;
  uint64_t v1692;
  uint64_t v1693;
  uint64_t v1694;
  const char *v1695;
  uint64_t v1696;
  uint64_t v1697;
  uint64_t v1698;
  uint64_t v1699;
  const char *v1700;
  uint64_t v1701;
  uint64_t v1702;
  uint64_t v1703;
  uint64_t v1704;
  NSObject *v1705;
  const char *v1706;
  uint64_t v1707;
  uint64_t v1708;
  uint64_t v1709;
  uint64_t v1710;
  uint64_t v1711;
  const char *v1712;
  uint64_t v1713;
  uint64_t v1714;
  uint64_t v1715;
  uint64_t v1716;
  uint64_t v1717;
  void *v1718;
  const char *v1719;
  uint64_t v1720;
  uint64_t v1721;
  uint64_t v1722;
  uint64_t v1723;
  void *v1724;
  const char *v1725;
  uint64_t v1726;
  uint64_t v1727;
  const char *v1728;
  uint64_t v1729;
  uint64_t v1730;
  uint64_t v1731;
  uint64_t v1732;
  void *v1733;
  const char *v1734;
  uint64_t v1735;
  uint64_t v1736;
  uint64_t v1737;
  const char *v1738;
  uint64_t v1739;
  uint64_t v1740;
  uint64_t v1741;
  uint64_t v1742;
  void *v1743;
  const char *v1744;
  uint64_t v1745;
  uint64_t v1746;
  uint64_t v1747;
  const char *v1748;
  uint64_t v1749;
  uint64_t v1750;
  uint64_t v1751;
  uint64_t v1752;
  uint64_t v1753;
  const char *v1754;
  uint64_t v1755;
  uint64_t v1756;
  uint64_t v1757;
  void *v1758;
  CHRecognitionSessionAutoRefineResult *v1759;
  const char *v1760;
  const char *v1761;
  uint64_t v1762;
  uint64_t v1763;
  uint64_t v1764;
  uint64_t v1765;
  id v1766;
  const char *v1767;
  uint64_t v1768;
  uint64_t v1769;
  uint64_t v1770;
  uint64_t v1771;
  void *v1772;
  const char *v1773;
  uint64_t v1774;
  uint64_t v1775;
  uint64_t v1776;
  uint64_t v1777;
  void *v1778;
  const char *v1779;
  uint64_t v1780;
  uint64_t v1781;
  CHStrokeGroupRecognitionResult *v1782;
  const char *v1783;
  uint64_t v1784;
  uint64_t v1785;
  uint64_t v1786;
  uint64_t v1787;
  void *v1788;
  const char *v1789;
  uint64_t v1790;
  uint64_t v1791;
  uint64_t v1792;
  uint64_t v1793;
  void *v1794;
  const char *v1795;
  uint64_t v1796;
  uint64_t v1797;
  uint64_t v1798;
  uint64_t v1799;
  void *v1800;
  const char *v1801;
  uint64_t v1802;
  uint64_t v1803;
  uint64_t v1804;
  uint64_t v1805;
  void *v1806;
  const char *v1807;
  uint64_t v1808;
  uint64_t v1809;
  uint64_t v1810;
  uint64_t v1811;
  void *v1812;
  const char *v1813;
  uint64_t v1814;
  uint64_t v1815;
  uint64_t v1816;
  uint64_t v1817;
  void *v1818;
  const char *v1819;
  uint64_t v1820;
  uint64_t v1821;
  uint64_t v1822;
  uint64_t v1823;
  void *v1824;
  const char *v1825;
  void *v1826;
  void *v1827;
  const char *v1828;
  uint64_t v1829;
  uint64_t v1830;
  uint64_t v1831;
  uint64_t v1832;
  uint64_t v1833;
  const char *v1834;
  uint64_t v1835;
  uint64_t v1836;
  uint64_t v1837;
  void *v1838;
  const char *v1839;
  uint64_t v1840;
  uint64_t v1841;
  id v1842;
  NSObject *v1843;
  const char *v1844;
  uint64_t v1845;
  uint64_t v1846;
  uint64_t v1847;
  uint64_t v1848;
  void *v1849;
  const char *v1850;
  uint64_t v1851;
  uint64_t v1852;
  uint64_t v1853;
  uint64_t v1854;
  uint64_t v1855;
  const char *v1856;
  uint64_t v1857;
  uint64_t v1858;
  uint64_t v1859;
  uint64_t v1860;
  void *v1861;
  const char *v1862;
  uint64_t v1863;
  uint64_t v1864;
  uint64_t v1865;
  uint64_t v1866;
  void *v1867;
  const char *v1868;
  uint64_t v1869;
  uint64_t v1870;
  uint64_t v1871;
  uint64_t v1872;
  void *v1873;
  char v1874;
  const char *v1875;
  uint64_t v1876;
  uint64_t v1877;
  uint64_t v1878;
  uint64_t v1879;
  char v1880;
  void *v1881;
  const char *v1882;
  uint64_t v1883;
  uint64_t v1884;
  uint64_t v1885;
  uint64_t v1886;
  void *v1887;
  const char *v1888;
  uint64_t v1889;
  uint64_t v1890;
  uint64_t v1891;
  uint64_t v1892;
  void *v1893;
  char isKindOfClass;
  const char *v1895;
  uint64_t v1896;
  uint64_t v1897;
  uint64_t v1898;
  uint64_t v1899;
  void *v1900;
  const char *v1901;
  uint64_t v1902;
  uint64_t v1903;
  uint64_t v1904;
  uint64_t v1905;
  const char *v1906;
  uint64_t v1907;
  uint64_t v1908;
  uint64_t v1909;
  uint64_t v1910;
  const char *v1911;
  uint64_t v1912;
  uint64_t v1913;
  uint64_t v1914;
  uint64_t v1915;
  void *v1916;
  uint64_t v1917;
  const char *v1918;
  uint64_t v1919;
  uint64_t v1920;
  uint64_t v1921;
  void *v1922;
  id v1923;
  const char *v1924;
  uint64_t v1925;
  uint64_t v1926;
  uint64_t v1927;
  const char *v1928;
  uint64_t v1929;
  uint64_t v1930;
  const char *v1931;
  uint64_t v1932;
  const char *v1933;
  uint64_t v1934;
  uint64_t v1935;
  uint64_t v1936;
  uint64_t v1937;
  uint64_t v1938;
  uint64_t v1939;
  uint64_t jj;
  void *v1941;
  void *v1942;
  uint64_t v1943;
  const char *v1944;
  uint64_t v1945;
  uint64_t v1946;
  uint64_t v1947;
  void *v1948;
  const char *v1949;
  uint64_t v1950;
  uint64_t v1951;
  uint64_t v1952;
  void *v1953;
  const char *v1954;
  uint64_t v1955;
  uint64_t v1956;
  uint64_t v1957;
  uint64_t v1958;
  void *v1959;
  const char *v1960;
  uint64_t v1961;
  uint64_t v1962;
  uint64_t v1963;
  uint64_t v1964;
  void *v1965;
  const char *v1966;
  uint64_t v1967;
  uint64_t v1968;
  uint64_t v1969;
  uint64_t v1970;
  void *v1971;
  const char *v1972;
  char isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes;
  const char *v1974;
  uint64_t v1975;
  uint64_t v1976;
  uint64_t v1977;
  uint64_t v1978;
  void *v1979;
  BOOL v1980;
  const char *v1981;
  uint64_t v1982;
  uint64_t v1983;
  uint64_t v1984;
  uint64_t v1985;
  void *v1986;
  void *v1987;
  const char *v1988;
  uint64_t v1989;
  uint64_t v1990;
  uint64_t v1991;
  uint64_t v1992;
  void *v1993;
  const char *v1994;
  uint64_t v1995;
  uint64_t v1996;
  uint64_t v1997;
  CHStrokeGroupingManager *v1998;
  const char *v1999;
  uint64_t v2000;
  uint64_t v2001;
  uint64_t v2002;
  uint64_t v2003;
  void *v2004;
  const char *v2005;
  uint64_t v2006;
  uint64_t v2007;
  uint64_t v2008;
  uint64_t v2009;
  void *v2010;
  const char *v2011;
  uint64_t v2012;
  uint64_t v2013;
  uint64_t v2014;
  uint64_t v2015;
  void *v2016;
  const char *v2017;
  void *isMathMode;
  const char *v2019;
  void *v2020;
  id v2021;
  void *v2022;
  const char *v2023;
  uint64_t v2024;
  uint64_t v2025;
  uint64_t v2026;
  uint64_t v2027;
  uint64_t v2028;
  const char *v2029;
  uint64_t v2030;
  uint64_t v2031;
  uint64_t v2032;
  void *v2033;
  id v2034;
  const char *v2035;
  uint64_t v2036;
  uint64_t v2037;
  uint64_t v2038;
  const char *v2039;
  const char *v2040;
  uint64_t v2041;
  uint64_t v2042;
  uint64_t v2043;
  uint64_t v2044;
  void *v2045;
  id v2046;
  id v2047;
  id v2048;
  id v2049;
  const char *v2050;
  uint64_t v2051;
  uint64_t v2052;
  uint64_t v2053;
  uint64_t v2054;
  void *v2055;
  const char *v2056;
  uint64_t v2057;
  uint64_t v2058;
  uint64_t v2059;
  uint64_t v2060;
  void *v2061;
  char v2062;
  const char *v2063;
  uint64_t v2064;
  uint64_t v2065;
  uint64_t v2066;
  uint64_t v2067;
  void *v2068;
  const char *v2069;
  uint64_t v2070;
  uint64_t v2071;
  uint64_t v2072;
  uint64_t v2073;
  const char *v2074;
  uint64_t v2075;
  uint64_t v2076;
  uint64_t v2077;
  uint64_t v2078;
  void *v2079;
  const char *v2080;
  uint64_t v2081;
  uint64_t v2082;
  uint64_t v2083;
  uint64_t v2084;
  void *v2085;
  const char *v2086;
  uint64_t v2087;
  uint64_t v2088;
  uint64_t v2089;
  uint64_t v2090;
  void *v2091;
  const char *v2092;
  uint64_t v2093;
  uint64_t v2094;
  uint64_t v2095;
  uint64_t v2096;
  void *v2097;
  const char *v2098;
  uint64_t v2099;
  uint64_t v2100;
  uint64_t v2101;
  uint64_t v2102;
  void *v2103;
  const char *v2104;
  char v2105;
  const char *v2106;
  uint64_t v2107;
  uint64_t v2108;
  uint64_t v2109;
  uint64_t v2110;
  void *v2111;
  const char *v2112;
  uint64_t v2113;
  uint64_t v2114;
  uint64_t v2115;
  uint64_t v2116;
  uint64_t v2117;
  const char *v2118;
  uint64_t v2119;
  uint64_t v2120;
  uint64_t v2121;
  uint64_t v2122;
  void *v2123;
  const char *v2124;
  uint64_t v2125;
  uint64_t v2126;
  uint64_t v2127;
  uint64_t v2128;
  const char *v2129;
  uint64_t v2130;
  uint64_t v2131;
  uint64_t v2132;
  uint64_t v2133;
  NSObject *v2134;
  void *v2135;
  const char *v2136;
  uint64_t v2137;
  uint64_t v2138;
  uint64_t v2139;
  double v2140;
  double v2141;
  const char *v2142;
  uint64_t v2143;
  uint64_t v2144;
  uint64_t v2145;
  uint64_t v2146;
  NSObject *v2147;
  CHRecognitionSessionResult *v2148;
  const char *v2149;
  uint64_t v2150;
  uint64_t v2151;
  uint64_t v2152;
  uint64_t v2153;
  void *v2154;
  const char *v2155;
  uint64_t v2156;
  uint64_t v2157;
  uint64_t v2158;
  uint64_t v2159;
  void *v2160;
  const char *v2161;
  uint64_t v2162;
  uint64_t v2163;
  uint64_t v2164;
  uint64_t v2165;
  uint64_t v2166;
  const char *v2167;
  uint64_t v2168;
  uint64_t v2169;
  uint64_t v2170;
  uint64_t v2171;
  void *v2172;
  const char *v2173;
  uint64_t v2174;
  uint64_t v2175;
  uint64_t v2176;
  uint64_t v2177;
  void *v2178;
  const char *v2179;
  uint64_t v2180;
  uint64_t v2181;
  uint64_t v2182;
  uint64_t v2183;
  void *v2184;
  const char *v2185;
  uint64_t v2186;
  uint64_t v2187;
  uint64_t v2188;
  uint64_t v2189;
  void *v2190;
  const char *v2191;
  uint64_t v2192;
  uint64_t v2193;
  uint64_t v2194;
  uint64_t v2195;
  uint64_t v2196;
  const char *v2197;
  const char *v2198;
  uint64_t v2199;
  uint64_t v2200;
  uint64_t v2201;
  uint64_t v2202;
  void *v2203;
  const char *v2204;
  uint64_t v2205;
  uint64_t v2206;
  uint64_t v2207;
  uint64_t v2208;
  id v2209;
  const char *v2210;
  uint64_t v2211;
  const char *v2212;
  uint64_t v2213;
  uint64_t v2214;
  uint64_t v2215;
  uint64_t v2216;
  uint64_t v2217;
  uint64_t v2218;
  uint64_t kk;
  void *v2220;
  const char *v2221;
  uint64_t v2222;
  uint64_t v2223;
  uint64_t v2224;
  const char *v2225;
  uint64_t v2226;
  uint64_t v2227;
  uint64_t v2228;
  uint64_t v2229;
  void *v2230;
  const char *v2231;
  uint64_t v2232;
  const char *v2233;
  uint64_t v2234;
  uint64_t v2235;
  uint64_t v2236;
  uint64_t v2237;
  uint64_t v2238;
  uint64_t v2239;
  uint64_t mm;
  void *v2241;
  void *v2242;
  uint64_t v2243;
  const char *v2244;
  uint64_t v2245;
  uint64_t v2246;
  uint64_t v2247;
  void *v2248;
  const char *v2249;
  uint64_t v2250;
  uint64_t v2251;
  uint64_t v2252;
  void *v2253;
  const char *v2254;
  uint64_t v2255;
  uint64_t v2256;
  uint64_t v2257;
  uint64_t v2258;
  const char *v2259;
  uint64_t v2260;
  uint64_t v2261;
  uint64_t v2262;
  uint64_t v2263;
  void *v2264;
  void *v2265;
  const char *v2266;
  uint64_t v2267;
  uint64_t v2268;
  uint64_t v2269;
  uint64_t v2270;
  int isEvaluationExpected;
  const char *v2272;
  uint64_t v2273;
  uint64_t v2274;
  uint64_t v2275;
  uint64_t v2276;
  void *v2277;
  const char *v2278;
  uint64_t v2279;
  uint64_t v2280;
  uint64_t v2281;
  uint64_t v2282;
  void *v2283;
  const char *v2284;
  uint64_t v2285;
  uint64_t v2286;
  uint64_t v2287;
  int hasSuffix;
  __CFString *v2289;
  __CFString *v2290;
  NSObject *v2291;
  const char *v2292;
  uint64_t v2293;
  uint64_t v2294;
  uint64_t v2295;
  uint64_t v2296;
  void *v2297;
  const char *v2298;
  uint64_t v2299;
  uint64_t v2300;
  uint64_t v2301;
  uint64_t v2302;
  void *v2303;
  const char *v2304;
  uint64_t v2305;
  uint64_t v2306;
  uint64_t v2307;
  uint64_t v2308;
  uint64_t v2309;
  uint64_t v2310;
  const char *v2311;
  uint64_t v2312;
  uint64_t v2313;
  uint64_t v2314;
  uint64_t v2315;
  uint64_t v2316;
  const char *v2317;
  uint64_t v2318;
  uint64_t v2319;
  uint64_t v2320;
  uint64_t v2321;
  uint64_t v2322;
  NSObject *v2323;
  const char *v2324;
  uint64_t v2325;
  uint64_t v2326;
  uint64_t v2327;
  uint64_t v2328;
  void *v2329;
  const char *v2330;
  uint64_t v2331;
  uint64_t v2332;
  uint64_t v2333;
  uint64_t v2334;
  void *v2335;
  const char *v2336;
  uint64_t v2337;
  uint64_t v2338;
  uint64_t v2339;
  uint64_t v2340;
  void *v2341;
  const char *v2342;
  uint64_t v2343;
  uint64_t v2344;
  const char *v2345;
  uint64_t v2346;
  uint64_t v2347;
  uint64_t v2348;
  uint64_t v2349;
  void *nn;
  void *v2351;
  void *v2352;
  uint64_t v2353;
  const char *v2354;
  uint64_t v2355;
  uint64_t v2356;
  uint64_t v2357;
  void *v2358;
  const char *v2359;
  uint64_t v2360;
  uint64_t v2361;
  uint64_t v2362;
  void *v2363;
  const char *v2364;
  uint64_t v2365;
  uint64_t v2366;
  uint64_t v2367;
  uint64_t v2368;
  const char *v2369;
  uint64_t v2370;
  uint64_t v2371;
  uint64_t v2372;
  uint64_t v2373;
  void *v2374;
  void *v2375;
  const char *v2376;
  uint64_t v2377;
  uint64_t v2378;
  uint64_t v2379;
  uint64_t v2380;
  int v2381;
  const char *v2382;
  uint64_t v2383;
  uint64_t v2384;
  uint64_t v2385;
  uint64_t v2386;
  void *v2387;
  const char *v2388;
  uint64_t v2389;
  uint64_t v2390;
  uint64_t v2391;
  uint64_t v2392;
  void *v2393;
  const char *v2394;
  uint64_t v2395;
  uint64_t v2396;
  uint64_t v2397;
  int v2398;
  __CFString *v2399;
  __CFString *v2400;
  const char *v2401;
  uint64_t v2402;
  uint64_t v2403;
  uint64_t v2404;
  uint64_t v2405;
  void *v2406;
  const char *v2407;
  uint64_t v2408;
  const char *v2409;
  uint64_t v2410;
  uint64_t v2411;
  uint64_t v2412;
  uint64_t v2413;
  uint64_t v2414;
  uint64_t v2415;
  uint64_t v2416;
  void *v2417;
  uint64_t v2418;
  const char *v2419;
  uint64_t v2420;
  uint64_t v2421;
  uint64_t v2422;
  uint64_t v2423;
  id v2424;
  const __CFString *v2425;
  const char *v2426;
  uint64_t v2427;
  uint64_t v2428;
  uint64_t v2429;
  uint64_t v2430;
  void *v2431;
  const char *v2432;
  uint64_t v2433;
  uint64_t v2434;
  uint64_t v2435;
  uint64_t v2436;
  unint64_t v2437;
  const char *v2438;
  uint64_t v2439;
  uint64_t v2440;
  uint64_t v2441;
  uint64_t v2442;
  void *v2443;
  const char *v2444;
  uint64_t v2445;
  uint64_t v2446;
  uint64_t v2447;
  uint64_t v2448;
  const char *v2449;
  uint64_t v2450;
  uint64_t v2451;
  uint64_t v2452;
  uint64_t v2453;
  void *v2454;
  const char *v2455;
  uint64_t v2456;
  uint64_t v2457;
  uint64_t v2458;
  uint64_t v2459;
  void *v2460;
  const char *v2461;
  uint64_t v2462;
  uint64_t v2463;
  uint64_t v2464;
  const char *v2465;
  uint64_t v2466;
  uint64_t v2467;
  uint64_t v2468;
  uint64_t v2469;
  void *v2470;
  const char *v2471;
  uint64_t v2472;
  uint64_t v2473;
  uint64_t v2474;
  int v2475;
  void *v2476;
  const char *v2477;
  uint64_t v2478;
  uint64_t v2479;
  uint64_t v2480;
  uint64_t v2481;
  unint64_t v2482;
  const char *v2483;
  uint64_t v2484;
  uint64_t v2485;
  uint64_t v2486;
  uint64_t v2487;
  void *v2488;
  const char *v2489;
  uint64_t v2490;
  uint64_t v2491;
  uint64_t v2492;
  uint64_t v2493;
  const char *v2494;
  uint64_t v2495;
  uint64_t v2496;
  uint64_t v2497;
  uint64_t v2498;
  void *v2499;
  const char *v2500;
  uint64_t v2501;
  uint64_t v2502;
  uint64_t v2503;
  uint64_t v2504;
  const char *v2505;
  uint64_t v2506;
  uint64_t v2507;
  uint64_t v2508;
  const char *v2509;
  uint64_t v2510;
  uint64_t v2511;
  uint64_t v2512;
  uint64_t v2513;
  void *v2514;
  const char *v2515;
  uint64_t v2516;
  uint64_t v2517;
  uint64_t v2518;
  int v2519;
  NSObject *v2520;
  const char *v2521;
  uint64_t v2522;
  uint64_t v2523;
  uint64_t v2524;
  uint64_t v2525;
  void *v2526;
  const char *v2527;
  uint64_t v2528;
  uint64_t v2529;
  uint64_t v2530;
  uint64_t v2531;
  void *v2532;
  const char *v2533;
  uint64_t v2534;
  uint64_t v2535;
  uint64_t v2536;
  uint64_t v2537;
  uint64_t v2538;
  uint64_t v2539;
  const char *v2540;
  uint64_t v2541;
  uint64_t v2542;
  uint64_t v2543;
  uint64_t v2544;
  uint64_t v2545;
  const char *v2546;
  uint64_t v2547;
  uint64_t v2548;
  uint64_t v2549;
  uint64_t v2550;
  uint64_t v2551;
  const char *v2552;
  uint64_t v2553;
  uint64_t v2554;
  uint64_t v2555;
  uint64_t v2556;
  void *v2557;
  BOOL v2558;
  int v2559;
  NSObject *v2560;
  const char *v2561;
  uint64_t v2562;
  uint64_t v2563;
  uint64_t v2564;
  uint64_t v2565;
  void *v2566;
  const char *v2567;
  uint64_t v2568;
  uint64_t v2569;
  uint64_t v2570;
  uint64_t v2571;
  void *v2572;
  const char *v2573;
  uint64_t v2574;
  uint64_t v2575;
  uint64_t v2576;
  uint64_t v2577;
  void *v2578;
  id v2579;
  const char *v2580;
  uint64_t v2581;
  uint64_t v2582;
  uint64_t v2583;
  uint64_t v2584;
  uint64_t v2585;
  NSObject *v2586;
  const char *v2587;
  uint64_t v2588;
  uint64_t v2589;
  id v2590;
  uint64_t v2591;
  id v2592;
  id v2593;
  void *v2594;
  void *v2595;
  void *v2596;
  id v2597;
  void *v2598;
  void *v2599;
  id v2600;
  id v2601;
  void *v2602;
  void *v2603;
  void *v2604;
  void *v2605;
  void *v2606;
  NSObject *v2607;
  void *v2608;
  void *v2609;
  void *v2610;
  void *v2611;
  void *v2612;
  void *v2613;
  void *v2614;
  id v2615;
  id v2616;
  id v2617;
  id v2618;
  id v2619;
  void *v2620;
  double v2621;
  id v2622;
  void *v2623;
  double v2624;
  void *v2625;
  CHRecognitionSessionResult *v2626;
  void *v2627;
  id v2628;
  id v2629;
  void *v2630;
  void *logd;
  void *log;
  NSObject *loga;
  void *logb;
  void *logc;
  void *v2636;
  void *v2637;
  NSObject *v2638;
  int64_t sessionMode;
  uint64_t v2640;
  void *spidd;
  os_signpost_id_t spid;
  void *spida;
  void *spidb;
  id spidc;
  id v2646;
  id v2647;
  id v2648;
  id v2649;
  id v2650;
  id v2651;
  void *v2652;
  void *v2653;
  id v2654;
  id v2655;
  id v2656;
  void *v2657;
  void *v2658;
  id v2659;
  CHMutableTokenizedTextResult *v2660;
  void *v2661;
  CHMutableTokenizedTextResult *v2662;
  id v2663;
  void *v2664;
  void *v2665;
  id v2666;
  id obj;
  void *obja;
  NSArray *objb;
  id objc;
  _QWORD v2672[6];
  __int128 v2673;
  __int128 v2674;
  __int128 v2675;
  __int128 v2676;
  id v2677;
  _QWORD v2678[5];
  _QWORD v2679[5];
  _QWORD v2680[5];
  _QWORD v2681[5];
  _QWORD v2682[5];
  _QWORD v2683[5];
  double v2684;
  __int128 v2685;
  __int128 v2686;
  double v2687;
  id v2688;
  id v2689;
  id v2690;
  __int128 v2691;
  __int128 v2692;
  __int128 v2693;
  __int128 v2694;
  _QWORD v2695[5];
  id v2696;
  id v2697;
  __int128 v2698;
  __int128 v2699;
  __int128 v2700;
  __int128 v2701;
  __int128 v2702;
  __int128 v2703;
  __int128 v2704;
  __int128 v2705;
  __int128 v2706;
  __int128 v2707;
  __int128 v2708;
  __int128 v2709;
  __int128 v2710;
  __int128 v2711;
  __int128 v2712;
  __int128 v2713;
  __int128 v2714;
  __int128 v2715;
  __int128 v2716;
  __int128 v2717;
  _BYTE v2718[128];
  _BYTE v2719[128];
  _BYTE v2720[128];
  uint8_t v2721[128];
  uint8_t v2722[4];
  void *v2723;
  __int16 v2724;
  __CFString *v2725;
  __int16 v2726;
  uint64_t v2727;
  __int16 v2728;
  uint64_t v2729;
  __int16 v2730;
  uint64_t v2731;
  __int16 v2732;
  const __CFString *v2733;
  __int128 v2734;
  __int128 v2735;
  __int128 v2736;
  __int128 v2737;
  uint8_t v2738[32];
  _OWORD v2739[2];
  __int128 v2740;
  __int128 v2741;
  __int128 v2742;
  __int128 v2743;
  uint8_t v2744[32];
  __int128 v2745;
  __int128 v2746;
  _BYTE buf[32];
  __int128 v2748;
  NSObject *v2749;
  CHRecognitionSessionTask *v2750;
  id v2751;
  uint64_t v2752;

  v2752 = *MEMORY[0x1E0C80C00];
  objc_msgSend_outputResult(self, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v12 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1BE607000, v12, OS_LOG_TYPE_FAULT, "Recognition tasks can only be executed once: %@", buf, 0xCu);
    }

  }
  if ((objc_msgSend_cancelled(self, v7, v8, v9, v10, v11) & 1) == 0)
  {
    sub_1BE791DC4((uint64_t)self, 1);
    objc_msgSend_inputResult(self, v13, v14, v15, v16, v17);
    v2620 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeProvider(self, v18, v19, v20, v21, v22);
    v2630 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_delegate(self, v23, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (v29)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v35 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v35, OS_LOG_TYPE_FAULT, "delegate cannot be nil when the task starts", buf, 2u);
      }

    }
    if (self && os_variant_has_internal_diagnostics())
    {
      objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v30, v31, v32, v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionaryForKey_(v36, v37, (uint64_t)CFSTR("com.apple.corehandwriting"), v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectForKey_(v41, v42, (uint64_t)CFSTR("CHLogFullDrawings"), v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend_BOOLValue(v46, v47, v48, v49, v50, v51);

      if ((v52 & 1) != 0)
      {
        if (qword_1EF568238 != -1)
          dispatch_once(&qword_1EF568238, &unk_1E77F1C50);
        obj = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend_setDateFormat_(obj, v53, (uint64_t)CFSTR("dd-MM-yyyy-HH-mm-ss-SSS"), v54, v55, v56);
        objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v57, v58, v59, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUIDString(v62, v63, v64, v65, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringToIndex_(v68, v69, 4, v70, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_now(MEMORY[0x1E0C99D68], v74, v75, v76, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromDate_(obj, v80, (uint64_t)v79, v81, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_strokeProvider(self, v85, v86, v87, v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orderedStrokes(v90, v91, v92, v93, v94, v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = (void *)objc_opt_class();
        objc_msgSend_createDrawingForStrokes_interpolationType_resolution_cancellationBlock_(v97, v98, (uint64_t)v96, 0, 2, 0);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if (v103)
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v99, (uint64_t)CFSTR("full_drawing_%@_%@.json"), v100, v101, v102, v84, v73);
          v104 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_writeToFileWithContext_folder_basename_(v103, v105, (uint64_t)&unk_1E7827420, qword_1EF568230, (uint64_t)v104, v106);
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v107 = (id)qword_1EF568E28;
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = CFSTR("CHLogFullDrawings");
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = qword_1EF568230;
            *(_WORD *)&buf[22] = 2112;
            *(_QWORD *)&buf[24] = v104;
            _os_log_impl(&dword_1BE607000, v107, OS_LOG_TYPE_DEFAULT, "%@ serialize drawing to %@/%@, ", buf, 0x20u);
          }

        }
        else
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v104 = (id)qword_1EF568E28;
          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = CFSTR("CHLogFullDrawings");
            _os_log_impl(&dword_1BE607000, v104, OS_LOG_TYPE_ERROR, "%@ skipping serialization of nil drawing.", buf, 0xCu);
          }
        }

      }
    }
    if (objc_msgSend_principalLineRequirement(self, v30, v31, v32, v33, v34) == 3)
    {
      v118 = v2620;
      if (self)
      {
        objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v113, v114, v115, v116, v117);
        v120 = v119;
        objc_msgSend_recognitionResultsByGroupID(v118, v121, v122, v123, v124, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        obja = (void *)objc_msgSend_mutableCopy(v126, v127, v128, v129, v130, v131);

        v2743 = 0u;
        v2742 = 0u;
        v2741 = 0u;
        v2740 = 0u;
        objc_msgSend_strokeGroupingResult(v118, v132, v133, v134, v135, v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeGroups(v137, v138, v139, v140, v141, v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();

        v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v144, (uint64_t)&v2740, (uint64_t)buf, 16, v145);
        if (v151)
        {
          v152 = *(_QWORD *)v2741;
LABEL_35:
          v153 = 0;
          while (1)
          {
            if (*(_QWORD *)v2741 != v152)
              objc_enumerationMutation(v143);
            v154 = *(void **)(*((_QWORD *)&v2740 + 1) + 8 * v153);
            if ((objc_msgSend_cancelled(self, v146, v147, v148, v149, v150) & 1) != 0)
              break;
            v160 = objc_msgSend_uniqueIdentifier(v154, v155, v156, v157, v158, v159);
            objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v118, v161, v160, v162, v163, v164);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            v171 = v165;
            if (v165)
            {
              objc_msgSend_preferredLocale(v165, v166, v167, v168, v169, v170);
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              v173 = v172 == 0;

              if (!v173)
              {
                sub_1BE791F14(self, v154, v171);
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                v175 = (void *)MEMORY[0x1E0CB37E8];
                v181 = objc_msgSend_uniqueIdentifier(v154, v176, v177, v178, v179, v180);
                objc_msgSend_numberWithInteger_(v175, v182, v181, v183, v184, v185);
                v186 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(obja, v187, (uint64_t)v174, (uint64_t)v186, v188, v189);

              }
            }

            if (v151 == ++v153)
            {
              v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v143, v146, (uint64_t)&v2740, (uint64_t)buf, 16, v150);
              if (v151)
                goto LABEL_35;
              break;
            }
          }
        }

        objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v190, v191, v192, v193, v194);
        v196 = v195;
        if ((objc_msgSend_cancelled(self, v197, v198, v199, v200, v201) & 1) != 0)
        {
          v2615 = 0;
        }
        else
        {
          v2739[0] = 0u;
          memset(v2738, 0, sizeof(v2738));
          if (v118)
            objc_msgSend_generationDuration(v118, v202, v203, v204, v205, v206);
          *(double *)v2739 = v196 - v120;
          v2626 = [CHRecognitionSessionResult alloc];
          objc_msgSend_strokeProviderVersion(v118, v220, v221, v222, v223, v224);
          v2646 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_encodedStrokeProviderVersion(v118, v225, v226, v227, v228, v229);
          v2652 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_orderedStrokeIdentifiers(v118, v230, v231, v232, v233, v234);
          v2657 = (void *)objc_claimAutoreleasedReturnValue();
          v240 = objc_msgSend_sessionMode(v118, v235, v236, v237, v238, v239);
          objc_msgSend_recognitionLocales(self, v241, v242, v243, v244, v245);
          v2636 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_preferredLocales(self, v246, v247, v248, v249, v250);
          spidd = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_calculateDocumentProvider(self, v251, v252, v253, v254, v255);
          v256 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_declaredVariables(v256, v257, v258, v259, v260, v261);
          logd = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clutterFilter(v118, v262, v263, v264, v265, v266);
          v267 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeClassificationResult(v118, v268, v269, v270, v271, v272);
          v273 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeGroupingResult(v118, v274, v275, v276, v277, v278);
          v279 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_rawStrokeGroupingResult(v118, v280, v281, v282, v283, v284);
          v285 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_rawRecognitionResultsByGroupID(v118, v286, v287, v288, v289, v290);
          v291 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_textCorrectionResultsByGroupID(v118, v292, v293, v294, v295, v296);
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_autoRefineResult(v118, v298, v299, v300, v301, v302);
          v303 = (void *)objc_claimAutoreleasedReturnValue();
          v2734 = *(_OWORD *)v2738;
          v2735 = *(_OWORD *)&v2738[16];
          v2736 = v2739[0];
          v309 = objc_msgSend_recognitionEnvironment(self, v304, v305, v306, v307, v308);
          v2615 = (id)objc_msgSend_initWithStrokeProviderVersion_encodedStrokeProviderVersion_orderedStrokeIdentifiers_sessionMode_locales_preferredLocales_declaredVariables_clutterFilter_strokeClassificationResult_strokeGroupingResult_rawStrokeGroupingResult_recognitionResults_rawRecognitionResults_inlineContinuousModeResults_autoRefineResult_generationDuration_recognitionEnvironment_(v2626, v310, (uint64_t)v2646, (uint64_t)v2652, (uint64_t)v2657, v240, v2636, spidd, logd, v267, v273, v279, v285, obja, v291, v297, v303, &v2734, v309);

        }
      }
      else
      {
        v2615 = 0;
      }

      goto LABEL_539;
    }
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v108, v109, v110, v111, v112);
    v213 = v212;
    subjectStrokeIdentifiers = self->_subjectStrokeIdentifiers;
    if (subjectStrokeIdentifiers)
    {
      v2625 = (void *)objc_msgSend_mutableCopy(subjectStrokeIdentifiers, v207, v208, v209, v210, v211);
    }
    else
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v207, v208, v209, v210, v211);
      v2625 = (void *)objc_claimAutoreleasedReturnValue();
      v2705 = 0u;
      v2704 = 0u;
      v2703 = 0u;
      v2702 = 0u;
      objc_msgSend_orderedStrokes(v2630, v311, v312, v313, v314, v315);
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      v324 = objc_msgSend_countByEnumeratingWithState_objects_count_(v316, v317, (uint64_t)&v2702, (uint64_t)v2721, 16, v318);
      if (v324)
      {
        v325 = *(_QWORD *)v2703;
        do
        {
          for (i = 0; i != v324; ++i)
          {
            if (*(_QWORD *)v2703 != v325)
              objc_enumerationMutation(v316);
            v327 = *(void **)(*((_QWORD *)&v2702 + 1) + 8 * i);
            if (__ROR8__(0x8F5C28F5C28F5C29 * objc_msgSend_count(v2625, v319, v320, v321, v322, v323), 2) <= 0x28F5C28F5C28F5CuLL
              && (objc_msgSend_cancelled(self, v328, v329, v330, v331, v332) & 1) != 0)
            {
              goto LABEL_114;
            }
            objc_msgSend_strokeIdentifier(v327, v328, v329, v330, v331, v332);
            v333 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_encodedStrokeIdentifier_(v2630, v334, (uint64_t)v333, v335, v336, v337);
            v338 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_addObject_(v2625, v339, (uint64_t)v338, v340, v341, v342);
          }
          v324 = objc_msgSend_countByEnumeratingWithState_objects_count_(v316, v319, (uint64_t)&v2702, (uint64_t)v2721, 16, v323);
        }
        while (v324);
      }

    }
    v343 = self->_subjectStrokeIdentifiers;
    if (v343)
    {
      v344 = (void *)MEMORY[0x1E0C99DE8];
      v345 = objc_msgSend_count(v343, v215, v216, v217, v218, v219);
      objc_msgSend_arrayWithCapacity_(v344, v346, v345, v347, v348, v349);
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      v2700 = 0u;
      v2701 = 0u;
      v2698 = 0u;
      v2699 = 0u;
      objb = self->_subjectStrokeIdentifiers;
      v357 = objc_msgSend_countByEnumeratingWithState_objects_count_(objb, v350, (uint64_t)&v2698, (uint64_t)v2720, 16, v351);
      if (!v357)
        goto LABEL_80;
      v358 = *(_QWORD *)v2699;
LABEL_66:
      v359 = 0;
      while (1)
      {
        if (*(_QWORD *)v2699 != v358)
          objc_enumerationMutation(objb);
        v360 = *(_QWORD *)(*((_QWORD *)&v2698 + 1) + 8 * v359);
        if (__ROR8__(0x8F5C28F5C28F5C29 * objc_msgSend_count(v316, v352, v353, v354, v355, v356), 2) <= 0x28F5C28F5C28F5CuLL
          && (objc_msgSend_cancelled(self, v361, v362, v363, v364, v365) & 1) != 0)
        {
          break;
        }
        v366 = (void *)objc_opt_class();
        objc_msgSend_strokeForIdentifier_inStrokeProvider_(v366, v367, v360, (uint64_t)v2630, v368, v369);
        v374 = (void *)objc_claimAutoreleasedReturnValue();
        if (v374)
        {
          objc_msgSend_addObject_(v316, v370, (uint64_t)v374, v371, v372, v373);
        }
        else
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v375 = (id)qword_1EF568E28;
          if (os_log_type_enabled(v375, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_strokeProviderVersion(v2630, v376, v377, v378, v379, v380);
            v381 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_orderedStrokes(v2630, v382, v383, v384, v385, v386);
            v387 = (void *)objc_claimAutoreleasedReturnValue();
            v393 = objc_msgSend_count(v387, v388, v389, v390, v391, v392);
            v399 = objc_msgSend_count(self->_subjectStrokeIdentifiers, v394, v395, v396, v397, v398);
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v360;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v381;
            *(_WORD *)&buf[22] = 2048;
            *(_QWORD *)&buf[24] = v393;
            LOWORD(v2748) = 2048;
            *(_QWORD *)((char *)&v2748 + 2) = v399;
            _os_log_impl(&dword_1BE607000, v375, OS_LOG_TYPE_ERROR, "Invalid stroke %@ for stroke provider: version = %@, number of strokes = %ld, number of subject stroke identifiers %ld ", buf, 0x2Au);

          }
        }

        if (v357 == ++v359)
        {
          v357 = objc_msgSend_countByEnumeratingWithState_objects_count_(objb, v352, (uint64_t)&v2698, (uint64_t)v2720, 16, v356);
          if (!v357)
          {
LABEL_80:

            v400 = v316;
            v2597 = 0;
            goto LABEL_100;
          }
          goto LABEL_66;
        }
      }

LABEL_114:
      v462 = 0;
LABEL_568:

      return;
    }
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v401 = (id)qword_1EF568E50;
    v402 = os_signpost_id_generate(v401);

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v403 = (id)qword_1EF568E50;
    v404 = v403;
    v405 = v402 - 1;
    if (v402 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v403))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE607000, v404, OS_SIGNPOST_INTERVAL_BEGIN, v402, "CHSessionTaskGetAddedStrokes", ", buf, 2u);
    }

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v406 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v406, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v406, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionTaskGetAddedStrokes\", buf, 2u);
    }

    v407 = (void *)objc_opt_class();
    v2697 = 0;
    v2696 = 0;
    objc_msgSend_strokeGroupingResult(v2620, v408, v409, v410, v411, v412);
    v413 = (void *)objc_claimAutoreleasedReturnValue();
    v2695[0] = MEMORY[0x1E0C809B0];
    v2695[1] = 3221225472;
    v2695[2] = sub_1BE791EDC;
    v2695[3] = &unk_1E77F4CA0;
    v2695[4] = self;
    objc_msgSend_getAddedStrokes_removedStrokeIdentifiers_inStrokeProvider_lastGroupingResult_shouldCancel_(v407, v414, (uint64_t)&v2697, (uint64_t)&v2696, (uint64_t)v2630, (uint64_t)v413, v2695);
    v400 = v2697;
    v2597 = v2696;

    if (qword_1EF568E88 == -1)
    {
      v415 = (id)qword_1EF568E50;
      if (v405 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_96;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v415 = (id)qword_1EF568E50;
      if (v405 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_96;
    }
    if (os_signpost_enabled(v415))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE607000, v415, OS_SIGNPOST_INTERVAL_END, v402, "CHSessionTaskGetAddedStrokes", ", buf, 2u);
    }
LABEL_96:

    if (qword_1EF568E88 == -1)
    {
      v416 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v416, OS_LOG_TYPE_DEFAULT))
      {
LABEL_99:

LABEL_100:
        v2693 = 0u;
        v2694 = 0u;
        v2691 = 0u;
        v2692 = 0u;
        objc = v400;
        v419 = 0;
        v420 = 0;
        v426 = objc_msgSend_countByEnumeratingWithState_objects_count_(objc, v417, (uint64_t)&v2691, (uint64_t)v2719, 16, v418);
        if (v426)
        {
          v427 = *(_QWORD *)v2692;
          do
          {
            for (j = 0; j != v426; ++j)
            {
              if (*(_QWORD *)v2692 != v427)
                objc_enumerationMutation(objc);
              v429 = *(void **)(*((_QWORD *)&v2691 + 1) + 8 * j);
              v420 += ((unint64_t)objc_msgSend_strokeAttributes(v429, v421, v422, v423, v424, v425) >> 2) & 1;
              v419 += ((unint64_t)objc_msgSend_strokeAttributes(v429, v430, v431, v432, v433, v434) >> 1) & 1;
            }
            v426 = objc_msgSend_countByEnumeratingWithState_objects_count_(objc, v421, (uint64_t)&v2691, (uint64_t)v2719, 16, v425);
          }
          while (v426);
        }

        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v435 = (id)qword_1EF568E28;
        if (os_log_type_enabled(v435, OS_LOG_TYPE_DEFAULT))
        {
          v441 = objc_msgSend_count(objc, v436, v437, v438, v439, v440);
          wantsAutoRefine = self->_wantsAutoRefine;
          *(_DWORD *)buf = 134218752;
          *(_QWORD *)&buf[4] = v441;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v420;
          *(_WORD *)&buf[22] = 2048;
          *(_QWORD *)&buf[24] = v419;
          LOWORD(v2748) = 1024;
          *(_DWORD *)((char *)&v2748 + 2) = wantsAutoRefine;
          _os_log_impl(&dword_1BE607000, v435, OS_LOG_TYPE_DEFAULT, "Running new session task with %lu added strokes [%ld synthetic, %ld shapes], wantsAutoRefine ? %d", buf, 0x26u);
        }

        v443 = (void *)MEMORY[0x1E0CB36F8];
        objc_msgSend_strokeProviderVersion(v2630, v444, v445, v446, v447, v448);
        v449 = (void *)objc_claimAutoreleasedReturnValue();
        v2690 = 0;
        objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v443, v450, (uint64_t)v449, 1, (uint64_t)&v2690, v451);
        v2596 = (void *)objc_claimAutoreleasedReturnValue();
        v2592 = v2690;

        v2598 = (void *)objc_msgSend_newGroupingManager(self, v452, v453, v454, v455, v456);
        if (_os_feature_enabled_impl())
          v2602 = (void *)objc_msgSend_newGroupingPostProcessingManagerWithGroupingManager_(self, v457, (uint64_t)v2598, v459, v460, v461);
        else
          v2602 = 0;
        objc_msgSend_clutterFilter(self, v457, v458, v459, v460, v461);
        v463 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_currentProgress(MEMORY[0x1E0CB38A8], v464, v465, v466, v467, v468);
        v469 = (void *)objc_claimAutoreleasedReturnValue();
        v2605 = v469;
        objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v470, v471, v472, v473, v474);
        v481 = v480;
        if (!v463)
        {
          v2593 = 0;
          v498 = 0;
          goto LABEL_143;
        }
        v2612 = (void *)v463;
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v482 = (id)qword_1EF568E50;
        v483 = os_signpost_id_generate(v482);

        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v484 = (id)qword_1EF568E50;
        v485 = v484;
        v486 = v483 - 1;
        if (v483 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v484))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BE607000, v485, OS_SIGNPOST_INTERVAL_BEGIN, v483, "CHSessionTaskClutterFilter", ", buf, 2u);
        }

        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v487 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v487, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE607000, v487, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionTaskClutterFilter\", buf, 2u);
        }

        if ((objc_msgSend_cancelled(self, v488, v489, v490, v491, v492) & 1) != 0)
        {
          v2593 = 0;
        }
        else
        {
          if (objc_msgSend_isEmpty(v2612, v493, v494, v495, v496, v497)
            && !self->_subjectStrokeIdentifiers)
          {
            objc_msgSend_strokeProvider(self, v499, v500, v501, v502, v503);
            v505 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_orderedStrokes(v505, v784, v785, v786, v787, v788);
            v789 = (void *)objc_claimAutoreleasedReturnValue();
            v2689 = 0;
            objc_msgSend_clutterFilterByAddingStrokes_removingStrokeIdentifiers_affectedStrokeIdentifiers_(v2612, v790, (uint64_t)v789, 0, (uint64_t)&v2689, v791);
            v792 = objc_claimAutoreleasedReturnValue();
            v2593 = v2689;

            v2612 = (void *)v792;
          }
          else
          {
            v2688 = 0;
            objc_msgSend_clutterFilterByAddingStrokes_removingStrokeIdentifiers_affectedStrokeIdentifiers_(v2612, v499, (uint64_t)objc, (uint64_t)v2597, (uint64_t)&v2688, v503);
            v504 = objc_claimAutoreleasedReturnValue();
            v2593 = v2688;
            v505 = v2612;
            v2612 = (void *)v504;
          }

        }
        if (qword_1EF568E88 == -1)
        {
          v506 = (id)qword_1EF568E50;
          if (v486 > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_139;
        }
        else
        {
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v506 = (id)qword_1EF568E50;
          if (v486 > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_139;
        }
        if (os_signpost_enabled(v506))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BE607000, v506, OS_SIGNPOST_INTERVAL_END, v483, "CHSessionTaskClutterFilter", ", buf, 2u);
        }
LABEL_139:

        if (qword_1EF568E88 == -1)
        {
          v507 = (id)qword_1EF568E18[0];
          if (!os_log_type_enabled(v507, OS_LOG_TYPE_DEFAULT))
          {
LABEL_142:

            v498 = v2612;
            v469 = v2605;
LABEL_143:
            v2613 = v498;
            objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v475, v476, v477, v478, v479);
            v509 = v508;
            v515 = objc_msgSend_completedUnitCount(v469, v510, v511, v512, v513, v514);
            objc_msgSend_setCompletedUnitCount_(v469, v516, v515 + 5, v517, v518, v519);
            v2624 = v509 - v481;
            if ((objc_msgSend_cancelled(self, v520, v521, v522, v523, v524) & 1) == 0)
            {
              partialResultBlock = self;
              if (self)
                partialResultBlock = self->_partialResultBlock;
              v531 = partialResultBlock;
              v532 = v531 == 0;

              if (!v532)
              {
                objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v525, v526, v527, v528, v529);
                v534 = v533;
                v540 = (void *)objc_msgSend_copy(v2613, v535, v536, v537, v538, v539);
                v541 = [CHRecognitionSessionResult alloc];
                objc_msgSend_strokeProviderVersion(v2630, v542, v543, v544, v545, v546);
                v547 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_inputResult(self, v548, v549, v550, v551, v552);
                v553 = (void *)objc_claimAutoreleasedReturnValue();
                v559 = objc_msgSend_sessionMode(v553, v554, v555, v556, v557, v558);
                objc_msgSend_recognitionLocales(self, v560, v561, v562, v563, v564);
                v565 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_preferredLocales(self, v566, v567, v568, v569, v570);
                v571 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_calculateDocumentProvider(self, v572, v573, v574, v575, v576);
                v577 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_declaredVariables(v577, v578, v579, v580, v581, v582);
                v583 = (void *)objc_claimAutoreleasedReturnValue();
                v2685 = 0u;
                v2686 = 0u;
                v2684 = v2624;
                v2687 = v534 - v213;
                v589 = objc_msgSend_recognitionEnvironment(self, v584, v585, v586, v587, v588);
                v591 = (void *)objc_msgSend_initWithStrokeProviderVersion_encodedStrokeProviderVersion_orderedStrokeIdentifiers_sessionMode_locales_preferredLocales_declaredVariables_clutterFilter_strokeClassificationResult_strokeGroupingResult_rawStrokeGroupingResult_recognitionResults_rawRecognitionResults_inlineContinuousModeResults_autoRefineResult_generationDuration_recognitionEnvironment_(v541, v590, (uint64_t)v547, (uint64_t)v2596, (uint64_t)v2625, v559, v565, v571, v583, v540, 0, 0, 0, 0, 0, 0, 0, &v2684, v589);

                if (self)
                  v592 = self->_partialResultBlock;
                else
                  v592 = 0;
                v593 = (void (**)(id, void *))v592;
                v593[2](v593, v591);

              }
            }
            v594 = objc_msgSend_strokeGroupingRequirement(self, v525, v526, v527, v528, v529);
            if (v594)
            {
              if (v594 == 1)
              {
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v600 = (id)qword_1EF568E50;
                v601 = os_signpost_id_generate(v600);

                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v602 = (id)qword_1EF568E50;
                v603 = v602;
                if (v601 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v602))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1BE607000, v603, OS_SIGNPOST_INTERVAL_BEGIN, v601, "CHSessionStrokeGroupingFast", ", buf, 2u);
                }

                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v604 = (id)qword_1EF568E18[0];
                if (os_log_type_enabled(v604, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BE607000, v604, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionStrokeGroupingFast\", buf, 2u);
                }

                v610 = objc_msgSend_completedUnitCount(v2605, v605, v606, v607, v608, v609);
                objc_msgSend_setCompletedUnitCount_(v2605, v611, v610 + 10, v612, v613, v614);
                objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v615, v616, v617, v618, v619);
                v621 = v620;
                v622 = [CHFastStrokeGroupingStrategy alloc];
                v630 = objc_msgSend_initWithStrokeProvider_locales_clutterFilter_(v622, v623, (uint64_t)v2630, 0, (uint64_t)v2613, v624);
                if (self->_subjectStrokeIdentifiers)
                {
                  v634 = objc;
                }
                else
                {
                  objc_msgSend_strokeProvider(self, v625, v626, v627, v628, v629);
                  v767 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_orderedStrokes(v767, v768, v769, v770, v771, v772);
                  v634 = (id)objc_claimAutoreleasedReturnValue();

                }
                v2683[0] = MEMORY[0x1E0C809B0];
                v2683[1] = 3221225472;
                v2683[2] = sub_1BE791EE4;
                v2683[3] = &unk_1E77F4CA0;
                v2683[4] = self;
                objc_msgSend_lineGroupingResultUsingStrokes_shouldCancel_(v630, v631, (uint64_t)v634, (uint64_t)v2683, v632, v633);
                v773 = objc_claimAutoreleasedReturnValue();
                objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v774, v775, v776, v777, v778);
                v780 = v779;
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v2647 = (id)v773;
                v781 = (id)qword_1EF568E50;
                v782 = v781;
                if (v601 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v781))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1BE607000, v782, OS_SIGNPOST_INTERVAL_END, v601, "CHSessionStrokeGroupingFast", ", buf, 2u);
                }

                if (qword_1EF568E88 == -1)
                {
                  v783 = (id)qword_1EF568E18[0];
                  if (!os_log_type_enabled(v783, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_239:

                    v2614 = 0;
                    v2621 = v780 - v621;
                    v659 = 0.0;
                    goto LABEL_253;
                  }
                }
                else
                {
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                  v783 = (id)qword_1EF568E18[0];
                  if (!os_log_type_enabled(v783, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_239;
                }
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BE607000, v783, OS_LOG_TYPE_DEFAULT, "END \"CHSessionStrokeGroupingFast\", buf, 2u);
                goto LABEL_239;
              }
              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v630 = (id)qword_1EF568E28;
              v2621 = 0.0;
              if (os_log_type_enabled(v630, OS_LOG_TYPE_ERROR))
              {
                v658 = objc_msgSend_strokeGroupingRequirement(self, v653, v654, v655, v656, v657);
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v658;
                _os_log_impl(&dword_1BE607000, v630, OS_LOG_TYPE_ERROR, "Grouping algorithm not implemented: %ld", buf, 0xCu);
              }
              v2614 = 0;
              v2647 = 0;
              v659 = 0.0;
LABEL_253:

              v803 = objc_msgSend_completedUnitCount(v2605, v798, v799, v800, v801, v802);
              objc_msgSend_setCompletedUnitCount_(v2605, v804, v803 + 25, v805, v806, v807);
              objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v808, v809, v810, v811, v812);
              v814 = v813;
              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v815 = (id)qword_1EF568E50;
              spid = os_signpost_id_generate(v815);

              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v816 = (id)qword_1EF568E50;
              v817 = v816;
              if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v816))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1BE607000, v817, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHSessionTaskRecognition", ", buf, 2u);
              }

              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v818 = (id)qword_1EF568E18[0];
              if (os_log_type_enabled(v818, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BE607000, v818, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionTaskRecognition\", buf, 2u);
              }

              if ((objc_msgSend_cancelled(self, v819, v820, v821, v822, v823) & 1) != 0 || !v2647)
              {
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v874 = (id)qword_1EF568E28;
                if (os_log_type_enabled(v874, OS_LOG_TYPE_DEFAULT))
                {
                  v880 = objc_msgSend_cancelled(self, v875, v876, v877, v878, v879);
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v880;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v2647 != 0;
                  _os_log_impl(&dword_1BE607000, v874, OS_LOG_TYPE_DEFAULT, "No Candidate AutoRefine group: task cancelled ? %d, has stroke group result ? %d", buf, 0xEu);
                }
                v2609 = v2647;
                v2610 = 0;
                v2594 = 0;
                v2595 = 0;
                v2623 = 0;
                v2607 = 0;
              }
              else
              {
                v824 = v2647;
                v2637 = v824;
                v2616 = v2598;
                if (self)
                {
                  objc_msgSend_createdStrokeGroups(v824, v825, v826, v827, v828, v829);
                  v830 = (void *)objc_claimAutoreleasedReturnValue();
                  v2623 = (void *)objc_msgSend_mutableCopy(v830, v831, v832, v833, v834, v835);

                  objc_msgSend_forceRecognitionStrokeGroupIdentifiers(self, v836, v837, v838, v839, v840);
                  v2606 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v2606)
                  {
                    objc_msgSend_strokeGroups(v2637, v841, v842, v843, v844, v845);
                    v846 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_QWORD *)v2744 = MEMORY[0x1E0C809B0];
                    *(_QWORD *)&v2744[8] = 3221225472;
                    *(_QWORD *)&v2744[16] = sub_1BE7927D0;
                    *(_QWORD *)&v2744[24] = &unk_1E77F30C8;
                    *(_QWORD *)&v2745 = v2606;
                    objc_msgSend_objectsPassingTest_(v846, v847, (uint64_t)v2744, v848, v849, v850);
                    v851 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend_unionSet_(v2623, v852, (uint64_t)v851, v853, v854, v855);
                  }
                  objc_msgSend_inputResult(self, v841, v842, v843, v844, v845);
                  v856 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_declaredVariables(v856, v857, v858, v859, v860, v861);
                  v867 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v867)
                  {
                    objc_msgSend_inputResult(self, v862, v863, v864, v865, v866);
                    v868 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_declaredVariables(v868, v869, v870, v871, v872, v873);
                    v2608 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    objc_msgSend_set(MEMORY[0x1E0C99E60], v862, v863, v864, v865, v866);
                    v2608 = (void *)objc_claimAutoreleasedReturnValue();
                  }

                  objc_msgSend_calculateDocumentProvider(self, v881, v882, v883, v884, v885);
                  v886 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_declaredVariables(v886, v887, v888, v889, v890, v891);
                  v897 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v897)
                  {
                    objc_msgSend_calculateDocumentProvider(self, v892, v893, v894, v895, v896);
                    v898 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_declaredVariables(v898, v899, v900, v901, v902, v903);
                    v2611 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    objc_msgSend_set(MEMORY[0x1E0C99E60], v892, v893, v894, v895, v896);
                    v2611 = (void *)objc_claimAutoreleasedReturnValue();
                  }

                  objc_msgSend_calculateDocumentProvider(self, v904, v905, v906, v907, v908);
                  v2627 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_declaredVariables(v2627, v909, v910, v911, v912, v913);
                  v918 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v918)
                    goto LABEL_323;
                  isEqualToSet = objc_msgSend_isEqualToSet_(v2611, v914, (uint64_t)v2608, v915, v916, v917);

                  if ((isEqualToSet & 1) == 0)
                  {
                    objc_msgSend_calculateDocumentProvider(self, v920, v921, v922, v923, v924);
                    v925 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_declaredVariables(v925, v926, v927, v928, v929, v930);
                    v931 = (void *)objc_claimAutoreleasedReturnValue();
                    v2627 = (void *)objc_msgSend_mutableCopy(v931, v932, v933, v934, v935, v936);

                    objc_msgSend_inputResult(self, v937, v938, v939, v940, v941);
                    v942 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_declaredVariables(v942, v943, v944, v945, v946, v947);
                    v948 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_minusSet_(v2627, v949, (uint64_t)v948, v950, v951, v952);

                    objc_msgSend_inputResult(self, v953, v954, v955, v956, v957);
                    v958 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_declaredVariables(v958, v959, v960, v961, v962, v963);
                    v964 = (void *)objc_claimAutoreleasedReturnValue();
                    v2603 = (void *)objc_msgSend_mutableCopy(v964, v965, v966, v967, v968, v969);

                    objc_msgSend_calculateDocumentProvider(self, v970, v971, v972, v973, v974);
                    v975 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_declaredVariables(v975, v976, v977, v978, v979, v980);
                    v981 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_minusSet_(v2603, v982, (uint64_t)v981, v983, v984, v985);

                    objc_msgSend_setByAddingObjectsFromSet_(v2627, v986, (uint64_t)v2603, v987, v988, v989);
                    v990 = (void *)objc_claimAutoreleasedReturnValue();
                    v2653 = (void *)objc_msgSend_mutableCopy(v990, v991, v992, v993, v994, v995);

                    objc_msgSend_inputResult(self, v996, v997, v998, v999, v1000);
                    v1001 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_strokeGroupingResult(v1001, v1002, v1003, v1004, v1005, v1006);
                    v1007 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v1007, v1008, 3, 1, v1009, v1010);
                    v2658 = (void *)objc_claimAutoreleasedReturnValue();

                    v1016 = 0;
                    v1017 = 0x7FFFFFFFFFFFFFFFLL;
                    while (1)
                    {
                      if (v1016 >= objc_msgSend_count(v2658, v1011, v1012, v1013, v1014, v1015))
                      {
                        if (objc_msgSend_count(v2653, v1018, v1019, v1020, v1021, v1022))
                        {
                          memset(v2739, 0, sizeof(v2739));
                          memset(v2738, 0, sizeof(v2738));
                          objc_msgSend_strokeGroups(v2637, v1102, v1103, v1104, v1105, v1106);
                          v1107 = (void *)objc_claimAutoreleasedReturnValue();
                          v1110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1107, v1108, (uint64_t)v2738, (uint64_t)buf, 16, v1109);
                          if (v1110)
                          {
                            v1111 = **(_QWORD **)&v2738[16];
                            do
                            {
                              for (k = 0; k != v1110; ++k)
                              {
                                if (**(_QWORD **)&v2738[16] != v1111)
                                  objc_enumerationMutation(v1107);
                                v1113 = *(void **)(*(_QWORD *)&v2738[8] + 8 * k);
                                v1114 = (void *)objc_opt_class();
                                v1120 = objc_msgSend_classification(v1113, v1115, v1116, v1117, v1118, v1119);
                                if (objc_msgSend_isStrokeClassificationMath_(v1114, v1121, v1120, v1122, v1123, v1124))objc_msgSend_addObject_(v2623, v1125, (uint64_t)v1113, v1126, v1127, v1128);
                              }
                              v1110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1107, v1125, (uint64_t)v2738, (uint64_t)buf, 16, v1128);
                            }
                            while (v1110);
                          }
                          goto LABEL_321;
                        }
                        if (v1017 != 0x7FFFFFFFFFFFFFFFLL)
                        {
                          if (v1017 < 0)
                          {
LABEL_308:
                            v1107 = 0;
                          }
                          else
                          {
                            while (1)
                            {
                              objc_msgSend_objectAtIndexedSubscript_(v2658, v1102, v1017, v1104, v1105, v1106);
                              v1107 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_strokeGroups(v2637, v1129, v1130, v1131, v1132, v1133);
                              v1134 = (void *)objc_claimAutoreleasedReturnValue();
                              v1139 = objc_msgSend_containsObject_(v1134, v1135, (uint64_t)v1107, v1136, v1137, v1138);

                              if ((v1139 & 1) != 0)
                                break;

                              if (v1017-- <= 0)
                                goto LABEL_308;
                            }
                          }
                          objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v2637, v1102, 3, 1, v1105, v1106);
                          v1141 = (void *)objc_claimAutoreleasedReturnValue();
                          v1142 = v1107 == 0;
                          memset(v2739, 0, sizeof(v2739));
                          memset(v2738, 0, sizeof(v2738));
                          v1143 = v1141;
                          v1148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1143, v1144, (uint64_t)v2738, (uint64_t)buf, 16, v1145);
                          if (v1148)
                          {
                            v1149 = **(_QWORD **)&v2738[16];
                            do
                            {
                              for (m = 0; m != v1148; ++m)
                              {
                                while (1)
                                {
                                  if (**(_QWORD **)&v2738[16] != v1149)
                                    objc_enumerationMutation(v1143);
                                  v1151 = *(void **)(*(_QWORD *)&v2738[8] + 8 * m);
                                  if (v1142)
                                    break;
                                  v1142 = v1151 == v1107;
                                  if (v1148 == ++m)
                                    goto LABEL_319;
                                }
                                v1152 = (void *)objc_opt_class();
                                v1158 = objc_msgSend_classification(v1151, v1153, v1154, v1155, v1156, v1157);
                                if (objc_msgSend_isStrokeClassificationMath_(v1152, v1159, v1158, v1160, v1161, v1162))objc_msgSend_addObject_(v2623, v1146, (uint64_t)v1151, v1163, v1164, v1147);
                                v1142 = 1;
                              }
LABEL_319:
                              v1148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1143, v1146, (uint64_t)v2738, (uint64_t)buf, 16, v1147);
                            }
                            while (v1148);
                          }

LABEL_321:
                        }

LABEL_323:
                        break;
                      }
                      objc_msgSend_objectAtIndexedSubscript_(v2658, v1018, v1016, v1020, v1021, v1022);
                      v1023 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_inputResult(self, v1024, v1025, v1026, v1027, v1028);
                      v1029 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_recognitionResultsByGroupID(v1029, v1030, v1031, v1032, v1033, v1034);
                      v1035 = (void *)objc_claimAutoreleasedReturnValue();
                      v1036 = (void *)MEMORY[0x1E0CB37E8];
                      v1042 = objc_msgSend_uniqueIdentifier(v1023, v1037, v1038, v1039, v1040, v1041);
                      objc_msgSend_numberWithInteger_(v1036, v1043, v1042, v1044, v1045, v1046);
                      v1047 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_objectForKeyedSubscript_(v1035, v1048, (uint64_t)v1047, v1049, v1050, v1051);
                      v1052 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend_mathResult(v1052, v1053, v1054, v1055, v1056, v1057);
                      v1063 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v1063)
                      {
                        objc_msgSend_mathResult(v1052, v1058, v1059, v1060, v1061, v1062);
                        v1064 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_declaredVariable(v1064, v1065, v1066, v1067, v1068, v1069);
                        v1075 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v1075)
                        {
                          objc_msgSend_mathResult(v1052, v1070, v1071, v1072, v1073, v1074);
                          v1076 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_declaredVariable(v1076, v1077, v1078, v1079, v1080, v1081);
                          v1082 = (void *)objc_claimAutoreleasedReturnValue();
                          v1087 = objc_msgSend_containsObject_(v2653, v1083, (uint64_t)v1082, v1084, v1085, v1086);

                          if (!v1087)
                            goto LABEL_291;
                          if (v1017 == 0x7FFFFFFFFFFFFFFFLL)
                            v1017 = v1016;
                          objc_msgSend_mathResult(v1052, v1088, v1089, v1090, v1091, v1092);
                          v1063 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_declaredVariable(v1063, v1093, v1094, v1095, v1096, v1097);
                          v1064 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_removeObject_(v2653, v1098, (uint64_t)v1064, v1099, v1100, v1101);
                        }

                      }
LABEL_291:

                      ++v1016;
                    }
                  }
                  objc_msgSend_calculateDocumentProvider(self, v920, v921, v922, v923, v924);
                  v1165 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_declaredVariables(v1165, v1166, v1167, v1168, v1169, v1170);
                  v1171 = (void *)objc_claimAutoreleasedReturnValue();
                  v1172 = v1171 == 0;

                  if (v1172)
                  {
                    v2737 = 0u;
                    v2736 = 0u;
                    v2735 = 0u;
                    v2734 = 0u;
                    objc_msgSend_inputResult(self, v1173, v1174, v1175, v1176, v1177);
                    v1178 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_strokeGroupingResult(v1178, v1179, v1180, v1181, v1182, v1183);
                    v1184 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_strokeGroups(v1184, v1185, v1186, v1187, v1188, v1189);
                    v1190 = (void *)objc_claimAutoreleasedReturnValue();

                    v1198 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1190, v1191, (uint64_t)&v2734, (uint64_t)&v2740, 16, v1192);
                    if (v1198)
                    {
                      v1199 = *(_QWORD *)v2735;
                      do
                      {
                        for (n = 0; n != v1198; ++n)
                        {
                          if (*(_QWORD *)v2735 != v1199)
                            objc_enumerationMutation(v1190);
                          v1201 = *(void **)(*((_QWORD *)&v2734 + 1) + 8 * n);
                          objc_msgSend_inputResult(self, v1193, v1194, v1195, v1196, v1197);
                          v1202 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_recognitionResultsByGroupID(v1202, v1203, v1204, v1205, v1206, v1207);
                          v1208 = (void *)objc_claimAutoreleasedReturnValue();
                          v1209 = (void *)MEMORY[0x1E0CB37E8];
                          v1215 = objc_msgSend_uniqueIdentifier(v1201, v1210, v1211, v1212, v1213, v1214);
                          objc_msgSend_numberWithInteger_(v1209, v1216, v1215, v1217, v1218, v1219);
                          v1220 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_objectForKeyedSubscript_(v1208, v1221, (uint64_t)v1220, v1222, v1223, v1224);
                          v1225 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend_mathResult(v1225, v1226, v1227, v1228, v1229, v1230);
                          v1236 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v1236)
                          {
                            objc_msgSend_mathResult(v1225, v1231, v1232, v1233, v1234, v1235);
                            v1237 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend_declaredVariable(v1237, v1238, v1239, v1240, v1241, v1242);
                            v1243 = (void *)objc_claimAutoreleasedReturnValue();
                            v1244 = v1243 == 0;

                            if (!v1244)
                            {
                              intermediateDeclaredVariables = self->_intermediateDeclaredVariables;
                              objc_msgSend_mathResult(v1225, v1245, v1246, v1247, v1248, v1249);
                              v1251 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_declaredVariable(v1251, v1252, v1253, v1254, v1255, v1256);
                              v1257 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_addObject_(intermediateDeclaredVariables, v1258, (uint64_t)v1257, v1259, v1260, v1261);

                            }
                          }

                        }
                        v1198 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1190, v1193, (uint64_t)&v2734, (uint64_t)&v2740, 16, v1197);
                      }
                      while (v1198);
                    }

                  }
                }
                else
                {
                  v2623 = 0;
                }

                v2677 = 0;
                objc_msgSend_recognitionResultsForGroupingResult_groupingManager_strokeGroupsToProcess_strokeClassificationResult_strokeGroupReplacements_(self, v1262, (uint64_t)v2637, (uint64_t)v2616, (uint64_t)v2623, (uint64_t)v2614, &v2677);
                v1263 = objc_claimAutoreleasedReturnValue();
                v1264 = v2677;
                objc_msgSend_textCorrectionResultsForGroupingResult_groupingManager_(self, v1265, (uint64_t)v2637, (uint64_t)v2616, v1266, v1267);
                v1268 = objc_claimAutoreleasedReturnValue();
                objc_msgSend_groupingResultUpdatedWithGroupReplacements_(v2637, v1269, (uint64_t)v1264, v1270, v1271, v1272);
                v2609 = (void *)objc_claimAutoreleasedReturnValue();
                v2594 = (void *)v1268;
                v2595 = v1264;
                v2610 = (void *)v1263;

                if (!self->_wantsAutoRefine && self->_inputResult)
                {
                  v2607 = 0;
                  goto LABEL_357;
                }
                if (objc_msgSend_count(v2623, v1273, v1274, v1275, v1276, v1277) == 1)
                {
                  objc_msgSend_anyObject(v2623, v1278, v1279, v1280, v1281, v1282);
                  v874 = objc_claimAutoreleasedReturnValue();
                  v1283 = (void *)objc_opt_class();
                  v1289 = objc_msgSend_classification(v874, v1284, v1285, v1286, v1287, v1288);
                  if (objc_msgSend_isStrokeClassificationTextOrMath_(v1283, v1290, v1289, v1291, v1292, v1293))
                  {
                    v1294 = v874;
                    v1295 = (void *)MEMORY[0x1E0CB37E8];
                    v2607 = v1294;
                    v1301 = objc_msgSend_uniqueIdentifier(v1294, v1296, v1297, v1298, v1299, v1300);
                    objc_msgSend_numberWithInteger_(v1295, v1302, v1301, v1303, v1304, v1305);
                    v1306 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v1264, v1307, (uint64_t)v1306, v1308, v1309, v1310);
                    v1311 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v1311)
                    {
                      v1312 = v1311;

                      CHOSLogForCategory(2);
                      v1313 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v1313, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend_strokeIdentifiers(v1312, v1314, v1315, v1316, v1317, v1318);
                        v1319 = (void *)objc_claimAutoreleasedReturnValue();
                        v1325 = objc_msgSend_count(v1319, v1320, v1321, v1322, v1323, v1324);
                        *(_DWORD *)buf = 134217984;
                        *(_QWORD *)&buf[4] = v1325;
                        _os_log_impl(&dword_1BE607000, v1313, OS_LOG_TYPE_DEFAULT, "Candidate AutoRefine created with %ld strokes.", buf, 0xCu);

                      }
                      v2607 = v1312;
                    }
                    else
                    {
                      v1312 = 0;
                    }
                  }
                  else
                  {
                    CHOSLogForCategory(2);
                    v1312 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v1312, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1BE607000, v1312, OS_LOG_TYPE_DEFAULT, "No Candidate AutoRefine group: number of groups to process is 1 but it is not a text group", buf, 2u);
                    }
                    v2607 = 0;
                  }

                }
                else
                {
                  if (qword_1EF568E88 != -1)
                    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                  v874 = (id)qword_1EF568E28;
                  if (os_log_type_enabled(v874, OS_LOG_TYPE_DEFAULT))
                  {
                    v1331 = objc_msgSend_count(v2623, v1326, v1327, v1328, v1329, v1330);
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)&buf[4] = v1331;
                    _os_log_impl(&dword_1BE607000, v874, OS_LOG_TYPE_DEFAULT, "No Candidate AutoRefine group: number of groups to process is %ld", buf, 0xCu);
                  }
                  v2607 = 0;
                }
              }

LABEL_357:
              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v1332 = (id)qword_1EF568E50;
              v1333 = v1332;
              if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v1332))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1BE607000, v1333, OS_SIGNPOST_INTERVAL_END, spid, "CHSessionTaskRecognition", ", buf, 2u);
              }

              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v1334 = (id)qword_1EF568E18[0];
              if (os_log_type_enabled(v1334, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BE607000, v1334, OS_LOG_TYPE_DEFAULT, "END \"CHSessionTaskRecognition\", buf, 2u);
              }

              objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v1335, v1336, v1337, v1338, v1339);
              v1341 = v1340;
              objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v1342, v1343, v1344, v1345, v1346);
              v1347 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_floatForKey_(v1347, v1348, (uint64_t)CFSTR("CHRecognitionTaskOverhead"), v1349, v1350, v1351);
              v1353 = v1352;

              if (v1353 > 0.0)
              {
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v1359 = (id)qword_1EF568E28;
                v1360 = v1353;
                if (os_log_type_enabled(v1359, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  *(double *)&buf[4] = v1360;
                  _os_log_impl(&dword_1BE607000, v1359, OS_LOG_TYPE_DEFAULT, "Recognition task almost finished, waiting for explicit overhead of %0.1fs.", buf, 0xCu);
                }

                objc_msgSend_sleepForTimeInterval_(MEMORY[0x1E0CB3978], v1361, v1362, v1363, v1364, v1365, v1360);
              }
              v1366 = objc_msgSend_cancelled(self, v1354, v1355, v1356, v1357, v1358);
              if (v2602)
                v1367 = v1366;
              else
                v1367 = 1;
              if ((v1367 & 1) != 0)
              {
                v2628 = v2609;
                v2659 = v2610;
              }
              else
              {
                v1373 = [CHGroupingAndRecognitionResults alloc];
                objc_msgSend_strokeGroupingResult(v2620, v1374, v1375, v1376, v1377, v1378);
                v1379 = (void *)objc_claimAutoreleasedReturnValue();
                v1380 = (void *)MEMORY[0x1E0C99E60];
                objc_msgSend_allKeys(v2595, v1381, v1382, v1383, v1384, v1385);
                v1386 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setWithArray_(v1380, v1387, (uint64_t)v1386, v1388, v1389, v1390);
                v1391 = (void *)objc_claimAutoreleasedReturnValue();
                v1393 = (void *)objc_msgSend_initWithGroupingResult_recognitionResultsByGroupID_strokeClassificationResult_previousProcessedStrokeGroupingResult_strokeGroupReplacements_(v1373, v1392, (uint64_t)v2609, (uint64_t)v2610, (uint64_t)v2614, (uint64_t)v1379, v1391);

                objc_msgSend_recognitionOptions(self, v1394, v1395, v1396, v1397, v1398);
                v1399 = (void *)objc_claimAutoreleasedReturnValue();
                v1405 = (void *)objc_msgSend_mutableCopy(v1399, v1400, v1401, v1402, v1403, v1404);

                objc_msgSend_recognitionLocales(self, v1406, v1407, v1408, v1409, v1410);
                v1411 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v1405, v1412, (uint64_t)v1411, (uint64_t)CHMathPostProcessingOptionLocales, v1413, v1414);

                objc_msgSend_process_options_(v2602, v1415, (uint64_t)v1393, (uint64_t)v1405, v1416, v1417);
                v1418 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_strokeGroupingResult(v1418, v1419, v1420, v1421, v1422, v1423);
                v1424 = objc_claimAutoreleasedReturnValue();
                objc_msgSend_recognitionResultsByGroupID(v1418, v1425, v1426, v1427, v1428, v1429);
                v2659 = (id)objc_claimAutoreleasedReturnValue();
                v2628 = (id)v1424;

              }
              objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v1368, v1369, v1370, v1371, v1372);
              v1431 = v1430;
              if ((objc_msgSend_cancelled(self, v1432, v1433, v1434, v1435, v1436) & 1) != 0
                || objc_msgSend_principalLineRequirement(self, v1437, v1438, v1439, v1440, v1441) != 2)
              {
                v2654 = v2659;
              }
              else
              {
                v1442 = (void *)objc_msgSend_mutableCopy(v2659, v1437, v1438, v1439, v1440, v1441);
                v2675 = 0u;
                v2676 = 0u;
                v2673 = 0u;
                v2674 = 0u;
                objc_msgSend_strokeGroups(v2628, v1443, v1444, v1445, v1446, v1447);
                v1448 = (void *)objc_claimAutoreleasedReturnValue();
                v1449 = v1448;
                v1457 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1448, v1450, (uint64_t)&v2673, (uint64_t)v2718, 16, v1451);
                if (v1457)
                {
                  v1458 = *(_QWORD *)v2674;
                  do
                  {
                    for (ii = 0; ii != v1457; ++ii)
                    {
                      if (*(_QWORD *)v2674 != v1458)
                        objc_enumerationMutation(v1449);
                      v1460 = *(void **)(*((_QWORD *)&v2673 + 1) + 8 * ii);
                      if (objc_msgSend_classification(v1460, v1452, v1453, v1454, v1455, v1456) == 1
                        || objc_msgSend_classification(v1460, v1452, v1453, v1454, v1455, v1456) == 2)
                      {
                        v1461 = (void *)MEMORY[0x1E0CB37E8];
                        v1462 = objc_msgSend_uniqueIdentifier(v1460, v1452, v1453, v1454, v1455, v1456);
                        objc_msgSend_numberWithInteger_(v1461, v1463, v1462, v1464, v1465, v1466);
                        v1467 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_objectForKeyedSubscript_(v2659, v1468, (uint64_t)v1467, v1469, v1470, v1471);
                        v1472 = (void *)objc_claimAutoreleasedReturnValue();

                        sub_1BE791F14(self, v1460, v1472);
                        v1473 = (void *)objc_claimAutoreleasedReturnValue();
                        v1474 = (void *)MEMORY[0x1E0CB37E8];
                        v1480 = objc_msgSend_uniqueIdentifier(v1460, v1475, v1476, v1477, v1478, v1479);
                        objc_msgSend_numberWithInteger_(v1474, v1481, v1480, v1482, v1483, v1484);
                        v1485 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_setObject_forKeyedSubscript_(v1442, v1486, (uint64_t)v1473, (uint64_t)v1485, v1487, v1488);

                      }
                    }
                    v1448 = v1449;
                    v1457 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1449, v1452, (uint64_t)&v2673, (uint64_t)v2718, 16, v1456);
                  }
                  while (v1457);
                }

                v2654 = v1442;
              }
              objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v1437, v1438, v1439, v1440, v1441);
              v1495 = v1494;
              if (!v2607)
              {
                v2604 = 0;
                goto LABEL_428;
              }
              objc_msgSend_autoRefineTriggerFactor(CHRecognitionSession, v1489, v1490, v1491, v1492, v1493);
              v1497 = v1496;
              v1498 = (void *)MEMORY[0x1E0CB37E8];
              v1504 = objc_msgSend_uniqueIdentifier(v2607, v1499, v1500, v1501, v1502, v1503);
              objc_msgSend_numberWithInteger_(v1498, v1505, v1504, v1506, v1507, v1508);
              v1509 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v2610, v1510, (uint64_t)v1509, v1511, v1512, v1513);
              v2648 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend_preferredLocale(v2648, v1514, v1515, v1516, v1517, v1518);
              spida = (void *)objc_claimAutoreleasedReturnValue();
              isSupportedLatinScriptLocale_withMode = objc_msgSend_isSupportedLatinScriptLocale_withMode_(CHRecognizerConfiguration, v1519, (uint64_t)spida, 6, v1520, v1521);
              objc_msgSend_strokeIdentifiers(v2607, v1523, v1524, v1525, v1526, v1527);
              v1528 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_allObjects(v1528, v1529, v1530, v1531, v1532, v1533);
              v1534 = (void *)objc_claimAutoreleasedReturnValue();
              v1535 = v1497 * 0.5;
              v1536 = v1535;
              isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold = objc_msgSend_isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold_(v2614, v1537, (uint64_t)v1534, (uint64_t)&unk_1E7829138, v1538, v1539, v1535);

              objc_msgSend_recognitionResultsByLocale(v2648, v1541, v1542, v1543, v1544, v1545);
              v1546 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v1546, v1547, (uint64_t)spida, v1548, v1549, v1550);
              v2660 = (CHMutableTokenizedTextResult *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_rawTranscription(v2660, v1551, v1552, v1553, v1554, v1555);
              v1556 = (void *)objc_claimAutoreleasedReturnValue();
              v1562 = objc_msgSend_length(v1556, v1557, v1558, v1559, v1560, v1561);

              if (((objc_msgSend_isCandidateMathGroup(v2648, v1563, v1564, v1565, v1566, v1567) | isSupportedLatinScriptLocale_withMode ^ 1) & 1) != 0
                || ((isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold ^ 1) & 1) != 0
                || v1562 < 2)
              {
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v1617 = (id)qword_1EF568E28;
                if (os_log_type_enabled(v1617, OS_LOG_TYPE_DEFAULT))
                {
                  isCandidateMathGroup = objc_msgSend_isCandidateMathGroup(v2648, v1618, v1619, v1620, v1621, v1622);
                  v1624 = v1562 < 2;
                  objc_msgSend_recognitionResultsByLocale(v2648, v1625, v1626, v1627, v1628, v1629);
                  v1630 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_preferredLocale(v2648, v1631, v1632, v1633, v1634, v1635);
                  v1636 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v1630, v1637, (uint64_t)v1636, v1638, v1639, v1640);
                  v1641 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_rawTranscription(v1641, v1642, v1643, v1644, v1645, v1646);
                  v1647 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 67110403;
                  *(_DWORD *)&buf[4] = isCandidateMathGroup;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = isSupportedLatinScriptLocale_withMode;
                  *(_WORD *)&buf[14] = 1024;
                  *(_DWORD *)&buf[16] = isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold;
                  *(_WORD *)&buf[20] = 2048;
                  *(double *)&buf[22] = v1536;
                  *(_WORD *)&buf[30] = 1024;
                  LODWORD(v2748) = v1624;
                  WORD2(v2748) = 2117;
                  *(_QWORD *)((char *)&v2748 + 6) = v1647;
                  _os_log_impl(&dword_1BE607000, v1617, OS_LOG_TYPE_DEFAULT, "AutoRefine group rejected: math candidate ? %d, isLatinPrefered ? %d, isHighConfidenceLatin ? %d (threshold = %.2f), isTextTooShort ? %d, text = %{sensitive}@", buf, 0x2Eu);

                }
                objc_msgSend_recognitionResultsByLocale(v2648, v1648, v1649, v1650, v1651, v1652);
                v1653 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_preferredLocale(v2648, v1654, v1655, v1656, v1657, v1658);
                v1659 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v1653, v1660, (uint64_t)v1659, v1661, v1662, v1663);
                v1664 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_rawTranscription(v1664, v1665, v1666, v1667, v1668, v1669);
                v1670 = (void *)objc_claimAutoreleasedReturnValue();
                v1671 = v1670 == 0;

                if (!v1671)
                {
                  v2604 = 0;
LABEL_427:

LABEL_428:
                  logb = v2654;
                  v1874 = objc_msgSend_cancelled(self, v1489, v1490, v1491, v1492, v1493);
                  if (self)
                    v1880 = v1874;
                  else
                    v1880 = 1;
                  if ((v1880 & 1) == 0 && self->_allowContributionToStyle)
                  {
                    objc_msgSend_createdStrokeGroups(v2628, v1875, v1876, v1877, v1878, v1879);
                    v1881 = (void *)objc_claimAutoreleasedReturnValue();
                    v2655 = v2654;
                    v2663 = v2614;
                    v2600 = v1881;
                    v2619 = v2597;
                    if ((CHHasPersonalizedSynthesisSupport() & 1) != 0)
                    {
                      objc_msgSend_delegate(self, v1882, v1883, v1884, v1885, v1886);
                      v1887 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_textSynthesizer(v1887, v1888, v1889, v1890, v1891, v1892);
                      v1893 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      isKindOfClass = objc_opt_isKindOfClass();

                      if ((isKindOfClass & 1) != 0)
                      {
                        objc_msgSend_delegate(self, v1895, v1896, v1897, v1898, v1899);
                        v1900 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_textSynthesizer(v1900, v1901, v1902, v1903, v1904, v1905);
                        spidb = (void *)objc_claimAutoreleasedReturnValue();

                        sessionMode = self->_sessionMode;
                        if (objc_msgSend_count(v2619, v1906, v1907, v1908, v1909, v1910))
                        {
                          v1916 = (void *)MEMORY[0x1E0C99E20];
                          v1917 = objc_msgSend_count(v2619, v1911, v1912, v1913, v1914, v1915);
                          objc_msgSend_setWithCapacity_(v1916, v1918, v1917, v1919, v1920, v1921);
                          v1922 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_QWORD *)v2738 = MEMORY[0x1E0C809B0];
                          *(_QWORD *)&v2738[8] = 3221225472;
                          *(_QWORD *)&v2738[16] = sub_1BE79A388;
                          *(_QWORD *)&v2738[24] = &unk_1E77F4E48;
                          v1923 = v1922;
                          *(_QWORD *)&v2739[0] = v1923;
                          objc_msgSend_enumerateObjectsUsingBlock_(v2619, v1924, (uint64_t)v2738, v1925, v1926, v1927);
                          objc_msgSend_updateStyleInventoryWithRemovedStrokeIdentifiers_error_(spidb, v1928, (uint64_t)v1923, 0, v1929, v1930);

                        }
                        v2743 = 0u;
                        v2742 = 0u;
                        v2741 = 0u;
                        v2740 = 0u;
                        v2649 = v2600;
                        v1938 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2649, v1931, (uint64_t)&v2740, (uint64_t)buf, 16, v1932);
                        if (v1938)
                        {
                          v1939 = *(_QWORD *)v2741;
                          do
                          {
                            for (jj = 0; jj != v1938; ++jj)
                            {
                              if (*(_QWORD *)v2741 != v1939)
                                objc_enumerationMutation(v2649);
                              v1941 = *(void **)(*((_QWORD *)&v2740 + 1) + 8 * jj);
                              v1942 = (void *)MEMORY[0x1E0CB37E8];
                              v1943 = objc_msgSend_uniqueIdentifier(v1941, v1933, v1934, v1935, v1936, v1937);
                              objc_msgSend_numberWithInteger_(v1942, v1944, v1943, v1945, v1946, v1947);
                              v1948 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_objectForKey_(v2655, v1949, (uint64_t)v1948, v1950, v1951, v1952);
                              v1953 = (void *)objc_claimAutoreleasedReturnValue();

                              objc_msgSend_delegate(self, v1954, v1955, v1956, v1957, v1958);
                              v1959 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_textSynthesizer(v1959, v1960, v1961, v1962, v1963, v1964);
                              v1965 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_strokeProvider(self, v1966, v1967, v1968, v1969, v1970);
                              v1971 = (void *)objc_claimAutoreleasedReturnValue();
                              isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes = objc_msgSend_isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes_(CHRecognitionSessionTask, v1972, (uint64_t)v1941, (uint64_t)v1965, (uint64_t)v1971, (uint64_t)v1953, v2663, 0);

                              if ((isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes & 1) != 0)
                              {
                                objc_msgSend_mathResult(v1953, v1974, v1975, v1976, v1977, v1978);
                                v1979 = (void *)objc_claimAutoreleasedReturnValue();
                                v1980 = v1979 == 0;

                                if (v1980)
                                {
                                  objc_msgSend_preferredLocale(v1953, v1981, v1982, v1983, v1984, v1985);
                                  v1987 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend_recognitionResultsByLocale(v1953, v1988, v1989, v1990, v1991, v1992);
                                  v1993 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend_objectForKeyedSubscript_(v1993, v1994, (uint64_t)v1987, v1995, v1996, v1997);
                                  v1986 = (void *)objc_claimAutoreleasedReturnValue();

                                }
                                else
                                {
                                  objc_msgSend_mathResult(v1953, v1981, v1982, v1983, v1984, v1985);
                                  v1986 = (void *)objc_claimAutoreleasedReturnValue();
                                }
                                v1998 = [CHStrokeGroupingManager alloc];
                                objc_msgSend_strokeProvider(self, v1999, v2000, v2001, v2002, v2003);
                                v2004 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_recognitionResultsByLocale(v1953, v2005, v2006, v2007, v2008, v2009);
                                v2010 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_allKeys(v2010, v2011, v2012, v2013, v2014, v2015);
                                v2016 = (void *)objc_claimAutoreleasedReturnValue();
                                LOBYTE(v2591) = sessionMode == 2;
                                isMathMode = (void *)objc_msgSend_initWithStrokeProvider_sessionLastResult_strokeGroupingModel_locales_isInlineContinuousMode_inlineContinuousModeTargets_isMathMode_(v1998, v2017, (uint64_t)v2004, 0, 0, (uint64_t)v2016, 0, 0, v2591);

                                *(_QWORD *)v2744 = 0;
                                objc_msgSend_recognizableDrawingForStrokeGroup_translationVector_originalDrawing_orderedStrokesIDs_rescalingFactor_replacementStrokeGroup_(isMathMode, v2019, (uint64_t)v1941, 0, (uint64_t)v2744, 0, 0, 0.0, 0.0);
                                v2020 = (void *)objc_claimAutoreleasedReturnValue();
                                v2021 = *(id *)v2744;
                                v2022 = (void *)MEMORY[0x1E0C99DE8];
                                v2028 = objc_msgSend_strokeCount(v2020, v2023, v2024, v2025, v2026, v2027);
                                objc_msgSend_arrayWithCapacity_(v2022, v2029, v2028, v2030, v2031, v2032);
                                v2033 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_QWORD *)&v2734 = MEMORY[0x1E0C809B0];
                                *((_QWORD *)&v2734 + 1) = 3221225472;
                                *(_QWORD *)&v2735 = sub_1BE79A3E0;
                                *((_QWORD *)&v2735 + 1) = &unk_1E77F4E70;
                                v2034 = v2033;
                                *(_QWORD *)&v2736 = v2034;
                                objc_msgSend_enumerateObjectsUsingBlock_(v2021, v2035, (uint64_t)&v2734, v2036, v2037, v2038);
                                objc_msgSend_populateStyleInventoryWithTokenizedResult_drawing_strokeIdentifiers_error_(spidb, v2039, (uint64_t)v1986, (uint64_t)v2020, (uint64_t)v2034, 0);

                              }
                            }
                            v1938 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2649, v1933, (uint64_t)&v2740, (uint64_t)buf, 16, v1937);
                          }
                          while (v1938);
                        }

                      }
                    }

                    objc_msgSend_autoRefineResult(v2620, v2040, v2041, v2042, v2043, v2044);
                    v2045 = (void *)objc_claimAutoreleasedReturnValue();
                    v2046 = v2604;
                    v2047 = v2045;
                    v2048 = v2663;
                    v2049 = v2619;
                    if ((CHHasPersonalizedSynthesisSupport() & 1) != 0)
                    {
                      objc_msgSend_delegate(self, v2050, v2051, v2052, v2053, v2054);
                      v2055 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_textSynthesizer(v2055, v2056, v2057, v2058, v2059, v2060);
                      v2061 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      v2062 = objc_opt_isKindOfClass();

                      if ((v2062 & 1) != 0)
                      {
                        objc_msgSend_delegate(self, v2063, v2064, v2065, v2066, v2067);
                        v2068 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_textSynthesizer(v2068, v2069, v2070, v2071, v2072, v2073);
                        v2664 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend_strokeGroup(v2046, v2074, v2075, v2076, v2077, v2078);
                        v2079 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_delegate(self, v2080, v2081, v2082, v2083, v2084);
                        v2085 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_textSynthesizer(v2085, v2086, v2087, v2088, v2089, v2090);
                        v2091 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_strokeProvider(self, v2092, v2093, v2094, v2095, v2096);
                        v2097 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_strokeGroupResult(v2046, v2098, v2099, v2100, v2101, v2102);
                        v2103 = (void *)objc_claimAutoreleasedReturnValue();
                        v2105 = objc_msgSend_isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes_(CHRecognitionSessionTask, v2104, (uint64_t)v2079, (uint64_t)v2091, (uint64_t)v2097, (uint64_t)v2103, v2048, 1);

                        if ((v2105 & 1) != 0)
                        {
                          objc_msgSend_textResult(v2047, v2106, v2107, v2108, v2109, v2110);
                          v2111 = (void *)objc_claimAutoreleasedReturnValue();
                          v2117 = objc_msgSend_tokenColumnCount(v2111, v2112, v2113, v2114, v2115, v2116);
                          objc_msgSend_textResult(v2046, v2118, v2119, v2120, v2121, v2122);
                          v2123 = (void *)objc_claimAutoreleasedReturnValue();
                          LODWORD(v2117) = v2117 > objc_msgSend_tokenColumnCount(v2123, v2124, v2125, v2126, v2127, v2128);

                          if ((_DWORD)v2117)
                          {
                            if (qword_1EF568E88 != -1)
                              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                            v2134 = (id)qword_1EF568E28;
                            if (os_log_type_enabled(v2134, OS_LOG_TYPE_DEBUG))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_impl(&dword_1BE607000, v2134, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: (autorefine) rejecting group for incompatible column count with previous result", buf, 2u);
                            }
                          }
                          else
                          {
                            objc_msgSend_textResult(v2047, v2129, v2130, v2131, v2132, v2133);
                            v2135 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                            *(_QWORD *)&buf[8] = 3221225472;
                            *(_QWORD *)&buf[16] = sub_1BE79A438;
                            *(_QWORD *)&buf[24] = &unk_1E77F4E98;
                            *(_QWORD *)&v2748 = v2047;
                            *((_QWORD *)&v2748 + 1) = v2049;
                            v2749 = v2046;
                            v2750 = self;
                            v2751 = v2664;
                            objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v2135, v2136, (uint64_t)buf, v2137, v2138, v2139);

                            v2134 = v2748;
                          }

                        }
                      }
                    }

                  }
                  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v1875, v1876, v1877, v1878, v1879);
                  v2141 = v2140;
                  if ((objc_msgSend_cancelled(self, v2142, v2143, v2144, v2145, v2146) & 1) != 0)
                  {
                    v2615 = 0;
                  }
                  else
                  {
                    if (!v2609)
                    {
                      if (qword_1EF568E88 != -1)
                        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                      v2147 = (id)qword_1EF568E18[0];
                      if (os_log_type_enabled(v2147, OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1BE607000, v2147, OS_LOG_TYPE_FAULT, "strokeGroupingResult cannot be nil for a non-cancelled task.", buf, 2u);
                      }

                    }
                    v2148 = [CHRecognitionSessionResult alloc];
                    objc_msgSend_strokeProviderVersion(v2630, v2149, v2150, v2151, v2152, v2153);
                    v2154 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_inputResult(self, v2155, v2156, v2157, v2158, v2159);
                    v2160 = (void *)objc_claimAutoreleasedReturnValue();
                    v2166 = objc_msgSend_sessionMode(v2160, v2161, v2162, v2163, v2164, v2165);
                    objc_msgSend_recognitionLocales(self, v2167, v2168, v2169, v2170, v2171);
                    v2172 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_preferredLocales(self, v2173, v2174, v2175, v2176, v2177);
                    v2178 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_calculateDocumentProvider(self, v2179, v2180, v2181, v2182, v2183);
                    v2184 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_declaredVariables(v2184, v2185, v2186, v2187, v2188, v2189);
                    v2190 = (void *)objc_claimAutoreleasedReturnValue();
                    *(double *)v2672 = v2624;
                    *(double *)&v2672[1] = v659;
                    *(double *)&v2672[2] = v2621;
                    *(double *)&v2672[3] = v1341 - v814;
                    *(double *)&v2672[4] = v1495 - v1431;
                    *(double *)&v2672[5] = v2141 - v213;
                    v2196 = objc_msgSend_recognitionEnvironment(self, v2191, v2192, v2193, v2194, v2195);
                    v2615 = (id)objc_msgSend_initWithStrokeProviderVersion_encodedStrokeProviderVersion_orderedStrokeIdentifiers_sessionMode_locales_preferredLocales_declaredVariables_clutterFilter_strokeClassificationResult_strokeGroupingResult_rawStrokeGroupingResult_recognitionResults_rawRecognitionResults_inlineContinuousModeResults_autoRefineResult_generationDuration_recognitionEnvironment_(v2148, v2197, (uint64_t)v2154, (uint64_t)v2596, (uint64_t)v2625, v2166, v2172, v2178, v2190, v2613, v2614, v2628, v2609, logb, v2610, v2594, v2604, v2672, v2196);

                  }
                  sub_1BE7922D4((uint64_t)self, v2609, v2610, CFSTR("Raw"));
                  sub_1BE7922D4((uint64_t)self, v2628, logb, CFSTR("Processed"));
                  objc_msgSend_recognitionResultsByGroupID(v2620, v2198, v2199, v2200, v2201, v2202);
                  v2203 = (void *)objc_claimAutoreleasedReturnValue();
                  v2629 = v2628;
                  v2656 = logb;
                  spidc = v2203;
                  v2601 = objc;
                  v2622 = v2597;
                  if (self && os_variant_has_internal_diagnostics())
                  {
                    objc_msgSend_set(MEMORY[0x1E0C99E20], v2204, v2205, v2206, v2207, v2208);
                    v2665 = (void *)objc_claimAutoreleasedReturnValue();
                    v2746 = 0u;
                    v2745 = 0u;
                    memset(v2744, 0, sizeof(v2744));
                    v2209 = v2601;
                    v2217 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2209, v2210, (uint64_t)v2744, (uint64_t)buf, 16, v2211);
                    if (v2217)
                    {
                      v2218 = **(_QWORD **)&v2744[16];
                      do
                      {
                        for (kk = 0; kk != v2217; ++kk)
                        {
                          if (**(_QWORD **)&v2744[16] != v2218)
                            objc_enumerationMutation(v2209);
                          objc_msgSend_encodedStrokeIdentifier(*(void **)(*(_QWORD *)&v2744[8] + 8 * kk), v2212, v2213, v2214, v2215, v2216);
                          v2220 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_addObject_(v2665, v2221, (uint64_t)v2220, v2222, v2223, v2224);

                        }
                        v2217 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2209, v2212, (uint64_t)v2744, (uint64_t)buf, 16, v2216);
                      }
                      while (v2217);
                    }

                    v2717 = 0u;
                    v2716 = 0u;
                    v2715 = 0u;
                    v2714 = 0u;
                    objc_msgSend_createdStrokeGroups(v2629, v2225, v2226, v2227, v2228, v2229);
                    v2230 = (void *)objc_claimAutoreleasedReturnValue();
                    v2650 = v2230;
                    v2238 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2230, v2231, (uint64_t)&v2714, (uint64_t)&v2740, 16, v2232);
                    if (v2238)
                    {
                      v2239 = *(_QWORD *)v2715;
                      do
                      {
                        for (mm = 0; mm != v2238; ++mm)
                        {
                          if (*(_QWORD *)v2715 != v2239)
                            objc_enumerationMutation(v2650);
                          v2241 = *(void **)(*((_QWORD *)&v2714 + 1) + 8 * mm);
                          v2242 = (void *)MEMORY[0x1E0CB37E8];
                          v2243 = objc_msgSend_uniqueIdentifier(v2241, v2233, v2234, v2235, v2236, v2237);
                          objc_msgSend_numberWithInteger_(v2242, v2244, v2243, v2245, v2246, v2247);
                          v2248 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_objectForKeyedSubscript_(v2656, v2249, (uint64_t)v2248, v2250, v2251, v2252);
                          v2253 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend_mathResult(v2253, v2254, v2255, v2256, v2257, v2258);
                          v2264 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v2264)
                          {
                            objc_msgSend_mathResult(v2253, v2259, v2260, v2261, v2262, v2263);
                            v2265 = (void *)objc_claimAutoreleasedReturnValue();
                            isEvaluationExpected = objc_msgSend_isEvaluationExpected(v2265, v2266, v2267, v2268, v2269, v2270);

                            if (isEvaluationExpected)
                            {
                              objc_msgSend_mathResult(v2253, v2272, v2273, v2274, v2275, v2276);
                              v2277 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_preferredTranscription(v2277, v2278, v2279, v2280, v2281, v2282);
                              v2283 = (void *)objc_claimAutoreleasedReturnValue();
                              hasSuffix = objc_msgSend_hasSuffix_(v2283, v2284, (uint64_t)CFSTR("="), v2285, v2286, v2287);
                              v2289 = CFSTR("vertical");
                              if (hasSuffix)
                                v2289 = CFSTR("horizontal");
                              v2290 = v2289;

                              if (qword_1EF568E88 != -1)
                                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                              v2291 = (id)qword_1EF568E28;
                              if (os_log_type_enabled(v2291, OS_LOG_TYPE_DEFAULT))
                              {
                                objc_msgSend_mathResult(v2253, v2292, v2293, v2294, v2295, v2296);
                                v2297 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_mathResult(v2253, v2298, v2299, v2300, v2301, v2302);
                                v2303 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_score(v2303, v2304, v2305, v2306, v2307, v2308);
                                v2310 = v2309;
                                v2316 = objc_msgSend_uniqueIdentifier(v2241, v2311, v2312, v2313, v2314, v2315);
                                v2322 = objc_msgSend_ancestorIdentifier(v2241, v2317, v2318, v2319, v2320, v2321);
                                *(_DWORD *)v2738 = 134219010;
                                *(_QWORD *)&v2738[4] = v2297;
                                *(_WORD *)&v2738[12] = 2112;
                                *(_QWORD *)&v2738[14] = v2290;
                                *(_WORD *)&v2738[22] = 2048;
                                *(_QWORD *)&v2738[24] = v2310;
                                LOWORD(v2739[0]) = 2048;
                                *(_QWORD *)((char *)v2739 + 2) = v2316;
                                WORD5(v2739[0]) = 2048;
                                *(_QWORD *)((char *)v2739 + 12) = v2322;
                                _os_log_impl(&dword_1BE607000, v2291, OS_LOG_TYPE_DEFAULT, "Math expression %p detected. Type: %@, Score: %.3f, Unique ID: %lu, Ancestor ID: %lu", v2738, 0x34u);

                              }
                              if (qword_1EF568E88 != -1)
                                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                              v2323 = (id)qword_1EF568E28;
                              if (os_log_type_enabled(v2323, OS_LOG_TYPE_DEFAULT))
                              {
                                objc_msgSend_mathResult(v2253, v2324, v2325, v2326, v2327, v2328);
                                v2329 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend_alternativeCandidatesLog(v2329, v2330, v2331, v2332, v2333, v2334);
                                v2335 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)v2738 = 138412290;
                                *(_QWORD *)&v2738[4] = v2335;
                                _os_log_impl(&dword_1BE607000, v2323, OS_LOG_TYPE_DEFAULT, "%@", v2738, 0xCu);

                              }
                            }
                          }

                        }
                        v2230 = v2650;
                        v2238 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2650, v2233, (uint64_t)&v2714, (uint64_t)&v2740, 16, v2237);
                      }
                      while (v2238);
                    }

                    v2713 = 0u;
                    v2712 = 0u;
                    v2711 = 0u;
                    v2710 = 0u;
                    objc_msgSend_deletedStrokeGroups(v2629, v2336, v2337, v2338, v2339, v2340);
                    v2341 = (void *)objc_claimAutoreleasedReturnValue();
                    logc = v2341;
                    v2344 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2341, v2342, (uint64_t)&v2710, (uint64_t)v2738, 16, v2343);
                    if (v2344)
                    {
                      v2640 = *(_QWORD *)v2711;
                      do
                      {
                        v2651 = (id)v2344;
                        for (nn = 0; nn != v2651; nn = (char *)nn + 1)
                        {
                          if (*(_QWORD *)v2711 != v2640)
                            objc_enumerationMutation(logc);
                          v2351 = *(void **)(*((_QWORD *)&v2710 + 1) + 8 * (_QWORD)nn);
                          v2352 = (void *)MEMORY[0x1E0CB37E8];
                          v2353 = objc_msgSend_uniqueIdentifier(v2351, v2345, v2346, v2347, v2348, v2349);
                          objc_msgSend_numberWithInteger_(v2352, v2354, v2353, v2355, v2356, v2357);
                          v2358 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_objectForKeyedSubscript_(spidc, v2359, (uint64_t)v2358, v2360, v2361, v2362);
                          v2363 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend_mathResult(v2363, v2364, v2365, v2366, v2367, v2368);
                          v2374 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v2374)
                          {
                            objc_msgSend_mathResult(v2363, v2369, v2370, v2371, v2372, v2373);
                            v2375 = (void *)objc_claimAutoreleasedReturnValue();
                            v2381 = objc_msgSend_isEvaluationExpected(v2375, v2376, v2377, v2378, v2379, v2380);

                            if (v2381)
                            {
                              objc_msgSend_mathResult(v2363, v2382, v2383, v2384, v2385, v2386);
                              v2387 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend_preferredTranscription(v2387, v2388, v2389, v2390, v2391, v2392);
                              v2393 = (void *)objc_claimAutoreleasedReturnValue();
                              v2398 = objc_msgSend_hasSuffix_(v2393, v2394, (uint64_t)CFSTR("="), v2395, v2396, v2397);
                              v2399 = CFSTR("vertical");
                              if (v2398)
                                v2399 = CFSTR("horizontal");
                              v2400 = v2399;

                              v2709 = 0u;
                              v2708 = 0u;
                              v2707 = 0u;
                              v2706 = 0u;
                              objc_msgSend_createdStrokeGroups(v2629, v2401, v2402, v2403, v2404, v2405);
                              v2406 = (void *)objc_claimAutoreleasedReturnValue();
                              v2414 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2406, v2407, (uint64_t)&v2706, (uint64_t)&v2734, 16, v2408);
                              if (!v2414)
                              {
LABEL_517:
                                v2424 = 0;
                                v2425 = CFSTR("grouping changed");
LABEL_527:

                                goto LABEL_528;
                              }
                              v2415 = *(_QWORD *)v2707;
LABEL_511:
                              v2416 = 0;
                              while (1)
                              {
                                if (*(_QWORD *)v2707 != v2415)
                                  objc_enumerationMutation(v2406);
                                v2417 = *(void **)(*((_QWORD *)&v2706 + 1) + 8 * v2416);
                                v2418 = objc_msgSend_ancestorIdentifier(v2417, v2409, v2410, v2411, v2412, v2413);
                                if (v2418 == objc_msgSend_ancestorIdentifier(v2351, v2419, v2420, v2421, v2422, v2423))
                                  break;
                                if (v2414 == ++v2416)
                                {
                                  v2414 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2406, v2409, (uint64_t)&v2706, (uint64_t)&v2734, 16, v2413);
                                  if (v2414)
                                    goto LABEL_511;
                                  goto LABEL_517;
                                }
                              }
                              v2424 = v2417;

                              if (v2424)
                              {
                                objc_msgSend_strokeIdentifiers(v2424, v2426, v2427, v2428, v2429, v2430);
                                v2431 = (void *)objc_claimAutoreleasedReturnValue();
                                v2437 = objc_msgSend_count(v2431, v2432, v2433, v2434, v2435, v2436);
                                objc_msgSend_strokeIdentifiers(v2351, v2438, v2439, v2440, v2441, v2442);
                                v2443 = (void *)objc_claimAutoreleasedReturnValue();
                                LODWORD(v2437) = v2437 > objc_msgSend_count(v2443, v2444, v2445, v2446, v2447, v2448);

                                v2425 = CFSTR("grouping changed");
                                if ((_DWORD)v2437)
                                {
                                  objc_msgSend_strokeIdentifiers(v2424, v2449, v2450, v2451, v2452, v2453);
                                  v2454 = (void *)objc_claimAutoreleasedReturnValue();
                                  v2460 = (void *)objc_msgSend_mutableCopy(v2454, v2455, v2456, v2457, v2458, v2459);

                                  objc_msgSend_minusSet_(v2460, v2461, (uint64_t)v2665, v2462, v2463, v2464);
                                  objc_msgSend_strokeIdentifiers(v2351, v2465, v2466, v2467, v2468, v2469);
                                  v2470 = (void *)objc_claimAutoreleasedReturnValue();
                                  v2475 = objc_msgSend_isEqualToSet_(v2460, v2471, (uint64_t)v2470, v2472, v2473, v2474);

                                  if (v2475)
                                    v2425 = CFSTR("strokes added");
                                  else
                                    v2425 = CFSTR("grouping changed");

                                }
                                objc_msgSend_strokeIdentifiers(v2424, v2449, v2450, v2451, v2452, v2453);
                                v2476 = (void *)objc_claimAutoreleasedReturnValue();
                                v2482 = objc_msgSend_count(v2476, v2477, v2478, v2479, v2480, v2481);
                                objc_msgSend_strokeIdentifiers(v2351, v2483, v2484, v2485, v2486, v2487);
                                v2488 = (void *)objc_claimAutoreleasedReturnValue();
                                LODWORD(v2482) = v2482 < objc_msgSend_count(v2488, v2489, v2490, v2491, v2492, v2493);

                                if ((_DWORD)v2482)
                                {
                                  objc_msgSend_strokeIdentifiers(v2351, v2494, v2495, v2496, v2497, v2498);
                                  v2499 = (void *)objc_claimAutoreleasedReturnValue();
                                  v2406 = (void *)objc_msgSend_mutableCopy(v2499, v2500, v2501, v2502, v2503, v2504);

                                  objc_msgSend_minusSet_(v2406, v2505, (uint64_t)v2622, v2506, v2507, v2508);
                                  objc_msgSend_strokeIdentifiers(v2424, v2509, v2510, v2511, v2512, v2513);
                                  v2514 = (void *)objc_claimAutoreleasedReturnValue();
                                  v2519 = objc_msgSend_isEqualToSet_(v2406, v2515, (uint64_t)v2514, v2516, v2517, v2518);

                                  if (v2519)
                                    v2425 = CFSTR("strokes erased");
                                  goto LABEL_527;
                                }
LABEL_528:
                                if (qword_1EF568E88 == -1)
                                {
LABEL_529:
                                  v2520 = (id)qword_1EF568E28;
                                  if (os_log_type_enabled(v2520, OS_LOG_TYPE_DEFAULT))
                                  {
                                    objc_msgSend_mathResult(v2363, v2521, v2522, v2523, v2524, v2525);
                                    v2526 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend_mathResult(v2363, v2527, v2528, v2529, v2530, v2531);
                                    v2532 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend_score(v2532, v2533, v2534, v2535, v2536, v2537);
                                    v2539 = v2538;
                                    v2545 = objc_msgSend_uniqueIdentifier(v2351, v2540, v2541, v2542, v2543, v2544);
                                    v2551 = objc_msgSend_ancestorIdentifier(v2351, v2546, v2547, v2548, v2549, v2550);
                                    *(_DWORD *)v2722 = 134219266;
                                    v2723 = v2526;
                                    v2724 = 2112;
                                    v2725 = v2400;
                                    v2726 = 2048;
                                    v2727 = v2539;
                                    v2728 = 2048;
                                    v2729 = v2545;
                                    v2730 = 2048;
                                    v2731 = v2551;
                                    v2732 = 2112;
                                    v2733 = v2425;
                                    _os_log_impl(&dword_1BE607000, v2520, OS_LOG_TYPE_DEFAULT, "Math expression %p removed. Type: %@, Score: %.3f, Unique ID: %lu, Ancestor ID: %lu, Reason: %@", v2722, 0x3Eu);

                                  }
                                  goto LABEL_532;
                                }
                              }
                              else
                              {
                                v2425 = CFSTR("grouping changed");
                                if (qword_1EF568E88 == -1)
                                  goto LABEL_529;
                              }
                              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                              goto LABEL_529;
                            }
                          }
LABEL_532:

                        }
                        v2341 = logc;
                        v2344 = objc_msgSend_countByEnumeratingWithState_objects_count_(logc, v2345, (uint64_t)&v2710, (uint64_t)v2738, 16, v2349);
                      }
                      while (v2344);
                    }

                  }
LABEL_539:
                  if (self)
                  {
                    objc_storeStrong((id *)&self->_outputResult, v2615);
                    v2666 = v2630;
                    if (qword_1EF568228 != -1)
                      dispatch_once(&qword_1EF568228, &unk_1E77F1870);
                    objc_msgSend_outputResult(self, v2552, v2553, v2554, v2555, v2556);
                    v2557 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v2557)
                      v2558 = byte_1EF568220 == 0;
                    else
                      v2558 = 1;
                    v2559 = !v2558;

                    if (v2559)
                    {
                      if (qword_1EF568E88 != -1)
                        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                      v2560 = (id)qword_1EF568E28;
                      if (os_log_type_enabled(v2560, OS_LOG_TYPE_DEBUG))
                      {
                        objc_msgSend_strokeProviderVersion(v2666, v2561, v2562, v2563, v2564, v2565);
                        v2566 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v2738 = 138412290;
                        *(_QWORD *)&v2738[4] = v2566;
                        _os_log_impl(&dword_1BE607000, v2560, OS_LOG_TYPE_DEBUG, "Recognition results for version %@:", v2738, 0xCu);

                      }
                      objc_msgSend_outputResult(self, v2567, v2568, v2569, v2570, v2571);
                      v2572 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_allResultsDebugDescriptionByGroup(v2572, v2573, v2574, v2575, v2576, v2577);
                      v2578 = (void *)objc_claimAutoreleasedReturnValue();

                      v2743 = 0u;
                      v2742 = 0u;
                      v2741 = 0u;
                      v2740 = 0u;
                      v2579 = v2578;
                      v2582 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2579, v2580, (uint64_t)&v2740, (uint64_t)buf, 16, v2581);
                      if (v2582)
                      {
                        v2583 = *(_QWORD *)v2741;
                        do
                        {
                          v2584 = 0;
                          do
                          {
                            if (*(_QWORD *)v2741 != v2583)
                              objc_enumerationMutation(v2579);
                            v2585 = *(_QWORD *)(*((_QWORD *)&v2740 + 1) + 8 * v2584);
                            if (qword_1EF568E88 == -1)
                            {
                              v2586 = (id)qword_1EF568E28;
                              if (!os_log_type_enabled(v2586, OS_LOG_TYPE_DEBUG))
                                goto LABEL_561;
LABEL_560:
                              *(_DWORD *)v2738 = 138412290;
                              *(_QWORD *)&v2738[4] = v2585;
                              _os_log_impl(&dword_1BE607000, v2586, OS_LOG_TYPE_DEBUG, "%@", v2738, 0xCu);
                              goto LABEL_561;
                            }
                            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                            v2586 = (id)qword_1EF568E28;
                            if (os_log_type_enabled(v2586, OS_LOG_TYPE_DEBUG))
                              goto LABEL_560;
LABEL_561:

                            ++v2584;
                          }
                          while (v2582 != v2584);
                          v2589 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2579, v2587, (uint64_t)&v2740, (uint64_t)buf, 16, v2588);
                          v2582 = v2589;
                        }
                        while (v2589);
                      }

                    }
                  }
                  else
                  {
                    v2590 = v2630;
                  }

                  v462 = v2615;
                  sub_1BE791DC4((uint64_t)self, 2);
                  goto LABEL_568;
                }
                CHOSLogForCategory(2);
                loga = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_preferredLocale(v2648, v1862, v1863, v1864, v1865, v1866);
                  v1867 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_description(v1867, v1868, v1869, v1870, v1871, v1872);
                  v1873 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v1873;
                  _os_log_impl(&dword_1BE607000, loga, OS_LOG_TYPE_DEFAULT, "AutoRefine group rejected: text is nil, preferred locale = %@", buf, 0xCu);

                }
                v2604 = 0;
                v1842 = v2654;
              }
              else
              {
                objc_msgSend_setLocale_(v2660, v1568, (uint64_t)spida, v1569, v1570, v1571);
                v1572 = v2660;
                v1573 = v2648;
                v2638 = v2607;
                v2617 = v1573;
                if (self)
                {
                  objc_msgSend_inputStrokeIdentifiers(v1573, v1574, v1575, v1576, v1577, v1578);
                  v1579 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v1580, (uint64_t)v1579, (uint64_t)self->_strokeProvider, v1581, v1582);
                  log = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_indexesOfObjectsPassingTest_(log, v1583, (uint64_t)&unk_1E77F4D80, v1584, v1585, v1586);
                  v1587 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v1588, v1589, v1590, v1591, v1592);
                  v2661 = (void *)objc_claimAutoreleasedReturnValue();
                  v1598 = 0;
                  v1599 = MEMORY[0x1E0C809B0];
                  while (v1598 < objc_msgSend_tokenColumnCount(v1572, v1593, v1594, v1595, v1596, v1597))
                  {
                    *(_QWORD *)buf = 0;
                    *(_QWORD *)&buf[8] = buf;
                    *(_QWORD *)&buf[16] = 0x2020000000;
                    buf[24] = 1;
                    objc_msgSend_transcriptionPaths(v1572, v1600, v1601, v1602, v1603, v1604);
                    v1605 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_firstObject(v1605, v1606, v1607, v1608, v1609, v1610);
                    v1611 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_QWORD *)v2738 = v1599;
                    *(_QWORD *)&v2738[8] = 3221225472;
                    *(_QWORD *)&v2738[16] = sub_1BE7990EC;
                    *(_QWORD *)&v2738[24] = &unk_1E77F4DA8;
                    *((_QWORD *)&v2739[0] + 1) = buf;
                    *(_QWORD *)&v2739[0] = v1587;
                    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v1572, v1612, (uint64_t)v1611, v1598, 1, (uint64_t)v2738);

                    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
                      objc_msgSend_addIndex_(v2661, v1613, v1598, v1614, v1615, v1616);

                    _Block_object_dispose(buf, 8);
                    ++v1598;
                  }
                  v1672 = objc_msgSend_count(v2661, v1600, v1601, v1602, v1603, v1604) == 0;
                  *(_QWORD *)buf = v1599;
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = sub_1BE7991A4;
                  *(_QWORD *)&buf[24] = &unk_1E77F4DD0;
                  v1673 = v1572;
                  *(_QWORD *)&v2748 = v1673;
                  *((_QWORD *)&v2748 + 1) = self;
                  v2749 = v2638;
                  LOBYTE(v2750) = v1672;
                  v1674 = (void *)MEMORY[0x1C3B81A84](buf);
                  *(_QWORD *)&v2734 = 0;
                  *((_QWORD *)&v2734 + 1) = &v2734;
                  v2735 = 0x2020000000uLL;
                  v1675 = objc_alloc_init(CHMutableTokenizedTextResult);
                  v1681 = objc_msgSend_tokenColumnCount(v1673, v1676, v1677, v1678, v1679, v1680);
                  *(_QWORD *)&v2740 = v1599;
                  *((_QWORD *)&v2740 + 1) = 3221225472;
                  *(_QWORD *)&v2741 = sub_1BE7996E0;
                  *((_QWORD *)&v2741 + 1) = &unk_1E77F4DF8;
                  *(_QWORD *)&v2743 = &v2734;
                  v1682 = v1674;
                  *((_QWORD *)&v2742 + 1) = v1682;
                  v1683 = v1675;
                  *(_QWORD *)&v2742 = v1683;
                  objc_msgSend_enumerateRangesUsingBlock_(v2661, v1684, (uint64_t)&v2740, v1685, v1686, v1687);
                  if (v1681 > *(_QWORD *)(*((_QWORD *)&v2734 + 1) + 24))
                    v1682[2](v1682);
                  v1688 = objc_retainAutorelease(v2661);
                  v1694 = objc_msgSend_tokenColumnCount(v1683, v1689, v1690, v1691, v1692, v1693);
                  if (v1694 != objc_msgSend_tokenColumnCount(v1673, v1695, v1696, v1697, v1698, v1699))
                  {
                    if (qword_1EF568E88 != -1)
                      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                    v1705 = (id)qword_1EF568E18[0];
                    if (os_log_type_enabled(v1705, OS_LOG_TYPE_FAULT))
                    {
                      v1711 = objc_msgSend_tokenColumnCount(v1673, v1706, v1707, v1708, v1709, v1710);
                      v1717 = objc_msgSend_tokenColumnCount(v1683, v1712, v1713, v1714, v1715, v1716);
                      *(_DWORD *)v2744 = 134218498;
                      *(_QWORD *)&v2744[4] = v1711;
                      *(_WORD *)&v2744[12] = 2048;
                      *(_QWORD *)&v2744[14] = v1717;
                      *(_WORD *)&v2744[22] = 2112;
                      *(_QWORD *)&v2744[24] = v1688;
                      _os_log_impl(&dword_1BE607000, v1705, OS_LOG_TYPE_FAULT, "Unexpected mismatch after recomposing a text result: expected %ld columns, got %ld. Synthetic tokens at indexes: %@", v2744, 0x20u);
                    }

                  }
                  objc_msgSend_transcriptionPaths(v1673, v1700, v1701, v1702, v1703, v1704);
                  v1718 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_transcriptionPathScores(v1673, v1719, v1720, v1721, v1722, v1723);
                  v1724 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setTranscriptionPaths_scores_(v1683, v1725, (uint64_t)v1718, (uint64_t)v1724, v1726, v1727);

                  objc_msgSend_inputStrokeIdentifiers(v1673, v1728, v1729, v1730, v1731, v1732);
                  v1733 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setInputStrokeIdentifiers_(v1683, v1734, (uint64_t)v1733, v1735, v1736, v1737);

                  objc_msgSend_locale(v1673, v1738, v1739, v1740, v1741, v1742);
                  v1743 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setLocale_(v1683, v1744, (uint64_t)v1743, v1745, v1746, v1747);

                  v1753 = objc_msgSend_recognizerGenerationIdentifier(v1673, v1748, v1749, v1750, v1751, v1752);
                  objc_msgSend_setRecognizerGenerationIdentifier_(v1683, v1754, v1753, v1755, v1756, v1757);
                  v1758 = (void *)v2742;
                  v2662 = v1683;

                  _Block_object_dispose(&v2734, 8);
                }
                else
                {
                  v1688 = 0;
                  v2662 = 0;
                }

                loga = v1688;
                v1759 = [CHRecognitionSessionAutoRefineResult alloc];
                v2604 = (void *)objc_msgSend_initWithStrokeGroupResult_strokeGroup_textResult_refinedColumns_strokeProvider_(v1759, v1760, (uint64_t)v2617, (uint64_t)v2638, (uint64_t)v2662, (uint64_t)loga, self->_strokeProvider);
                v2599 = (void *)objc_msgSend_mutableCopy(v2654, v1761, v1762, v1763, v1764, v1765);
                v1766 = v2617;
                v2618 = spida;
                v2660 = v2662;
                objc_msgSend_recognitionResultsByLocale(v1766, v1767, v1768, v1769, v1770, v1771);
                v1772 = (void *)objc_claimAutoreleasedReturnValue();
                v1778 = (void *)objc_msgSend_mutableCopy(v1772, v1773, v1774, v1775, v1776, v1777);

                objc_msgSend_setObject_forKeyedSubscript_(v1778, v1779, (uint64_t)v2660, (uint64_t)v2618, v1780, v1781);
                v1782 = [CHStrokeGroupRecognitionResult alloc];
                objc_msgSend_recognitionLocales(self, v1783, v1784, v1785, v1786, v1787);
                v1788 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_errorsByLocale(v1766, v1789, v1790, v1791, v1792, v1793);
                v1794 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_languageFitnessByLocale(v1766, v1795, v1796, v1797, v1798, v1799);
                v1800 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_mathResult(v1766, v1801, v1802, v1803, v1804, v1805);
                v1806 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_inputStrokeIdentifiers(v1766, v1807, v1808, v1809, v1810, v1811);
                v1812 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_inputDrawing(v1766, v1813, v1814, v1815, v1816, v1817);
                v1818 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_inputDrawingCutPoints(v1766, v1819, v1820, v1821, v1822, v1823);
                v1824 = (void *)objc_claimAutoreleasedReturnValue();
                v1826 = (void *)objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_inputDrawing_inputDrawingCutPoints_(v1782, v1825, (uint64_t)v1788, (uint64_t)v1778, (uint64_t)v1794, (uint64_t)v1800, v1806, v1812, v1818, v1824);

                v1827 = (void *)MEMORY[0x1E0CB37E8];
                v1833 = objc_msgSend_uniqueIdentifier(v2638, v1828, v1829, v1830, v1831, v1832);
                objc_msgSend_numberWithInteger_(v1827, v1834, v1833, v1835, v1836, v1837);
                v1838 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v2599, v1839, (uint64_t)v1826, (uint64_t)v1838, v1840, v1841);

                v1842 = v2599;
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v1843 = (id)qword_1EF568E28;
                if (os_log_type_enabled(v1843, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_strokeIndexes(v2660, v1844, v1845, v1846, v1847, v1848);
                  v1849 = (void *)objc_claimAutoreleasedReturnValue();
                  v1855 = objc_msgSend_count(v1849, v1850, v1851, v1852, v1853, v1854);
                  objc_msgSend_rawTranscription(v2660, v1856, v1857, v1858, v1859, v1860);
                  v1861 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218243;
                  *(_QWORD *)&buf[4] = v1855;
                  *(_WORD *)&buf[12] = 2117;
                  *(_QWORD *)&buf[14] = v1861;
                  _os_log_impl(&dword_1BE607000, v1843, OS_LOG_TYPE_DEFAULT, "AutoRefine group stored as result with %ld strokes, text = %{sensitive}@", buf, 0x16u);

                }
              }

              v2654 = v1842;
              goto LABEL_427;
            }
            v630 = objc_msgSend_newStrokeClassifier(self, v595, v596, v597, v598, v599);
            objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v635, v636, v637, v638, v639);
            v641 = v640;
            if ((objc_msgSend_cancelled(self, v642, v643, v644, v645, v646) & 1) != 0)
            {
              v652 = 0;
LABEL_191:
              objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v647, v648, v649, v650, v651);
              v659 = v679 - v641;
              if ((objc_msgSend_cancelled(self, v669, v670, v671, v672, v673) & 1) != 0)
                goto LABEL_210;
              strokeClassificationModel = self;
              if (self)
                strokeClassificationModel = self->_strokeClassificationModel;
              v681 = strokeClassificationModel;
              v682 = v681 == 0;

              if (v682)
              {
LABEL_210:
                v2614 = v652;
              }
              else
              {
                CHOSLogForCategory(7);
                v683 = objc_claimAutoreleasedReturnValue();
                v684 = os_signpost_id_generate(v683);

                CHOSLogForCategory(7);
                v685 = objc_claimAutoreleasedReturnValue();
                v686 = v685;
                if (v684 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v685))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1BE607000, v686, OS_SIGNPOST_INTERVAL_BEGIN, v684, "CHSessionTaskTextNonText", ", buf, 2u);
                }

                CHOSLogForCategory(0);
                v687 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v687, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BE607000, v687, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionTaskTextNonText\", buf, 2u);
                }

                objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v688, v689, v690, v691, v692);
                v694 = v693;
                if (self)
                  v695 = self->_strokeClassificationModel;
                else
                  v695 = 0;
                v696 = v695;
                v2681[0] = MEMORY[0x1E0C809B0];
                v2681[1] = 3221225472;
                v2681[2] = sub_1BE791EF4;
                v2681[3] = &unk_1E77F4CA0;
                v2681[4] = self;
                objc_msgSend_refineStrokeClassificationResultUsingClassificationResult_strokeClassificationModel_sortedAddedStrokes_removedStrokeIdentifiers_cancellationBlock_(v630, v697, (uint64_t)v652, (uint64_t)v696, (uint64_t)objc, (uint64_t)v2597, v2681);
                v2614 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v698, v699, v700, v701, v702);
                v704 = v703 - v694;
                CHOSLogForCategory(2);
                v705 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v705, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  *(double *)&buf[4] = v704;
                  _os_log_impl(&dword_1BE607000, v705, OS_LOG_TYPE_DEFAULT, "Ran stroke classification in duration = %3.6f seconds", buf, 0xCu);
                }

                v711 = objc_msgSend_completedUnitCount(v2605, v706, v707, v708, v709, v710);
                objc_msgSend_setCompletedUnitCount_(v2605, v712, v711 + 10, v713, v714, v715);
                CHOSLogForCategory(7);
                v716 = objc_claimAutoreleasedReturnValue();
                v717 = v716;
                if (v684 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v716))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1BE607000, v717, OS_SIGNPOST_INTERVAL_END, v684, "CHSessionTaskTextNonText", ", buf, 2u);
                }

                CHOSLogForCategory(0);
                v718 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v718, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BE607000, v718, OS_LOG_TYPE_DEFAULT, "END \"CHSessionTaskTextNonText\", buf, 2u);
                }

                v659 = v659 + v704;
              }
              objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v674, v675, v676, v677, v678);
              v720 = v719;
              v726 = objc_msgSend_cancelled(self, v721, v722, v723, v724, v725);
              if (v2614)
                v732 = v726;
              else
                v732 = 1;
              if ((v732 & 1) != 0)
              {
                v733 = 0;
LABEL_252:
                objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v727, v728, v729, v730, v731);
                v2647 = v733;
                v2621 = v797 - v720;
                goto LABEL_253;
              }
              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v734 = (id)qword_1EF568E50;
              v735 = os_signpost_id_generate(v734);

              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v736 = (id)qword_1EF568E50;
              v737 = v736;
              v738 = v735 - 1;
              if (v735 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v736))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1BE607000, v737, OS_SIGNPOST_INTERVAL_BEGIN, v735, "CHSessionTaskAccurateGrouping", ", buf, 2u);
              }

              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v739 = (id)qword_1EF568E18[0];
              if (os_log_type_enabled(v739, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BE607000, v739, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionTaskAccurateGrouping\", buf, 2u);
              }

              v740 = MEMORY[0x1E0C809B0];
              v2680[0] = MEMORY[0x1E0C809B0];
              v2680[1] = 3221225472;
              v2680[2] = sub_1BE791EFC;
              v2680[3] = &unk_1E77F4CA0;
              v2680[4] = self;
              objc_msgSend_updatedGroupingResultByAddingStrokes_removingStrokeIdentifiers_orderedStrokeIdentifiers_strokeClassificationResult_cancellationBlock_(v2598, v741, (uint64_t)objc, (uint64_t)v2597, (uint64_t)v2625, (uint64_t)v2614, v2680);
              v733 = (void *)objc_claimAutoreleasedReturnValue();
              if (_os_feature_enabled_impl())
              {
                objc_msgSend_textStrokeGroups(v733, v742, v743, v744, v745, v746);
                v747 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_sortedGroupsBySizeDescending_(CHStrokeGroupingManager, v748, (uint64_t)v747, v749, v750, v751);
                v752 = (void *)objc_claimAutoreleasedReturnValue();
                v753 = v733;
                v2679[0] = v740;
                v2679[1] = 3221225472;
                v2679[2] = sub_1BE791F04;
                v2679[3] = &unk_1E77F4CA0;
                v2679[4] = self;
                objc_msgSend_refineStrokeClassificationResultUsingSortedTextStrokeGroups_strokeClassificationResult_cancellationBlock_(v630, v754, (uint64_t)v752, (uint64_t)v2614, (uint64_t)v2679, v755);
                v756 = (void *)objc_claimAutoreleasedReturnValue();

                if ((objc_msgSend_isEquivalentToStrokeClassificationResult_(v2614, v757, (uint64_t)v756, v758, v759, v760) & 1) != 0)
                {
                  v766 = (uint64_t)v2614;
                }
                else
                {
                  v766 = objc_msgSend_copy(v756, v761, v762, v763, v764, v765);

                  v2678[0] = v740;
                  v2678[1] = 3221225472;
                  v2678[2] = sub_1BE791F0C;
                  v2678[3] = &unk_1E77F4CA0;
                  v2678[4] = self;
                  objc_msgSend_updatedGroupingResultByAddingStrokes_removingStrokeIdentifiers_orderedStrokeIdentifiers_strokeClassificationResult_cancellationBlock_(v2598, v793, (uint64_t)objc, (uint64_t)v2597, (uint64_t)v2625, v766, v2678);
                  v794 = objc_claimAutoreleasedReturnValue();

                  v753 = (void *)v794;
                }

                v733 = v753;
              }
              else
              {
                v766 = (uint64_t)v2614;
              }
              if (qword_1EF568E88 == -1)
              {
                v795 = (id)qword_1EF568E50;
                if (v738 > 0xFFFFFFFFFFFFFFFDLL)
                  goto LABEL_248;
              }
              else
              {
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v795 = (id)qword_1EF568E50;
                if (v738 > 0xFFFFFFFFFFFFFFFDLL)
                  goto LABEL_248;
              }
              if (os_signpost_enabled(v795))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1BE607000, v795, OS_SIGNPOST_INTERVAL_END, v735, "CHSessionTaskAccurateGrouping", ", buf, 2u);
              }
LABEL_248:

              if (qword_1EF568E88 == -1)
              {
                v796 = (id)qword_1EF568E18[0];
                if (!os_log_type_enabled(v796, OS_LOG_TYPE_DEFAULT))
                {
LABEL_251:

                  v2614 = (void *)v766;
                  goto LABEL_252;
                }
              }
              else
              {
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v796 = (id)qword_1EF568E18[0];
                if (!os_log_type_enabled(v796, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_251;
              }
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BE607000, v796, OS_LOG_TYPE_DEFAULT, "END \"CHSessionTaskAccurateGrouping\", buf, 2u);
              goto LABEL_251;
            }
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v660 = (id)qword_1EF568E50;
            v661 = os_signpost_id_generate(v660);

            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v662 = (id)qword_1EF568E50;
            v663 = v662;
            v664 = v661 - 1;
            if (v661 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v662))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1BE607000, v663, OS_SIGNPOST_INTERVAL_BEGIN, v661, "CHSessionTaskStrokeClassification", ", buf, 2u);
            }

            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v665 = (id)qword_1EF568E18[0];
            if (os_log_type_enabled(v665, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BE607000, v665, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHSessionTaskStrokeClassification\", buf, 2u);
            }

            v2682[0] = MEMORY[0x1E0C809B0];
            v2682[1] = 3221225472;
            v2682[2] = sub_1BE791EEC;
            v2682[3] = &unk_1E77F4CA0;
            v2682[4] = self;
            objc_msgSend_updatedStrokeClassificationResultByAddingStrokes_removingStrokeIdentifiers_clutterFilter_affectedClutterStrokeIDs_cancellationBlock_(v630, v666, (uint64_t)objc, (uint64_t)v2597, (uint64_t)v2613, (uint64_t)v2593, v2682);
            v652 = (void *)objc_claimAutoreleasedReturnValue();
            if (qword_1EF568E88 == -1)
            {
              v667 = (id)qword_1EF568E50;
              if (v664 > 0xFFFFFFFFFFFFFFFDLL)
                goto LABEL_187;
            }
            else
            {
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v667 = (id)qword_1EF568E50;
              if (v664 > 0xFFFFFFFFFFFFFFFDLL)
                goto LABEL_187;
            }
            if (os_signpost_enabled(v667))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1BE607000, v667, OS_SIGNPOST_INTERVAL_END, v661, "CHSessionTaskStrokeClassification", ", buf, 2u);
            }
LABEL_187:

            if (qword_1EF568E88 == -1)
            {
              v668 = (id)qword_1EF568E18[0];
              if (!os_log_type_enabled(v668, OS_LOG_TYPE_DEFAULT))
              {
LABEL_190:

                goto LABEL_191;
              }
            }
            else
            {
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v668 = (id)qword_1EF568E18[0];
              if (!os_log_type_enabled(v668, OS_LOG_TYPE_DEFAULT))
                goto LABEL_190;
            }
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BE607000, v668, OS_LOG_TYPE_DEFAULT, "END \"CHSessionTaskStrokeClassification\", buf, 2u);
            goto LABEL_190;
          }
        }
        else
        {
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v507 = (id)qword_1EF568E18[0];
          if (!os_log_type_enabled(v507, OS_LOG_TYPE_DEFAULT))
            goto LABEL_142;
        }
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v507, OS_LOG_TYPE_DEFAULT, "END \"CHSessionTaskClutterFilter\", buf, 2u);
        goto LABEL_142;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v416 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v416, OS_LOG_TYPE_DEFAULT))
        goto LABEL_99;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v416, OS_LOG_TYPE_DEFAULT, "END \"CHSessionTaskGetAddedStrokes\", buf, 2u);
    goto LABEL_99;
  }
}

- (void)cancel
{
  sub_1BE791DC4((uint64_t)self, 2);
  if (self)
    self->_cancelled = 1;
}

- (BOOL)isNonRecognitionTask
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend_principalLineRequirement(self, a2, v2, v3, v4, v5) == 3;
}

- (id)recognitionResultsForGroupingResult:(id)a3 groupingManager:(id)a4 strokeGroupsToProcess:(id)a5 strokeClassificationResult:(id)a6 strokeGroupReplacements:(id *)a7
{
  id v10;
  void *v11;
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
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CHCTLD *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
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
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  CHRecognitionSessionTask *v76;
  uint64_t i;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
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
  void *v95;
  id v96;
  void *v97;
  id v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  BOOL v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
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
  void *v122;
  id v123;
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
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  id v150;
  void *v151;
  void *v152;
  id v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  CHStrokeGroupRecognitionResult *v172;
  const char *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  void *v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t j;
  void *v250;
  void *v251;
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
  void *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  int v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  void *v291;
  BOOL v292;
  uint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  BOOL v314;
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
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
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
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  void *v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  id v359;
  void *v360;
  void *v361;
  void *v362;
  id v363;
  id v364;
  id obj;
  uint64_t v366;
  uint64_t v367;
  id v368;
  void *context;
  void *v370;
  id v372;
  void *v373;
  void *v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  id v379;
  id v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  _QWORD v385[4];
  id v386;
  _BYTE v387[128];
  _BYTE v388[128];
  _QWORD v389[3];

  v389[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v368 = a4;
  v359 = a5;
  v364 = a6;
  v11 = (void *)MEMORY[0x1E0C99E08];
  v374 = v10;
  objc_msgSend_strokeGroups(v10, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_count(v17, v18, v19, v20, v21, v22);
  objc_msgSend_dictionaryWithCapacity_(v11, v24, v23, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v29, v30, v31, v32, v33);
  v363 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputResult(self, v34, v35, v36, v37, v38);
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = [CHCTLD alloc];
  v360 = (void *)objc_msgSend_initWithType_(v39, v40, 1, v41, v42, v43);
  objc_msgSend_allObjects(v359, v44, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderStrokeGroups_(v360, v50, (uint64_t)v49, v51, v52, v53);
  v362 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_currentProgress(MEMORY[0x1E0CB38A8], v54, v55, v56, v57, v58);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)MEMORY[0x1E0CB38A8];
  v65 = objc_msgSend_count(v362, v60, v61, v62, v63, v64);
  objc_msgSend_progressWithTotalUnitCount_parent_pendingUnitCount_(v59, v66, v65, (uint64_t)v361, 60, v67);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  v383 = 0u;
  v384 = 0u;
  v381 = 0u;
  v382 = 0u;
  obj = v362;
  v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v68, (uint64_t)&v381, (uint64_t)v388, 16, v69);
  v76 = self;
  if (v70)
  {
    v367 = *(_QWORD *)v382;
    do
    {
      v366 = v70;
      for (i = 0; i != v366; ++i)
      {
        if (*(_QWORD *)v382 != v367)
          objc_enumerationMutation(obj);
        v78 = *(void **)(*((_QWORD *)&v381 + 1) + 8 * i);
        if (objc_msgSend_cancelled(v76, v71, v72, v73, v74, v75))
        {
          v219 = objc_msgSend_totalUnitCount(v370, v79, v80, v81, v82, v83);
          objc_msgSend_setCompletedUnitCount_(v370, v220, v219, v221, v222, v223);
          goto LABEL_36;
        }
        context = (void *)MEMORY[0x1C3B818B0]();
        v84 = (void *)objc_opt_class();
        v90 = objc_msgSend_classification(v78, v85, v86, v87, v88, v89);
        if (objc_msgSend_isStrokeClassificationTextOrMath_(v84, v91, v90, v92, v93, v94))
        {
          v380 = 0;
          sub_1BE793384((uint64_t *)self, v78, v368, (uint64_t)&v380);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = v380;
          v379 = v96;
          sub_1BE794308((uint64_t *)self, v95, v78, v368, v364, &v379);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = v379;

          objc_msgSend_mathResult(v97, v99, v100, v101, v102, v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = v104 == 0;

          if (!v105)
          {
            objc_msgSend_mathResult(v97, v106, v107, v108, v109, v110);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_declaredVariable(v111, v112, v113, v114, v115, v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();

            if (v117)
              objc_msgSend_addObject_(self->_intermediateDeclaredVariables, v118, (uint64_t)v117, v119, v120, v121);

          }
          if (v98)
            v122 = v98;
          else
            v122 = v78;
          v123 = v122;
          if ((objc_msgSend_cancelled(self, v124, v125, v126, v127, v128) & 1) == 0
            && objc_msgSend_principalLineRequirement(self, v129, v130, v131, v132, v133) == 1
            && (objc_msgSend_classification(v123, v134, v135, v136, v137, v138) == 1
             || objc_msgSend_classification(v123, v139, v140, v141, v142, v143) == 2))
          {
            sub_1BE791F14(self, v123, v97);
            v144 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v144 = v97;
          }

          if (v144)
          {
            if (v98)
            {
              v180 = (void *)MEMORY[0x1E0CB37E8];
              v181 = objc_msgSend_uniqueIdentifier(v98, v174, v175, v176, v177, v178);
              objc_msgSend_numberWithInteger_(v180, v182, v181, v183, v184, v185);
              v186 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v28, v187, (uint64_t)v144, (uint64_t)v186, v188, v189);

              v190 = (void *)MEMORY[0x1E0CB37E8];
              v196 = objc_msgSend_uniqueIdentifier(v78, v191, v192, v193, v194, v195);
              objc_msgSend_numberWithInteger_(v190, v197, v196, v198, v199, v200);
              v201 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v363, v202, (uint64_t)v98, (uint64_t)v201, v203, v204);
              v179 = v98;
LABEL_28:

              goto LABEL_30;
            }
LABEL_27:
            v205 = (void *)MEMORY[0x1E0CB37E8];
            v206 = objc_msgSend_uniqueIdentifier(v78, v174, v175, v176, v177, v178);
            objc_msgSend_numberWithInteger_(v205, v207, v206, v208, v209, v210);
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v28, v211, (uint64_t)v144, (uint64_t)v201, v212, v213);
            v179 = 0;
            goto LABEL_28;
          }
          v179 = v98;
        }
        else
        {
          v150 = v78;
          if (self)
          {
            objc_msgSend_strokeProvider(self, v145, v146, v147, v148, v149);
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = (void *)MEMORY[0x1E0CB3928];
            v385[0] = MEMORY[0x1E0C809B0];
            v385[1] = 3221225472;
            v385[2] = sub_1BE799750;
            v385[3] = &unk_1E77F2B30;
            v153 = v151;
            v386 = v153;
            objc_msgSend_sortDescriptorWithKey_ascending_comparator_(v152, v154, 0, 1, (uint64_t)v385, v155);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIdentifiers(v150, v157, v158, v159, v160, v161);
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            v389[0] = v156;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v163, (uint64_t)v389, 1, v164, v165);
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_sortedArrayUsingDescriptors_(v162, v167, (uint64_t)v166, v168, v169, v170);
            v171 = (void *)objc_claimAutoreleasedReturnValue();

            v172 = [CHStrokeGroupRecognitionResult alloc];
            v144 = (void *)objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_inputDrawing_inputDrawingCutPoints_(v172, v173, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70], 0, MEMORY[0x1E0C9AA70], 0, v171, 0, 0);

            if (!v144)
            {
              v179 = 0;
              goto LABEL_30;
            }
            goto LABEL_27;
          }

          v144 = 0;
          v179 = 0;
        }
LABEL_30:
        v214 = objc_msgSend_completedUnitCount(v370, v174, v175, v176, v177, v178);
        objc_msgSend_setCompletedUnitCount_(v370, v215, v214 + 1, v216, v217, v218);

        objc_autoreleasePoolPop(context);
        v76 = self;
      }
      v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v71, (uint64_t)&v381, (uint64_t)v388, 16, v75);
    }
    while (v70);
  }
LABEL_36:

  if ((objc_msgSend_cancelled(self, v224, v225, v226, v227, v228) & 1) != 0)
    goto LABEL_59;
  v377 = 0u;
  v378 = 0u;
  v375 = 0u;
  v376 = 0u;
  objc_msgSend_rawStrokeGroupingResult(v373, v229, v230, v231, v232, v233);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroups(v234, v235, v236, v237, v238, v239);
  v372 = (id)objc_claimAutoreleasedReturnValue();

  v247 = objc_msgSend_countByEnumeratingWithState_objects_count_(v372, v240, (uint64_t)&v375, (uint64_t)v387, 16, v241);
  if (!v247)
    goto LABEL_58;
  v248 = *(_QWORD *)v376;
  do
  {
    for (j = 0; j != v247; ++j)
    {
      if (*(_QWORD *)v376 != v248)
        objc_enumerationMutation(v372);
      v250 = *(void **)(*((_QWORD *)&v375 + 1) + 8 * j);
      v251 = (void *)MEMORY[0x1E0CB37E8];
      v252 = objc_msgSend_uniqueIdentifier(v250, v242, v243, v244, v245, v246);
      objc_msgSend_numberWithInteger_(v251, v253, v252, v254, v255, v256);
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v28, v258, (uint64_t)v257, v259, v260, v261);
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      if (v262)
      {

      }
      else
      {
        objc_msgSend_strokeGroups(v374, v263, v264, v265, v266, v267);
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        v278 = objc_msgSend_containsObject_(v273, v274, (uint64_t)v250, v275, v276, v277);

        if (v278)
        {
          v279 = objc_msgSend_uniqueIdentifier(v250, v268, v269, v270, v271, v272);
          objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v373, v280, v279, v281, v282, v283);
          v284 = (void *)objc_claimAutoreleasedReturnValue();
          v290 = v284;
          if (!v284
            || (objc_msgSend_mathResult(v284, v285, v286, v287, v288, v289),
                v291 = (void *)objc_claimAutoreleasedReturnValue(),
                v292 = v291 == 0,
                v291,
                !v292))
          {
            v293 = objc_msgSend_uniqueIdentifier(v250, v285, v286, v287, v288, v289);
            objc_msgSend_rawRecognitionResultForStrokeGroupIdentifier_(v373, v294, v293, v295, v296, v297);
            v298 = objc_claimAutoreleasedReturnValue();

            v290 = (void *)v298;
          }
          objc_msgSend_setObject_forKeyedSubscript_(v28, v285, (uint64_t)v290, (uint64_t)v257, v288, v289);
          goto LABEL_55;
        }
      }
      objc_msgSend_strokeGroups(v374, v268, v269, v270, v271, v272);
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_containsObject_(v290, v299, (uint64_t)v250, v300, v301, v302))
      {
        objc_msgSend_objectForKeyedSubscript_(v28, v303, (uint64_t)v257, v304, v305, v306);
        v307 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mathResult(v307, v308, v309, v310, v311, v312);
        v313 = (void *)objc_claimAutoreleasedReturnValue();
        v314 = v313 == 0;

        if (v314)
          goto LABEL_56;
        objc_msgSend_objectForKeyedSubscript_(v28, v315, (uint64_t)v257, v316, v317, v318);
        v319 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mathResult(v319, v320, v321, v322, v323, v324);
        v290 = (void *)objc_claimAutoreleasedReturnValue();

        v330 = objc_msgSend_uniqueIdentifier(v250, v325, v326, v327, v328, v329);
        objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v373, v331, v330, v332, v333, v334);
        v335 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mathResult(v335, v336, v337, v338, v339, v340);
        v341 = (void *)objc_claimAutoreleasedReturnValue();

        if (v341
          && objc_msgSend_isEquivalentToTokenizedMathResult_(v341, v342, (uint64_t)v290, v343, v344, v345))
        {
          objc_msgSend_selectedTranscriptionPathIndex(v341, v346, v347, v348, v349, v350);
          v351 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setSelectedTranscriptionPathIndex_(v290, v352, (uint64_t)v351, v353, v354, v355);

        }
      }
LABEL_55:

LABEL_56:
    }
    v247 = objc_msgSend_countByEnumeratingWithState_objects_count_(v372, v242, (uint64_t)&v375, (uint64_t)v387, 16, v246);
  }
  while (v247);
LABEL_58:

LABEL_59:
  if (a7)
    *a7 = objc_retainAutorelease(v363);
  v356 = (void *)objc_msgSend_copy(v28, v229, v230, v231, v232, v233);

  return v356;
}

- (id)textCorrectionResultsForGroupingResult:(id)a3 groupingManager:(id)a4
{
  return 0;
}

- (id)clutterFilter
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CHStrokeClutterFilter *v13;

  objc_msgSend_inputResult(self, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clutterFilter(v6, v7, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = (CHStrokeClutterFilter *)v12;
  else
    v13 = objc_alloc_init(CHStrokeClutterFilter);
  return v13;
}

- (id)newStrokeClassifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  CHStrokeClassifier *v8;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *Result_forceClass;

  if (objc_msgSend_sessionMode(self, a2, v2, v3, v4, v5) == 2)
    v7 = 3;
  else
    v7 = 0;
  v8 = [CHStrokeClassifier alloc];
  objc_msgSend_strokeProvider(self, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputResult(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeClassificationResult(v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  Result_forceClass = (void *)objc_msgSend_initWithStrokeProvider_strokeClassificationLastResult_forceClass_(v8, v27, (uint64_t)v14, (uint64_t)v26, v7, v28);

  return Result_forceClass;
}

- (id)newGroupingManager
{
  CHStrokeGroupingManager *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CHGroupingModel *strokeGroupingModel;
  CHGroupingModel *v17;
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
  void *isMathMode;
  BOOL v32;

  v3 = [CHStrokeGroupingManager alloc];
  objc_msgSend_strokeProvider(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputResult(self, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    strokeGroupingModel = self->_strokeGroupingModel;
  else
    strokeGroupingModel = 0;
  v17 = strokeGroupingModel;
  objc_msgSend_recognitionLocales(self, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_sessionMode(self, v24, v25, v26, v27, v28) == 2;
  isMathMode = (void *)objc_msgSend_initWithStrokeProvider_sessionLastResult_strokeGroupingModel_locales_isInlineContinuousMode_inlineContinuousModeTargets_isMathMode_(v3, v29, (uint64_t)v9, (uint64_t)v15, (uint64_t)v17, (uint64_t)v23, 0, 0, v32);

  return isMathMode;
}

- (id)newGroupingPostProcessingManagerWithGroupingManager:(id)a3
{
  id v4;
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CHGroupOversegmentationMergingStep *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CHVerticalUndersegmentationSplittingStep *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CHVerticalMathLinkingStep *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CHHorizontalUndersegmentationSplittingStep *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CHTextToMathResultTransformationStep *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CHGroupingPostProcessingManager *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  id (*v61)(uint64_t, void *, _QWORD *);
  void *v62;
  CHRecognitionSessionTask *v63;
  id v64;

  v4 = a3;
  v59 = MEMORY[0x1E0C809B0];
  v60 = 3221225472;
  v61 = sub_1BE799C30;
  v62 = &unk_1E77F4E20;
  v63 = self;
  v5 = v4;
  v64 = v5;
  v6 = (void *)MEMORY[0x1C3B81A84](&v59);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11, v59, v60, v61, v62, v63);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(CHGroupOversegmentationMergingStep);
  objc_msgSend_addObject_(v12, v14, (uint64_t)v13, v15, v16, v17);

  v18 = objc_alloc_init(CHVerticalUndersegmentationSplittingStep);
  objc_msgSend_addObject_(v12, v19, (uint64_t)v18, v20, v21, v22);

  v23 = objc_alloc_init(CHVerticalMathLinkingStep);
  objc_msgSend_addObject_(v12, v24, (uint64_t)v23, v25, v26, v27);

  v28 = objc_alloc_init(CHHorizontalUndersegmentationSplittingStep);
  objc_msgSend_addObject_(v12, v29, (uint64_t)v28, v30, v31, v32);

  v33 = [CHTextToMathResultTransformationStep alloc];
  v38 = (void *)objc_msgSend_initWithAdditionalMathRecognitionBlock_(v33, v34, (uint64_t)v6, v35, v36, v37);
  objc_msgSend_addObject_(v12, v39, (uint64_t)v38, v40, v41, v42);

  v43 = [CHGroupingPostProcessingManager alloc];
  v47 = (void *)objc_msgSend_initWithSequence_groupingManager_(v43, v44, (uint64_t)v12, (uint64_t)v5, v45, v46);
  v53 = objc_msgSend_saveInputDrawings(self, v48, v49, v50, v51, v52);
  objc_msgSend_setSaveInputDrawings_(v47, v54, v53, v55, v56, v57);

  return v47;
}

+ (BOOL)isGroupAcceptableForInventory:(id)a3 textSynthesizer:(id)a4 strokeProvider:(id)a5 recognitionResult:(id)a6 strokeClassificationResult:(id)a7 allowSyntheticStrokes:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  id v14;
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
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
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
  int isSupportedLatinScriptLocale_withMode;
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
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  int isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  _BOOL4 v102;
  NSObject *v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unsigned int v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  const char *v149;
  NSObject *v150;
  uint32_t v151;
  const __CFString *v152;
  const __CFString *v153;
  const __CFString *v154;
  const __CFString *v155;
  const __CFString *v156;
  void *v158;
  __CFString *v159;
  void *v160;
  void *v161;
  __CFString *v162;
  id v163;
  NSObject *obj;
  id v165;
  uint64_t v166;
  id v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  uint8_t buf[4];
  const __CFString *v173;
  __int16 v174;
  const __CFString *v175;
  __int16 v176;
  const __CFString *v177;
  __int16 v178;
  const __CFString *v179;
  __int16 v180;
  const __CFString *v181;
  __int16 v182;
  __CFString *v183;
  _BYTE v184[128];
  __CFString *v185;
  _QWORD v186[3];

  v8 = a8;
  v186[1] = *MEMORY[0x1E0C80C00];
  v165 = a3;
  v13 = a4;
  v167 = a5;
  v14 = a6;
  v163 = a7;
  v160 = v13;
  v161 = v14;
  v15 = (void *)objc_opt_class();
  v21 = objc_msgSend_classification(v165, v16, v17, v18, v19, v20);
  if ((objc_msgSend_isStrokeClassificationTextOrMath_(v15, v22, v21, v23, v24, v25) & 1) != 0)
  {
    objc_msgSend_preferredLocale(v14, v26, v27, v28, v29, v30);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mathResult(v14, v31, v32, v33, v34, v35);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend_mathResult(v14, v36, v37, v38, v39, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_topTranscription(v42, v43, v44, v45, v46, v47);
      v162 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_recognitionResultsByLocale(v14, v36, v37, v38, v39, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v42, v49, (uint64_t)v158, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_topTranscription(v53, v54, v55, v56, v57, v58);
      v162 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v185 = CHTextSynthesisOptionSupportedCharactersStrict[0];
    v186[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v59, (uint64_t)v186, (uint64_t)&v185, 1, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_supportedCharacterIndexesForString_options_(v13, v62, (uint64_t)v162, (uint64_t)v61, v63, v64);
    v159 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v70 = objc_msgSend_count(v159, v65, v66, v67, v68, v69);
    if (v70 == objc_msgSend_length(v162, v71, v72, v73, v74, v75))
    {
      isSupportedLatinScriptLocale_withMode = objc_msgSend_isSupportedLatinScriptLocale_withMode_(CHRecognizerConfiguration, v76, (uint64_t)v158, 6, v77, v78);
      objc_msgSend_strokeIdentifiers(v165, v80, v81, v82, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allObjects(v85, v86, v87, v88, v89, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold = objc_msgSend_isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold_(v163, v92, (uint64_t)v91, (uint64_t)&unk_1E7829138, v93, v94, 0.5);

      if ((isSupportedLatinScriptLocale_withMode & isHighConfidenceForStrokesIdentifiers_script_confidenceThreshold & 1) != 0
        || (objc_msgSend_mathResult(v14, v96, v97, v98, v99, v100),
            v101 = (void *)objc_claimAutoreleasedReturnValue(),
            v102 = v101 == 0,
            v101,
            !v102))
      {
        v170 = 0u;
        v171 = 0u;
        v168 = 0u;
        v169 = 0u;
        objc_msgSend_strokeIdentifiers(v165, v96, v97, v98, v99, v100);
        v103 = objc_claimAutoreleasedReturnValue();
        v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v104, (uint64_t)&v168, (uint64_t)v184, 16, v105);
        if (!v110)
        {
          v48 = 1;
LABEL_47:

          goto LABEL_48;
        }
        obj = v103;
        v166 = *(_QWORD *)v169;
        v111 = !v8;
LABEL_11:
        v112 = 0;
        while (1)
        {
          if (*(_QWORD *)v169 != v166)
            objc_enumerationMutation(obj);
          objc_msgSend_strokeIdentifierFromData_(v167, v106, *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * v112), v107, v108, v109);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeForIdentifier_(v167, v114, (uint64_t)v113, v115, v116, v117);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = objc_msgSend_strokeAttributes(v118, v119, v120, v121, v122, v123);
          v130 = objc_msgSend_strokeAttributes(v118, v125, v126, v127, v128, v129);
          v136 = objc_msgSend_strokeAttributes(v118, v131, v132, v133, v134, v135);
          v142 = objc_msgSend_strokeAttributes(v118, v137, v138, v139, v140, v141);
          v148 = objc_msgSend_strokeAttributes(v118, v143, v144, v145, v146, v147);

          if (v111 & (v124 >> 2) & 1 | (v130 >> 3) & 1 | (v136 >> 4) & 1 | (v142 >> 5) & 1 | (v148 >> 6) & 1)
            break;
          if (v110 == ++v112)
          {
            v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v106, (uint64_t)&v168, (uint64_t)v184, 16, v109);
            v48 = 1;
            if (v110)
              goto LABEL_11;
            v103 = obj;
            goto LABEL_47;
          }
        }

        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v103 = (id)qword_1EF568E60;
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
        {
          v152 = CFSTR("YES");
          if ((v124 & 4) != 0)
            v153 = CFSTR("YES");
          else
            v153 = CFSTR("NO");
          *(_DWORD *)buf = 138413571;
          v173 = v153;
          if ((v130 & 8) != 0)
            v154 = CFSTR("YES");
          else
            v154 = CFSTR("NO");
          v174 = 2112;
          v175 = v154;
          if ((v136 & 0x10) != 0)
            v155 = CFSTR("YES");
          else
            v155 = CFSTR("NO");
          v176 = 2112;
          v177 = v155;
          if ((v142 & 0x20) != 0)
            v156 = CFSTR("YES");
          else
            v156 = CFSTR("NO");
          v178 = 2112;
          if ((v148 & 0x40) == 0)
            v152 = CFSTR("NO");
          v179 = v156;
          v180 = 2112;
          v181 = v152;
          v182 = 2117;
          v183 = v162;
          v149 = "Inventory data ingestion: rejecting text group as in contains undesired stroke attributes (synthetic %@"
                 ", finger drawn %@, pasted %@, shared ink %@, unsafe %@). Transcription string: %{sensitive}@";
          v150 = v103;
          v151 = 62;
          goto LABEL_45;
        }
LABEL_46:
        v48 = 0;
        goto LABEL_47;
      }
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v103 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
        goto LABEL_46;
      *(_DWORD *)buf = 138739971;
      v173 = v162;
      v149 = "Inventory data ingestion: rejecting text group due to not being Latin script and not having math result. Tr"
             "anscription string: %{sensitive}@";
      v150 = v103;
      v151 = 12;
    }
    else
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v103 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
        goto LABEL_46;
      *(_DWORD *)buf = 138412547;
      v173 = v159;
      v174 = 2117;
      v175 = v162;
      v149 = "Inventory data ingestion: rejecting text group as transcription string is not fully supported (supported in"
             "dexes: %@). Transcription string: %{sensitive}@";
      v150 = v103;
      v151 = 22;
    }
LABEL_45:
    _os_log_impl(&dword_1BE607000, v150, OS_LOG_TYPE_DEBUG, v149, buf, v151);
    goto LABEL_46;
  }
  v48 = 0;
LABEL_48:

  return v48;
}

- (CHRecognitionSessionResult)inputResult
{
  return self->_inputResult;
}

- (int64_t)status
{
  return self->_status;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (CHRecognitionSessionTaskDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CHRecognitionSessionTaskDelegate *)a3;
}

- (int64_t)sessionMode
{
  return self->_sessionMode;
}

- (NSArray)recognitionLocales
{
  return self->_recognitionLocales;
}

- (NSArray)preferredLocales
{
  return self->_preferredLocales;
}

- (CHStrokeProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (CHCalculateDocumentProvider)calculateDocumentProvider
{
  return self->_calculateDocumentProvider;
}

- (CHRecognitionSessionResult)outputResult
{
  return self->_outputResult;
}

- (int64_t)recognitionEnvironment
{
  return self->_recognitionEnvironment;
}

- (int64_t)strokeGroupingRequirement
{
  return self->_strokeGroupingRequirement;
}

- (int64_t)principalLineRequirement
{
  return self->_principalLineRequirement;
}

- (BOOL)isHighResponsivenessTask
{
  return self->_isHighResponsivenessTask;
}

- (NSDictionary)recognitionOptions
{
  return self->_recognitionOptions;
}

- (BOOL)disableMathTextSwapping
{
  return self->_disableMathTextSwapping;
}

- (void)setDisableMathTextSwapping:(BOOL)a3
{
  self->_disableMathTextSwapping = a3;
}

- (BOOL)saveInputDrawings
{
  return self->_saveInputDrawings;
}

- (void)setSaveInputDrawings:(BOOL)a3
{
  self->_saveInputDrawings = a3;
}

- (NSSet)forceRecognitionStrokeGroupIdentifiers
{
  return self->_forceRecognitionStrokeGroupIdentifiers;
}

- (void)setForceRecognitionStrokeGroupIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (BOOL)strokeGroupingOnly
{
  return self->_strokeGroupingOnly;
}

- (void)setStrokeGroupingOnly:(BOOL)a3
{
  self->_strokeGroupingOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitsTrie, 0);
  objc_storeStrong(&self->_partialResultBlock, 0);
  objc_storeStrong((id *)&self->_subjectStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_strokeGroupingModel, 0);
  objc_storeStrong((id *)&self->_strokeClassificationModel, 0);
  objc_storeStrong((id *)&self->__recognizersQueue, 0);
  objc_storeStrong((id *)&self->_forceRecognitionStrokeGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_recognitionOptions, 0);
  objc_storeStrong((id *)&self->_outputResult, 0);
  objc_storeStrong((id *)&self->_calculateDocumentProvider, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_storeStrong((id *)&self->_preferredLocales, 0);
  objc_storeStrong((id *)&self->_recognitionLocales, 0);
  objc_storeStrong((id *)&self->_inputResult, 0);
  sub_1BE61C7EC((uint64_t)&self->_tokenPropertiesHelper);
  objc_storeStrong((id *)&self->_intermediateDeclaredVariables, 0);
}

- (id).cxx_construct
{
  sub_1BE61CB7C((uint64_t)&self->_tokenPropertiesHelper);
  return self;
}

@end
