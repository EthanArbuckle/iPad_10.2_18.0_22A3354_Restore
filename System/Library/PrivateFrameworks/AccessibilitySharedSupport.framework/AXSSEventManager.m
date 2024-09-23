@implementation AXSSEventManager

- (AXSSEventManager)initWithActionManager:(id)a3
{
  id v4;
  void *v5;
  AXSSEventManager *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[AXSSEventManager initWithActionManager:commandMap:](self, "initWithActionManager:commandMap:", v4, v5);

  return v6;
}

- (AXSSEventManager)initWithActionManager:(id)a3 commandMap:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  uint64_t v87;
  NSDictionary *commandInfos;
  double v89;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  id v157;
  AXSSEventManager *val;
  _QWORD v159[4];
  id v160;
  id v161;
  _QWORD v162[4];
  id v163;
  id v164;
  _QWORD v165[4];
  id v166;
  id v167;
  _QWORD v168[4];
  id v169;
  id v170;
  _QWORD v171[4];
  id v172;
  id v173;
  _QWORD v174[4];
  id v175;
  id v176;
  _QWORD v177[4];
  id v178;
  id v179;
  _QWORD v180[4];
  id v181;
  id v182;
  _QWORD v183[4];
  id v184;
  id v185;
  _QWORD v186[4];
  id v187;
  id v188;
  _QWORD v189[4];
  id v190;
  id v191;
  _QWORD v192[4];
  id v193;
  id v194;
  _QWORD v195[4];
  id v196;
  id v197;
  _QWORD v198[4];
  id v199;
  id v200;
  _QWORD v201[4];
  id v202;
  id v203;
  _QWORD v204[4];
  id v205;
  id v206;
  _QWORD v207[4];
  id v208;
  id v209;
  _QWORD v210[4];
  id v211;
  id v212;
  _QWORD v213[4];
  id v214;
  _QWORD v215[4];
  id v216;
  _QWORD v217[4];
  id v218;
  id v219;
  _QWORD v220[4];
  id v221;
  id v222;
  _QWORD v223[4];
  id v224;
  id v225;
  _QWORD v226[4];
  id v227;
  id v228;
  _QWORD v229[4];
  id v230;
  id v231;
  _QWORD v232[4];
  id v233;
  id v234;
  _QWORD v235[4];
  id v236;
  id v237;
  _QWORD v238[4];
  id v239;
  id v240;
  _QWORD v241[4];
  id v242;
  id v243;
  _QWORD v244[4];
  id v245;
  id v246;
  _QWORD v247[4];
  id v248;
  id v249;
  _QWORD v250[4];
  id v251;
  id v252;
  _QWORD v253[4];
  id v254;
  id v255;
  _QWORD v256[4];
  id v257;
  id v258;
  _QWORD v259[4];
  id v260;
  id v261;
  _QWORD v262[4];
  id v263;
  id v264;
  _QWORD v265[4];
  id v266;
  id v267;
  _QWORD v268[4];
  id v269;
  id v270;
  _QWORD v271[4];
  id v272;
  id v273;
  _QWORD v274[4];
  id v275;
  id v276;
  _QWORD v277[4];
  id v278;
  id v279;
  _QWORD v280[4];
  id v281;
  id v282;
  _QWORD v283[4];
  id v284;
  id v285;
  _QWORD v286[4];
  id v287;
  _QWORD v288[4];
  id v289;
  _QWORD v290[4];
  id v291;
  _QWORD v292[4];
  id v293;
  _QWORD v294[4];
  id v295;
  _QWORD v296[4];
  id v297;
  _QWORD v298[4];
  id v299;
  _QWORD v300[4];
  id v301;
  _QWORD v302[4];
  id v303;
  id v304;
  _QWORD v305[4];
  id v306;
  id v307;
  _QWORD v308[4];
  id v309;
  id v310;
  _QWORD v311[4];
  id v312;
  _QWORD v313[4];
  id v314;
  _QWORD v315[4];
  id v316;
  _QWORD v317[4];
  id v318;
  _QWORD v319[4];
  id v320;
  _QWORD v321[4];
  id v322;
  _QWORD v323[4];
  id v324;
  id v325;
  _QWORD v326[4];
  id v327;
  _QWORD v328[4];
  id v329;
  _QWORD v330[4];
  id v331;
  _QWORD v332[4];
  id v333;
  _QWORD v334[4];
  id v335;
  _QWORD v336[4];
  id v337;
  _QWORD v338[4];
  id v339;
  id v340;
  _QWORD v341[4];
  id v342;
  id v343;
  _QWORD v344[4];
  id v345;
  _QWORD v346[4];
  id v347;
  _QWORD v348[4];
  id v349;
  _QWORD v350[4];
  id v351;
  _QWORD v352[4];
  id v353;
  _QWORD v354[4];
  id v355;
  _QWORD v356[4];
  id v357;
  id v358;
  _QWORD v359[4];
  id v360;
  id v361;
  _QWORD v362[4];
  id v363;
  id v364;
  _QWORD v365[4];
  id v366;
  _QWORD v367[4];
  id v368;
  _QWORD v369[4];
  id v370;
  id v371;
  _QWORD v372[4];
  id v373;
  id v374;
  _QWORD v375[4];
  id v376;
  id v377;
  _QWORD v378[4];
  id v379;
  id v380;
  _QWORD v381[4];
  id v382;
  id v383;
  _QWORD v384[4];
  id v385;
  id v386;
  id v387;
  objc_super v388;
  _QWORD v389[71];
  _QWORD v390[73];

  v4 = MEMORY[0x1E0C80A78](self, a2, a3, a4);
  v6 = v5;
  v8 = v7;
  v9 = (void *)v4;
  v390[71] = *MEMORY[0x1E0C80C00];
  v157 = v7;
  v156 = v6;
  v388.receiver = v9;
  v388.super_class = (Class)AXSSEventManager;
  val = -[AXSSEventManager init](&v388, sel_init);
  if (val)
  {
    objc_storeStrong((id *)&val->_actionManager, v8);
    objc_storeStrong((id *)&val->_commandMap, v6);
    objc_initWeak(&v387, val);
    v389[0] = CFSTR("GoToNextElement");
    v10 = MEMORY[0x1E0C809B0];
    v384[0] = MEMORY[0x1E0C809B0];
    v384[1] = 3221225472;
    v384[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke;
    v384[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v386, &v387);
    v11 = v157;
    v385 = v11;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v384);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v390[0] = v140;
    v389[1] = CFSTR("GoToPreviousElement");
    v381[0] = v10;
    v381[1] = 3221225472;
    v381[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_2;
    v381[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v383, &v387);
    v12 = v11;
    v382 = v12;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v381);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v390[1] = v139;
    v389[2] = CFSTR("EnterContainer");
    v378[0] = v10;
    v378[1] = 3221225472;
    v378[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_3;
    v378[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v380, &v387);
    v13 = v12;
    v379 = v13;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v378);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v390[2] = v138;
    v389[3] = CFSTR("ExitContainer");
    v375[0] = v10;
    v375[1] = 3221225472;
    v375[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_4;
    v375[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v377, &v387);
    v14 = v13;
    v376 = v14;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v375);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v390[3] = v137;
    v389[4] = CFSTR("GoToNextSection");
    v372[0] = v10;
    v372[1] = 3221225472;
    v372[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_5;
    v372[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v374, &v387);
    v15 = v14;
    v373 = v15;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v372);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v390[4] = v136;
    v389[5] = CFSTR("GoToPreviousSection");
    v369[0] = v10;
    v369[1] = 3221225472;
    v369[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_6;
    v369[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v371, &v387);
    v16 = v15;
    v370 = v16;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v369);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v390[5] = v155;
    v389[6] = CFSTR("PressAndLift");
    v367[0] = v10;
    v367[1] = 3221225472;
    v367[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_7;
    v367[3] = &unk_1E5F98868;
    v368 = v16;
    v365[0] = v10;
    v365[1] = 3221225472;
    v365[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_8;
    v365[3] = &unk_1E5F98868;
    v17 = v368;
    v366 = v17;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v367, v365);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v390[6] = v135;
    v389[7] = CFSTR("ActivateSiri");
    v362[0] = v10;
    v362[1] = 3221225472;
    v362[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_9;
    v362[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v364, &v387);
    v18 = v17;
    v363 = v18;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v362);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v390[7] = v134;
    v389[8] = CFSTR("MoveLeft");
    v359[0] = v10;
    v359[1] = 3221225472;
    v359[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_10;
    v359[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v361, &v387);
    v19 = v18;
    v360 = v19;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v359);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v390[8] = v133;
    v389[9] = CFSTR("GoToFirstElement");
    v356[0] = v10;
    v356[1] = 3221225472;
    v356[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_11;
    v356[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v358, &v387);
    v20 = v19;
    v357 = v20;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v356);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v390[9] = v154;
    v389[10] = CFSTR("SwipeLeft");
    v354[0] = v10;
    v354[1] = 3221225472;
    v354[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_12;
    v354[3] = &unk_1E5F98868;
    v355 = v20;
    v352[0] = v10;
    v352[1] = 3221225472;
    v352[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_13;
    v352[3] = &unk_1E5F98868;
    v21 = v355;
    v353 = v21;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v354, v352);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v390[10] = v153;
    v389[11] = CFSTR("TwoFingerSwipeLeft");
    v350[0] = v10;
    v350[1] = 3221225472;
    v350[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_14;
    v350[3] = &unk_1E5F98868;
    v351 = v21;
    v348[0] = v10;
    v348[1] = 3221225472;
    v348[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_15;
    v348[3] = &unk_1E5F98868;
    v22 = v351;
    v349 = v22;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v350, v348);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v390[11] = v152;
    v389[12] = CFSTR("RotateLeft");
    v346[0] = v10;
    v346[1] = 3221225472;
    v346[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_16;
    v346[3] = &unk_1E5F98868;
    v347 = v22;
    v344[0] = v10;
    v344[1] = 3221225472;
    v344[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_17;
    v344[3] = &unk_1E5F98868;
    v23 = v347;
    v345 = v23;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v346, v344);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v390[12] = v132;
    v389[13] = CFSTR("MoveRight");
    v341[0] = v10;
    v341[1] = 3221225472;
    v341[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_18;
    v341[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v343, &v387);
    v24 = v23;
    v342 = v24;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v341);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v390[13] = v131;
    v389[14] = CFSTR("GoToLastElement");
    v338[0] = v10;
    v338[1] = 3221225472;
    v338[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_19;
    v338[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v340, &v387);
    v25 = v24;
    v339 = v25;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v338);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v390[14] = v151;
    v389[15] = CFSTR("SwipeRight");
    v336[0] = v10;
    v336[1] = 3221225472;
    v336[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_20;
    v336[3] = &unk_1E5F98868;
    v337 = v25;
    v334[0] = v10;
    v334[1] = 3221225472;
    v334[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_21;
    v334[3] = &unk_1E5F98868;
    v26 = v337;
    v335 = v26;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v336, v334);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v390[15] = v150;
    v389[16] = CFSTR("TwoFingerSwipeRight");
    v332[0] = v10;
    v332[1] = 3221225472;
    v332[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_22;
    v332[3] = &unk_1E5F98868;
    v333 = v26;
    v330[0] = v10;
    v330[1] = 3221225472;
    v330[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_23;
    v330[3] = &unk_1E5F98868;
    v27 = v333;
    v331 = v27;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v332, v330);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v390[16] = v149;
    v389[17] = CFSTR("RotateRight");
    v328[0] = v10;
    v328[1] = 3221225472;
    v328[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_24;
    v328[3] = &unk_1E5F98868;
    v329 = v27;
    v326[0] = v10;
    v326[1] = 3221225472;
    v326[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_25;
    v326[3] = &unk_1E5F98868;
    v28 = v329;
    v327 = v28;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v328, v326);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v390[17] = v130;
    v389[18] = CFSTR("MoveUp");
    v323[0] = v10;
    v323[1] = 3221225472;
    v323[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_26;
    v323[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v325, &v387);
    v29 = v28;
    v324 = v29;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v323);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v390[18] = v148;
    v389[19] = CFSTR("SwipeUp");
    v321[0] = v10;
    v321[1] = 3221225472;
    v321[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_27;
    v321[3] = &unk_1E5F98868;
    v322 = v29;
    v319[0] = v10;
    v319[1] = 3221225472;
    v319[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_28;
    v319[3] = &unk_1E5F98868;
    v30 = v322;
    v320 = v30;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v321, v319);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v390[19] = v147;
    v389[20] = CFSTR("TwoFingerSwipeUp");
    v317[0] = v10;
    v317[1] = 3221225472;
    v317[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_29;
    v317[3] = &unk_1E5F98868;
    v318 = v30;
    v315[0] = v10;
    v315[1] = 3221225472;
    v315[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_30;
    v315[3] = &unk_1E5F98868;
    v31 = v318;
    v316 = v31;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v317, v315);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v390[20] = v146;
    v389[21] = CFSTR("PinchOut");
    v313[0] = v10;
    v313[1] = 3221225472;
    v313[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_31;
    v313[3] = &unk_1E5F98868;
    v314 = v31;
    v311[0] = v10;
    v311[1] = 3221225472;
    v311[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_32;
    v311[3] = &unk_1E5F98868;
    v32 = v314;
    v312 = v32;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v313, v311);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v390[21] = v129;
    v389[22] = CFSTR("MoveDown");
    v308[0] = v10;
    v308[1] = 3221225472;
    v308[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_33;
    v308[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v310, &v387);
    v33 = v32;
    v309 = v33;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v308);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v390[22] = v128;
    v389[23] = CFSTR("MoveInsideNext");
    v305[0] = v10;
    v305[1] = 3221225472;
    v305[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_34;
    v305[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v307, &v387);
    v34 = v33;
    v306 = v34;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v305);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v390[23] = v127;
    v389[24] = CFSTR("MoveInsidePrevious");
    v302[0] = v10;
    v302[1] = 3221225472;
    v302[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_35;
    v302[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v304, &v387);
    v35 = v34;
    v303 = v35;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v302);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v390[24] = v145;
    v389[25] = CFSTR("SwipeDown");
    v300[0] = v10;
    v300[1] = 3221225472;
    v300[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_36;
    v300[3] = &unk_1E5F98868;
    v301 = v35;
    v298[0] = v10;
    v298[1] = 3221225472;
    v298[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_37;
    v298[3] = &unk_1E5F98868;
    v36 = v301;
    v299 = v36;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v300, v298);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v390[25] = v144;
    v389[26] = CFSTR("TwoFingerSwipeDown");
    v296[0] = v10;
    v296[1] = 3221225472;
    v296[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_38;
    v296[3] = &unk_1E5F98868;
    v297 = v36;
    v294[0] = v10;
    v294[1] = 3221225472;
    v294[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_39;
    v294[3] = &unk_1E5F98868;
    v37 = v297;
    v295 = v37;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v296, v294);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v390[26] = v143;
    v389[27] = CFSTR("PinchIn");
    v292[0] = v10;
    v292[1] = 3221225472;
    v292[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_40;
    v292[3] = &unk_1E5F98868;
    v293 = v37;
    v290[0] = v10;
    v290[1] = 3221225472;
    v290[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_41;
    v290[3] = &unk_1E5F98868;
    v38 = v293;
    v291 = v38;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v292, v290);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v390[27] = v142;
    v389[28] = CFSTR("TwoFingerPressAndLift");
    v288[0] = v10;
    v288[1] = 3221225472;
    v288[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_42;
    v288[3] = &unk_1E5F98868;
    v289 = v38;
    v286[0] = v10;
    v286[1] = 3221225472;
    v286[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_43;
    v286[3] = &unk_1E5F98868;
    v39 = v289;
    v287 = v39;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v288, v286);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v390[28] = v126;
    v389[29] = CFSTR("PerformDefaultAction");
    v283[0] = v10;
    v283[1] = 3221225472;
    v283[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_44;
    v283[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v285, &v387);
    v40 = v39;
    v284 = v40;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v283);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v390[29] = v125;
    v389[30] = CFSTR("GoHome");
    v280[0] = v10;
    v280[1] = 3221225472;
    v280[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_45;
    v280[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v282, &v387);
    v41 = v40;
    v281 = v41;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v280);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v390[30] = v124;
    v389[31] = CFSTR("OpenContextualMenu");
    v277[0] = v10;
    v277[1] = 3221225472;
    v277[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_46;
    v277[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v279, &v387);
    v42 = v41;
    v278 = v42;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v277);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v390[31] = v123;
    v389[32] = CFSTR("ShowAccessibilityActions");
    v274[0] = v10;
    v274[1] = 3221225472;
    v274[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_47;
    v274[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v276, &v387);
    v43 = v42;
    v275 = v43;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v274);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v390[32] = v122;
    v389[33] = CFSTR("ToggleAppSwitcher");
    v271[0] = v10;
    v271[1] = 3221225472;
    v271[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_48;
    v271[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v273, &v387);
    v44 = v43;
    v272 = v44;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v271);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v390[33] = v121;
    v389[34] = CFSTR("ToggleAppLibrary");
    v268[0] = v10;
    v268[1] = 3221225472;
    v268[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_49;
    v268[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v270, &v387);
    v45 = v44;
    v269 = v45;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v268);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v390[34] = v120;
    v389[35] = CFSTR("ToggleQuickNote");
    v265[0] = v10;
    v265[1] = 3221225472;
    v265[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_50;
    v265[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v267, &v387);
    v46 = v45;
    v266 = v46;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v265);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v390[35] = v119;
    v389[36] = CFSTR("ActivateAccessibilityShortcut");
    v262[0] = v10;
    v262[1] = 3221225472;
    v262[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_51;
    v262[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v264, &v387);
    v47 = v46;
    v263 = v47;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v262);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v390[36] = v118;
    v389[37] = CFSTR("ToggleControlCenter");
    v259[0] = v10;
    v259[1] = 3221225472;
    v259[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_52;
    v259[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v261, &v387);
    v48 = v47;
    v260 = v48;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v259);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v390[37] = v117;
    v389[38] = CFSTR("ToggleDock");
    v256[0] = v10;
    v256[1] = 3221225472;
    v256[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_53;
    v256[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v258, &v387);
    v49 = v48;
    v257 = v49;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v256);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v390[38] = v116;
    v389[39] = CFSTR("PerformEscape");
    v253[0] = v10;
    v253[1] = 3221225472;
    v253[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_54;
    v253[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v255, &v387);
    v50 = v49;
    v254 = v50;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v253);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v390[39] = v115;
    v389[40] = CFSTR("PerformSysdiagnose");
    v250[0] = v10;
    v250[1] = 3221225472;
    v250[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_55;
    v250[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v252, &v387);
    v51 = v50;
    v251 = v51;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v250);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v390[40] = v114;
    v389[41] = CFSTR("LockScreen");
    v247[0] = v10;
    v247[1] = 3221225472;
    v247[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_56;
    v247[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v249, &v387);
    v52 = v51;
    v248 = v52;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v247);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v390[41] = v113;
    v389[42] = CFSTR("ToggleNotificationCenter");
    v244[0] = v10;
    v244[1] = 3221225472;
    v244[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_57;
    v244[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v246, &v387);
    v53 = v52;
    v245 = v53;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v244);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v390[42] = v112;
    v389[43] = CFSTR("ArmApplePay");
    v241[0] = v10;
    v241[1] = 3221225472;
    v241[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_58;
    v241[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v243, &v387);
    v54 = v53;
    v242 = v54;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v241);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v390[43] = v111;
    v389[44] = CFSTR("RotateDevice");
    v238[0] = v10;
    v238[1] = 3221225472;
    v238[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_59;
    v238[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v240, &v387);
    v55 = v54;
    v239 = v55;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v238);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v390[44] = v110;
    v389[45] = CFSTR("RebootDevice");
    v235[0] = v10;
    v235[1] = 3221225472;
    v235[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_60;
    v235[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v237, &v387);
    v56 = v55;
    v236 = v56;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v235);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v390[45] = v109;
    v389[46] = CFSTR("ToggleMenuBar");
    v232[0] = v10;
    v232[1] = 3221225472;
    v232[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_61;
    v232[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v234, &v387);
    v57 = v56;
    v233 = v57;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v232);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v390[46] = v108;
    v389[47] = CFSTR("ActivateSOS");
    v229[0] = v10;
    v229[1] = 3221225472;
    v229[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_62;
    v229[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v231, &v387);
    v58 = v57;
    v230 = v58;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v229);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v390[47] = v107;
    v389[48] = CFSTR("ActivateTypeahead");
    v226[0] = v10;
    v226[1] = 3221225472;
    v226[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_63;
    v226[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v228, &v387);
    v59 = v58;
    v227 = v59;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v226);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v390[48] = v106;
    v389[49] = CFSTR("TogglePassthroughMode");
    v223[0] = v10;
    v223[1] = 3221225472;
    v223[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_64;
    v223[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v225, &v387);
    v60 = v59;
    v224 = v60;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v223);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v390[49] = v105;
    v389[50] = CFSTR("Gestures");
    v220[0] = v10;
    v220[1] = 3221225472;
    v220[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_65;
    v220[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v222, &v387);
    v61 = v60;
    v221 = v61;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v220);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v390[50] = v104;
    v389[51] = CFSTR("Help");
    v217[0] = v10;
    v217[1] = 3221225472;
    v217[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_66;
    v217[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v219, &v387);
    v62 = v61;
    v218 = v62;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v217);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v390[51] = v141;
    v389[52] = CFSTR("3DTouch");
    v215[0] = v10;
    v215[1] = 3221225472;
    v215[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_67;
    v215[3] = &unk_1E5F98868;
    v216 = v62;
    v213[0] = v10;
    v213[1] = 3221225472;
    v213[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_68;
    v213[3] = &unk_1E5F98868;
    v63 = v216;
    v214 = v63;
    +[AXSSKeyboardCommandInfo infoWithDownHandler:upHandler:](AXSSKeyboardCommandInfo, "infoWithDownHandler:upHandler:", v215, v213);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v390[52] = v103;
    v389[53] = CFSTR("MovePointerToFocus");
    v210[0] = v10;
    v210[1] = 3221225472;
    v210[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_69;
    v210[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v212, &v387);
    v64 = v63;
    v211 = v64;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v210);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v390[53] = v102;
    v389[54] = CFSTR("WindowList");
    v207[0] = v10;
    v207[1] = 3221225472;
    v207[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_70;
    v207[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v209, &v387);
    v65 = v64;
    v208 = v65;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v207);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v390[54] = v101;
    v389[55] = CFSTR("ApplicationList");
    v204[0] = v10;
    v204[1] = 3221225472;
    v204[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_71;
    v204[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v206, &v387);
    v66 = v65;
    v205 = v66;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v204);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v390[55] = v100;
    v389[56] = CFSTR("NextButton");
    v201[0] = v10;
    v201[1] = 3221225472;
    v201[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_72;
    v201[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v203, &v387);
    v67 = v66;
    v202 = v67;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v201);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v390[56] = v99;
    v389[57] = CFSTR("PreviousButton");
    v198[0] = v10;
    v198[1] = 3221225472;
    v198[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_73;
    v198[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v200, &v387);
    v68 = v67;
    v199 = v68;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v198);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v390[57] = v98;
    v389[58] = CFSTR("NextCheckbox");
    v195[0] = v10;
    v195[1] = 3221225472;
    v195[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_74;
    v195[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v197, &v387);
    v69 = v68;
    v196 = v69;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v195);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v390[58] = v97;
    v389[59] = CFSTR("PreviousCheckbox");
    v192[0] = v10;
    v192[1] = 3221225472;
    v192[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_75;
    v192[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v194, &v387);
    v70 = v69;
    v193 = v70;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v192);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v390[59] = v96;
    v389[60] = CFSTR("NextTable");
    v189[0] = v10;
    v189[1] = 3221225472;
    v189[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_76;
    v189[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v191, &v387);
    v71 = v70;
    v190 = v71;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v189);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v390[60] = v95;
    v389[61] = CFSTR("PreviousTable");
    v186[0] = v10;
    v186[1] = 3221225472;
    v186[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_77;
    v186[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v188, &v387);
    v72 = v71;
    v187 = v72;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v186);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v390[61] = v94;
    v389[62] = CFSTR("NextImage");
    v183[0] = v10;
    v183[1] = 3221225472;
    v183[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_78;
    v183[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v185, &v387);
    v73 = v72;
    v184 = v73;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v183);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v390[62] = v93;
    v389[63] = CFSTR("PreviousImage");
    v180[0] = v10;
    v180[1] = 3221225472;
    v180[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_79;
    v180[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v182, &v387);
    v74 = v73;
    v181 = v74;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v180);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v390[63] = v92;
    v389[64] = CFSTR("NextLink");
    v177[0] = v10;
    v177[1] = 3221225472;
    v177[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_80;
    v177[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v179, &v387);
    v75 = v74;
    v178 = v75;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v177);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v390[64] = v91;
    v389[65] = CFSTR("PreviousLink");
    v174[0] = v10;
    v174[1] = 3221225472;
    v174[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_81;
    v174[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v176, &v387);
    v76 = v75;
    v175 = v76;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v174);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v390[65] = v77;
    v389[66] = CFSTR("NextHeading");
    v171[0] = v10;
    v171[1] = 3221225472;
    v171[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_82;
    v171[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v173, &v387);
    v78 = v76;
    v172 = v78;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v171);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v390[66] = v79;
    v389[67] = CFSTR("PreviousHeading");
    v168[0] = v10;
    v168[1] = 3221225472;
    v168[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_83;
    v168[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v170, &v387);
    v80 = v78;
    v169 = v80;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v168);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v390[67] = v81;
    v389[68] = CFSTR("NextTextField");
    v165[0] = v10;
    v165[1] = 3221225472;
    v165[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_84;
    v165[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v167, &v387);
    v82 = v80;
    v166 = v82;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v165);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v390[68] = v83;
    v389[69] = CFSTR("PreviousTextField");
    v162[0] = v10;
    v162[1] = 3221225472;
    v162[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_85;
    v162[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v164, &v387);
    v84 = v82;
    v163 = v84;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v162);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v390[69] = v85;
    v389[70] = CFSTR("Escape");
    v159[0] = v10;
    v159[1] = 3221225472;
    v159[2] = __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_86;
    v159[3] = &unk_1E5F99CD0;
    objc_copyWeak(&v161, &v387);
    v160 = v84;
    +[AXSSKeyboardCommandInfo infoWithHandler:](AXSSKeyboardCommandInfo, "infoWithHandler:", v159);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v390[70] = v86;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v390, v389, 71);
    v87 = objc_claimAutoreleasedReturnValue();
    commandInfos = val->__commandInfos;
    val->__commandInfos = (NSDictionary *)v87;

    _AXSKeyRepeatDelay();
    val->_minimumDelayUntilRepeat = v89;

    objc_destroyWeak(&v161);
    objc_destroyWeak(&v164);

    objc_destroyWeak(&v167);
    objc_destroyWeak(&v170);

    objc_destroyWeak(&v173);
    objc_destroyWeak(&v176);

    objc_destroyWeak(&v179);
    objc_destroyWeak(&v182);

    objc_destroyWeak(&v185);
    objc_destroyWeak(&v188);

    objc_destroyWeak(&v191);
    objc_destroyWeak(&v194);

    objc_destroyWeak(&v197);
    objc_destroyWeak(&v200);

    objc_destroyWeak(&v203);
    objc_destroyWeak(&v206);

    objc_destroyWeak(&v209);
    objc_destroyWeak(&v212);

    objc_destroyWeak(&v219);
    objc_destroyWeak(&v222);

    objc_destroyWeak(&v225);
    objc_destroyWeak(&v228);

    objc_destroyWeak(&v231);
    objc_destroyWeak(&v234);

    objc_destroyWeak(&v237);
    objc_destroyWeak(&v240);

    objc_destroyWeak(&v243);
    objc_destroyWeak(&v246);

    objc_destroyWeak(&v249);
    objc_destroyWeak(&v252);

    objc_destroyWeak(&v255);
    objc_destroyWeak(&v258);

    objc_destroyWeak(&v261);
    objc_destroyWeak(&v264);

    objc_destroyWeak(&v267);
    objc_destroyWeak(&v270);

    objc_destroyWeak(&v273);
    objc_destroyWeak(&v276);

    objc_destroyWeak(&v279);
    objc_destroyWeak(&v282);

    objc_destroyWeak(&v285);
    objc_destroyWeak(&v304);

    objc_destroyWeak(&v307);
    objc_destroyWeak(&v310);

    objc_destroyWeak(&v325);
    objc_destroyWeak(&v340);

    objc_destroyWeak(&v343);
    objc_destroyWeak(&v358);

    objc_destroyWeak(&v361);
    objc_destroyWeak(&v364);

    objc_destroyWeak(&v371);
    objc_destroyWeak(&v374);

    objc_destroyWeak(&v377);
    objc_destroyWeak(&v380);

    objc_destroyWeak(&v383);
    objc_destroyWeak(&v386);
    objc_destroyWeak(&v387);
  }

  return val;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("GoToNextElement"));
  objc_msgSend(*(id *)(a1 + 32), "goToNextElementOfType:", objc_msgSend(WeakRetained, "searchType"));
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("GoToNextElement"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("GoToPreviousElement"));
  objc_msgSend(*(id *)(a1 + 32), "goToPreviousElementOfType:", objc_msgSend(WeakRetained, "searchType"));
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("GoToPreviousElement"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("EnterContainer"));
  objc_msgSend(*(id *)(a1 + 32), "enterContainer");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("EnterContainer"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ExitContainer"));
  objc_msgSend(*(id *)(a1 + 32), "exitContainer");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ExitContainer"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("GoToNextSection"));
  objc_msgSend(*(id *)(a1 + 32), "goToNextSection");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("GoToNextSection"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("GoToPreviousSection"));
  objc_msgSend(*(id *)(a1 + 32), "goToPreviousSection");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("GoToPreviousSection"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PressAndLift"));
  return objc_msgSend(*(id *)(a1 + 32), "press");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "lift");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PressAndLift"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_9(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ActivateSiri"));
  objc_msgSend(*(id *)(a1 + 32), "activateSiri");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ActivateSiri"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_10(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("MoveLeft"));
  objc_msgSend(*(id *)(a1 + 32), "moveLeft");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("MoveLeft"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_11(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("GoToFirstElement"));
  objc_msgSend(*(id *)(a1 + 32), "goToFirstElement");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("GoToFirstElement"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_12(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("SwipeLeft"));
  return objc_msgSend(*(id *)(a1 + 32), "beginSwipeLeft");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_13(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endSwipe");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("SwipeLeft"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_14(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("TwoFingerSwipeLeft"));
  return objc_msgSend(*(id *)(a1 + 32), "beginTwoFingerSwipeLeft");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_15(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endSwipe");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("TwoFingerSwipeLeft"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_16(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("RotateLeft"));
  return objc_msgSend(*(id *)(a1 + 32), "beginRotateLeft");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_17(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endRotate");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("RotateLeft"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_18(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("MoveRight"));
  objc_msgSend(*(id *)(a1 + 32), "moveRight");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("MoveRight"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_19(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("GoToLastElement"));
  objc_msgSend(*(id *)(a1 + 32), "goToLastElement");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("GoToLastElement"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_20(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("SwipeRight"));
  return objc_msgSend(*(id *)(a1 + 32), "beginSwipeRight");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_21(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endSwipe");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("SwipeRight"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_22(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("TwoFingerSwipeRight"));
  return objc_msgSend(*(id *)(a1 + 32), "beginTwoFingerSwipeRight");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_23(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endSwipe");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("TwoFingerSwipeRight"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_24(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("RotateRight"));
  return objc_msgSend(*(id *)(a1 + 32), "beginRotateRight");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_25(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endRotate");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("RotateRight"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_26(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("MoveUp"));
  objc_msgSend(*(id *)(a1 + 32), "moveUp");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("MoveUp"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_27(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("SwipeUp"));
  return objc_msgSend(*(id *)(a1 + 32), "beginSwipeUp");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_28(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endSwipe");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("SwipeUp"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_29(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("TwoFingerSwipeUp"));
  return objc_msgSend(*(id *)(a1 + 32), "beginTwoFingerSwipeUp");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_30(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endSwipe");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("TwoFingerSwipeUp"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_31(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PinchOut"));
  return objc_msgSend(*(id *)(a1 + 32), "beginPinchOut");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_32(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endPinch");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PinchOut"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_33(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("MoveDown"));
  objc_msgSend(*(id *)(a1 + 32), "moveDown");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("MoveDown"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_34(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("MoveInsideNext"));
  objc_msgSend(*(id *)(a1 + 32), "moveInsideNext");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("MoveInsideNext"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_35(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("MoveInsidePrevious"));
  objc_msgSend(*(id *)(a1 + 32), "moveInsidePrevious");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("MoveInsidePrevious"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_36(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("SwipeDown"));
  return objc_msgSend(*(id *)(a1 + 32), "beginSwipeDown");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_37(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endSwipe");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("SwipeDown"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_38(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("TwoFingerSwipeDown"));
  return objc_msgSend(*(id *)(a1 + 32), "beginTwoFingerSwipeDown");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_39(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endSwipe");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("TwoFingerSwipeDown"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_40(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PinchIn"));
  return objc_msgSend(*(id *)(a1 + 32), "beginPinchIn");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_41(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endPinch");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PinchIn"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_42(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("TwoFingerPressAndLift"));
  return objc_msgSend(*(id *)(a1 + 32), "twoFingerPress");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_43(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "twoFingerLift");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("TwoFingerPressAndLift"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_44(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PerformDefaultAction"));
  objc_msgSend(*(id *)(a1 + 32), "performDefaultAction");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PerformDefaultAction"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_45(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("GoHome"));
  objc_msgSend(*(id *)(a1 + 32), "goHome");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("GoHome"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_46(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("OpenContextualMenu"));
  objc_msgSend(*(id *)(a1 + 32), "openContextualMenu");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("OpenContextualMenu"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_47(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ShowAccessibilityActions"));
  objc_msgSend(*(id *)(a1 + 32), "showAccessibilityActions");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ShowAccessibilityActions"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_48(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ToggleAppSwitcher"));
  objc_msgSend(*(id *)(a1 + 32), "toggleAppSwitcher");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ToggleAppSwitcher"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_49(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ToggleAppLibrary"));
  objc_msgSend(*(id *)(a1 + 32), "toggleAppLibrary");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ToggleAppLibrary"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_50(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ToggleQuickNote"));
  objc_msgSend(*(id *)(a1 + 32), "toggleQuickNote");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ToggleQuickNote"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_51(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ActivateAccessibilityShortcut"));
  objc_msgSend(*(id *)(a1 + 32), "activateAccessibilityShortcut");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ActivateAccessibilityShortcut"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_52(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ToggleControlCenter"));
  objc_msgSend(*(id *)(a1 + 32), "toggleControlCenter");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ToggleControlCenter"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_53(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ToggleDock"));
  objc_msgSend(*(id *)(a1 + 32), "toggleDock");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ToggleDock"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_54(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PerformEscape"));
  objc_msgSend(*(id *)(a1 + 32), "performEscape");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PerformEscape"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_55(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PerformSysdiagnose"));
  objc_msgSend(*(id *)(a1 + 32), "performSysdiagnose");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PerformSysdiagnose"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_56(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("LockScreen"));
  objc_msgSend(*(id *)(a1 + 32), "lockScreen");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("LockScreen"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_57(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ToggleNotificationCenter"));
  objc_msgSend(*(id *)(a1 + 32), "toggleNotificationCenter");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ToggleNotificationCenter"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_58(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ArmApplePay"));
  objc_msgSend(*(id *)(a1 + 32), "armApplePay");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ArmApplePay"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_59(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("RotateDevice"));
  objc_msgSend(*(id *)(a1 + 32), "rotateDevice");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("RotateDevice"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_60(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("RebootDevice"));
  objc_msgSend(*(id *)(a1 + 32), "rebootDevice");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("RebootDevice"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_61(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ToggleMenuBar"));
  objc_msgSend(*(id *)(a1 + 32), "toggleMenuBar");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ToggleMenuBar"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_62(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ActivateSOS"));
  objc_msgSend(*(id *)(a1 + 32), "activateSOS");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ActivateSOS"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_63(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ActivateTypeahead"));
  objc_msgSend(*(id *)(a1 + 32), "activateTypeahead");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ActivateTypeahead"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_64(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("TogglePassthroughMode"));
  objc_msgSend(*(id *)(a1 + 32), "togglePassthroughMode");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("TogglePassthroughMode"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_65(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("Gestures"));
  objc_msgSend(*(id *)(a1 + 32), "toggleGesturesMode");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("Gestures"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_66(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("Help"));
  objc_msgSend(*(id *)(a1 + 32), "toggleHelp");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("Help"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_67(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("3DTouch"));
  return objc_msgSend(*(id *)(a1 + 32), "begin3DTouch");
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_68(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "end3DTouch");
  return objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("3DTouch"));
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_69(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("MovePointerToFocus"));
  objc_msgSend(*(id *)(a1 + 32), "movePointerToFocus");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("MovePointerToFocus"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_70(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("WindowList"));
  objc_msgSend(*(id *)(a1 + 32), "toggleWindowList");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("WindowList"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_71(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("ApplicationList"));
  objc_msgSend(*(id *)(a1 + 32), "toggleApplicationList");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("ApplicationList"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_72(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("NextButton"));
  objc_msgSend(*(id *)(a1 + 32), "nextButton");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("NextButton"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_73(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PreviousButton"));
  objc_msgSend(*(id *)(a1 + 32), "previousButton");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PreviousButton"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_74(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("NextCheckbox"));
  objc_msgSend(*(id *)(a1 + 32), "nextCheckbox");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("NextCheckbox"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_75(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PreviousCheckbox"));
  objc_msgSend(*(id *)(a1 + 32), "previousCheckbox");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PreviousCheckbox"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_76(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("NextTable"));
  objc_msgSend(*(id *)(a1 + 32), "nextTable");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("NextTable"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_77(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PreviousTable"));
  objc_msgSend(*(id *)(a1 + 32), "previousTable");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PreviousTable"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_78(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("NextImage"));
  objc_msgSend(*(id *)(a1 + 32), "nextImage");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("NextImage"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_79(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PreviousImage"));
  objc_msgSend(*(id *)(a1 + 32), "previousImage");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PreviousImage"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_80(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("NextLink"));
  objc_msgSend(*(id *)(a1 + 32), "nextLink");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("NextLink"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_81(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PreviousLink"));
  objc_msgSend(*(id *)(a1 + 32), "previousLink");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PreviousLink"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_82(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("NextHeading"));
  objc_msgSend(*(id *)(a1 + 32), "nextHeading");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("NextHeading"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_83(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PreviousHeading"));
  objc_msgSend(*(id *)(a1 + 32), "previousHeading");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PreviousHeading"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_84(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("NextTextField"));
  objc_msgSend(*(id *)(a1 + 32), "nextTextField");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("NextTextField"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_85(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("PreviousTextField"));
  objc_msgSend(*(id *)(a1 + 32), "previousTextField");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("PreviousTextField"));

  return 1;
}

uint64_t __53__AXSSEventManager_initWithActionManager_commandMap___block_invoke_86(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willPerformStandardCommandWithIdentifier:", CFSTR("Escape"));
  v3 = objc_msgSend(*(id *)(a1 + 32), "handleEscapeKey");
  objc_msgSend(*(id *)(a1 + 32), "didPerformStandardCommandWithIdentifier:", CFSTR("Escape"));

  return v3;
}

- (BOOL)processKeyboardEvent:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  v5 = -[AXSSEventManager shouldCaptureEvent:](self, "shouldCaptureEvent:", v4);
  if (v5)
    -[AXSSEventManager handleFKAEvent:](self, "handleFKAEvent:", v4);

  return v5;
}

- (BOOL)processKeyboardCommand:(id)a3
{
  return -[AXSSEventManager _handleCommand:event:](self, "_handleCommand:event:", a3, 0);
}

- (BOOL)_performDownActionForCommand:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void (**v10)(void);
  uint64_t (**v11)(void);

  v6 = a3;
  v7 = a4;
  if (-[AXSSEventManager shouldSuppressCommands](self, "shouldSuppressCommands"))
  {
    -[AXSSEventManager actionManager](self, "actionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didSuppressCommand:", v6);

    v9 = 0;
  }
  else if (objc_msgSend(v7, "handlesBothDownAndUp"))
  {
    objc_msgSend(v7, "downHandler");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();

    -[AXSSEventManager set_lastDownAndUpCommandInfo:](self, "set_lastDownAndUpCommandInfo:", v7);
    v9 = 1;
  }
  else
  {
    objc_msgSend(v7, "handler");
    v11 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v9 = v11[2]();

  }
  return v9;
}

- (BOOL)_handleEvent:(id)a3 forCaptureOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void (**v11)(void);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a4;
  v6 = a3;
  if (!v4)
  {
    -[AXSSEventManager _lastDownAndUpCommandInfo](self, "_lastDownAndUpCommandInfo");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(v6, "isDownEvent");

      if ((v9 & 1) == 0)
      {
        -[AXSSEventManager _lastDownAndUpCommandInfo](self, "_lastDownAndUpCommandInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "upHandler");
        v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v11[2]();

        -[AXSSEventManager set_lastDownAndUpCommandInfo:](self, "set_lastDownAndUpCommandInfo:", 0);
      }
    }
  }
  v12 = objc_msgSend(v6, "keyCode");
  v13 = objc_msgSend(v6, "modifierMask");
  if (v12 != 43 || (v14 = v13, -[AXSSEventManager isPassthroughModeEnabled](self, "isPassthroughModeEnabled")))
  {
    if (-[AXSSEventManager _tabKeyPressed](self, "_tabKeyPressed"))
    {
      if (!v4 && objc_msgSend(v6, "isDownEvent"))
        -[AXSSEventManager _handleTabComboEvent:](self, "_handleTabComboEvent:", v6);
      goto LABEL_19;
    }
    objc_msgSend(v6, "keyChord");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[AXSSEventManager commandMap](self, "commandMap");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "commandForKeyChord:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        if (v4)
          goto LABEL_14;
      }
      else
      {
        -[AXSSEventManager commandMap](self, "commandMap");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "backupKeyChord");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "commandForKeyChord:", v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
        {
LABEL_14:
          if (-[AXSSEventManager isPassthroughModeEnabled](self, "isPassthroughModeEnabled"))
          {
            objc_msgSend(v17, "standardCommandIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("TogglePassthroughMode"));

          }
          else
          {
            v19 = v17 != 0;
          }
LABEL_27:

          goto LABEL_28;
        }
      }
      if (objc_msgSend(v6, "isDownEvent"))
        -[AXSSEventManager _handleCommand:event:](self, "_handleCommand:event:", v17, v6);
      v19 = 0;
      goto LABEL_27;
    }
    v19 = 0;
LABEL_28:

    goto LABEL_29;
  }
  if (!v4)
  {
    -[AXSSEventManager _handleTabEvent:](self, "_handleTabEvent:", v6);
    v19 = 0;
    goto LABEL_29;
  }
  if (v14)
  {
    -[AXSSEventManager commandMap](self, "commandMap");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyChord");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "commandForKeyChord:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v15 != 0;
    goto LABEL_28;
  }
LABEL_19:
  v19 = 1;
LABEL_29:

  return v19;
}

- (void)handleFKAEvent:(id)a3
{
  -[AXSSEventManager _handleEvent:forCaptureOnly:](self, "_handleEvent:forCaptureOnly:", a3, 0);
}

- (BOOL)shouldCaptureEvent:(id)a3
{
  return -[AXSSEventManager _handleEvent:forCaptureOnly:](self, "_handleEvent:forCaptureOnly:", a3, 1);
}

- (void)_handleTabRepeatOrUpWithCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    if (-[AXSSEventManager shouldSuppressCommands](self, "shouldSuppressCommands"))
    {
      -[AXSSEventManager actionManager](self, "actionManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "didSuppressCommand:", v11);
    }
    else
    {
      objc_msgSend(v11, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Standard"));

      if (v7)
      {
        -[AXSSEventManager _commandInfos](self, "_commandInfos");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "standardCommandIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v9);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5 && (objc_msgSend(v5, "handlesBothDownAndUp") & 1) == 0)
        {
          objc_msgSend(v5, "handler");
          v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v10[2]();

        }
      }
      else
      {
        -[AXSSEventManager actionManager](self, "actionManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleCommand:", v11);
      }
    }

    v4 = v11;
  }

}

- (void)_handleTabEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  double Current;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "keyChord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSEventManager commandMap](self, "commandMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commandForKeyChord:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v18, "isDownEvent");
  v8 = objc_msgSend(v18, "isRepeatEvent");
  v9 = v8;
  if (v7 && (v8 & 1) == 0)
  {
    -[AXSSEventManager set_lastTabPressTime:](self, "set_lastTabPressTime:", CFAbsoluteTimeGetCurrent());
    -[AXSSEventManager set_tabKeyPressed:](self, "set_tabKeyPressed:", 1);
  }
  if (!objc_msgSend(v18, "modifierMask"))
  {
    if (!-[AXSSEventManager _performedActionWhileTabComboPressed](self, "_performedActionWhileTabComboPressed") && v6)
    {
      if (v9)
      {
        Current = CFAbsoluteTimeGetCurrent();
        -[AXSSEventManager _lastTabPressTime](self, "_lastTabPressTime");
        v13 = Current - v12;
        -[AXSSEventManager minimumDelayUntilRepeat](self, "minimumDelayUntilRepeat");
        if (v13 <= v14)
          goto LABEL_16;
      }
      else if ((v7 & 1) != 0)
      {
        goto LABEL_19;
      }
      -[AXSSEventManager filterDelegate](self, "filterDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "eventManager:shouldRepostEvent:", self, v18);

      if (!v16)
      {
        -[AXSSEventManager _handleTabRepeatOrUpWithCommand:](self, "_handleTabRepeatOrUpWithCommand:", v6);
        if ((v7 & 1) != 0)
          goto LABEL_19;
        goto LABEL_17;
      }
      -[AXSSEventManager filterDelegate](self, "filterDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "eventManager:repostEvent:", self, v18);

    }
LABEL_16:
    if ((v7 & 1) != 0)
      goto LABEL_19;
LABEL_17:
    -[AXSSEventManager set_tabKeyPressed:](self, "set_tabKeyPressed:", 0);
    v10 = 0;
    goto LABEL_18;
  }
  if (!v7)
    goto LABEL_17;
  if (-[AXSSEventManager _handleCommand:event:](self, "_handleCommand:event:", v6, v18))
  {
    v10 = 1;
LABEL_18:
    -[AXSSEventManager set_performedActionWhileTabComboPressed:](self, "set_performedActionWhileTabComboPressed:", v10);
  }
LABEL_19:

}

- (id)_tabbedKeyChordForKeyChord:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(a3, "keys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", CFSTR("⇥"));
    +[AXSSKeyChord keyChordWithKeys:](AXSSKeyChord, "keyChordWithKeys:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_handleTabComboEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "keyChord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AXSSEventManager _tabbedKeyChordForKeyChord:](self, "_tabbedKeyChordForKeyChord:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSEventManager commandMap](self, "commandMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commandForKeyChord:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_11;
  }
  objc_msgSend(v12, "backupKeyChord");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v7 = 0;
    goto LABEL_8;
  }
  v9 = (void *)v8;
  -[AXSSEventManager _tabbedKeyChordForKeyChord:](self, "_tabbedKeyChordForKeyChord:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSEventManager commandMap](self, "commandMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commandForKeyChord:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_11:
    if (-[AXSSEventManager _handleCommand:event:](self, "_handleCommand:event:", v7, 0))
      -[AXSSEventManager set_performedActionWhileTabComboPressed:](self, "set_performedActionWhileTabComboPressed:", 1);
  }
LABEL_8:

}

- (BOOL)_handleCommand:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  BOOL v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_6;
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Standard"));

  if (v9)
  {
    if (v7)
    {
      -[AXSSEventManager filterDelegate](self, "filterDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "eventManager:shouldRepostEvent:", self, v7);

      if (v11)
      {
        -[AXSSEventManager filterDelegate](self, "filterDelegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "eventManager:repostEvent:", self, v7);

LABEL_6:
        v13 = 0;
        goto LABEL_21;
      }
    }
    -[AXSSEventManager _commandInfos](self, "_commandInfos");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "standardCommandIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (-[AXSSEventManager _performDownActionForCommand:info:](self, "_performDownActionForCommand:info:", v6, v19))
      {
        v13 = 1;
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(v6, "standardCommandIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("Escape"));

      if (v22)
      {
        -[AXSSEventManager filterDelegate](self, "filterDelegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "eventManager:repostEvent:", self, v7);

      }
    }
    else
    {
      FKALogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[AXSSEventManager _handleCommand:event:].cold.1((uint64_t)v6, v20);

    }
    v13 = 0;
    goto LABEL_20;
  }
  v14 = -[AXSSEventManager shouldSuppressCommands](self, "shouldSuppressCommands");
  -[AXSSEventManager actionManager](self, "actionManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
    objc_msgSend(v15, "didSuppressCommand:", v6);
  else
    objc_msgSend(v15, "handleCommand:", v6);

  v13 = 1;
LABEL_21:

  return v13;
}

- (AXSSActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_actionManager, a3);
}

- (unint64_t)searchType
{
  return self->_searchType;
}

- (void)setSearchType:(unint64_t)a3
{
  self->_searchType = a3;
}

- (AXSSKeyboardCommandMap)commandMap
{
  return self->_commandMap;
}

- (void)setCommandMap:(id)a3
{
  objc_storeStrong((id *)&self->_commandMap, a3);
}

- (AXSSKeyFilterDelegate)filterDelegate
{
  return (AXSSKeyFilterDelegate *)objc_loadWeakRetained((id *)&self->_filterDelegate);
}

- (void)setFilterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_filterDelegate, a3);
}

- (BOOL)shouldSuppressCommands
{
  return self->_shouldSuppressCommands;
}

- (void)setShouldSuppressCommands:(BOOL)a3
{
  self->_shouldSuppressCommands = a3;
}

- (BOOL)isPassthroughModeEnabled
{
  return self->_passthroughModeEnabled;
}

- (void)setPassthroughModeEnabled:(BOOL)a3
{
  self->_passthroughModeEnabled = a3;
}

- (NSDictionary)_commandInfos
{
  return self->__commandInfos;
}

- (BOOL)_tabKeyPressed
{
  return self->__tabKeyPressed;
}

- (void)set_tabKeyPressed:(BOOL)a3
{
  self->__tabKeyPressed = a3;
}

- (BOOL)_performedActionWhileTabComboPressed
{
  return self->__performedActionWhileTabComboPressed;
}

- (void)set_performedActionWhileTabComboPressed:(BOOL)a3
{
  self->__performedActionWhileTabComboPressed = a3;
}

- (double)_lastTabPressTime
{
  return self->__lastTabPressTime;
}

- (void)set_lastTabPressTime:(double)a3
{
  self->__lastTabPressTime = a3;
}

- (AXSSKeyboardCommandInfo)_lastDownAndUpCommandInfo
{
  return self->__lastDownAndUpCommandInfo;
}

- (void)set_lastDownAndUpCommandInfo:(id)a3
{
  objc_storeStrong((id *)&self->__lastDownAndUpCommandInfo, a3);
}

- (double)minimumDelayUntilRepeat
{
  return self->_minimumDelayUntilRepeat;
}

- (void)setMinimumDelayUntilRepeat:(double)a3
{
  self->_minimumDelayUntilRepeat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lastDownAndUpCommandInfo, 0);
  objc_storeStrong((id *)&self->__commandInfos, 0);
  objc_destroyWeak((id *)&self->_filterDelegate);
  objc_storeStrong((id *)&self->_commandMap, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
}

- (void)_handleCommand:(uint64_t)a1 event:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AF5CC000, a2, OS_LOG_TYPE_ERROR, "Found standard command with no info: %@", (uint8_t *)&v2, 0xCu);
}

@end
