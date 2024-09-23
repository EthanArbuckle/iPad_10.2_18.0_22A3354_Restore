@implementation ASEProcessingT1

- (ASEProcessingT1)initWithConfig:(id *)a3 aseProcessing:(id)a4 productType:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  ASEProcessingT1 *v9;
  ASEProcessingT1 *v10;
  $C4EB042D48733C4754B40AB9ACD610BF *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v5 = *(_QWORD *)&a5;
  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASEProcessingT1;
  v9 = -[ASEProcessingT0 initWithConfig:aseProcessing:productType:](&v13, sel_initWithConfig_aseProcessing_productType_, a3, v8, v5);
  v10 = v9;
  if (v9)
  {
    if (!isT1OrNewer(v9->super._productType))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"isT1OrNewer(_productType)\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 88\n", buf, 2u);
      }
      if (!isT1OrNewer(v10->super._productType))
        -[ASEProcessingT1 initWithConfig:aseProcessing:productType:].cold.1();
    }
    v10->_aseControlUnitV3 = (hwConfigurationUnitsV3_t *)malloc_type_malloc(0x4EF0uLL, 0x10000406724B787uLL);
    if (disableHcuCache)
    {
      if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[ASEProcessingT1 initWithConfig:aseProcessing:productType:]";
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s: HCU Cache disabled!\n", buf, 0xCu);
      }
      v10->_aseControlUnitV3Cache = 0;
    }
    else
    {
      if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[ASEProcessingT1 initWithConfig:aseProcessing:productType:]";
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s: HCU Cache enabled!\n", buf, 0xCu);
      }
      v11 = ($C4EB042D48733C4754B40AB9ACD610BF *)malloc_type_malloc(0x90uLL, 0x1020040206F8E95uLL);
      v10->_aseControlUnitV3Cache = v11;
      initCache(v11);
    }
  }

  return v10;
}

- (void)dealloc
{
  hwConfigurationUnitsV3_t *aseControlUnitV3;
  $C4EB042D48733C4754B40AB9ACD610BF *aseControlUnitV3Cache;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  aseControlUnitV3 = self->_aseControlUnitV3;
  if (aseControlUnitV3)
  {
    free(aseControlUnitV3);
    self->_aseControlUnitV3 = 0;
  }
  aseControlUnitV3Cache = self->_aseControlUnitV3Cache;
  if (aseControlUnitV3Cache)
  {
    deleteCache(aseControlUnitV3Cache);
    self->_aseControlUnitV3Cache = 0;
  }
  if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ASEProcessingT1 dealloc]";
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s \n", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)ASEProcessingT1;
  -[ASEProcessingT0 dealloc](&v5, sel_dealloc);
}

- (void)DumpArray:(const char *)a3 array:(unsigned int *)a4 count:(unsigned int)a5
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  uint8_t buf[4];
  char *v12;
  char __str[256];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a5)
  {
    v5 = 0;
    v6 = a5 - 1;
    v7 = a5;
    v8 = __str;
    v9 = 256;
    do
    {
      if (v5)
      {
        if (v5 >= v6)
          v10 = snprintf(v8, v9, ", %d }");
        else
          v10 = snprintf(v8, v9, ", %d");
      }
      else
      {
        v10 = snprintf(v8, v9, "%s { %d");
      }
      v8 += v10;
      v9 -= v10;
      ++v5;
    }
    while (v7 != v5);
  }
  if (logLevel > 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = __str;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] %s\n", buf, 0xCu);
  }
}

- (void)DumpPiecewiseLinearCurveV3:(const char *)a3 curve:(id *)a4
{
  uint64_t v5;
  unsigned int v6;
  float *p_var2;
  NSObject *v8;
  double v9;
  double v10;
  double v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v5 = 0;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = logLevel;
  p_var2 = &a4->var0[0].var2;
  v8 = MEMORY[0x24BDACB70];
  do
  {
    if (v6 >= 3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(p_var2 - 2);
        v10 = *(p_var2 - 1);
        v11 = *p_var2;
        *(_DWORD *)buf = 136316162;
        v13 = a3;
        v14 = 1024;
        v15 = v5;
        v16 = 2048;
        v17 = v9;
        v18 = 2048;
        v19 = v10;
        v20 = 2048;
        v21 = v11;
        _os_log_impl(&dword_206505000, v8, OS_LOG_TYPE_DEFAULT, " [1.37.0] %s #%d: { %f, %f, %f }\n", buf, 0x30u);
      }
      v6 = logLevel;
    }
    ++v5;
    p_var2 += 3;
  }
  while (v5 != 32);
}

- (void)DumpOutputHcus:(id)a3
{
  id v4;
  uint64_t v5;
  int *v6;
  NSObject *v7;
  id v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int *v12;
  unsigned int *v13;
  NSObject *v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int *v18;
  NSObject *v19;
  unsigned int v20;
  float *v21;
  unsigned int v22;
  ASEProcessingT1 *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  int v31;
  int v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  unsigned int v36;
  unsigned int v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  id v48;
  int v49;
  int v50;
  int v51;
  int v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  NSObject *v56;
  id v57;
  NSObject *v58;
  id v59;
  NSObject *v60;
  id v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  id v65;
  int v66;
  int v67;
  int v68;
  NSObject *v69;
  id v70;
  NSObject *v71;
  float v72;
  NSObject *v73;
  NSObject *v74;
  id v75;
  NSObject *v76;
  id v77;
  NSObject *v78;
  id v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  NSObject *v85;
  id v86;
  NSObject *v87;
  int v88;
  int v89;
  NSObject *v90;
  int v91;
  int v92;
  int v93;
  unsigned int v94;
  NSObject *v95;
  id v96;
  NSObject *v97;
  int v98;
  NSObject *v99;
  int v100;
  NSObject *v101;
  id v102;
  NSObject *v103;
  int v104;
  int v105;
  unsigned int v106;
  NSObject *v107;
  int v108;
  int v109;
  int v110;
  NSObject *v111;
  id v112;
  uint64_t v113;
  NSObject *v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  unsigned int v118;
  NSObject *v119;
  float v120;
  float v121;
  int v122;
  int v123;
  unsigned int v124;
  unsigned int v125;
  NSObject *v126;
  int v127;
  int v128;
  NSObject *v129;
  id v130;
  NSObject *v131;
  unsigned int v132;
  unsigned int v133;
  unsigned int v134;
  NSObject *v135;
  unsigned int v136;
  int v137;
  int v138;
  int v139;
  uint64_t v140;
  NSObject *v141;
  int v142;
  int v143;
  int v144;
  int v145;
  NSObject *v146;
  int v147;
  unsigned int v148;
  unsigned int v149;
  unsigned int v150;
  NSObject *v151;
  unsigned int v152;
  unsigned int v153;
  unsigned int v154;
  unsigned int v155;
  NSObject *v156;
  unsigned int v157;
  unsigned int v158;
  unsigned int v159;
  unsigned int v160;
  NSObject *v161;
  unsigned int v162;
  unsigned int v163;
  unsigned int v164;
  unsigned int v165;
  NSObject *v166;
  unsigned int v167;
  unsigned int v168;
  unsigned int v169;
  unsigned int v170;
  NSObject *v171;
  unsigned int v172;
  unsigned int v173;
  unsigned int v174;
  unsigned int v175;
  NSObject *v176;
  unsigned int v177;
  unsigned int v178;
  unsigned int v179;
  int v180;
  NSObject *v181;
  int v182;
  int v183;
  int v184;
  unsigned int v185;
  NSObject *v186;
  unsigned int v187;
  unsigned int v188;
  unsigned int v189;
  unsigned int v190;
  NSObject *v191;
  unsigned int v192;
  unsigned int v193;
  unsigned int v194;
  int v195;
  NSObject *v196;
  int v197;
  int v198;
  int v199;
  unsigned int v200;
  NSObject *v201;
  unsigned int v202;
  unsigned int v203;
  unsigned int v204;
  unsigned int v205;
  NSObject *v206;
  unsigned int v207;
  unsigned int v208;
  unsigned int v209;
  int v210;
  NSObject *v211;
  int v212;
  int v213;
  int v214;
  unsigned int v215;
  NSObject *v216;
  unsigned int v217;
  unsigned int v218;
  unsigned int v219;
  int v220;
  NSObject *v221;
  int v222;
  int v223;
  int v224;
  int v225;
  NSObject *v226;
  int v227;
  int v228;
  int v229;
  int v230;
  NSObject *v231;
  int v232;
  int v233;
  int v234;
  int v235;
  NSObject *v236;
  int v237;
  int v238;
  int v239;
  int v240;
  NSObject *v241;
  int v242;
  unsigned int v243;
  unsigned int v244;
  unsigned int v245;
  NSObject *v246;
  unsigned int v247;
  NSObject *v248;
  id v249;
  NSObject *v250;
  unsigned int v251;
  unsigned int v252;
  unsigned int v253;
  NSObject *v254;
  unsigned int v255;
  unsigned int v256;
  unsigned int v257;
  unsigned int v258;
  uint64_t v259;
  NSObject *v260;
  unsigned int v261;
  unsigned int v262;
  unsigned int v263;
  unsigned int v264;
  NSObject *v265;
  unsigned int v266;
  unsigned int v267;
  unsigned int v268;
  unsigned int v269;
  NSObject *v270;
  unsigned int v271;
  unsigned int v272;
  unsigned int v273;
  int v274;
  NSObject *v275;
  int v276;
  int v277;
  int v278;
  unsigned int v279;
  NSObject *v280;
  unsigned int v281;
  unsigned int v282;
  unsigned int v283;
  unsigned int v284;
  NSObject *v285;
  unsigned int v286;
  int v287;
  int v288;
  int v289;
  NSObject *v290;
  int v291;
  int v292;
  int v293;
  int v294;
  NSObject *v295;
  int v296;
  int v297;
  int v298;
  int v299;
  NSObject *v300;
  int v301;
  int v302;
  int v303;
  int v304;
  NSObject *v305;
  int v306;
  int v307;
  int v308;
  int v309;
  NSObject *v310;
  unsigned int v311;
  NSObject *v312;
  id v313;
  NSObject *v314;
  unsigned int v315;
  unsigned int v316;
  unsigned int v317;
  unsigned int v318;
  NSObject *v319;
  unsigned int v320;
  unsigned int v321;
  unsigned int v322;
  unsigned int v323;
  uint64_t v324;
  NSObject *v325;
  int v326;
  int v327;
  int v328;
  int v329;
  NSObject *v330;
  unsigned int v331;
  unsigned int v332;
  unsigned int v333;
  unsigned int v334;
  NSObject *v335;
  unsigned int v336;
  unsigned int v337;
  unsigned int v338;
  unsigned int v339;
  NSObject *v340;
  int v341;
  int v342;
  int v343;
  int v344;
  NSObject *v345;
  unsigned int v346;
  unsigned int v347;
  unsigned int v348;
  unsigned int v349;
  NSObject *v350;
  unsigned int v351;
  unsigned int v352;
  unsigned int v353;
  unsigned int v354;
  NSObject *v355;
  int v356;
  int v357;
  int v358;
  int v359;
  NSObject *v360;
  unsigned int v361;
  int *v362;
  int *v363;
  float *v364;
  float *v365;
  float *v366;
  uint8_t v367[4];
  const char *v368;
  __int16 v369;
  _BYTE v370[10];
  _BYTE v371[34];
  uint8_t buf[4];
  const char *v373;
  __int16 v374;
  unsigned int v375;
  __int16 v376;
  unsigned int v377;
  __int16 v378;
  unsigned int v379;
  __int16 v380;
  unsigned int v381;
  __int16 v382;
  int v383;
  __int16 v384;
  int v385;
  __int16 v386;
  int v387;
  uint64_t v388;

  v388 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  if (!dumpOutputHcu)
    goto LABEL_133;
  v6 = (int *)v5;
  if (logLevel >= 3)
  {
    v7 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *v6;
      v10 = v6[1];
      *(_DWORD *)buf = 136315650;
      v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v374 = 1024;
      v375 = v9;
      v376 = 1024;
      v377 = v10;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: hcuHeader: hcuCount = %d, hcuSize = %d\n", buf, 0x18u);
    }

  }
  if (*v6)
  {
    v11 = 0;
    v363 = 0;
    v364 = 0;
    v366 = 0;
    v365 = 0;
    v12 = 0;
    v362 = 0;
    v13 = (unsigned int *)(v6 + 2);
    v14 = MEMORY[0x24BDACB70];
    do
    {
      if (logLevel >= 3)
      {
        v15 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *v13;
          v16 = v13[1];
          *(_DWORD *)buf = 136316930;
          v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
          v374 = 1024;
          v375 = v11;
          v376 = 1024;
          v377 = v16;
          v378 = 1024;
          v379 = v17;
          v380 = 1024;
          v381 = HIBYTE(v17);
          v382 = 1024;
          v383 = BYTE2(v17);
          v384 = 1024;
          v385 = BYTE1(v17);
          v386 = 1024;
          v387 = v17;
          _os_log_impl(&dword_206505000, v14, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: entryHeader[%d]: hcuSize = %d, hcuType = 0x%x ('%c%c%c%c')\n", buf, 0x36u);
        }

      }
      v18 = v13 + 2;
      switch(*v13)
      {
        case 0x6173656Bu:
          v366 = (float *)(v13 + 2);
          v18 = v13 + 323;
          break;
        case 0x6173656Cu:
          v365 = (float *)(v13 + 2);
          v18 = v13 + 529;
          break;
        case 0x6173656Du:
          v364 = (float *)(v13 + 2);
          v18 = v13 + 390;
          break;
        case 0x6173656Eu:
          v362 = (int *)(v13 + 2);
          v18 = v13 + 7;
          break;
        case 0x6173656Fu:
          v12 = (int *)(v13 + 2);
          v18 = v13 + 4;
          break;
        case 0x61736570u:
          v363 = (int *)(v13 + 2);
          v18 = v13 + 8;
          break;
        default:
          if (logLevel >= 3)
          {
            v19 = v14;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v20 = *v13;
              *(_DWORD *)buf = 136316418;
              v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
              v374 = 1024;
              v375 = v20;
              v376 = 1024;
              v377 = HIBYTE(v20);
              v378 = 1024;
              v379 = BYTE2(v20);
              v380 = 1024;
              v381 = BYTE1(v20);
              v382 = 1024;
              v383 = v20;
              _os_log_impl(&dword_206505000, v14, OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ERROR: Unsupported HCU!  hcuType = 0x%x ('%c%c%c%c')\n", buf, 0x2Au);
            }

          }
          break;
      }
      ++v11;
      v13 = v18;
    }
    while (v11 < *v6);
  }
  else
  {
    v362 = 0;
    v363 = 0;
    v12 = 0;
    v364 = 0;
    v365 = 0;
    v366 = 0;
  }
  v21 = v364;
  if ((dumpOutputHcu & 2) != 0)
  {
    v22 = logLevel;
    if (v363)
    {
      v23 = self;
      if (logLevel >= 3)
      {
        v24 = MEMORY[0x24BDACB70];
        v25 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", buf, 0xCu);
        }

        if (logLevel < 3)
          goto LABEL_44;
        v26 = v24;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v27 = *v363;
          v28 = v363[1];
          v29 = v363[2];
          v30 = v363[3];
          v31 = v363[4];
          v32 = v363[5];
          *(_DWORD *)buf = 136316674;
          v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
          v374 = 1024;
          v375 = v27;
          v376 = 1024;
          v377 = v28;
          v378 = 1024;
          v379 = v29;
          v380 = 1024;
          v381 = v30;
          v382 = 1024;
          v383 = v31;
          v384 = 1024;
          v385 = v32;
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: scalingConfigV3Hcu: DDAInitX = %u, DDAInitY = %u, DDAStepX = 0x%x, DDAStepY = 0x%x, DDAInvStepX = 0x%x, DDAInvStepY = 0x%x\n", buf, 0x30u);
        }

        v22 = logLevel;
      }
    }
    else
    {
      v23 = self;
    }
    if (v12 && v22 >= 3)
    {
      v33 = MEMORY[0x24BDACB70];
      v34 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", buf, 0xCu);
      }

      if (logLevel >= 3)
      {
        v35 = v33;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v36 = *v12;
          v37 = v12[1];
          *(_DWORD *)buf = 136315650;
          v373 = "-[ASEProcessingT1 DumpOutputHcus:]";
          v374 = 1024;
          v375 = v36;
          v376 = 1024;
          v377 = v37;
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: angleDetectV3Hcu: signChangeThreshold = %u, hfeqThresh2 = %u\n", buf, 0x18u);
        }

      }
    }
LABEL_44:
    if (v364)
    {
      snprintf((char *)buf, 0x100uLL, "    %s: blendConfigV3Hcu:", "-[ASEProcessingT1 DumpOutputHcus:]");
      if (logLevel >= 3)
      {
        v38 = MEMORY[0x24BDACB70];
        v39 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
        }

        if (logLevel >= 3)
        {
          v40 = v38;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v367 = 136315138;
            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
            _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: blendConfigV3Hcu: blendCurve[kASEBlendCurveEbeFactor]:\n", v367, 0xCu);
          }

        }
      }
      -[ASEProcessingT1 DumpPiecewiseLinearCurveV3:curve:](v23, "DumpPiecewiseLinearCurveV3:curve:", buf, v364);
      if (logLevel >= 3)
      {
        v41 = MEMORY[0x24BDACB70];
        v42 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: blendConfigV3Hcu: blendCurve[kASEBlendCurveW_EBE]:\n", v367, 0xCu);
        }

      }
      -[ASEProcessingT1 DumpPiecewiseLinearCurveV3:curve:](v23, "DumpPiecewiseLinearCurveV3:curve:", buf, v364 + 96);
      if (logLevel >= 3)
      {
        v43 = MEMORY[0x24BDACB70];
        v44 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: blendConfigV3Hcu: blendCurve[kASEBlendCurveW_Peaking]:\n", v367, 0xCu);
        }

      }
      -[ASEProcessingT1 DumpPiecewiseLinearCurveV3:curve:](v23, "DumpPiecewiseLinearCurveV3:curve:", buf, v364 + 192);
      if (logLevel >= 3)
      {
        v45 = MEMORY[0x24BDACB70];
        v46 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: blendConfigV3Hcu: blendCurve[kASEBlendCurveLuma]:\n", v367, 0xCu);
        }

      }
      -[ASEProcessingT1 DumpPiecewiseLinearCurveV3:curve:](v23, "DumpPiecewiseLinearCurveV3:curve:", buf, v364 + 288);
      if (logLevel >= 3)
      {
        v47 = MEMORY[0x24BDACB70];
        v48 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v49 = *((_DWORD *)v364 + 384);
          v50 = *((_DWORD *)v364 + 385);
          v51 = *((_DWORD *)v364 + 386);
          v52 = *((_DWORD *)v364 + 387);
          *(_DWORD *)v367 = 136316162;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          v369 = 1024;
          *(_DWORD *)v370 = v49;
          *(_WORD *)&v370[4] = 1024;
          *(_DWORD *)&v370[6] = v50;
          *(_WORD *)v371 = 1024;
          *(_DWORD *)&v371[2] = v51;
          *(_WORD *)&v371[6] = 1024;
          *(_DWORD *)&v371[8] = v52;
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: blendConfigV3Hcu: BlendLogicSkinToneProtection: toneThresh = %u, toneEdgeThresh = %u, toneMaxThresh = %d, toneFactor = %d\n", v367, 0x24u);
        }

      }
    }
    if (v365)
    {
      snprintf((char *)buf, 0x100uLL, "    %s: ebeConfigV3Hcu:", "-[ASEProcessingT1 DumpOutputHcus:]");
      if (logLevel >= 3)
      {
        v53 = MEMORY[0x24BDACB70];
        v54 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
        }

        if (logLevel >= 3)
        {
          v55 = v53;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v367 = 136315138;
            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
            _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ebeConfigV3Hcu: EBECurve[kASEEBECurveEbeV3]:\n", v367, 0xCu);
          }

        }
      }
      -[ASEProcessingT1 DumpPiecewiseLinearCurveV3:curve:](v23, "DumpPiecewiseLinearCurveV3:curve:", buf, v365);
      if (logLevel >= 3)
      {
        v56 = MEMORY[0x24BDACB70];
        v57 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ebeConfigV3Hcu: EBECurve[kASEEBECurveHf1PosV3]:\n", v367, 0xCu);
        }

      }
      -[ASEProcessingT1 DumpPiecewiseLinearCurveV3:curve:](v23, "DumpPiecewiseLinearCurveV3:curve:", buf, v365 + 96);
      if (logLevel >= 3)
      {
        v58 = MEMORY[0x24BDACB70];
        v59 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ebeConfigV3Hcu: EBECurve[kASEEBECurveHf1NegV3]:\n", v367, 0xCu);
        }

      }
      -[ASEProcessingT1 DumpPiecewiseLinearCurveV3:curve:](v23, "DumpPiecewiseLinearCurveV3:curve:", buf, v365 + 192);
      if (logLevel >= 3)
      {
        v60 = MEMORY[0x24BDACB70];
        v61 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ebeConfigV3Hcu: EBECurve[kASEEBECurveHf2V3]:\n", v367, 0xCu);
        }

      }
      -[ASEProcessingT1 DumpPiecewiseLinearCurveV3:curve:](v23, "DumpPiecewiseLinearCurveV3:curve:", buf, v365 + 288);
      if (logLevel >= 3)
      {
        v62 = MEMORY[0x24BDACB70];
        v63 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ebeConfigV3Hcu: EBECurve[kASEEBECurveHf3V3]:\n", v367, 0xCu);
        }

      }
      -[ASEProcessingT1 DumpPiecewiseLinearCurveV3:curve:](v23, "DumpPiecewiseLinearCurveV3:curve:", buf, v365 + 384);
      if (logLevel >= 3)
      {
        v64 = MEMORY[0x24BDACB70];
        v65 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v66 = *((_DWORD *)v365 + 480);
          v67 = *((_DWORD *)v365 + 481);
          v68 = *((_DWORD *)v365 + 482);
          *(_DWORD *)v367 = 136315906;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          v369 = 1024;
          *(_DWORD *)v370 = v66;
          *(_WORD *)&v370[4] = 1024;
          *(_DWORD *)&v370[6] = v67;
          *(_WORD *)v371 = 1024;
          *(_DWORD *)&v371[2] = v68;
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: ebeConfigV3Hcu: ebeParams: { sdaPenalty1 = %d, sdaPenalty2 = %d, dFfactor = %d }\n", v367, 0x1Eu);
        }

      }
      snprintf((char *)buf, 0x100uLL, "    %s: ebeConfigV3Hcu: lowPass :", "-[ASEProcessingT1 DumpOutputHcus:]");
      -[ASEProcessingT1 DumpArray:array:count:](v23, "DumpArray:array:count:", buf, v365 + 483, 26);
      snprintf((char *)buf, 0x100uLL, "    %s: ebeConfigV3Hcu: weightLut :", "-[ASEProcessingT1 DumpOutputHcus:]");
      -[ASEProcessingT1 DumpArray:array:count:](v23, "DumpArray:array:count:", buf, v365 + 509, 18);
    }
    if (v366)
    {
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu:", "-[ASEProcessingT1 DumpOutputHcus:]");
      if (logLevel >= 3)
      {
        v69 = MEMORY[0x24BDACB70];
        v70 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
        }

        if (logLevel >= 3)
        {
          v71 = v69;
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            v72 = *v366;
            *(_DWORD *)v367 = 136315394;
            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
            v369 = 1024;
            *(float *)v370 = v72;
            _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: peakingConfigV3Hcu: gainForce = %d\n", v367, 0x12u);
          }

          if (logLevel >= 3)
          {
            v73 = v69;
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v367 = 136315138;
              v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
              _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: peakingConfigV3Hcu: coreGainCurve:\n", v367, 0xCu);
            }

          }
        }
      }
      -[ASEProcessingT1 DumpPiecewiseLinearCurveV3:curve:](v23, "DumpPiecewiseLinearCurveV3:curve:", buf, v366 + 1);
      if (logLevel >= 3)
      {
        v74 = MEMORY[0x24BDACB70];
        v75 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: peakingConfigV3Hcu: lowAdaptGainCurve:\n", v367, 0xCu);
        }

      }
      -[ASEProcessingT1 DumpPiecewiseLinearCurveV3:curve:](v23, "DumpPiecewiseLinearCurveV3:curve:", buf, v366 + 97);
      if (logLevel >= 3)
      {
        v76 = MEMORY[0x24BDACB70];
        v77 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v367 = 136315138;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: peakingConfigV3Hcu: mediumAdaptGainCurve:\n", v367, 0xCu);
        }

      }
      -[ASEProcessingT1 DumpPiecewiseLinearCurveV3:curve:](v23, "DumpPiecewiseLinearCurveV3:curve:", buf, v366 + 193);
      if (logLevel >= 3)
      {
        v78 = MEMORY[0x24BDACB70];
        v79 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          v80 = *((_DWORD *)v366 + 289);
          v81 = *((_DWORD *)v366 + 290);
          v82 = *((_DWORD *)v366 + 291);
          v83 = *((_DWORD *)v366 + 292);
          v84 = *((_DWORD *)v366 + 293);
          *(_DWORD *)v367 = 136316418;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          v369 = 1024;
          *(_DWORD *)v370 = v80;
          *(_WORD *)&v370[4] = 1024;
          *(_DWORD *)&v370[6] = v81;
          *(_WORD *)v371 = 1024;
          *(_DWORD *)&v371[2] = v82;
          *(_WORD *)&v371[6] = 1024;
          *(_DWORD *)&v371[8] = v83;
          *(_WORD *)&v371[12] = 1024;
          *(_DWORD *)&v371[14] = v84;
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: peakingConfigV3Hcu: peakingGain: adaptive = %u, gain5_3 = %u, gain7_5 = %u, gain11_9 = %u, gain13_11 = %u,\n", v367, 0x2Au);
        }

      }
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu: filt3 :", "-[ASEProcessingT1 DumpOutputHcus:]");
      -[ASEProcessingT1 DumpArray:array:count:](v23, "DumpArray:array:count:", buf, v366 + 294, 2);
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu: filt5 :", "-[ASEProcessingT1 DumpOutputHcus:]");
      -[ASEProcessingT1 DumpArray:array:count:](v23, "DumpArray:array:count:", buf, v366 + 296, 3);
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu: filt7 :", "-[ASEProcessingT1 DumpOutputHcus:]");
      -[ASEProcessingT1 DumpArray:array:count:](v23, "DumpArray:array:count:", buf, v366 + 299, 4);
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu: filt9 :", "-[ASEProcessingT1 DumpOutputHcus:]");
      -[ASEProcessingT1 DumpArray:array:count:](v23, "DumpArray:array:count:", buf, v366 + 303, 5);
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu: filt11 :", "-[ASEProcessingT1 DumpOutputHcus:]");
      -[ASEProcessingT1 DumpArray:array:count:](v23, "DumpArray:array:count:", buf, v366 + 308, 6);
      snprintf((char *)buf, 0x100uLL, "    %s: peakingConfigV3Hcu: filt13 :", "-[ASEProcessingT1 DumpOutputHcus:]");
      -[ASEProcessingT1 DumpArray:array:count:](v23, "DumpArray:array:count:", buf, v366 + 314, 7);
    }
    if (v362 && logLevel >= 3)
    {
      v85 = MEMORY[0x24BDACB70];
      v86 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v367 = 136315138;
        v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
      }

      if (logLevel >= 3)
      {
        v87 = v85;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          v88 = *v362;
          v89 = v362[1];
          *(_DWORD *)v367 = 136315650;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          v369 = 1024;
          *(_DWORD *)v370 = v88;
          *(_WORD *)&v370[4] = 1024;
          *(_DWORD *)&v370[6] = v89;
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: noiseMeterV3Hcu: NoiseMeter: NoiseMeterConfig: sizeX = %u, sizeY = %u\n", v367, 0x18u);
        }

        if (logLevel >= 3)
        {
          v90 = v85;
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            v91 = v362[2];
            v92 = v362[3];
            v93 = v362[4];
            *(_DWORD *)v367 = 136315906;
            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
            v369 = 1024;
            *(_DWORD *)v370 = v91;
            *(_WORD *)&v370[4] = 1024;
            *(_DWORD *)&v370[6] = v92;
            *(_WORD *)v371 = 1024;
            *(_DWORD *)&v371[2] = v93;
            _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: noiseMeterV3Hcu: NoiseMeter: NoiseMeterGainControl: lut0Gain = %u, lut1Gain = %u, lut2Gain = %u\n", v367, 0x1Eu);
          }

        }
      }
    }
  }
  if ((dumpOutputHcu & 1) == 0)
    goto LABEL_133;
  v94 = logLevel;
  if (v12 && logLevel >= 3)
  {
    v95 = MEMORY[0x24BDACB70];
    v96 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v367 = 136315138;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v97 = v95;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      v98 = v12[1];
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = 0x305009B90;
      *(_WORD *)&v370[8] = 2080;
      *(_QWORD *)v371 = "XXXXXXXX";
      *(_WORD *)&v371[8] = 2080;
      *(_QWORD *)&v371[10] = "XXXXXXXX";
      *(_WORD *)&v371[18] = 2080;
      *(_QWORD *)&v371[20] = "XXXXXXXX";
      *(_WORD *)&v371[28] = 1024;
      *(_DWORD *)&v371[30] = v98;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %s %s %s %08x\n", v367, 0x3Au);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v99 = v95;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      v100 = *v12 & 7;
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = 0x305009BB0;
      *(_WORD *)&v370[8] = 2080;
      *(_QWORD *)v371 = "XXXXXXXX";
      *(_WORD *)&v371[8] = 1024;
      *(_DWORD *)&v371[10] = v100;
      *(_WORD *)&v371[14] = 2080;
      *(_QWORD *)&v371[16] = "XXXXXXXX";
      *(_WORD *)&v371[24] = 2080;
      *(_QWORD *)&v371[26] = "XXXXXXXX";
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %s %08x %s %s\n", v367, 0x3Au);
    }

    v94 = logLevel;
  }
  if (v363 && v94 >= 3)
  {
    v101 = MEMORY[0x24BDACB70];
    v102 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v367 = 136315138;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v103 = v101;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      v104 = v363[3];
      v106 = *v363;
      v105 = v363[1];
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = 0x305009E00;
      *(_WORD *)&v370[8] = 2080;
      *(_QWORD *)v371 = "XXXXXXXX";
      *(_WORD *)&v371[8] = 1024;
      *(_DWORD *)&v371[10] = v105;
      *(_WORD *)&v371[14] = 1024;
      *(_DWORD *)&v371[16] = v104;
      *(_WORD *)&v371[20] = 1024;
      *(_DWORD *)&v371[22] = v106;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %s %08x %08x %08x\n", v367, 0x32u);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v107 = v101;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      v108 = v363[2];
      v110 = v363[4];
      v109 = v363[5];
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = 0x305009E10;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v108;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v109;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v110;
      *(_WORD *)&v371[16] = 2080;
      *(_QWORD *)&v371[18] = "XXXXXXXX";
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %s\n", v367, 0x32u);
    }

    v94 = logLevel;
  }
  if (v364 && v94 >= 3)
  {
    v111 = MEMORY[0x24BDACB70];
    v112 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v367 = 136315138;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v113 = 0x30500A040;
    v114 = v111;
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      v115 = *v364 & 0x7FF | ((v364[3] & 0x7FF) << 16);
      v116 = v364[6] & 0x7FF | ((v364[9] & 0x7FF) << 16);
      v117 = v364[12] & 0x7FF | ((v364[15] & 0x7FF) << 16);
      v118 = v364[18] & 0x7FF | ((v364[21] & 0x7FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = 0x30500A030;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v115;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v116;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v117;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v118;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v119 = v111;
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      v120 = v364[8];
      v121 = v364[11];
      v122 = (int)v364[2];
      v123 = (int)v364[5];
      v124 = v364[1] | (unsigned __int16)(v364[4] << 8) | (v364[7] << 16) | (v364[10] << 24);
      v125 = v364[13] | (unsigned __int16)(v364[16] << 8) | (v364[19] << 16) | (v364[22] << 24);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = 0x30500A040;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v124;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v125;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v122 & 0x1FF | ((v123 & 0x1FF) << 16);
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = (int)v120 & 0x1FF | (((int)v121 & 0x1FF) << 16);
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
      v113 = 0x30500A050;
    }

    if (logLevel < 3)
      goto LABEL_133;
    v126 = v111;
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      v127 = (int)v364[14] & 0x1FF | (((int)v364[17] & 0x1FF) << 16);
      v128 = (int)v364[20] & 0x1FF | (((int)v364[23] & 0x1FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v113;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v127;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v128;
      *(_WORD *)&v371[10] = 2080;
      *(_QWORD *)&v371[12] = "XXXXXXXX";
      *(_WORD *)&v371[20] = 2080;
      *(_QWORD *)&v371[22] = "XXXXXXXX";
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %s %s\n", v367, 0x36u);
    }

    v94 = logLevel;
  }
  if (v365 && v94 >= 3)
  {
    v129 = MEMORY[0x24BDACB70];
    v130 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v367 = 136315138;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v131 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v132 = v365[384] & 0xFFF | ((v365[387] & 0xFFF) << 16);
      v133 = v365[390] & 0xFFF | ((v365[393] & 0xFFF) << 16);
      v134 = v365[396] & 0xFFF | ((v365[399] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = 0x30500A100;
      *(_WORD *)&v370[8] = 2080;
      *(_QWORD *)v371 = "XXXXXXXX";
      *(_WORD *)&v371[8] = 1024;
      *(_DWORD *)&v371[10] = v132;
      *(_WORD *)&v371[14] = 1024;
      *(_DWORD *)&v371[16] = v133;
      *(_WORD *)&v371[20] = 1024;
      *(_DWORD *)&v371[22] = v134;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %s %08x %08x %08x\n", v367, 0x32u);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v135 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v136 = v365[402] & 0xFFF | ((v365[405] & 0xFFF) << 16);
      v137 = (unsigned __int16)*v365 | ((unsigned __int16)v365[3] << 16);
      v138 = (unsigned __int16)v365[6] | ((unsigned __int16)v365[9] << 16);
      v139 = (unsigned __int16)v365[12] | ((unsigned __int16)v365[15] << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      v140 = 0x30500A110;
      *(_QWORD *)v370 = 0x30500A110;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v136;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v137;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v138;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v139;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }
    else
    {
      v140 = 0x30500A100;
    }

    if (logLevel < 3)
      goto LABEL_133;
    v141 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v142 = (unsigned __int16)v365[18] | ((unsigned __int16)v365[21] << 16);
      v143 = (unsigned __int16)v365[24] | ((unsigned __int16)v365[27] << 16);
      v144 = (unsigned __int16)v365[30] | ((unsigned __int16)v365[33] << 16);
      v145 = (unsigned __int16)v365[36] | ((unsigned __int16)v365[39] << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v142;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v143;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v144;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v145;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v146 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v147 = (unsigned __int16)v365[42] | ((unsigned __int16)v365[45] << 16);
      v148 = v365[2] & 0x3FF | ((v365[5] & 0x3FF) << 16);
      v149 = v365[8] & 0x3FF | ((v365[11] & 0x3FF) << 16);
      v150 = v365[14] & 0x3FF | ((v365[17] & 0x3FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v147;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v148;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v149;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v150;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v151 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v152 = v365[20] & 0x3FF | ((v365[23] & 0x3FF) << 16);
      v153 = v365[26] & 0x3FF | ((v365[29] & 0x3FF) << 16);
      v154 = v365[32] & 0x3FF | ((v365[35] & 0x3FF) << 16);
      v155 = v365[38] & 0x3FF | ((v365[41] & 0x3FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v152;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v153;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v154;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v155;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v156 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v157 = v365[44] & 0x3FF | ((v365[47] & 0x3FF) << 16);
      v158 = v365[1] & 0x3FF | ((v365[4] & 0x3FF) << 16);
      v159 = v365[7] & 0x3FF | ((v365[10] & 0x3FF) << 16);
      v160 = v365[13] & 0x3FF | ((v365[16] & 0x3FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v157;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v158;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v159;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v160;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v161 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v162 = v365[19] & 0x3FF | ((v365[22] & 0x3FF) << 16);
      v163 = v365[25] & 0x3FF | ((v365[28] & 0x3FF) << 16);
      v164 = v365[31] & 0x3FF | ((v365[34] & 0x3FF) << 16);
      v165 = v365[37] & 0x3FF | ((v365[40] & 0x3FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v162;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v163;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v164;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v165;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v166 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v167 = v365[43] & 0x3FF | ((v365[46] & 0x3FF) << 16);
      v168 = (_DWORD)v365[509] & 0x1FF | (((_DWORD)v365[510] & 0x1FF) << 9) & 0xF803FFFF | (((_DWORD)v365[511] & 0x1FF) << 18);
      v169 = (_DWORD)v365[512] & 0x1FF | (((_DWORD)v365[513] & 0x1FF) << 9) & 0xF803FFFF | (((_DWORD)v365[514] & 0x1FF) << 18);
      v170 = (_DWORD)v365[515] & 0x1FF | (((_DWORD)v365[516] & 0x1FF) << 9) & 0xF803FFFF | (((_DWORD)v365[517] & 0x1FF) << 18);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v167;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v168;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v169;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v170;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v171 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v172 = (_DWORD)v365[518] & 0x1FF | (((_DWORD)v365[519] & 0x1FF) << 9) & 0xF803FFFF | (((_DWORD)v365[520] & 0x1FF) << 18);
      v173 = (_DWORD)v365[521] & 0x1FF | (((_DWORD)v365[522] & 0x1FF) << 9) & 0xF803FFFF | (((_DWORD)v365[523] & 0x1FF) << 18);
      v174 = (_DWORD)v365[524] & 0x1FF | (((_DWORD)v365[525] & 0x1FF) << 9) & 0xF803FFFF | (((_DWORD)v365[526] & 0x1FF) << 18);
      v175 = v365[288] & 0xFFF | ((v365[291] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v172;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v173;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v174;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v175;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v176 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v177 = v365[294] & 0xFFF | ((v365[297] & 0xFFF) << 16);
      v178 = v365[300] & 0xFFF | ((v365[303] & 0xFFF) << 16);
      v179 = v365[306] & 0xFFF | ((v365[309] & 0xFFF) << 16);
      v180 = (int)v365[290] & 0x7FF | (((int)v365[293] & 0x7FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v177;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v178;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v179;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v180;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v181 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v182 = (int)v365[296] & 0x7FF | (((int)v365[299] & 0x7FF) << 16);
      v183 = (int)v365[302] & 0x7FF | (((int)v365[305] & 0x7FF) << 16);
      v184 = (int)v365[308] & 0x7FF | (((int)v365[311] & 0x7FF) << 16);
      v185 = v365[289] & 0xFFF | ((v365[292] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v182;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v183;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v184;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v185;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v186 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v187 = v365[295] & 0xFFF | ((v365[298] & 0xFFF) << 16);
      v188 = v365[301] & 0xFFF | ((v365[304] & 0xFFF) << 16);
      v189 = v365[307] & 0xFFF | ((v365[310] & 0xFFF) << 16);
      v190 = v365[96] & 0xFFF | ((v365[99] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v187;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v188;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v189;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v190;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v191 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v192 = v365[102] & 0xFFF | ((v365[105] & 0xFFF) << 16);
      v193 = v365[108] & 0xFFF | ((v365[111] & 0xFFF) << 16);
      v194 = v365[114] & 0xFFF | ((v365[117] & 0xFFF) << 16);
      v195 = (int)v365[98] & 0x7FF | (((int)v365[101] & 0x7FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v192;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v193;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v194;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v195;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v196 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v197 = (int)v365[104] & 0x7FF | (((int)v365[107] & 0x7FF) << 16);
      v198 = (int)v365[110] & 0x7FF | (((int)v365[113] & 0x7FF) << 16);
      v199 = (int)v365[116] & 0x7FF | (((int)v365[119] & 0x7FF) << 16);
      v200 = v365[97] & 0xFFF | ((v365[100] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v197;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v198;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v199;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v200;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v201 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v202 = v365[103] & 0xFFF | ((v365[106] & 0xFFF) << 16);
      v203 = v365[109] & 0xFFF | ((v365[112] & 0xFFF) << 16);
      v204 = v365[115] & 0xFFF | ((v365[118] & 0xFFF) << 16);
      v205 = v365[192] & 0xFFF | ((v365[195] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v202;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v203;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v204;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v205;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v206 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v207 = v365[198] & 0xFFF | ((v365[201] & 0xFFF) << 16);
      v208 = v365[204] & 0xFFF | ((v365[207] & 0xFFF) << 16);
      v209 = v365[210] & 0xFFF | ((v365[213] & 0xFFF) << 16);
      v210 = (int)v365[194] & 0x7FF | (((int)v365[197] & 0x7FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v207;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v208;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v209;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v210;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v211 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v212 = (int)v365[200] & 0x7FF | (((int)v365[203] & 0x7FF) << 16);
      v213 = (int)v365[206] & 0x7FF | (((int)v365[209] & 0x7FF) << 16);
      v214 = (int)v365[212] & 0x7FF | (((int)v365[215] & 0x7FF) << 16);
      v215 = v365[193] & 0xFFF | ((v365[196] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v212;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v213;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v214;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v215;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v216 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v217 = v365[199] & 0xFFF | ((v365[202] & 0xFFF) << 16);
      v218 = v365[205] & 0xFFF | ((v365[208] & 0xFFF) << 16);
      v219 = v365[211] & 0xFFF | ((v365[214] & 0xFFF) << 16);
      v220 = (_DWORD)v365[480] & 0x3F | (((_WORD)v365[481] & 0x3F) << 6) & 0xFFF | (((_DWORD)v365[482] & 0x3F) << 12);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v217;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v218;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v219;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v220;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v221 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v222 = (_DWORD)v365[483] & 0xFFF | (((_DWORD)v365[484] & 0xFFF) << 16);
      v223 = (_DWORD)v365[485] & 0xFFF | (((_DWORD)v365[486] & 0xFFF) << 16);
      v224 = (_DWORD)v365[487] & 0xFFF | (((_DWORD)v365[488] & 0xFFF) << 16);
      v225 = (_DWORD)v365[489] & 0xFFF | (((_DWORD)v365[490] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v222;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v223;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v224;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v225;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v226 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v227 = (_DWORD)v365[491] & 0xFFF | (((_DWORD)v365[492] & 0xFFF) << 16);
      v228 = (_DWORD)v365[493] & 0xFFF | (((_DWORD)v365[494] & 0xFFF) << 16);
      v229 = (_DWORD)v365[495] & 0xFFF | (((_DWORD)v365[496] & 0xFFF) << 16);
      v230 = (_DWORD)v365[497] & 0xFFF | (((_DWORD)v365[498] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v227;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v228;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v229;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v230;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v231 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v232 = (_DWORD)v365[499] & 0xFFF | (((_DWORD)v365[500] & 0xFFF) << 16);
      v233 = (_DWORD)v365[501] & 0xFFF | (((_DWORD)v365[502] & 0xFFF) << 16);
      v234 = (_DWORD)v365[503] & 0xFFF | (((_DWORD)v365[504] & 0xFFF) << 16);
      v235 = (_DWORD)v365[505] & 0xFFF | (((_DWORD)v365[506] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v232;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v233;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v234;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v235;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v236 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v237 = (_DWORD)v365[507] & 0xFFF | (((_DWORD)v365[508] & 0xFFF) << 16);
      v238 = (int)v365[386] & 0x7FF | (((int)v365[389] & 0x7FF) << 16);
      v239 = (int)v365[392] & 0x7FF | (((int)v365[395] & 0x7FF) << 16);
      v240 = (int)v365[398] & 0x7FF | (((int)v365[401] & 0x7FF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v237;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v238;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v239;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v240;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v241 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v140 += 16;
      v242 = (int)v365[404] & 0x7FF | (((int)v365[407] & 0x7FF) << 16);
      v243 = v365[385] & 0xFFF | ((v365[388] & 0xFFF) << 16);
      v244 = v365[391] & 0xFFF | ((v365[394] & 0xFFF) << 16);
      v245 = v365[397] & 0xFFF | ((v365[400] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v242;
      *(_WORD *)&v371[4] = 1024;
      *(_DWORD *)&v371[6] = v243;
      *(_WORD *)&v371[10] = 1024;
      *(_DWORD *)&v371[12] = v244;
      *(_WORD *)&v371[16] = 1024;
      *(_DWORD *)&v371[18] = v245;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
    }

    if (logLevel < 3)
      goto LABEL_133;
    v246 = v129;
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      v247 = v365[403] & 0xFFF | ((v365[406] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = v140 + 16;
      *(_WORD *)&v370[8] = 1024;
      *(_DWORD *)v371 = v247;
      *(_WORD *)&v371[4] = 2080;
      *(_QWORD *)&v371[6] = "XXXXXXXX";
      *(_WORD *)&v371[14] = 2080;
      *(_QWORD *)&v371[16] = "XXXXXXXX";
      *(_WORD *)&v371[24] = 2080;
      *(_QWORD *)&v371[26] = "XXXXXXXX";
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %s %s %s\n", v367, 0x3Au);
    }

    v94 = logLevel;
    v21 = v364;
  }
  if (!v366 || v94 < 3)
  {
LABEL_293:
    if (v21 && v94 >= 3)
    {
      v312 = MEMORY[0x24BDACB70];
      v313 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v367 = 136315138;
        v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
      }

      if (logLevel >= 3)
      {
        v314 = v312;
        if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
        {
          v315 = v21[96] & 0x7FF | ((v21[99] & 0x7FF) << 16);
          v316 = v21[102] & 0x7FF | ((v21[105] & 0x7FF) << 16);
          v317 = v21[108] & 0x7FF | ((v21[111] & 0x7FF) << 16);
          v318 = v21[114] & 0x7FF | ((v21[117] & 0x7FF) << 16);
          *(_DWORD *)v367 = 136316418;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          v369 = 2048;
          *(_QWORD *)v370 = 0x30500A4B0;
          *(_WORD *)&v370[8] = 1024;
          *(_DWORD *)v371 = v315;
          *(_WORD *)&v371[4] = 1024;
          *(_DWORD *)&v371[6] = v316;
          *(_WORD *)&v371[10] = 1024;
          *(_DWORD *)&v371[12] = v317;
          *(_WORD *)&v371[16] = 1024;
          *(_DWORD *)&v371[18] = v318;
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
        }

        if (logLevel >= 3)
        {
          v319 = v312;
          if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
          {
            v320 = v21[97] & 0x7FF | ((v21[100] & 0x7FF) << 16);
            v321 = v21[103] & 0x7FF | ((v21[106] & 0x7FF) << 16);
            v322 = v21[109] & 0x7FF | ((v21[112] & 0x7FF) << 16);
            v323 = v21[115] & 0x7FF | ((v21[118] & 0x7FF) << 16);
            *(_DWORD *)v367 = 136316418;
            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
            v369 = 2048;
            v324 = 0x30500A4C0;
            *(_QWORD *)v370 = 0x30500A4C0;
            *(_WORD *)&v370[8] = 1024;
            *(_DWORD *)v371 = v320;
            *(_WORD *)&v371[4] = 1024;
            *(_DWORD *)&v371[6] = v321;
            *(_WORD *)&v371[10] = 1024;
            *(_DWORD *)&v371[12] = v322;
            *(_WORD *)&v371[16] = 1024;
            *(_DWORD *)&v371[18] = v323;
            _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
          }
          else
          {
            v324 = 0x30500A4B0;
          }

          if (logLevel >= 3)
          {
            v325 = v312;
            if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
            {
              v324 += 16;
              v326 = (int)v21[98] & 0x7FFF | (((int)v21[101] & 0x7FFF) << 16);
              v327 = (int)v21[104] & 0x7FFF | (((int)v21[107] & 0x7FFF) << 16);
              v328 = (int)v21[110] & 0x7FFF | (((int)v21[113] & 0x7FFF) << 16);
              v329 = (int)v21[116] & 0x7FFF | (((int)v21[119] & 0x7FFF) << 16);
              *(_DWORD *)v367 = 136316418;
              v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
              v369 = 2048;
              *(_QWORD *)v370 = v324;
              *(_WORD *)&v370[8] = 1024;
              *(_DWORD *)v371 = v326;
              *(_WORD *)&v371[4] = 1024;
              *(_DWORD *)&v371[6] = v327;
              *(_WORD *)&v371[10] = 1024;
              *(_DWORD *)&v371[12] = v328;
              *(_WORD *)&v371[16] = 1024;
              *(_DWORD *)&v371[18] = v329;
              _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
            }

            if (logLevel >= 3)
            {
              v330 = v312;
              if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
              {
                v324 += 16;
                v331 = v21[192] & 0x7FF | ((v21[195] & 0x7FF) << 16);
                v332 = v21[198] & 0x7FF | ((v21[201] & 0x7FF) << 16);
                v333 = v21[204] & 0x7FF | ((v21[207] & 0x7FF) << 16);
                v334 = v21[210] & 0x7FF | ((v21[213] & 0x7FF) << 16);
                *(_DWORD *)v367 = 136316418;
                v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                v369 = 2048;
                *(_QWORD *)v370 = v324;
                *(_WORD *)&v370[8] = 1024;
                *(_DWORD *)v371 = v331;
                *(_WORD *)&v371[4] = 1024;
                *(_DWORD *)&v371[6] = v332;
                *(_WORD *)&v371[10] = 1024;
                *(_DWORD *)&v371[12] = v333;
                *(_WORD *)&v371[16] = 1024;
                *(_DWORD *)&v371[18] = v334;
                _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
              }

              if (logLevel >= 3)
              {
                v335 = v312;
                if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                {
                  v324 += 16;
                  v336 = v21[193] & 0x7FF | ((v21[196] & 0x7FF) << 16);
                  v337 = v21[199] & 0x7FF | ((v21[202] & 0x7FF) << 16);
                  v338 = v21[205] & 0x7FF | ((v21[208] & 0x7FF) << 16);
                  v339 = v21[211] & 0x7FF | ((v21[214] & 0x7FF) << 16);
                  *(_DWORD *)v367 = 136316418;
                  v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                  v369 = 2048;
                  *(_QWORD *)v370 = v324;
                  *(_WORD *)&v370[8] = 1024;
                  *(_DWORD *)v371 = v336;
                  *(_WORD *)&v371[4] = 1024;
                  *(_DWORD *)&v371[6] = v337;
                  *(_WORD *)&v371[10] = 1024;
                  *(_DWORD *)&v371[12] = v338;
                  *(_WORD *)&v371[16] = 1024;
                  *(_DWORD *)&v371[18] = v339;
                  _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                }

                if (logLevel >= 3)
                {
                  v340 = v312;
                  if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                  {
                    v324 += 16;
                    v341 = (int)v21[194] & 0x7FFF | (((int)v21[197] & 0x7FFF) << 16);
                    v342 = (int)v21[200] & 0x7FFF | (((int)v21[203] & 0x7FFF) << 16);
                    v343 = (int)v21[206] & 0x7FFF | (((int)v21[209] & 0x7FFF) << 16);
                    v344 = (int)v21[212] & 0x7FFF | (((int)v21[215] & 0x7FFF) << 16);
                    *(_DWORD *)v367 = 136316418;
                    v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                    v369 = 2048;
                    *(_QWORD *)v370 = v324;
                    *(_WORD *)&v370[8] = 1024;
                    *(_DWORD *)v371 = v341;
                    *(_WORD *)&v371[4] = 1024;
                    *(_DWORD *)&v371[6] = v342;
                    *(_WORD *)&v371[10] = 1024;
                    *(_DWORD *)&v371[12] = v343;
                    *(_WORD *)&v371[16] = 1024;
                    *(_DWORD *)&v371[18] = v344;
                    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                  }

                  if (logLevel >= 3)
                  {
                    v345 = v312;
                    if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                    {
                      v324 += 16;
                      v346 = v364[289] & 0x7FF | ((v364[292] & 0x7FF) << 16);
                      v347 = v364[295] & 0x7FF | ((v364[298] & 0x7FF) << 16);
                      v348 = v364[301] & 0x7FF | ((v364[304] & 0x7FF) << 16);
                      v349 = v364[307] & 0x7FF | ((v364[310] & 0x7FF) << 16);
                      *(_DWORD *)v367 = 136316418;
                      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                      v369 = 2048;
                      *(_QWORD *)v370 = v324;
                      *(_WORD *)&v370[8] = 1024;
                      *(_DWORD *)v371 = v346;
                      *(_WORD *)&v371[4] = 1024;
                      *(_DWORD *)&v371[6] = v347;
                      *(_WORD *)&v371[10] = 1024;
                      *(_DWORD *)&v371[12] = v348;
                      *(_WORD *)&v371[16] = 1024;
                      *(_DWORD *)&v371[18] = v349;
                      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                    }

                    if (logLevel >= 3)
                    {
                      v350 = v312;
                      if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                      {
                        v324 += 16;
                        v351 = v364[288] & 0xFFF | ((v364[291] & 0xFFF) << 16);
                        v352 = v364[294] & 0xFFF | ((v364[297] & 0xFFF) << 16);
                        v353 = v364[300] & 0xFFF | ((v364[303] & 0xFFF) << 16);
                        v354 = v364[306] & 0xFFF | ((v364[309] & 0xFFF) << 16);
                        *(_DWORD *)v367 = 136316418;
                        v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                        v369 = 2048;
                        *(_QWORD *)v370 = v324;
                        *(_WORD *)&v370[8] = 1024;
                        *(_DWORD *)v371 = v351;
                        *(_WORD *)&v371[4] = 1024;
                        *(_DWORD *)&v371[6] = v352;
                        *(_WORD *)&v371[10] = 1024;
                        *(_DWORD *)&v371[12] = v353;
                        *(_WORD *)&v371[16] = 1024;
                        *(_DWORD *)&v371[18] = v354;
                        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                      }

                      if (logLevel >= 3)
                      {
                        v355 = v312;
                        if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                        {
                          v324 += 16;
                          v356 = (int)v364[290] & 0x7FF | (((int)v364[293] & 0x7FF) << 16);
                          v357 = (int)v364[296] & 0x7FF | (((int)v364[299] & 0x7FF) << 16);
                          v358 = (int)v364[302] & 0x7FF | (((int)v364[305] & 0x7FF) << 16);
                          v359 = (int)v364[308] & 0x7FF | (((int)v364[311] & 0x7FF) << 16);
                          *(_DWORD *)v367 = 136316418;
                          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                          v369 = 2048;
                          *(_QWORD *)v370 = v324;
                          *(_WORD *)&v370[8] = 1024;
                          *(_DWORD *)v371 = v356;
                          *(_WORD *)&v371[4] = 1024;
                          *(_DWORD *)&v371[6] = v357;
                          *(_WORD *)&v371[10] = 1024;
                          *(_DWORD *)&v371[12] = v358;
                          *(_WORD *)&v371[16] = 1024;
                          *(_DWORD *)&v371[18] = v359;
                          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                        }

                        if (logLevel >= 3)
                        {
                          v360 = v312;
                          if (os_log_type_enabled(v312, OS_LOG_TYPE_DEFAULT))
                          {
                            v361 = (_DWORD)v364[384] & 0x3F | (((_DWORD)v364[385] & 0x7FF) << 6) & 0x8001FFFF | (((_DWORD)v364[386] & 0x3F) << 17) & 0x807FFFFF | (*((_DWORD *)v364 + 387) << 23);
                            *(_DWORD *)v367 = 136316418;
                            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                            v369 = 2048;
                            *(_QWORD *)v370 = v324 + 16;
                            *(_WORD *)&v370[8] = 2080;
                            *(_QWORD *)v371 = "XXXXXXXX";
                            *(_WORD *)&v371[8] = 1024;
                            *(_DWORD *)&v371[10] = v361;
                            *(_WORD *)&v371[14] = 2080;
                            *(_QWORD *)&v371[16] = "XXXXXXXX";
                            *(_WORD *)&v371[24] = 2080;
                            *(_QWORD *)&v371[26] = "XXXXXXXX";
                            _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %s %08x %s %s\n", v367, 0x3Au);
                          }

                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_133;
  }
  v248 = MEMORY[0x24BDACB70];
  v249 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v367 = 136315138;
    v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: -----------------------------------------------\n", v367, 0xCu);
  }

  if (logLevel >= 3)
  {
    v250 = v248;
    if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
    {
      v251 = v366[1] & 0xFFF | ((v366[4] & 0xFFF) << 16);
      v252 = v366[7] & 0xFFF | ((v366[10] & 0xFFF) << 16);
      v253 = v366[13] & 0xFFF | ((v366[16] & 0xFFF) << 16);
      *(_DWORD *)v367 = 136316418;
      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
      v369 = 2048;
      *(_QWORD *)v370 = 0x30500A280;
      *(_WORD *)&v370[8] = 2080;
      *(_QWORD *)v371 = "XXXXXXXX";
      *(_WORD *)&v371[8] = 1024;
      *(_DWORD *)&v371[10] = v251;
      *(_WORD *)&v371[14] = 1024;
      *(_DWORD *)&v371[16] = v252;
      *(_WORD *)&v371[20] = 1024;
      *(_DWORD *)&v371[22] = v253;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %s %08x %08x %08x\n", v367, 0x32u);
    }

    if (logLevel >= 3)
    {
      v254 = v248;
      if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
      {
        v255 = v366[19] & 0xFFF | ((v366[22] & 0xFFF) << 16);
        v256 = v366[2] & 0xFFF | ((v366[5] & 0xFFF) << 16);
        v257 = v366[8] & 0xFFF | ((v366[11] & 0xFFF) << 16);
        v258 = v366[14] & 0xFFF | ((v366[17] & 0xFFF) << 16);
        *(_DWORD *)v367 = 136316418;
        v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
        v369 = 2048;
        v259 = 0x30500A290;
        *(_QWORD *)v370 = 0x30500A290;
        *(_WORD *)&v370[8] = 1024;
        *(_DWORD *)v371 = v255;
        *(_WORD *)&v371[4] = 1024;
        *(_DWORD *)&v371[6] = v256;
        *(_WORD *)&v371[10] = 1024;
        *(_DWORD *)&v371[12] = v257;
        *(_WORD *)&v371[16] = 1024;
        *(_DWORD *)&v371[18] = v258;
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
      }
      else
      {
        v259 = 0x30500A280;
      }

      if (logLevel >= 3)
      {
        v260 = v248;
        if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
        {
          v259 += 16;
          v261 = v366[20] & 0xFFF | ((v366[23] & 0xFFF) << 16);
          v262 = v366[3] & 0x3FF | ((v366[6] & 0x3FF) << 16);
          v263 = v366[9] & 0x3FF | ((v366[12] & 0x3FF) << 16);
          v264 = v366[15] & 0x3FF | ((v366[18] & 0x3FF) << 16);
          *(_DWORD *)v367 = 136316418;
          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
          v369 = 2048;
          *(_QWORD *)v370 = v259;
          *(_WORD *)&v370[8] = 1024;
          *(_DWORD *)v371 = v261;
          *(_WORD *)&v371[4] = 1024;
          *(_DWORD *)&v371[6] = v262;
          *(_WORD *)&v371[10] = 1024;
          *(_DWORD *)&v371[12] = v263;
          *(_WORD *)&v371[16] = 1024;
          *(_DWORD *)&v371[18] = v264;
          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
        }

        if (logLevel >= 3)
        {
          v265 = v248;
          if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
          {
            v259 += 16;
            v266 = v366[21] & 0x3FF | ((v366[24] & 0x3FF) << 16);
            v267 = v366[97] & 0x7FF | ((v366[100] & 0x7FF) << 16);
            v268 = v366[103] & 0x7FF | ((v366[106] & 0x7FF) << 16);
            v269 = v366[109] & 0x7FF | ((v366[112] & 0x7FF) << 16);
            *(_DWORD *)v367 = 136316418;
            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
            v369 = 2048;
            *(_QWORD *)v370 = v259;
            *(_WORD *)&v370[8] = 1024;
            *(_DWORD *)v371 = v266;
            *(_WORD *)&v371[4] = 1024;
            *(_DWORD *)&v371[6] = v267;
            *(_WORD *)&v371[10] = 1024;
            *(_DWORD *)&v371[12] = v268;
            *(_WORD *)&v371[16] = 1024;
            *(_DWORD *)&v371[18] = v269;
            _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
          }

          if (logLevel >= 3)
          {
            v270 = v248;
            if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
            {
              v259 += 16;
              v271 = v366[115] & 0x7FF | ((v366[118] & 0x7FF) << 16);
              v272 = v366[98] & 0x3F | ((v366[101] & 0x3F) << 8) & 0xC0C0FFFF | ((v366[104] & 0x3F) << 16) & 0xC0FFFFFF | ((v366[107] & 0x3F) << 24);
              v273 = v366[110] & 0x3F | ((v366[113] & 0x3F) << 8) & 0xC0C0FFFF | ((v366[116] & 0x3F) << 16) & 0xC0FFFFFF | ((v366[119] & 0x3F) << 24);
              v274 = (int)v366[99] & 0x1FFF | (((int)v366[102] & 0x1FFF) << 16);
              *(_DWORD *)v367 = 136316418;
              v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
              v369 = 2048;
              *(_QWORD *)v370 = v259;
              *(_WORD *)&v370[8] = 1024;
              *(_DWORD *)v371 = v271;
              *(_WORD *)&v371[4] = 1024;
              *(_DWORD *)&v371[6] = v272;
              *(_WORD *)&v371[10] = 1024;
              *(_DWORD *)&v371[12] = v273;
              *(_WORD *)&v371[16] = 1024;
              *(_DWORD *)&v371[18] = v274;
              _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
            }

            if (logLevel >= 3)
            {
              v275 = v248;
              if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
              {
                v259 += 16;
                v276 = (int)v366[105] & 0x1FFF | (((int)v366[108] & 0x1FFF) << 16);
                v277 = (int)v366[111] & 0x1FFF | (((int)v366[114] & 0x1FFF) << 16);
                v278 = (int)v366[117] & 0x1FFF | (((int)v366[120] & 0x1FFF) << 16);
                v279 = v366[193] & 0x7FF | ((v366[196] & 0x7FF) << 16);
                *(_DWORD *)v367 = 136316418;
                v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                v369 = 2048;
                *(_QWORD *)v370 = v259;
                *(_WORD *)&v370[8] = 1024;
                *(_DWORD *)v371 = v276;
                *(_WORD *)&v371[4] = 1024;
                *(_DWORD *)&v371[6] = v277;
                *(_WORD *)&v371[10] = 1024;
                *(_DWORD *)&v371[12] = v278;
                *(_WORD *)&v371[16] = 1024;
                *(_DWORD *)&v371[18] = v279;
                _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
              }

              if (logLevel >= 3)
              {
                v280 = v248;
                if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                {
                  v281 = v366[199] & 0x7FF | ((v366[202] & 0x7FF) << 16);
                  v282 = v366[205] & 0x7FF | ((v366[208] & 0x7FF) << 16);
                  v283 = v366[211] & 0x7FF | ((v366[214] & 0x7FF) << 16);
                  v259 += 16;
                  v284 = v366[194] & 0x3F | ((v366[197] & 0x3F) << 8) & 0xC0C0FFFF | ((v366[200] & 0x3F) << 16) & 0xC0FFFFFF | ((v366[203] & 0x3F) << 24);
                  *(_DWORD *)v367 = 136316418;
                  v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                  v369 = 2048;
                  *(_QWORD *)v370 = v259;
                  *(_WORD *)&v370[8] = 1024;
                  *(_DWORD *)v371 = v281;
                  *(_WORD *)&v371[4] = 1024;
                  *(_DWORD *)&v371[6] = v282;
                  *(_WORD *)&v371[10] = 1024;
                  *(_DWORD *)&v371[12] = v283;
                  *(_WORD *)&v371[16] = 1024;
                  *(_DWORD *)&v371[18] = v284;
                  _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                }

                if (logLevel >= 3)
                {
                  v285 = v248;
                  if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                  {
                    v259 += 16;
                    v286 = v366[206] & 0x3F | ((v366[209] & 0x3F) << 8) & 0xC0C0FFFF | ((v366[212] & 0x3F) << 16) & 0xC0FFFFFF | ((v366[215] & 0x3F) << 24);
                    v287 = (int)v366[195] & 0x1FFF | (((int)v366[198] & 0x1FFF) << 16);
                    v288 = (int)v366[201] & 0x1FFF | (((int)v366[204] & 0x1FFF) << 16);
                    v289 = (int)v366[207] & 0x1FFF | (((int)v366[210] & 0x1FFF) << 16);
                    *(_DWORD *)v367 = 136316418;
                    v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                    v369 = 2048;
                    *(_QWORD *)v370 = v259;
                    *(_WORD *)&v370[8] = 1024;
                    *(_DWORD *)v371 = v286;
                    *(_WORD *)&v371[4] = 1024;
                    *(_DWORD *)&v371[6] = v287;
                    *(_WORD *)&v371[10] = 1024;
                    *(_DWORD *)&v371[12] = v288;
                    *(_WORD *)&v371[16] = 1024;
                    *(_DWORD *)&v371[18] = v289;
                    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                  }

                  if (logLevel >= 3)
                  {
                    v290 = v248;
                    if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                    {
                      v259 += 16;
                      v291 = (int)v366[213] & 0x1FFF | (((int)v366[216] & 0x1FFF) << 16);
                      v292 = (_DWORD)v366[294] & 0x1FFF | (((_DWORD)v366[295] & 0x1FFF) << 16);
                      v293 = (_DWORD)v366[296] & 0x1FFF | (((_DWORD)v366[297] & 0x1FFF) << 16);
                      v294 = (_DWORD)v366[298] & 0x1FFF;
                      *(_DWORD *)v367 = 136316418;
                      v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                      v369 = 2048;
                      *(_QWORD *)v370 = v259;
                      *(_WORD *)&v370[8] = 1024;
                      *(_DWORD *)v371 = v291;
                      *(_WORD *)&v371[4] = 1024;
                      *(_DWORD *)&v371[6] = v292;
                      *(_WORD *)&v371[10] = 1024;
                      *(_DWORD *)&v371[12] = v293;
                      *(_WORD *)&v371[16] = 1024;
                      *(_DWORD *)&v371[18] = v294;
                      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                    }

                    if (logLevel >= 3)
                    {
                      v295 = v248;
                      if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                      {
                        v259 += 16;
                        v296 = (_DWORD)v366[299] & 0x1FFF | (((_DWORD)v366[300] & 0x1FFF) << 16);
                        v297 = (_DWORD)v366[301] & 0x1FFF | (((_DWORD)v366[302] & 0x1FFF) << 16);
                        v298 = (_DWORD)v366[303] & 0x1FFF | (((_DWORD)v366[304] & 0x1FFF) << 16);
                        v299 = (_DWORD)v366[305] & 0x1FFF | (((_DWORD)v366[306] & 0x1FFF) << 16);
                        *(_DWORD *)v367 = 136316418;
                        v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                        v369 = 2048;
                        *(_QWORD *)v370 = v259;
                        *(_WORD *)&v370[8] = 1024;
                        *(_DWORD *)v371 = v296;
                        *(_WORD *)&v371[4] = 1024;
                        *(_DWORD *)&v371[6] = v297;
                        *(_WORD *)&v371[10] = 1024;
                        *(_DWORD *)&v371[12] = v298;
                        *(_WORD *)&v371[16] = 1024;
                        *(_DWORD *)&v371[18] = v299;
                        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                      }

                      if (logLevel >= 3)
                      {
                        v300 = v248;
                        if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                        {
                          v259 += 16;
                          v301 = (_DWORD)v366[307] & 0x1FFF;
                          v302 = (_DWORD)v366[308] & 0x1FFF | (((_DWORD)v366[309] & 0x1FFF) << 16);
                          v303 = (_DWORD)v366[310] & 0x1FFF | (((_DWORD)v366[311] & 0x1FFF) << 16);
                          v304 = (_DWORD)v366[312] & 0x1FFF | (((_DWORD)v366[313] & 0x1FFF) << 16);
                          *(_DWORD *)v367 = 136316418;
                          v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                          v369 = 2048;
                          *(_QWORD *)v370 = v259;
                          *(_WORD *)&v370[8] = 1024;
                          *(_DWORD *)v371 = v301;
                          *(_WORD *)&v371[4] = 1024;
                          *(_DWORD *)&v371[6] = v302;
                          *(_WORD *)&v371[10] = 1024;
                          *(_DWORD *)&v371[12] = v303;
                          *(_WORD *)&v371[16] = 1024;
                          *(_DWORD *)&v371[18] = v304;
                          _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                        }

                        if (logLevel >= 3)
                        {
                          v305 = v248;
                          if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                          {
                            v259 += 16;
                            v306 = (_DWORD)v366[314] & 0x1FFF | (((_DWORD)v366[315] & 0x1FFF) << 16);
                            v307 = (_DWORD)v366[316] & 0x1FFF | (((_DWORD)v366[317] & 0x1FFF) << 16);
                            v308 = (_DWORD)v366[318] & 0x1FFF | (((_DWORD)v366[319] & 0x1FFF) << 16);
                            v309 = (_DWORD)v366[320] & 0x1FFF;
                            *(_DWORD *)v367 = 136316418;
                            v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                            v369 = 2048;
                            *(_QWORD *)v370 = v259;
                            *(_WORD *)&v370[8] = 1024;
                            *(_DWORD *)v371 = v306;
                            *(_WORD *)&v371[4] = 1024;
                            *(_DWORD *)&v371[6] = v307;
                            *(_WORD *)&v371[10] = 1024;
                            *(_DWORD *)&v371[12] = v308;
                            *(_WORD *)&v371[16] = 1024;
                            *(_DWORD *)&v371[18] = v309;
                            _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %08x %08x %08x\n", v367, 0x2Eu);
                          }

                          if (logLevel >= 3)
                          {
                            v310 = v248;
                            if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                            {
                              v311 = (_DWORD)v366[290] & 0x3F | (((_WORD)v366[291] & 0x3F) << 6) & 0xFFF | (((_DWORD)v366[292] & 0x3F) << 12) & 0xFC03FFFF | (((_DWORD)v366[293] & 0x3F) << 18) & 0xFCFFFFFF | (((_DWORD)v366[289] & 3) << 24) | (*(_DWORD *)v366 << 26);
                              *(_DWORD *)v367 = 136316418;
                              v368 = "-[ASEProcessingT1 DumpOutputHcus:]";
                              v369 = 2048;
                              *(_QWORD *)v370 = v259 + 16;
                              *(_WORD *)&v370[8] = 1024;
                              *(_DWORD *)v371 = v311;
                              *(_WORD *)&v371[4] = 2080;
                              *(_QWORD *)&v371[6] = "XXXXXXXX";
                              *(_WORD *)&v371[14] = 2080;
                              *(_QWORD *)&v371[16] = "XXXXXXXX";
                              *(_WORD *)&v371[24] = 2080;
                              *(_QWORD *)&v371[26] = "XXXXXXXX";
                              _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: %09llx:  %08x %s %s %s\n", v367, 0x3Au);
                            }

                            v94 = logLevel;
                            v21 = v364;
                            goto LABEL_293;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_133:

}

- (void)configControlHeader_V3:(hwConfigurationUnitsV3_t *)a3
{
  a3->var1 = (MSRHcuEntryHeader_t)0x1861736570;
  a3->var3 = (MSRHcuEntryHeader_t)0x5046173656BLL;
  a3->var5 = (MSRHcuEntryHeader_t)0x83C6173656CLL;
  a3->var7 = (MSRHcuEntryHeader_t)0x6106173656DLL;
  a3->var9 = (MSRHcuEntryHeader_t)0x86173656FLL;
  a3->var11 = (MSRHcuEntryHeader_t)0x146173656ELL;
}

- (void)processPixelWithInput:(id *)a3 controlUnitV3:(hwConfigurationUnitsV3_t *)a4
{
  unsigned int var0;
  unsigned int var1;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  unsigned int productType;
  int v13;
  const char *v14;
  __int16 v15;
  _BYTE v16[10];
  hwConfigurationUnitsV3_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[ASEProcessingT1 processPixelWithInput:controlUnitV3:]";
    v15 = 2048;
    *(_QWORD *)v16 = a3;
    *(_WORD *)&v16[8] = 2048;
    v17 = a4;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, aseControlUnit=%p\n", (uint8_t *)&v13, 0x20u);
  }
  if (!isT1OrNewer(self->super._productType))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    productType = self->super._productType;
    v13 = 136315394;
    v14 = "-[ASEProcessingT1 processPixelWithInput:controlUnitV3:]";
    v15 = 1024;
    *(_DWORD *)v16 = productType;
    v9 = MEMORY[0x24BDACB70];
    v10 = " [1.37.0]     %s : ERROR: Not supported, _productType = %d\n";
    v11 = 18;
    goto LABEL_10;
  }
  -[ASEProcessingT1 processPixelWithInput_V3:Output:](self, "processPixelWithInput_V3:Output:", a3, a4);
  if (logLevel < 3)
    return;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    var0 = a4->var0.var0;
    var1 = a4->var0.var1;
    v13 = 136315650;
    v14 = "-[ASEProcessingT1 processPixelWithInput:controlUnitV3:]";
    v15 = 1024;
    *(_DWORD *)v16 = var0;
    *(_WORD *)&v16[4] = 1024;
    *(_DWORD *)&v16[6] = var1;
    v9 = MEMORY[0x24BDACB70];
    v10 = " [1.37.0]     %s : aseControlUnit->hcuCount %d, aseControlUnit->hcuSize %d, \n";
    v11 = 24;
LABEL_10:
    _os_log_impl(&dword_206505000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v11);
  }
LABEL_11:
  if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[ASEProcessingT1 processPixelWithInput:controlUnitV3:]";
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s \n", (uint8_t *)&v13, 0xCu);
  }
}

- (void)processPixelWithInput_V3:(id *)a3 Output:(hwConfigurationUnitsV3_t *)a4
{
  unsigned int aseProcessingType;
  int v6;
  unsigned int enabledHcus;
  unsigned int v8;
  unsigned int v9;
  uint8_t v10[16];
  uint8_t buf[16];

  aseProcessingType = self->super._aseProcessingType;
  if (aseProcessingType > 7)
    goto LABEL_17;
  v6 = 1 << aseProcessingType;
  if ((v6 & 0xE6) != 0)
  {
    -[ASEProcessingT1 processPixelWithPixelControl_V3:](self, "processPixelWithPixelControl_V3:", a4);
    enabledHcus = self->_enabledHcus;
    if ((enabledHcus & 0x40) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"!(!!((_enabledHcus) & (1U << (ASEConfigurationUnitsV3_NoiseConfig))))\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 1395\n", buf, 2u);
      }
      enabledHcus = self->_enabledHcus;
      if ((enabledHcus & 0x40) != 0)
        -[ASEProcessingT1 processPixelWithInput_V3:Output:].cold.2();
    }
    v8 = enabledHcus & 0xFFFFFFBF;
    goto LABEL_14;
  }
  if ((v6 & 0x18) == 0)
LABEL_17:
    -[ASEProcessingT1 processPixelWithInput_V3:Output:].cold.1();
  -[ASEProcessingT1 processPixelWithMeasurement_V3:Output:](self, "processPixelWithMeasurement_V3:Output:", a3, a4);
  v9 = self->_enabledHcus;
  if ((v9 & 0x40) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"(!!((_enabledHcus) & (1U << (ASEConfigurationUnitsV3_NoiseConfig))))\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 1403\n", v10, 2u);
    }
    v9 = self->_enabledHcus;
    if ((v9 & 0x40) == 0)
      -[ASEProcessingT1 processPixelWithInput_V3:Output:].cold.3();
  }
  v8 = v9 | 0x40;
LABEL_14:
  self->_enabledHcus = v8;
}

- (id)populateOutputHcus:(hwConfigurationUnitsV3_t *)a3
{
  unsigned int v5;
  unsigned int v6;
  int *v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;
  BOOL v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  MSRHcuEntryHeader_t *p_var5;
  MSRHcuEntryHeader_t *p_var3;
  MSRHcuEntryHeader_t *p_var1;
  void *v21;
  MSRHcuEntryHeader_t *v22;
  uint64_t v23;
  unsigned int enabledHcus;
  MSRHcuEntryHeader_t *p_var11;
  MSRHcuEntryHeader_t *p_var7;
  MSRHcuEntryHeader_t *p_var9;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v5 = 0;
  v6 = 0;
  v37 = *MEMORY[0x24BDAC8D0];
  v7 = &dword_206519900;
  v8 = -1;
  do
  {
    v9 = v8 + 1;
    v10 = 1 << (v8 + 1);
    v11 = self->_enabledHcus & v10;
    v12 = hideHcu & v10;
    if (v11)
      v13 = v12 == 0;
    else
      v13 = 0;
    if (v13)
    {
      if (v8 > 5)
        v14 = 0;
      else
        v14 = *v7;
      ++v5;
      v6 += v14;
    }
    ++v7;
    v8 = v9;
  }
  while (v9 != 6);
  a3->var0.var0 = v5;
  a3->var0.var1 = v6;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v6 + 8 * v5 + 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "appendBytes:length:", a3, 8);
    v17 = 0;
    p_var11 = &a3->var11;
    p_var9 = &a3->var9;
    p_var7 = &a3->var7;
    p_var5 = &a3->var5;
    p_var3 = &a3->var3;
    p_var1 = &a3->var1;
    do
    {
      if ((self->_enabledHcus & (1 << v17)) != 0 && (hideHcu & (1 << v17)) == 0)
      {
        switch(v17)
        {
          case 1:
            v21 = v16;
            v22 = p_var1;
            v23 = 32;
            goto LABEL_22;
          case 2:
            v21 = v16;
            v22 = p_var3;
            v23 = 1292;
            goto LABEL_22;
          case 3:
            v21 = v16;
            v22 = p_var5;
            v23 = 2116;
            goto LABEL_22;
          case 4:
            v21 = v16;
            v22 = p_var7;
            v23 = 1560;
            goto LABEL_22;
          case 5:
            v21 = v16;
            v22 = p_var9;
            v23 = 16;
LABEL_22:
            objc_msgSend(v21, "appendBytes:length:", v22, v23);
            break;
          case 6:
            objc_msgSend(v16, "appendBytes:length:", p_var11, 28);
            goto LABEL_24;
          default:
            -[ASEProcessingT1 populateOutputHcus:].cold.1();
        }
      }
      ++v17;
    }
    while (v17 != 7);
LABEL_24:
    if (logLevel >= 3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      enabledHcus = self->_enabledHcus;
      *(_DWORD *)buf = 136315906;
      v30 = "-[ASEProcessingT1 populateOutputHcus:]";
      v31 = 1024;
      v32 = enabledHcus;
      v33 = 1024;
      v34 = hideHcu;
      v35 = 1024;
      v36 = hideHcu;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s: _enabledHcus = 0x%x, hideHcu = 0x%x (%d)\n", buf, 0x1Eu);
    }
    -[ASEProcessingT1 DumpOutputHcus:](self, "DumpOutputHcus:", v16);
  }
  return v16;
}

- (void)processPixelWithPixelControl_V3:(hwConfigurationUnitsV3_t *)a3
{
  double v5;
  double v6;
  double v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  hwConfigurationUnitsV3_t *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[ASEProcessingT1 processPixelWithPixelControl_V3:]";
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseControlUnit=%p\n", buf, 0x16u);
  }
  -[ASEProcessingT1 configControlHeader_V3:](self, "configControlHeader_V3:", a3);
  calculate_graphics_control_setting_V3((int8x8_t *)a3, self->super._inputWidth, self->super._inputHeight, v5, v6, v7, LODWORD(self->super._numberOfProcessedFrames), self->super._productType, self->super._destinationWidth, self->super._destinationHeight, (uint64_t)self->_aseControlUnitV3Cache, &self->_enabledHcus);
  if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[ASEProcessingT1 processPixelWithPixelControl_V3:]";
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s \n", buf, 0xCu);
  }
}

- (void)processPixelWithMeasurement_V3:(id *)a3 Output:(hwConfigurationUnitsV3_t *)a4
{
  unsigned int destinationWidth;
  unsigned int destinationHeight;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  _BYTE v12[10];
  hwConfigurationUnitsV3_t *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[ASEProcessingT1 processPixelWithMeasurement_V3:Output:]";
    v11 = 2048;
    *(_QWORD *)v12 = a3;
    *(_WORD *)&v12[8] = 2048;
    v13 = a4;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, aseControlUnit=%p\n", buf, 0x20u);
  }
  -[ASEProcessingT0 printAseMeasurementOutput:](self, "printAseMeasurementOutput:", a3);
  -[ASEProcessingT1 configControlHeader_V3:](self, "configControlHeader_V3:", a4);
  calculate_control_setting_V3((uint64_t)a3, (uint64_t)a4, self->super._inputWidth, self->super._inputHeight, LODWORD(self->super._numberOfProcessedFrames), (uint64_t)&self->super._noiseMeterStepSize, (uint64_t)&self->super._FD_state, (uint64_t)&self->super._FG_count, &self->super._NFG_count, &self->super._prev_H1_7, &self->super._prev_V1_7, &self->super._prev_ratio_2D_1D, self->super._productType, self->super._destinationWidth, self->super._destinationHeight, (uint64_t)self->_aseControlUnitV3Cache, &self->_enabledHcus);
  if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    destinationWidth = self->super._destinationWidth;
    destinationHeight = self->super._destinationHeight;
    *(_DWORD *)buf = 136315650;
    v10 = "-[ASEProcessingT1 processPixelWithMeasurement_V3:Output:]";
    v11 = 1024;
    *(_DWORD *)v12 = destinationWidth;
    *(_WORD *)&v12[4] = 1024;
    *(_DWORD *)&v12[6] = destinationHeight;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s : _destinationWidth =%d, _destinationHeight=%d\n", buf, 0x18u);
  }
}

- (int64_t)processFrameWithInput:(id *)a3 outputData:(id *)a4
{
  unsigned int v7;
  unsigned int aseProcessingType;
  char *v9;
  unsigned int inputWidth;
  unsigned int inputHeight;
  unsigned int destinationWidth;
  unsigned int destinationHeight;
  double enhancementStrength;
  unsigned int v15;
  double v16;
  unsigned int v17;
  unsigned int v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  int64_t v22;
  hwConfigurationUnitsV3_t *v23;
  unint64_t numberOfProcessedFrames;
  uint8_t v26[16];
  uint8_t buf[392];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = logLevel;
  if (logLevel >= 4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[ASEProcessingT1 processFrameWithInput:outputData:]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = a4;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : aseMeasurementOutput=%p, aseFrameProcessingControl=%p\n", buf, 0x20u);
    }
    v7 = logLevel;
  }
  if (v7 >= 2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      aseProcessingType = self->super._aseProcessingType;
      v9 = getASEProcessingType(aseProcessingType);
      inputWidth = self->super._inputWidth;
      inputHeight = self->super._inputHeight;
      destinationWidth = self->super._destinationWidth;
      destinationHeight = self->super._destinationHeight;
      enhancementStrength = self->super._enhancementStrength;
      *(_DWORD *)buf = 136316930;
      *(_QWORD *)&buf[4] = "-[ASEProcessingT1 processFrameWithInput:outputData:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = aseProcessingType;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v9;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = inputWidth;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = inputHeight;
      *(_WORD *)&buf[40] = 2048;
      *(double *)&buf[42] = enhancementStrength;
      *(_WORD *)&buf[50] = 1024;
      *(_DWORD *)&buf[52] = destinationWidth;
      *(_WORD *)&buf[56] = 1024;
      *(_DWORD *)&buf[58] = destinationHeight;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0]     %s : aseProcessingType=%d [%s], width=%d, height=%d, strength=%f, destinationWidth=%d, destinationHeight=%d\n", buf, 0x3Eu);
    }
    if (logLevel >= 2)
      +[ASEProcessing shouldEnhanceWidth:height:destinationWidth:destinationHeight:](ASEProcessing, "shouldEnhanceWidth:height:destinationWidth:destinationHeight:", self->super._inputWidth, self->super._inputHeight, self->super._destinationWidth, self->super._destinationHeight);
  }
  if (self->super._aseProcessingType - 9 <= 0xFFFFFFF7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"_aseProcessingType < kASEProcessingTypeLivePhoto || _aseProcessingType > kASEProcessingTypeEnhanceOnly\" failed in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 1569 goto EXIT\n", buf, 2u);
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v15 = self->super._aseProcessingType;
    v16 = self->super._enhancementStrength;
    v17 = self->super._inputWidth;
    v18 = self->super._inputHeight;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[ASEProcessingT1 processFrameWithInput:outputData:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v15;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = v16;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v17;
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = v18;
    v19 = MEMORY[0x24BDACB70];
    v20 = " [1.37.0] %s : unknownProcessingType=%d, strength=%f, wxh=%dx%d\n";
    v21 = 40;
    goto LABEL_15;
  }
  if (a4)
  {
    memset(&buf[4], 0, 376);
    *(_DWORD *)buf = 1;
    if (a3)
      memcpy(buf, a3, 0x17CuLL);
    if (!isT1OrNewer(self->super._productType))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"isT1OrNewer(_productType)\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 1584\n", v26, 2u);
      }
      if (!isT1OrNewer(self->super._productType))
        -[ASEProcessingT1 processFrameWithInput:outputData:].cold.1();
    }
    v23 = &self->_aseControlUnitV3[self->super._numberOfRequestedFrames & 3];
    bzero(v23, 0x13BCuLL);
    ++self->super._numberOfRequestedFrames;
    -[ASEProcessingT1 processPixelWithInput:controlUnitV3:](self, "processPixelWithInput:controlUnitV3:", buf, v23);
    -[ASEProcessingT1 populateOutputHcus:](self, "populateOutputHcus:", v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    ++self->super._numberOfProcessedFrames;
    v22 = -18000;
    goto LABEL_25;
  }
  if (logLevel < 3)
    return -18002;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[ASEProcessingT1 processFrameWithInput:outputData:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = 0;
    v19 = MEMORY[0x24BDACB70];
    v20 = " [1.37.0] %s : aseMeasurementOutput=%p, aseFrameProcessingControl=%p\n";
    v21 = 32;
LABEL_15:
    _os_log_impl(&dword_206505000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
  }
LABEL_16:
  v22 = -18002;
LABEL_25:
  if (logLevel >= 4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    numberOfProcessedFrames = self->super._numberOfProcessedFrames;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[ASEProcessingT1 processFrameWithInput:outputData:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = numberOfProcessedFrames;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v22;
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] --  %s : frame=%ld, retVal=%ld\n", buf, 0x20u);
  }
  return v22;
}

- (int64_t)processFrameWithInput:(id *)a3 callback:(id)a4
{
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ASEProcessingT1 processFrameWithInput:callback:]";
    _os_log_impl(&dword_206505000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [1.37.0] ++  %s : ERROR: Async API Not supported!\n", (uint8_t *)&v5, 0xCu);
  }
  return -18001;
}

- (void)initWithConfig:aseProcessing:productType:.cold.1()
{
  __assert_rtn("-[ASEProcessingT1 initWithConfig:aseProcessing:productType:]", "ASEProcessingT1.m", 88, "isT1OrNewer(_productType)");
}

- (void)processPixelWithInput_V3:Output:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    OUTLINED_FUNCTION_0(&dword_206505000, MEMORY[0x24BDACB70], v0, " [1.37.0] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 1408\n", v1, v2, v3, v4, 0);
  __assert_rtn("-[ASEProcessingT1 processPixelWithInput_V3:Output:]", "ASEProcessingT1.m", 1408, "0");
}

- (void)processPixelWithInput_V3:Output:.cold.2()
{
  __assert_rtn("-[ASEProcessingT1 processPixelWithInput_V3:Output:]", "ASEProcessingT1.m", 1395, "!(!!((_enabledHcus) & (1U << (ASEConfigurationUnitsV3_NoiseConfig))))");
}

- (void)processPixelWithInput_V3:Output:.cold.3()
{
  __assert_rtn("-[ASEProcessingT1 processPixelWithInput_V3:Output:]", "ASEProcessingT1.m", 1403, "(!!((_enabledHcus) & (1U << (ASEConfigurationUnitsV3_NoiseConfig))))");
}

- (void)populateOutputHcus:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    OUTLINED_FUNCTION_0(&dword_206505000, MEMORY[0x24BDACB70], v0, " [1.37.0] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingT1.m\" at line 1463\n", v1, v2, v3, v4, 0);
  __assert_rtn("-[ASEProcessingT1 populateOutputHcus:]", "ASEProcessingT1.m", 1463, "0");
}

- (void)processFrameWithInput:outputData:.cold.1()
{
  __assert_rtn("-[ASEProcessingT1 processFrameWithInput:outputData:]", "ASEProcessingT1.m", 1584, "isT1OrNewer(_productType)");
}

@end
