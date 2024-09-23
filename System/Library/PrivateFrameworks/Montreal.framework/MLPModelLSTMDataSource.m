@implementation MLPModelLSTMDataSource

- (MLPModelLSTMDataSource)initWithColumns:(unint64_t)a3 rows:(unint64_t)a4 lstmInputSize:(unint64_t)a5 lstmOutputSize:(unint64_t)a6 weightID:(unint64_t)a7 neuronType:(int)a8 neuronA:(float)a9 neuronB:(float)a10 initialWeights_0:(float *)a11 initialWeights_1:(float *)a12 bias_0:(float *)a13 bias_1:(float *)a14 weightAttributes:(unint64_t)a15 deviceHandler:(id)a16
{
  uint64_t v18;
  id v25;
  MLPModelLSTMDataSource *v26;
  const char *v27;
  MLPModelLSTMDataSource *v28;
  uint64_t v29;
  MPSCNNConvolutionDescriptor *desc;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  unint64_t v40;
  size_t v41;
  void *v42;
  float *begin;
  vector<float, std::allocator<float>> *p_weight;
  char *v45;
  float *v46;
  float *v47;
  float *v48;
  vector<float, std::allocator<float>> *p_bias;
  objc_super v51;

  v18 = *(_QWORD *)&a8;
  v25 = a16;
  v51.receiver = self;
  v51.super_class = (Class)MLPModelLSTMDataSource;
  v26 = -[MLPModelLSTMDataSource init](&v51, sel_init);
  v28 = v26;
  if (!v26)
    goto LABEL_16;
  v26->_weightID = a7;
  v26->_columns = a3;
  v26->_rows = a4;
  v26->_lstmInputSize = a5;
  v26->_lstmOutputSize = a6;
  objc_msgSend_cnnConvolutionDescriptorWithKernelWidth_kernelHeight_inputFeatureChannels_outputFeatureChannels_(MEMORY[0x1E0CC6CB0], v27, 1, 1, a3, a4);
  v29 = objc_claimAutoreleasedReturnValue();
  desc = v28->_desc;
  v28->_desc = (MPSCNNConvolutionDescriptor *)v29;

  *(float *)&v31 = a9;
  *(float *)&v32 = a10;
  objc_msgSend_setNeuronType_parameterA_parameterB_(v28->_desc, v33, v18, v34, v31, v32);
  objc_msgSend_setStrideInPixelsX_(v28->_desc, v35, 1, v36);
  objc_msgSend_setStrideInPixelsY_(v28->_desc, v37, 1, v38);
  v40 = a4 * a3;
  if (a4 * a3)
  {
    if (v40 >> 62)
      sub_19C07DA0C();
    v41 = 4 * v40;
    v42 = operator new(4 * v40);
    v40 = (unint64_t)v42 + 4 * v40;
    bzero(v42, v41);
    p_weight = &v28->_weight;
    begin = v28->_weight.__begin_;
    if (begin)
      goto LABEL_5;
  }
  else
  {
    v42 = 0;
    p_weight = &v28->_weight;
    begin = v28->_weight.__begin_;
    if (begin)
    {
LABEL_5:
      v28->_weight.__end_ = begin;
      operator delete(begin);
      p_weight->__begin_ = 0;
      p_weight->__end_ = 0;
      p_weight->__end_cap_.__value_ = 0;
    }
  }
  v28->_weight.__begin_ = (float *)v42;
  v28->_weight.__end_ = (float *)v40;
  v28->_weight.__end_cap_.__value_ = (float *)v40;
  if (a4)
  {
    if (a4 >> 62)
      sub_19C07DA0C();
    v45 = (char *)operator new(4 * a4);
    v46 = (float *)&v45[4 * a4];
    bzero(v45, 4 * a4);
    v47 = a11;
    p_bias = &v28->_bias;
    v48 = v28->_bias.__begin_;
    if (!v48)
      goto LABEL_10;
  }
  else
  {
    v46 = 0;
    v45 = 0;
    v47 = a11;
    p_bias = &v28->_bias;
    v48 = v28->_bias.__begin_;
    if (!v48)
      goto LABEL_10;
  }
  v28->_bias.__end_ = v48;
  operator delete(v48);
  p_bias->__begin_ = 0;
  p_bias->__end_ = 0;
  p_bias->__end_cap_.__value_ = 0;
LABEL_10:
  v28->_bias.__begin_ = (float *)v45;
  v28->_bias.__end_ = v46;
  v28->_bias.__end_cap_.__value_ = v46;
  if (v47 || a12 || a13 || a14)
    objc_msgSend_loadWithInitialWeights_0_initialWeights_1_bias_0_bias_1_weightAttributes_(v28, v39, (uint64_t)v47, (uint64_t)a12, a13, a14, a15);
  else
    objc_msgSend_initializeWeightsAndBiases_(v28, v39, (uint64_t)v25, 0);
LABEL_16:

  return v28;
}

- (void)initializeWeightsAndBiases:(id)a3
{
  float v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  int8x8_t v10;
  int8x8_t v11;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t i;
  _QWORD *v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  int32x2_t v29;
  int32x2_t v30;
  int8x8_t v31;
  float32x2_t v32;
  float v33;
  float v34;
  float v35;
  unint64_t j;
  _QWORD *v37;
  float32x2_t v38;
  uint64_t v39;
  float v40;
  char v41;

  v37 = a3;
  v8 = 0;
  v9 = 0;
  v39 = 0x3CA3D70A00000000;
  v41 = 0;
  v10 = (int8x8_t)vdup_n_s32(0x9D2C5680);
  v11 = (int8x8_t)vdup_n_s32(0xEFC60000);
  __asm { FMOV            V12.2S, #-1.0 }
  while (objc_msgSend_columns(self, v5, v6, v7) > v9)
  {
    for (i = 0; objc_msgSend_rows(self, v17, v18, v19) > i; ++i)
    {
      if (v8)
      {
        v8 = 0;
        v41 = 0;
        v35 = v3;
      }
      else
      {
        v21 = v37 + 1;
        v22 = v37[313];
        v23 = *((_DWORD *)v37 + v22 + 2);
        do
        {
          v24 = (v22 + 1) % 0x270;
          v25 = 4 * v24;
          v26 = *((_DWORD *)v21 + (v22 + 397) % 0x270) ^ ((*((_DWORD *)v21 + v24) & 0x7FFFFFFE | v23 & 0x80000000) >> 1) ^ ((int)(*((_DWORD *)v21 + v24) << 31) >> 31) & 0x9908B0DF;
          *((_DWORD *)v21 + v22) = v26;
          if (v24 < 0x26F)
            v22 = v24 + 1;
          else
            v22 = v24 - 623;
          if (v24 >= 0xE3)
            v27 = -227;
          else
            v27 = 397;
          v23 = *((_DWORD *)v21 + v22);
          v28 = *((_DWORD *)v21 + v27 + v24) ^ ((v23 & 0x7FFFFFFE | *((_DWORD *)v21 + v24) & 0x80000000) >> 1) ^ (v23 << 31 >> 31) & 0x9908B0DF;
          *(_DWORD *)((char *)v21 + v25) = v28;
          v29 = (int32x2_t)veor_s8((int8x8_t)vshr_n_u32((uint32x2_t)__PAIR64__(v26, v28), 0xBuLL), (int8x8_t)__PAIR64__(v26, v28));
          v30 = (int32x2_t)veor_s8(vand_s8((int8x8_t)vshl_n_s32(v29, 7uLL), v10), (int8x8_t)v29);
          v31 = veor_s8(vand_s8((int8x8_t)vshl_n_s32(v30, 0xFuLL), v11), (int8x8_t)v30);
          v32 = vmla_f32(_D12, vcvt_f32_u32((uint32x2_t)veor_s8((int8x8_t)vshr_n_u32((uint32x2_t)v31, 0x12uLL), v31)), (float32x2_t)0x3000000030000000);
          v33 = vaddv_f32(vmul_f32(v32, v32));
        }
        while (v33 > 1.0 || v33 == 0.0);
        v37[313] = v22;
        v38 = v32;
        v34 = sqrtf((float)(logf(v33) * -2.0) / v33);
        v3 = v34 * v38.f32[0];
        v40 = v34 * v38.f32[0];
        v8 = 1;
        v41 = 1;
        v35 = vmuls_lane_f32(v34, v38, 1);
      }
      self->_weight.__begin_[i + objc_msgSend_rows(self, v5, v6, v7) * v9] = v35 * 0.02;
    }
    ++v9;
  }
  for (j = 0; objc_msgSend_rows(self, v17, v18, v19) > j; ++j)
    self->_bias.__begin_[j] = sub_19C16E4D0((uint64_t)&v39, (uint64_t)(v37 + 1), (float *)&v39);

}

- (unsigned)dataType
{
  return 268435488;
}

- (id)descriptor
{
  return self->_desc;
}

- (void)weights
{
  return self->_weight.__begin_;
}

- (float)biasTerms
{
  if (self->_bias.__end_ == self->_bias.__begin_)
    return 0;
  else
    return self->_bias.__begin_;
}

- (unint64_t)weight_size
{
  return self->_weight.__end_ - self->_weight.__begin_;
}

- (unint64_t)bias_size
{
  return self->_bias.__end_ - self->_bias.__begin_;
}

- (BOOL)load
{
  return 1;
}

- (void)purge
{
  self->_weight.__end_ = self->_weight.__begin_;
  self->_bias.__end_ = self->_bias.__begin_;
}

- (id)label
{
  return CFSTR("MPSCNNWeight");
}

- (void)loadWithInitialWeights_0:(float *)a3 initialWeights_1:(float *)a4 bias_0:(float *)a5 bias_1:(float *)a6 weightAttributes:(unint64_t)a7
{
  char v7;
  float *v11;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  float v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  float v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  float v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  float v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  float v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  float v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  unint64_t v197;
  float v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  unint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  unint64_t v224;
  float v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  unint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  unint64_t v251;
  float v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  unint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  unint64_t v284;
  float *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  unint64_t v289;
  float v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  unint64_t v297;
  unint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  unint64_t v329;
  float *v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  unint64_t v334;
  float v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  unint64_t v360;
  float *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  unint64_t v365;
  float v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  unint64_t v373;
  unint64_t v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  const char *v399;
  uint64_t v400;
  uint64_t v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  unint64_t v405;
  float *v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  unint64_t v410;
  float v411;
  const char *v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  const char *v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  const char *v428;
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
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  unint64_t v442;
  float *v443;
  const char *v444;
  uint64_t v445;
  uint64_t v446;
  unint64_t v447;
  float v448;
  const char *v449;
  uint64_t v450;
  uint64_t v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  const char *v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  const char *v470;
  uint64_t v471;
  uint64_t v472;
  const char *v473;
  uint64_t v474;
  uint64_t v475;
  unint64_t v476;
  float *v477;
  uint64_t v478;
  const char *v479;
  uint64_t v480;
  uint64_t v481;
  unint64_t v482;
  float v483;
  const char *v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
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
  uint64_t v498;
  uint64_t v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  unint64_t v508;
  float *v509;
  const char *v510;
  uint64_t v511;
  uint64_t v512;
  unint64_t v513;
  float v514;
  const char *v515;
  uint64_t v516;
  uint64_t v517;
  const char *v518;
  uint64_t v519;
  uint64_t v520;
  unint64_t v521;
  const char *v522;
  uint64_t v523;
  uint64_t v524;
  void *v525;
  uint64_t v526;
  void *v527;
  uint64_t v528;
  const char *v529;
  uint64_t v530;
  void *v531;
  const char *v532;
  id v533;

  v7 = a7;
  v11 = a3;
  v16 = a7 & 0x10;
  switch(objc_msgSend_weightID(self, a2, (uint64_t)a3, (uint64_t)a4))
  {
    case 3:
      if ((v7 & 0x20) != 0)
      {
        objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        objc_msgSend_lstmInputSize(self, v229, v230, v231);
        objc_msgSend_lstmOutputSize(self, v232, v233, v234);
        v238 = objc_msgSend_lstmInputSize(self, v235, v236, v237);
        v242 = objc_msgSend_lstmOutputSize(self, v239, v240, v241);
        if (objc_msgSend_rows(self, v243, v244, v245))
        {
          v246 = 0;
          v247 = 4 * (v242 + v238);
          do
          {
            if (objc_msgSend_columns(self, v29, v30, v31))
            {
              v251 = 0;
              do
              {
                v252 = v11[v251];
                self->_weight.__begin_[v251 + v246 * objc_msgSend_columns(self, v248, v249, v250)] = v252;
                ++v251;
              }
              while (objc_msgSend_columns(self, v253, v254, v255) > v251);
            }
            ++v246;
            v11 = (float *)((char *)v11 + v247);
          }
          while (objc_msgSend_rows(self, v248, v249, v250) > v246);
        }
      }
      else
      {
        objc_msgSend_lstmInputSize(self, v13, v14, v15);
        objc_msgSend_lstmOutputSize(self, v17, v18, v19);
        objc_msgSend_lstmOutputSize(self, v20, v21, v22);
        objc_msgSend_lstmOutputSize(self, v23, v24, v25);
        if (objc_msgSend_rows(self, v26, v27, v28))
        {
          v32 = 0;
          v33 = 0;
          do
          {
            if (objc_msgSend_columns(self, v29, v30, v31))
            {
              v37 = 0;
              do
              {
                v38 = v11[v33 + v37];
                self->_weight.__begin_[v37 + v32 * objc_msgSend_columns(self, v34, v35, v36)] = v38;
                ++v37;
              }
              while (objc_msgSend_columns(self, v39, v40, v41) > v37);
              v33 += v37;
            }
            ++v32;
          }
          while (objc_msgSend_rows(self, v34, v35, v36) > v32);
        }
      }
      if (objc_msgSend_rows(self, v29, v30, v31))
      {
        v259 = 0;
        do
        {
          objc_msgSend_lstmOutputSize(self, v256, v257, v258);
          self->_bias.__begin_[v259] = a5[v259];
          if ((v7 & 0x80) == 0)
          {
            objc_msgSend_lstmOutputSize(self, v260, v261, v262);
            self->_bias.__begin_[v259] = self->_bias.__begin_[v259] + a6[v259];
          }
          ++v259;
        }
        while (objc_msgSend_rows(self, v260, v261, v262) > v259);
      }
      break;
    case 4:
      if ((v7 & 0x20) != 0)
      {
        objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        objc_msgSend_lstmInputSize(self, v452, v453, v454);
        objc_msgSend_lstmOutputSize(self, v455, v456, v457);
        v461 = objc_msgSend_lstmInputSize(self, v458, v459, v460);
        v465 = objc_msgSend_lstmInputSize(self, v462, v463, v464);
        v469 = objc_msgSend_lstmOutputSize(self, v466, v467, v468);
        if (objc_msgSend_rows(self, v470, v471, v472))
        {
          v476 = 0;
          v477 = &v11[v461];
          v478 = 4 * (v469 + v465);
          do
          {
            if (objc_msgSend_columns(self, v473, v474, v475))
            {
              v482 = 0;
              do
              {
                v483 = v477[v482];
                self->_weight.__begin_[v482 + v476 * objc_msgSend_columns(self, v479, v480, v481)] = v483;
                ++v482;
              }
              while (objc_msgSend_columns(self, v484, v485, v486) > v482);
            }
            ++v476;
            v477 = (float *)((char *)v477 + v478);
          }
          while (objc_msgSend_rows(self, v479, v480, v481) > v476);
        }
      }
      else
      {
        objc_msgSend_lstmInputSize(self, v13, v14, v15);
        objc_msgSend_lstmOutputSize(self, v177, v178, v179);
        objc_msgSend_lstmOutputSize(self, v180, v181, v182);
        objc_msgSend_lstmOutputSize(self, v183, v184, v185);
        if (objc_msgSend_rows(self, v186, v187, v188))
        {
          v192 = 0;
          v193 = 0;
          do
          {
            if (objc_msgSend_columns(self, v189, v190, v191))
            {
              v197 = 0;
              do
              {
                v198 = a4[v193 + v197];
                self->_weight.__begin_[v197 + v192 * objc_msgSend_columns(self, v194, v195, v196)] = v198;
                ++v197;
              }
              while (objc_msgSend_columns(self, v199, v200, v201) > v197);
              v193 += v197;
            }
            ++v192;
          }
          while (objc_msgSend_rows(self, v194, v195, v196) > v192);
        }
      }
      break;
    case 7:
      if ((v7 & 0x20) != 0)
      {
        v263 = objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        v267 = objc_msgSend_lstmInputSize(self, v264, v265, v266);
        v271 = objc_msgSend_lstmOutputSize(self, v268, v269, v270);
        v275 = objc_msgSend_lstmInputSize(self, v272, v273, v274);
        v279 = objc_msgSend_lstmOutputSize(self, v276, v277, v278);
        if (objc_msgSend_rows(self, v280, v281, v282))
        {
          v283 = v263;
          v284 = 0;
          v285 = &v11[(v283 << ((v7 & 0x10) >> 4)) * (v271 + v267)];
          do
          {
            if (objc_msgSend_columns(self, v56, v57, v58))
            {
              v289 = 0;
              do
              {
                v290 = v285[v289];
                self->_weight.__begin_[v289 + v284 * objc_msgSend_columns(self, v286, v287, v288)] = v290;
                ++v289;
              }
              while (objc_msgSend_columns(self, v291, v292, v293) > v289);
            }
            ++v284;
            v285 += v279 + v275;
          }
          while (objc_msgSend_rows(self, v286, v287, v288) > v284);
        }
      }
      else
      {
        v42 = objc_msgSend_lstmInputSize(self, v13, v14, v15);
        v46 = objc_msgSend_lstmOutputSize(self, v43, v44, v45);
        objc_msgSend_lstmOutputSize(self, v47, v48, v49);
        objc_msgSend_lstmOutputSize(self, v50, v51, v52);
        if (objc_msgSend_rows(self, v53, v54, v55))
        {
          v59 = 0;
          v60 = (v42 << ((v7 & 0x10) >> 4)) * v46;
          do
          {
            if (objc_msgSend_columns(self, v56, v57, v58))
            {
              v64 = 0;
              do
              {
                v65 = v11[v60 + v64];
                self->_weight.__begin_[v64 + v59 * objc_msgSend_columns(self, v61, v62, v63)] = v65;
                ++v64;
              }
              while (objc_msgSend_columns(self, v66, v67, v68) > v64);
              v60 += v64;
            }
            ++v59;
          }
          while (objc_msgSend_rows(self, v61, v62, v63) > v59);
        }
      }
      if (objc_msgSend_rows(self, v56, v57, v58))
      {
        v297 = 0;
        v298 = (unint64_t)(v7 & 0x10) >> 4;
        do
        {
          self->_bias.__begin_[v297] = a5[v297 + (objc_msgSend_lstmOutputSize(self, v294, v295, v296) << v298)];
          if ((v7 & 0x80) == 0)
            self->_bias.__begin_[v297] = self->_bias.__begin_[v297]
                                       + a6[v297 + (objc_msgSend_lstmOutputSize(self, v299, v300, v301) << v298)];
          ++v297;
        }
        while (objc_msgSend_rows(self, v299, v300, v301) > v297);
      }
      break;
    case 8:
      if ((v7 & 0x20) != 0)
      {
        v302 = objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        v306 = objc_msgSend_lstmInputSize(self, v303, v304, v305);
        v310 = objc_msgSend_lstmOutputSize(self, v307, v308, v309);
        v314 = objc_msgSend_lstmInputSize(self, v311, v312, v313);
        v318 = objc_msgSend_lstmInputSize(self, v315, v316, v317);
        v322 = objc_msgSend_lstmOutputSize(self, v319, v320, v321);
        if (objc_msgSend_rows(self, v323, v324, v325))
        {
          v329 = 0;
          v330 = &v11[(v302 << (v16 >> 4)) * (v310 + v306) + v314];
          do
          {
            if (objc_msgSend_columns(self, v326, v327, v328))
            {
              v334 = 0;
              do
              {
                v335 = v330[v334];
                self->_weight.__begin_[v334 + v329 * objc_msgSend_columns(self, v331, v332, v333)] = v335;
                ++v334;
              }
              while (objc_msgSend_columns(self, v336, v337, v338) > v334);
            }
            ++v329;
            v330 += v322 + v318;
          }
          while (objc_msgSend_rows(self, v331, v332, v333) > v329);
        }
      }
      else
      {
        objc_msgSend_lstmInputSize(self, v13, v14, v15);
        objc_msgSend_lstmOutputSize(self, v69, v70, v71);
        v75 = objc_msgSend_lstmOutputSize(self, v72, v73, v74);
        v79 = objc_msgSend_lstmOutputSize(self, v76, v77, v78);
        if (objc_msgSend_rows(self, v80, v81, v82))
        {
          v86 = 0;
          v87 = (v75 << (v16 >> 4)) * v79;
          do
          {
            if (objc_msgSend_columns(self, v83, v84, v85))
            {
              v91 = 0;
              do
              {
                v92 = a4[v87 + v91];
                self->_weight.__begin_[v91 + v86 * objc_msgSend_columns(self, v88, v89, v90)] = v92;
                ++v91;
              }
              while (objc_msgSend_columns(self, v93, v94, v95) > v91);
              v87 += v91;
            }
            ++v86;
          }
          while (objc_msgSend_rows(self, v88, v89, v90) > v86);
        }
      }
      break;
    case 11:
      if ((v7 & 0x20) != 0)
      {
        v339 = objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        v343 = objc_msgSend_lstmInputSize(self, v340, v341, v342);
        v347 = objc_msgSend_lstmOutputSize(self, v344, v345, v346);
        v351 = objc_msgSend_lstmInputSize(self, v348, v349, v350);
        v355 = objc_msgSend_lstmOutputSize(self, v352, v353, v354);
        if (objc_msgSend_rows(self, v356, v357, v358))
        {
          v359 = v339;
          v360 = 0;
          v361 = &v11[(v359 << (((v7 & 0x10) >> 4) ^ 1u)) * (v347 + v343)];
          do
          {
            if (objc_msgSend_columns(self, v110, v111, v112))
            {
              v365 = 0;
              do
              {
                v366 = v361[v365];
                self->_weight.__begin_[v365 + v360 * objc_msgSend_columns(self, v362, v363, v364)] = v366;
                ++v365;
              }
              while (objc_msgSend_columns(self, v367, v368, v369) > v365);
            }
            ++v360;
            v361 += v355 + v351;
          }
          while (objc_msgSend_rows(self, v362, v363, v364) > v360);
        }
      }
      else
      {
        v96 = objc_msgSend_lstmInputSize(self, v13, v14, v15);
        v100 = objc_msgSend_lstmOutputSize(self, v97, v98, v99);
        objc_msgSend_lstmOutputSize(self, v101, v102, v103);
        objc_msgSend_lstmOutputSize(self, v104, v105, v106);
        if (objc_msgSend_rows(self, v107, v108, v109))
        {
          v113 = 0;
          v114 = (v96 << (((v7 & 0x10) >> 4) ^ 1u)) * v100;
          do
          {
            if (objc_msgSend_columns(self, v110, v111, v112))
            {
              v118 = 0;
              do
              {
                v119 = v11[v114 + v118];
                self->_weight.__begin_[v118 + v113 * objc_msgSend_columns(self, v115, v116, v117)] = v119;
                ++v118;
              }
              while (objc_msgSend_columns(self, v120, v121, v122) > v118);
              v114 += v118;
            }
            ++v113;
          }
          while (objc_msgSend_rows(self, v115, v116, v117) > v113);
        }
      }
      if (objc_msgSend_rows(self, v110, v111, v112))
      {
        v373 = 0;
        v374 = ((unint64_t)(v7 & 0x10) >> 4) ^ 1;
        do
        {
          self->_bias.__begin_[v373] = a5[v373 + (objc_msgSend_lstmOutputSize(self, v370, v371, v372) << v374)];
          if ((v7 & 0x80) == 0)
            self->_bias.__begin_[v373] = self->_bias.__begin_[v373]
                                       + a6[v373 + (objc_msgSend_lstmOutputSize(self, v375, v376, v377) << v374)];
          ++v373;
        }
        while (objc_msgSend_rows(self, v375, v376, v377) > v373);
      }
      break;
    case 12:
      if ((v7 & 0x20) != 0)
      {
        v378 = objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        v382 = objc_msgSend_lstmInputSize(self, v379, v380, v381);
        v386 = objc_msgSend_lstmOutputSize(self, v383, v384, v385);
        v390 = objc_msgSend_lstmInputSize(self, v387, v388, v389);
        v394 = objc_msgSend_lstmInputSize(self, v391, v392, v393);
        v398 = objc_msgSend_lstmOutputSize(self, v395, v396, v397);
        if (objc_msgSend_rows(self, v399, v400, v401))
        {
          v405 = 0;
          v406 = &v11[(v378 << ((v16 >> 4) ^ 1u)) * (v386 + v382) + v390];
          do
          {
            if (objc_msgSend_columns(self, v402, v403, v404))
            {
              v410 = 0;
              do
              {
                v411 = v406[v410];
                self->_weight.__begin_[v410 + v405 * objc_msgSend_columns(self, v407, v408, v409)] = v411;
                ++v410;
              }
              while (objc_msgSend_columns(self, v412, v413, v414) > v410);
            }
            ++v405;
            v406 += v398 + v394;
          }
          while (objc_msgSend_rows(self, v407, v408, v409) > v405);
        }
      }
      else
      {
        objc_msgSend_lstmInputSize(self, v13, v14, v15);
        objc_msgSend_lstmOutputSize(self, v123, v124, v125);
        v129 = objc_msgSend_lstmOutputSize(self, v126, v127, v128);
        v133 = objc_msgSend_lstmOutputSize(self, v130, v131, v132);
        if (objc_msgSend_rows(self, v134, v135, v136))
        {
          v140 = 0;
          v141 = (v129 << ((v16 >> 4) ^ 1u)) * v133;
          do
          {
            if (objc_msgSend_columns(self, v137, v138, v139))
            {
              v145 = 0;
              do
              {
                v146 = a4[v141 + v145];
                self->_weight.__begin_[v145 + v140 * objc_msgSend_columns(self, v142, v143, v144)] = v146;
                ++v145;
              }
              while (objc_msgSend_columns(self, v147, v148, v149) > v145);
              v141 += v145;
            }
            ++v140;
          }
          while (objc_msgSend_rows(self, v142, v143, v144) > v140);
        }
      }
      break;
    case 15:
      if ((v7 & 0x20) != 0)
      {
        v487 = objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        v491 = objc_msgSend_lstmInputSize(self, v488, v489, v490);
        v495 = objc_msgSend_lstmOutputSize(self, v492, v493, v494);
        v499 = objc_msgSend_lstmInputSize(self, v496, v497, v498);
        v503 = objc_msgSend_lstmOutputSize(self, v500, v501, v502);
        if (objc_msgSend_rows(self, v504, v505, v506))
        {
          v507 = v487;
          v508 = 0;
          v509 = &v11[3 * v507 * (v495 + v491)];
          do
          {
            if (objc_msgSend_columns(self, v216, v217, v218))
            {
              v513 = 0;
              do
              {
                v514 = v509[v513];
                self->_weight.__begin_[v513 + v508 * objc_msgSend_columns(self, v510, v511, v512)] = v514;
                ++v513;
              }
              while (objc_msgSend_columns(self, v515, v516, v517) > v513);
            }
            ++v508;
            v509 += v503 + v499;
          }
          while (objc_msgSend_rows(self, v510, v511, v512) > v508);
        }
      }
      else
      {
        v202 = objc_msgSend_lstmInputSize(self, v13, v14, v15);
        v206 = objc_msgSend_lstmOutputSize(self, v203, v204, v205);
        objc_msgSend_lstmOutputSize(self, v207, v208, v209);
        objc_msgSend_lstmOutputSize(self, v210, v211, v212);
        if (objc_msgSend_rows(self, v213, v214, v215))
        {
          v219 = 0;
          v220 = 3 * v202 * v206;
          do
          {
            if (objc_msgSend_columns(self, v216, v217, v218))
            {
              v224 = 0;
              do
              {
                v225 = v11[v220 + v224];
                self->_weight.__begin_[v224 + v219 * objc_msgSend_columns(self, v221, v222, v223)] = v225;
                ++v224;
              }
              while (objc_msgSend_columns(self, v226, v227, v228) > v224);
              v220 += v224;
            }
            ++v219;
          }
          while (objc_msgSend_rows(self, v221, v222, v223) > v219);
        }
      }
      if (objc_msgSend_rows(self, v216, v217, v218))
      {
        v521 = 0;
        do
        {
          self->_bias.__begin_[v521] = a5[3 * objc_msgSend_lstmOutputSize(self, v518, v519, v520) + v521];
          if ((v7 & 0x80) == 0)
            self->_bias.__begin_[v521] = self->_bias.__begin_[v521]
                                       + a6[3 * objc_msgSend_lstmOutputSize(self, v522, v523, v524) + v521];
          ++v521;
        }
        while (objc_msgSend_rows(self, v522, v523, v524) > v521);
      }
      break;
    case 16:
      if ((v7 & 0x20) != 0)
      {
        v415 = objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        v419 = objc_msgSend_lstmInputSize(self, v416, v417, v418);
        v423 = objc_msgSend_lstmOutputSize(self, v420, v421, v422);
        v427 = objc_msgSend_lstmInputSize(self, v424, v425, v426);
        v431 = objc_msgSend_lstmInputSize(self, v428, v429, v430);
        v435 = objc_msgSend_lstmOutputSize(self, v432, v433, v434);
        if (objc_msgSend_rows(self, v436, v437, v438))
        {
          v442 = 0;
          v443 = &v11[3 * v415 * (v423 + v419) + v427];
          do
          {
            if (objc_msgSend_columns(self, v439, v440, v441))
            {
              v447 = 0;
              do
              {
                v448 = v443[v447];
                self->_weight.__begin_[v447 + v442 * objc_msgSend_columns(self, v444, v445, v446)] = v448;
                ++v447;
              }
              while (objc_msgSend_columns(self, v449, v450, v451) > v447);
            }
            ++v442;
            v443 += v435 + v431;
          }
          while (objc_msgSend_rows(self, v444, v445, v446) > v442);
        }
      }
      else
      {
        objc_msgSend_lstmInputSize(self, v13, v14, v15);
        objc_msgSend_lstmOutputSize(self, v150, v151, v152);
        v156 = objc_msgSend_lstmOutputSize(self, v153, v154, v155);
        v160 = objc_msgSend_lstmOutputSize(self, v157, v158, v159);
        if (objc_msgSend_rows(self, v161, v162, v163))
        {
          v167 = 0;
          v168 = 3 * v156 * v160;
          do
          {
            if (objc_msgSend_columns(self, v164, v165, v166))
            {
              v172 = 0;
              do
              {
                v173 = a4[v168 + v172];
                self->_weight.__begin_[v172 + v167 * objc_msgSend_columns(self, v169, v170, v171)] = v173;
                ++v172;
              }
              while (objc_msgSend_columns(self, v174, v175, v176) > v172);
              v168 += v172;
            }
            ++v167;
          }
          while (objc_msgSend_rows(self, v169, v170, v171) > v167);
        }
      }
      break;
    default:
      v525 = (void *)MEMORY[0x1E0C99DA0];
      v526 = *MEMORY[0x1E0C99768];
      v527 = (void *)MEMORY[0x1E0CB3940];
      v528 = objc_msgSend_weightID(self, v13, v14, v15);
      objc_msgSend_stringWithFormat_(v527, v529, (uint64_t)CFSTR("Unknown weight ID %tu"), v530, v528);
      v531 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v525, v532, v526, (uint64_t)v531, 0);
      v533 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v533);
  }
}

- (unint64_t)weightID
{
  return self->_weightID;
}

- (void)setWeightID:(unint64_t)a3
{
  self->_weightID = a3;
}

- (unint64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(unint64_t)a3
{
  self->_columns = a3;
}

- (unint64_t)rows
{
  return self->_rows;
}

- (void)setRows:(unint64_t)a3
{
  self->_rows = a3;
}

- (unint64_t)lstmInputSize
{
  return self->_lstmInputSize;
}

- (void)setLstmInputSize:(unint64_t)a3
{
  self->_lstmInputSize = a3;
}

- (unint64_t)lstmOutputSize
{
  return self->_lstmOutputSize;
}

- (void)setLstmOutputSize:(unint64_t)a3
{
  self->_lstmOutputSize = a3;
}

- (void).cxx_destruct
{
  float *begin;
  float *v4;

  begin = self->_bias.__begin_;
  if (begin)
  {
    self->_bias.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_weight.__begin_;
  if (v4)
  {
    self->_weight.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_desc, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end
