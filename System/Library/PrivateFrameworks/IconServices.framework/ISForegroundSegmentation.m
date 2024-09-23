@implementation ISForegroundSegmentation

- (ISForegroundSegmentation)initWithStrict:(BOOL)a3
{
  _BOOL4 v3;
  ISForegroundSegmentation *result;
  float v5;
  int v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ISForegroundSegmentation;
  result = -[ISForegroundSegmentation init](&v7, sel_init);
  if (result)
  {
    result->_strict = v3;
    *(_OWORD *)&result->_numberOfClusters = xmmword_1AA977340;
    result->_clusterGroupingDistanceThreshold = 1.0;
    v5 = 0.17647;
    if (v3)
    {
      v5 = 0.015686;
      v6 = 2;
    }
    else
    {
      v6 = 150;
    }
    result->_borderNoiseScale = v5;
    result->_BOOLeanThreshold = v6;
  }
  return result;
}

- (BOOL)computeMaskWithWidth:(int)a3 height:(int)a4 ucharSamplesAndMask:
{
  uint64_t v4;
  float32x4_t v5;
  uint64_t v6;
  uint64_t v7;
  ISForegroundSegmentation *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  float32x4_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float32x4_t v23;
  unsigned __int8 *v24;
  uint64_t v25;
  int v26;
  int v27;
  float32x4_t v28;
  uint64_t v29;
  float32x4_t v35;
  float v36;
  float32x4_t v37;
  float32x4_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  int v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float v55;
  uint64_t v56;
  float32x4_t v57;
  unsigned __int8 *v58;
  uint64_t v59;
  uint64_t v60;
  float32x4_t v61;
  uint64_t v62;
  float32x4_t v64;
  float v65;
  float32x4_t v66;
  float32x4_t v67;
  int v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  int borderSamplingWidth;
  int v73;
  uint64_t v74;
  __int32 *v75;
  __int32 *v76;
  uint64_t v77;
  uint64_t v78;
  __int32 *v79;
  __int32 *v80;
  int v81;
  int v82;
  uint64_t v83;
  __int32 *v84;
  __int32 *v85;
  uint64_t v86;
  uint64_t v87;
  __int32 *v88;
  __int32 *v89;
  int v90;
  float32x4_t v91;
  float32x4_t v92;
  float v93;
  char *v94;
  float32x4_t v95;
  float32x4_t v96;
  char v97;
  unint64_t v99;
  int maxNumberOfClusteringSamples;
  int v101;
  int v102;
  float v103;
  float v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  int v109;
  float v110;
  int v111;
  unsigned int v112;
  int v113;
  unsigned __int8 *v114;
  uint32x2_t v115;
  float32x4_t v116;
  double v117;
  float v118;
  float32x4_t v119;
  float32x4_t v120;
  uint64_t v121;
  int v122;
  int v123;
  int v124;
  uint64_t v125;
  int v126;
  int v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  __int32 *v131;
  uint64_t v132;
  uint64_t v133;
  __int32 *v134;
  int8x16_t v135;
  int8x8_t v136;
  float32x4_t v137;
  float32x4_t v138;
  uint64_t v139;
  uint64_t v140;
  float v141;
  float32x4_t v142;
  int v143;
  int v144;
  float v145;
  uint64_t v146;
  float v147;
  int v148;
  int v149;
  unsigned int v150;
  int v151;
  unsigned __int8 *v152;
  uint32x2_t v153;
  float32x4_t v154;
  double v155;
  float v156;
  float32x4_t v157;
  float32x4_t v158;
  uint64_t v159;
  int v160;
  int v161;
  int v162;
  uint64_t v163;
  int v164;
  int v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  __int32 *v169;
  uint64_t v170;
  uint64_t v171;
  __int32 *v172;
  int8x16_t v173;
  int8x8_t v174;
  float32x4_t v175;
  float32x4_t v176;
  uint64_t v177;
  int *v178;
  float v179;
  float32x4_t v180;
  int v181;
  int v182;
  float v183;
  int v184;
  int v185;
  float v186;
  int v187;
  unsigned int v188;
  int v189;
  unsigned __int8 *v190;
  uint32x2_t v191;
  float32x4_t v192;
  double v193;
  float v194;
  float32x4_t v195;
  float32x4_t v196;
  uint64_t v197;
  int v198;
  int v199;
  int v200;
  uint64_t v201;
  int v202;
  int v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  __int32 *v207;
  uint64_t v208;
  uint64_t v209;
  __int32 *v210;
  int8x16_t v211;
  int8x8_t v212;
  float32x4_t v213;
  float32x4_t v214;
  uint64_t v215;
  int *v216;
  float v217;
  float32x4_t v218;
  int v219;
  uint64_t v220;
  float v221;
  int v222;
  int v223;
  unsigned int v224;
  int v225;
  unsigned __int8 *v226;
  uint32x2_t v227;
  float32x4_t v228;
  double v229;
  float v230;
  float32x4_t v231;
  float32x4_t v232;
  uint64_t v233;
  int v234;
  int v235;
  uint64_t v236;
  int v237;
  int v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  __int32 *v242;
  uint64_t v243;
  uint64_t v244;
  __int32 *v245;
  int8x16_t v246;
  int8x8_t v247;
  float32x4_t v248;
  float32x4_t v249;
  uint64_t v250;
  uint64_t v251;
  float v252;
  float32x4_t v253;
  uint64_t v254;
  uint64_t v255;
  float32x4_t *v256;
  uint64_t v257;
  uint64_t v258;
  _BYTE *v259;
  uint64_t v260;
  uint64_t v261;
  _BYTE *v262;
  uint64_t v263;
  float *v264;
  int v265;
  float32x4_t *v266;
  int numberOfClusters;
  int numberOfClusteringSteps;
  float32x4_t *v269;
  uint64_t v270;
  uint64_t v271;
  int v272;
  float v273;
  uint64_t i;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  float clusterGroupingDistanceThreshold;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  float32x4_t v286;
  float32x4_t v287;
  float32x4_t *v288;
  void *v289;
  void *v290;
  void *v291;
  uint64_t v292;
  float32x4_t v293;
  float32x4_t v295;
  float32x4_t v296;
  float32x4_t v297;
  double v298;
  double v299;
  float32x4_t v301;
  float32x4_t v302;
  float32x4_t v303;
  float32x4_t v304;
  float32x4_t v305;
  float32x4_t v306;
  double v307;
  BOOL v308;
  float32x4_t v309;
  float32x4_t v310;
  float32x4_t v311;
  BOOL v312;
  void *v313;
  void *v314;
  void *v315;
  uint64_t v316;
  void *v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  char v321;
  void *v322;
  void *v323;
  uint64_t v324;
  uint64_t v325;
  int *v326;
  unint64_t v327;
  void *v328;
  int v329;
  float32x4_t v330;
  uint64_t v331;
  float32x4_t *v332;
  uint64_t v333;
  float32x4_t *v334;
  float32x4_t *v335;
  uint64_t v336;
  float32x4_t *v337;
  uint64_t v338;
  uint64_t v339;
  float32x4_t *v340;
  float32x4_t v341;
  unsigned __int8 *v342;
  float v343;
  float32x4_t *v344;
  float32x4_t *v345;
  uint64_t v346;
  float32x4_t v347;
  float v348;
  int v349;
  uint64_t v350;
  int v351;
  int v352;
  unint64_t v353;
  int v354;
  unsigned __int8 *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  unsigned __int8 *v360;
  uint64_t v361;
  int v362;
  unint64_t v363;
  unsigned __int8 *v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  unsigned __int8 *v370;
  _BYTE v371[320];
  uint64_t v372;
  float32x4_t *v373;
  int *v374;
  int v375;
  float32x4_t v376;
  float32x4_t v377;
  float32x4_t *v378;
  int32x4_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  ISForegroundSegmentation *v383;
  uint64_t v384;
  float32x4_t v385;
  int32x4_t v386;
  int32x4_t v387;
  float32x4_t v388;
  unsigned int v389[51];
  _QWORD v390[20];
  _QWORD v391[15];

  v6 = v4;
  v7 = *(_QWORD *)&a3;
  v8 = self;
  v9 = 0;
  v391[12] = *MEMORY[0x1E0C80C00];
  v5.i32[0] = a3 / 3;
  if (a3 >= 0)
    v10 = a3;
  else
    v10 = a3 + 1;
  LODWORD(v11) = v10 >> 1;
  v12 = v5;
  v12.i32[1] = 1;
  v391[0] = v12.i64[0];
  v391[1] = (v10 >> 1) | 0x100000000;
  LODWORD(v13) = 4 * a3 / 6;
  HIDWORD(v13) = 1;
  LODWORD(v14) = 1;
  LODWORD(v15) = 1;
  HIDWORD(v15) = a4 / 3;
  v391[2] = v13;
  v391[3] = v15;
  if (a4 >= 0)
    v16 = a4;
  else
    v16 = a4 + 1;
  v17 = v16 >> 1;
  LODWORD(v18) = 1;
  HIDWORD(v18) = v17;
  HIDWORD(v14) = 4 * a4 / 6;
  LODWORD(v19) = a3 - 2;
  v391[4] = v18;
  v391[5] = v14;
  LODWORD(v18) = a3 - 2;
  HIDWORD(v18) = a4 / 3;
  LODWORD(v20) = a3 - 2;
  HIDWORD(v20) = v17;
  HIDWORD(v19) = 4 * a4 / 6;
  v391[6] = v18;
  v391[7] = v20;
  LODWORD(v21) = a3 / 3;
  HIDWORD(v21) = a4 - 2;
  v391[8] = v19;
  v391[9] = v21;
  HIDWORD(v11) = a4 - 2;
  HIDWORD(v22) = a4 - 2;
  v391[10] = v11;
  LODWORD(v22) = 4 * a3 / 6;
  v391[11] = v22;
  v23 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  do
  {
    v24 = (unsigned __int8 *)(v4 + 4 * (int)(v391[v9] + HIDWORD(v391[v9]) * a3));
    v12.i32[0] = *v24;
    v12.i32[1] = v24[1];
    *(float32x2_t *)v12.f32 = vcvt_f32_u32(*(uint32x2_t *)v12.f32);
    LOBYTE(v21) = v24[2];
    *(float *)&v21 = (float)v21;
    v12.i32[2] = v21;
    v12 = vdivq_f32(v12, v23);
    *(float32x4_t *)&v389[4 * v9++ + 1] = v12;
  }
  while (v9 != 12);
  v25 = 0;
  v26 = 2 * a3;
  v27 = a3 - 1;
  v28 = 0uLL;
  do
  {
    v28 = vaddq_f32(v28, *(float32x4_t *)&v389[v25 + 1]);
    v25 += 4;
  }
  while (v25 != 48);
  v29 = 0;
  __asm { FMOV            V2.4S, #12.0 }
  v35 = vdivq_f32(v28, _Q2);
  v36 = 0.0;
  do
  {
    v37 = vsubq_f32(*(float32x4_t *)&v389[v29 + 1], v35);
    v38 = vmulq_f32(v37, v37);
    v38.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).f32[0]);
    v36 = v36 + (float)(v38.f32[0] * v38.f32[0]);
    v29 += 4;
  }
  while (v29 != 48);
  v39 = a4 - 1;
  LODWORD(v40) = v26 / 3;
  LODWORD(v41) = v26 / 3;
  HIDWORD(v41) = a4 / 12;
  LODWORD(v42) = v26 / 3;
  HIDWORD(v42) = a4 / 10;
  LODWORD(v43) = a3 / 3;
  HIDWORD(v43) = a4 / 10;
  v390[0] = __PAIR64__(a4 / 12, v5.u32[0]);
  v390[1] = v41;
  v390[2] = v42;
  v390[3] = v43;
  LODWORD(v44) = a3 / 12;
  LODWORD(v41) = a3 / 12;
  HIDWORD(v41) = a4 / 3;
  HIDWORD(v44) = 2 * a4 / 3;
  v390[4] = v41;
  v390[5] = v44;
  LODWORD(v44) = a3 / 10;
  LODWORD(v41) = a3 / 10;
  HIDWORD(v41) = a4 / 3;
  LODWORD(v42) = v27 - a3 / 12;
  LODWORD(v43) = v42;
  HIDWORD(v43) = a4 / 3;
  v390[6] = v41;
  v390[7] = v44;
  HIDWORD(v42) = HIDWORD(v44);
  v390[8] = v43;
  v390[9] = v42;
  LODWORD(v44) = v27 - a3 / 10;
  LODWORD(v41) = v44;
  HIDWORD(v41) = a4 / 3;
  HIDWORD(v44) = HIDWORD(v42);
  v390[10] = v41;
  v390[11] = v44;
  LODWORD(v44) = a3 / 3;
  HIDWORD(v44) = a4 - 1 - a4 / 12;
  LODWORD(v41) = v26 / 3;
  HIDWORD(v41) = HIDWORD(v44);
  v5.i32[1] = a4 - 1 - a4 / 10;
  v390[12] = v44;
  v390[13] = v41;
  HIDWORD(v40) = v5.i32[1];
  v45 = (double)a3 / 8.5;
  v46 = (double)a4 / 8.5;
  LODWORD(v42) = (int)v45;
  v47 = (int)((double)v27 - v45);
  LODWORD(v45) = (int)v45;
  HIDWORD(v45) = (int)v46;
  v390[14] = v5.i64[0];
  v390[15] = v40;
  LODWORD(v48) = v47;
  LODWORD(v40) = v47;
  HIDWORD(v40) = (int)v46;
  *(double *)&v390[16] = v45;
  v390[17] = v40;
  HIDWORD(v42) = (int)((double)(a4 - 1) - v46);
  HIDWORD(v48) = HIDWORD(v42);
  v390[18] = v42;
  v390[19] = v48;
  MEMORY[0x1E0C80A78](self);
  v56 = 0;
  v57 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  do
  {
    v58 = (unsigned __int8 *)(v6 + 4 * (int)(v390[v56] + HIDWORD(v390[v56]) * v7));
    v54.i32[0] = *v58;
    v54.i32[1] = v58[1];
    *(float32x2_t *)v54.f32 = vcvt_f32_u32(*(uint32x2_t *)v54.f32);
    LOBYTE(v55) = v58[2];
    v55 = (float)LODWORD(v55);
    v54.f32[2] = v55;
    v54 = vdivq_f32(v54, v57);
    *(float32x4_t *)&v371[16 * v56++] = v54;
  }
  while (v56 != 20);
  v59 = 0;
  v60 = (v49 * v7);
  v61 = 0uLL;
  do
  {
    v61 = vaddq_f32(v61, *(float32x4_t *)&v371[v59]);
    v59 += 16;
  }
  while (v59 != 320);
  v62 = 0;
  __asm { FMOV            V3.4S, #20.0 }
  v64 = vdivq_f32(v61, _Q3);
  v65 = 0.0;
  do
  {
    v66 = vsubq_f32(*(float32x4_t *)&v371[v62], v64);
    v67 = vmulq_f32(v66, v66);
    v67.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v67, 2), vaddq_f32(v67, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v67.f32, 1))).f32[0]);
    v65 = v65 + (float)(v67.f32[0] * v67.f32[0]);
    v62 += 16;
  }
  while (v62 != 320);
  v68 = 0;
  v69 = vsubq_f32(v53, v64);
  v70 = vmulq_f32(v69, v69);
  v71 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v70, 2), vaddq_f32(v70, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v70.f32, 1)));
  v381 = 2;
  if (sqrtf(v71.f32[0]) > 0.196078431)
  {
    v52.i32[1] = 1064308752;
    if ((float)(v52.f32[0] / 12.0) <= 0.00392156863)
    {
      *(double *)v61.i64 = (float)(v65 / 20.0);
      if (*(double *)v61.i64 <= 0.00392156863)
      {
        v381 = v51;
        v68 = v51;
      }
      else
      {
        v68 = 0;
        v381 = 2;
      }
    }
  }
  borderSamplingWidth = v8->_borderSamplingWidth;
  v61.i32[0] = *(_DWORD *)(v6 + 4 * ((int)v381 + (int)v381 * (int)v7));
  v61.i64[0] = vmovl_u8(*(uint8x8_t *)v61.f32).u64[0];
  v73 = v27 - v68;
  if (v27 - v68 <= v68)
  {
LABEL_30:
    if (borderSamplingWidth < 1)
    {
LABEL_36:
      if (v73 <= v68)
      {
LABEL_42:
        if (borderSamplingWidth < 1)
        {
LABEL_48:
          v52.f32[0] = (float)v61.u16[0];
          v71.i32[0] = v61.u16[1];
          v71.i32[1] = v61.u16[2];
          *(float32x2_t *)v71.f32 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v71.f32, (int8x8_t)0xFF000000FFLL));
          v91 = vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v52, (int8x16_t)v52, 4uLL), (int8x16_t)v71, 0xCuLL), (float32x4_t)vdupq_n_s32(0x437F0000u));
          v91.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v91, 2), vaddq_f32(v91, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v91.f32, 1))).f32[0]/ 3.0;
          v92.f32[0] = (float)(v91.f32[0] * -1.1) + 7.41;
          v93 = (float)(v91.f32[0] * -37.0) + 139.52;
          if (v8->_strict)
            v93 = v92.f32[0];
          if ((int)v60 >= 1)
          {
            *(uint64_t *)((char *)v52.i64 + 4) = v71.i64[0];
            v94 = (char *)(v6 + 3);
            do
            {
              v71.i32[0] = *(v94 - 3);
              v71.i32[1] = *(v94 - 2);
              *(float32x2_t *)v71.f32 = vcvt_f32_u32(*(uint32x2_t *)v71.f32);
              v92.i8[0] = *(v94 - 1);
              v71.f32[2] = (float)v92.u32[0];
              v95 = vsubq_f32(v71, v52);
              v96 = vmulq_f32(v95, v95);
              v92 = vaddq_f32(v96, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v96.f32, 1));
              v71 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v96, 2), v92);
              if (sqrtf(v71.f32[0]) <= v93)
                v97 = 0;
              else
                v97 = -1;
              *v94 = v97;
              v94 += 4;
              --v60;
            }
            while (v60);
          }
          return 1;
        }
        v87 = (int)v381;
        v88 = (__int32 *)(v6 + 4 * ((int)v381 + v68 * (uint64_t)(int)v7));
        while (1)
        {
          v89 = v88;
          v90 = ~(2 * v68) + v49;
          if (~v68 + v49 > v68)
            break;
LABEL_47:
          ++v87;
          ++v88;
          if (v87 >= borderSamplingWidth + (int)v381)
            goto LABEL_48;
        }
        while (1)
        {
          v52.i32[0] = *v89;
          v52 = (float32x4_t)vmovl_u8(*(uint8x8_t *)v52.f32);
          *(int16x4_t *)v52.f32 = vceq_s16(*(int16x4_t *)v52.f32, *(int16x4_t *)v61.f32);
          v52.i8[1] = v52.i8[2];
          v52.i8[2] = v52.i8[4];
          v52.i8[3] = v52.i8[4];
          v52.i16[2] = v52.i16[0];
          v52.i8[6] = v52.i8[3];
          v52.i8[7] = v52.i8[3];
          if ((vminv_u8(*(uint8x8_t *)v52.f32) & 0x80) == 0)
            break;
          v89 += (int)v7;
          if (!--v90)
            goto LABEL_47;
        }
      }
      else
      {
        v82 = ~(_DWORD)v381 + v49;
        v83 = v68;
        v84 = (__int32 *)(v6 + 4 * (v68 + (int)v7 * (uint64_t)(v82 - borderSamplingWidth)));
        while (1)
        {
          v85 = v84;
          v86 = v82 - borderSamplingWidth;
          if (borderSamplingWidth >= 1)
            break;
LABEL_41:
          ++v83;
          ++v84;
          if (v73 == (_DWORD)v83)
            goto LABEL_42;
        }
        while (1)
        {
          v52.i32[0] = *v85;
          v52 = (float32x4_t)vmovl_u8(*(uint8x8_t *)v52.f32);
          *(int16x4_t *)v52.f32 = vceq_s16(*(int16x4_t *)v52.f32, *(int16x4_t *)v61.f32);
          v52.i8[1] = v52.i8[2];
          v52.i8[2] = v52.i8[4];
          v52.i8[3] = v52.i8[4];
          v52.i16[2] = v52.i16[0];
          v52.i8[6] = v52.i8[3];
          v52.i8[7] = v52.i8[3];
          if ((vminv_u8(*(uint8x8_t *)v52.f32) & 0x80) == 0)
            break;
          ++v86;
          v85 += (int)v7;
          if (v86 >= v82)
            goto LABEL_41;
        }
      }
    }
    else
    {
      v78 = v27 - (int)v381 - borderSamplingWidth;
      v79 = (__int32 *)(v6 + 4 * (v78 + v68 * (uint64_t)(int)v7));
      while (1)
      {
        v80 = v79;
        v81 = ~(2 * v68) + v49;
        if (~v68 + v49 > v68)
          break;
LABEL_35:
        ++v78;
        ++v79;
        if (v78 >= v27 - (int)v381)
          goto LABEL_36;
      }
      while (1)
      {
        v52.i32[0] = *v80;
        v52 = (float32x4_t)vmovl_u8(*(uint8x8_t *)v52.f32);
        *(int16x4_t *)v52.f32 = vceq_s16(*(int16x4_t *)v52.f32, *(int16x4_t *)v61.f32);
        v52.i8[1] = v52.i8[2];
        v52.i8[2] = v52.i8[4];
        v52.i8[3] = v52.i8[4];
        v52.i16[2] = v52.i16[0];
        v52.i8[6] = v52.i8[3];
        v52.i8[7] = v52.i8[3];
        if ((vminv_u8(*(uint8x8_t *)v52.f32) & 0x80) == 0)
          break;
        v80 += (int)v7;
        if (!--v81)
          goto LABEL_35;
      }
    }
  }
  else
  {
    v74 = v68;
    v75 = (__int32 *)(v6 + 4 * (v68 + (int)v381 * (uint64_t)(int)v7));
    while (1)
    {
      v76 = v75;
      v77 = (int)v381;
      if (borderSamplingWidth >= 1)
        break;
LABEL_29:
      ++v74;
      ++v75;
      if (v73 == (_DWORD)v74)
        goto LABEL_30;
    }
    while (1)
    {
      v52.i32[0] = *v76;
      v52 = (float32x4_t)vmovl_u8(*(uint8x8_t *)v52.f32);
      *(int16x4_t *)v52.f32 = vceq_s16(*(int16x4_t *)v52.f32, *(int16x4_t *)v61.f32);
      v52.i8[1] = v52.i8[2];
      v52.i8[2] = v52.i8[4];
      v52.i8[3] = v52.i8[4];
      v52.i16[2] = v52.i16[0];
      v52.i8[6] = v52.i8[3];
      v52.i8[7] = v52.i8[3];
      if ((vminv_u8(*(uint8x8_t *)v52.f32) & 0x80) == 0)
        break;
      ++v77;
      v76 += (int)v7;
      if (v77 >= borderSamplingWidth + (int)v381)
        goto LABEL_29;
    }
  }
  v380 = (v49 * v7);
  v375 = v49;
  v372 = v50;
  v99 = (unint64_t)malloc_type_malloc(16 * v8->_maxNumberOfClusteringSamples, 0x1000040451B5BE8uLL);
  v378 = (float32x4_t *)v99;
  v389[0] = 10;
  maxNumberOfClusteringSamples = v8->_maxNumberOfClusteringSamples;
  v382 = v6;
  v383 = v8;
  v384 = v7;
  if (maxNumberOfClusteringSamples < 4)
  {
    v102 = 0;
  }
  else
  {
    v101 = 0;
    v102 = 0;
    v103 = (float)v68;
    v104 = (float)(int)v381;
    *(float *)v387.i32 = (float)(v7 - v68) - (float)v68;
    v105 = v7;
    v374 = (int *)(int)v7;
    v386 = vdupq_n_s32(0x437F0000u);
    v106 = v6 - 4;
    v107 = 4 * v105;
    v385 = (float32x4_t)vdupq_n_s32(0xC37F0000);
    do
    {
      v108 = rand_r(v389);
      v109 = (int)(float)(v103 + (float)((float)((float)v108 * 4.6566e-10) * *(float *)v387.i32));
      v110 = (float)(v8->_borderSamplingWidth + v381);
      v111 = rand_r(v389);
      *(float *)&v112 = v110 - v104;
      v113 = (int)(float)(v104 + (float)((float)((float)v111 * 4.6566e-10) * (float)(v110 - v104)));
      v114 = (unsigned __int8 *)(v382 + 4 * (v109 + v113 * (int)v384));
      v115.i32[0] = *v114;
      v115.i32[1] = v114[1];
      *(float32x2_t *)v116.f32 = vcvt_f32_u32(v115);
      LOBYTE(v112) = v114[2];
      v116.f32[2] = (float)v112;
      v388 = vdivq_f32(v116, (float32x4_t)v386);
      v117 = ISSegmentationMathUtils_luma(v388);
      v118 = *(float *)&v117;
      v99 = rand_r(v389);
      if ((float)((float)(int)v99 * 4.6566e-10) <= (float)((float)(v118 * -0.47619) + 1.0)
        && (v109 <= 1 ? (v121 = 1) : (v121 = v109),
            v109 + 1 < v27 ? (v122 = v109 + 1) : (v122 = v27),
            (int)v121 - 1 <= v122))
      {
        v124 = 0;
        if (v113 <= 1)
          v125 = 1;
        else
          v125 = v113;
        v126 = v125 - 1;
        if (v113 + 1 < v39)
          v127 = v113 + 1;
        else
          v127 = v39;
        v128 = v107 * (v125 - 1) + 4 * v121;
        v129 = v121 - 1;
        v130 = (v122 + 1);
        v131 = (__int32 *)(v106 + v128);
        v132 = (v127 + 1) - v125 + 1;
        v8 = v383;
        do
        {
          v133 = v132;
          v134 = v131;
          if (v126 <= v127)
          {
            do
            {
              v119.i32[0] = *v134;
              v135 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v119.f32);
              v99 = v135.u16[1];
              v120.f32[0] = (float)v135.u16[0];
              v136.i32[0] = v135.u16[1];
              v136.i32[1] = v135.u16[2];
              *(float32x2_t *)v135.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v136, (int8x8_t)0xFF000000FFLL));
              v137 = vaddq_f32(v388, vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v120, (int8x16_t)v120, 4uLL), v135, 0xCuLL), v385));
              v138 = vmulq_f32(v137, v137);
              v120 = vaddq_f32(v138, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v138.f32, 1));
              v119 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v138, 2), v120);
              *(double *)v119.i64 = sqrtf(v119.f32[0]);
              if (*(double *)v119.i64 <= 0.0431372549)
                ++v124;
              v134 = (__int32 *)((char *)v134 + v107);
              --v133;
            }
            while (v133);
          }
          ++v129;
          ++v131;
        }
        while (v129 != v130);
        if (v124 >= 6)
        {
          v119.i32[0] = LODWORD(v383->_borderNoiseScale);
          v379 = (int32x4_t)v119;
          *(float *)&v139 = ISSegmentationMathUtils_sampleNormalDistribution(v389);
          v377.i64[0] = v139;
          *(float *)&v140 = ISSegmentationMathUtils_sampleNormalDistribution(v389);
          v376.i64[0] = v140;
          v141 = ISSegmentationMathUtils_sampleNormalDistribution(v389);
          v142 = v377;
          v142.i32[1] = v376.i32[0];
          v142.f32[2] = v141;
          v378[v102++] = vaddq_f32(v388, vmulq_n_f32(v142, *(float *)v379.i32));
        }
      }
      else
      {
        v8 = v383;
      }
      ++v101;
      v123 = v8->_maxNumberOfClusteringSamples;
    }
    while (v101 < v123 / 4);
    if (v123 >= 4)
    {
      v143 = 0;
      v144 = v384 - v381;
      v145 = (float)(v384 - v381);
      *(float *)v386.i32 = (float)(v375 - v68) - v103;
      v146 = 4 * (_QWORD)v374;
      v385 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      v379 = vdupq_n_s32(0xC37F0000);
      do
      {
        v147 = (float)(v144 - v8->_borderSamplingWidth);
        v148 = (int)(float)(v147 + (float)((float)((float)rand_r(v389) * 4.6566e-10) * (float)(v145 - v147)));
        v149 = rand_r(v389);
        v150 = v386.i32[0];
        v151 = (int)(float)(v103 + (float)((float)((float)v149 * 4.6566e-10) * *(float *)v386.i32));
        v152 = (unsigned __int8 *)(v382 + 4 * (v148 + v151 * (int)v384));
        v153.i32[0] = *v152;
        v153.i32[1] = v152[1];
        *(float32x2_t *)v154.f32 = vcvt_f32_u32(v153);
        LOBYTE(v150) = v152[2];
        v154.f32[2] = (float)v150;
        v388 = vdivq_f32(v154, v385);
        v155 = ISSegmentationMathUtils_luma(v388);
        v156 = *(float *)&v155;
        v99 = rand_r(v389);
        if ((float)((float)(int)v99 * 4.6566e-10) <= (float)((float)(v156 * -0.47619) + 1.0)
          && (v148 <= 1 ? (v159 = 1) : (v159 = v148),
              v148 + 1 < v27 ? (v160 = v148 + 1) : (v160 = v27),
              (int)v159 - 1 <= v160))
        {
          v162 = 0;
          if (v151 <= 1)
            v163 = 1;
          else
            v163 = v151;
          v164 = v163 - 1;
          if (v151 + 1 < v39)
            v165 = v151 + 1;
          else
            v165 = v39;
          v166 = v146 * (v163 - 1) + 4 * v159;
          v167 = v159 - 1;
          v168 = (v160 + 1);
          v169 = (__int32 *)(v106 + v166);
          v170 = (v165 + 1) - v163 + 1;
          v8 = v383;
          do
          {
            v171 = v170;
            v172 = v169;
            if (v164 <= v165)
            {
              do
              {
                v157.i32[0] = *v172;
                v173 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v157.f32);
                v99 = v173.u16[1];
                v158.f32[0] = (float)v173.u16[0];
                v174.i32[0] = v173.u16[1];
                v174.i32[1] = v173.u16[2];
                *(float32x2_t *)v173.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v174, (int8x8_t)0xFF000000FFLL));
                v175 = vaddq_f32(v388, vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v158, (int8x16_t)v158, 4uLL), v173, 0xCuLL), (float32x4_t)v379));
                v176 = vmulq_f32(v175, v175);
                v158 = vaddq_f32(v176, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v176.f32, 1));
                v157 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v176, 2), v158);
                *(double *)v157.i64 = sqrtf(v157.f32[0]);
                if (*(double *)v157.i64 <= 0.0431372549)
                  ++v162;
                v172 = (__int32 *)((char *)v172 + v146);
                --v171;
              }
              while (v171);
            }
            ++v167;
            ++v169;
          }
          while (v167 != v168);
          if (v162 >= 6)
          {
            v157.i32[0] = LODWORD(v383->_borderNoiseScale);
            v377 = v157;
            *(float *)&v177 = ISSegmentationMathUtils_sampleNormalDistribution(v389);
            v376.i64[0] = v177;
            *(float *)&v178 = ISSegmentationMathUtils_sampleNormalDistribution(v389);
            v374 = v178;
            v179 = ISSegmentationMathUtils_sampleNormalDistribution(v389);
            v180 = v376;
            v180.i32[1] = (int)v374;
            v180.f32[2] = v179;
            v378[v102++] = vaddq_f32(v388, vmulq_n_f32(v180, v377.f32[0]));
          }
        }
        else
        {
          v8 = v383;
        }
        ++v143;
        v161 = v8->_maxNumberOfClusteringSamples;
      }
      while (v143 < v161 / 4);
      if (v161 >= 4)
      {
        v181 = 0;
        v182 = v375 - v381;
        v183 = (float)(v375 - v381);
        v385 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        v379 = vdupq_n_s32(0xC37F0000);
        do
        {
          v184 = rand_r(v389);
          v185 = (int)(float)(v103 + (float)((float)((float)v184 * 4.6566e-10) * *(float *)v387.i32));
          v186 = (float)(v182 - v8->_borderSamplingWidth);
          v187 = rand_r(v389);
          *(float *)&v188 = v183 - v186;
          v189 = (int)(float)(v186 + (float)((float)((float)v187 * 4.6566e-10) * (float)(v183 - v186)));
          v190 = (unsigned __int8 *)(v382 + 4 * (v185 + v189 * (int)v384));
          v191.i32[0] = *v190;
          v191.i32[1] = v190[1];
          *(float32x2_t *)v192.f32 = vcvt_f32_u32(v191);
          LOBYTE(v188) = v190[2];
          v192.f32[2] = (float)v188;
          v388 = vdivq_f32(v192, v385);
          v193 = ISSegmentationMathUtils_luma(v388);
          v194 = *(float *)&v193;
          v99 = rand_r(v389);
          if ((float)((float)(int)v99 * 4.6566e-10) <= (float)((float)(v194 * -0.47619) + 1.0)
            && (v185 <= 1 ? (v197 = 1) : (v197 = v185),
                v185 + 1 < v27 ? (v198 = v185 + 1) : (v198 = v27),
                (int)v197 - 1 <= v198))
          {
            v200 = 0;
            if (v189 <= 1)
              v201 = 1;
            else
              v201 = v189;
            v202 = v201 - 1;
            if (v189 + 1 < v39)
              v203 = v189 + 1;
            else
              v203 = v39;
            v204 = v146 * (v201 - 1) + 4 * v197;
            v205 = v197 - 1;
            v206 = (v198 + 1);
            v207 = (__int32 *)(v106 + v204);
            v208 = (v203 + 1) - v201 + 1;
            v8 = v383;
            do
            {
              v209 = v208;
              v210 = v207;
              if (v202 <= v203)
              {
                do
                {
                  v195.i32[0] = *v210;
                  v211 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v195.f32);
                  v99 = v211.u16[1];
                  v196.f32[0] = (float)v211.u16[0];
                  v212.i32[0] = v211.u16[1];
                  v212.i32[1] = v211.u16[2];
                  *(float32x2_t *)v211.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v212, (int8x8_t)0xFF000000FFLL));
                  v213 = vaddq_f32(v388, vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v196, (int8x16_t)v196, 4uLL), v211, 0xCuLL), (float32x4_t)v379));
                  v214 = vmulq_f32(v213, v213);
                  v196 = vaddq_f32(v214, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v214.f32, 1));
                  v195 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v214, 2), v196);
                  *(double *)v195.i64 = sqrtf(v195.f32[0]);
                  if (*(double *)v195.i64 <= 0.0431372549)
                    ++v200;
                  v210 = (__int32 *)((char *)v210 + v146);
                  --v209;
                }
                while (v209);
              }
              ++v205;
              ++v207;
            }
            while (v205 != v206);
            if (v200 >= 6)
            {
              v195.i32[0] = LODWORD(v383->_borderNoiseScale);
              v377 = v195;
              *(float *)&v215 = ISSegmentationMathUtils_sampleNormalDistribution(v389);
              v376.i64[0] = v215;
              *(float *)&v216 = ISSegmentationMathUtils_sampleNormalDistribution(v389);
              v374 = v216;
              v217 = ISSegmentationMathUtils_sampleNormalDistribution(v389);
              v218 = v376;
              v218.i32[1] = (int)v374;
              v218.f32[2] = v217;
              v378[v102++] = vaddq_f32(v388, vmulq_n_f32(v218, v377.f32[0]));
            }
          }
          else
          {
            v8 = v383;
          }
          ++v181;
          v199 = v8->_maxNumberOfClusteringSamples;
        }
        while (v181 < v199 / 4);
        if (v199 >= 4)
        {
          v219 = 0;
          v387 = vdupq_n_s32(0x437F0000u);
          v220 = v382;
          v385 = (float32x4_t)vdupq_n_s32(0xC37F0000);
          do
          {
            v221 = (float)(v8->_borderSamplingWidth + v381);
            v222 = (int)(float)(v104 + (float)((float)((float)rand_r(v389) * 4.6566e-10) * (float)(v221 - v104)));
            v223 = rand_r(v389);
            v224 = v386.i32[0];
            v225 = (int)(float)(v103 + (float)((float)((float)v223 * 4.6566e-10) * *(float *)v386.i32));
            v226 = (unsigned __int8 *)(v220 + 4 * (v222 + v225 * (int)v384));
            v227.i32[0] = *v226;
            v227.i32[1] = v226[1];
            *(float32x2_t *)v228.f32 = vcvt_f32_u32(v227);
            LOBYTE(v224) = v226[2];
            v228.f32[2] = (float)v224;
            v388 = vdivq_f32(v228, (float32x4_t)v387);
            v229 = ISSegmentationMathUtils_luma(v388);
            v230 = *(float *)&v229;
            v99 = rand_r(v389);
            if ((float)((float)(int)v99 * 4.6566e-10) <= (float)((float)(v230 * -0.47619) + 1.0)
              && (v222 <= 1 ? (v233 = 1) : (v233 = v222),
                  v222 + 1 < v27 ? (v234 = v222 + 1) : (v234 = v27),
                  (int)v233 - 1 <= v234))
            {
              v235 = 0;
              if (v225 <= 1)
                v236 = 1;
              else
                v236 = v225;
              v237 = v236 - 1;
              if (v225 + 1 < v39)
                v238 = v225 + 1;
              else
                v238 = v39;
              v239 = v146 * (v236 - 1) + 4 * v233;
              v240 = v233 - 1;
              v241 = (v234 + 1);
              v242 = (__int32 *)(v106 + v239);
              v243 = (v238 + 1) - v236 + 1;
              v8 = v383;
              do
              {
                v244 = v243;
                v245 = v242;
                if (v237 <= v238)
                {
                  do
                  {
                    v231.i32[0] = *v245;
                    v246 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v231.f32);
                    v99 = v246.u16[1];
                    v232.f32[0] = (float)v246.u16[0];
                    v247.i32[0] = v246.u16[1];
                    v247.i32[1] = v246.u16[2];
                    *(float32x2_t *)v246.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v247, (int8x8_t)0xFF000000FFLL));
                    v248 = vaddq_f32(v388, vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v232, (int8x16_t)v232, 4uLL), v246, 0xCuLL), v385));
                    v249 = vmulq_f32(v248, v248);
                    v232 = vaddq_f32(v249, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v249.f32, 1));
                    v231 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v249, 2), v232);
                    *(double *)v231.i64 = sqrtf(v231.f32[0]);
                    if (*(double *)v231.i64 <= 0.0431372549)
                      ++v235;
                    v245 = (__int32 *)((char *)v245 + v146);
                    --v244;
                  }
                  while (v244);
                }
                ++v240;
                ++v242;
              }
              while (v240 != v241);
              if (v235 >= 6)
              {
                v231.i32[0] = LODWORD(v383->_borderNoiseScale);
                v379 = (int32x4_t)v231;
                *(float *)&v250 = ISSegmentationMathUtils_sampleNormalDistribution(v389);
                v377.i64[0] = v250;
                *(float *)&v251 = ISSegmentationMathUtils_sampleNormalDistribution(v389);
                v376.i64[0] = v251;
                v252 = ISSegmentationMathUtils_sampleNormalDistribution(v389);
                v253 = v377;
                v253.i32[1] = v376.i32[0];
                v253.f32[2] = v252;
                v378[v102++] = vaddq_f32(v388, vmulq_n_f32(v253, *(float *)v379.i32));
              }
            }
            else
            {
              v8 = v383;
            }
            ++v219;
          }
          while (v219 < v8->_maxNumberOfClusteringSamples / 4);
        }
      }
    }
  }
  v254 = MEMORY[0x1E0C80A78](v99);
  v256 = (float32x4_t *)&v371[-16 * v255];
  v257 = MEMORY[0x1E0C80A78](v254);
  v259 = &v371[-16 * v258];
  v260 = MEMORY[0x1E0C80A78](v257);
  v262 = &v371[-16 * v261];
  MEMORY[0x1E0C80A78](v260);
  v264 = (float *)&v371[-((v263 + 15) & 0x7FFFFFFF0)];
  v266 = (float32x4_t *)malloc_type_malloc(4 * v265 * v102, 0x100004052888210uLL);
  numberOfClusters = v8->_numberOfClusters;
  numberOfClusteringSteps = v8->_numberOfClusteringSteps;
  v269 = v378;
  v379.i64[0] = (uint64_t)v259;
  v376.i64[0] = (uint64_t)v262;
  ISSegmentationMathUtils_gmm(v102, numberOfClusters, numberOfClusteringSteps, v378, v256, (uint64_t)v259, (uint64_t)v262, v264, v266);
  free(v269);
  free(v266);
  v271 = v8->_numberOfClusters;
  if ((int)v271 <= 1)
  {
    v272 = 0;
  }
  else
  {
    v272 = 0;
    v273 = *v264;
    for (i = 1; i != v271; ++i)
    {
      if (v264[i] > v273)
      {
        v272 = i;
        v273 = v264[i];
      }
    }
  }
  v275 = MEMORY[0x1E0C80A78](v270);
  v377.i64[0] = (uint64_t)&v371[-v276];
  v277 = MEMORY[0x1E0C80A78](v275);
  v374 = (int *)&v371[-((4 * v271 + 15) & 0x7FFFFFFF0)];
  v278 = MEMORY[0x1E0C80A78](v277);
  v378 = (float32x4_t *)&v371[-16 * v271];
  MEMORY[0x1E0C80A78](v278);
  v373 = (float32x4_t *)&v371[-16 * v279];
  clusterGroupingDistanceThreshold = v8->_clusterGroupingDistanceThreshold;
  if ((int)v271 >= 1)
  {
    v281 = 0;
    v282 = v379.i64[0] + 32;
    v283 = v377.i64[0];
    do
    {
      v284 = 0;
      v285 = v379.i64[0] + 48 * v281;
      v286 = *(float32x4_t *)(v285 + 32);
      v387 = *(int32x4_t *)(v285 + 16);
      v388 = v286;
      v287 = *(float32x4_t *)v285;
      v385 = v256[v281];
      v386 = (int32x4_t)v287;
      v288 = (float32x4_t *)v282;
      do
      {
        *(float *)(v283 + 4 * v284) = ISSegmentationMathUtils_bhattacharyyaDistance(v385, (float32x4_t)v386, (float32x4_t)v387, v388, v256[v284], v288[-2], v288[-1], *v288);
        ++v284;
        v288 += 3;
      }
      while (v271 != v284);
      ++v281;
      v283 += 4 * v271;
    }
    while (v281 != v271);
  }
  v289 = (void *)objc_opt_new();
  v290 = (void *)objc_opt_new();
  v291 = (void *)objc_opt_new();
  if ((int)v271 >= 1)
  {
    v292 = 0;
    v293 = v256[v272];
    __asm { FMOV            V0.4S, #-1.0 }
    v295 = vaddq_f32(v293, _Q0);
    v296 = vmulq_f32(v295, v295);
    v388 = v293;
    v297 = vmulq_f32(v293, v293);
    v298 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v296, 2), vaddq_f32(v296, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v296.f32, 1))).f32[0])* 0.19;
    v299 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v297, 2), vaddq_f32(v297, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v297.f32, 1))).f32[0])* 0.19;
    __asm { FMOV            V0.4S, #1.0 }
    v379 = (int32x4_t)_Q0;
    do
    {
      v387 = (int32x4_t)v256[v292];
      *(double *)v301.i64 = ISSegmentationMathUtils_clampedProject((float32x4_t)v387, v388, (float32x4_t)v379);
      v386 = (int32x4_t)v301;
      *(double *)v302.i64 = ISSegmentationMathUtils_clampedProject((float32x4_t)v387, v388, (float32x4_t)0);
      v303 = vsubq_f32((float32x4_t)v387, (float32x4_t)v386);
      v304 = vmulq_f32(v303, v303);
      _NF = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v304, 2), vaddq_f32(v304, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v304.f32, 1))).f32[0]) < 0.0196078431;
      v305 = vsubq_f32(v388, (float32x4_t)v386);
      v306 = vmulq_f32(v305, v305);
      v307 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v306, 2), vaddq_f32(v306, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v306.f32, 1))).f32[0]);
      v308 = !_NF || v298 <= v307;
      if (!v308
        || ((v309 = vsubq_f32((float32x4_t)v387, v302),
             v310 = vmulq_f32(v309, v309),
             v311 = vsubq_f32(v388, v302),
             v302 = vmulq_f32(v311, v311),
             *(double *)v302.i64 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v302, 2), vaddq_f32(v302, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v302.f32, 1))).f32[0]), sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v310, 2), vaddq_f32(v310, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v310.f32, 1))).f32[0]) < 0.0196078431)? (v312 = v299 <= *(double *)v302.i64): (v312 = 1), !v312))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v292, *(double *)v302.i64);
        v313 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v290, "addObject:", v313);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v292);
        v314 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v291, "addObject:", v314);

      }
      ++v292;
    }
    while (v271 != v292);
  }
  if (objc_msgSend(v291, "count"))
  {
    v385.i64[0] = (uint64_t)v289;
    do
    {
      objc_msgSend(v291, "lastObject");
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      v316 = objc_msgSend(v315, "intValue");

      objc_msgSend(v291, "removeLastObject");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v316);
      v317 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v289, "addObject:", v317);

      if ((int)v271 >= 1)
      {
        v318 = 0;
        v319 = v377.i64[0] + 4 * (int)v316 * (int)v271;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v318);
          v320 = (void *)objc_claimAutoreleasedReturnValue();
          v321 = objc_msgSend(v290, "containsObject:", v320);

          if ((v321 & 1) == 0 && *(float *)(v319 + 4 * v318) <= clusterGroupingDistanceThreshold)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v318);
            v322 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v290, "addObject:", v322);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v318);
            v323 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v291, "addObject:", v323);

          }
          ++v318;
        }
        while (v271 != v318);
      }
      v324 = objc_msgSend(v291, "count");
      v289 = (void *)v385.i64[0];
    }
    while (v324);
  }
  v325 = objc_msgSend(v289, "count");
  v326 = v374;
  if (v325)
  {
    v327 = 0;
    do
    {
      objc_msgSend(v289, "objectAtIndexedSubscript:", v327);
      v328 = (void *)objc_claimAutoreleasedReturnValue();
      v326[v327] = objc_msgSend(v328, "intValue");

      ++v327;
    }
    while (objc_msgSend(v289, "count") > v327);
  }
  v329 = objc_msgSend(v289, "count");

  v331 = v376.i64[0];
  v332 = v373;
  if (v329 >= 1)
  {
    v333 = v329;
    v334 = v378;
    v335 = v373;
    do
    {
      v336 = *v326++;
      *v334++ = v256[v336];
      v337 = (float32x4_t *)(v331 + 48 * (int)v336);
      v330 = v337[1];
      *v335 = *v337;
      v335[1] = v330;
      v335[2] = v337[2];
      v335 += 3;
      --v333;
    }
    while (v333);
  }
  v338 = v382;
  if ((int)v380 >= 1)
  {
    v339 = 0;
    v340 = v332 + 2;
    v341 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    v387 = (int32x4_t)v341;
    do
    {
      if (v329 < 1)
      {
        v343 = 1.0;
      }
      else
      {
        v342 = (unsigned __int8 *)(v338 + 4 * v339);
        v341.i32[0] = *v342;
        v341.i32[1] = v342[1];
        *(float32x2_t *)v341.f32 = vcvt_f32_u32(*(uint32x2_t *)v341.f32);
        v330.i8[0] = v342[2];
        v341.f32[2] = (float)v330.u32[0];
        v388 = vdivq_f32(v341, (float32x4_t)v387);
        v343 = 1.0;
        v344 = v378;
        v345 = v340;
        v346 = v329;
        do
        {
          v347 = *v344++;
          v348 = ISSegmentationMathUtils_squaredMahalanobisDistance_inversedCovariance(v388, v347, v345[-2], v345[-1], *v345);
          v343 = v343 * ISSegmentationMathUtils_chi2cdf3(v348);
          v345 += 3;
          --v346;
        }
        while (v346);
      }
      *(_BYTE *)(v338 + 4 * v339++ + 3) = (int)(float)(v343 * 255.0);
    }
    while (v339 != v380);
  }
  v349 = v383->_borderSamplingWidth;
  if ((int)v384 < 1)
  {
    v352 = 0;
    v351 = 0;
    v354 = v375;
  }
  else
  {
    v350 = 0;
    v351 = 0;
    v352 = 0;
    v353 = v338 + 4 * (int)v381 * (unint64_t)v384 + 3;
    v354 = v375;
    do
    {
      if (v349 >= 1)
      {
        v355 = (unsigned __int8 *)v353;
        v356 = (int)v381;
        do
        {
          if (v383->_BOOLeanThreshold >= *v355)
            ++v351;
          else
            ++v352;
          ++v356;
          v355 += 4 * v384;
        }
        while (v356 < v349 + (int)v381);
      }
      ++v350;
      v353 += 4;
    }
    while (v350 != v384);
  }
  if (v349 >= 1)
  {
    v357 = (int)v384 - (int)v381 - v349;
    v358 = v338 + 4 * v357 + 3;
    do
    {
      if (v354 >= 1)
      {
        v359 = v354;
        v360 = (unsigned __int8 *)v358;
        do
        {
          if (v383->_BOOLeanThreshold >= *v360)
            ++v351;
          else
            ++v352;
          v360 += 4 * (int)v384;
          --v359;
        }
        while (v359);
      }
      ++v357;
      v358 += 4;
    }
    while (v357 < (int)v384 - (int)v381);
  }
  if ((int)v384 >= 1)
  {
    v361 = 0;
    v362 = v354 - v381;
    v363 = v338 + 4 * (v354 - (int)v381 - v349) * (unint64_t)v384 + 3;
    do
    {
      if (v349 >= 1)
      {
        v364 = (unsigned __int8 *)v363;
        v365 = v362 - v349;
        do
        {
          if (v383->_BOOLeanThreshold >= *v364)
            ++v351;
          else
            ++v352;
          ++v365;
          v364 += 4 * v384;
        }
        while (v365 < v362);
      }
      ++v361;
      v363 += 4;
    }
    while (v361 != v384);
  }
  if (v349 >= 1)
  {
    v366 = (int)v381;
    v367 = v349 + (int)v381;
    v368 = v338 + 4 * (int)v381 + 3;
    do
    {
      if (v354 >= 1)
      {
        v369 = v354;
        v370 = (unsigned __int8 *)v368;
        do
        {
          if (v383->_BOOLeanThreshold >= *v370)
            ++v351;
          else
            ++v352;
          v370 += 4 * (int)v384;
          --v369;
        }
        while (v369);
      }
      ++v366;
      v368 += 4;
    }
    while (v366 < v367);
  }
  return v352 <= v351;
}

@end
