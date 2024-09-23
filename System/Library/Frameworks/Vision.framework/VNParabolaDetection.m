@implementation VNParabolaDetection

- (VNParabolaDetection)init
{
  VNParabolaDetection *v2;
  VNParabolaDetection *v3;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, InternalObservedParabola>, void *>>> *p_pair1;
  VNParabolaDetection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNParabolaDetection;
  v2 = -[VNParabolaDetection init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->UID_counter = 0;
    p_pair1 = &v2->internalParabolas.__tree_.__pair1_;
    std::__tree<std::__value_type<int,InternalObservedParabola>,std::__map_value_compare<int,std::__value_type<int,InternalObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,InternalObservedParabola>>>::destroy((_QWORD *)v2->internalParabolas.__tree_.__pair1_.__value_.__left_);
    v3->internalParabolas.__tree_.__begin_node_ = p_pair1;
    v3->internalParabolas.__tree_.__pair3_.__value_ = 0;
    p_pair1->__value_.__left_ = 0;
    std::__tree<std::__value_type<int,ObservedParabola>,std::__map_value_compare<int,std::__value_type<int,ObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,ObservedParabola>>>::destroy((_QWORD *)v3->_observedParabolas.__tree_.__pair1_.__value_.__left_);
    v3->_observedParabolas.__tree_.__begin_node_ = &v3->_observedParabolas.__tree_.__pair1_;
    v3->_observedParabolas.__tree_.__pair3_.__value_ = 0;
    v3->_observedParabolas.__tree_.__pair1_.__value_.__left_ = 0;
    v5 = v3;
  }

  return v3;
}

- (void).cxx_destruct
{
  void **begin;
  void **end;
  __compressed_pair<unsigned long, std::allocator<std::vector<CGPointWithPts>>> *p_size;
  unint64_t start;
  void **v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void **v17;
  void **v18;
  void **first;

  std::__tree<std::__value_type<int,ObservedParabola>,std::__map_value_compare<int,std::__value_type<int,ObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,ObservedParabola>>>::destroy((_QWORD *)self->_observedParabolas.__tree_.__pair1_.__value_.__left_);
  begin = self->parabolaSearchBuffer.contourPointsQ.__map_.__begin_;
  end = self->parabolaSearchBuffer.contourPointsQ.__map_.__end_;
  if (end == begin)
  {
    p_size = &self->parabolaSearchBuffer.contourPointsQ.__size_;
    end = self->parabolaSearchBuffer.contourPointsQ.__map_.__begin_;
  }
  else
  {
    p_size = &self->parabolaSearchBuffer.contourPointsQ.__size_;
    start = self->parabolaSearchBuffer.contourPointsQ.__start_;
    v7 = &begin[start / 0xAA];
    v8 = (unint64_t)*v7;
    v9 = (unint64_t)*v7 + 24 * (start % 0xAA);
    v10 = (unint64_t)begin[(self->parabolaSearchBuffer.contourPointsQ.__size_.__value_ + start) / 0xAA]
        + 24 * ((self->parabolaSearchBuffer.contourPointsQ.__size_.__value_ + start) % 0xAA);
    if (v9 != v10)
    {
      do
      {
        v11 = *(void **)v9;
        if (*(_QWORD *)v9)
        {
          *(_QWORD *)(v9 + 8) = v11;
          operator delete(v11);
          v8 = (unint64_t)*v7;
        }
        v9 += 24;
        if (v9 - v8 == 4080)
        {
          v12 = (unint64_t)v7[1];
          ++v7;
          v8 = v12;
          v9 = v12;
        }
      }
      while (v9 != v10);
      begin = self->parabolaSearchBuffer.contourPointsQ.__map_.__begin_;
      end = self->parabolaSearchBuffer.contourPointsQ.__map_.__end_;
    }
  }
  p_size->__value_ = 0;
  v13 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->parabolaSearchBuffer.contourPointsQ.__map_.__end_;
      begin = self->parabolaSearchBuffer.contourPointsQ.__map_.__begin_ + 1;
      self->parabolaSearchBuffer.contourPointsQ.__map_.__begin_ = begin;
      v13 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  v14 = v13 >> 3;
  if (v14 == 1)
  {
    v15 = 85;
    goto LABEL_16;
  }
  if (v14 == 2)
  {
    v15 = 170;
LABEL_16:
    self->parabolaSearchBuffer.contourPointsQ.__start_ = v15;
  }
  if (begin != end)
  {
    do
    {
      v16 = *begin++;
      operator delete(v16);
    }
    while (begin != end);
    v18 = self->parabolaSearchBuffer.contourPointsQ.__map_.__begin_;
    v17 = self->parabolaSearchBuffer.contourPointsQ.__map_.__end_;
    if (v17 != v18)
      self->parabolaSearchBuffer.contourPointsQ.__map_.__end_ = (void **)((char *)v17
                                                                        + (((char *)v18 - (char *)v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->parabolaSearchBuffer.contourPointsQ.__map_.__first_;
  if (first)
    operator delete(first);
  std::__tree<std::__value_type<int,InternalObservedParabola>,std::__map_value_compare<int,std::__value_type<int,InternalObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,InternalObservedParabola>>>::destroy((_QWORD *)self->internalParabolas.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 2) = (char *)self + 24;
  *((_QWORD *)self + 5) = 0x50000000ELL;
  *((_DWORD *)self + 12) = 5;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_QWORD *)self + 13) = 0x300000003;
  *((_QWORD *)self + 14) = 0x41A0000041200000;
  *((_DWORD *)self + 30) = 1125515264;
  *(_QWORD *)((char *)self + 124) = 0x43800000780;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)((char *)self + 132) = _D0;
  *((_DWORD *)self + 35) = 10;
  *((_OWORD *)self + 9) = xmmword_1A15FB5E0;
  *((_OWORD *)self + 10) = xmmword_1A15FB5F0;
  *((_DWORD *)self + 44) = 0x40000000;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 23) = (char *)self + 192;
  *((_DWORD *)self + 52) = 1114636288;
  *(_OWORD *)((char *)self + 212) = xmmword_1A15FB600;
  *(_QWORD *)((char *)self + 228) = 0xE00000064;
  *((_DWORD *)self + 59) = 5;
  return self;
}

- (uint64_t)processContoursForParabolas:(uint64_t)a3 withPTS:(uint64_t)a4 objectMinimumPixelSize:(uint64_t)a5 bufferWidth:(uint64_t)a6 bufferHeight:(int32x4_t)a7
{
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v10;
  uint64_t v11;
  float32x2_t v12;
  int32x2_t v13;
  float32x2_t v14;
  int32x2_t v15;
  _OWORD *v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  __int128 v23;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _OWORD *v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  char *v34;
  _QWORD *v35;
  unint64_t v36;
  unint64_t v37;
  void **v38;
  uint64_t v39;
  void **v40;
  void **v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  _QWORD *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  int v60;
  uint64_t **v61;
  uint64_t **v62;
  int *v63;
  int *v64;
  float v65;
  double v66;
  float v67;
  int *v68;
  double v69;
  float v70;
  int v71;
  float v72;
  const float *v73;
  float64x2_t *v74;
  const float *v75;
  float64x2_t v76;
  unint64_t v77;
  float64x2_t *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  float64x2_t *v84;
  uint64_t *v85;
  int *v86;
  uint64_t *v87;
  double *v88;
  int v89;
  BOOL v90;
  BOOL v91;
  double v92;
  double v93;
  _BOOL4 v94;
  double v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  int *v100;
  int *v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  float v105;
  float v106;
  float v107;
  float v108;
  double v109;
  double v110;
  double v111;
  double v112;
  float v113;
  double *v114;
  int v115;
  double *v116;
  unint64_t v117;
  char v118;
  float64x2_t v119;
  double v120;
  double v121;
  float v122;
  float v123;
  double v124;
  float v125;
  BOOL v126;
  int *v127;
  float v128;
  float v129;
  uint64_t *v130;
  uint64_t **v131;
  uint64_t *v133;
  uint64_t *v134;
  float v135;
  uint64_t *v137;
  uint64_t *v138;
  unint64_t v139;
  float v140;
  float v141;
  float v142;
  float v143;
  unsigned int v144;
  int v145;
  int v146;
  uint64_t v147;
  unint64_t v148;
  unint64_t v149;
  uint64_t v150;
  unint64_t v151;
  __int128 v152;
  __int128 v153;
  uint64_t *v154;
  _QWORD *v155;
  int *v156;
  int *v157;
  int v158;
  int64_t v159;
  uint64_t *v160;
  uint64_t *v161;
  int64_t v162;
  uint64_t *v163;
  uint64_t *v164;
  int64_t v165;
  double *v166;
  double v167;
  double v168;
  double v169;
  int v170;
  unint64_t v171;
  unint64_t v172;
  unint64_t v173;
  uint64_t v174;
  uint64_t *v175;
  __int128 v176;
  __int128 v177;
  uint64_t *v178;
  uint64_t *v179;
  uint64_t *v180;
  __int128 v181;
  __int128 v182;
  char *v183;
  uint64_t v184;
  uint64_t *v185;
  char *v186;
  unint64_t v187;
  uint64_t v188;
  unint64_t v189;
  uint64_t *v190;
  uint64_t *v191;
  unint64_t v192;
  char *v193;
  uint64_t v194;
  void **v195;
  unint64_t v196;
  char *v197;
  uint64_t *v198;
  char *v199;
  uint64_t v200;
  unint64_t v201;
  uint64_t v202;
  unint64_t v204;
  uint64_t v205;
  uint64_t *v206;
  uint64_t v207;
  unint64_t v208;
  char *v209;
  uint64_t *v210;
  char *v211;
  uint64_t v212;
  unint64_t v213;
  uint64_t v214;
  unint64_t v215;
  uint64_t v216;
  uint64_t *v217;
  uint64_t v218;
  uint64_t *v219;
  float v220;
  uint64_t v221;
  uint64_t v222;
  const double *v223;
  const double *v224;
  const double *v225;
  __int128 v226;
  uint64_t v227;
  unint64_t v228;
  uint64_t *v229;
  double v230;
  double v231;
  double v232;
  double v233;
  unsigned int v234;
  int v238;
  uint64_t v239;
  unint64_t v240;
  unint64_t v241;
  uint64_t v242;
  int v243;
  int *v244;
  int v245;
  int *v246;
  uint64_t *v247;
  int v248;
  uint64_t **v249;
  uint64_t *v250;
  int v251;
  BOOL v252;
  uint64_t **v253;
  uint64_t *v254;
  uint64_t *v255;
  uint64_t *v256;
  uint64_t **v257;
  __int128 v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t **v263;
  int v264;
  _DWORD *v265;
  double *v266;
  double *v267;
  int64_t v268;
  unint64_t v269;
  float32_t v270;
  float32x4_t v271;
  float32x4_t v272;
  double v273;
  double v274;
  uint64_t v275;
  unint64_t v276;
  unint64_t v277;
  uint64_t v278;
  double *v279;
  unint64_t v280;
  double *v281;
  __int128 v282;
  const double *v283;
  const double *v284;
  const double *v285;
  double *v286;
  double *v287;
  double *v288;
  double *v289;
  float v290;
  double v291;
  float v292;
  double *v293;
  double *v294;
  double *v295;
  double *v296;
  float v297;
  double v298;
  float v299;
  double *v300;
  double v301;
  double v302;
  double v303;
  __int128 v304;
  double v305;
  void **v306;
  uint64_t v307;
  float64x2_t v308;
  __int128 v309;
  unint64_t v310;
  unint64_t v311;
  void *v312;
  uint64_t v313;
  uint64_t v314;
  double v315;
  unint64_t v316;
  _OWORD *v317;
  float *v318;
  _QWORD *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t *v322;
  uint64_t **v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  unint64_t v327;
  uint64_t *v328;
  uint64_t v329;
  double v330;
  double v331;
  uint64_t v332;
  uint64_t *v333;
  uint64_t v334;
  uint64_t v335;
  float v336;
  double v337;
  double v338;
  uint64_t v339;
  int v340;
  CMTime **v341;
  CMTime *v342;
  CMTime *v343;
  float v344;
  double v345;
  double v346;
  double v347;
  uint64_t epoch;
  int value;
  double v350;
  double v351;
  double v352;
  BOOL v353;
  double v354;
  double v356;
  float v357;
  _BOOL4 v358;
  _BOOL4 v359;
  _BOOL4 v360;
  BOOL v361;
  double *v362;
  double *v363;
  double *v364;
  unint64_t v365;
  unint64_t v366;
  double *v367;
  uint64_t v368;
  unint64_t v369;
  uint64_t v370;
  int v371;
  double *v372;
  unint64_t v373;
  unint64_t v374;
  uint64_t v375;
  double *v376;
  double *v377;
  double *v378;
  unint64_t v379;
  double *v380;
  uint64_t v381;
  unint64_t v382;
  unint64_t v383;
  uint64_t v384;
  double *v385;
  uint64_t v386;
  double *v387;
  unint64_t v388;
  uint64_t v389;
  unint64_t v390;
  unint64_t v391;
  uint64_t v392;
  double *v393;
  uint64_t v394;
  unint64_t v395;
  double *i;
  unint64_t v397;
  double *v398;
  uint64_t v399;
  unint64_t v400;
  unint64_t v401;
  uint64_t v402;
  double *v403;
  uint64_t v404;
  double *v405;
  unint64_t v406;
  uint64_t v407;
  unint64_t v408;
  unint64_t v409;
  uint64_t v410;
  double *v411;
  double *v412;
  double *v413;
  uint64_t v414;
  unint64_t v415;
  double *v416;
  unint64_t v417;
  double *v418;
  unint64_t v419;
  unint64_t v420;
  char *v421;
  uint64_t v422;
  double *v423;
  unint64_t v424;
  unint64_t v425;
  uint64_t v426;
  double *v427;
  unint64_t v428;
  __int128 v429;
  __int128 v430;
  double *v431;
  void *v432;
  unint64_t v433;
  unint64_t v434;
  uint64_t v435;
  unint64_t v436;
  unint64_t v437;
  __int128 v438;
  __int128 v439;
  void *v440;
  uint64_t v441;
  uint64_t v442;
  const double *v443;
  const double *v444;
  const double *v445;
  float32x2_t v446;
  float v447;
  unint64_t v448;
  uint64_t *v449;
  uint64_t v450;
  uint64_t v451;
  double v452;
  double v453;
  uint64_t v454;
  int v455;
  double v456;
  double v457;
  int v458;
  int v459;
  int v460;
  int v461;
  _BOOL4 v462;
  int v463;
  int v464;
  unsigned int v465;
  float v467;
  float v468;
  float v469;
  double v470;
  float v471;
  float v472;
  float v473;
  float v474;
  float v475;
  char *v476;
  uint64_t v477;
  char *v478;
  char *v479;
  unint64_t v480;
  unint64_t v481;
  uint64_t v482;
  char *v483;
  __int128 v484;
  __int128 v485;
  double *v486;
  uint64_t *v487;
  unsigned int v488;
  double *v489;
  double v490;
  double v491;
  float v492;
  uint64_t *v493;
  uint64_t *v494;
  double *v495;
  double *v496;
  double *v497;
  double *v498;
  int64_t v499;
  unint64_t v500;
  uint64_t v501;
  unint64_t v502;
  uint64_t v503;
  double *v504;
  uint64_t v505;
  double *v506;
  uint64_t v507;
  unint64_t v508;
  unint64_t v509;
  uint64_t v510;
  double *v511;
  double *v512;
  double *v513;
  uint64_t v514;
  uint64_t v515;
  void *v516;
  char *v517;
  void *v518;
  unint64_t v519;
  uint64_t v520;
  uint64_t v521;
  const double *v522;
  const double *v523;
  const double *v524;
  __int128 v525;
  char *v526;
  CGPoint *v527;
  float v528;
  _DWORD *v529;
  uint64_t *v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  _DWORD *v535;
  unint64_t v536;
  uint64_t v537;
  uint64_t *v538;
  uint64_t **v539;
  uint64_t v540;
  double *v541;
  uint64_t v542;
  float v543;
  double v544;
  double v545;
  int v546;
  int v547;
  uint64_t v548;
  uint64_t v549;
  unint64_t v550;
  char v551;
  double v552;
  double v553;
  double v554;
  double v555;
  double v556;
  uint64_t **v557;
  int v558;
  float v559;
  unint64_t v560;
  float *__src;
  double *__srca;
  double v563;
  int *v564;
  char *v565;
  float v566;
  __int128 v567;
  float64_t v568;
  __int128 v569;
  double v570;
  double v571;
  CMTime *v572;
  int v573;
  double v574;
  uint64_t v575;
  uint64_t *v576;
  double v577;
  int v578;
  int *v579;
  uint64_t v580;
  double v582;
  int epoch_high;
  __int128 v584;
  BOOL v585;
  float v586;
  BOOL v587;
  int *__dst;
  _BOOL4 __dsta;
  uint64_t **v590;
  _BOOL4 v591;
  float64x2_t v592;
  double v593;
  float32x4_t v594;
  int v595;
  double v596;
  uint64_t v597;
  uint64_t v598;
  char *__p;
  void *__p_8[2];
  double *v601[2];
  double *v602;
  uint64_t v603;
  unsigned int v604;
  _BYTE v605[48];
  void *v606[2];
  void *v607;
  void *v608;
  void *v609;
  void *v610;
  void *v611;
  void *v612;
  void *v613;
  void *v614;
  double *v615;
  uint64_t v616;
  __int128 v617;
  __int128 v618;
  _DWORD v619[4];
  void *v620[60];
  void *v621;
  void *v622;
  void *v623;
  void *v624;
  void *v625;
  uint64_t v626;
  __int128 v627;
  uint64_t v628;
  void *v629;
  void *v630;
  uint64_t v631;
  uint64_t *v632;
  void *v633[2];
  _BYTE v634[28];
  double *v635;
  int v636;
  uint64_t v637;
  CMTimeFlags flags;
  uint64_t v639;
  int v640;
  uint64_t v641;
  float32x4x4_t v642;
  float32x4x4_t v643;

  v641 = *MEMORY[0x1E0C80C00];
  v598 = result;
  if (!result)
    return result;
  v7 = (uint64_t *)*a2;
  v8 = (uint64_t *)a2[1];
  if (v8 == (uint64_t *)*a2)
  {
    result += 184;
    return result;
  }
  if (a4)
    *(_DWORD *)(result + 236) = a4;
  if (*(_DWORD *)(result + 124) != a5 || *(_DWORD *)(result + 128) != a6)
  {
    *(_DWORD *)(result + 124) = a5;
    *(_DWORD *)(result + 128) = a6;
    *(float32x2_t *)a7.i8 = vcvt_f32_s32((int32x2_t)__PAIR64__(a6, a5));
    v10 = 152;
    if ((int)a5 <= (int)a6)
      v11 = 152;
    else
      v11 = 148;
    if ((int)a5 <= (int)a6)
      v10 = 148;
    v12.i32[0] = *(_DWORD *)(result + v11);
    v12.i32[1] = *(_DWORD *)(result + v10);
    *(float32x2_t *)a7.i8 = vdiv_f32(*(float32x2_t *)a7.i8, v12);
    *(_QWORD *)(result + 132) = a7.i64[0];
    *(int32x4_t *)(result + 216) = vcvtq_s32_f32(vmulq_f32((float32x4_t)vzip1q_s32(a7, a7), vcvtq_f32_s32(*(int32x4_t *)(result + 216))));
    v13 = *(int32x2_t *)(result + 104);
    v14 = vmul_lane_f32(*(float32x2_t *)(result + 112), *(float32x2_t *)a7.i8, 1);
    *(float *)(result + 120) = vmuls_lane_f32(*(float *)(result + 120), *(float32x2_t *)a7.i8, 1);
    v15 = vcvt_s32_f32(vmul_f32(*(float32x2_t *)a7.i8, vcvt_f32_s32(v13)));
    *(int32x2_t *)(result + 104) = v15;
    *(float32x2_t *)(result + 112) = v14;
    *(int32x2_t *)(result + 44) = v15;
    *(float *)(result + 164) = fmaxf(*(float *)a7.i32, *(float *)&a7.i32[1]) * *(float *)(result + 164);
    v7 = (uint64_t *)*a2;
    v8 = (uint64_t *)a2[1];
  }
  v633[1] = 0;
  v633[0] = 0;
  *(_QWORD *)v634 = 0;
  v16 = (_OWORD *)MEMORY[0x1E0C9D538];
  if (v7 != v8)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    do
    {
      v20 = *v7;
      v21 = v7[1];
      v22 = *((_DWORD *)v7 + 4);
      *(_OWORD *)v601 = *(_OWORD *)a3;
      v602 = *(double **)(a3 + 16);
      CMTimeMake((CMTime *)&v605[16], 0, 30);
      *(_QWORD *)v605 = v20;
      *(_QWORD *)&v605[8] = v21;
      *(_OWORD *)&v605[16] = *(_OWORD *)v601;
      *(_QWORD *)&v605[32] = v602;
      *(_DWORD *)&v605[40] = v22;
      if ((unint64_t)v19 >= v18)
      {
        v25 = 0xAAAAAAAAAAAAAAABLL * ((v19 - v17) >> 4) + 1;
        if (v25 > 0x555555555555555)
        {
          v633[0] = v17;
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * ((uint64_t)(v18 - (_QWORD)v17) >> 4) > v25)
          v25 = 0x5555555555555556 * ((uint64_t)(v18 - (_QWORD)v17) >> 4);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v18 - (_QWORD)v17) >> 4) >= 0x2AAAAAAAAAAAAAALL)
          v26 = 0x555555555555555;
        else
          v26 = v25;
        if (v26)
          v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v26);
        else
          v27 = 0;
        v28 = (_OWORD *)(v26 + 16 * ((v19 - v17) >> 4));
        v29 = *(_OWORD *)v605;
        v30 = *(_OWORD *)&v605[32];
        v28[1] = *(_OWORD *)&v605[16];
        v28[2] = v30;
        *v28 = v29;
        if (v19 == v17)
        {
          v34 = (char *)(v26 + 16 * ((v19 - v17) >> 4));
        }
        else
        {
          v31 = v26 + 16 * ((v19 - v17) >> 4);
          do
          {
            v32 = *((_OWORD *)v19 - 3);
            v33 = *((_OWORD *)v19 - 2);
            v34 = (char *)(v31 - 48);
            *(_OWORD *)(v31 - 20) = *(_OWORD *)(v19 - 20);
            *(_OWORD *)(v31 - 48) = v32;
            *(_OWORD *)(v31 - 32) = v33;
            v19 -= 48;
            v31 -= 48;
          }
          while (v19 != v17);
        }
        v18 = v26 + 48 * v27;
        v19 = (char *)(v28 + 3);
        if (v17)
          operator delete(v17);
        v17 = v34;
      }
      else
      {
        v23 = *(_OWORD *)v605;
        v24 = *(_OWORD *)&v605[32];
        *((_OWORD *)v19 + 1) = *(_OWORD *)&v605[16];
        *((_OWORD *)v19 + 2) = v24;
        *(_OWORD *)v19 = v23;
        v19 += 48;
      }
      v7 += 3;
    }
    while (v7 != v8);
    *(_QWORD *)v634 = v18;
    v633[1] = v19;
    v633[0] = v17;
    v16 = (_OWORD *)MEMORY[0x1E0C9D538];
  }
  v35 = (_QWORD *)(v598 + 56);
  v36 = *(_QWORD *)(v598 + 96);
  if (!v36)
  {
    sanitize((double **)v605, (__int128 **)v633, *(_DWORD *)(v598 + 44), *(_DWORD *)(v598 + 48));
    v48 = *(void **)&v605[8];
    v49 = *(void **)v605;
    if (*(_QWORD *)&v605[8] != *(_QWORD *)v605)
    {
LABEL_65:
      std::deque<std::vector<CGPointWithPts>>::push_back(v35, (uint64_t)v605);
      if (!v49)
        goto LABEL_79;
      goto LABEL_68;
    }
    goto LABEL_67;
  }
  v37 = *(_QWORD *)(v598 + 88);
  v38 = *(void ***)(v598 + 64);
  v39 = *((_QWORD *)v38[(v36 + v37 - 1) / 0xAA] + 3 * ((v36 + v37 - 1) % 0xAA));
  if ((float)((float)*(uint64_t *)a3 / (float)*(int *)(a3 + 8))
     - (float)((float)*(uint64_t *)(v39 + 16) / (float)*(int *)(v39 + 24)) <= (double)*(int *)(v598 + 40))
  {
    if (v36 == 5)
    {
      v50 = v38[v37 / 0xAA];
      v51 = (void *)v50[3 * (v37 % 0xAA)];
      if (v51)
      {
        v50[3 * (v37 % 0xAA) + 1] = v51;
        operator delete(v51);
        v52 = v598;
        v37 = *(_QWORD *)(v598 + 88);
        v36 = *(_QWORD *)(v598 + 96);
      }
      else
      {
        v52 = v598;
      }
      *(_QWORD *)(v52 + 88) = v37 + 1;
      *(_QWORD *)(v52 + 96) = v36 - 1;
      if (v37 + 1 >= 0x154)
      {
        operator delete(**(void ***)(v52 + 64));
        *(_QWORD *)(v52 + 64) += 8;
        *(_QWORD *)(v52 + 88) -= 170;
      }
      memset(v605, 0, 24);
      sanitize((double **)&__p, (__int128 **)v633, *(_DWORD *)(v52 + 44), *(_DWORD *)(v52 + 48));
      v53 = __p;
      sanitizeAllFrames((void **)&__p, v35, (uint64_t)__p, (uint64_t)__p_8[0], *(_DWORD *)(v52 + 44), *(_DWORD *)(v52 + 48));
      v54 = __p;
      *(_QWORD *)v605 = __p;
      *(_OWORD *)&v605[8] = *(_OWORD *)__p_8;
      if (__p_8[0] == __p)
        goto LABEL_74;
    }
    else
    {
      if (v36 > 4)
        goto LABEL_79;
      memset(v605, 0, 24);
      sanitize((double **)&__p, (__int128 **)v633, *(_DWORD *)(v598 + 44), *(_DWORD *)(v598 + 48));
      v53 = __p;
      sanitizeAllFrames((void **)&__p, v35, (uint64_t)__p, (uint64_t)__p_8[0], *(_DWORD *)(v598 + 44), *(_DWORD *)(v598 + 48));
      v54 = __p;
      *(_QWORD *)v605 = __p;
      *(_OWORD *)&v605[8] = *(_OWORD *)__p_8;
      if (__p_8[0] == __p)
      {
LABEL_74:
        if (v53)
        {
          operator delete(v53);
          v54 = *(void **)v605;
        }
        if (!v54)
          goto LABEL_79;
        v58 = v54;
        goto LABEL_78;
      }
    }
    std::deque<std::vector<CGPointWithPts>>::push_back(v35, (uint64_t)v605);
    goto LABEL_74;
  }
  v40 = *(void ***)(v598 + 72);
  if (v40 == v38)
  {
    v40 = *(void ***)(v598 + 64);
    goto LABEL_56;
  }
  v41 = &v38[v37 / 0xAA];
  v42 = (unint64_t)*v41;
  v43 = (unint64_t)*v41 + 24 * (v37 % 0xAA);
  v44 = (unint64_t)v38[(v37 + v36) / 0xAA] + 24 * ((v37 + v36) % 0xAA);
  if (v43 == v44)
  {
LABEL_56:
    v47 = v598;
    goto LABEL_57;
  }
  do
  {
    v45 = *(void **)v43;
    if (*(_QWORD *)v43)
    {
      *(_QWORD *)(v43 + 8) = v45;
      operator delete(v45);
      v42 = (unint64_t)*v41;
    }
    v43 += 24;
    if (v43 - v42 == 4080)
    {
      v46 = (unint64_t)v41[1];
      ++v41;
      v42 = v46;
      v43 = v46;
    }
  }
  while (v43 != v44);
  v47 = v598;
  v38 = *(void ***)(v598 + 64);
  v40 = *(void ***)(v598 + 72);
LABEL_57:
  *(_QWORD *)(v47 + 96) = 0;
  v55 = (char *)v40 - (char *)v38;
  if ((unint64_t)((char *)v40 - (char *)v38) >= 0x11)
  {
    do
    {
      operator delete(*v38);
      v56 = *(_QWORD *)(v598 + 72);
      v38 = (void **)(*(_QWORD *)(v598 + 64) + 8);
      *(_QWORD *)(v598 + 64) = v38;
      v55 = v56 - (_QWORD)v38;
    }
    while (v55 > 0x10);
  }
  if (v55 >> 3 == 1)
  {
    v57 = 85;
  }
  else
  {
    if (v55 >> 3 != 2)
      goto LABEL_64;
    v57 = 170;
  }
  *(_QWORD *)(v598 + 88) = v57;
LABEL_64:
  sanitize((double **)v605, (__int128 **)v633, *(_DWORD *)(v598 + 44), *(_DWORD *)(v598 + 48));
  v48 = *(void **)&v605[8];
  v49 = *(void **)v605;
  if (*(_QWORD *)&v605[8] != *(_QWORD *)v605)
    goto LABEL_65;
LABEL_67:
  v49 = v48;
  if (v48)
  {
LABEL_68:
    v58 = v49;
LABEL_78:
    operator delete(v58);
  }
LABEL_79:
  if (v633[0])
    operator delete(v633[0]);
  if (*(_QWORD *)(v598 + 32))
  {
    v59 = *(_QWORD *)a3;
    v60 = *(_DWORD *)(a3 + 8);
    v603 = *(_QWORD *)(a3 + 12);
    v604 = *(_DWORD *)(a3 + 20);
    v61 = *(uint64_t ***)(v598 + 16);
    v557 = (uint64_t **)(v598 + 16);
    v62 = (uint64_t **)(v598 + 24);
    if (v61 == (uint64_t **)(v598 + 24))
    {
      v564 = 0;
      goto LABEL_417;
    }
    __dst = 0;
    v63 = 0;
    v64 = 0;
    v575 = v59;
    v573 = v60;
    v65 = (float)v59 / (float)v60;
    v66 = v65;
    v566 = v65;
    v563 = v65;
    do
    {
      v67 = (float)v61[7][20] / (float)*((int *)v61[7] + 42);
      if (v65 <= v67)
        goto LABEL_200;
      v68 = (int *)(v61 + 4);
      v69 = (v66 - v67) * *(float *)(v598 + 208);
      if (v69 > (double)*(int *)(v598 + 232))
      {
        if (v63 >= __dst)
        {
          v96 = v63 - v64;
          v97 = v96 + 1;
          if ((unint64_t)(v96 + 1) >> 62)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          if (((char *)__dst - (char *)v64) >> 1 > v97)
            v97 = ((char *)__dst - (char *)v64) >> 1;
          if ((unint64_t)((char *)__dst - (char *)v64) >= 0x7FFFFFFFFFFFFFFCLL)
            v98 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v98 = v97;
          if (v98)
            v98 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v98);
          else
            v99 = 0;
          v100 = (int *)(v98 + 4 * v96);
          *v100 = *v68;
          v101 = v100 + 1;
          while (v63 != v64)
          {
            v102 = *--v63;
            *--v100 = v102;
          }
          __dst = (int *)(v98 + 4 * v99);
          if (v64)
            operator delete(v64);
          v63 = v101;
          v64 = v100;
        }
        else
        {
          *v63++ = *v68;
        }
        goto LABEL_200;
      }
      v70 = *(float *)(v598 + 144);
      v584 = *((_OWORD *)v61 + 5);
      *(_OWORD *)v605 = *v16;
      CMTimeMake((CMTime *)&v605[16], 0, 30);
      v579 = (int *)(v61 + 4);
      *(_QWORD *)&v605[16] = v575;
      *(_DWORD *)&v605[24] = v573;
      *(_QWORD *)&v605[28] = v603;
      *(_QWORD *)&v605[36] = v604;
      *(_OWORD *)v633 = *v16;
      CMTimeMake((CMTime *)v634, 0, 30);
      v71 = 0;
      v590 = v61 + 7;
      __src = (float *)(v61 + 6);
      v72 = fmin(v69, v70);
      v586 = v72;
      *(_QWORD *)v634 = v575;
      *(_DWORD *)&v634[24] = 0;
      *(_DWORD *)&v634[8] = v573;
      *(_QWORD *)&v634[12] = v603;
      *(_DWORD *)&v634[20] = v604;
      v594 = *((float32x4_t *)v61 + 34);
      v74 = (float64x2_t *)v61[91];
      v61[92] = (uint64_t *)v74;
      do
      {
        v73 = (const float *)(v61 + 28);
        v642 = vld4q_f32(v73);
        v75 = (const float *)(v61 + 36);
        v643 = vld4q_f32(v75);
        v594 = vaddq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v642.val[0], v594.f32[0]), v642.val[1], *(float32x2_t *)v594.f32, 1), v642.val[2], v594, 2), v642.val[3], v594, 3), vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v643.val[0], COERCE_FLOAT(*((_OWORD *)v61 + 43))), v643.val[1], (float32x2_t)v61[86], 1), v643.val[2], *((float32x4_t *)v61 + 43), 2),
                   v643.val[3],
                   *((float32x4_t *)v61 + 43),
                   3));
        v76 = vcvtq_f64_f32(*(float32x2_t *)v594.f32);
        v77 = (unint64_t)v61[93];
        if ((unint64_t)v74 >= v77)
        {
          v592 = v76;
          v78 = (float64x2_t *)v61[91];
          v79 = v74 - v78;
          v80 = v79 + 1;
          if ((unint64_t)(v79 + 1) >> 60)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          v81 = v77 - (_QWORD)v78;
          if (v81 >> 3 > v80)
            v80 = v81 >> 3;
          if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFF0)
            v82 = 0xFFFFFFFFFFFFFFFLL;
          else
            v82 = v80;
          if (v82)
          {
            v82 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v82);
            v74 = (float64x2_t *)v61[92];
            v78 = (float64x2_t *)v61[91];
          }
          else
          {
            v83 = 0;
          }
          v84 = (float64x2_t *)(v82 + 16 * v79);
          *v84 = v592;
          v85 = (uint64_t *)&v84[1];
          if (v74 != v78)
          {
            do
            {
              v84[-1] = v74[-1];
              --v84;
              --v74;
            }
            while (v74 != v78);
            v78 = (float64x2_t *)v61[91];
          }
          v61[91] = (uint64_t *)v84;
          v61[92] = v85;
          v61[93] = (uint64_t *)(v82 + 16 * v83);
          if (v78)
            operator delete(v78);
          v74 = (float64x2_t *)v85;
        }
        else
        {
          *v74++ = v76;
        }
        v61[92] = (uint64_t *)v74;
        ++v71;
      }
      while (v71 != 20);
      v86 = v64;
      v87 = v61[7];
      v88 = (double *)v61[91];
      if (v88 == (double *)v74)
      {
        v91 = 0;
        v94 = 0;
        v595 = 1;
        goto LABEL_137;
      }
      v89 = 0;
      v90 = 0;
      v91 = 0;
      v92 = *((double *)v87 + 18);
      while (1)
      {
        v93 = v88[1];
        v94 = *v88 > v92;
        if (*v88 <= v92)
        {
          if (v90)
          {
            v595 = 0;
            v94 = 1;
            goto LABEL_137;
          }
        }
        else if (v89 != 0 && !v90)
        {
          v595 = 0;
          v94 = 0;
          goto LABEL_137;
        }
        v95 = *((double *)v87 + 19);
        if (v93 > v95)
        {
          if (v89 != 0 && !v91)
          {
            v91 = 0;
            v595 = 0;
            goto LABEL_137;
          }
          goto LABEL_117;
        }
        if (v91)
          break;
LABEL_117:
        --v89;
        v88 += 2;
        v90 = v94;
        v91 = v93 > v95;
        if (v88 == (double *)v74)
        {
          v595 = 1;
          v91 = v93 > v95;
          goto LABEL_137;
        }
      }
      v595 = 0;
      v91 = 1;
LABEL_137:
      v104 = *a2;
      v103 = a2[1];
      if (*a2 == v103)
      {
        v108 = 3.4028e38;
        v107 = 3.4028e38;
        v106 = 3.4028e38;
        v123 = 3.4028e38;
      }
      else
      {
        v105 = 3.4028e38;
        v106 = 3.4028e38;
        v107 = 3.4028e38;
        v108 = 3.4028e38;
        do
        {
          v109 = *(double *)v104;
          v110 = vabdd_f64(*(double *)v104, *((double *)v87 + 18));
          if (v110 >= (double)*(int *)(v598 + 220))
            goto LABEL_182;
          v111 = *(double *)(v104 + 8);
          v112 = vabdd_f64(v111, *((double *)v87 + 19));
          if (v112 >= (double)*(int *)(v598 + 228)
            || v110 <= (double)*(int *)(v598 + 216) && v112 <= (double)*(int *)(v598 + 224))
          {
            goto LABEL_182;
          }
          v113 = *(float *)(v104 + 16);
          if (!-[VNParabolaDetection isValidRadius:withPrecedingRadius:]((float *)v598, v113, *((float *)v61 + 200)))
            goto LABEL_182;
          if (v595
            && (v94 && v109 > *((double *)*v590 + 18) && (v114 = (double *)v61[91], v109 >= *v114)
             || v91 && v111 > *((double *)*v590 + 19) && (v114 = (double *)v61[91], v111 >= v114[1])
             || !v94 && v109 < *((double *)*v590 + 18) && (v114 = (double *)v61[91], v109 <= *v114)
             || !v91 && v111 < *((double *)*v590 + 19) && (v114 = (double *)v61[91], v111 <= v114[1])))
          {
            v116 = (double *)v61[92];
            if (v116 == v114)
            {
              v118 = 0;
            }
            else
            {
              v117 = 0;
              v118 = 0;
              do
              {
                v119 = vsubq_f64(*(float64x2_t *)&v114[2 * v117], *(float64x2_t *)v104);
                v120 = sqrt(vaddvq_f64(vmulq_f64(v119, v119)));
                if (v120 < v106 && v120 < (double)(2 * *(_DWORD *)(v598 + 236)))
                {
                  *(_OWORD *)v633 = *(_OWORD *)v104;
                  *(float *)&v634[24] = v113;
                  v106 = v120;
                  v118 = 1;
                }
                ++v117;
              }
              while (v117 < ((char *)v116 - (char *)v114) >> 4);
            }
            v115 = v118 & 1;
          }
          else
          {
            v115 = 0;
          }
          if ((*((_BYTE *)v61 + 772) & 1) == 0 || (v121 = *(double *)v104, *(double *)v104 <= *((double *)*v590 + 18)))
          {
            if ((*((_BYTE *)v61 + 772) & 2) == 0)
              goto LABEL_182;
            v121 = *(double *)v104;
            if (*(double *)v104 >= *((double *)*v590 + 18))
              goto LABEL_182;
          }
          v122 = *(double *)(v104 + 8)
               - (v121 * *((float *)&v584 + 1)
                + v121 * *(float *)&v584 * v121
                + *((float *)&v584 + 2));
          v123 = fabsf(v122);
          if (v123 > (float)(int)ceilf(*((float *)v61 + 52) * v586))
            goto LABEL_182;
          objc_opt_self();
          if (*(double *)v104 >= *((float *)v61 + 44))
          {
            v124 = *(double *)(v104 + 8);
            if (v124 >= *((float *)v61 + 46) && *(double *)v104 <= *((float *)v61 + 45) && v124 <= *((float *)v61 + 47))
              goto LABEL_182;
          }
          if (v115)
            v107 = v123;
          if (v105 > v123)
          {
            *(_OWORD *)v605 = *(_OWORD *)v104;
            *(_DWORD *)&v605[40] = *(_DWORD *)(v104 + 16);
            if (v115)
              v108 = v106;
          }
          else
          {
LABEL_182:
            v123 = v105;
          }
          v104 += 24;
          v105 = v123;
        }
        while (v104 != v103);
      }
      v125 = *(float *)(v598 + 120);
      if (v123 >= v125)
      {
        v127 = v63;
        v64 = v86;
        v62 = (uint64_t **)(v598 + 24);
        v16 = (_OWORD *)MEMORY[0x1E0C9D538];
        goto LABEL_199;
      }
      v64 = v86;
      v62 = (uint64_t **)(v598 + 24);
      v16 = (_OWORD *)MEMORY[0x1E0C9D538];
      if (*(double *)v633 != *(double *)v605)
      {
        v126 = *(double *)&v633[1] == *(double *)&v605[8] || v108 <= v125;
        if (!v126)
        {
          if (v107 >= v125)
          {
            v106 = 3.4028e38;
          }
          else
          {
            *(_OWORD *)v605 = *(_OWORD *)v633;
            *(_OWORD *)&v605[16] = *(_OWORD *)v634;
            *(_OWORD *)&v605[28] = *(_OWORD *)&v634[12];
            v123 = v107;
          }
        }
      }
      v128 = *((float *)v61 + 200) * 0.5;
      v129 = fminf(v586, *(float *)(v598 + 168));
      if (fmax((float)(*((float *)v61 + 192) + (float)(v128 * v129)), (double)*(int *)(v598 + 140)) < v123
        || v123 > fmaxf(*((float *)v61 + 201) * 4.0, v128 * v129))
      {
        v127 = v63;
        goto LABEL_199;
      }
      *((float *)v61 + 192) = v123;
      if (v106 >= v125 || v106 >= v123)
      {
LABEL_218:
        v127 = v63;
        goto LABEL_219;
      }
      v134 = v61[13];
      v133 = v61[14];
      v135 = v106 + fmaxf(v128, 4.0);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v133 - (char *)v134) >> 4) > 9 || v123 <= v135)
        goto LABEL_217;
      v159 = (char *)v133 - (char *)(v134 + 6);
      if (v133 != v134 + 6)
        memmove(v61[13], v134 + 6, v159 - 4);
      v61[14] = (uint64_t *)((char *)v134 + v159);
      v161 = v61[16];
      v160 = v61[17];
      v162 = (char *)v160 - (char *)(v161 + 1);
      if (v160 != v161 + 1)
        memmove(v61[16], v161 + 1, (char *)v160 - (char *)(v161 + 1));
      v61[17] = (uint64_t *)((char *)v161 + v162);
      v164 = v61[19];
      v163 = v61[20];
      v165 = (char *)v163 - (char *)(v164 + 1);
      if (v163 != v164 + 1)
        memmove(v61[19], v164 + 1, (char *)v163 - (char *)(v164 + 1));
      v61[20] = (uint64_t *)((char *)v164 + v165);
      v166 = (double *)v61[13];
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v61[14] - (char *)v166) >> 4) < 4)
        goto LABEL_217;
      v167 = v166[6];
      v168 = v166[12];
      v169 = v166[18];
      if (*v166 <= v167 || v167 <= v168 || v168 <= v169)
      {
        v170 = *v166 < v167;
        if (v167 >= v168)
          v170 = 0;
        if (v168 >= v169)
          v170 = 0;
      }
      else
      {
        v170 = 2;
      }
      v230 = v166[1];
      v231 = v166[7];
      v232 = v166[13];
      v233 = v166[19];
      if (v230 <= v231 || v231 <= v232 || v232 <= v233)
      {
        if (v232 < v233 && v231 < v232 && v230 < v231)
          v234 = v170 | 4;
        else
          v234 = v170;
      }
      else
      {
        v234 = v170 | 8;
      }
      _ZF = v234 > 8 || ((1 << v234) & 0x111) == 0;
      if (_ZF)
      {
        *((_BYTE *)v61 + 772) = v234;
        v238 = 1;
LABEL_380:
        v127 = v63;
      }
      else
      {
        if (v63 < __dst)
        {
          v238 = 0;
          *v63++ = *v579;
          goto LABEL_380;
        }
        v239 = v63 - v86;
        v240 = v239 + 1;
        if ((unint64_t)(v239 + 1) >> 62)
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        if (((char *)__dst - (char *)v86) >> 1 > v240)
          v240 = ((char *)__dst - (char *)v86) >> 1;
        if ((unint64_t)((char *)__dst - (char *)v86) >= 0x7FFFFFFFFFFFFFFCLL)
          v241 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v241 = v240;
        if (v241)
          v241 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v241);
        else
          v242 = 0;
        v244 = (int *)(v241 + 4 * v239);
        *v244 = *v579;
        v127 = v244 + 1;
        while (v63 != v64)
        {
          v245 = *--v63;
          *--v244 = v245;
        }
        __dst = (int *)(v241 + 4 * v242);
        if (v64)
          operator delete(v64);
        v238 = 0;
        v64 = v244;
      }
      if (v234 > 8 || ((1 << v234) & 0x111) == 0)
      {
        v63 = v127;
        v62 = (uint64_t **)(v598 + 24);
LABEL_217:
        *(_OWORD *)v605 = *(_OWORD *)v633;
        *(_OWORD *)&v605[16] = *(_OWORD *)v634;
        *(_OWORD *)&v605[28] = *(_OWORD *)&v634[12];
        goto LABEL_218;
      }
      v62 = (uint64_t **)(v598 + 24);
      if (!v238)
        goto LABEL_199;
LABEL_219:
      v138 = v61[13];
      v137 = v61[14];
      v139 = 0xAAAAAAAAAAAAAAABLL * (((char *)v137 - (char *)v138) >> 4);
      v140 = *((float *)v61 + 52);
      *((float *)v61 + 201) = (float)(v123 + (float)(*((float *)v61 + 201) * 3.0)) * 0.25;
      if (v140 >= (float)*(int *)(v598 + 236))
      {
        v143 = (float)(v123 + (float)(v140 * (float)(int)v139)) / (float)((int)v139 + 1);
      }
      else
      {
        v141 = (float)(v123 + (float)(v140 * (float)(int)v139)) / (float)((int)v139 + 1);
        v142 = v141 + v141 * 0.5;
        v143 = v142;
      }
      *((float *)v61 + 52) = v143;
      v144 = *((unsigned __int8 *)v61 + 772);
      if ((v144 & 1) != 0)
      {
        if (*(double *)v605 < *((double *)*v590 + 18))
        {
          v145 = 254;
LABEL_228:
          v144 &= v145;
          *((_BYTE *)v61 + 772) = v144;
        }
      }
      else if ((v144 & 2) != 0 && *(double *)v605 > *((double *)*v590 + 18))
      {
        v145 = 253;
        goto LABEL_228;
      }
      if ((v144 & 4) != 0)
      {
        if (*(double *)&v605[8] < *((double *)*v590 + 19))
        {
          v146 = 251;
LABEL_235:
          v144 &= v146;
          *((_BYTE *)v61 + 772) = v144;
        }
      }
      else if ((v144 & 8) != 0 && *(double *)&v605[8] > *((double *)*v590 + 19))
      {
        v146 = 247;
        goto LABEL_235;
      }
      if (v144 <= 8 && ((1 << v144) & 0x111) != 0)
      {
        if (v127 < __dst)
          goto LABEL_239;
        v147 = v127 - v64;
        v148 = v147 + 1;
        if (!((unint64_t)(v147 + 1) >> 62))
        {
          if (((char *)__dst - (char *)v64) >> 1 > v148)
            v148 = ((char *)__dst - (char *)v64) >> 1;
          if ((unint64_t)((char *)__dst - (char *)v64) >= 0x7FFFFFFFFFFFFFFCLL)
            v149 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v149 = v148;
          if (v149)
            v149 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v149);
          else
            v150 = 0;
          v156 = (int *)(v149 + 4 * v147);
          *v156 = *v579;
          v157 = v156 + 1;
          while (v127 != v64)
          {
            v158 = *--v127;
            *--v156 = v158;
          }
          goto LABEL_376;
        }
LABEL_837:
        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
      }
      v151 = (unint64_t)v61[15];
      if ((unint64_t)v137 >= v151)
      {
        v171 = v139 + 1;
        if (v139 + 1 > 0x555555555555555)
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        v172 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v151 - (_QWORD)v138) >> 4);
        if (2 * v172 > v171)
          v171 = 2 * v172;
        if (v172 >= 0x2AAAAAAAAAAAAAALL)
          v173 = 0x555555555555555;
        else
          v173 = v171;
        if (v173)
          v173 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v173);
        else
          v174 = 0;
        v175 = (uint64_t *)(v173 + 48 * v139);
        v176 = *(_OWORD *)v605;
        v177 = *(_OWORD *)&v605[32];
        *((_OWORD *)v175 + 1) = *(_OWORD *)&v605[16];
        *((_OWORD *)v175 + 2) = v177;
        *(_OWORD *)v175 = v176;
        v179 = v61[13];
        v178 = v61[14];
        v180 = v175;
        if (v178 == v179)
        {
          v155 = v61 + 7;
        }
        else
        {
          v155 = v61 + 7;
          do
          {
            v181 = *((_OWORD *)v178 - 3);
            v182 = *((_OWORD *)v178 - 2);
            *(_OWORD *)((char *)v180 - 20) = *(_OWORD *)((char *)v178 - 20);
            *((_OWORD *)v180 - 3) = v181;
            *((_OWORD *)v180 - 2) = v182;
            v180 -= 6;
            v178 -= 6;
          }
          while (v178 != v179);
          v178 = v61[13];
        }
        v154 = v175 + 6;
        v61[13] = v180;
        v61[14] = v175 + 6;
        v61[15] = (uint64_t *)(v173 + 48 * v174);
        if (v178)
          operator delete(v178);
      }
      else
      {
        v152 = *(_OWORD *)v605;
        v153 = *(_OWORD *)&v605[32];
        *((_OWORD *)v137 + 1) = *(_OWORD *)&v605[16];
        *((_OWORD *)v137 + 2) = v153;
        *(_OWORD *)v137 = v152;
        v154 = v137 + 6;
        v155 = v61 + 7;
      }
      v61[14] = v154;
      v183 = (char *)(v154 - 24);
      v184 = (uint64_t)v61[9];
      v185 = v61[7];
      if (0xAAAAAAAAAAAAAAABLL * ((v184 - (uint64_t)v185) >> 4) >= 4)
      {
        v191 = v61[8];
        v192 = 0xAAAAAAAAAAAAAAABLL * (((char *)v191 - (char *)v185) >> 4);
        if (v192 > 3)
        {
          v190 = v61[7];
          goto LABEL_296;
        }
        if (v191 != v185)
        {
          memmove(v61[7], v183, (char *)v191 - (char *)v185 - 4);
          v183 = (char *)(v154 - 24);
          v185 = v61[8];
        }
        v193 = &v183[48 * v192];
        v194 = (char *)v154 - v193;
        if (v194)
          memmove(v185, v193, v194 - 4);
      }
      else
      {
        v186 = (char *)(v154 - 24);
        if (v185)
        {
          v61[8] = v185;
          operator delete(v185);
          v184 = 0;
          *v155 = 0;
          v155[1] = 0;
          v155[2] = 0;
        }
        v187 = 0xAAAAAAAAAAAAAAABLL * (v184 >> 4);
        v188 = 2 * v187;
        if (2 * v187 <= 4)
          v188 = 4;
        if (v187 >= 0x2AAAAAAAAAAAAAALL)
          v189 = 0x555555555555555;
        else
          v189 = v188;
        std::vector<CGPointWithPts>::__vallocate[abi:ne180100](v155, v189);
        v185 = v61[8];
        v190 = v185;
        v183 = v186;
LABEL_296:
        memmove(v190, v183, 0xBCuLL);
        v194 = 192;
      }
      v61[8] = (uint64_t *)((char *)v185 + v194);
      v195 = (void **)(v61 + 16);
      v197 = (char *)v61[17];
      v196 = (unint64_t)v61[18];
      if ((unint64_t)v197 < v196)
      {
        *(_QWORD *)v197 = *(_QWORD *)v605;
        v198 = (uint64_t *)(v197 + 8);
        goto LABEL_312;
      }
      v199 = (char *)*v195;
      v200 = (v197 - (_BYTE *)*v195) >> 3;
      v201 = v200 + 1;
      if ((unint64_t)(v200 + 1) >> 61)
        goto LABEL_838;
      v202 = v196 - (_QWORD)v199;
      if (v202 >> 2 > v201)
        v201 = v202 >> 2;
      _CF = (unint64_t)v202 >= 0x7FFFFFFFFFFFFFF8;
      v204 = 0x1FFFFFFFFFFFFFFFLL;
      if (!_CF)
        v204 = v201;
      if (v204)
      {
        v204 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v204);
        v199 = (char *)v61[16];
        v197 = (char *)v61[17];
      }
      else
      {
        v205 = 0;
      }
      v206 = (uint64_t *)(v204 + 8 * v200);
      *v206 = *(_QWORD *)v605;
      v198 = v206 + 1;
      while (v197 != v199)
      {
        v207 = *((_QWORD *)v197 - 1);
        v197 -= 8;
        *--v206 = v207;
      }
      v61[16] = v206;
      v61[17] = v198;
      v61[18] = (uint64_t *)(v204 + 8 * v205);
      if (v199)
        operator delete(v199);
LABEL_312:
      v61[17] = v198;
      v209 = (char *)v61[20];
      v208 = (unint64_t)v61[21];
      if ((unint64_t)v209 >= v208)
      {
        v211 = (char *)v61[19];
        v212 = (v209 - v211) >> 3;
        v213 = v212 + 1;
        if (!((unint64_t)(v212 + 1) >> 61))
        {
          v214 = v208 - (_QWORD)v211;
          if (v214 >> 2 > v213)
            v213 = v214 >> 2;
          _CF = (unint64_t)v214 >= 0x7FFFFFFFFFFFFFF8;
          v215 = 0x1FFFFFFFFFFFFFFFLL;
          if (!_CF)
            v215 = v213;
          if (v215)
          {
            v215 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v215);
            v211 = (char *)v61[19];
            v209 = (char *)v61[20];
          }
          else
          {
            v216 = 0;
          }
          v217 = (uint64_t *)(v215 + 8 * v212);
          *v217 = *(_QWORD *)&v605[8];
          v210 = v217 + 1;
          while (v209 != v211)
          {
            v218 = *((_QWORD *)v209 - 1);
            v209 -= 8;
            *--v217 = v218;
          }
          v61[19] = v217;
          v61[20] = v210;
          v61[21] = (uint64_t *)(v215 + 8 * v216);
          if (v211)
            operator delete(v211);
          goto LABEL_327;
        }
LABEL_838:
        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
      }
      *(_QWORD *)v209 = *(_QWORD *)&v605[8];
      v210 = (uint64_t *)(v209 + 8);
LABEL_327:
      v61[20] = v210;
      v219 = v61[97];
      *((float *)v61 + 200) = (float)((float)((float)(*((float *)v219 + 1) + *((float *)v219 + 2)) + *((float *)v219 + 3))
                                    + *(float *)&v605[40])
                            * 0.25;
      *v219 = *(uint64_t *)((char *)v219 + 4);
      *((_DWORD *)v219 + 2) = *((_DWORD *)v219 + 3);
      *((_DWORD *)v219 + 3) = *(_DWORD *)&v605[40];
      v220 = *((float *)v61 + 200);
      if (v220 < *(float *)(v598 + 164))
        v220 = v220 * 2.5;
      *((float *)v61 + 52) = v220;
      +[VNParabolaDetection updateMinMaxXYOfParabola:withPoint:]((uint64_t)VNParabolaDetection, __src, (double *)v605);
      *(float32x2_t *)&v226 = -[VNParabolaDetection computeEquationCoefficients:yValues:]((double **)v61 + 16, (double *)v61[19], v221, v222, v223, v224, v225);
      *((_OWORD *)v61 + 5) = v226;
      *((float *)v61 + 24) = -[VNParabolaDetection getRsquareOfEquation:yValues:equationConstants:]((double *)v61[16], (double *)v61[19], (double *)v61[20], (float *)v61 + 20);
      KalmanFilter::updateMeasurementAndPredict((KalmanFilter *)(v61 + 28), *(CGPoint *)v605);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v61[14] - (char *)v61[13]) >> 4) > *(int *)(v598 + 212)
        || *((float *)v61 + 24) >= 0.9)
      {
        v229 = std::__tree<std::__value_type<int,InternalObservedParabola>,std::__map_value_compare<int,std::__value_type<int,InternalObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,InternalObservedParabola>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v557, *v579, v579);
        InternalObservedParabola::operator=((uint64_t)(v229 + 6), (uint64_t)__src);
      }
      else if (v127 < __dst)
      {
LABEL_239:
        *v127++ = *v579;
      }
      else
      {
        v227 = v127 - v64;
        v228 = v227 + 1;
        if ((unint64_t)(v227 + 1) >> 62)
          goto LABEL_837;
        if (((char *)__dst - (char *)v64) >> 1 > v228)
          v228 = ((char *)__dst - (char *)v64) >> 1;
        if ((unint64_t)((char *)__dst - (char *)v64) >= 0x7FFFFFFFFFFFFFFCLL)
          v149 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v149 = v228;
        if (v149)
          v149 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v149);
        else
          v150 = 0;
        v156 = (int *)(v149 + 4 * v227);
        *v156 = *v579;
        v157 = v156 + 1;
        while (v127 != v64)
        {
          v243 = *--v127;
          *--v156 = v243;
        }
LABEL_376:
        __dst = (int *)(v149 + 4 * v150);
        if (v64)
          operator delete(v64);
        v127 = v157;
        v64 = v156;
      }
LABEL_199:
      v63 = v127;
      v65 = v566;
      v66 = v563;
LABEL_200:
      v130 = v61[1];
      if (v130)
      {
        do
        {
          v131 = (uint64_t **)v130;
          v130 = (uint64_t *)*v130;
        }
        while (v130);
      }
      else
      {
        do
        {
          v131 = (uint64_t **)v61[2];
          _ZF = *v131 == (uint64_t *)v61;
          v61 = v131;
        }
        while (!_ZF);
      }
      v61 = v131;
    }
    while (v131 != v62);
    if (v63 == v64)
    {
      v564 = v63;
    }
    else
    {
      v246 = v64;
      do
      {
        v247 = *v62;
        if (!*v62)
          goto LABEL_405;
        v248 = *v246;
        v249 = v62;
        v250 = *v62;
        do
        {
          v251 = *((_DWORD *)v250 + 8);
          v252 = v251 < v248;
          if (v251 >= v248)
            v253 = (uint64_t **)v250;
          else
            v253 = (uint64_t **)(v250 + 1);
          if (!v252)
            v249 = (uint64_t **)v250;
          v250 = *v253;
        }
        while (*v253);
        if (v249 == v62 || v248 < *((_DWORD *)v249 + 8))
LABEL_405:
          v249 = v62;
        v254 = v249[1];
        v255 = (uint64_t *)v249;
        if (v254)
        {
          do
          {
            v256 = v254;
            v254 = (uint64_t *)*v254;
          }
          while (v254);
        }
        else
        {
          do
          {
            v256 = (uint64_t *)v255[2];
            _ZF = *v256 == (_QWORD)v255;
            v255 = v256;
          }
          while (!_ZF);
        }
        if (*v557 == (uint64_t *)v249)
          *v557 = v256;
        --*(_QWORD *)(v598 + 32);
        std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v247, (uint64_t *)v249);
        InternalObservedParabola::~InternalObservedParabola((InternalObservedParabola *)(v249 + 6));
        operator delete(v249);
        ++v246;
      }
      while (v246 != v63);
      v564 = v64;
    }
LABEL_417:
    std::__tree<std::__value_type<int,ObservedParabola>,std::__map_value_compare<int,std::__value_type<int,ObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,ObservedParabola>>>::destroy(*(_QWORD **)(v598 + 192));
    *(_QWORD *)(v598 + 184) = v598 + 192;
    v576 = (uint64_t *)(v598 + 192);
    *(_QWORD *)(v598 + 192) = 0;
    *(_QWORD *)(v598 + 200) = 0;
    v257 = *(uint64_t ***)(v598 + 16);
    if (v257 != v62)
    {
      __asm { FMOV            V0.4S, #1.0 }
      v597 = *((_QWORD *)&_Q0 + 1);
      while (1)
      {
        *(_DWORD *)v605 = *((_DWORD *)v257 + 8);
        *(_QWORD *)&v605[16] = v257[6];
        memset(&v605[24], 0, 24);
        std::vector<CGPointWithPts>::__init_with_size[abi:ne180100]<CGPointWithPts*,CGPointWithPts*>(&v605[24], v257[7], (uint64_t)v257[8], 0xAAAAAAAAAAAAAAABLL * (((char *)v257[8] - (char *)v257[7]) >> 4));
        *(_OWORD *)v606 = *((_OWORD *)v257 + 5);
        LODWORD(v607) = *((_DWORD *)v257 + 24);
        v609 = 0;
        v610 = 0;
        v608 = 0;
        std::vector<CGPointWithPts>::__init_with_size[abi:ne180100]<CGPointWithPts*,CGPointWithPts*>(&v608, v257[13], (uint64_t)v257[14], 0xAAAAAAAAAAAAAAABLL * (((char *)v257[14] - (char *)v257[13]) >> 4));
        v611 = 0;
        v612 = 0;
        v613 = 0;
        std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v611, v257[16], (uint64_t)v257[17], v257[17] - v257[16]);
        v614 = 0;
        v615 = 0;
        v616 = 0;
        std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v614, v257[19], (uint64_t)v257[20], v257[20] - v257[19]);
        v260 = *((_OWORD *)v257 + 12);
        v617 = *((_OWORD *)v257 + 11);
        v618 = v260;
        v619[0] = *((_DWORD *)v257 + 52);
        memcpy(v620, v257 + 28, sizeof(v620));
        v622 = 0;
        v623 = 0;
        v621 = 0;
        std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(&v621, v257[88], (uint64_t)v257[89], ((char *)v257[89] - (char *)v257[88]) >> 4);
        v624 = 0;
        v625 = 0;
        v626 = 0;
        std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(&v624, v257[91], (uint64_t)v257[92], ((char *)v257[92] - (char *)v257[91]) >> 4);
        v627 = *((_OWORD *)v257 + 47);
        LODWORD(v628) = *((_DWORD *)v257 + 192);
        BYTE4(v628) = *((_BYTE *)v257 + 772);
        v630 = 0;
        v631 = 0;
        v629 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v629, v257[97], (uint64_t)v257[98], ((char *)v257[98] - (char *)v257[97]) >> 2);
        v632 = v257[100];
        if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v609 - (_BYTE *)v608) >> 4) >= *(int *)(v598 + 212))
          break;
LABEL_489:
        if (v629)
        {
          v630 = v629;
          operator delete(v629);
        }
        if (v624)
        {
          v625 = v624;
          operator delete(v624);
        }
        if (v621)
        {
          v622 = v621;
          operator delete(v621);
        }
        if (v614)
        {
          v615 = (double *)v614;
          operator delete(v614);
        }
        if (v611)
        {
          v612 = v611;
          operator delete(v611);
        }
        if (v608)
        {
          v609 = v608;
          operator delete(v608);
        }
        if (*(_QWORD *)&v605[24])
        {
          *(_QWORD *)&v605[32] = *(_QWORD *)&v605[24];
          operator delete(*(void **)&v605[24]);
        }

        v322 = v257[1];
        if (v322)
        {
          do
          {
            v323 = (uint64_t **)v322;
            v322 = (uint64_t *)*v322;
          }
          while (v322);
        }
        else
        {
          do
          {
            v323 = (uint64_t **)v257[2];
            _ZF = *v323 == (uint64_t *)v257;
            v257 = v323;
          }
          while (!_ZF);
        }
        v257 = v323;
        if (v323 == v62)
          goto LABEL_509;
      }
      v261 = v598 + 192;
      v262 = *v576;
      v263 = (uint64_t **)(v598 + 192);
      if (*v576)
      {
        while (1)
        {
          while (1)
          {
            v261 = v262;
            v264 = *(_DWORD *)(v262 + 32);
            if (*(int *)v605 >= v264)
              break;
            v262 = *(_QWORD *)v261;
            v263 = (uint64_t **)v261;
            if (!*(_QWORD *)v261)
              goto LABEL_427;
          }
          if (v264 >= *(int *)v605)
            break;
          v262 = *(_QWORD *)(v261 + 8);
          if (!v262)
          {
            v263 = (uint64_t **)(v261 + 8);
            goto LABEL_427;
          }
        }
      }
      else
      {
LABEL_427:
        v265 = operator new(0xC0uLL);
        v633[1] = (void *)(v598 + 192);
        v265[8] = *(_DWORD *)v605;
        *((_OWORD *)v265 + 3) = 0u;
        *((_OWORD *)v265 + 4) = 0u;
        *((_OWORD *)v265 + 5) = 0u;
        *((_OWORD *)v265 + 6) = 0u;
        *((_OWORD *)v265 + 7) = 0u;
        *((_OWORD *)v265 + 8) = 0u;
        *((_OWORD *)v265 + 9) = 0u;
        *((_OWORD *)v265 + 10) = 0u;
        *((_OWORD *)v265 + 11) = 0u;
        v634[0] = 1;
        std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::__insert_node_at((uint64_t **)(v598 + 184), v261, v263, (uint64_t *)v265);
        v633[0] = 0;
        std::unique_ptr<std::__tree_node<std::__value_type<int,ObservedParabola>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,ObservedParabola>,void *>>>>::reset[abi:ne180100]((uint64_t)v633);
        v261 = (uint64_t)v265;
      }
      objc_storeStrong((id *)(v261 + 48), *(id *)&v605[16]);
      v266 = 0;
      v267 = 0;
      if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v609 - (_BYTE *)v608) >> 4) >= 5)
        v268 = 5;
      else
        v268 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v609 - (_BYTE *)v608) >> 4);
      if (v268)
      {
        v269 = 0;
        do
        {
          v270 = *((double *)v608 + 6 * (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v609 - (_BYTE *)v608) >> 4) - v268));
          v271.i64[1] = v597;
          v271.f32[0] = v270 * v270;
          v271.f32[1] = v270;
          v272 = vmulq_f32(v271, *(float32x4_t *)v606);
          v273 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v272, 2), vaddq_f32(v272, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v272.f32, 1))).f32[0];
          v274 = v270;
          if ((unint64_t)v267 >= v269)
          {
            v275 = ((char *)v267 - (char *)v266) >> 4;
            v276 = v275 + 1;
            if ((unint64_t)(v275 + 1) >> 60)
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            if ((uint64_t)(v269 - (_QWORD)v266) >> 3 > v276)
              v276 = (uint64_t)(v269 - (_QWORD)v266) >> 3;
            if (v269 - (unint64_t)v266 >= 0x7FFFFFFFFFFFFFF0)
              v277 = 0xFFFFFFFFFFFFFFFLL;
            else
              v277 = v276;
            if (v277)
              v277 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v277);
            else
              v278 = 0;
            v279 = (double *)(v277 + 16 * v275);
            *v279 = v274;
            v279[1] = v273;
            if (v267 == v266)
            {
              v281 = (double *)(v277 + 16 * v275);
            }
            else
            {
              v280 = v277 + 16 * v275;
              do
              {
                v281 = (double *)(v280 - 16);
                *(_OWORD *)(v280 - 16) = *((_OWORD *)v267 - 1);
                v267 -= 2;
                v280 -= 16;
              }
              while (v267 != v266);
            }
            v269 = v277 + 16 * v278;
            v267 = v279 + 2;
            if (v266)
              operator delete(v266);
            v266 = v281;
          }
          else
          {
            *v267 = v274;
            v267[1] = v273;
            v267 += 2;
          }
          v126 = v268-- <= 1;
        }
        while (!v126);
      }
      std::vector<CGPoint>::__assign_with_size[abi:ne180100]<CGPoint*,CGPoint*>((char *)(v261 + 56), (char *)v266, (uint64_t)v267, ((char *)v267 - (char *)v266) >> 4);
      v62 = (uint64_t **)(v598 + 24);
      v282 = 0uLL;
      if (!*(_DWORD *)(v598 + 124) || !*(_DWORD *)(v598 + 128))
      {
LABEL_473:
        *(_OWORD *)(v261 + 112) = v282;
        v310 = ((_BYTE *)v609 - (_BYTE *)v608) / 48;
        if (v310 >= *(int *)(v598 + 212))
          v311 = *(int *)(v598 + 212);
        else
          v311 = ((_BYTE *)v609 - (_BYTE *)v608) / 48;
        if (v311)
        {
          if (v311 >> 60)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          v312 = std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v311);
          bzero(v312, 16 * v311);
          v313 = (uint64_t)v312 + 16 * v311;
        }
        else
        {
          v312 = 0;
          v313 = 0;
        }
        if (v310 < v311)
        {
          LODWORD(v311) = 0;
          v315 = 0.0;
        }
        else
        {
          v314 = 48 * v310 - 48 * v311;
          v315 = 0.0;
          v316 = v311;
          v317 = v312;
          do
          {
            v318 = (float *)((char *)v608 + v314);
            *v317++ = *(_OWORD *)((char *)v608 + v314);
            v315 = v315 + v318[10];
            v314 += 48;
            --v316;
          }
          while (v316);
        }
        *(float *)(v261 + 128) = fmaxf(*(float *)&v607, 0.0);
        std::vector<CGPoint>::__assign_with_size[abi:ne180100]<CGPoint*,CGPoint*>((char *)(v261 + 80), (char *)v312, v313, (v313 - (uint64_t)v312) >> 4);
        *(double *)(v261 + 104) = v315 / (double)(int)v311;
        v319 = v609;
        v320 = *((_QWORD *)v608 + 4);
        *(_OWORD *)(v261 + 132) = *((_OWORD *)v608 + 1);
        *(_QWORD *)(v261 + 148) = v320;
        v321 = *(v319 - 2);
        *(_OWORD *)(v261 + 156) = *((_OWORD *)v319 - 2);
        *(_QWORD *)(v261 + 172) = v321;
        if (v312)
          operator delete(v312);
        if (v266)
          operator delete(v266);
        goto LABEL_489;
      }
      v633[0] = 0;
      std::vector<double>::vector(v601, ((_BYTE *)v612 - (_BYTE *)v611) >> 3, v633);
      v633[0] = 0;
      std::vector<double>::vector(&__p, ((char *)v615 - (_BYTE *)v614) >> 3, v633);
      v286 = (double *)v611;
      v287 = (double *)v612;
      v288 = v601[0];
      if (v611 != v612)
      {
        v289 = v601[0];
        v290 = 1.0 / (float)*(int *)(v598 + 124);
        do
        {
          v291 = *v286++;
          v292 = v291;
          *v289++ = (float)(v290 * v292);
        }
        while (v286 != v287);
      }
      v293 = (double *)v614;
      v294 = v615;
      v295 = (double *)__p;
      if (v614 != v615)
      {
        v296 = (double *)__p;
        v297 = 1.0 / (float)*(int *)(v598 + 128);
        do
        {
          v298 = *v293++;
          v299 = v298;
          *v296++ = (float)(v297 * v299);
        }
        while (v293 != v294);
      }
      polynomialFit((const double *)v633, v288, v295, v601[1] - v288, v283, v284, v285);
      v639 = *(_QWORD *)v601[0];
      if (!*(_QWORD *)&v634[8])
        std::__throw_bad_function_call[abi:ne180100]();
      (*(void (**)(double **__return_ptr, _QWORD, uint64_t *))(**(_QWORD **)&v634[8] + 48))(&v635, *(_QWORD *)&v634[8], &v639);
      v300 = v635;
      v302 = v635[2];
      v301 = v635[3];
      v303 = v635[1];
      *(double *)&v304 = v303 + v301 * -2.0 * v302;
      v567 = v304;
      v568 = v302;
      v305 = *v635 + v302 * (v301 * v301) - v303 * v301;
      *v635 = v305;
      *((_QWORD *)v300 + 1) = v304;
      v306 = *(void ***)&v634[8];
      if (*(void ***)&v634[8] == v633)
      {
        v306 = v633;
        v307 = 4;
      }
      else
      {
        if (!*(_QWORD *)&v634[8])
        {
LABEL_468:
          if (__p)
          {
            __p_8[0] = __p;
            operator delete(__p);
          }
          if (v601[0])
          {
            v601[1] = v601[0];
            operator delete(v601[0]);
          }
          v308.f64[0] = v568;
          *(_QWORD *)&v308.f64[1] = v567;
          *(float32x2_t *)&v309 = vcvt_f32_f64(v308);
          *(float *)v308.f64 = v305;
          *((_QWORD *)&v309 + 1) = __PAIR64__(HIDWORD(v567), LODWORD(v308.f64[0]));
          v569 = v309;
          operator delete(v300);
          v282 = v569;
          goto LABEL_473;
        }
        v307 = 5;
      }
      (*((void (**)(void))*v306 + v307))();
      goto LABEL_468;
    }
LABEL_509:
    if (v564)
      operator delete(v564);
  }
  v324 = v598;
  if (*(_QWORD *)(v598 + 96) >= 5uLL)
  {
    v550 = 0;
    __srca = 0;
    v633[1] = 0;
    v633[0] = 0;
    v539 = (uint64_t **)(v598 + 16);
    *(_QWORD *)v634 = 0;
    v534 = 0;
    v601[1] = 0;
    v601[0] = 0;
    v602 = 0;
    v535 = (_DWORD *)(v598 + 8);
    v325 = 1;
    v326 = 2;
    v538 = (uint64_t *)(v598 + 24);
    do
    {
      v531 = v326;
      v532 = v325;
      v327 = v325;
      do
      {
        v533 = v326;
        if (v327 <= 2)
        {
          v565 = (char *)v326;
          v536 = v327;
          do
          {
            v328 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(v598 + 64) + 8 * ((*(_QWORD *)(v598 + 88) + v534) / 0xAAuLL))
                             + 24 * ((*(_QWORD *)(v598 + 88) + v534) % 0xAAuLL));
            v329 = *v328;
            v537 = v328[1];
            if (*v328 != v537)
            {
              do
              {
                v330 = *(double *)v329;
                v331 = *(double *)(v329 + 8);
                v332 = *(_QWORD *)(v329 + 16);
                v635 = *(double **)(v329 + 28);
                v636 = *(_DWORD *)(v329 + 36);
                v333 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(v598 + 64) + 8 * ((*(_QWORD *)(v598 + 88) + v327) / 0xAA))
                                 + 24 * ((*(_QWORD *)(v598 + 88) + v327) % 0xAA));
                v334 = *v333;
                v335 = v333[1];
                v540 = v329;
                if (*v333 != v335)
                {
                  v336 = *(float *)(v329 + 40);
                  v546 = *(_DWORD *)(v329 + 44);
                  v547 = *(_DWORD *)(v329 + 24);
                  v548 = v332;
                  v552 = (float)((float)v332 / (float)v547);
                  v544 = v331;
                  v545 = v330;
                  v542 = v333[1];
                  v543 = v336;
                  do
                  {
                    v338 = *(double *)v334;
                    v337 = *(double *)(v334 + 8);
                    v339 = *(_QWORD *)(v334 + 16);
                    v639 = *(_QWORD *)(v334 + 28);
                    v640 = *(_DWORD *)(v334 + 36);
                    v340 = *(_DWORD *)(v334 + 24);
                    v341 = (CMTime **)(*(_QWORD *)(*(_QWORD *)(v598 + 64)
                                                 + 8 * ((unint64_t)&v565[*(_QWORD *)(v598 + 88)] / 0xAA))
                                     + 24 * ((unint64_t)&v565[*(_QWORD *)(v598 + 88)] % 0xAA));
                    v343 = *v341;
                    v342 = v341[1];
                    if (*v341 != v342)
                    {
                      v344 = *(float *)(v334 + 40);
                      v558 = *(_DWORD *)(v334 + 44);
                      v345 = vabdd_f64(v330, v338);
                      v596 = v337;
                      v593 = vabdd_f64(v331, v337);
                      v556 = (float)((float)v339 / (float)v340);
                      v577 = vabdd_f64(v338, v330);
                      v582 = v338;
                      do
                      {
                        v347 = *(double *)&v343->value;
                        v346 = *(double *)&v343->timescale;
                        epoch = v343->epoch;
                        value = v343[1].value;
                        v637 = *(CMTimeValue *)((char *)&v343[1].value + 4);
                        flags = v343[1].flags;
                        v350 = (double)*(int *)(v598 + 220);
                        if (v345 < v350)
                        {
                          v351 = (double)*(int *)(v598 + 228);
                          v352 = vabdd_f64(v338, v347);
                          v353 = v593 < v351 && v352 < v350;
                          v354 = vabdd_f64(v596, v346);
                          if (v353 && v354 < v351)
                          {
                            v356 = v338;
                            v357 = *(float *)&v343[1].epoch;
                            v358 = v331 < v596;
                            v359 = v331 > v596;
                            v360 = v330 < v356;
                            v361 = v330 > v356;
                            if (v356 <= v347)
                              v361 = 0;
                            if (v356 >= v347)
                              v360 = 0;
                            v591 = v360;
                            if (v596 <= v346)
                              v359 = 0;
                            __dsta = v359;
                            if (v596 >= v346)
                              v358 = 0;
                            v587 = v358;
                            v585 = v361;
                            if (v361 || v360 || v359 || v358)
                            {
                              epoch_high = HIDWORD(v343[1].epoch);
                              v574 = v345;
                              v572 = v342;
                              v578 = v340;
                              v580 = v339;
                              if (-[VNParabolaDetection isValidRadius:withPrecedingRadius:]((float *)v598, v344, v336))
                              {
                                if (-[VNParabolaDetection isValidRadius:withPrecedingRadius:]((float *)v598, v357, v344))
                                {
                                  v549 = v334;
                                  v362 = v601[0];
                                  v363 = v602;
                                  v601[1] = v601[0];
                                  if (v601[0] >= v602)
                                  {
                                    v365 = ((char *)v602 - (char *)v601[0]) >> 2;
                                    if (v365 <= 1)
                                      v365 = 1;
                                    if ((unint64_t)((char *)v602 - (char *)v601[0]) >= 0x7FFFFFFFFFFFFFF8)
                                      v366 = 0x1FFFFFFFFFFFFFFFLL;
                                    else
                                      v366 = v365;
                                    v367 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v366);
                                    *v367 = v330;
                                    v364 = v367 + 1;
                                    v363 = &v367[v368];
                                    v601[0] = v367;
                                    v602 = v363;
                                    if (v362)
                                      operator delete(v362);
                                  }
                                  else
                                  {
                                    *v601[0] = v330;
                                    v364 = v362 + 1;
                                  }
                                  v369 = v550;
                                  v370 = v580;
                                  v371 = v578;
                                  v601[1] = v364;
                                  if ((unint64_t)__srca >= v550)
                                  {
                                    v373 = (uint64_t)(v550 - (_QWORD)__srca) >> 2;
                                    if (v373 <= 1)
                                      v373 = 1;
                                    if (v550 - (unint64_t)__srca >= 0x7FFFFFFFFFFFFFF8)
                                      v374 = 0x1FFFFFFFFFFFFFFFLL;
                                    else
                                      v374 = v373;
                                    v376 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v374);
                                    v369 = (unint64_t)&v376[v375];
                                    *v376 = v331;
                                    v372 = v376 + 1;
                                    if (__srca)
                                    {
                                      v377 = &v376[v375];
                                      operator delete(__srca);
                                      v369 = (unint64_t)v377;
                                      v364 = v601[1];
                                      v363 = v602;
                                    }
                                    __srca = v376;
                                    v370 = v580;
                                    v371 = v578;
                                  }
                                  else
                                  {
                                    *__srca = v331;
                                    v372 = __srca + 1;
                                  }
                                  if (v364 >= v363)
                                  {
                                    v379 = v369;
                                    v380 = v601[0];
                                    v381 = v364 - v601[0];
                                    v382 = v381 + 1;
                                    if ((unint64_t)(v381 + 1) >> 61)
                                      goto LABEL_827;
                                    if (((char *)v363 - (char *)v601[0]) >> 2 > v382)
                                      v382 = ((char *)v363 - (char *)v601[0]) >> 2;
                                    if ((unint64_t)((char *)v363 - (char *)v601[0]) >= 0x7FFFFFFFFFFFFFF8)
                                      v383 = 0x1FFFFFFFFFFFFFFFLL;
                                    else
                                      v383 = v382;
                                    if (v383)
                                      v383 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v383);
                                    else
                                      v384 = 0;
                                    v385 = (double *)(v383 + 8 * v381);
                                    *v385 = v582;
                                    v378 = v385 + 1;
                                    while (v364 != v380)
                                    {
                                      v386 = *((_QWORD *)v364-- - 1);
                                      *((_QWORD *)v385-- - 1) = v386;
                                    }
                                    v363 = (double *)(v383 + 8 * v384);
                                    v601[0] = v385;
                                    v602 = v363;
                                    if (v380)
                                      operator delete(v380);
                                    v369 = v379;
                                    v370 = v580;
                                    v371 = v578;
                                  }
                                  else
                                  {
                                    *v364 = v582;
                                    v378 = v364 + 1;
                                  }
                                  v601[1] = v378;
                                  if ((unint64_t)v372 >= v369)
                                  {
                                    v388 = v369;
                                    v389 = v372 - __srca;
                                    v390 = v389 + 1;
                                    if ((unint64_t)(v389 + 1) >> 61)
                                      goto LABEL_827;
                                    if ((uint64_t)(v388 - (_QWORD)__srca) >> 2 > v390)
                                      v390 = (uint64_t)(v388 - (_QWORD)__srca) >> 2;
                                    if (v388 - (unint64_t)__srca >= 0x7FFFFFFFFFFFFFF8)
                                      v391 = 0x1FFFFFFFFFFFFFFFLL;
                                    else
                                      v391 = v390;
                                    if (v391)
                                      v391 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v391);
                                    else
                                      v392 = 0;
                                    v387 = (double *)(v391 + 8 * v389);
                                    *v387 = v596;
                                    v393 = v387;
                                    if (v372 != __srca)
                                    {
                                      v393 = v387;
                                      do
                                      {
                                        v394 = *((_QWORD *)v372-- - 1);
                                        *((_QWORD *)v393-- - 1) = v394;
                                      }
                                      while (v372 != __srca);
                                    }
                                    v395 = v391 + 8 * v392;
                                    operator delete(__srca);
                                    v369 = v395;
                                    v378 = v601[1];
                                    v363 = v602;
                                    __srca = v393;
                                    v370 = v580;
                                    v371 = v578;
                                  }
                                  else
                                  {
                                    *v372 = v596;
                                    v387 = v372;
                                  }
                                  if (v378 >= v363)
                                  {
                                    v397 = v369;
                                    v398 = v601[0];
                                    v399 = v378 - v601[0];
                                    v400 = v399 + 1;
                                    if ((unint64_t)(v399 + 1) >> 61)
                                      goto LABEL_827;
                                    if (((char *)v363 - (char *)v601[0]) >> 2 > v400)
                                      v400 = ((char *)v363 - (char *)v601[0]) >> 2;
                                    if ((unint64_t)((char *)v363 - (char *)v601[0]) >= 0x7FFFFFFFFFFFFFF8)
                                      v401 = 0x1FFFFFFFFFFFFFFFLL;
                                    else
                                      v401 = v400;
                                    if (v401)
                                      v401 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v401);
                                    else
                                      v402 = 0;
                                    v403 = (double *)(v401 + 8 * v399);
                                    *v403 = v347;
                                    for (i = v403 + 1; v378 != v398; --v403)
                                    {
                                      v404 = *((_QWORD *)v378-- - 1);
                                      *((_QWORD *)v403 - 1) = v404;
                                    }
                                    v601[0] = v403;
                                    v602 = (double *)(v401 + 8 * v402);
                                    if (v398)
                                      operator delete(v398);
                                    v369 = v397;
                                    v370 = v580;
                                    v371 = v578;
                                  }
                                  else
                                  {
                                    *v378 = v347;
                                    i = v378 + 1;
                                  }
                                  v405 = v387 + 1;
                                  v601[1] = i;
                                  if ((unint64_t)(v387 + 1) >= v369)
                                  {
                                    v406 = v369;
                                    v407 = v405 - __srca;
                                    v408 = v407 + 1;
                                    if ((unint64_t)(v407 + 1) >> 61)
LABEL_827:
                                      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                                    if ((uint64_t)(v406 - (_QWORD)__srca) >> 2 > v408)
                                      v408 = (uint64_t)(v406 - (_QWORD)__srca) >> 2;
                                    if (v406 - (unint64_t)__srca >= 0x7FFFFFFFFFFFFFF8)
                                      v409 = 0x1FFFFFFFFFFFFFFFLL;
                                    else
                                      v409 = v408;
                                    if (v409)
                                      v409 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v409);
                                    else
                                      v410 = 0;
                                    v411 = (double *)(v409 + 8 * v407);
                                    *v411 = v346;
                                    v412 = v411 + 1;
                                    if (v405 == __srca)
                                    {
                                      v413 = __srca;
                                    }
                                    else
                                    {
                                      v413 = __srca;
                                      do
                                      {
                                        v414 = *((_QWORD *)v405-- - 1);
                                        *((_QWORD *)v411-- - 1) = v414;
                                      }
                                      while (v405 != __srca);
                                    }
                                    v541 = v412;
                                    v415 = v409 + 8 * v410;
                                    operator delete(v413);
                                    v369 = v415;
                                    __srca = v411;
                                    v370 = v580;
                                    v371 = v578;
                                  }
                                  else
                                  {
                                    v387[1] = v346;
                                    v541 = v387 + 2;
                                  }
                                  v550 = v369;
                                  v416 = (double *)v633[0];
                                  v417 = *(_QWORD *)v634;
                                  v633[1] = v633[0];
                                  if (v633[0] >= (void *)*(_QWORD *)v634)
                                  {
                                    v419 = 0x5555555555555556
                                         * ((uint64_t)(*(_QWORD *)v634 - (unint64_t)v633[0]) >> 4);
                                    if (v419 <= 1)
                                      v419 = 1;
                                    if (0xAAAAAAAAAAAAAAABLL
                                       * ((uint64_t)(*(_QWORD *)v634 - (unint64_t)v633[0]) >> 4) >= 0x2AAAAAAAAAAAAAALL)
                                      v420 = 0x555555555555555;
                                    else
                                      v420 = v419;
                                    v421 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v420);
                                    *(double *)v421 = v330;
                                    *((double *)v421 + 1) = v331;
                                    v417 = (unint64_t)&v421[48 * v422];
                                    *((_QWORD *)v421 + 2) = v548;
                                    *((_DWORD *)v421 + 6) = v547;
                                    *(_QWORD *)(v421 + 28) = v635;
                                    *((_DWORD *)v421 + 9) = v636;
                                    *((float *)v421 + 10) = v336;
                                    *((_DWORD *)v421 + 11) = v546;
                                    v418 = (double *)(v421 + 48);
                                    v633[0] = v421;
                                    *(_QWORD *)v634 = v417;
                                    if (v416)
                                      operator delete(v416);
                                    v416 = (double *)v421;
                                    v370 = v580;
                                    v371 = v578;
                                  }
                                  else
                                  {
                                    *(double *)v633[0] = v330;
                                    v416[1] = v331;
                                    *((_QWORD *)v416 + 2) = v548;
                                    *((_DWORD *)v416 + 6) = v547;
                                    *(_QWORD *)((char *)v416 + 28) = v635;
                                    *((_DWORD *)v416 + 9) = v636;
                                    *((float *)v416 + 10) = v336;
                                    *((_DWORD *)v416 + 11) = v546;
                                    v418 = v416 + 6;
                                  }
                                  v633[1] = v418;
                                  if ((unint64_t)v418 >= v417)
                                  {
                                    v424 = 0xAAAAAAAAAAAAAAABLL * (((char *)v418 - (char *)v416) >> 4) + 1;
                                    if (v424 > 0x555555555555555)
                                      goto LABEL_828;
                                    if (0x5555555555555556 * ((uint64_t)(v417 - (_QWORD)v416) >> 4) > v424)
                                      v424 = 0x5555555555555556 * ((uint64_t)(v417 - (_QWORD)v416) >> 4);
                                    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v417 - (_QWORD)v416) >> 4) >= 0x2AAAAAAAAAAAAAALL)
                                      v425 = 0x555555555555555;
                                    else
                                      v425 = v424;
                                    if (v425)
                                      v425 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v425);
                                    else
                                      v426 = 0;
                                    v423 = (double *)(v425 + 16 * (((char *)v418 - (char *)v416) >> 4));
                                    *v423 = v582;
                                    v423[1] = v596;
                                    *((_QWORD *)v423 + 2) = v580;
                                    *((_DWORD *)v423 + 6) = v578;
                                    *(_QWORD *)((char *)v423 + 28) = v639;
                                    *((_DWORD *)v423 + 9) = v640;
                                    *((float *)v423 + 10) = v344;
                                    *((_DWORD *)v423 + 11) = v558;
                                    v427 = v423;
                                    if (v418 != v416)
                                    {
                                      v428 = v425 + 16 * (((char *)v418 - (char *)v416) >> 4);
                                      do
                                      {
                                        v429 = *((_OWORD *)v418 - 3);
                                        v430 = *((_OWORD *)v418 - 2);
                                        v427 = (double *)(v428 - 48);
                                        *(_OWORD *)(v428 - 20) = *(_OWORD *)((char *)v418 - 20);
                                        *(_OWORD *)(v428 - 48) = v429;
                                        *(_OWORD *)(v428 - 32) = v430;
                                        v418 -= 6;
                                        v428 -= 48;
                                      }
                                      while (v418 != v416);
                                    }
                                    v417 = v425 + 48 * v426;
                                    v633[0] = v427;
                                    *(_QWORD *)v634 = v417;
                                    operator delete(v416);
                                    v416 = v427;
                                  }
                                  else
                                  {
                                    *v418 = v582;
                                    v418[1] = v596;
                                    *((_QWORD *)v418 + 2) = v370;
                                    *((_DWORD *)v418 + 6) = v371;
                                    *(_QWORD *)((char *)v418 + 28) = v639;
                                    *((_DWORD *)v418 + 9) = v640;
                                    *((float *)v418 + 10) = v344;
                                    *((_DWORD *)v418 + 11) = v558;
                                    v423 = v418;
                                  }
                                  v431 = v423 + 6;
                                  v633[1] = v423 + 6;
                                  if ((unint64_t)(v423 + 6) >= v417)
                                  {
                                    v433 = 0xAAAAAAAAAAAAAAABLL * (((char *)v431 - (char *)v416) >> 4) + 1;
                                    if (v433 > 0x555555555555555)
LABEL_828:
                                      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                                    if (0x5555555555555556 * ((uint64_t)(v417 - (_QWORD)v416) >> 4) > v433)
                                      v433 = 0x5555555555555556 * ((uint64_t)(v417 - (_QWORD)v416) >> 4);
                                    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v417 - (_QWORD)v416) >> 4) >= 0x2AAAAAAAAAAAAAALL)
                                      v434 = 0x555555555555555;
                                    else
                                      v434 = v433;
                                    if (v434)
                                      v434 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v434);
                                    else
                                      v435 = 0;
                                    v436 = v434 + 16 * (((char *)v431 - (char *)v416) >> 4);
                                    *(double *)v436 = v347;
                                    *(double *)(v436 + 8) = v346;
                                    *(_QWORD *)(v436 + 16) = epoch;
                                    *(_DWORD *)(v436 + 24) = value;
                                    *(_QWORD *)(v436 + 28) = v637;
                                    *(_DWORD *)(v436 + 36) = flags;
                                    *(float *)(v436 + 40) = v357;
                                    *(_DWORD *)(v436 + 44) = epoch_high;
                                    if (v431 == v416)
                                    {
                                      v440 = (void *)(v434 + 16 * (((char *)v431 - (char *)v416) >> 4));
                                    }
                                    else
                                    {
                                      v437 = v434 + 16 * (((char *)v431 - (char *)v416) >> 4);
                                      do
                                      {
                                        v438 = *((_OWORD *)v431 - 3);
                                        v439 = *((_OWORD *)v431 - 2);
                                        v440 = (void *)(v437 - 48);
                                        *(_OWORD *)(v437 - 20) = *(_OWORD *)((char *)v431 - 20);
                                        *(_OWORD *)(v437 - 48) = v438;
                                        *(_OWORD *)(v437 - 32) = v439;
                                        v431 -= 6;
                                        v437 -= 48;
                                      }
                                      while (v431 != v416);
                                    }
                                    v432 = (void *)(v436 + 48);
                                    v633[0] = v440;
                                    v633[1] = (void *)(v436 + 48);
                                    *(_QWORD *)v634 = v434 + 48 * v435;
                                    operator delete(v416);
                                    v416 = (double *)v633[0];
                                  }
                                  else
                                  {
                                    v423[6] = v347;
                                    v423[7] = v346;
                                    *((_QWORD *)v423 + 8) = epoch;
                                    *((_DWORD *)v423 + 18) = value;
                                    *(_QWORD *)((char *)v423 + 76) = v637;
                                    *((_DWORD *)v423 + 21) = flags;
                                    *((float *)v423 + 22) = v357;
                                    *((_DWORD *)v423 + 23) = epoch_high;
                                    v432 = v423 + 12;
                                  }
                                  v633[1] = v432;
                                  __p = 0;
                                  *(_OWORD *)__p_8 = 0uLL;
                                  std::vector<CGPointWithPts>::__assign_with_size[abi:ne180100]<CGPointWithPts*,CGPointWithPts*>((char *)&__p, (char *)v416, (uint64_t)v432, 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v432 - (_BYTE *)v416) >> 4));
                                  v446 = -[VNParabolaDetection computeEquationCoefficients:yValues:](v601, __srca, v441, v442, v443, v444, v445);
                                  if ((unint64_t)v565 > 3)
                                  {
                                    v551 = 0;
                                    v559 = 3.4028e38;
                                  }
                                  else
                                  {
                                    v551 = 0;
                                    v554 = v446.f32[1];
                                    v555 = v446.f32[0];
                                    v553 = v447;
                                    v571 = vabdd_f64(v347, v582);
                                    v570 = (float)((float)epoch / (float)value);
                                    v559 = 3.4028e38;
                                    v448 = (unint64_t)v565;
                                    do
                                    {
                                      v449 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(v598 + 64)
                                                                   + 8 * ((*(_QWORD *)(v598 + 88) + v448 + 1) / 0xAA))
                                                       + 24 * ((*(_QWORD *)(v598 + 88) + v448 + 1) % 0xAA));
                                      v450 = *v449;
                                      v451 = v449[1];
                                      while (v450 != v451)
                                      {
                                        v452 = *(double *)v450;
                                        v453 = *(double *)(v450 + 8);
                                        v454 = *(_QWORD *)(v450 + 16);
                                        v455 = *(_DWORD *)(v450 + 24);
                                        *(_QWORD *)v605 = *(_QWORD *)(v450 + 28);
                                        *(_DWORD *)&v605[8] = *(_DWORD *)(v450 + 36);
                                        v456 = vabdd_f64(v452, v347);
                                        if (v456 < (double)*(int *)(v598 + 220))
                                        {
                                          v457 = vabdd_f64(v453, v346);
                                          if (v457 < (double)*(int *)(v598 + 228))
                                          {
                                            v458 = *(_DWORD *)(v450 + 40);
                                            v459 = *(_DWORD *)(v450 + 44);
                                            if ((v456 > (double)*(int *)(v598 + 216)
                                               || v457 > (double)*(int *)(v598 + 224))
                                              && -[VNParabolaDetection isValidRadius:withPrecedingRadius:]((float *)v598, *(float *)(v450 + 40), v357))
                                            {
                                              v460 = v591;
                                              if (v347 >= v452)
                                                v460 = 0;
                                              if (v585 && v347 > v452)
                                                v461 = 2;
                                              else
                                                v461 = v460;
                                              v462 = __dsta;
                                              if (v346 <= v453)
                                                v462 = 0;
                                              if (v587 && v346 < v453)
                                                v463 = v461 | 4;
                                              else
                                                v463 = v461;
                                              v464 = v461 | 8;
                                              if (v462)
                                                v465 = v464;
                                              else
                                                v465 = v463;
                                              if (v465 > 8 || ((1 << v465) & 0x111) == 0)
                                              {
                                                v467 = *(float *)(v598 + 208);
                                                v468 = v577 / ((v556 - v552) * v467);
                                                v469 = v571 / ((v570 - v556) * v467);
                                                v470 = (float)((float)v454 / (float)v455) - v570;
                                                v471 = v456 / (v470 * v467);
                                                v472 = (float)((float)(v468 + v469) + v471) / 3.0;
                                                if (sqrtf((float)((float)((float)((float)((float)(v468 - v472)* (float)(v468 - v472))+ 0.0)+ (float)((float)(v469 - v472)* (float)(v469 - v472)))+ (float)((float)(v471 - v472) * (float)(v471 - v472)))/ 3.0) <= *(float *)(v598 + 172))
                                                {
                                                  v473 = v453 - (v452 * v554 + v555 * (v452 * v452) + v553);
                                                  v474 = fabsf(v473);
                                                  v475 = v470;
                                                  if (v474 <= (float)(fminf(v467 * v475, *(float *)(v598 + 144))
                                                                     * *(float *)(v598 + 112))
                                                    && v559 > v474)
                                                  {
                                                    v476 = (char *)__p_8[0];
                                                    if (__p_8[0] >= __p_8[1])
                                                    {
                                                      v479 = __p;
                                                      v480 = 0xAAAAAAAAAAAAAAABLL
                                                           * (((char *)__p_8[0] - (char *)__p) >> 4)
                                                           + 1;
                                                      if (v480 > 0x555555555555555)
                                                        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                                                      v560 = 0xAAAAAAAAAAAAAAABLL
                                                           * (((char *)__p_8[0] - (char *)__p) >> 4);
                                                      if (0x5555555555555556
                                                         * (((char *)__p_8[1] - (char *)__p) >> 4) > v480)
                                                        v480 = 0x5555555555555556
                                                             * (((char *)__p_8[1] - (char *)__p) >> 4);
                                                      if (0xAAAAAAAAAAAAAAABLL
                                                         * (((char *)__p_8[1] - (char *)__p) >> 4) >= 0x2AAAAAAAAAAAAAALL)
                                                        v481 = 0x555555555555555;
                                                      else
                                                        v481 = v480;
                                                      if (v481)
                                                        v481 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v481);
                                                      else
                                                        v482 = 0;
                                                      v483 = (char *)(v481 + 48 * v560);
                                                      *(double *)v483 = v452;
                                                      *((double *)v483 + 1) = v453;
                                                      *((_QWORD *)v483 + 2) = v454;
                                                      *((_DWORD *)v483 + 6) = v455;
                                                      *(_QWORD *)(v483 + 28) = *(_QWORD *)v605;
                                                      *((_DWORD *)v483 + 9) = *(_DWORD *)&v605[8];
                                                      *((_DWORD *)v483 + 10) = v458;
                                                      *((_DWORD *)v483 + 11) = v459;
                                                      v478 = v483;
                                                      if (v476 != v479)
                                                      {
                                                        do
                                                        {
                                                          v484 = *((_OWORD *)v476 - 3);
                                                          v485 = *((_OWORD *)v476 - 2);
                                                          *(_OWORD *)(v478 - 20) = *(_OWORD *)(v476 - 20);
                                                          *((_OWORD *)v478 - 3) = v484;
                                                          *((_OWORD *)v478 - 2) = v485;
                                                          v478 -= 48;
                                                          v476 -= 48;
                                                        }
                                                        while (v476 != v479);
                                                        v476 = v479;
                                                      }
                                                      v477 = (uint64_t)(v483 + 48);
                                                      __p = v478;
                                                      __p_8[1] = (void *)(v481 + 48 * v482);
                                                      if (v476)
                                                        operator delete(v476);
                                                    }
                                                    else
                                                    {
                                                      *(double *)__p_8[0] = v452;
                                                      *((double *)v476 + 1) = v453;
                                                      *((_QWORD *)v476 + 2) = v454;
                                                      *((_DWORD *)v476 + 6) = v455;
                                                      *(_QWORD *)(v476 + 28) = *(_QWORD *)v605;
                                                      *((_DWORD *)v476 + 9) = *(_DWORD *)&v605[8];
                                                      *((_DWORD *)v476 + 10) = v458;
                                                      *((_DWORD *)v476 + 11) = v459;
                                                      v477 = (uint64_t)(v476 + 48);
                                                      v478 = __p;
                                                    }
                                                    __p_8[0] = (void *)v477;
                                                    std::vector<CGPointWithPts>::__assign_with_size[abi:ne180100]<CGPointWithPts*,CGPointWithPts*>((char *)v633, v478, v477, 0xAAAAAAAAAAAAAAABLL * ((v477 - (uint64_t)v478) >> 4));
                                                    __p_8[0] = (char *)__p_8[0] - 48;
                                                    v551 = v465;
                                                    v559 = v474;
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                        v450 += 48;
                                      }
                                      _CF = v448++ >= 3;
                                    }
                                    while (!_CF);
                                  }
                                  v486 = (double *)v633[0];
                                  if (0xAAAAAAAAAAAAAAABLL * (((char *)v633[1] - (char *)v633[0]) >> 4) <= 3)
                                  {
                                    v331 = v544;
                                    v330 = v545;
                                    v334 = v549;
                                    v335 = v542;
                                    v336 = v543;
                                    v338 = v582;
                                    v345 = v574;
                                  }
                                  else
                                  {
                                    v487 = *v539;
                                    v331 = v544;
                                    v330 = v545;
                                    v336 = v543;
                                    v338 = v582;
                                    v345 = v574;
                                    if (*v539 == v538)
                                    {
LABEL_740:
                                      InternalObservedParabola::InternalObservedParabola((InternalObservedParabola *)v605);
                                      if (+[VNParabolaDetection updateMinMaxXYOfParabola:withPoint:]((uint64_t)VNParabolaDetection, (float *)v605, v486)&& +[VNParabolaDetection updateMinMaxXYOfParabola:withPoint:]((uint64_t)VNParabolaDetection, (float *)v605, v486 + 6)&& +[VNParabolaDetection updateMinMaxXYOfParabola:withPoint:]((uint64_t)VNParabolaDetection, (float *)v605, v486 + 12)&& (v495 = v486 + 18, +[VNParabolaDetection updateMinMaxXYOfParabola:withPoint:]((uint64_t)VNParabolaDetection, (float *)v605, v486 + 18)))
                                      {
                                        v496 = v601[1];
                                        if (v601[1] >= v602)
                                        {
                                          v498 = v601[0];
                                          v499 = v601[1] - v601[0];
                                          v500 = v499 + 1;
                                          if ((unint64_t)(v499 + 1) >> 61)
                                            goto LABEL_830;
                                          v501 = (char *)v602 - (char *)v601[0];
                                          if (((char *)v602 - (char *)v601[0]) >> 2 > v500)
                                            v500 = v501 >> 2;
                                          if ((unint64_t)v501 >= 0x7FFFFFFFFFFFFFF8)
                                            v502 = 0x1FFFFFFFFFFFFFFFLL;
                                          else
                                            v502 = v500;
                                          if (v502)
                                            v502 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v502);
                                          else
                                            v503 = 0;
                                          v504 = (double *)(v502 + 8 * v499);
                                          *v504 = *v495;
                                          v497 = v504 + 1;
                                          while (v496 != v498)
                                          {
                                            v505 = *((_QWORD *)v496-- - 1);
                                            *((_QWORD *)v504-- - 1) = v505;
                                          }
                                          v601[0] = v504;
                                          v602 = (double *)(v502 + 8 * v503);
                                          if (v498)
                                            operator delete(v498);
                                        }
                                        else
                                        {
                                          *v601[1] = *v495;
                                          v497 = v496 + 1;
                                        }
                                        v601[1] = v497;
                                        if ((unint64_t)v541 >= v550)
                                        {
                                          v507 = v541 - __srca;
                                          v508 = v507 + 1;
                                          if ((unint64_t)(v507 + 1) >> 61)
LABEL_830:
                                            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                                          if ((uint64_t)(v550 - (_QWORD)__srca) >> 2 > v508)
                                            v508 = (uint64_t)(v550 - (_QWORD)__srca) >> 2;
                                          if (v550 - (unint64_t)__srca >= 0x7FFFFFFFFFFFFFF8)
                                            v509 = 0x1FFFFFFFFFFFFFFFLL;
                                          else
                                            v509 = v508;
                                          if (v509)
                                            v509 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v509);
                                          else
                                            v510 = 0;
                                          v511 = (double *)(v509 + 8 * v507);
                                          *v511 = v486[19];
                                          v506 = v511 + 1;
                                          v512 = v541;
                                          if (v541 == __srca)
                                          {
                                            v513 = __srca;
                                          }
                                          else
                                          {
                                            v513 = __srca;
                                            do
                                            {
                                              v514 = *((_QWORD *)v512-- - 1);
                                              *((_QWORD *)v511-- - 1) = v514;
                                            }
                                            while (v512 != __srca);
                                          }
                                          v550 = v509 + 8 * v510;
                                          operator delete(v513);
                                          __srca = v511;
                                        }
                                        else
                                        {
                                          *v541 = v486[19];
                                          v506 = v541 + 1;
                                        }
                                        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                                        v515 = objc_claimAutoreleasedReturnValue();
                                        v516 = *(void **)v605;
                                        *(_QWORD *)v605 = v515;

                                        v517 = (char *)v633[0];
                                        v518 = v633[1];
                                        v519 = 0xAAAAAAAAAAAAAAABLL * (((char *)v633[1] - (char *)v633[0]) >> 4);
                                        std::vector<CGPointWithPts>::__assign_with_size[abi:ne180100]<CGPointWithPts*,CGPointWithPts*>(&v605[8], (char *)v633[0], (uint64_t)v633[1], v519);
                                        std::vector<CGPointWithPts>::__assign_with_size[abi:ne180100]<CGPointWithPts*,CGPointWithPts*>((char *)&v606[1], v517, (uint64_t)v518, v519);
                                        *(float32x2_t *)&v525 = -[VNParabolaDetection computeEquationCoefficients:yValues:](v601, __srca, v520, v521, v522, v523, v524);
                                        *(_OWORD *)&v605[32] = v525;
                                        v526 = (char *)v601[0];
                                        LODWORD(v606[0]) = -[VNParabolaDetection getRsquareOfEquation:yValues:equationConstants:](v601[0], __srca, v506, (float *)&v605[32]);
                                        std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>((char *)&v609, v526, (uint64_t)v601[1], ((char *)v601[1] - v526) >> 3);
                                        std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>((char *)&v612, (char *)__srca, (uint64_t)v506, v506 - __srca);
                                        v527 = (CGPoint *)v633[0];
                                        KalmanFilter::updateMeasurementAndPredict((KalmanFilter *)v619, *(CGPoint *)v633[0]);
                                        KalmanFilter::updateMeasurementAndPredict((KalmanFilter *)v619, v527[3]);
                                        KalmanFilter::updateMeasurementAndPredict((KalmanFilter *)v619, v527[6]);
                                        KalmanFilter::updateMeasurementAndPredict((KalmanFilter *)v619, v527[9]);
                                        v528 = fmax(v559 + v559 * 0.5, fmax(*(float *)(v598 + 116), (double)(2 * *(_DWORD *)(v598 + 236))));
                                        *(float *)&v618 = v528;
                                        *(float *)&v627 = v528;
                                        BYTE4(v627) = v551;
                                        v529 = (_DWORD *)*((_QWORD *)&v627 + 1);
                                        **((_DWORD **)&v627 + 1) = LODWORD(v527[2].y);
                                        v529[1] = LODWORD(v527[5].y);
                                        v529[2] = LODWORD(v527[8].y);
                                        v529[3] = LODWORD(v527[11].y);
                                        *(float *)&v630 = (float)((float)((float)(*(float *)&v527[2].y
                                                                                + *(float *)&v527[5].y)
                                                                        + *(float *)&v527[8].y)
                                                                + *(float *)&v527[11].y)
                                                        * 0.25;
                                        *((float *)&v630 + 1) = v559;
                                        v530 = std::__tree<std::__value_type<int,InternalObservedParabola>,std::__map_value_compare<int,std::__value_type<int,InternalObservedParabola>,std::less<int>,true>,std::allocator<std::__value_type<int,InternalObservedParabola>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v539, *(_DWORD *)(v598 + 8), v535);
                                        InternalObservedParabola::operator=((uint64_t)(v530 + 6), (uint64_t)v605);
                                        v633[1] = v527;
                                        ++*v535;
                                        if (*((_QWORD *)&v627 + 1))
                                        {
                                          v628 = *((_QWORD *)&v627 + 1);
                                          operator delete(*((void **)&v627 + 1));
                                        }
                                        v334 = v549;
                                        v335 = v542;
                                        if (v622)
                                        {
                                          v623 = v622;
                                          operator delete(v622);
                                        }
                                        if (v620[58])
                                        {
                                          v620[59] = v620[58];
                                          operator delete(v620[58]);
                                        }
                                        if (v612)
                                        {
                                          v613 = v612;
                                          operator delete(v612);
                                        }
                                        if (v609)
                                        {
                                          v610 = v609;
                                          operator delete(v609);
                                        }
                                        if (v606[1])
                                        {
                                          v607 = v606[1];
                                          operator delete(v606[1]);
                                        }
                                        if (*(_QWORD *)&v605[8])
                                        {
                                          *(_QWORD *)&v605[16] = *(_QWORD *)&v605[8];
                                          operator delete(*(void **)&v605[8]);
                                        }
                                      }
                                      else
                                      {
                                        if (*((_QWORD *)&v627 + 1))
                                        {
                                          v628 = *((_QWORD *)&v627 + 1);
                                          operator delete(*((void **)&v627 + 1));
                                        }
                                        v334 = v549;
                                        v335 = v542;
                                        if (v622)
                                        {
                                          v623 = v622;
                                          operator delete(v622);
                                        }
                                        if (v620[58])
                                        {
                                          v620[59] = v620[58];
                                          operator delete(v620[58]);
                                        }
                                        if (v612)
                                        {
                                          v613 = v612;
                                          operator delete(v612);
                                        }
                                        if (v609)
                                        {
                                          v610 = v609;
                                          operator delete(v609);
                                        }
                                        if (v606[1])
                                        {
                                          v607 = v606[1];
                                          operator delete(v606[1]);
                                        }
                                        if (*(_QWORD *)&v605[8])
                                        {
                                          *(_QWORD *)&v605[16] = *(_QWORD *)&v605[8];
                                          operator delete(*(void **)&v605[8]);
                                        }
                                      }

                                    }
                                    else
                                    {
                                      while (1)
                                      {
                                        if (v633[0] != v633[1])
                                        {
                                          v488 = 0;
                                          v489 = (double *)v633[0];
                                          do
                                          {
                                            v490 = *v489;
                                            v491 = v489[1];
                                            v489 += 6;
                                            if (*(_DWORD *)(v598 + 236) >= (int)vabdd_f64(v491, v490 * *((float *)v487 + 21)+ v490 * *((float *)v487 + 20) * v490+ *((float *)v487 + 22)))++v488;
                                          }
                                          while (v489 != v633[1]);
                                          if (v488 > 1)
                                          {
                                            v492 = ((float)((float)*((uint64_t *)v633[0] + 20)
                                                          / (float)*((int *)v633[0] + 42))
                                                  - (float)((float)*(uint64_t *)(v487[14] - 32)
                                                          / (float)*(int *)(v487[14] - 24)))
                                                 * *(float *)(v598 + 208);
                                            if ((float)(*(float *)(v598 + 144) * *(float *)(v598 + 176)) > v492)
                                              break;
                                          }
                                        }
                                        v493 = (uint64_t *)v487[1];
                                        if (v493)
                                        {
                                          do
                                          {
                                            v494 = v493;
                                            v493 = (uint64_t *)*v493;
                                          }
                                          while (v493);
                                        }
                                        else
                                        {
                                          do
                                          {
                                            v494 = (uint64_t *)v487[2];
                                            _ZF = *v494 == (_QWORD)v487;
                                            v487 = v494;
                                          }
                                          while (!_ZF);
                                        }
                                        v487 = v494;
                                        if (v494 == v538)
                                          goto LABEL_740;
                                      }
                                      v334 = v549;
                                      v335 = v542;
                                    }
                                  }
                                  if (__p)
                                    operator delete(__p);
                                  v339 = v580;
                                  v340 = v578;
                                  v342 = v572;
                                }
                                else
                                {
                                  v338 = v582;
                                  v339 = v580;
                                  v340 = v578;
                                  v342 = v572;
                                }
                              }
                              else
                              {
                                v338 = v582;
                                v339 = v580;
                                v340 = v578;
                                v342 = v572;
                              }
                            }
                            else
                            {
                              v338 = v582;
                            }
                          }
                        }
                        v343 += 2;
                      }
                      while (v343 != v342);
                    }
                    v334 += 48;
                  }
                  while (v334 != v335);
                }
                v329 = v540 + 48;
                v327 = v536;
              }
              while (v540 + 48 != v537);
            }
            _CF = (unint64_t)v565++ >= 3;
          }
          while (!_CF);
        }
        ++v327;
        v326 = v533 + 1;
      }
      while (v327 != 3);
      v326 = v531 + 1;
      v325 = v532 + 1;
      v534 = 1;
    }
    while (v532 != 2);
    if (__srca)
      operator delete(__srca);
    if (v601[0])
      operator delete(v601[0]);
    if (v633[0])
      operator delete(v633[0]);
    v324 = v598;
  }
  return v324 + 184;
}

- (float32x2_t)computeEquationCoefficients:(uint64_t)a3 yValues:(uint64_t)a4
{
  double *v8;
  double v9;
  double v10;
  double v11;
  double *v12;
  uint64_t v13;
  float64x2_t v14;
  double v16;
  float64_t v17;
  void *__p;
  uint64_t v19;
  double v20[3];
  double *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  polynomialFit(v20, *a1, a2, a1[1] - *a1, a5, a6, a7);
  v19 = *(_QWORD *)*a1;
  if (!v21)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(void **__return_ptr, double *, uint64_t *))(*(_QWORD *)v21 + 48))(&__p, v21, &v19);
  v8 = (double *)__p;
  v10 = *((double *)__p + 2);
  v9 = *((double *)__p + 3);
  v11 = *((double *)__p + 1);
  v16 = v11 + v9 * -2.0 * v10;
  v17 = v10;
  *(double *)__p = *(double *)__p + v10 * (v9 * v9) - v11 * v9;
  v8[1] = v16;
  v12 = v21;
  if (v21 == v20)
  {
    v13 = 4;
    v12 = v20;
    goto LABEL_6;
  }
  if (v21)
  {
    v13 = 5;
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)v12 + 8 * v13))();
  }
  operator delete(v8);
  v14.f64[0] = v17;
  v14.f64[1] = v16;
  return vcvt_f32_f64(v14);
}

- (BOOL)isValidRadius:(float)a3 withPrecedingRadius:
{
  float v3;
  _BOOL4 v4;
  float v5;
  float v7;

  v3 = a1[41];
  v4 = v3 < a3;
  if (v3 >= a2)
    v4 = 0;
  v5 = a1[39];
  if (v3 >= a3)
  {
    return fmaxf((float)(v5 * 1.25) * a3, v3) >= a2 && a2 > 0.0;
  }
  else if ((float)(v5 * a3) >= a2)
  {
    v7 = 0.75;
    if (v4)
      v7 = 1.0;
    return (float)((float)(v7 * a1[40]) * a3) <= a2;
  }
  else
  {
    return 0;
  }
}

+ (BOOL)updateMinMaxXYOfParabola:(double *)a3 withPoint:
{
  double v5;
  double v6;
  _BOOL8 result;
  float v8;
  double v9;
  float v10;

  objc_opt_self();
  v5 = a2[32];
  v6 = *a3;
  result = *a3 < v5;
  v8 = *a3;
  if (*a3 < v5)
    a2[32] = v8;
  v9 = a3[1];
  v10 = v9;
  if (v9 < a2[34])
  {
    a2[34] = v10;
    result = 1;
  }
  if (v6 > a2[33])
  {
    a2[33] = v8;
    result = 1;
  }
  if (v9 > a2[35])
  {
    a2[35] = v10;
    return 1;
  }
  return result;
}

- (float)getRsquareOfEquation:(double *)a3 yValues:(float *)a4 equationConstants:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  double *v8;
  uint64_t v9;
  double v10;
  double v11;
  float v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;

  v4 = (char *)a3 - (char *)a2;
  if (a3 == a2)
  {
    v17 = NAN;
  }
  else
  {
    v5 = v4 >> 3;
    if ((unint64_t)(v4 >> 3) <= 1)
      v6 = 1;
    else
      v6 = v4 >> 3;
    v7 = 0.0;
    v8 = a2;
    v9 = v6;
    do
    {
      v10 = *v8++;
      v7 = v10 + v7;
      --v9;
    }
    while (v9);
    v11 = (float)(v7 / (float)(unint64_t)v5);
    v12 = 0.0;
    v13 = 0.0;
    do
    {
      v14 = *a1++;
      v15 = v14 * a4[1] + *a4 * (v14 * v14) + a4[2];
      v16 = *a2++;
      v13 = (v16 - v15) * (v16 - v15) + v13;
      v12 = (v16 - v11) * (v16 - v11) + v12;
      --v6;
    }
    while (v6);
    v17 = v13 / v12;
  }
  return 1.0 - v17;
}

@end
