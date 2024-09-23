@implementation MTRUnitTestingClusterTestStructArrayArgumentRequestParams

- (MTRUnitTestingClusterTestStructArrayArgumentRequestParams)init
{
  const char *v2;
  uint64_t v3;
  MTRUnitTestingClusterTestStructArrayArgumentRequestParams *v4;
  uint64_t v5;
  NSArray *arg1;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *arg2;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *arg3;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *arg4;
  NSNumber *arg5;
  NSNumber *arg6;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MTRUnitTestingClusterTestStructArrayArgumentRequestParams;
  v4 = -[MTRUnitTestingClusterTestStructArrayArgumentRequestParams init](&v24, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    arg1 = v4->_arg1;
    v4->_arg1 = (NSArray *)v5;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    arg2 = v4->_arg2;
    v4->_arg2 = (NSArray *)v9;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    arg3 = v4->_arg3;
    v4->_arg3 = (NSArray *)v13;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    arg4 = v4->_arg4;
    v4->_arg4 = (NSArray *)v17;

    arg5 = v4->_arg5;
    v4->_arg5 = (NSNumber *)&unk_250591A40;

    arg6 = v4->_arg6;
    v4->_arg6 = (NSNumber *)&unk_250591A40;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterTestStructArrayArgumentRequestParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;

  v4 = objc_alloc_init(MTRUnitTestingClusterTestStructArrayArgumentRequestParams);
  objc_msgSend_arg1(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

  objc_msgSend_arg2(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg2_(v4, v12, (uint64_t)v11);

  objc_msgSend_arg3(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg3_(v4, v16, (uint64_t)v15);

  objc_msgSend_arg4(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg4_(v4, v20, (uint64_t)v19);

  objc_msgSend_arg5(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg5_(v4, v24, (uint64_t)v23);

  objc_msgSend_arg6(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg6_(v4, v28, (uint64_t)v27);

  objc_msgSend_timedInvokeTimeoutMs(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v32, (uint64_t)v31);

  objc_msgSend_serverSideProcessingTimeout(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: arg1:%@; arg2:%@; arg3:%@; arg4:%@; arg5:%@; arg6:%@; >"),
    v5,
    self->_arg1,
    self->_arg2,
    self->_arg3,
    self->_arg4,
    self->_arg5,
    self->_arg6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)arg1
{
  return self->_arg1;
}

- (void)setArg1:(NSArray *)arg1
{
  objc_setProperty_nonatomic_copy(self, a2, arg1, 8);
}

- (NSArray)arg2
{
  return self->_arg2;
}

- (void)setArg2:(NSArray *)arg2
{
  objc_setProperty_nonatomic_copy(self, a2, arg2, 16);
}

- (NSArray)arg3
{
  return self->_arg3;
}

- (void)setArg3:(NSArray *)arg3
{
  objc_setProperty_nonatomic_copy(self, a2, arg3, 24);
}

- (NSArray)arg4
{
  return self->_arg4;
}

- (void)setArg4:(NSArray *)arg4
{
  objc_setProperty_nonatomic_copy(self, a2, arg4, 32);
}

- (NSNumber)arg5
{
  return self->_arg5;
}

- (void)setArg5:(NSNumber *)arg5
{
  objc_setProperty_nonatomic_copy(self, a2, arg5, 40);
}

- (NSNumber)arg6
{
  return self->_arg6;
}

- (void)setArg6:(NSNumber *)arg6
{
  objc_setProperty_nonatomic_copy(self, a2, arg6, 48);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 56);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_arg6, 0);
  objc_storeStrong((id *)&self->_arg5, 0);
  objc_storeStrong((id *)&self->_arg4, 0);
  objc_storeStrong((id *)&self->_arg3, 0);
  objc_storeStrong((id *)&self->_arg2, 0);
  objc_storeStrong((id *)&self->_arg1, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  _QWORD *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  unint64_t i;
  void *v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  char isKindOfClass;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  id v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  id v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  int v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  _QWORD *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  unint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t j;
  void *v138;
  const char *v139;
  uint64_t v140;
  unint64_t v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  void *v146;
  char v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  id v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  id v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  int v195;
  const char *v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  unint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  _QWORD *v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  unint64_t k;
  void *v223;
  const char *v224;
  uint64_t v225;
  unint64_t v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  void *v231;
  char v232;
  const char *v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  unint64_t v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  _QWORD *v252;
  const char *v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  unint64_t m;
  void *v264;
  const char *v265;
  uint64_t v266;
  unint64_t v267;
  const char *v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  void *v272;
  char v273;
  const char *v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  void *v278;
  id v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  unint64_t v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  _QWORD *v296;
  const char *v297;
  uint64_t v298;
  void *v299;
  const char *v300;
  uint64_t v301;
  const char *v302;
  uint64_t v303;
  unint64_t n;
  void *v305;
  const char *v306;
  uint64_t v307;
  unint64_t v308;
  const char *v309;
  uint64_t v310;
  void *v311;
  const char *v312;
  void *v313;
  char v314;
  const char *v315;
  uint64_t v316;
  void *v317;
  const char *v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  unint64_t v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  void *v328;
  const char *v329;
  uint64_t v330;
  uint64_t v331;
  const char *v332;
  uint64_t v333;
  _QWORD *v334;
  const char *v335;
  uint64_t v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  unint64_t v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  unint64_t ii;
  void *v345;
  const char *v346;
  uint64_t v347;
  unint64_t v348;
  const char *v349;
  uint64_t v350;
  void *v351;
  const char *v352;
  void *v353;
  char v354;
  const char *v355;
  uint64_t v356;
  void *v357;
  const char *v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  void *v362;
  const char *v363;
  uint64_t v364;
  const char *v365;
  uint64_t v366;
  void *v367;
  const char *v368;
  uint64_t v369;
  const char *v370;
  uint64_t v371;
  void *v372;
  const char *v373;
  uint64_t v374;
  const char *v375;
  uint64_t v376;
  id v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  const char *v384;
  uint64_t v385;
  id v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  const char *v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  void *v394;
  const char *v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  void *v399;
  const char *v400;
  uint64_t v401;
  int v402;
  const char *v403;
  uint64_t v404;
  void *v405;
  const char *v406;
  uint64_t v407;
  uint64_t v408;
  ChipError *v409;
  int v410;
  unsigned int v411;
  uint64_t v412;
  void *v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  void *v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  const char *v421;
  uint64_t v422;
  _QWORD *v423;
  const char *v424;
  uint64_t v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  const char *v429;
  uint64_t v430;
  unint64_t jj;
  void *v432;
  const char *v433;
  uint64_t v434;
  unint64_t v435;
  const char *v436;
  uint64_t v437;
  void *v438;
  const char *v439;
  void *v440;
  char v441;
  const char *v442;
  uint64_t v443;
  void *v444;
  const char *v445;
  void *v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  void *v450;
  const char *v451;
  uint64_t v452;
  uint64_t v453;
  void *v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  const char *v458;
  uint64_t v459;
  _QWORD *v460;
  const char *v461;
  uint64_t v462;
  void *v463;
  const char *v464;
  uint64_t v465;
  const char *v466;
  uint64_t v467;
  unint64_t kk;
  void *v469;
  const char *v470;
  uint64_t v471;
  unint64_t v472;
  const char *v473;
  uint64_t v474;
  void *v475;
  const char *v476;
  void *v477;
  char v478;
  const char *v479;
  uint64_t v480;
  void *v481;
  const char *v482;
  void *v483;
  const char *v484;
  uint64_t v485;
  uint64_t v486;
  void *v487;
  const char *v488;
  uint64_t v489;
  uint64_t v490;
  void *v491;
  const char *v492;
  uint64_t v493;
  const char *v494;
  uint64_t v495;
  void *v496;
  const char *v497;
  uint64_t v498;
  uint64_t v499;
  void *v500;
  const char *v501;
  uint64_t v502;
  uint64_t v503;
  unint64_t v507[8];
  void *v508;
  uint64_t v509;
  uint64_t v510;
  char v511;
  uint64_t v512;
  uint64_t *v513;
  _QWORD v514[2];
  __int128 v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  __int16 v519;
  _BYTE v520[32];

  v519 = 0;
  v517 = 0u;
  v518 = 0u;
  v515 = 0u;
  v516 = 0u;
  v514[0] = 0;
  v514[1] = 0;
  v513 = v514;
  objc_msgSend_arg1(self, a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v5, v6, v7);

  if (v8)
  {
    v11 = (_QWORD *)operator new();
    objc_msgSend_arg1(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_count(v14, v15, v16);
    sub_233CB23B0(v11, v17);

    if (v11[1])
    {
      v507[0] = (unint64_t)v11;
      sub_233CAF24C(&v513, v507, (uint64_t *)v507);
      for (i = 0; ; ++i)
      {
        objc_msgSend_arg1(self, v18, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend_count(v21, v22, v23);

        if (i >= v24)
        {
          v499 = v11[1];
          objc_msgSend_arg1(self, v25, v26);
          v500 = (void *)objc_claimAutoreleasedReturnValue();
          v503 = objc_msgSend_count(v500, v501, v502);
          sub_233CAF22C(v507, v499, v503);
          v515 = *(_OWORD *)v507;

          goto LABEL_42;
        }
        objc_msgSend_arg1(self, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v27, v28, i);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_arg1(self, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v33, v34, i);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_a(v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v11[1] + (i << 7)) = objc_msgSend_unsignedCharValue(v38, v39, v40);

        objc_msgSend_b(v35, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v11[1] + (i << 7) + 1) = objc_msgSend_BOOLValue(v43, v44, v45);

        objc_msgSend_c(v35, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_a(v48, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v11[1] + (i << 7) + 8) = objc_msgSend_unsignedCharValue(v51, v52, v53);

        objc_msgSend_c(v35, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_b(v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v11[1] + (i << 7) + 9) = objc_msgSend_BOOLValue(v59, v60, v61);

        objc_msgSend_c(v35, v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_c(v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v11[1] + (i << 7) + 10) = objc_msgSend_unsignedCharValue(v67, v68, v69);

        objc_msgSend_c(v35, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_d(v72, v73, v74);
        v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v78 = objc_msgSend_bytes(v75, v76, v77);
        v81 = objc_msgSend_length(v75, v79, v80);
        sub_233BF7114(v507, v78, v81);

        *(_OWORD *)(v11[1] + (i << 7) + 16) = *(_OWORD *)v507;
        objc_msgSend_c(v35, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_e(v84, v85, v86);
        v87 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v90 = objc_msgSend_UTF8String(v87, v88, v89);
        v92 = objc_msgSend_lengthOfBytesUsingEncoding_(v87, v91, 4);
        sub_233CAF22C(v507, v90, v92);

        *(_OWORD *)(v11[1] + (i << 7) + 32) = *(_OWORD *)v507;
        objc_msgSend_c(v35, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_f(v95, v96, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v11[1] + (i << 7) + 48) = objc_msgSend_unsignedCharValue(v98, v99, v100);

        objc_msgSend_c(v35, v101, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_g(v103, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_floatValue(v106, v107, v108);
        *(_DWORD *)(v11[1] + (i << 7) + 52) = v109;

        objc_msgSend_c(v35, v110, v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_h(v112, v113, v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v115, v116, v117);
        *(_QWORD *)(v11[1] + (i << 7) + 56) = v118;

        objc_msgSend_d(v35, v119, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = objc_msgSend_count(v121, v122, v123);

        if (v124)
        {
          v127 = (_QWORD *)operator new();
          objc_msgSend_d(v35, v128, v129);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = objc_msgSend_count(v130, v131, v132);
          sub_233CB24EC(v127, v133);

          if (v127[1])
          {
            v507[0] = (unint64_t)v127;
            sub_233CAF24C(&v513, v507, (uint64_t *)v507);
            v136 = 0;
            for (j = 0; ; ++j)
            {
              objc_msgSend_d(v35, v134, v135);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              v141 = objc_msgSend_count(v138, v139, v140);

              if (j >= v141)
              {
                v203 = v127[1];
                objc_msgSend_d(v35, v142, v143);
                v204 = (void *)objc_claimAutoreleasedReturnValue();
                v207 = objc_msgSend_count(v204, v205, v206);
                sub_233CAF22C(v507, v203, v207);
                *(_OWORD *)(v11[1] + (i << 7) + 64) = *(_OWORD *)v507;

                goto LABEL_14;
              }
              objc_msgSend_d(v35, v142, v143);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v144, v145, j);
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v147 = objc_opt_isKindOfClass();

              if ((v147 & 1) == 0)
                break;
              objc_msgSend_d(v35, v148, v149);
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v150, v151, j);
              v152 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_a(v152, v153, v154);
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              *(_BYTE *)(v127[1] + v136) = objc_msgSend_unsignedCharValue(v155, v156, v157);

              objc_msgSend_b(v152, v158, v159);
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              *(_BYTE *)(v127[1] + v136 + 1) = objc_msgSend_BOOLValue(v160, v161, v162);

              objc_msgSend_c(v152, v163, v164);
              v165 = (void *)objc_claimAutoreleasedReturnValue();
              *(_BYTE *)(v127[1] + v136 + 2) = objc_msgSend_unsignedCharValue(v165, v166, v167);

              objc_msgSend_d(v152, v168, v169);
              v170 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v173 = objc_msgSend_bytes(v170, v171, v172);
              v176 = objc_msgSend_length(v170, v174, v175);
              sub_233BF7114(v507, v173, v176);

              *(_OWORD *)(v127[1] + v136 + 8) = *(_OWORD *)v507;
              objc_msgSend_e(v152, v177, v178);
              v179 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v182 = objc_msgSend_UTF8String(v179, v180, v181);
              v184 = objc_msgSend_lengthOfBytesUsingEncoding_(v179, v183, 4);
              sub_233CAF22C(v507, v182, v184);

              *(_OWORD *)(v127[1] + v136 + 24) = *(_OWORD *)v507;
              objc_msgSend_f(v152, v185, v186);
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              *(_BYTE *)(v127[1] + v136 + 40) = objc_msgSend_unsignedCharValue(v187, v188, v189);

              objc_msgSend_g(v152, v190, v191);
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_floatValue(v192, v193, v194);
              *(_DWORD *)(v127[1] + v136 + 44) = v195;

              objc_msgSend_h(v152, v196, v197);
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_doubleValue(v198, v199, v200);
              *(_QWORD *)(v127[1] + v136 + 48) = v201;

              v136 += 56;
            }
            v411 = 33222;
          }
          else
          {
            v411 = 33216;
          }
          goto LABEL_73;
        }
        v202 = v11[1] + (i << 7);
        *(_QWORD *)(v202 + 64) = 0;
        *(_QWORD *)(v202 + 72) = 0;
LABEL_14:
        objc_msgSend_e(v35, v125, v126);
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        v211 = objc_msgSend_count(v208, v209, v210);

        if (v211)
        {
          v214 = (_QWORD *)operator new();
          objc_msgSend_e(v35, v215, v216);
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_count(v217, v218, v219);
          *v214 = &off_2504EF520;
          v214[1] = operator new[]();

          if (v214[1])
          {
            v507[0] = (unint64_t)v214;
            sub_233CAF24C(&v513, v507, (uint64_t *)v507);
            for (k = 0; ; ++k)
            {
              objc_msgSend_e(v35, v220, v221);
              v223 = (void *)objc_claimAutoreleasedReturnValue();
              v226 = objc_msgSend_count(v223, v224, v225);

              if (k >= v226)
              {
                v241 = v214[1];
                objc_msgSend_e(v35, v227, v228);
                v242 = (void *)objc_claimAutoreleasedReturnValue();
                v245 = objc_msgSend_count(v242, v243, v244);
                sub_233CAF22C(v507, v241, v245);
                *(_OWORD *)(v11[1] + (i << 7) + 80) = *(_OWORD *)v507;

                goto LABEL_22;
              }
              objc_msgSend_e(v35, v227, v228);
              v229 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v229, v230, k);
              v231 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v232 = objc_opt_isKindOfClass();

              if ((v232 & 1) == 0)
                break;
              objc_msgSend_e(v35, v233, v234);
              v235 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v235, v236, k);
              v237 = (void *)objc_claimAutoreleasedReturnValue();

              *(_DWORD *)(v214[1] + 4 * k) = objc_msgSend_unsignedIntValue(v237, v238, v239);
            }
            v411 = 33251;
          }
          else
          {
            v411 = 33245;
          }
          goto LABEL_73;
        }
        v240 = v11[1] + (i << 7);
        *(_QWORD *)(v240 + 80) = 0;
        *(_QWORD *)(v240 + 88) = 0;
LABEL_22:
        objc_msgSend_f(v35, v212, v213);
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        v249 = objc_msgSend_count(v246, v247, v248);

        if (v249)
        {
          v252 = (_QWORD *)operator new();
          objc_msgSend_f(v35, v253, v254);
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          v258 = objc_msgSend_count(v255, v256, v257);
          *v252 = &off_2504EF408;
          v259 = (void *)operator new[]();
          v260 = v259;
          if (v258)
            bzero(v259, 16 * v258);
          v252[1] = v260;

          if (v252[1])
          {
            v507[0] = (unint64_t)v252;
            sub_233CAF24C(&v513, v507, (uint64_t *)v507);
            for (m = 0; ; ++m)
            {
              objc_msgSend_f(v35, v261, v262);
              v264 = (void *)objc_claimAutoreleasedReturnValue();
              v267 = objc_msgSend_count(v264, v265, v266);

              if (m >= v267)
              {
                v287 = v252[1];
                objc_msgSend_f(v35, v268, v269);
                v288 = (void *)objc_claimAutoreleasedReturnValue();
                v291 = objc_msgSend_count(v288, v289, v290);
                sub_233CAF22C(v507, v287, v291);
                *(_OWORD *)(v11[1] + (i << 7) + 96) = *(_OWORD *)v507;

                goto LABEL_32;
              }
              objc_msgSend_f(v35, v268, v269);
              v270 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v270, v271, m);
              v272 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v273 = objc_opt_isKindOfClass();

              if ((v273 & 1) == 0)
                break;
              objc_msgSend_f(v35, v274, v275);
              v276 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v276, v277, m);
              v278 = (void *)objc_claimAutoreleasedReturnValue();

              v279 = objc_retainAutorelease(v278);
              v282 = objc_msgSend_bytes(v279, v280, v281);
              v285 = objc_msgSend_length(v279, v283, v284);
              sub_233BF7114(v507, v282, v285);

              *(_OWORD *)(v252[1] + 16 * m) = *(_OWORD *)v507;
            }
            v411 = 33273;
          }
          else
          {
            v411 = 33267;
          }
          goto LABEL_73;
        }
        v286 = v11[1] + (i << 7);
        *(_QWORD *)(v286 + 96) = 0;
        *(_QWORD *)(v286 + 104) = 0;
LABEL_32:
        objc_msgSend_g(v35, v250, v251);
        v292 = (void *)objc_claimAutoreleasedReturnValue();
        v295 = objc_msgSend_count(v292, v293, v294);

        if (v295)
        {
          v296 = (_QWORD *)operator new();
          objc_msgSend_g(v35, v297, v298);
          v299 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_count(v299, v300, v301);
          *v296 = &off_2504EF750;
          v296[1] = operator new[]();

          if (v296[1])
          {
            v507[0] = (unint64_t)v296;
            sub_233CAF24C(&v513, v507, (uint64_t *)v507);
            for (n = 0; ; ++n)
            {
              objc_msgSend_g(v35, v302, v303);
              v305 = (void *)objc_claimAutoreleasedReturnValue();
              v308 = objc_msgSend_count(v305, v306, v307);

              if (n >= v308)
              {
                v323 = v296[1];
                objc_msgSend_g(v35, v309, v310);
                v324 = (void *)objc_claimAutoreleasedReturnValue();
                v327 = objc_msgSend_count(v324, v325, v326);
                sub_233BF7114(v507, v323, v327);
                *(_OWORD *)(v11[1] + (i << 7) + 112) = *(_OWORD *)v507;

                goto LABEL_40;
              }
              objc_msgSend_g(v35, v309, v310);
              v311 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v311, v312, n);
              v313 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v314 = objc_opt_isKindOfClass();

              if ((v314 & 1) == 0)
                break;
              objc_msgSend_g(v35, v315, v316);
              v317 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v317, v318, n);
              v319 = (void *)objc_claimAutoreleasedReturnValue();

              *(_BYTE *)(v296[1] + n) = objc_msgSend_unsignedCharValue(v319, v320, v321);
            }
            v411 = 33295;
          }
          else
          {
            v411 = 33289;
          }
LABEL_73:
          retstr->mError = 47;
          retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/"
                          "zap-generated/MTRCommandPayloadsObjc.mm";
          retstr->mLine = v411;

          return (ChipError *)sub_233CAF15C((uint64_t)&v513);
        }
        v322 = v11[1] + (i << 7);
        *(_QWORD *)(v322 + 112) = 0;
        *(_QWORD *)(v322 + 120) = 0;
LABEL_40:

      }
      v409 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v410 = 33197;
    }
    else
    {
      v409 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v410 = 33191;
    }
    goto LABEL_87;
  }
  v515 = 0uLL;
LABEL_42:
  objc_msgSend_arg2(self, v9, v10);
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  v331 = objc_msgSend_count(v328, v329, v330);

  if (v331)
  {
    v334 = (_QWORD *)operator new();
    objc_msgSend_arg2(self, v335, v336);
    v337 = (void *)objc_claimAutoreleasedReturnValue();
    v340 = objc_msgSend_count(v337, v338, v339);
    sub_233CB24EC(v334, v340);

    if (v334[1])
    {
      v507[0] = (unint64_t)v334;
      sub_233CAF24C(&v513, v507, (uint64_t *)v507);
      v343 = 0;
      for (ii = 0; ; ++ii)
      {
        objc_msgSend_arg2(self, v341, v342);
        v345 = (void *)objc_claimAutoreleasedReturnValue();
        v348 = objc_msgSend_count(v345, v346, v347);

        if (ii >= v348)
        {
          v412 = v334[1];
          objc_msgSend_arg2(self, v349, v350);
          v413 = (void *)objc_claimAutoreleasedReturnValue();
          v416 = objc_msgSend_count(v413, v414, v415);
          sub_233CAF22C(v507, v412, v416);
          v516 = *(_OWORD *)v507;

          goto LABEL_54;
        }
        objc_msgSend_arg2(self, v349, v350);
        v351 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v351, v352, ii);
        v353 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v354 = objc_opt_isKindOfClass();

        if ((v354 & 1) == 0)
          break;
        objc_msgSend_arg2(self, v355, v356);
        v357 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v357, v358, ii);
        v359 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_a(v359, v360, v361);
        v362 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v334[1] + v343) = objc_msgSend_unsignedCharValue(v362, v363, v364);

        objc_msgSend_b(v359, v365, v366);
        v367 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v334[1] + v343 + 1) = objc_msgSend_BOOLValue(v367, v368, v369);

        objc_msgSend_c(v359, v370, v371);
        v372 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v334[1] + v343 + 2) = objc_msgSend_unsignedCharValue(v372, v373, v374);

        objc_msgSend_d(v359, v375, v376);
        v377 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v380 = objc_msgSend_bytes(v377, v378, v379);
        v383 = objc_msgSend_length(v377, v381, v382);
        sub_233BF7114(v507, v380, v383);

        *(_OWORD *)(v334[1] + v343 + 8) = *(_OWORD *)v507;
        objc_msgSend_e(v359, v384, v385);
        v386 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v389 = objc_msgSend_UTF8String(v386, v387, v388);
        v391 = objc_msgSend_lengthOfBytesUsingEncoding_(v386, v390, 4);
        sub_233CAF22C(v507, v389, v391);

        *(_OWORD *)(v334[1] + v343 + 24) = *(_OWORD *)v507;
        objc_msgSend_f(v359, v392, v393);
        v394 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v334[1] + v343 + 40) = objc_msgSend_unsignedCharValue(v394, v395, v396);

        objc_msgSend_g(v359, v397, v398);
        v399 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_floatValue(v399, v400, v401);
        *(_DWORD *)(v334[1] + v343 + 44) = v402;

        objc_msgSend_h(v359, v403, v404);
        v405 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v405, v406, v407);
        *(_QWORD *)(v334[1] + v343 + 48) = v408;

        v343 += 56;
      }
      v409 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v410 = 33325;
    }
    else
    {
      v409 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v410 = 33319;
    }
    goto LABEL_87;
  }
  v516 = 0uLL;
LABEL_54:
  objc_msgSend_arg3(self, v332, v333);
  v417 = (void *)objc_claimAutoreleasedReturnValue();
  v420 = objc_msgSend_count(v417, v418, v419);

  if (v420)
  {
    v423 = (_QWORD *)operator new();
    objc_msgSend_arg3(self, v424, v425);
    v426 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_count(v426, v427, v428);
    *v423 = &off_2504EF788;
    v423[1] = operator new[]();

    if (v423[1])
    {
      v507[0] = (unint64_t)v423;
      sub_233CAF24C(&v513, v507, (uint64_t *)v507);
      for (jj = 0; ; ++jj)
      {
        objc_msgSend_arg3(self, v429, v430);
        v432 = (void *)objc_claimAutoreleasedReturnValue();
        v435 = objc_msgSend_count(v432, v433, v434);

        if (jj >= v435)
        {
          v449 = v423[1];
          objc_msgSend_arg3(self, v436, v437);
          v450 = (void *)objc_claimAutoreleasedReturnValue();
          v453 = objc_msgSend_count(v450, v451, v452);
          sub_233CAF22C(v507, v449, v453);
          v517 = *(_OWORD *)v507;

          goto LABEL_65;
        }
        objc_msgSend_arg3(self, v436, v437);
        v438 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v438, v439, jj);
        v440 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v441 = objc_opt_isKindOfClass();

        if ((v441 & 1) == 0)
          break;
        objc_msgSend_arg3(self, v442, v443);
        v444 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v444, v445, jj);
        v446 = (void *)objc_claimAutoreleasedReturnValue();

        *(_BYTE *)(v423[1] + jj) = objc_msgSend_unsignedCharValue(v446, v447, v448);
      }
      v409 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v410 = 33356;
    }
    else
    {
      v409 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v410 = 33350;
    }
    goto LABEL_87;
  }
  v517 = 0uLL;
LABEL_65:
  objc_msgSend_arg4(self, v421, v422);
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  v457 = objc_msgSend_count(v454, v455, v456);

  if (v457)
  {
    v460 = (_QWORD *)operator new();
    objc_msgSend_arg4(self, v461, v462);
    v463 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_count(v463, v464, v465);
    *v460 = &off_2504EF7C0;
    v460[1] = operator new[]();

    if (v460[1])
    {
      v507[0] = (unint64_t)v460;
      sub_233CAF24C(&v513, v507, (uint64_t *)v507);
      for (kk = 0; ; ++kk)
      {
        objc_msgSend_arg4(self, v466, v467);
        v469 = (void *)objc_claimAutoreleasedReturnValue();
        v472 = objc_msgSend_count(v469, v470, v471);

        if (kk >= v472)
        {
          v486 = v460[1];
          objc_msgSend_arg4(self, v473, v474);
          v487 = (void *)objc_claimAutoreleasedReturnValue();
          v490 = objc_msgSend_count(v487, v488, v489);
          sub_233CAF22C(v507, v486, v490);
          v518 = *(_OWORD *)v507;

          goto LABEL_77;
        }
        objc_msgSend_arg4(self, v473, v474);
        v475 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v475, v476, kk);
        v477 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v478 = objc_opt_isKindOfClass();

        if ((v478 & 1) == 0)
          break;
        objc_msgSend_arg4(self, v479, v480);
        v481 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v481, v482, kk);
        v483 = (void *)objc_claimAutoreleasedReturnValue();

        *(_BYTE *)(v460[1] + kk) = objc_msgSend_BOOLValue(v483, v484, v485);
      }
      v409 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v410 = 33380;
    }
    else
    {
      v409 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v410 = 33374;
    }
LABEL_87:
    v409->mLine = v410;
    return (ChipError *)sub_233CAF15C((uint64_t)&v513);
  }
  v518 = 0uLL;
LABEL_77:
  objc_msgSend_arg5(self, v458, v459);
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v519) = objc_msgSend_unsignedCharValue(v491, v492, v493);

  objc_msgSend_arg6(self, v494, v495);
  v496 = (void *)objc_claimAutoreleasedReturnValue();
  HIBYTE(v519) = objc_msgSend_BOOLValue(v496, v497, v498);

  sub_234118674(0x62FuLL, 0, &v512);
  if (v512)
  {
    sub_234106C48((uint64_t)v507);
    v509 = 0;
    v510 = 0;
    v508 = &unk_250504030;
    v511 = 0;
    sub_233CAF098((uint64_t)&v508, &v512, 0);
    sub_234106CA8((uint64_t)v507, (uint64_t)&v508, 0xFFFFFFFF, (uint64_t)v520);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D3FDFC((uint64_t)&v515, (char *)v507, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v507, &v512, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v512);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v508 = &unk_250504030;
    sub_233CAF128(&v510);
    sub_233CAF128(&v509);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 33400;
  }
  sub_233CAF128(&v512);
  return (ChipError *)sub_233CAF15C((uint64_t)&v513);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  int v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[72];
  uint64_t v15;

  v5 = sub_234104468((uint64_t)v14);
  v15 = 0;
  v12 = 0uLL;
  v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  sub_233CE3234((uint64_t)v14, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((_QWORD *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    v11 = 33429;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
