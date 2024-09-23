@implementation ISIconSegmentation

- (ISIconSegmentation)init
{
  ISIconSegmentation *v2;
  ISForegroundSegmentation *v3;
  ISForegroundSegmentation *strictForegroundSegmentation;
  ISForegroundSegmentation *v5;
  ISForegroundSegmentation *looseForegroundSegmentation;
  uint64_t v7;
  ISBiasedGrayscaleConversion *grayscaleConversion;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ISIconSegmentation;
  v2 = -[ISIconSegmentation init](&v10, sel_init);
  if (v2)
  {
    v3 = -[ISForegroundSegmentation initWithStrict:]([ISForegroundSegmentation alloc], "initWithStrict:", 1);
    strictForegroundSegmentation = v2->_strictForegroundSegmentation;
    v2->_strictForegroundSegmentation = v3;

    v5 = -[ISForegroundSegmentation initWithStrict:]([ISForegroundSegmentation alloc], "initWithStrict:", 0);
    looseForegroundSegmentation = v2->_looseForegroundSegmentation;
    v2->_looseForegroundSegmentation = v5;

    v7 = objc_opt_new();
    grayscaleConversion = v2->_grayscaleConversion;
    v2->_grayscaleConversion = (ISBiasedGrayscaleConversion *)v7;

    v2->_maxNumberOfClusteringSamples = 8000;
    *(_WORD *)&v2->_enableColorEnhancementInDarkImage = 0;
  }
  return v2;
}

- (BOOL)_computeImageWithWidth:(int)a3 height:(int)a4 strict:(BOOL)a5 ucharSamplesAndForegroundMask:ucharTintable:ucharDark:feedback:
{
  __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int8 *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  float32x4_t *v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  int *v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  int v39;
  int v40;
  uint64_t v41;
  unsigned __int8 *v42;
  int v43;
  int v44;
  uint64_t v45;
  unsigned __int8 *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE *v57;
  uint64_t v58;
  int v59;
  int v60;
  int v61;
  int v62;
  uint64_t v63;
  _BYTE *v64;
  uint64_t v65;
  int v66;
  int v67;
  uint64_t v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71;
  float32x4_t v72;
  uint64_t v73;
  float32x4_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int8 v84;
  int v85;
  __int8 *v86;
  int v87;
  int v88;
  uint64_t v89;
  __int8 *v90;
  uint64_t v91;
  __int8 *v92;
  uint64_t v93;
  float32x4_t v94;
  float32x4_t v95;
  __int32 v96;
  double v97;
  unsigned int i;
  signed int v99;
  unsigned int v100;
  unsigned int v101;
  int v102;
  double v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  unsigned int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  unsigned int v119;
  signed int v120;
  int v121;
  float32x4_t *v123;
  int v124;
  int v125;
  uint64_t v126;
  float v127;
  float v128;
  int v129;
  float32x4_t v130;
  double v131;
  int v132;
  int v133;
  __int8 *v134;
  int v135;
  float32x4_t *v136;
  float32x4_t v137;
  double v138;
  double v139;
  double v140;
  __n128 v141;
  __n128 v142;
  __n128 v143;
  float32x4_t v144;
  float32x4_t v145;
  __n128 v146;
  float32x4_t v147;
  double v148;
  double v149;
  double v150;
  __n128 v151;
  __n128 v152;
  __n128 v153;
  float32x4_t v154;
  float32x4_t v155;
  float32x4_t v156;
  float32x4_t v157;
  float32x4_t v158;
  float32x4_t v159;
  float32x4_t v160;
  float32x4_t v161;
  int32x2_t v162;
  double v163;
  double v164;
  unsigned int v165;
  id v166;
  const __CFString *v167;
  BOOL v168;
  float32x4_t *v169;
  uint64_t v171;
  float32x4_t v172;
  float32x4_t v173;
  float32x4_t v174;
  unsigned int v175;
  __int8 *v176;
  float32x4_t v177;
  float32x4_t *v178;
  float32x4_t *v179;
  __int8 *v180;
  uint64_t v181;
  int v182;
  float32x4_t v183;
  float32x4_t v184;
  float32x4_t v185;
  unint64_t v186;
  float32x4_t v187;
  unsigned __int8 *v188;
  uint64_t v189;
  unint64_t v190;
  unsigned __int8 *v191;
  float32x4_t v192;
  int8x16_t v193;
  int8x16_t v194;
  float32x4_t v195;
  int8x8_t v196;
  uint64_t v197;
  int v198;
  int v199;
  float32x4_t *v200;
  uint64_t v201;
  float32x4_t *v202;
  unsigned int v203;
  float32x4_t v204;
  unsigned int v205;
  unsigned int v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  __int8 *v210;
  unsigned int v211;
  unsigned int v212;
  __int8 *v213;
  __int8 *v214;
  float32x4_t v215;
  float32x4_t v216;
  float32x4_t v217;
  float32x4_t v218;
  uint8x8_t v219;
  int8x16_t v220;
  unint64_t v221;
  int v222;
  float32x4_t v223;
  float32x4_t v224;
  float32x4_t v225;
  __int8 *v226;
  float32x4_t *v227;
  uint64_t v228;
  float32x4_t v229;
  float32x4_t v230;
  int8x16_t v231;
  float32x4_t v232;
  float32x4_t v233;
  float32x4_t v234;
  int8x16_t v235;
  float32x4_t v236;
  float32x4_t v237;
  float32x4_t v238;
  int8x16_t v239;
  uint64_t v240;
  float v241;
  float32x4_t v242;
  float32x4_t v243;
  float32x4_t v244;
  float32x4_t v245;
  float v246;
  float32x4_t v247;
  uint64_t v248;
  __int32 v249;
  _BYTE *v250;
  _BYTE *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  __int32 *v255;
  uint64_t v256;
  uint64_t v257;
  int8x16_t v258;
  uint16x8_t v259;
  uint16x8_t v260;
  int8x16_t v261;
  uint16x8_t v262;
  float32x4_t v263;
  float32x4_t v264;
  int8x16_t v265;
  float32x4_t v266;
  int8x16_t v267;
  float32x4_t v268;
  float32x4_t v269;
  __int32 v270;
  float32x4_t v271;
  float32x4_t v272;
  float32x4_t v273;
  float32x4_t v274;
  float32x4_t v275;
  double v276;
  float32x4_t *v277;
  BOOL v278;
  float32x4_t v279;
  float32x4_t v280;
  __int8 *v281;
  float32x4_t v282;
  unint64_t v283;
  float32x4_t *v284;
  char v285;
  float32x4_t v286;
  double v287;
  int *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  int *v293;
  size_t v294;
  float32x4_t *v295;
  size_t v296;
  float32x4_t v297;
  unint64_t v298;
  uint64_t v299;
  signed int v300;
  int v301;
  int32x4_t v302;
  uint64_t v303;
  uint64_t j;
  __n64 v305;
  __n64 v306;
  float v307;
  uint64_t v308;
  float v309;
  float32x4_t v310;
  float32x4_t v311;
  float v312;
  float v313;
  unint64_t v314;
  uint64_t v315;
  float32x4_t *v316;
  uint64_t v317;
  uint64_t v318;
  int v319;
  uint64_t v320;
  float32x4_t v321;
  int *v322;
  float32x4_t *v323;
  float32x4_t *v324;
  float32x4_t v325;
  float32x4_t v326;
  float32x4_t v327;
  float32x4_t v328;
  float32x4_t v329;
  float32x4_t v330;
  float32x4_t *v331;
  uint64_t v332;
  int v333;
  float32x4_t v334;
  float v335;
  float32x4_t v336;
  float32x4_t v337;
  float32x4_t v338;
  float *v339;
  uint64_t v340;
  double v341;
  BOOL Dark_singleForegroundColor_singleBackgroundColor;
  int v344;
  __int32 v345;
  float32x4_t *v346;
  double v347;
  double v348;
  double v349;
  double v350;
  float32x4_t v351;
  int8x16_t v352;
  float32x4_t v353;
  __n64 v354;
  float32x4_t v355;
  float32x4_t v356;
  float32x4_t v357;
  __n64 v358;
  __n64 v359;
  float32x4_t v360;
  int8x16_t v361;
  float32x4_t v362;
  unint64_t v363;
  __int8 *v364;
  float v365;
  float32x4_t *v366;
  char *v367;
  int v368;
  float32x4_t v369;
  char v370;
  char v371;
  char v372;
  float32x4_t v373;
  float32x4_t v374;
  float32x4_t v375;
  float32x4_t v376;
  uint64_t v377;
  unint64_t v378;
  __int32 v379;
  unsigned __int32 *v380;
  uint64_t v381;
  unsigned __int32 *v382;
  unint64_t v383;
  int8x16_t v384;
  uint16x8_t v385;
  uint16x8_t v386;
  int8x16_t v387;
  uint16x8_t v388;
  float32x4_t v389;
  float32x4_t v390;
  int8x16_t v391;
  float32x4_t v392;
  int8x16_t v393;
  float32x4_t v394;
  float32x4_t v395;
  __int32 v396;
  float32x4_t v397;
  float32x4_t v398;
  float32x4_t v399;
  float32x4_t v400;
  float32x4_t v401;
  int v402;
  float32x4_t v403;
  double v404;
  float32x4_t v409;
  float32x4_t v410;
  unint64_t v411;
  int v412;
  __int32 v413;
  int v414;
  int v415;
  _BYTE *v416;
  float32x4_t v417;
  float32x4_t *v418;
  float32x4_t *v419;
  char v420;
  float32x4_t *v421;
  double v422;
  float v423;
  float32x4_t v424;
  float32x4_t v425;
  float32x4_t v426;
  id v427;
  float32x4_t v428;
  float32x4_t v430;
  float32x4_t v431;
  __n128 *v432;
  uint64_t v433;
  float32x4_t v434;
  float32x4_t *v435;
  uint64_t v436;
  const __CFString *v437;
  id v438;
  void *v439;
  _QWORD v440[2];
  float32x4_t v441;
  uint64_t v442;
  float32x4_t *v443;
  float32x4_t v444;
  float32x4_t v445;
  __n128 v446;
  int32x4_t v447;
  float32x4_t v448;
  float32x4_t v449;
  float32x4_t v450;
  uint64_t v451;
  id v452;
  uint64_t v453;
  float32x4_t v454;
  int32x4_t v455;
  id v456;
  uint64_t v457;
  float32x4_t v458;
  uint64_t v459;
  float32x4_t v460;
  float32x4_t v461;
  unsigned int v462;
  uint64_t v463;
  void *v464;

  v457 = v7;
  v8 = v6;
  v9 = v5;
  v10 = a5;
  v11 = *(_QWORD *)&a4;
  v12 = *(_QWORD *)&a3;
  v463 = *MEMORY[0x1E0C80C00];
  v14 = v464;
  v15 = 16;
  if (v10)
    v15 = 8;
  v458.i64[0] = (uint64_t)self;
  v16 = *(id *)((char *)&self->super.isa + v15);
  if (!objc_msgSend(v16, "computeMaskWithWidth:height:ucharSamplesAndMask:", v12, v11, v9))
  {
    v168 = 0;
    goto LABEL_171;
  }
  v451 = v8;
  v452 = v16;
  v456 = v14;
  v17 = 274877907 * (int)v11 * (int)v12;
  v455.i64[0] = v17 >> 38;
  v454.i64[0] = (unint64_t)v17 >> 63;
  v453 = v17 >> 39;
  v450.i64[0] = (v11 * v12);
  v448.i64[0] = (int)v11 * (int)v12;
  v18 = (float32x4_t *)malloc_type_malloc(v448.u64[0], 0x100004077774924uLL);
  v22 = (int *)&kISForegroundSegmentationLooseBooleanThreshold;
  v449.i32[0] = v10;
  if (v10)
    v22 = (int *)&kISForegroundSegmentationStrictBooleanThreshold;
  v23 = v12 - 1;
  v459 = v11;
  if ((int)v12 >= 1)
  {
    v24 = 0;
    v25 = *v22;
    v26 = v11 - 1;
    v27 = 4 * v12;
    v28 = v11;
    do
    {
      if ((int)v24 <= 1)
        v29 = 1;
      else
        v29 = v24;
      if ((int)v11 <= 0)
      {
        v33 = v24 + 1;
      }
      else
      {
        v30 = 0;
        v31 = v29 - 1;
        v32 = v29 - 1;
        v33 = v24 + 1;
        if ((int)v24 + 1 >= v23)
          v34 = v12 - 1;
        else
          v34 = v24 + 1;
        v35 = (uint64_t)&v9[4 * v29 - 1];
        do
        {
          if ((int)v30 <= 1)
            v36 = 1;
          else
            v36 = v30;
          v37 = v24 + v30 * v12;
          ++v30;
          if (v25 >= v9[4 * v37 + 3])
          {
            if (v32 <= v34)
            {
              v40 = 0;
              v39 = 0;
              v41 = v36 - 2;
              v42 = (unsigned __int8 *)(v35 + v27 * (v36 - 1));
              if ((int)v30 >= v26)
                v43 = v26;
              else
                v43 = v30;
              v44 = v36 - 1;
              v45 = v31;
              do
              {
                v46 = v42;
                v47 = v41;
                if (v44 <= v43)
                {
                  do
                  {
                    ++v40;
                    if (v25 < *v46)
                      ++v39;
                    ++v47;
                    v46 += v27;
                  }
                  while (v47 < v43);
                }
                v42 += 4;
                v278 = v45++ < v34;
              }
              while (v278);
            }
            else
            {
              v39 = 0;
              v40 = 0;
            }
            v38 = v39 >= v40 - 1;
          }
          else
          {
            v38 = 1;
          }
          v18->i8[v37] = v38;
        }
        while (v30 != v28);
        LODWORD(v11) = v459;
      }
      v24 = v33;
    }
    while (v33 != v12);
    v48 = 0;
    while (1)
    {
      v49 = (int)v48 <= 1 ? 1 : v48;
      if ((int)v11 > 0)
        break;
      v53 = v48 + 1;
LABEL_73:
      v48 = v53;
      if (v53 == v12)
      {
        v71 = 0;
        v72 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        v73 = 4 * v12;
        v74 = (float32x4_t)vdupq_n_s32(0xC37F0000);
        do
        {
          if ((int)v71 <= 1)
            v75 = 1;
          else
            v75 = v71;
          if ((int)v11 <= 0)
          {
            v79 = v71 + 1;
          }
          else
          {
            v76 = 0;
            v77 = v75 - 1;
            v78 = v75 - 1;
            v79 = v71 + 1;
            if ((int)v71 + 1 >= v23)
              v80 = v12 - 1;
            else
              v80 = v71 + 1;
            v81 = (uint64_t)&v9[4 * v75 - 2];
            do
            {
              if ((int)v76 <= 1)
                v82 = 1;
              else
                v82 = v76;
              v83 = v71 + v76 * v12;
              v84 = v18->i8[v83];
              if ((v84 & 1) != 0)
              {
                ++v76;
                if (v78 <= v80)
                {
                  v85 = 0;
                  v86 = &v9[4 * v83];
                  v19.i32[0] = *v86;
                  v19.i32[1] = v86[1];
                  *(float32x2_t *)v19.f32 = vcvt_f32_u32(*(uint32x2_t *)v19.f32);
                  v20.i8[0] = v86[2];
                  v20.f32[0] = (float)v20.u32[0];
                  v19.i32[2] = v20.i32[0];
                  v19 = vdivq_f32(v19, v72);
                  if ((int)v76 >= v26)
                    v87 = v26;
                  else
                    v87 = v76;
                  v88 = v82 - 1;
                  v89 = v82 - 2;
                  v90 = (__int8 *)(v81 + v73 * (v82 - 1));
                  v91 = v77;
                  do
                  {
                    v92 = v90;
                    v93 = v89;
                    if (v88 <= v87)
                    {
                      do
                      {
                        v20.i32[0] = *(v92 - 2);
                        v20.i32[1] = *(v92 - 1);
                        *(float32x2_t *)v20.f32 = vcvt_f32_u32(*(uint32x2_t *)v20.f32);
                        v21.i8[0] = *v92;
                        v20.f32[2] = (float)v21.u32[0];
                        v94 = vaddq_f32(v19, vdivq_f32(v20, v74));
                        v95 = vmulq_f32(v94, v94);
                        v21 = vaddq_f32(v95, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v95.f32, 1));
                        v20 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v95, 2), v21);
                        *(double *)v20.i64 = sqrtf(v20.f32[0]);
                        if (*(double *)v20.i64 <= 0.0392156863)
                          ++v85;
                        ++v93;
                        v92 += v73;
                      }
                      while (v93 < v87);
                    }
                    v90 += 4;
                    v278 = v91++ < v80;
                  }
                  while (v278);
                  if (v85 > 5)
                    v18->i8[v83] = v84 | 0x10;
                }
              }
              else
              {
                v18->i8[v83] = v84 | 0x10;
                ++v76;
              }
            }
            while (v76 != v28);
            LODWORD(v11) = v459;
          }
          v71 = v79;
        }
        while (v79 != v12);
        goto LABEL_104;
      }
    }
    v50 = 0;
    v51 = v49 - 1;
    v52 = v49 - 1;
    v53 = v48 + 1;
    if ((int)v48 + 1 >= v23)
      v54 = v12 - 1;
    else
      v54 = v48 + 1;
    while (1)
    {
      if ((int)v50 <= 1)
        v55 = 1;
      else
        v55 = v50;
      v56 = v55 - 2;
      v57 = (char *)v18 + v12 * (v55 - 1);
      v58 = v48 + v50 * v12;
      ++v50;
      if ((v18->i8[v58] & 1) != 0)
      {
        if (v52 > v54)
          goto LABEL_69;
        v59 = 0;
        v60 = 0;
        if ((int)v50 >= v26)
          v66 = v26;
        else
          v66 = v50;
        v67 = v55 - 1;
        v68 = v51;
        do
        {
          v69 = v57;
          v70 = v56;
          if (v67 <= v66)
          {
            do
            {
              ++v60;
              v59 += v69[v68] & 1;
              ++v70;
              v69 += v12;
            }
            while (v70 < v66);
          }
          v278 = v68++ < v54;
        }
        while (v278);
      }
      else
      {
        if (v52 > v54)
          goto LABEL_69;
        v59 = 0;
        v60 = 0;
        if ((int)v50 >= v26)
          v61 = v26;
        else
          v61 = v50;
        v62 = v55 - 1;
        v63 = v51;
        do
        {
          v64 = v57;
          v65 = v56;
          if (v62 <= v61)
          {
            do
            {
              ++v60;
              if ((v64[v63] & 1) == 0)
                ++v59;
              ++v65;
              v64 += v12;
            }
            while (v65 < v61);
          }
          v278 = v63++ < v54;
        }
        while (v278);
      }
      if (v59 == v60)
LABEL_69:
        v18->i8[v58] |= 2u;
      if (v50 == v28)
      {
        LODWORD(v11) = v459;
        goto LABEL_73;
      }
    }
  }
LABEL_104:
  v96 = v453 + v454.i32[0];
  v97 = (double)(int)v12;
  for (i = 11; i != 18; ++i)
  {
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v103 = (double)(int)i;
    v104 = -i;
    do
    {
      v105 = 0;
      v106 = 0;
      if ((v102 & 1) != 0)
        v107 = 1;
      else
        v107 = -1;
      do
      {
        if ((v18->i8[(int)(((float)v102 + 0.5) * v97 / v103) * (int)v12 + (int)(((float)v106 + 0.5) * v97 / v103)] & 1) != 0)
          v108 = v107;
        else
          v108 = -v107;
        v105 += v108;
        ++v106;
      }
      while (i != v106);
      v99 += v105;
      if (v105 == i)
        ++v100;
      v109 = v105 == v104 && v105 != i;
      v101 += v109;
      ++v102;
    }
    while (v102 != i);
    v110 = 0;
    v111 = 0;
    v112 = 0;
    v113 = 0;
    do
    {
      v114 = 0;
      v115 = 0;
      if ((v113 & 1) != 0)
        v116 = 1;
      else
        v116 = -1;
      do
      {
        if ((v18->i8[(int)(((float)v113 + 0.5) * v97 / v103) + (int)(((float)v115 + 0.5) * v97 / v103) * (int)v12] & 1) != 0)
          v117 = v116;
        else
          v117 = -v116;
        v114 += v117;
        ++v115;
      }
      while (i != v115);
      v110 += v114;
      if (v114 == i)
        ++v111;
      v118 = v114 == v104 && v114 != i;
      v112 += v118;
      ++v113;
    }
    while (v113 != i);
    v119 = i * i;
    if (v99 >= (int)((i * i) >> 1) && v100 >= i >> 1 && !v101
      || (v120 = v119 >> 1, v121 = -(v119 >> 1), v99 <= v121) && v101 >= i >> 1 && !v100
      || v110 >= v120 && (v111 >= i >> 1 ? (_ZF = v112 == 0) : (_ZF = 0), _ZF)
      || v110 <= v121 && v101 >= i >> 1 && !v111)
    {
      v169 = v18;
LABEL_169:
      free(v169);
      v168 = 0;
      goto LABEL_170;
    }
  }
  v454.i32[0] += v455.i32[0];
  v123 = (float32x4_t *)malloc_type_malloc(16 * *(int *)(v458.i64[0] + 32), 0x1000040451B5BE8uLL);
  v462 = 10;
  if (*(int *)(v458.i64[0] + 32) < 1)
    goto LABEL_168;
  v124 = 0;
  v125 = 0;
  v126 = 0;
  v127 = (float)(int)v12;
  v128 = (float)(int)v459;
  v455 = vdupq_n_s32(0x437F0000u);
  do
  {
    v129 = (int)(float)((float)(v127 * (float)rand_r(&v462)) * 4.6566e-10);
    v130.f32[0] = (float)(v128 * (float)rand_r(&v462)) * 4.6566e-10;
    v132 = v129 + (int)v130.f32[0] * v12;
    v133 = v18->u8[v132];
    if ((~v133 & 0x12) == 0)
    {
      v134 = &v9[4 * v132];
      v130.i32[0] = *v134;
      v130.i32[1] = v134[1];
      *(float32x2_t *)v130.f32 = vcvt_f32_u32(*(uint32x2_t *)v130.f32);
      LOBYTE(v131) = v134[2];
      v130.f32[2] = (float)LODWORD(v131);
      v131 = *(double *)v455.i64;
      v130 = vdivq_f32(v130, (float32x4_t)v455);
      if ((v133 & 1) != 0)
      {
        v123[(int)v126] = v130;
        v126 = (v126 + 1);
      }
      else
      {
        ++v125;
        v123[*(_DWORD *)(v458.i64[0] + 32) - v125] = v130;
      }
    }
    ++v124;
    v135 = *(_DWORD *)(v458.i64[0] + 32);
  }
  while (v124 < v135 && ((int)v126 < 1100 || v125 < 1100));
  if ((int)v126 < 10 || v125 < 10)
  {
LABEL_168:
    free(v18);
    v169 = v123;
    goto LABEL_169;
  }
  v136 = &v123[v135 - v125];
  *(double *)v137.i64 = ISSegmentationMathUtils_mean(v126, v123, *(double *)v130.i64, v131);
  v461 = v137;
  v444 = v137;
  *(double *)v144.i64 = ISSegmentationMathUtils_covariance(v126, v123, v137, v138, v139, v140, v141, v142, v143);
  v447 = (int32x4_t)v144;
  v445 = v145;
  v446 = v146;
  *(double *)v147.i64 = ISSegmentationMathUtils_mean(v125, v136, *(double *)v144.i64, *(double *)v145.i64);
  v455 = (int32x4_t)v147;
  *(double *)v154.i64 = ISSegmentationMathUtils_covariance(v125, v136, v147, v148, v149, v150, v151, v152, v153);
  v160 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v446, 2);
  v161.i64[0] = vaddq_f32(v160, vaddq_f32((float32x4_t)v447, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v445.f32, 1))).u64[0];
  v154.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v155, 2), vaddq_f32(v154, (float32x4_t)vdupq_lane_s32(v162, 1))).f32[0];
  v163 = v161.f32[0];
  v164 = v154.f32[0];
  v165 = -350469331;
  v453 = (uint64_t)v123;
  if (v161.f32[0] <= 0.0004 && v164 <= 0.0004)
  {
    v460 = v444;
    if ((!v457
       || shouldGenerateDark_singleForegroundColor_singleBackgroundColor(*(unsigned __int8 *)(v458.i64[0] + 36), (int32x4_t *)&v460, v444, (float32x4_t)v455))&& computeMask_foregroundMultipleColors_backgroundSingleColor(v12, v459, 1u, &v461, (uint64_t)v9, (uint64_t)v18, v451, &v460, (float32x4_t)0, v457))
    {
      v166 = v456;
      objc_msgSend(v456, "setObject:forKeyedSubscript:", CFSTR("IconSegmentationForegroundStyleSingleColor"), CFSTR("IconSegmentationForegroundStyleKey"));
      objc_msgSend(v456, "setObject:forKeyedSubscript:", &unk_1E5816140, CFSTR("IconSegmentationForegroundNumberOfColorsKey"));
      v167 = CFSTR("IconSegmentationBackgroundStyleSingleColor");
      goto LABEL_165;
    }
LABEL_285:
    v168 = 0;
    goto LABEL_286;
  }
  if (v163 > 0.0004 && v164 <= 0.0004)
  {
    if (!v449.i32[0])
      goto LABEL_285;
    if ((int)v12 < 1)
    {
      v199 = 0;
      v198 = 0;
      v172 = (float32x4_t)v455;
    }
    else
    {
      v171 = 0;
      v172 = (float32x4_t)v455;
      v173 = vmulq_f32(v172, v172);
      v174 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v173, 2), vaddq_f32(v173, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v173.f32, 1)));
      v175 = v459;
      v176 = v9 + 2;
      v177 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      v161.i32[0] = 1.0;
      v160.i32[1] = 1072210903;
      v156.i32[0] = 404232216;
      v178 = v18;
      do
      {
        v179 = v178;
        v180 = v176;
        v181 = v175;
        v182 = v459 - 1;
        if ((int)v459 >= 1)
        {
          do
          {
            if ((v179->i8[0] & 1) != 0)
            {
              v157.i32[0] = *(v180 - 2);
              v157.i32[1] = *(v180 - 1);
              *(float32x2_t *)v157.f32 = vcvt_f32_u32(*(uint32x2_t *)v157.f32);
              v158.i8[0] = *v180;
              v157.f32[2] = (float)v158.u32[0];
              v157 = vdivq_f32(v157, v177);
              v183 = vmulq_f32(v172, v157);
              v159 = vaddq_f32(v183, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v183.f32, 1));
              v158 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v183, 2), v159), v174);
              v158.f32[0] = fminf(fmaxf(v158.f32[0], 0.0), 1.0);
              if (v158.f32[0] >= 0.77)
              {
                v159 = vmlaq_n_f32((float32x4_t)0, v172, v158.f32[0]);
                v184 = vsubq_f32(v157, v159);
                v185 = vmulq_f32(v184, v184);
                v158 = vaddq_f32(v185, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v185.f32, 1));
                v157 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v185, 2), v158);
                *(double *)v157.i64 = sqrtf(v157.f32[0]);
                if (*(double *)v157.i64 < 0.0117647059)
                  v179->i8[0] |= 0x20u;
              }
            }
            v180 += 4 * v12;
            v179 = (float32x4_t *)((char *)v179 + v12);
            --v181;
          }
          while (v181);
        }
        ++v171;
        v176 += 4;
        v178 = (float32x4_t *)((char *)v178 + 1);
      }
      while (v171 != v12);
      v186 = 0;
      v187 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      v188 = (unsigned __int8 *)v9;
      do
      {
        if ((int)v459 >= 1)
        {
          v189 = 0;
          v190 = v186;
          v191 = v188;
          do
          {
            if (v186)
            {
              if (v186 < (v12 - 1))
              {
                if (v189)
                {
                  if (v189 < v182
                    && (v18->i8[v190] & 0x20) != 0
                    && (v18->i8[v190 - 1] & 0x21) != 1
                    && (v18->i8[v190 + 1] & 0x21) != 1
                    && (v18->i8[v190 - v12] & 0x21) != 1
                    && (v18->i8[v12 + v190] & 0x21) != 1)
                  {
                    v155.i32[0] = *v191;
                    v155.i32[1] = v191[1];
                    *(float32x2_t *)v155.f32 = vcvt_f32_u32(*(uint32x2_t *)v155.f32);
                    v161.i8[0] = v191[2];
                    v155.f32[2] = (float)v161.u32[0];
                    v192 = vdivq_f32(v155, v187);
                    v161.i32[0] = *(_DWORD *)&v9[4 * v190 + -4 * v12];
                    v160.i32[0] = *(_DWORD *)&v9[4 * v12 + 4 * v190];
                    v193 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v161.f32);
                    v156.i32[0] = *(v191 - 4);
                    v156.i32[1] = *(v191 - 3);
                    v194 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v160.f32);
                    *(float32x2_t *)v156.f32 = vcvt_f32_u32(*(uint32x2_t *)v156.f32);
                    v157.i8[0] = *(v191 - 2);
                    v156.f32[2] = (float)v157.u32[0];
                    v157.i32[0] = v191[4];
                    v157.i32[1] = v191[5];
                    *(float32x2_t *)v157.f32 = vcvt_f32_u32(*(uint32x2_t *)v157.f32);
                    v158.i8[0] = v191[6];
                    v157.f32[2] = (float)v158.u32[0];
                    v158.f32[0] = (float)v193.u16[0];
                    v159.i32[0] = v193.u16[1];
                    v159.i32[1] = v193.u16[2];
                    *(float32x2_t *)v193.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v159.f32, (int8x8_t)0xFF000000FFLL));
                    v159.f32[0] = (float)v194.u16[0];
                    v195 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v158, (int8x16_t)v158, 4uLL), v193, 0xCuLL);
                    v196.i32[0] = v194.u16[1];
                    v161 = vdivq_f32(v195, v187);
                    v196.i32[1] = v194.u16[2];
                    *(float32x2_t *)v194.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v196, (int8x8_t)0xFF000000FFLL));
                    v158 = (float32x4_t)vextq_s8((int8x16_t)v159, (int8x16_t)v159, 4uLL);
                    v157 = vsubq_f32(vdivq_f32(v157, v187), v192);
                    v156 = vmulq_f32(vsubq_f32(v192, vdivq_f32(v156, v187)), v157);
                    v157.f32[0] = fminf(v156.f32[0], v156.f32[2]);
                    v156.f32[0] = fminf(v157.f32[0], v156.f32[1]);
                    v160 = vsubq_f32(vdivq_f32((float32x4_t)vextq_s8((int8x16_t)v158, v194, 0xCuLL), v187), v192);
                    v155 = vmulq_f32(vsubq_f32(v192, v161), v160);
                    v161.f32[0] = fminf(v155.f32[0], v155.f32[2]);
                    if (fmaxf(v156.f32[0], fminf(v161.f32[0], v155.f32[1])) > 0.0)
                      v18->i8[v190] |= 0x40u;
                  }
                }
              }
            }
            ++v189;
            v191 += 4 * v12;
            v190 += v12;
          }
          while (v175 != v189);
        }
        ++v186;
        v188 += 4;
      }
      while (v186 != v12);
      v197 = 0;
      v198 = 0;
      v199 = 0;
      v200 = v18;
      do
      {
        v201 = v175;
        v202 = v200;
        if ((int)v459 >= 1)
        {
          do
          {
            v203 = v202->u8[0];
            v199 += (v203 >> 5) & 1;
            v198 += (v203 >> 6) & 1;
            v202 = (float32x4_t *)((char *)v202 + v12);
            --v201;
          }
          while (v201);
        }
        ++v197;
        v200 = (float32x4_t *)((char *)v200 + 1);
      }
      while (v197 != v12);
    }
    if ((float)((float)v198 / (float)v450.i32[0]) <= 0.14)
    {
      v158.i32[0] = 1.0;
      if (v198 <= v454.i32[0])
      {
        v277 = (float32x4_t *)v453;
        goto LABEL_266;
      }
      v276 = (float)((float)v198 / (float)v199);
      v277 = (float32x4_t *)v453;
      if (v276 <= 0.525)
      {
        if (v276 > 0.32)
        {
          v278 = (float)((float)v199 / (float)v450.i32[0]) >= 0.038 || v450.i32[0] <= 0;
          if (!v278)
            goto LABEL_262;
        }
      }
      else
      {
        if (v450.i32[0] < 1)
          goto LABEL_266;
LABEL_262:
        v279 = vmulq_f32(v172, v172);
        v280 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v279, 2), vaddq_f32(v279, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v279.f32, 1)));
        v281 = v9 + 2;
        v282 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        v283 = v450.i64[0];
        v284 = v18;
        v158.i32[0] = 1.0;
        do
        {
          v285 = v284->i8[0];
          v284 = (float32x4_t *)((char *)v284 + 1);
          if ((v285 & 0x20) != 0)
          {
            v160.i32[0] = *(v281 - 2);
            v160.i32[1] = *(v281 - 1);
            *(float32x2_t *)v160.f32 = vcvt_f32_u32(*(uint32x2_t *)v160.f32);
            v156.i8[0] = *v281;
            v160.f32[2] = (float)v156.u32[0];
            v286 = vmulq_f32(v172, vdivq_f32(v160, v282));
            v156 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v286.f32, 1);
            v160 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v286, 2), vaddq_f32(v286, v156)), v280);
            v158.f32[0] = fminf(v158.f32[0], fminf(fmaxf(v160.f32[0], 0.0), 1.0));
          }
          v281 += 4;
          --v283;
        }
        while (v283);
      }
LABEL_266:
      v287 = v158.f32[0];
      if (v158.f32[0] >= 0.92)
      {
        v441 = v158;
        v288 = (int *)malloc_type_malloc(4 * v126, 0x100004052888210uLL);
        v289 = ISSegmentationMathUtils_dbscan(v126, 10, (uint64_t)v277, v288, 0.043137);
        if ((int)v289 < 1)
        {
          free(v288);
        }
        else
        {
          v454.i32[0] = v96;
          v440[1] = v440;
          v445.i64[0] = v126;
          v290 = v289;
          v291 = MEMORY[0x1E0C80A78](v289);
          v293 = (int *)((char *)v440 - v292);
          v440[0] = v291;
          v294 = 16 * v291;
          MEMORY[0x1E0C80A78](v291);
          v295 = (float32x4_t *)&v440[-2 * v290];
          bzero(v293, v296);
          bzero(v295, v294);
          v298 = v445.i64[0];
          v299 = 0;
          v300 = 0;
          v301 = ISSegmentationMathUtils_dbscan_noiseClusterIndex;
          v302 = v455;
          do
          {
            v303 = v288[v299];
            if ((_DWORD)v303 == v301)
            {
              ++v300;
            }
            else
            {
              v297 = vaddq_f32(v277[v299], v295[v303]);
              v295[v303] = v297;
              ++v293[v303];
            }
            ++v299;
          }
          while (v298 != v299);
          for (j = 0; j != v290; ++j)
          {
            v297.f32[0] = (float)v293[j];
            v297 = vdivq_f32(v295[j], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v297.f32, 0));
            v295[j] = v297;
          }
          if (v300 < (int)(v126 / 0xA))
          {
            v306.n64_u64[0] = ISSegmentationMathUtils_rgb2hsv(v302).n64_u64[0];
            v308 = 0;
            v309 = 3.4028e38;
            do
            {
              v310 = vsubq_f32(v295[v308], (float32x4_t)v455);
              v311 = vmulq_f32(v310, v310);
              v312 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v311, 2), vaddq_f32(v311, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v311.f32, 1))).f32[0]);
              if (v312 < v309)
                v309 = v312;
              ++v308;
            }
            while (v290 != v308);
            v313 = v307 >= 0.5 ? flt_1AA972F30[v306.n64_f32[1] < 0.5] : 0.10588;
            if (v309 >= v313)
            {
              MEMORY[0x1E0C80A78](v305.n64_u64[0]);
              v443 = (float32x4_t *)&v440[-2 * v315];
              v316 = v443 + 2;
              v317 = v290;
              do
              {
                v316[-2].i32[2] = 0;
                v316[-2].i64[0] = 0;
                v316[-1].i32[2] = 0;
                v316[-1].i64[0] = 0;
                v316->i32[2] = 0;
                v316->i64[0] = 0;
                v316 += 3;
                --v317;
              }
              while (v317);
              v318 = 0;
              v319 = ISSegmentationMathUtils_dbscan_noiseClusterIndex;
              v442 = v290;
              do
              {
                v320 = v288[v318];
                if ((_DWORD)v320 != v319)
                {
                  v321 = vsubq_f32(v277[v318], v295[v320]);
                  v322 = v288;
                  v323 = v277;
                  v324 = &v443[3 * (int)v320];
                  *(double *)v325.i64 = ISSegmentationMathUtils_outer(v321, v321.f32[0]);
                  v314 = v445.i64[0];
                  v326 = vaddq_f32(*v324, v325);
                  v325.i32[3] = v446.n128_i32[3];
                  v328 = vaddq_f32(v324[1], v327);
                  v327.i32[3] = v447.i32[3];
                  v330 = vaddq_f32(v324[2], v329);
                  v329.i32[3] = v449.i32[3];
                  v324->i32[2] = v326.i32[2];
                  v324->i64[0] = v326.i64[0];
                  v324[1].i32[2] = v328.i32[2];
                  v324[2].i32[2] = v330.i32[2];
                  v324[1].i64[0] = v328.i64[0];
                  v324[2].i64[0] = v330.i64[0];
                  v277 = v323;
                  v288 = v322;
                  v290 = v442;
                  v319 = ISSegmentationMathUtils_dbscan_noiseClusterIndex;
                  v449 = v329;
                  v447 = (int32x4_t)v327;
                  v446 = (__n128)v325;
                }
                ++v318;
              }
              while (v314 != v318);
              v331 = v443 + 2;
              v332 = v290;
              do
              {
                v333 = *v293++;
                v334 = *v331;
                v335 = 1.0 / (double)v333;
                v336 = vmulq_n_f32(v331[-2], v335);
                v337 = vmulq_n_f32(v331[-1], v335);
                v331[-2].i32[2] = v336.i32[2];
                v331[-2].i64[0] = v336.i64[0];
                v338 = vmulq_n_f32(v334, v335);
                v331[-1].i32[2] = v337.i32[2];
                v331[-1].i64[0] = v337.i64[0];
                v331->i32[2] = v338.i32[2];
                v331->i64[0] = v338.i64[0];
                v331 += 3;
                --v332;
              }
              while (v332);
              v339 = &v443[1].f32[1];
              v340 = 1;
              do
              {
                v341 = (float)((float)(*(v339 - 5) + *v339) + v339[5]);
                v339 += 12;
              }
              while (v341 <= 0.0004 && v340++ < SLODWORD(v440[0]));
              if (v341 <= 0.0004)
              {
                v460 = v444;
                if (!v457)
                {
LABEL_389:
                  if (SLODWORD(v440[0]) >= 2)
                    computeIconSegmentationFlagForExtraConfidence(v12, v459, (uint64_t)v18);
                  goto LABEL_391;
                }
                if (LODWORD(v440[0]) == 1)
                {
                  Dark_singleForegroundColor_singleBackgroundColor = shouldGenerateDark_singleForegroundColor_singleBackgroundColor(*(unsigned __int8 *)(v458.i64[0] + 36), (int32x4_t *)&v460, v444, (float32x4_t)v455);
                  v277 = (float32x4_t *)v453;
                  if (!Dark_singleForegroundColor_singleBackgroundColor)
                    goto LABEL_399;
LABEL_391:
                  objc_msgSend(*(id *)(v458.i64[0] + 24), "computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:representativeSamples:", v126, v277);
                  if (LODWORD(v440[0]) == 1)
                    v435 = &v460;
                  else
                    v435 = 0;
                  if (computeMask_foregroundMultipleColors_backgroundSingleColor(v12, v459, v440[0], v295, (uint64_t)v9, (uint64_t)v18, v451, v435, v434, v457))
                  {
                    v436 = v440[0];
                    if (LODWORD(v440[0]) == 1)
                      v437 = CFSTR("IconSegmentationForegroundStyleSingleColor");
                    else
                      v437 = CFSTR("IconSegmentationForegroundStyleMultipleColors");
                    v438 = v456;
                    objc_msgSend(v456, "setObject:forKeyedSubscript:", v437, CFSTR("IconSegmentationForegroundStyleKey"));
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v436);
                    v439 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v438, "setObject:forKeyedSubscript:", v439, CFSTR("IconSegmentationForegroundNumberOfColorsKey"));

                    objc_msgSend(v438, "setObject:forKeyedSubscript:", CFSTR("IconSegmentationBackgroundStyleSingleColor"), CFSTR("IconSegmentationBackgroundStyleKey"));
                    v402 = 1;
LABEL_400:
                    free(v288);
LABEL_355:
                    v168 = v402 != 0;
                    goto LABEL_286;
                  }
                }
                else
                {
                  v428 = vmulq_f32((float32x4_t)v455, (float32x4_t)v455);
                  if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v428, 2), vaddq_f32(v428, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v428.f32, 1))).f32[0]) <= 0.235294118)
                  {
                    v432 = (__n128 *)v295;
                    v277 = (float32x4_t *)v453;
                    v433 = v442;
LABEL_387:
                    while (ISSegmentationMathUtils_contrastRatio(*v432, (__n128)vdupq_n_s32(0x3DA0902Eu)) >= 3.0)
                    {
                      ++v432;
                      if (!--v433)
                        goto LABEL_389;
                    }
                  }
                  else
                  {
                    __asm { FMOV            V1.4S, #-1.0 }
                    v430 = vaddq_f32((float32x4_t)v455, _Q1);
                    v431 = vmulq_f32(v430, v430);
                    v432 = (__n128 *)v295;
                    v277 = (float32x4_t *)v453;
                    v433 = v442;
                    if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v431, 2), vaddq_f32(v431, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v431.f32, 1))).f32[0]) <= 0.235294118)goto LABEL_387;
                  }
                }
LABEL_399:
                v402 = 0;
                goto LABEL_400;
              }
            }
          }
          free(v288);
          v96 = v454.i32[0];
        }
        v344 = v459;
        computeIconSegmentationFlagForMoreConfidence(v12, v459, (uint64_t)v18);
        computeIconSegmentationFlagForExtraConfidence(v12, v344, (uint64_t)v18);
        v172 = (float32x4_t)v455;
        v158.i32[0] = v441.i32[0];
      }
      v345 = v96;
      v449 = vmulq_n_f32(v172, v158.f32[0]);
      v346 = (float32x4_t *)malloc_type_malloc(v448.u64[0], 0x100004077774924uLL);
      computeIconSegmentationAdditionalGradientFlag(v12, v459, v287 < 0.92, (uint64_t)v9, (uint64_t)v18, (uint64_t)v346, v347, v348, v349, v350, v351, v352, v353);
      *(__n64 *)v355.f32 = ISSegmentationMathUtils_rgb2hsv(v455);
      v362 = v355;
      v363 = v450.i64[0];
      if (v450.i32[0] < 1)
      {
        v365 = 3.4028e38;
        v368 = v459;
        v369 = (float32x4_t)v455;
      }
      else
      {
        v364 = v9 + 2;
        v365 = 3.4028e38;
        v357 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        v366 = v18;
        v367 = (char *)v346;
        v368 = v459;
        v369 = (float32x4_t)v455;
        v448 = v355;
        v447 = (int32x4_t)v357;
        do
        {
          v371 = v366->i8[0];
          v366 = (float32x4_t *)((char *)v366 + 1);
          v370 = v371;
          v372 = v371;
          if (v287 < 0.92)
            v372 = *v367;
          if ((v370 & 1) != 0 && (v372 & 4) != 0)
          {
            v355.i32[0] = *(v364 - 2);
            v355.i32[1] = *(v364 - 1);
            *(float32x2_t *)v355.f32 = vcvt_f32_u32(*(uint32x2_t *)v355.f32);
            v356.i8[0] = *v364;
            v355.f32[2] = (float)v356.u32[0];
            v373 = vdivq_f32(v355, v357);
            if (v287 >= 0.92)
            {
              v375 = vsubq_f32(v373, v369);
            }
            else
            {
              v454 = v373;
              *(double *)v374.i64 = ISSegmentationMathUtils_clampedProject(v373, v369, v449);
              v357 = (float32x4_t)v447;
              v362 = v448;
              v369 = (float32x4_t)v455;
              v368 = v459;
              v375 = vsubq_f32(v454, v374);
            }
            v376 = vmulq_f32(v375, v375);
            v356 = vaddq_f32(v376, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v376.f32, 1));
            v355 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v376, 2), v356);
            v355.f32[0] = sqrtf(v355.f32[0]);
            if (v355.f32[0] < v365)
              v365 = v355.f32[0];
          }
          v364 += 4;
          ++v367;
          --v363;
        }
        while (v363);
      }
      v356.i32[0] = v362.i32[2];
      if (v362.f32[2] >= 0.5)
      {
        v356.i32[0] = v362.i32[1];
        v355.f32[0] = flt_1AA972F30[v362.f32[1] < 0.5];
      }
      else
      {
        v355.i32[0] = 1037621465;
      }
      v377 = v453;
      if (v365 >= v355.f32[0])
      {
        if ((int)v12 < 1)
        {
          v379 = 0;
        }
        else
        {
          v378 = 0;
          v379 = 0;
          v355.i64[0] = 0xFF000000FFLL;
          v356 = (float32x4_t)vdupq_n_s32(0x437F0000u);
          v362.i64[0] = 0xC0000000C0000000;
          v362.i64[1] = 0xC0000000C0000000;
          v357.i32[0] = 0.25;
          v358.n64_u32[0] = 993257242;
          v380 = (unsigned __int32 *)v9;
          v354.n64_u64[0] = (unint64_t)&v9[-4 * v12];
          do
          {
            if ((int)v459 >= 1)
            {
              v381 = 0;
              v382 = v380;
              v383 = v378;
              do
              {
                if (v378)
                {
                  if (v378 < (v12 - 1))
                  {
                    if (v381)
                    {
                      if (v381 < v368 - 1
                        && (~v18->u8[v383] & 3) == 0
                        && (v346->i8[v383] & 1) == 0
                        && (~v18->u8[v383 - 1] & 3) == 0
                        && (v346->i8[v383 - 1] & 1) == 0
                        && (~v18->u8[v383 + 1] & 3) == 0
                        && (v346->i8[v383 + 1] & 1) == 0
                        && (~v18->u8[v383 - v12] & 3) == 0
                        && (v346->i8[v383 - v12] & 1) == 0
                        && (~v18->u8[v12 + v383] & 3) == 0
                        && (v346->i8[v12 + v383] & 1) == 0)
                      {
                        v359.n64_u32[0] = *v382;
                        v360.i32[0] = v382[1];
                        v384 = (int8x16_t)vmovl_u8((uint8x8_t)v359.n64_u64[0]);
                        v359.n64_u32[0] = *(v382 - 1);
                        v385 = vmovl_u8((uint8x8_t)v359.n64_u64[0]);
                        v386 = vmovl_u8(*(uint8x8_t *)v360.f32);
                        v359.n64_u32[0] = *(_DWORD *)(v354.n64_u64[0] + 4 * v383);
                        v387 = (int8x16_t)vmovl_u8((uint8x8_t)v359.n64_u64[0]);
                        v359.n64_u32[0] = *(_DWORD *)&v9[4 * v12 + 4 * v383];
                        v388 = vmovl_u8((uint8x8_t)v359.n64_u64[0]);
                        v360.f32[0] = (float)v384.u16[0];
                        v361.i32[0] = v384.u16[1];
                        v361.i32[1] = v384.u16[2];
                        *(float32x2_t *)v384.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v361.i8, (int8x8_t)0xFF000000FFLL));
                        *(float *)v361.i32 = (float)v385.u16[0];
                        v389 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v360, (int8x16_t)v360, 4uLL), v384, 0xCuLL);
                        v384.i32[0] = v385.u16[1];
                        v390 = vdivq_f32(v389, v356);
                        v384.i32[1] = v385.u16[2];
                        *(float32x2_t *)v384.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v384.i8, (int8x8_t)0xFF000000FFLL));
                        v391 = vextq_s8(v361, v361, 4uLL);
                        *(float *)v361.i32 = (float)v386.u16[0];
                        v392 = (float32x4_t)vextq_s8(v391, v384, 0xCuLL);
                        v391.i32[0] = v386.u16[1];
                        v391.i32[1] = v386.u16[2];
                        *(float32x2_t *)v391.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v391.i8, (int8x8_t)0xFF000000FFLL));
                        v393 = vextq_s8(v361, v361, 4uLL);
                        v394 = vdivq_f32((float32x4_t)vextq_s8(v393, v391, 0xCuLL), v356);
                        *(float *)v393.i32 = (float)v387.u16[0];
                        v361.i32[0] = v387.u16[1];
                        v361.i32[1] = v387.u16[2];
                        *(float32x2_t *)v387.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v361.i8, (int8x8_t)0xFF000000FFLL));
                        *(float *)v361.i32 = (float)v388.u16[0];
                        v395 = (float32x4_t)vextq_s8(vextq_s8(v393, v393, 4uLL), v387, 0xCuLL);
                        v387.i32[0] = v388.u16[1];
                        v396 = v388.u16[2];
                        v397 = vdivq_f32(v395, v356);
                        v387.i32[1] = v396;
                        *(float32x2_t *)v395.f32 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v387.i8, (int8x8_t)0xFF000000FFLL));
                        v398 = vmlaq_f32(vaddq_f32(vdivq_f32(v392, v356), v394), v362, v390);
                        v399 = vmulq_f32(v398, v398);
                        v400 = vmlaq_f32(vaddq_f32(v397, vdivq_f32((float32x4_t)vextq_s8(vextq_s8(v361, v361, 4uLL), (int8x16_t)v395, 0xCuLL), v356)), v362, v390);
                        v401 = vmulq_f32(v400, v400);
                        v360 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v401.f32, 1);
                        v359.n64_u64[0] = vaddq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v399, 2), vaddq_f32(v399, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v399.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v401, 2), vaddq_f32(v401, v360))).u64[0];
                        if ((float)(0.25 * v359.n64_f32[0]) > 0.0027451)
                          ++v379;
                      }
                    }
                  }
                }
                ++v381;
                v383 += v12;
                v382 += v12;
              }
              while (v368 != v381);
            }
            ++v378;
            ++v380;
          }
          while (v378 != v12);
        }
        if (v379 <= v345)
        {
          if (!v457)
            goto LABEL_381;
          v403 = vmulq_f32(v369, v369);
          v404 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v403, 2), vaddq_f32(v403, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v403.f32, 1))).f32[0]);
          if (v404 <= 0.235294118)
            goto LABEL_403;
          __asm { FMOV            V1.4S, #-1.0 }
          v409 = vaddq_f32(v369, _Q1);
          v410 = vmulq_f32(v409, v409);
          v404 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v410, 2), vaddq_f32(v410, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v410.f32, 1))).f32[0]);
          if (v404 <= 0.235294118)
          {
LABEL_403:
            v411 = v450.i64[0];
            if (v450.i32[0] < 1)
            {
              v415 = 0;
              v414 = 0;
              v413 = 0;
              v412 = 0;
            }
            else
            {
              v412 = 0;
              v413 = 0;
              v414 = 0;
              v415 = 0;
              v416 = v9 + 2;
              v447 = vdupq_n_s32(0x437F0000u);
              v417 = (float32x4_t)vdupq_n_s32(0x3DA0902Eu);
              v446 = (__n128)v417;
              v418 = v18;
              v419 = v346;
              do
              {
                v420 = v418->i8[0];
                if (v287 < 0.92)
                  v420 = v419->i8[0];
                if ((v418->i8[0] & 1) != 0 && (v420 & 4) != 0)
                {
                  v421 = v287 >= 0.92 ? v418 : v419;
                  if ((v421->i8[0] & 8) == 0)
                  {
                    v417.i32[0] = *(v416 - 2);
                    v417.i32[1] = *(v416 - 1);
                    *(float32x2_t *)v417.f32 = vcvt_f32_u32(*(uint32x2_t *)v417.f32);
                    LOBYTE(v404) = *v416;
                    v417.f32[2] = (float)LODWORD(v404);
                    ++v415;
                    v450.i64[0] = v411;
                    v454.i32[0] = v413;
                    v448.i32[0] = v414;
                    v417.f32[0] = ISSegmentationMathUtils_contrastRatio((__n128)vdivq_f32(v417, (float32x4_t)v447), v446);
                    v414 = v448.i32[0];
                    v413 = v454.i32[0];
                    v411 = v450.i64[0];
                    if (v417.f32[0] >= 3.0)
                      v414 = v448.i32[0] + 1;
                    v422 = v417.f32[0];
                    if (v422 < 1.8)
                      v413 = v454.i32[0] + 1;
                    if (v422 < 1.2)
                      ++v412;
                  }
                }
                v416 += 4;
                v419 = (float32x4_t *)((char *)v419 + 1);
                v418 = (float32x4_t *)((char *)v418 + 1);
                --v411;
              }
              while (v411);
            }
            v423 = (float)v415;
            v377 = v453;
            if ((float)((float)v414 / (float)v415) >= 0.4)
            {
              v362.i64[0] = 0x3FB47AE147AE147BLL;
              if ((float)((float)v413 / v423) <= 0.08)
              {
                *(double *)v355.i64 = (float)((float)v412 / v423);
                v356.i64[0] = 0x3F947AE147AE147BLL;
                if (*(double *)v355.i64 <= 0.02)
                {
LABEL_381:
                  objc_msgSend(*(id *)(v458.i64[0] + 24), "computeGrayscaleConversionColorWithNumberOfRepresentativeSamples:representativeSamples:", v126, v377, v354.n64_u64[0], *(double *)v355.i64, *(double *)v356.i64, *(double *)v362.i64, *(double *)v357.i64, v358.n64_f64[0]);
                  if (computeMask_foregroundContinuousGradient_backgroundSingleColor(v12, v459, v287 < 0.92, (uint64_t)v9, (uint64_t)v18, (char *)v346, v451, v457, v424, (float32x4_t)v455, v449, v425, v426))
                  {
                    v427 = v456;
                    objc_msgSend(v456, "setObject:forKeyedSubscript:", CFSTR("IconSegmentationForegroundStyleContinuousGradient"), CFSTR("IconSegmentationForegroundStyleKey"));
                    objc_msgSend(v427, "setObject:forKeyedSubscript:", CFSTR("IconSegmentationBackgroundStyleSingleColor"), CFSTR("IconSegmentationBackgroundStyleKey"));
                    free(v346);
                    v402 = 1;
                    goto LABEL_355;
                  }
                }
              }
            }
          }
        }
      }
      free(v346);
    }
    v402 = 0;
    goto LABEL_355;
  }
  v168 = 0;
  if (v163 > 0.0004)
    goto LABEL_286;
  v454.i32[0] = v96;
  if (v164 <= 0.0004)
    goto LABEL_286;
  computeIconSegmentationFlagForExtraConfidence(v12, v459, (uint64_t)v18);
  if (v457)
  {
    if (!*(_BYTE *)(v458.i64[0] + 37))
      goto LABEL_285;
    v168 = 0;
    if ((v18->i8[0] & 3) != 2)
      goto LABEL_286;
    v207 = (int)v12 - 1;
    if ((v18->i8[v207] & 1) != 0)
      goto LABEL_286;
    if ((v18->i8[v207] & 2) == 0)
      goto LABEL_286;
    v208 = (int)v459 - 1;
    if ((v18->i8[v208 * (int)v12] & 1) != 0)
      goto LABEL_286;
    if ((v18->i8[v208 * (int)v12] & 2) == 0)
      goto LABEL_286;
    v209 = v450.i32[0] - 1;
    if ((v18->i8[v209] & 1) != 0 || (v18->i8[v209] & 2) == 0)
      goto LABEL_286;
    v204.i8[0] = *v9;
    v204.f32[0] = (float)v204.u32[0];
    LOBYTE(v205) = v9[1];
    LOBYTE(v206) = v9[2];
    v204.f32[1] = (float)v205;
    v204.f32[2] = (float)v206;
    v458 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    v210 = &v9[4 * v207];
    v211 = *v210;
    v212 = v210[1];
    LOBYTE(v165) = v210[2];
    v213 = &v9[4 * v208 * (int)v12];
    v449.i32[0] = *v213;
    v450.i32[0] = v213[1];
    LOBYTE(v128) = v213[2];
    v214 = &v9[4 * v209];
    v447.i32[0] = *v214;
    v448.i32[0] = v214[1];
    LOBYTE(v127) = v214[2];
    v446 = (__n128)vdivq_f32(v204, v458);
    v455 = vdupq_n_s32(0x3DA0902Eu);
    if (ISSegmentationMathUtils_contrastRatio(v446, (__n128)v455) < 3.0)
      goto LABEL_285;
    *(float32x2_t *)v215.f32 = vcvt_f32_u32((uint32x2_t)__PAIR64__(v212, v211));
    v215.f32[2] = (float)v165;
    v445 = vdivq_f32(v215, v458);
    if (ISSegmentationMathUtils_contrastRatio((__n128)v445, (__n128)v455) < 3.0)
      goto LABEL_285;
    *(float32x2_t *)v216.f32 = vcvt_f32_u32((uint32x2_t)__PAIR64__(v450.u32[0], v449.u32[0]));
    v216.f32[2] = (float)LODWORD(v128);
    v450 = vdivq_f32(v216, v458);
    v455 = vdupq_n_s32(0x3DA0902Eu);
    if (ISSegmentationMathUtils_contrastRatio((__n128)v450, (__n128)v455) < 3.0)
      goto LABEL_285;
    *(float32x2_t *)v217.f32 = vcvt_f32_u32((uint32x2_t)__PAIR64__(v448.u32[0], v447.u32[0]));
    v217.f32[2] = (float)LODWORD(v127);
    v458 = vdivq_f32(v217, v458);
    if (ISSegmentationMathUtils_contrastRatio((__n128)v458, (__n128)v455) < 3.0)
      goto LABEL_285;
    if ((int)v459 >= 1)
    {
      v221 = 0;
      v222 = 0;
      v223 = vsubq_f32(v458, v450);
      v224 = vsubq_f32(v445, (float32x4_t)v446);
      v225 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      v226 = v9;
      v227 = v18;
      do
      {
        if ((int)v12 >= 1)
        {
          v228 = 0;
          v218.f32[0] = (float)(int)v221 / (float)(int)v208;
          v218 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v218.f32, 0);
          do
          {
            if ((v227->i8[v228] & 9) == 8)
            {
              *(float *)v219.i32 = (float)(int)v228 / (float)(int)v207;
              v229 = vmlaq_n_f32(v450, v223, *(float *)v219.i32);
              v230 = vmlaq_n_f32((float32x4_t)v446, v224, *(float *)v219.i32);
              v219.i32[0] = *(_DWORD *)&v226[4 * v228];
              v231 = (int8x16_t)vmovl_u8(v219);
              *(float *)v220.i32 = (float)v231.u16[0];
              v232 = vmlaq_f32(v230, vsubq_f32(v229, v230), v218);
              v229.i32[0] = v231.u16[1];
              v229.i32[1] = v231.u16[2];
              *(float32x2_t *)v231.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v229.f32, (int8x8_t)0xFF000000FFLL));
              v233 = vsubq_f32(vdivq_f32((float32x4_t)vextq_s8(vextq_s8(v220, v220, 4uLL), v231, 0xCuLL), v225), v232);
              v234 = vmulq_f32(v233, v233);
              v219 = (uint8x8_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v234, 2), vaddq_f32(v234, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v234.f32, 1))).u64[0];
              if (sqrtf(*(float *)v219.i32) > 0.20392)
                ++v222;
            }
            ++v228;
          }
          while (v12 != v228);
        }
        if (v222 > 60)
          break;
        ++v221;
        v227 = (float32x4_t *)((char *)v227 + (int)v12);
        v226 += 4 * (int)v12;
      }
      while (v221 < v459);
      if (v222 > 60)
        goto LABEL_285;
    }
  }
  *(__n64 *)v235.i8 = ISSegmentationMathUtils_rgb2hsv((int32x4_t)v444);
  v235.i32[0] = vextq_s8(v235, v235, 8uLL).u32[0];
  *(int8x8_t *)v235.i8 = vmvn_s8((int8x8_t)vcge_f32(*(float32x2_t *)v235.i8, (float32x2_t)0x3F0000003F000000));
  if (((v235.i32[1] | v235.i32[0]) & 1) == 0)
    goto LABEL_285;
  v240 = v125;
  v241 = 3.4028e38;
  do
  {
    v242 = *v136++;
    v243 = vsubq_f32(v444, v242);
    v244 = vmulq_f32(v243, v243);
    v245 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v244, 2);
    v246 = sqrtf(vaddq_f32(v245, vaddq_f32(v244, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v244.f32, 1))).f32[0]);
    if (v246 < v241)
      v241 = v246;
    --v240;
  }
  while (v240);
  v247.i32[0] = 1041536149;
  if (v241 < 0.1451)
    goto LABEL_285;
  if ((int)v12 < 5)
  {
    v249 = 0;
  }
  else
  {
    v248 = 0;
    v249 = 0;
    v250 = (char *)v18 + 2 * v12;
    v251 = v250 + 3;
    v252 = (uint64_t)&v9[8 * v12 + 8];
    v253 = (uint64_t)&v250[v12 + 2];
    v247 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    v245.i64[0] = 0xC0000000C0000000;
    v245.i64[1] = 0xC0000000C0000000;
    v244.i32[0] = 0.25;
    v236.i32[0] = 993257242;
    v254 = 2;
    do
    {
      v255 = (__int32 *)v252;
      v256 = v248;
      v257 = (v459 - 2) - 2;
      if ((int)v459 >= 5)
      {
        do
        {
          if ((v251[v256 - 1] & 9) == 8
            && (v251[v256 - 2] & 9) == 8
            && (v251[v256] & 9) == 8
            && (v18->i8[v12 + 2 + v256] & 9) == 8
            && (*(_BYTE *)(v253 + v256) & 9) == 8)
          {
            v237.i32[0] = *v255;
            v238.i32[0] = v255[1];
            v258 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v237.f32);
            v237.i32[0] = *(v255 - 1);
            v259 = vmovl_u8(*(uint8x8_t *)v237.f32);
            v260 = vmovl_u8(*(uint8x8_t *)v238.f32);
            v237.i32[0] = *(_DWORD *)&v9[4 * v12 + 8 + 4 * v256];
            v261 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v237.f32);
            v237.i32[0] = *(_DWORD *)&v9[12 * v12 + 8 + 4 * v256];
            v262 = vmovl_u8(*(uint8x8_t *)v237.f32);
            v238.f32[0] = (float)v258.u16[0];
            v239.i32[0] = v258.u16[1];
            v239.i32[1] = v258.u16[2];
            *(float32x2_t *)v258.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v239.i8, (int8x8_t)0xFF000000FFLL));
            *(float *)v239.i32 = (float)v259.u16[0];
            v263 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v238, (int8x16_t)v238, 4uLL), v258, 0xCuLL);
            v258.i32[0] = v259.u16[1];
            v264 = vdivq_f32(v263, v247);
            v258.i32[1] = v259.u16[2];
            *(float32x2_t *)v258.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v258.i8, (int8x8_t)0xFF000000FFLL));
            v265 = vextq_s8(v239, v239, 4uLL);
            *(float *)v239.i32 = (float)v260.u16[0];
            v266 = (float32x4_t)vextq_s8(v265, v258, 0xCuLL);
            v265.i32[0] = v260.u16[1];
            v265.i32[1] = v260.u16[2];
            *(float32x2_t *)v265.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v265.i8, (int8x8_t)0xFF000000FFLL));
            v267 = vextq_s8(v239, v239, 4uLL);
            v268 = vdivq_f32((float32x4_t)vextq_s8(v267, v265, 0xCuLL), v247);
            *(float *)v267.i32 = (float)v261.u16[0];
            v239.i32[0] = v261.u16[1];
            v239.i32[1] = v261.u16[2];
            *(float32x2_t *)v261.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v239.i8, (int8x8_t)0xFF000000FFLL));
            *(float *)v239.i32 = (float)v262.u16[0];
            v269 = (float32x4_t)vextq_s8(vextq_s8(v267, v267, 4uLL), v261, 0xCuLL);
            v261.i32[0] = v262.u16[1];
            v270 = v262.u16[2];
            v271 = vdivq_f32(v269, v247);
            v261.i32[1] = v270;
            *(float32x2_t *)v269.f32 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v261.i8, (int8x8_t)0xFF000000FFLL));
            v272 = vmlaq_f32(vaddq_f32(vdivq_f32(v266, v247), v268), v245, v264);
            v273 = vmulq_f32(v272, v272);
            v274 = vmlaq_f32(vaddq_f32(v271, vdivq_f32((float32x4_t)vextq_s8(vextq_s8(v239, v239, 4uLL), (int8x16_t)v269, 0xCuLL), v247)), v245, v264);
            v275 = vmulq_f32(v274, v274);
            v238 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v275.f32, 1);
            v237 = vaddq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v273, 2), vaddq_f32(v273, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v273.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v275, 2), vaddq_f32(v275, v238)));
            v237.f32[0] = 0.25 * v237.f32[0];
            if (v237.f32[0] > 0.0027451)
              ++v249;
          }
          v256 += v12;
          v255 += v12;
          --v257;
        }
        while (v257);
      }
      ++v254;
      ++v248;
      v252 += 4;
    }
    while (v254 != (_DWORD)v12 - 2);
  }
  if (v249 > v454.i32[0])
    goto LABEL_285;
  computeMask_foregroundSingleColor_backgroundContinuousGradient(v12, v459, v9, v451, v457, v444, v241, v247.f32[0], v245, v244, v236, v237, v238.f32[0]);
  v166 = v456;
  objc_msgSend(v456, "setObject:forKeyedSubscript:", CFSTR("IconSegmentationForegroundStyleSingleColor"), CFSTR("IconSegmentationForegroundStyleKey"));
  objc_msgSend(v456, "setObject:forKeyedSubscript:", &unk_1E5816140, CFSTR("IconSegmentationForegroundNumberOfColorsKey"));
  v167 = CFSTR("IconSegmentationBackgroundStyleContinuousGradient");
LABEL_165:
  objc_msgSend(v166, "setObject:forKeyedSubscript:", v167, CFSTR("IconSegmentationBackgroundStyleKey"));
  v168 = 1;
LABEL_286:
  free(v18);
  free((void *)v453);
LABEL_170:
  v14 = v456;
  v16 = v452;
LABEL_171:

  return v168;
}

- (BOOL)_computeImageWithWidth:(int)a3 height:(int)a4 ucharSamplesAndForegroundMask:ucharTintable:ucharDark:feedback:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  void *v16;
  BOOL v17;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v12 = *(_QWORD *)&a4;
  v13 = *(_QWORD *)&a3;
  v15 = (void *)objc_opt_new();
  v16 = v15;
  if (v8)
    *v8 = objc_retainAutorelease(v15);
  v17 = 1;
  if (!-[ISIconSegmentation _computeImageWithWidth:height:strict:ucharSamplesAndForegroundMask:ucharTintable:ucharDark:feedback:](self, "_computeImageWithWidth:height:strict:ucharSamplesAndForegroundMask:ucharTintable:ucharDark:feedback:", v13, v12, 1, v11, v10, v9, v16))v17 = -[ISIconSegmentation _computeImageWithWidth:height:strict:ucharSamplesAndForegroundMask:ucharTintable:ucharDark:feedback:](self, "_computeImageWithWidth:height:strict:ucharSamplesAndForegroundMask:ucharTintable:ucharDark:feedback:", v13, v12, 0, v11, v10, v9, v16);

  return v17;
}

- (BOOL)_computeImageWithCGImage:(ISIconSegmentation *)self ucharTintable:(SEL)a2 ucharDark:(CGImage *)a3 feedback:(char *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGDataProvider *DataProvider;
  const __CFData *v12;
  const __CFData *v13;
  const UInt8 *BytePtr;
  const UInt8 *v15;
  size_t Width;
  size_t Height;
  uint64_t v18;
  void *v19;
  void *v20;
  _DWORD *v21;
  int v22;
  BOOL v23;

  if (!a3)
    return 0;
  v6 = v5;
  v7 = v4;
  if (CGImageGetBitsPerComponent(a3) != 8)
    return 0;
  if (CGImageGetBitsPerPixel(a3) != 32)
    return 0;
  DataProvider = CGImageGetDataProvider(a3);
  if (!DataProvider)
    return 0;
  v12 = CGDataProviderCopyData(DataProvider);
  if (!v12)
    return 0;
  v13 = v12;
  BytePtr = CFDataGetBytePtr(v12);
  if (!BytePtr)
  {
    CFRelease(v13);
    return 0;
  }
  v15 = BytePtr;
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v18 = (Height * Width);
  v19 = malloc_type_malloc(4 * (int)v18, 0x100004052888210uLL);
  v20 = v19;
  if ((int)v18 >= 1)
  {
    v21 = v19;
    do
    {
      v22 = *(_DWORD *)v15;
      v15 += 4;
      *v21++ = v22;
      --v18;
    }
    while (v18);
  }
  CFRelease(v13);
  v23 = -[ISIconSegmentation _computeImageWithWidth:height:ucharSamplesAndForegroundMask:ucharTintable:ucharDark:feedback:](self, "_computeImageWithWidth:height:ucharSamplesAndForegroundMask:ucharTintable:ucharDark:feedback:", Width, Height, v20, a4, v7, v6);
  free(v20);
  return v23;
}

- (CGImage)createTintableImageWithCGImage:(CGImage *)a3
{
  int Width;
  int Height;
  void *v7;
  _BOOL4 v8;
  CGImage *v9;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v7 = malloc_type_malloc(Width * Height, 0x100004077774924uLL);
  v8 = -[ISIconSegmentation _computeImageWithCGImage:ucharTintable:ucharDark:feedback:](self, "_computeImageWithCGImage:ucharTintable:ucharDark:feedback:", a3, v7, 0, 0);
  v9 = 0;
  if (v8)
    v9 = ISCreateCGImageMaskUchar(Width, Height, (uint64_t)v7);
  free(v7);
  return v9;
}

- (CGImage)createDarkImageWithCGImage:(CGImage *)a3
{
  int Width;
  int Height;
  void *v7;
  _BOOL4 v8;
  CGImage *v9;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v7 = malloc_type_malloc(4 * Width * Height, 0x100004052888210uLL);
  v8 = -[ISIconSegmentation _computeImageWithCGImage:ucharTintable:ucharDark:feedback:](self, "_computeImageWithCGImage:ucharTintable:ucharDark:feedback:", a3, 0, v7, 0);
  v9 = 0;
  if (v8)
    v9 = ISCreateCGImageUchar4AlphaPremultiplied(Width, Height, (uint64_t)v7);
  free(v7);
  return v9;
}

- (BOOL)enableColorEnhancementInDarkImage
{
  return self->_enableColorEnhancementInDarkImage;
}

- (void)setEnableColorEnhancementInDarkImage:(BOOL)a3
{
  self->_enableColorEnhancementInDarkImage = a3;
}

- (BOOL)enableRecoloringSingleForegroundColorWithGradientBackgroundInDarkImage
{
  return self->_enableRecoloringSingleForegroundColorWithGradientBackgroundInDarkImage;
}

- (void)setEnableRecoloringSingleForegroundColorWithGradientBackgroundInDarkImage:(BOOL)a3
{
  self->_enableRecoloringSingleForegroundColorWithGradientBackgroundInDarkImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grayscaleConversion, 0);
  objc_storeStrong((id *)&self->_looseForegroundSegmentation, 0);
  objc_storeStrong((id *)&self->_strictForegroundSegmentation, 0);
}

@end
