@implementation CDMNLUServiceGraph

+ (id)requiredDAGServices
{
  void *v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[24];

  v50[22] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v49;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v48;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v47;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v46;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v45;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v44;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v43;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v42;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v41;
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = v40;
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v50[10] = v39;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[11] = v38;
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50[12] = v37;
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v50[13] = v36;
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v50[14] = v18;
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50[15] = v20;
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50[16] = v22;
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50[17] = v24;
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[18] = v26;
  v27 = (objc_class *)objc_opt_class();
  NSStringFromClass(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50[19] = v28;
  v29 = (objc_class *)objc_opt_class();
  NSStringFromClass(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v50[20] = v30;
  v31 = (objc_class *)objc_opt_class();
  NSStringFromClass(v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50[21] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 22);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (BOOL)requiresAssets
{
  return 1;
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 1;
}

+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (a3 == 1)
  {
    +[CDMAssetsUtils getNLUsages:](CDMAssetsUtils, "getNLUsages:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    +[CDMAssetsUtils getAssistantUsages:](CDMAssetsUtils, "getAssistantUsages:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;
    goto LABEL_9;
  }
  CDMOSLoggerForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "+[CDMNLUServiceGraph getUsageForAssetSetName:withLocale:]";
    v13 = 2112;
    v14 = v10;
    _os_log_debug_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_DEBUG, "%s No usages found for asset set name %@", (uint8_t *)&v11, 0x16u);

  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (Class)supportedGraphInputType
{
  return (Class)objc_opt_class();
}

- (void)buildGraph
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id *v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  id *v97;
  id *v98;
  id *v99;
  id v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  id v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  id v130;
  id *v131;
  id *v132;
  id *v133;
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
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  _QWORD v165[5];
  _QWORD aBlock[5];
  _QWORD v167[4];
  id v168;
  id v169;
  id v170;
  _QWORD *v171;
  _QWORD *v172;
  _QWORD *v173;
  _QWORD *v174;
  _QWORD *v175;
  _QWORD *v176;
  _QWORD *v177;
  _QWORD *v178;
  _QWORD *v179;
  _QWORD *v180;
  _QWORD *v181;
  _QWORD *v182;
  _QWORD *v183;
  _QWORD *v184;
  _QWORD *v185;
  _QWORD *v186;
  _QWORD *v187;
  _QWORD *v188;
  _QWORD *v189;
  _QWORD *v190;
  _QWORD *v191;
  id v192;
  _QWORD v193[4];
  id v194;
  _QWORD *v195;
  _QWORD *v196;
  _QWORD *v197;
  _QWORD *v198;
  _QWORD *v199;
  _QWORD *v200;
  _QWORD *v201;
  id v202;
  _QWORD v203[4];
  id v204;
  id v205;
  id v206;
  _QWORD *v207;
  _QWORD *v208;
  _QWORD *v209;
  _QWORD *v210;
  _QWORD *v211;
  _QWORD *v212;
  _QWORD *v213;
  _QWORD *v214;
  _QWORD *v215;
  uint64_t v216;
  uint64_t v217;
  void (*v218)(uint64_t);
  void *v219;
  id v220;
  id v221;
  _QWORD *v222;
  _QWORD *v223;
  _QWORD *v224;
  _QWORD *v225;
  uint64_t v226;
  uint64_t v227;
  void (*v228)(uint64_t);
  void *v229;
  id v230;
  id v231;
  id v232;
  _QWORD *v233;
  _QWORD *v234;
  _QWORD *v235;
  _QWORD *v236;
  _QWORD *v237;
  _QWORD *v238;
  _QWORD *v239;
  uint64_t v240;
  uint64_t v241;
  void (*v242)(uint64_t);
  void *v243;
  id v244;
  id v245;
  id v246;
  _QWORD *v247;
  uint64_t v248;
  uint64_t v249;
  void (*v250)(uint64_t);
  void *v251;
  id v252;
  _QWORD *v253;
  _QWORD *v254;
  _QWORD *v255;
  _QWORD *v256;
  _QWORD *v257;
  _QWORD v258[4];
  id *v259;
  id v260;
  _QWORD *v261;
  _QWORD *v262;
  _QWORD *v263;
  _QWORD *v264;
  _QWORD *v265;
  _QWORD *v266;
  uint64_t v267;
  uint64_t v268;
  void (*v269)(uint64_t, void *);
  void *v270;
  id v271;
  id *v272;
  _QWORD *v273;
  _QWORD *v274;
  _QWORD *v275;
  _QWORD *v276;
  _QWORD *v277;
  _QWORD *v278;
  _QWORD *v279;
  _QWORD *v280;
  id v281;
  _QWORD v282[4];
  id *v283;
  id v284;
  id v285;
  _QWORD *v286;
  _QWORD *v287;
  _QWORD *v288;
  _QWORD *v289;
  _QWORD *v290;
  _QWORD *v291;
  _QWORD v292[4];
  id v293;
  id v294;
  id v295;
  id v296;
  _QWORD *v297;
  _QWORD *v298;
  _QWORD *v299;
  _QWORD *v300;
  uint64_t v301;
  uint64_t v302;
  void (*v303)(uint64_t);
  void *v304;
  id v305;
  id v306;
  id v307;
  _QWORD *v308;
  _QWORD *v309;
  _QWORD *v310;
  _QWORD *v311;
  _QWORD *v312;
  _QWORD *v313;
  uint64_t v314;
  uint64_t v315;
  void (*v316)(uint64_t, void *);
  void *v317;
  id v318;
  id v319;
  _QWORD *v320;
  _QWORD *v321;
  _QWORD *v322;
  _QWORD *v323;
  _QWORD *v324;
  _QWORD *v325;
  _QWORD *v326;
  _QWORD *v327;
  _QWORD *v328;
  id v329[5];
  id v330;
  id v331;
  _QWORD *v332;
  _QWORD *v333;
  _QWORD *v334;
  _QWORD *v335;
  _QWORD *v336;
  _QWORD *v337;
  _QWORD *v338;
  _QWORD *v339;
  _QWORD *v340;
  id v341;
  _QWORD v342[4];
  id v343;
  id v344;
  _QWORD *v345;
  _QWORD *v346;
  _QWORD *v347;
  _QWORD *v348;
  _QWORD *v349;
  _QWORD *v350;
  _QWORD *v351;
  _QWORD *v352;
  _QWORD *v353;
  id v354;
  _QWORD v355[4];
  id v356;
  id v357;
  _QWORD *v358;
  _QWORD *v359;
  _QWORD *v360;
  _QWORD v361[4];
  id v362;
  id v363;
  id v364;
  _QWORD *v365;
  _QWORD *v366;
  _QWORD *v367;
  _QWORD *v368;
  _QWORD *v369;
  _QWORD *v370;
  _QWORD *v371;
  id v372[5];
  id v373;
  id v374;
  _QWORD *v375;
  _QWORD *v376;
  _QWORD *v377;
  _QWORD v378[4];
  id v379;
  id v380;
  _QWORD *v381;
  _QWORD *v382;
  _QWORD *v383;
  _QWORD v384[4];
  id v385;
  id v386;
  _QWORD *v387;
  _QWORD *v388;
  _QWORD *v389;
  uint64_t v390;
  uint64_t v391;
  void (*v392)(uint64_t);
  void *v393;
  id v394;
  id v395;
  _QWORD *v396;
  _QWORD *v397;
  _QWORD *v398;
  uint64_t v399;
  uint64_t v400;
  void (*v401)(uint64_t);
  void *v402;
  id v403;
  _QWORD *v404;
  _QWORD *v405;
  _QWORD *v406;
  _QWORD *v407;
  _QWORD *v408;
  _QWORD v409[4];
  id v410;
  id v411;
  id v412;
  _QWORD *v413;
  _QWORD *v414;
  id v415;
  _QWORD v416[9];
  _QWORD v417[4];
  id v418;
  id v419;
  id v420;
  id v421;
  _QWORD *v422;
  id v423;
  _QWORD v424[4];
  id v425;
  id v426;
  _QWORD *v427;
  _QWORD *v428;
  id v429;
  _QWORD v430[5];
  id v431;
  _QWORD v432[5];
  id v433;
  _QWORD v434[5];
  id v435;
  _QWORD v436[5];
  id v437;
  _QWORD v438[5];
  id v439;
  _QWORD v440[5];
  id v441;
  _QWORD v442[5];
  id v443;
  _QWORD v444[5];
  id v445;
  _QWORD v446[5];
  id v447;
  _QWORD v448[5];
  id v449;
  _QWORD v450[5];
  id v451;
  _QWORD v452[5];
  id v453;
  _QWORD v454[5];
  id v455;
  _QWORD v456[5];
  id v457;
  _QWORD v458[5];
  id v459;
  _QWORD v460[5];
  id v461;
  _QWORD v462[5];
  id v463;
  _QWORD v464[5];
  id v465;
  _QWORD v466[5];
  id v467;
  _QWORD v468[5];
  id v469;
  _QWORD v470[5];
  id v471;
  _QWORD v472[5];
  id v473;
  _QWORD v474[5];
  id v475;
  _QWORD v476[5];
  id v477;
  _QWORD v478[5];
  id v479;
  _QWORD v480[5];
  id v481;
  _QWORD v482[5];
  id v483;
  _QWORD v484[5];
  id v485;
  _QWORD v486[5];
  id v487;
  _QWORD v488[5];
  id v489;
  _QWORD v490[5];
  id v491;
  _QWORD v492[5];
  id v493;
  _QWORD v494[5];
  id v495;
  _QWORD v496[5];
  id v497;
  _QWORD v498[5];
  id v499;
  _QWORD v500[5];
  id v501;
  _QWORD v502[5];
  id v503;
  _QWORD v504[5];
  id v505;
  id location[2];

  objc_initWeak(location, self);
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v5 = objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v6 = objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v7 = objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v8 = objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v9 = objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v10 = objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v11 = objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v132 = (id *)v5;
  v133 = (id *)v10;
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = (id *)v11;
  -[CDMServiceGraph getServiceByClass:](self, "getServiceByClass:", objc_opt_class());
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v504[0] = 0;
  v504[1] = v504;
  v504[2] = 0x3032000000;
  v504[3] = __Block_byref_object_copy__457;
  v504[4] = __Block_byref_object_dispose__458;
  v505 = 0;
  v502[0] = 0;
  v502[1] = v502;
  v502[2] = 0x3032000000;
  v502[3] = __Block_byref_object_copy__457;
  v502[4] = __Block_byref_object_dispose__458;
  v503 = 0;
  v500[0] = 0;
  v500[1] = v500;
  v500[2] = 0x3032000000;
  v500[3] = __Block_byref_object_copy__457;
  v500[4] = __Block_byref_object_dispose__458;
  v501 = 0;
  v498[0] = 0;
  v498[1] = v498;
  v498[2] = 0x3032000000;
  v498[3] = __Block_byref_object_copy__457;
  v498[4] = __Block_byref_object_dispose__458;
  v499 = 0;
  v496[0] = 0;
  v496[1] = v496;
  v496[2] = 0x3032000000;
  v496[3] = __Block_byref_object_copy__457;
  v496[4] = __Block_byref_object_dispose__458;
  v497 = 0;
  v494[0] = 0;
  v494[1] = v494;
  v494[2] = 0x3032000000;
  v494[3] = __Block_byref_object_copy__457;
  v494[4] = __Block_byref_object_dispose__458;
  v495 = 0;
  v492[0] = 0;
  v492[1] = v492;
  v492[2] = 0x3032000000;
  v492[3] = __Block_byref_object_copy__457;
  v492[4] = __Block_byref_object_dispose__458;
  v493 = 0;
  v490[0] = 0;
  v490[1] = v490;
  v490[2] = 0x3032000000;
  v490[3] = __Block_byref_object_copy__457;
  v490[4] = __Block_byref_object_dispose__458;
  v491 = 0;
  v488[0] = 0;
  v488[1] = v488;
  v488[2] = 0x3032000000;
  v488[3] = __Block_byref_object_copy__457;
  v488[4] = __Block_byref_object_dispose__458;
  v489 = 0;
  v486[0] = 0;
  v486[1] = v486;
  v486[2] = 0x3032000000;
  v486[3] = __Block_byref_object_copy__457;
  v486[4] = __Block_byref_object_dispose__458;
  v487 = 0;
  v484[0] = 0;
  v484[1] = v484;
  v484[2] = 0x3032000000;
  v484[3] = __Block_byref_object_copy__457;
  v484[4] = __Block_byref_object_dispose__458;
  v485 = 0;
  v482[0] = 0;
  v482[1] = v482;
  v482[2] = 0x3032000000;
  v482[3] = __Block_byref_object_copy__457;
  v482[4] = __Block_byref_object_dispose__458;
  v483 = 0;
  v480[0] = 0;
  v480[1] = v480;
  v480[2] = 0x3032000000;
  v480[3] = __Block_byref_object_copy__457;
  v480[4] = __Block_byref_object_dispose__458;
  v481 = 0;
  v478[0] = 0;
  v478[1] = v478;
  v478[2] = 0x3032000000;
  v478[3] = __Block_byref_object_copy__457;
  v478[4] = __Block_byref_object_dispose__458;
  v479 = 0;
  v476[0] = 0;
  v476[1] = v476;
  v476[2] = 0x3032000000;
  v476[3] = __Block_byref_object_copy__457;
  v476[4] = __Block_byref_object_dispose__458;
  v477 = 0;
  v474[0] = 0;
  v474[1] = v474;
  v474[2] = 0x3032000000;
  v474[3] = __Block_byref_object_copy__457;
  v474[4] = __Block_byref_object_dispose__458;
  v475 = 0;
  v472[0] = 0;
  v472[1] = v472;
  v472[2] = 0x3032000000;
  v472[3] = __Block_byref_object_copy__457;
  v472[4] = __Block_byref_object_dispose__458;
  v473 = 0;
  v470[0] = 0;
  v470[1] = v470;
  v470[2] = 0x3032000000;
  v470[3] = __Block_byref_object_copy__457;
  v470[4] = __Block_byref_object_dispose__458;
  v471 = 0;
  v468[0] = 0;
  v468[1] = v468;
  v468[2] = 0x3032000000;
  v468[3] = __Block_byref_object_copy__457;
  v468[4] = __Block_byref_object_dispose__458;
  v469 = 0;
  v466[0] = 0;
  v466[1] = v466;
  v466[2] = 0x3032000000;
  v466[3] = __Block_byref_object_copy__457;
  v466[4] = __Block_byref_object_dispose__458;
  v467 = 0;
  v464[0] = 0;
  v464[1] = v464;
  v464[2] = 0x3032000000;
  v464[3] = __Block_byref_object_copy__457;
  v464[4] = __Block_byref_object_dispose__458;
  v465 = 0;
  v462[0] = 0;
  v462[1] = v462;
  v462[2] = 0x3032000000;
  v462[3] = __Block_byref_object_copy__457;
  v462[4] = __Block_byref_object_dispose__458;
  v463 = 0;
  v460[0] = 0;
  v460[1] = v460;
  v460[2] = 0x3032000000;
  v460[3] = __Block_byref_object_copy__457;
  v460[4] = __Block_byref_object_dispose__458;
  v461 = 0;
  v458[0] = 0;
  v458[1] = v458;
  v458[2] = 0x3032000000;
  v458[3] = __Block_byref_object_copy__457;
  v458[4] = __Block_byref_object_dispose__458;
  v459 = 0;
  v456[0] = 0;
  v456[1] = v456;
  v456[2] = 0x3032000000;
  v456[3] = __Block_byref_object_copy__457;
  v456[4] = __Block_byref_object_dispose__458;
  v457 = 0;
  v454[0] = 0;
  v454[1] = v454;
  v454[2] = 0x3032000000;
  v454[3] = __Block_byref_object_copy__457;
  v454[4] = __Block_byref_object_dispose__458;
  v455 = 0;
  v452[0] = 0;
  v452[1] = v452;
  v452[2] = 0x3032000000;
  v452[3] = __Block_byref_object_copy__457;
  v452[4] = __Block_byref_object_dispose__458;
  v453 = 0;
  v450[0] = 0;
  v450[1] = v450;
  v450[2] = 0x3032000000;
  v450[3] = __Block_byref_object_copy__457;
  v450[4] = __Block_byref_object_dispose__458;
  v451 = 0;
  v448[0] = 0;
  v448[1] = v448;
  v448[2] = 0x3032000000;
  v448[3] = __Block_byref_object_copy__457;
  v448[4] = __Block_byref_object_dispose__458;
  v449 = 0;
  v446[0] = 0;
  v446[1] = v446;
  v446[2] = 0x3032000000;
  v446[3] = __Block_byref_object_copy__457;
  v446[4] = __Block_byref_object_dispose__458;
  v447 = 0;
  v444[0] = 0;
  v444[1] = v444;
  v444[2] = 0x3032000000;
  v444[3] = __Block_byref_object_copy__457;
  v444[4] = __Block_byref_object_dispose__458;
  v445 = 0;
  v442[0] = 0;
  v442[1] = v442;
  v442[2] = 0x3032000000;
  v442[3] = __Block_byref_object_copy__457;
  v442[4] = __Block_byref_object_dispose__458;
  v443 = 0;
  v440[0] = 0;
  v440[1] = v440;
  v440[2] = 0x3032000000;
  v440[3] = __Block_byref_object_copy__457;
  v440[4] = __Block_byref_object_dispose__458;
  v441 = 0;
  v438[0] = 0;
  v438[1] = v438;
  v438[2] = 0x3032000000;
  v438[3] = __Block_byref_object_copy__457;
  v438[4] = __Block_byref_object_dispose__458;
  v439 = 0;
  v436[0] = 0;
  v436[1] = v436;
  v436[2] = 0x3032000000;
  v436[3] = __Block_byref_object_copy__457;
  v436[4] = __Block_byref_object_dispose__458;
  v437 = 0;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("\n*** ✅ FOR DEBUGGING (start) ***"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceGraph getGraphInput](self, "getGraphInput");
  v122 = (void *)v7;
  v124 = (void *)v6;
  v120 = (void *)v8;
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "siriNLUTypeObj");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BE9E340];
  objc_msgSend(v13, "requestId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "extractRequestLinkData:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  -[CDMServiceGraph getLanguage](self, "getLanguage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = (void *)v16;
  -[CDMServiceGraph validateRequest:](self, "validateRequest:", v13);
  v434[0] = 0;
  v434[1] = v434;
  v434[2] = 0x3032000000;
  v434[3] = __Block_byref_object_copy__457;
  v434[4] = __Block_byref_object_dispose__458;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "utterance");
  v435 = (id)objc_claimAutoreleasedReturnValue();
  v432[0] = 0;
  v432[1] = v432;
  v432[2] = 0x3032000000;
  v432[3] = __Block_byref_object_copy__457;
  v432[4] = __Block_byref_object_dispose__458;
  v115 = v18;
  objc_msgSend(v18, "idA");
  v433 = (id)objc_claimAutoreleasedReturnValue();
  v430[0] = 0;
  v430[1] = v430;
  v430[2] = 0x3032000000;
  v430[3] = __Block_byref_object_copy__457;
  v430[4] = __Block_byref_object_dispose__458;
  v431 = 0;
  -[CDMServiceGraph populateRequesterEnumForNluRequest:](self, "populateRequesterEnumForNluRequest:", v13);
  v116 = (void *)v9;
  objc_msgSend(v13, "requestId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v424[0] = MEMORY[0x24BDAC760];
  v424[1] = 3221225472;
  v424[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke;
  v424[3] = &unk_24DCAB880;
  v20 = v13;
  v425 = v20;
  v427 = v466;
  v428 = v504;
  v21 = v3;
  v426 = v21;
  objc_copyWeak(&v429, location);
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doContextUpdate"), v21, v19, v424);
  v22 = objc_claimAutoreleasedReturnValue();
  v114 = v21;

  objc_msgSend(v20, "requestId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v417[0] = MEMORY[0x24BDAC760];
  v417[1] = 3221225472;
  v417[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_413;
  v417[3] = &unk_24DCAB8A8;
  v24 = v20;
  v418 = v24;
  v25 = v17;
  v419 = v25;
  v422 = v502;
  v26 = v4;
  v420 = v26;
  v27 = v12;
  v421 = v27;
  objc_copyWeak(&v423, location);
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doCurrentTokenize"), v26, v23, v417);
  v137 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "requestId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v416[0] = MEMORY[0x24BDAC760];
  v416[1] = 3221225472;
  v416[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_415;
  v416[3] = &unk_24DCAC2A0;
  v416[4] = v504;
  v416[5] = v430;
  v416[6] = v434;
  v416[7] = v500;
  v416[8] = v502;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doCorrectedUtteranceTokenize"), v26, v28, v416);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "requestId");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v409[0] = MEMORY[0x24BDAC760];
  v409[1] = 3221225472;
  v409[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_416;
  v409[3] = &unk_24DCABEE0;
  v413 = v498;
  v31 = v26;
  v410 = v31;
  v32 = v24;
  v411 = v32;
  v414 = v434;
  v33 = v25;
  v412 = v33;
  objc_copyWeak(&v415, location);
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doPreviousTurnsTokenize"), v161, v30, v409);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v31;

  objc_msgSend(v32, "requestId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v399 = MEMORY[0x24BDAC760];
  v400 = 3221225472;
  v401 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_2;
  v402 = &unk_24DCABE90;
  v404 = v500;
  v405 = v430;
  v403 = v163;
  v406 = v490;
  v407 = v488;
  v408 = v492;
  v112 = v403;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doEmbedding"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "requestId");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v390 = MEMORY[0x24BDAC760];
  v391 = 3221225472;
  v392 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_420;
  v393 = &unk_24DCAC2F0;
  v396 = v504;
  v397 = v500;
  v36 = v32;
  v394 = v36;
  v398 = v486;
  v395 = v159;
  v111 = v395;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doSpanizationDateTime"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "requestId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v384[0] = MEMORY[0x24BDAC760];
  v384[1] = 3221225472;
  v384[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_424;
  v384[3] = &unk_24DCAC2F0;
  v387 = v504;
  v388 = v500;
  v38 = v36;
  v385 = v38;
  v389 = v484;
  v39 = v157;
  v386 = v39;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doSpanizationRegex"), v39, v37, v384);
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "requestId");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v378[0] = MEMORY[0x24BDAC760];
  v378[1] = 3221225472;
  v378[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_425;
  v378[3] = &unk_24DCAC2F0;
  v381 = v504;
  v382 = v500;
  v41 = v38;
  v379 = v41;
  v42 = v155;
  v380 = v42;
  v383 = v482;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doSpanizationSiriVocabulary"), v42, v40, v378);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v39;

  objc_msgSend(v41, "requestId");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v372[1] = (id)MEMORY[0x24BDAC760];
  v372[2] = (id)3221225472;
  v372[3] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_427;
  v372[4] = &unk_24DCAC2F0;
  v375 = v504;
  v376 = v500;
  v44 = v41;
  v373 = v44;
  v377 = v480;
  v374 = v153;
  v109 = v374;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doSpanizationVoc"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = (void *)v22;

  objc_msgSend(v44, "requestId");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v361[0] = MEMORY[0x24BDAC760];
  v361[1] = 3221225472;
  v361[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_428;
  v361[3] = &unk_24DCAB8D0;
  v362 = v151;
  v46 = v44;
  v363 = v46;
  v365 = v430;
  v47 = v33;
  v364 = v47;
  v366 = v500;
  v367 = v436;
  v368 = v490;
  v369 = v488;
  v370 = v504;
  v371 = v472;
  objc_copyWeak(v372, location);
  v108 = v362;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doUaaPNLInference"), v362, v45, v361);
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "requestId");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v355[0] = MEMORY[0x24BDAC760];
  v355[1] = 3221225472;
  v355[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_2_429;
  v355[3] = &unk_24DCAC2F0;
  v358 = v436;
  v359 = v502;
  v49 = v46;
  v356 = v49;
  v360 = v438;
  v50 = v142;
  v357 = v50;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doShortcutParse"), v50, v48, v355);
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "requestId");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v342[0] = MEMORY[0x24BDAC760];
  v342[1] = 3221225472;
  v342[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_431;
  v342[3] = &unk_24DCAB8F8;
  v345 = v464;
  v346 = v500;
  v347 = v436;
  v348 = v430;
  v349 = v490;
  v350 = v488;
  v351 = v466;
  v52 = v49;
  v343 = v52;
  v352 = v504;
  objc_copyWeak(&v354, location);
  v53 = v144;
  v344 = v53;
  v353 = v462;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doPSCInference"), v53, v51, v342);
  v164 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v52, "requestId");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v329[1] = (id)MEMORY[0x24BDAC760];
  v329[2] = (id)3221225472;
  v329[3] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_432;
  v329[4] = &unk_24DCAB8F8;
  v332 = v460;
  v333 = v500;
  v334 = v436;
  v335 = v430;
  v336 = v490;
  v337 = v488;
  v338 = v466;
  v55 = v52;
  v330 = v55;
  v339 = v504;
  objc_copyWeak(&v341, location);
  v340 = v458;
  v331 = v138;
  v107 = v331;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doLVCInference"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v55, "requestId");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v53;
  v106 = v50;
  v314 = MEMORY[0x24BDAC760];
  v315 = 3221225472;
  v316 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_433;
  v317 = &unk_24DCAB8F8;
  v320 = v470;
  v321 = v500;
  v322 = v436;
  v323 = v430;
  v324 = v490;
  v325 = v488;
  v326 = v466;
  v57 = v55;
  v318 = v57;
  v327 = v504;
  objc_copyWeak(v329, location);
  v319 = v146;
  v328 = v468;
  v104 = v319;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doSNLCInference"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v57, "requestId");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v301 = MEMORY[0x24BDAC760];
  v302 = 3221225472;
  v303 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_434;
  v304 = &unk_24DCAB948;
  v60 = v57;
  v305 = v60;
  v308 = v432;
  v61 = v47;
  v306 = v61;
  v309 = v482;
  v310 = v430;
  v311 = v504;
  v312 = v496;
  v313 = v494;
  v307 = v140;
  v103 = v307;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doSSUMatching"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v42;

  objc_msgSend(v60, "requestId");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v292[0] = MEMORY[0x24BDAC760];
  v292[1] = 3221225472;
  v292[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_2_442;
  v292[3] = &unk_24DCAB920;
  v297 = v466;
  v293 = v161;
  v63 = v60;
  v294 = v63;
  v298 = v502;
  v299 = v498;
  v300 = v456;
  v64 = v126;
  v295 = v64;
  v100 = v61;
  v101 = v293;
  v296 = v100;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doCcqrAerCbRInference"), v293, v62, v292);
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v63, "requestId");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v282[0] = MEMORY[0x24BDAC760];
  v282[1] = 3221225472;
  v282[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_443;
  v282[3] = &unk_24DCAB948;
  v286 = v500;
  v287 = v430;
  v288 = v490;
  v289 = v488;
  v290 = v504;
  v66 = v133;
  v283 = v66;
  v291 = v442;
  v67 = v27;
  v284 = v67;
  v68 = v63;
  v285 = v68;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doCATIInference"), v66, v65, v282);
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "requestId");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v67;
  v267 = MEMORY[0x24BDAC760];
  v268 = 3221225472;
  v269 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_446;
  v270 = &unk_24DCAB970;
  v273 = v476;
  v274 = v500;
  v275 = v436;
  v276 = v430;
  v277 = v490;
  v278 = v488;
  v279 = v504;
  v70 = v68;
  v271 = v70;
  objc_copyWeak(&v281, location);
  v272 = v132;
  v280 = v474;
  v99 = v272;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doNLv4Inference"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "requestId");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v258[0] = MEMORY[0x24BDAC760];
  v258[1] = 3221225472;
  v258[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_449;
  v258[3] = &unk_24DCAB998;
  v261 = v430;
  v262 = v436;
  v263 = v500;
  v264 = v504;
  v259 = v131;
  v73 = v70;
  v260 = v73;
  v265 = v474;
  v266 = v468;
  v98 = v259;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doNLv4SNLCMerging"), v259, v72, v258);
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v73, "requestId");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v248 = MEMORY[0x24BDAC760];
  v249 = 3221225472;
  v250 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_456;
  v251 = &unk_24DCABE90;
  v253 = v430;
  v254 = v436;
  v255 = v500;
  v256 = v504;
  v257 = v440;
  v252 = v129;
  v130 = v252;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doOverridesProto"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v75, "setQueuePriority:", 4);
  objc_msgSend(v73, "requestId");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = MEMORY[0x24BDAC760];
  v241 = 3221225472;
  v242 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_457;
  v243 = &unk_24DCAB9C0;
  v77 = v73;
  v244 = v77;
  v78 = v64;
  v245 = v78;
  v247 = v456;
  v246 = v124;
  v125 = v246;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doRepetitionDetection"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v77, "requestId");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v226 = MEMORY[0x24BDAC760];
  v227 = 3221225472;
  v228 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_460;
  v229 = &unk_24DCAB9E8;
  v233 = v454;
  v234 = v430;
  v235 = v500;
  v236 = v490;
  v237 = v488;
  v80 = v78;
  v230 = v80;
  v81 = v77;
  v231 = v81;
  v238 = v504;
  v239 = v452;
  v232 = v122;
  v123 = v232;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doMentionDetection"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v66;

  objc_msgSend(v81, "requestId");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = MEMORY[0x24BDAC760];
  v217 = 3221225472;
  v218 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_463;
  v219 = &unk_24DCABA10;
  v222 = v450;
  v223 = v504;
  v83 = v81;
  v220 = v83;
  v224 = v500;
  v225 = v448;
  v221 = v120;
  v121 = v221;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doContextualSpanMatching"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v83, "requestId");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v203[0] = MEMORY[0x24BDAC760];
  v203[1] = 3221225472;
  v203[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_466;
  v203[3] = &unk_24DCABA38;
  v207 = v452;
  v208 = v504;
  v209 = v446;
  v210 = v500;
  v211 = v448;
  v212 = v490;
  v213 = v488;
  v214 = v430;
  v85 = v80;
  v204 = v85;
  v86 = v83;
  v205 = v86;
  v215 = v444;
  v87 = v116;
  v206 = v87;
  -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", CFSTR("doMentionResolving"), v87, v84, v203);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v85;
  v117 = v87;

  objc_msgSend(v86, "requestId");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v193[0] = MEMORY[0x24BDAC760];
  v193[1] = 3221225472;
  v193[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_469;
  v193[3] = &unk_24DCABA60;
  v195 = v478;
  v196 = v486;
  v197 = v484;
  v198 = v482;
  v199 = v480;
  v90 = v86;
  v194 = v90;
  objc_copyWeak(&v202, location);
  v200 = v436;
  v201 = v444;
  -[CDMServiceGraph addNodeWithName:requestId:block:](self, "addNodeWithName:requestId:block:", CFSTR("doSpanMerging"), v89, v193);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v90, "requestId");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v167[0] = MEMORY[0x24BDAC760];
  v167[1] = 3221225472;
  v167[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_2_471;
  v167[3] = &unk_24DCABA88;
  v171 = v504;
  v95 = v90;
  v168 = v95;
  v172 = v438;
  v173 = v470;
  v174 = v468;
  v175 = v476;
  v176 = v474;
  v177 = v472;
  v178 = v442;
  v179 = v464;
  v180 = v462;
  v181 = v458;
  v182 = v440;
  v183 = v454;
  v184 = v452;
  v185 = v446;
  v186 = v444;
  v187 = v478;
  v188 = v456;
  v189 = v502;
  v190 = v494;
  v191 = v466;
  v119 = v118;
  v169 = v119;
  v128 = v127;
  v170 = v128;
  objc_copyWeak(&v192, location);
  -[CDMServiceGraph addNodeWithName:requestId:block:](self, "addNodeWithName:requestId:block:", CFSTR("doPostProcess"), v92, v167);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v162, "addDependency:", v136);
  objc_msgSend(v162, "addDependency:", v137);
  objc_msgSend(v162, "addDependency:", v141);
  objc_msgSend(v134, "addDependency:", v162);
  objc_msgSend(v29, "addDependency:", v134);
  objc_msgSend(v58, "addDependency:", v29);
  objc_msgSend(v75, "addDependency:", v29);
  objc_msgSend(v135, "addDependency:", v29);
  objc_msgSend(v150, "addDependency:", v29);
  objc_msgSend(v149, "addDependency:", v29);
  objc_msgSend(v156, "addDependency:", v29);
  objc_msgSend(v148, "addDependency:", v29);
  objc_msgSend(v160, "addDependency:", v29);
  objc_msgSend(v71, "addDependency:", v29);
  objc_msgSend(v147, "addDependency:", v135);
  objc_msgSend(v145, "addDependency:", v29);
  objc_msgSend(v88, "addDependency:", v145);
  objc_msgSend(v88, "addDependency:", v147);
  objc_msgSend(v91, "addDependency:", v150);
  objc_msgSend(v91, "addDependency:", v149);
  objc_msgSend(v91, "addDependency:", v156);
  objc_msgSend(v91, "addDependency:", v148);
  objc_msgSend(v91, "addDependency:", v88);
  objc_msgSend(v143, "addDependency:", v91);
  objc_msgSend(v154, "addDependency:", v135);
  objc_msgSend(v164, "addDependency:", v29);
  objc_msgSend(v164, "addDependency:", v91);
  objc_msgSend(v164, "addDependency:", v135);
  objc_msgSend(v158, "addDependency:", v29);
  objc_msgSend(v158, "addDependency:", v91);
  objc_msgSend(v158, "addDependency:", v135);
  objc_msgSend(v58, "addDependency:", v91);
  objc_msgSend(v58, "addDependency:", v135);
  objc_msgSend(v58, "addDependency:", v88);
  objc_msgSend(v139, "addDependency:", v156);
  objc_msgSend(v160, "addDependency:", v135);
  objc_msgSend(v160, "addDependency:", v91);
  objc_msgSend(v71, "addDependency:", v135);
  objc_msgSend(v71, "addDependency:", v91);
  objc_msgSend(v71, "addDependency:", v88);
  objc_msgSend(v152, "addDependency:", v71);
  objc_msgSend(v152, "addDependency:", v58);
  objc_msgSend(v75, "addDependency:", v91);
  objc_msgSend(v93, "addDependency:", v152);
  objc_msgSend(v93, "addDependency:", v160);
  objc_msgSend(v93, "addDependency:", v164);
  objc_msgSend(v93, "addDependency:", v158);
  objc_msgSend(v93, "addDependency:", v154);
  objc_msgSend(v93, "addDependency:", v75);
  objc_msgSend(v93, "addDependency:", v143);
  objc_msgSend(v93, "addDependency:", v141);
  objc_msgSend(v93, "addDependency:", v88);
  objc_msgSend(v93, "addDependency:", v139);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_3;
  aBlock[3] = &unk_24DCABAB0;
  aBlock[4] = v440;
  v94 = _Block_copy(aBlock);
  -[CDMServiceGraph skipNode:basedOnNode:withCondition:](self, "skipNode:basedOnNode:withCondition:", v71, v75, v94);
  -[CDMServiceGraph skipNode:basedOnNode:withCondition:](self, "skipNode:basedOnNode:withCondition:", v58, v75, v94);
  -[CDMServiceGraph skipNode:basedOnNode:withCondition:](self, "skipNode:basedOnNode:withCondition:", v164, v75, v94);
  -[CDMServiceGraph skipNode:basedOnNode:withCondition:](self, "skipNode:basedOnNode:withCondition:", v154, v75, v94);
  v165[0] = MEMORY[0x24BDAC760];
  v165[1] = 3221225472;
  v165[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_474;
  v165[3] = &unk_24DCABAB0;
  v165[4] = v468;
  -[CDMServiceGraph skipNode:basedOnNode:withCondition:](self, "skipNode:basedOnNode:withCondition:", v71, v58, v165);

  objc_destroyWeak(&v192);
  objc_destroyWeak(&v202);

  objc_destroyWeak(&v281);
  objc_destroyWeak(v329);

  objc_destroyWeak(&v341);
  objc_destroyWeak(&v354);

  objc_destroyWeak(v372);
  objc_destroyWeak(&v415);

  objc_destroyWeak(&v423);
  objc_destroyWeak(&v429);

  _Block_object_dispose(v430, 8);
  _Block_object_dispose(v432, 8);

  _Block_object_dispose(v434, 8);
  _Block_object_dispose(v436, 8);

  _Block_object_dispose(v438, 8);
  _Block_object_dispose(v440, 8);

  _Block_object_dispose(v442, 8);
  _Block_object_dispose(v444, 8);

  _Block_object_dispose(v446, 8);
  _Block_object_dispose(v448, 8);

  _Block_object_dispose(v450, 8);
  _Block_object_dispose(v452, 8);

  _Block_object_dispose(v454, 8);
  _Block_object_dispose(v456, 8);

  _Block_object_dispose(v458, 8);
  _Block_object_dispose(v460, 8);

  _Block_object_dispose(v462, 8);
  _Block_object_dispose(v464, 8);

  _Block_object_dispose(v466, 8);
  _Block_object_dispose(v468, 8);

  _Block_object_dispose(v470, 8);
  _Block_object_dispose(v472, 8);

  _Block_object_dispose(v474, 8);
  _Block_object_dispose(v476, 8);

  _Block_object_dispose(v478, 8);
  _Block_object_dispose(v480, 8);

  _Block_object_dispose(v482, 8);
  _Block_object_dispose(v484, 8);

  _Block_object_dispose(v486, 8);
  _Block_object_dispose(v488, 8);

  _Block_object_dispose(v490, 8);
  _Block_object_dispose(v492, 8);

  _Block_object_dispose(v494, 8);
  _Block_object_dispose(v496, 8);

  _Block_object_dispose(v498, 8);
  _Block_object_dispose(v500, 8);

  _Block_object_dispose(v502, 8);
  _Block_object_dispose(v504, 8);

  objc_destroyWeak(location);
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CDMContextUpdateRequestCommand *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v16 = 136315138;
    v17 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Prepare CDMContextUpdateRequestCommand", (uint8_t *)&v16, 0xCu);
  }

  v3 = objc_alloc_init(MEMORY[0x24BE9E1C0]);
  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentTurn:", v4);

  objc_msgSend(*(id *)(a1 + 32), "previousTurnInputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreviousTurns:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "qrResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rewriteHypotheses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQrHypotheses:", v7);

  v8 = -[CDMContextUpdateRequestCommand initWithCtxUpdateRequest:]([CDMContextUpdateRequestCommand alloc], "initWithCtxUpdateRequest:", v3);
  objc_msgSend(*(id *)(a1 + 40), "handle:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "cdmDataDispatcherContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchContextUpdateData:requestId:dataDispatcherContext:](CDMDataDispatcher, "dispatchContextUpdateData:requestId:dataDispatcherContext:", v12, v13, v15);

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_413(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use in CDMTokenizerProtoService", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asrOutputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:locale:](CDMTokenizerProtoService, "createProtoTokenRequestWithAsrOutputs:locale:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "handle:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  +[CDMServiceGraphUtil addDebugInfo:nluRequest:responseObject:](CDMServiceGraphUtil, "addDebugInfo:nluRequest:responseObject:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "cdmDataDispatcherContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchCurrentTurnTokenizationData:requestId:dataDispatcherContext:](CDMDataDispatcher, "dispatchCurrentTurnTokenizationData:requestId:dataDispatcherContext:", v9, v10, v12);

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_415(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315138;
    v13 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use in CDMTokenizerProtoService", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "firstReformedInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type") == 1;

  CDMOSLoggerForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      v12 = 136315138;
      v13 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      v7 = "%s Current Turn is a Correction for the previous turn";
LABEL_9:
      _os_log_debug_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (v6)
  {
    v12 = 136315138;
    v13 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    v7 = "%s Current Turn is NOT a Correction for the previous turn";
    goto LABEL_9;
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(*(_QWORD *)(a1[6] + 8) + 40));
  v8 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = v8;
  v11 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v10;

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_416(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentTurnInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "previousTurnInputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:](CDMServiceGraphUtil, "prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:", v2, v3, v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 48));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "requestId");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "cdmDataDispatcherContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchPreviousTurnTokenizationData:requestId:dataDispatcherContext:](CDMDataDispatcher, "dispatchPreviousTurnTokenizationData:requestId:dataDispatcherContext:", v8, v11, v10);

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  CDMEmbeddingProtoRequestCommand *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315138;
    v18 = "-[CDMNLUServiceGraph buildGraph]_block_invoke_2";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMEmbeddingProtoRequestCommand for use in CDMEmbeddingProtoService", (uint8_t *)&v17, 0xCu);
  }

  v3 = objc_alloc_init(MEMORY[0x24BE9E1D8]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTokenChain:", v5);

  objc_msgSend(v3, "setText:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v6 = -[CDMEmbeddingProtoRequestCommand initWithRequest:]([CDMEmbeddingProtoRequestCommand alloc], "initWithRequest:", v3);
  objc_msgSend(*(id *)(a1 + 32), "handle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "response");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(v7, "embeddingConfigs");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  +[SiriNLUInternalEmbeddingConverter convertFromProtoEmbeddingResponseCommand:](SiriNLUInternalEmbeddingConverter, "convertFromProtoEmbeddingResponseCommand:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_420(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CDMSpanMatcherRequestCommand *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CDMSpanMatcherRequestCommand *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v18 = 136315138;
    v19 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatcherRequestCommand for use in CDMDateTimeSpanMatchService", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "firstReformedInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentTurn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "responses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMBaseSpanMatchService convertToSpanMatchRequests:nlContext:](CDMBaseSpanMatchService, "convertToSpanMatchRequests:nlContext:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [CDMSpanMatcherRequestCommand alloc];
  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asrOutputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CDMSpanMatcherRequestCommand initWithRequests:asrHypothesis:selfMetadata:](v9, "initWithRequests:asrHypothesis:selfMetadata:", v8, v11, v13);

  objc_msgSend(*(id *)(a1 + 40), "handle:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_424(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CDMSpanMatcherRequestCommand *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CDMSpanMatcherRequestCommand *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v18 = 136315138;
    v19 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatcherRequestCommand for use in CDMRegexSpanMatchService", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "firstReformedInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentTurn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "responses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMBaseSpanMatchService convertToSpanMatchRequests:nlContext:](CDMBaseSpanMatchService, "convertToSpanMatchRequests:nlContext:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [CDMSpanMatcherRequestCommand alloc];
  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asrOutputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CDMSpanMatcherRequestCommand initWithRequests:asrHypothesis:selfMetadata:](v9, "initWithRequests:asrHypothesis:selfMetadata:", v8, v11, v13);

  objc_msgSend(*(id *)(a1 + 40), "handle:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_425(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CDMSpanMatchDataUpdateCommand *v9;
  void *v10;
  void *v11;
  CDMSpanMatchDataUpdateCommand *v12;
  CDMSpanMatcherRequestCommand *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CDMSpanMatcherRequestCommand *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v22 = 136315138;
    v23 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatcherRequestCommand for use in CDMSiriVocabularySpanMatchService", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "firstReformedInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentTurn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "responses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMBaseSpanMatchService convertToSpanMatchRequests:nlContext:](CDMBaseSpanMatchService, "convertToSpanMatchRequests:nlContext:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [CDMSpanMatchDataUpdateCommand alloc];
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CDMSpanMatchDataUpdateCommand initWithUserId:](v9, "initWithUserId:", v11);

  objc_msgSend(*(id *)(a1 + 40), "updateData:", v12);
  v13 = [CDMSpanMatcherRequestCommand alloc];
  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "asrOutputs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CDMSpanMatcherRequestCommand initWithRequests:asrHypothesis:selfMetadata:](v13, "initWithRequests:asrHypothesis:selfMetadata:", v8, v15, v17);

  objc_msgSend(*(id *)(a1 + 40), "handle:", v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_427(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CDMSpanMatcherRequestCommand *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CDMSpanMatcherRequestCommand *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v18 = 136315138;
    v19 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatcherRequestCommand for use in CDMVocSpanMatchService", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "firstReformedInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentTurn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nlContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "responses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMBaseSpanMatchService convertToSpanMatchRequests:nlContext:](CDMBaseSpanMatchService, "convertToSpanMatchRequests:nlContext:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [CDMSpanMatcherRequestCommand alloc];
  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asrOutputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CDMSpanMatcherRequestCommand initWithRequests:asrHypothesis:selfMetadata:](v9, "initWithRequests:asrHypothesis:selfMetadata:", v8, v11, v13);

  objc_msgSend(*(id *)(a1 + 40), "handle:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_428(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id WeakRetained;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id obj;
  id v22;

  v18 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "requestId");
  v2 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v17 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "response");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "tokenChain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "embeddingTensorOutputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:](CDMServiceGraphUtil, "embeddingsOutput:embeddingConfig:forFactor:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), CFSTR("com.apple.siri.nl.uaap.ssu"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "firstReformedInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentTurn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  obj = *(id *)(v9 + 40);
  v22 = 0;
  v20 = 0;
  v10 = (void *)v2;
  LOBYTE(v2) = +[CDMServiceGraphUtil runUaaPNLProtoService:requestId:utterance:locale:tokenChain:matchingSpans:embeddingTensor:currentTurn:outUaapProtoRequest:outUaapProtoResponse:outError:](CDMServiceGraphUtil, "runUaaPNLProtoService:requestId:utterance:locale:tokenChain:matchingSpans:embeddingTensor:currentTurn:outUaapProtoRequest:outUaapProtoResponse:outError:", v18, v2, v16, v17, v3, v4, v6, v8, &v22, &obj, &v20);
  v11 = v22;
  objc_storeStrong((id *)(v9 + 40), obj);
  v12 = v20;

  if ((v2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(WeakRetained, "failedWithError:", v12);

  }
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "requestId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchUaaPData:withResponse:requestId:](CDMDataDispatcher, "dispatchUaaPData:withResponse:requestId:", v11, v14, v15);

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_2_429(uint64_t a1)
{
  NSObject *v2;
  CDMShortcutRequestCommand *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CDMShortcutRequestCommand *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[CDMNLUServiceGraph buildGraph]_block_invoke_2";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Output VoiceCommand NLUParse if there is voice command matching span found", (uint8_t *)&v13, 0xCu);
  }

  v3 = [CDMShortcutRequestCommand alloc];
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenChain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "turnContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CDMShortcutRequestCommand initWithMatchingSpans:tokenChain:currentTurnContext:](v3, "initWithMatchingSpans:tokenChain:currentTurnContext:", v4, v6, v8);

  objc_msgSend(*(id *)(a1 + 40), "handle:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_431(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id WeakRetained;
  void *v20;
  id v21;
  id v22;
  char v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id location;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, a2);
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Creating CDMPSCRequestCommand for use in CDMPSCService", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "response");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "tokenChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "embeddingTensorOutputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:](CDMServiceGraphUtil, "embeddingsOutput:embeddingConfig:forFactor:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), CFSTR("com.apple.siri.nl.psc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "rewriteMsg");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "firstReformedInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentTurn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  +[CDMServiceGraphUtil buildPSCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:nluRequestId:currentTurn:error:](CDMServiceGraphUtil, "buildPSCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:nluRequestId:currentTurn:error:", v4, v5, v6, v8, v9, v10, v12, &v31);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v31;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v13;
  v17 = v14;

  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v18)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    objc_msgSend(WeakRetained, "failedWithError:", v17);

    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(*(id *)(a1 + 40), "handle:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_loadWeakRetained(&location);
  if (!v21
    || (v22 = objc_loadWeakRetained(&location),
        v23 = objc_msgSend(v22, "isCancelled"),
        v22,
        v21,
        (v23 & 1) != 0))
  {
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      _os_log_debug_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_DEBUG, "%s CDMPSCService node was cancelled, so not adding response to graph.", buf, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), v20);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "cmdError");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "cmdError");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v34 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      v35 = 2112;
      v36 = v29;
      _os_log_debug_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_DEBUG, "%s PSC failed to handle the request: %@", buf, 0x16u);

    }
    goto LABEL_12;
  }
LABEL_13:
  v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchPSCData:withResponse:requestId:](CDMDataDispatcher, "dispatchPSCData:withResponse:requestId:", v26, v20, v27);

  objc_destroyWeak(&location);
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_432(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id WeakRetained;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMLVCRequestCommand for use in CDMLVCService", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "response");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "tokenChain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "embeddingTensorOutputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:](CDMServiceGraphUtil, "embeddingsOutput:embeddingConfig:forFactor:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), CFSTR("com.apple.siri.nl.lvc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "rewriteMsg");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "firstReformedInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  +[CDMServiceGraphUtil buildLVCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:nluRequestId:reformedTurnInput:error:](CDMServiceGraphUtil, "buildLVCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:nluRequestId:reformedTurnInput:error:", v3, v4, v5, v7, v8, v9, v10, &v28);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v28;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v11;

  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v15)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    objc_msgSend(WeakRetained, "failedWithError:", v12);

    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(*(id *)(a1 + 40), "handle:", v15);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "cmdError");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    CDMOSLoggerForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "cmdError");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v30 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      v31 = 2112;
      v32 = v26;
      _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s LVC failed to handle the request: %@", buf, 0x16u);

    }
  }
  v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchLVCData:withResponse:requestId:](CDMDataDispatcher, "dispatchLVCData:withResponse:requestId:", v22, v23, v24);

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_433(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id WeakRetained;
  void *v20;
  id v21;
  id v22;
  char v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id location;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, a2);
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Creating CDMSNLCProtoRequestCommand for use in CDMSNLCProtoService", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "response");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "tokenChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "embeddingTensorOutputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:](CDMServiceGraphUtil, "embeddingsOutput:embeddingConfig:forFactor:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), CFSTR("com.apple.siri.nl.snlc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "rewriteMsg");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "firstReformedInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentTurn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  +[CDMServiceGraphUtil buildSNLCProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:requestId:currentTurn:error:](CDMServiceGraphUtil, "buildSNLCProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:requestId:currentTurn:error:", v4, v5, v6, v8, v9, v10, v12, &v31);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v31;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v13;
  v17 = v14;

  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v18)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    objc_msgSend(WeakRetained, "failedWithError:", v17);

    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  objc_msgSend(*(id *)(a1 + 40), "handle:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_loadWeakRetained(&location);
  if (!v21
    || (v22 = objc_loadWeakRetained(&location),
        v23 = objc_msgSend(v22, "isCancelled"),
        v22,
        v21,
        (v23 & 1) != 0))
  {
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      _os_log_debug_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_DEBUG, "%s CDMSNLCProtoService node was cancelled, so not adding response to graph.", buf, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), v20);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "cmdError");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    CDMOSLoggerForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "cmdError");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v34 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      v35 = 2112;
      v36 = v29;
      _os_log_debug_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_DEBUG, "%s SNLC failed to handle the request: %@", buf, 0x16u);

    }
    goto LABEL_12;
  }
LABEL_13:
  v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchSNLCData:withResponse:requestId:](CDMDataDispatcher, "dispatchSNLCData:withResponse:requestId:", v26, v20, v27);

  objc_destroyWeak(&location);
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_434(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CDMSSURequestCommand *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  int v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v21 = 136315138;
    v22 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Building SSU request for use in CDMSSUService", (uint8_t *)&v21, 0xCu);
  }

  v3 = objc_alloc_init(MEMORY[0x24BE9E2D0]);
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNluRequestId:", v4);

  objc_msgSend(v3, "setAsrId:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(v3, "setLocale:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (!v5)
  {
    v19 = "siriVocabularySpanResponse != nil";
    v20 = 596;
    goto LABEL_12;
  }
  objc_msgSend(v5, "spanMatchResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "matchingSpans");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMatchingSpans:", v7);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v19 = "correctedUtterance != nil";
    v20 = 599;
    goto LABEL_12;
  }
  objc_msgSend(v3, "setUtterance:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "firstReformedInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentTurn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "turnContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nlContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "salientEntities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSalientEntities:", v12);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    v19 = "ssuRequestCommand == nil";
    v20 = 603;
    goto LABEL_12;
  }
  v13 = -[CDMSSURequestCommand initWithParserRequest:]([CDMSSURequestCommand alloc], "initWithParserRequest:", v3);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
  {
    v19 = "ssuResponseCommand == nil";
    v20 = 606;
LABEL_12:
    __assert_rtn("-[CDMNLUServiceGraph buildGraph]_block_invoke", "CDMNLUServiceGraph.m", v20, v19);
  }
  objc_msgSend(*(id *)(a1 + 48), "handle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_2_442(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CDMNLUServiceGraph buildGraph]_block_invoke_2";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Prepare to run CDMCcqrAerCbRService", buf, 0xCu);
  }

  v3 = a1[4];
  v4 = a1[5];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil runCcqrService:nluRequest:tokenResponse:previousTurnTokenizationResponseCommand:rdResponse:requestLink:locale:](CDMServiceGraphUtil, "runCcqrService:nluRequest:tokenResponse:previousTurnTokenizationResponseCommand:rdResponse:requestLink:locale:", v3, v4, v5, *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 40), a1[6], a1[7]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[8] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_DEBUG, "%s CDMCcqrAerCbRService node finished", buf, 0xCu);
  }

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_443(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CDMCATIProtoRequestCommand *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id location;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, a2);
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Creating CATIRequestCommand for use in CDMCATIProtoService", buf, 0xCu);
  }

  v4 = objc_alloc_init(MEMORY[0x24BE9E1A0]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenChain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil buildNormalizedUtterance:](CDMServiceGraphUtil, "buildNormalizedUtterance:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setNormalisedUtterance:", v7);
  objc_msgSend(v4, "setOriginalUtterance:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "embeddingTensorOutputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:](CDMServiceGraphUtil, "embeddingsOutput:embeddingConfig:forFactor:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), CFSTR("com.apple.siri.nl.cati"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEmbeddings:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "firstReformedInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentTurn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTurnInput:", v11);

  v12 = -[CDMCATIProtoRequestCommand initWithRequest:]([CDMCATIProtoRequestCommand alloc], "initWithRequest:", v4);
  objc_msgSend(*(id *)(a1 + 32), "handle:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained(&location);
  if (v14
    && (v15 = objc_loadWeakRetained(&location),
        v16 = objc_msgSend(v15, "isCancelled"),
        v15,
        v14,
        (v16 & 1) == 0))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v19 = v13;
    v17 = *(NSObject **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v19;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      _os_log_debug_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_DEBUG, "%s CDMCATIProtoService node was cancelled, so not adding response to graph.", buf, 0xCu);
    }
  }

  +[CDMServiceGraphUtil addDebugInfo:nluRequest:responseObject:](CDMServiceGraphUtil, "addDebugInfo:nluRequest:responseObject:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v13);
  objc_destroyWeak(&location);
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_446(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id WeakRetained;
  void *v17;
  id v18;
  id v19;
  char v20;
  NSObject *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id location;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, a2);
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Creating CDMNLv4RequestCommand for use in CDMNLv4ProtoService", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "response");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "tokenChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "embeddingTensorOutputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:](CDMServiceGraphUtil, "embeddingsOutput:embeddingConfig:forFactor:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), CFSTR("com.apple.siri.nl.nlv4"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "firstReformedInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentTurn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  +[CDMServiceGraphUtil buildNLv4ProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:currentTurn:requestId:outError:](CDMServiceGraphUtil, "buildNLv4ProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:currentTurn:requestId:outError:", v4, v5, v6, v8, v10, v11, &v29);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v29;
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v12;

  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(WeakRetained, "failedWithError:", v13);

  }
  objc_msgSend(*(id *)(a1 + 40), "handle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_loadWeakRetained(&location);
  if (!v18
    || (v19 = objc_loadWeakRetained(&location),
        v20 = objc_msgSend(v19, "isCancelled"),
        v19,
        v18,
        (v20 & 1) != 0))
  {
    CDMOSLoggerForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMNLv4ProtoService node was cancelled, so not adding response to graph.", buf, 0xCu);
    }
    goto LABEL_11;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), v17);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "cmdError");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (!v23)
  {
    v21 = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "cmdError");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject failedWithErrorCode:errorDomain:message:](v21, "failedWithErrorCode:errorDomain:message:", 1, CFSTR("doNLv4InferenceNode"), v25);

LABEL_11:
  }
  v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchNLv4Data:withResponse:requestId:](CDMDataDispatcher, "dispatchNLv4Data:withResponse:requestId:", v26, v17, v27);

  objc_destroyWeak(&location);
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_449(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  CDMOverridesProtoRequestCommand *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  CDMNLv4ProtoResponseCommand *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "firstReformedInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil overrideInputsFromUtterance:matchingSpans:tokenChain:contextUpdateReformedTurnInputBundle:](CDMServiceGraphUtil, "overrideInputsFromUtterance:matchingSpans:tokenChain:contextUpdateReformedTurnInputBundle:", v2, v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BE9E258]);
  objc_msgSend(v8, "setInputs:", v7);
  v9 = -[CDMOverridesProtoRequestCommand initWithRequest:]([CDMOverridesProtoRequestCommand alloc], "initWithRequest:", v8);
  objc_msgSend(*(id *)(a1 + 32), "handle:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BE9E240]);
    objc_msgSend(v10, "parsesForReplacement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v11, "setHypotheses:", v13);

    v14 = objc_alloc_init(MEMORY[0x24BE9E088]);
    objc_msgSend(*(id *)(a1 + 40), "requestId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRequestId:", v15);

    objc_msgSend(v10, "parsesForReplacement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v14, "setParses:", v17);

    v18 = -[CDMNLv4ProtoResponseCommand initWithParserResponse:nluResponse:]([CDMNLv4ProtoResponseCommand alloc], "initWithParserResponse:nluResponse:", v11, v14);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

LABEL_3:
    goto LABEL_9;
  }
  if (+[CDMFeatureFlags isAmbiguityRefactorEnabled](CDMFeatureFlags, "isAmbiguityRefactorEnabled")
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "isDelegated"))
  {
    CDMOSLoggerForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v23 = 136315138;
      v24 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s SNLC delegated to server so NLv4 response will be empty", (uint8_t *)&v23, 0xCu);
    }

    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v11 = *(id *)(v22 + 40);
    *(_QWORD *)(v22 + 40) = 0;
    goto LABEL_3;
  }
LABEL_9:

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_456(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CDMOverridesProtoRequestCommand *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315138;
    v15 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMOverridesProtoRequestCommand for use in CDMOverridesProtoService", (uint8_t *)&v14, 0xCu);
  }

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenChain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "firstReformedInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil overrideInputsFromUtterance:matchingSpans:tokenChain:contextUpdateReformedTurnInputBundle:](CDMServiceGraphUtil, "overrideInputsFromUtterance:matchingSpans:tokenChain:contextUpdateReformedTurnInputBundle:", v3, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BE9E258]);
  objc_msgSend(v9, "setInputs:", v8);
  v10 = -[CDMOverridesProtoRequestCommand initWithRequest:]([CDMOverridesProtoRequestCommand alloc], "initWithRequest:", v9);
  objc_msgSend(*(id *)(a1 + 32), "handle:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_457(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  CDMRepetitionDetectionRequestCommand *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CDMRepetitionDetectionRequestCommand *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v19 = 136315138;
    v20 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMRepetitionDetectionRequestCommand for use in CDMRepetitionDetectionService", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "previousTurnInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [CDMRepetitionDetectionRequestCommand alloc];
  objc_msgSend(*(id *)(a1 + 40), "nlId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "resultCandidateId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMRepetitionDetectionServiceUtils buildRDRequestWithPrevTurn:curTurn:nluRequestId:resultCandidateId:cdmRequestId:](CDMRepetitionDetectionServiceUtils, "buildRDRequestWithPrevTurn:curTurn:nluRequestId:resultCandidateId:cdmRequestId:", v4, v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CDMRepetitionDetectionRequestCommand initWithQRRequest:](v6, "initWithQRRequest:", v10);

  objc_msgSend(*(id *)(a1 + 48), "handle:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "cmdError");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    CDMOSLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "cmdError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315394;
      v20 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Repetition Detection prediction failed: %@", (uint8_t *)&v19, 0x16u);

    }
  }

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_460(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  CDMMentionDetectorRequestCommand *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMMentionDetectorRequestCommand for use in CDMMentionDetectorService", buf, 0xCu);
  }

  v27 = [CDMMentionDetectorRequestCommand alloc];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "response");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "tokenChain");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "embeddingTensorOutputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:](CDMServiceGraphUtil, "embeddingsOutput:embeddingConfig:forFactor:", v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), CFSTR("com.apple.siri.nl.marrs.md"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nlId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resultCandidateId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "requestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMMentionDetectorServiceUtils buildMDRequestWithUtterance:tokenChain:embedding:nluRequestId:resultCandidateId:cdmRequestId:](CDMMentionDetectorServiceUtils, "buildMDRequestWithUtterance:tokenChain:embedding:nluRequestId:resultCandidateId:cdmRequestId:", v3, v28, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "firstReformedInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentTurn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CDMMentionDetectorRequestCommand initWithMDRequest:withCurrTurn:](v27, "initWithMDRequest:withCurrTurn:", v9, v11);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_msgSend(*(id *)(a1 + 48), "handle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  CDMOSLoggerForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "response");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v31 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    v32 = 2112;
    v33 = v26;
    _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s #MD response: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "cmdError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    CDMOSLoggerForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "cmdError");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v31 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      v32 = 2112;
      v33 = v22;
      _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Mention Detection prediction failed: %@", buf, 0x16u);

    }
  }
  v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "requestId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchMDData:withResponse:requestId:](CDMDataDispatcher, "dispatchMDData:withResponse:requestId:", v23, v24, v25);

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_463(uint64_t a1)
{
  NSObject *v2;
  CDMContextualSpanMatcherRequestCommand *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v24 = 136315138;
    v25 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMContextualSpanMatcherRequestCommand for use in CDMContextualSpanMatcherService", (uint8_t *)&v24, 0xCu);
  }

  v3 = [CDMContextualSpanMatcherRequestCommand alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "firstReformedInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTurn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "turnContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nlContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tokenChain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMContextualSpanMatcherServiceUtils buildContextualSpanMatcherRequestWithNLContext:requestId:tokenChain:](CDMContextualSpanMatcherServiceUtils, "buildContextualSpanMatcherRequestWithNLContext:requestId:tokenChain:", v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CDMContextualSpanMatcherRequestCommand initWithContextualSpanMatcherRequest:](v3, "initWithContextualSpanMatcherRequest:", v11);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_msgSend(*(id *)(a1 + 40), "handle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  CDMOSLoggerForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "contextualSpanMatcherResponse");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 136315394;
    v25 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    v26 = 2112;
    v27 = v23;
    _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s #ContextualSpanMatcher response: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "cmdError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    CDMOSLoggerForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "cmdError");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136315394;
      v25 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      v26 = 2112;
      v27 = v22;
      _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: ContextualSpanMatcher prediction failed: %@", (uint8_t *)&v24, 0x16u);

    }
  }
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_466(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  CDMMentionResolverRequestCommand *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMMentionResolverRequestCommand for use in CDMMentionResolverService", buf, 0xCu);
  }

  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    v38 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    v39 = 2112;
    v40 = v29;
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s CDMMentionDetectorResponseCommand: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "firstReformedInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTurn");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = [CDMMentionResolverRequestCommand alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "response");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "tokenChain");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "response");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "contextualSpanMatcherResponse");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "embeddingTensorOutputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:](CDMServiceGraphUtil, "embeddingsOutput:embeddingConfig:forFactor:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), CFSTR("com.apple.siri.nl.marrs.mr"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "firstReformedInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previousTurns");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  objc_msgSend(*(id *)(a1 + 32), "nlId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resultCandidateId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "requestId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMMentionResolverServiceUtils buildMRRequestWithCurTurn:tokenChain:mdResponse:contextualSpanMatcherResponse:embedding:utterance:turnIndex:nluRequestId:resultCandidateId:cdmRequestId:](CDMMentionResolverServiceUtils, "buildMRRequestWithCurTurn:tokenChain:mdResponse:contextualSpanMatcherResponse:embedding:utterance:turnIndex:nluRequestId:resultCandidateId:cdmRequestId:", v32, v35, v34, v33, v6, v7, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CDMMentionResolverRequestCommand initWithMRRequest:](v31, "initWithMRRequest:", v14);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  objc_msgSend(*(id *)(a1 + 48), "handle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  CDMOSLoggerForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "response");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v38 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    v39 = 2112;
    v40 = v30;
    _os_log_debug_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_DEBUG, "%s #MR response: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "cmdError");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    CDMOSLoggerForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "cmdError");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v38 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      v39 = 2112;
      v40 = v25;
      _os_log_impl(&dword_21A2A0000, v23, OS_LOG_TYPE_INFO, "%s [WARN]: Mention Resolver prediction failed: %@", buf, 0x16u);

    }
  }
  v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "requestId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchMRData:withResponse:requestId:](CDMDataDispatcher, "dispatchMRData:withResponse:requestId:", v26, v27, v28);

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_469(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  +[CDMServiceGraphUtil mergeDateTimeSpans:regexSpans:siriVocabularySpans:vocSpans:](CDMServiceGraphUtil, "mergeDateTimeSpans:regexSpans:siriVocabularySpans:vocSpans:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "requestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  objc_msgSend(WeakRetained, "cdmDataDispatcherContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMDataDispatcher dispatchSpanizationData:requestId:dataDispatcherContext:](CDMDataDispatcher, "dispatchSpanizationData:requestId:dataDispatcherContext:", v5, v6, v8);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "matchingSpansForNL");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mentions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMServiceGraphUtil appendMarrsSpans:marrsMRSpans:](CDMServiceGraphUtil, "appendMarrsSpans:marrsMRSpans:", v14, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_2_471(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "correctionOutcome");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "correctionOutcomeOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentTurnInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "correctionOutcomeOverride");
    v6 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v6;
  }
  +[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:graphInput:debugText:](CDMPostProcessUtils, "runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:graphInput:debugText:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 40),
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 40),
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 40),
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 40),
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 40),
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 40),
    v9,
    *(_OWORD *)(a1 + 32),
    *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 224));
  objc_msgSend(WeakRetained, "setGraphOutput:", v7);

}

BOOL __32__CDMNLUServiceGraph_buildGraph__block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "parsesForReplacement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");

  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      v7 = 136315138;
      v8 = "-[CDMNLUServiceGraph buildGraph]_block_invoke_3";
      v5 = "%s Skip node logic #1: Non-empty overridesProtoResponse.parsesForReplacement, will initiate skip of inference nodes";
LABEL_7:
      _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, v5, (uint8_t *)&v7, 0xCu);
    }
  }
  else if (v4)
  {
    v7 = 136315138;
    v8 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    v5 = "%s Skip node logic #1: Empty overridesProtoResponse.parsesForReplacement, will NOT skip inference nodes";
    goto LABEL_7;
  }

  return v2 != 0;
}

BOOL __32__CDMNLUServiceGraph_buildGraph__block_invoke_474(uint64_t a1)
{
  int v1;
  NSObject *v2;
  _BOOL4 v3;
  const char *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "classLabel");
  CDMOSLoggerForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);
  if (v1)
  {
    if (v3)
    {
      v6 = 136315138;
      v7 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      v4 = "%s Skip node logic #2: SNLC did NOT classify SNLC_CLASS_SERVER, will NOT skip doNLv4Inference node";
LABEL_7:
      _os_log_debug_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v6, 0xCu);
    }
  }
  else if (v3)
  {
    v6 = 136315138;
    v7 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    v4 = "%s Skip node logic #2: SNLC classified SNLC_CLASS_SERVER, will initiate skip of doNLv4Inference node";
    goto LABEL_7;
  }

  return v1 == 0;
}

@end
