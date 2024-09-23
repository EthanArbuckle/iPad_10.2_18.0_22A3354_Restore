@implementation CHCornerDetector

- (CHCornerDetector)init
{
  CHCornerDetector *v2;
  CHCornerDetector *v3;
  CHDrawing *drawing;
  CHDrawing *resampledDrawing;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableIndexSet *cornerIndexSet;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableIndexSet *directionChangeCornerIndexes;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CHCornerDetector;
  v2 = -[CHCornerDetector init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    drawing = v2->_drawing;
    v2->_drawing = 0;

    resampledDrawing = v3->_resampledDrawing;
    v3->_resampledDrawing = 0;

    v3->_minimumSignificantSegmentLength = 35.0;
    v3->_shouldUseDynamicSampling = 1;
    v3->__strawSize = 3;
    objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v6, v7, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    cornerIndexSet = v3->__cornerIndexSet;
    v3->__cornerIndexSet = (NSMutableIndexSet *)v11;

    objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v13, v14, v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    directionChangeCornerIndexes = v3->__directionChangeCornerIndexes;
    v3->__directionChangeCornerIndexes = (NSMutableIndexSet *)v18;

    v3->_directionChangeCount = 0;
    v3->_highestDirectionChangeCount = 0;
  }
  return v3;
}

- (void)setDrawing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CHDrawing *v17;
  CHDrawing *drawing;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  CGFloat MaxY;
  float32x2_t v43;
  float32_t v44;
  float64x2_t v45;
  float32x2_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CHDrawing *v51;
  CHDrawing *resampledDrawing;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  unint64_t v60;
  uint64_t value;
  char *begin;
  char *end;
  void *v64;
  char *v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  unint64_t v70;
  char *v71;
  char *v72;
  unint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  char *v76;
  _QWORD *v77;
  char *v78;
  char *v79;
  char *v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int64_t i;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  BOOL v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  unint64_t strawSize;
  id v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  double v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  double v127;
  double v128;
  float64x2_t v129;
  float64x2_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  float v172;
  float v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  double v179;
  unint64_t j;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  BOOL v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  float v202;
  _BOOL4 v203;
  double v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  float v221;
  _BOOL4 v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  float v234;
  _BOOL4 v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  float v247;
  float v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  void *v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  id v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  unint64_t k;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  id v312;
  uint64_t v313;
  uint64_t v314;
  int64_t v315;
  int64_t v316;
  uint64_t v317;
  double v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  float v330;
  _BOOL4 v331;
  void *v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  float v343;
  float v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  void *v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  id v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  id v363;
  unint64_t v364;
  uint64_t v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  void *v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  void *v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  id v395;
  unint64_t v396;
  uint64_t v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  void *v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  void *v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  void *v425;
  const char *v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  id v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  double v436;
  double v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  double v441;
  double v442;
  id v443;
  const char *v444;
  uint64_t v445;
  uint64_t v446;
  double v447;
  double v448;
  const char *v449;
  uint64_t v450;
  uint64_t v451;
  double v452;
  double v453;
  float64x2_t v454;
  float64x2_t v455;
  float64x2_t v456;
  uint64_t v457;
  id v458;
  const char *v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t m;
  uint64_t v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  void *v470;
  const char *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  const char *v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  void *v481;
  const char *v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  void *v489;
  const char *v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  void *v494;
  const char *v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  float v500;
  float v501;
  const char *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  void *v506;
  const char *v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  void *v511;
  const char *v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  float v517;
  _BOOL4 v518;
  const char *v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  id v523;
  id v524;
  const char *v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t n;
  void *v530;
  NSMutableIndexSet *v531;
  const char *v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  const char *v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  const char *v542;
  uint64_t v543;
  const char *v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  void *v549;
  const char *v550;
  uint64_t v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t Index;
  const char *v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  uint64_t v560;
  void *v561;
  uint64_t v562;
  const char *v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  double v567;
  const char *v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  const char *v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  double v578;
  double v579;
  BOOL v580;
  double v581;
  uint64_t v582;
  double v583;
  uint64_t v584;
  void *v585;
  const char *v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  uint64_t v591;
  const char *v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  void *v597;
  const char *v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  void *v603;
  id v604;
  const char *v605;
  uint64_t v606;
  uint64_t v607;
  uint64_t v608;
  unint64_t highestDirectionChangeCount;
  id v610;
  id v611;
  uint64_t v612;
  id v613;
  const char *v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  void *v618;
  NSMutableIndexSet *v619;
  NSMutableIndexSet *directionChangeCornerIndexes;
  char *v621;
  char *v622;
  void *v623;
  char *v624;
  vector<std::map<long, long>, std::allocator<std::map<long, long>>> *p_resampledDrawingPointMap;
  uint64_t *v626;
  id v627;
  void *v628;
  id v629;
  id v630;
  id v631;
  float64_t v632;
  float64_t v633;
  float64_t v634;
  float64_t v635;
  float64_t v636;
  float64_t v637;
  float64_t v638;
  float64_t v639;
  float64_t v640;
  id v641;
  float64_t v642;
  float64_t v643;
  id v644;
  float64_t v645;
  id v646;
  CGFloat MaxX;
  void *v648;
  __int128 v649;
  __int128 v650;
  __int128 v651;
  __int128 v652;
  void *__p;
  char *v654;
  uint64_t v655;
  _QWORD v656[5];
  id v657;
  uint64_t *v658;
  _QWORD *v659;
  uint64_t v660;
  _QWORD v661[4];
  _QWORD v662[7];
  uint64_t v663;
  uint64_t *v664;
  uint64_t v665;
  uint64_t v666;
  uint64_t v667;
  double *v668;
  uint64_t v669;
  uint64_t v670;
  _QWORD v671[4];
  id v672;
  _QWORD *v673;
  _QWORD v674[6];
  _QWORD **v675;
  _QWORD *v676[2];
  _BYTE v677[128];
  uint64_t v678;
  CGRect v679;
  CGRect v680;
  CGRect v681;
  CGRect v682;

  v678 = *MEMORY[0x1E0C80C00];
  v627 = a3;
  if ((objc_msgSend_isEqualToDrawing_(self->_drawing, v4, (uint64_t)v627, v5, v6, v7) & 1) != 0)
    goto LABEL_125;
  self->_directionChangeCount = 0;
  if ((objc_msgSend_isPrefixForDrawing_(self->_drawing, v8, (uint64_t)v627, v9, v10, v11) & 1) == 0)
    self->_highestDirectionChangeCount = 0;
  v17 = (CHDrawing *)objc_msgSend_copy(v627, v12, v13, v14, v15, v16);
  drawing = self->_drawing;
  self->_drawing = v17;

  __p = 0;
  v654 = 0;
  v655 = 0;
  objc_msgSend_drawing(self, v19, v20, v21, v22, v23);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v35 = 5.0;
  if ((objc_msgSend_shouldUseDynamicSampling(self, v25, v26, v27, v28, v29) & 1) != 0)
  {
    objc_msgSend_bounds(v24, v30, v31, v32, v33, v34);
    x = v679.origin.x;
    y = v679.origin.y;
    width = v679.size.width;
    height = v679.size.height;
    MinX = CGRectGetMinX(v679);
    v680.origin.x = x;
    v680.origin.y = y;
    v680.size.width = width;
    v680.size.height = height;
    MinY = CGRectGetMinY(v680);
    v681.origin.x = x;
    v681.origin.y = y;
    v681.size.width = width;
    v681.size.height = height;
    MaxX = CGRectGetMaxX(v681);
    v682.origin.x = x;
    v682.origin.y = y;
    v682.size.width = width;
    v682.size.height = height;
    MaxY = CGRectGetMaxY(v682);
    v43.f32[0] = MinX;
    v44 = MinY;
    v43.f32[1] = v44;
    v45.f64[0] = MaxX;
    v45.f64[1] = MaxY;
    v46 = vsub_f32(v43, vcvt_f32_f64(v45));
    v35 = sqrtf(vaddv_f32(vmul_f32(v46, v46))) * 0.025;
  }

  objc_msgSend_drawingSpatiallyResampled_outputPointMap_(v24, v47, (uint64_t)&__p, v48, v49, v50, v35);
  v51 = (CHDrawing *)objc_claimAutoreleasedReturnValue();

  resampledDrawing = self->_resampledDrawing;
  self->_resampledDrawing = v51;

  p_resampledDrawingPointMap = &self->__resampledDrawingPointMap;
  if (&self->__resampledDrawingPointMap != (vector<std::map<long, long>, std::allocator<std::map<long, long>>> *)&__p)
  {
    v59 = (char *)__p;
    v58 = v654;
    v60 = 0xAAAAAAAAAAAAAAABLL * ((v654 - (_BYTE *)__p) >> 3);
    value = (uint64_t)self->__resampledDrawingPointMap.__end_cap_.__value_;
    begin = (char *)self->__resampledDrawingPointMap.__begin_;
    if (0xAAAAAAAAAAAAAAABLL * ((value - (uint64_t)begin) >> 3) < v60)
    {
      if (begin)
      {
        end = (char *)self->__resampledDrawingPointMap.__end_;
        v64 = self->__resampledDrawingPointMap.__begin_;
        if (end != begin)
        {
          do
          {
            v65 = end - 24;
            sub_1BE62033C((uint64_t)(end - 24), *((_QWORD **)end - 2));
            end = v65;
          }
          while (v65 != begin);
          v64 = p_resampledDrawingPointMap->__begin_;
        }
        self->__resampledDrawingPointMap.__end_ = begin;
        operator delete(v64);
        value = 0;
        p_resampledDrawingPointMap->__begin_ = 0;
        self->__resampledDrawingPointMap.__end_ = 0;
        self->__resampledDrawingPointMap.__end_cap_.__value_ = 0;
      }
      if (v60 > 0xAAAAAAAAAAAAAAALL)
        goto LABEL_128;
      v66 = 0xAAAAAAAAAAAAAAABLL * (value >> 3);
      v67 = 2 * v66;
      if (2 * v66 <= v60)
        v67 = v60;
      v68 = v66 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v67;
      if (v68 > 0xAAAAAAAAAAAAAAALL)
LABEL_128:
        sub_1BE61F930();
      v69 = (char *)operator new(24 * v68);
      self->__resampledDrawingPointMap.__begin_ = v69;
      self->__resampledDrawingPointMap.__end_ = v69;
      self->__resampledDrawingPointMap.__end_cap_.__value_ = &v69[24 * v68];
      if (v59 != v58)
      {
        v70 = 0;
        do
        {
          v71 = &v69[v70];
          *((_QWORD *)v71 + 2) = 0;
          *(_QWORD *)&v69[v70 + 8] = 0;
          *(_QWORD *)v71 = &v69[v70 + 8];
          sub_1BE694588(&v69[v70], *(_QWORD **)&v59[v70], &v59[v70 + 8]);
          v70 += 24;
        }
        while (&v59[v70] != v58);
        v69 += v70;
      }
      self->__resampledDrawingPointMap.__end_ = v69;
      goto LABEL_45;
    }
    v72 = (char *)self->__resampledDrawingPointMap.__end_;
    v73 = 0xAAAAAAAAAAAAAAABLL * ((v72 - begin) >> 3);
    if (v73 < v60)
    {
      if (v72 != begin)
      {
        v74 = 8 * ((v72 - begin) >> 3);
        v75 = (char *)__p + 8;
        v76 = (char *)__p;
        do
        {
          if (v76 != begin)
            sub_1BE6ABE94((uint64_t)begin, *(_QWORD **)v76, v75);
          v76 += 24;
          begin += 24;
          v75 += 3;
          v74 -= 24;
        }
        while (v74);
        begin = (char *)self->__resampledDrawingPointMap.__end_;
      }
      v79 = &v59[24 * v73];
      v80 = begin;
      if (v79 != v58)
      {
        v81 = 0;
        v82 = (uint64_t)&v59[24 * v73 + 8];
        do
        {
          v83 = &begin[v81];
          *((_QWORD *)v83 + 2) = 0;
          *(_QWORD *)&begin[v81 + 8] = 0;
          *(_QWORD *)v83 = &begin[v81 + 8];
          sub_1BE694588(&begin[v81], *(_QWORD **)&v79[v81], (_QWORD *)(v82 + v81));
          v81 += 24;
        }
        while (&v79[v81] != v58);
        v80 = &begin[v81];
      }
      self->__resampledDrawingPointMap.__end_ = v80;
      goto LABEL_45;
    }
    if (__p == v654)
    {
      v78 = (char *)self->__resampledDrawingPointMap.__begin_;
      if (v72 == begin)
      {
LABEL_44:
        self->__resampledDrawingPointMap.__end_ = v78;
        goto LABEL_45;
      }
    }
    else
    {
      v77 = (char *)__p + 8;
      v78 = (char *)self->__resampledDrawingPointMap.__begin_;
      do
      {
        if (v59 != begin)
          sub_1BE6ABE94((uint64_t)begin, *(_QWORD **)v59, v77);
        v59 += 24;
        begin += 24;
        v78 += 24;
        v77 += 3;
      }
      while (v59 != v58);
      v72 = (char *)self->__resampledDrawingPointMap.__end_;
      if (v72 == v78)
        goto LABEL_44;
    }
    do
    {
      v84 = v72 - 24;
      sub_1BE62033C((uint64_t)(v72 - 24), *((_QWORD **)v72 - 2));
      v72 = v84;
    }
    while (v84 != v78);
    goto LABEL_44;
  }
LABEL_45:
  objc_msgSend_removeAllIndexes(self->__cornerIndexSet, v53, v54, v55, v56, v57, p_resampledDrawingPointMap);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v85, v86, v87, v88, v89);
  v628 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v90, v91, v92, v93, v94);
  v648 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v628, v95, (uint64_t)&unk_1E78284C0, v96, v97, v98);
  for (i = self->__strawSize; ; ++i)
  {
    objc_msgSend_resampledDrawing(self, v99, v100, v101, v102, v103);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = i < (int64_t)(objc_msgSend_pointCountForStrokeIndex_(v105, v106, 0, v107, v108, v109)
                              - self->__strawSize);

    if (!v110)
      break;
    objc_msgSend_resampledDrawing(self, v111, v112, v113, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    strawSize = self->__strawSize;
    v118 = v116;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v118, v119, 0, i - strawSize, v120, v121);
    v642 = v123;
    v645 = v122;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v118, v124, 0, i + strawSize, v125, v126);
    v637 = v128;
    v639 = v127;

    v129.f64[0] = v645;
    v129.f64[1] = v642;
    v130.f64[0] = v639;
    v130.f64[1] = v637;
    *(float32x2_t *)&v129.f64[0] = vsub_f32(vcvt_f32_f64(v129), vcvt_f32_f64(v130));
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v131, v132, v133, v134, v135, sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v129.f64[0], *(float32x2_t *)&v129.f64[0]))));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v137, i, v138, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v648, v142, (uint64_t)v136, (uint64_t)v141, v143, v144);

  }
  if (objc_msgSend_count(v648, v111, v112, v113, v114, v115))
  {
    objc_msgSend_allValues(v648, v145, v146, v147, v148, v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingSelector_(v150, v151, (uint64_t)sel_compare_, v152, v153, v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();

    v161 = objc_msgSend_count(v155, v156, v157, v158, v159, v160);
    objc_msgSend_objectAtIndexedSubscript_(v155, v162, v161 >> 1, v163, v164, v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v166, v167, v168, v169, v170, v171);
    v173 = v172;

    v179 = v173 * 0.95;
    for (j = self->__strawSize; ; ++j)
    {
      objc_msgSend_resampledDrawing(self, v174, v175, v176, v177, v178);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = j < objc_msgSend_pointCountForStrokeIndex_(v181, v182, 0, v183, v184, v185) - self->__strawSize;

      if (!v186)
        break;
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v187, j, v188, v189, v190);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v648, v192, (uint64_t)v191, v193, v194, v195);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v196, v197, v198, v199, v200, v201);
      v203 = v179 > v202;

      if (v203)
      {
        v204 = 1.79769313e308;
        v205 = j;
        while (j < objc_msgSend_count(v648, v174, v175, v176, v177, v178))
        {
          objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v206, j, v207, v208, v209);
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v648, v211, (uint64_t)v210, v212, v213, v214);
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_floatValue(v215, v216, v217, v218, v219, v220);
          v222 = v179 > v221;

          if (!v222)
            break;
          objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v206, j, v207, v208, v209);
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v648, v224, (uint64_t)v223, v225, v226, v227);
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_floatValue(v228, v229, v230, v231, v232, v233);
          v235 = v204 > v234;

          if (v235)
          {
            objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v174, j, v176, v177, v178);
            v236 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v648, v237, (uint64_t)v236, v238, v239, v240);
            v241 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v241, v242, v243, v244, v245, v246);
            v248 = v247;

            v204 = v248;
            v205 = j;
          }
          ++j;
        }
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v206, v205, v207, v208, v209);
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v628, v250, (uint64_t)v249, v251, v252, v253);

      }
    }

  }
  v254 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_resampledDrawing(self, v145, v146, v147, v148, v149);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v260 = objc_msgSend_pointCountForStrokeIndex_(v255, v256, 0, v257, v258, v259);
  objc_msgSend_numberWithUnsignedInteger_(v254, v261, v260 - 1, v262, v263, v264);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v628, v266, (uint64_t)v265, v267, v268, v269);

  v274 = (id)objc_msgSend_sortedArrayUsingSelector_(v628, v270, (uint64_t)sel_compare_, v271, v272, v273);
  objc_msgSend_resampledDrawing(self, v275, v276, v277, v278, v279);
  v630 = (id)objc_claimAutoreleasedReturnValue();
  v646 = v628;
  v629 = v648;
  for (k = 1; k < objc_msgSend_count(v646, v280, v281, v282, v283, v284); ++k)
  {
    objc_msgSend_objectAtIndex_(v646, v286, k - 1, v287, v288, v289);
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    v296 = objc_msgSend_integerValue(v290, v291, v292, v293, v294, v295);

    objc_msgSend_objectAtIndex_(v646, v297, k, v298, v299, v300);
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    v307 = objc_msgSend_integerValue(v301, v302, v303, v304, v305, v306);

    if (!sub_1BE6ABA6C(v630, v296, v307, 0.95))
    {
      v312 = v629;
      v313 = v307 - v296;
      if (v307 < v296)
        v313 = v307 - v296 + 3;
      v314 = v313 >> 2;
      if (self->__strawSize <= v314 + v296)
        v315 = v314 + v296;
      else
        v315 = self->__strawSize;
      v316 = v307 - v314;
      v317 = 0x7FFFFFFFFFFFFFFFLL;
      if (v315 < v316)
      {
        v318 = 1.79769313e308;
        do
        {
          objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v308, v315, v309, v310, v311);
          v319 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v312, v320, (uint64_t)v319, v321, v322, v323);
          v324 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_floatValue(v324, v325, v326, v327, v328, v329);
          v331 = v318 > v330;

          if (v331)
          {
            objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v308, v315, v309, v310, v311);
            v332 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v312, v333, (uint64_t)v332, v334, v335, v336);
            v337 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v337, v338, v339, v340, v341, v342);
            v344 = v343;

            v318 = v344;
            v317 = v315;
          }
          ++v315;
        }
        while (v315 < v316);
      }

      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v345, v317, v346, v347, v348);
      v353 = (void *)objc_claimAutoreleasedReturnValue();
      if (v317 != 0x7FFFFFFFFFFFFFFFLL
        && (objc_msgSend_containsObject_(v646, v349, (uint64_t)v353, v350, v351, v352) & 1) == 0)
      {
        objc_msgSend_insertObject_atIndex_(v646, v354, (uint64_t)v353, k, v355, v356);
        k = 1;
      }

    }
  }
  v357 = v630;
  v363 = v646;
  v364 = 1;
  while (1)
  {
    v365 = v364;
    if (v364 >= objc_msgSend_count(v363, v358, v359, v360, v361, v362) - 1)
      break;
    v370 = v364 - 1;
    objc_msgSend_objectAtIndex_(v363, v366, v364 - 1, v367, v368, v369);
    v371 = (void *)objc_claimAutoreleasedReturnValue();
    v377 = objc_msgSend_integerValue(v371, v372, v373, v374, v375, v376);

    v364 = v365 + 1;
    objc_msgSend_objectAtIndex_(v363, v378, v365 + 1, v379, v380, v381);
    v382 = (void *)objc_claimAutoreleasedReturnValue();
    v388 = objc_msgSend_integerValue(v382, v383, v384, v385, v386, v387);

    if (sub_1BE6ABA6C(v357, v377, v388, 0.99))
    {
      objc_msgSend_removeObjectAtIndex_(v363, v358, v365, v360, v361, v362);
      if (v370 <= 1)
        v389 = 1;
      else
        v389 = v365 - 1;
      v364 = v389 + 1;
    }
  }

  v631 = v357;
  v395 = v363;
  v396 = 1;
  while (1)
  {
    v397 = v396;
    if (v396 >= objc_msgSend_count(v395, v390, v391, v392, v393, v394) - 1)
      break;
    v402 = v396 - 1;
    objc_msgSend_objectAtIndex_(v395, v398, v396 - 1, v399, v400, v401);
    v403 = (void *)objc_claimAutoreleasedReturnValue();
    v409 = objc_msgSend_integerValue(v403, v404, v405, v406, v407, v408);

    objc_msgSend_objectAtIndex_(v395, v410, v396, v411, v412, v413);
    v414 = (void *)objc_claimAutoreleasedReturnValue();
    v420 = objc_msgSend_integerValue(v414, v415, v416, v417, v418, v419);

    ++v396;
    objc_msgSend_objectAtIndex_(v395, v421, v397 + 1, v422, v423, v424);
    v425 = (void *)objc_claimAutoreleasedReturnValue();
    v431 = objc_msgSend_integerValue(v425, v426, v427, v428, v429, v430);

    v432 = v631;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v432, v433, 0, v409, v434, v435);
    v640 = v437;
    v643 = v436;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v432, v438, 0, v420, v439, v440);
    v636 = v442;
    v638 = v441;

    v443 = v432;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v443, v444, 0, v420, v445, v446);
    v634 = v448;
    v635 = v447;
    objc_msgSend_pointForStrokeIndex_pointIndex_(v443, v449, 0, v431, v450, v451);
    v632 = v453;
    v633 = v452;

    v454.f64[0] = v643;
    v454.f64[1] = v640;
    v455.f64[0] = v638;
    v455.f64[1] = v636;
    *(float32x2_t *)&v454.f64[0] = vsub_f32(vcvt_f32_f64(v454), vcvt_f32_f64(v455));
    v455.f64[0] = v635;
    v455.f64[1] = v634;
    v456.f64[0] = v633;
    v456.f64[1] = v632;
    *(float32x2_t *)&v455.f64[0] = vsub_f32(vcvt_f32_f64(v455), vcvt_f32_f64(v456));
    if (sub_1BE6ABA6C(v443, v409, v431, dbl_1BE8D5D80[sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v454.f64[0], *(float32x2_t *)&v454.f64[0])))+ sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v455.f64[0], *(float32x2_t *)&v455.f64[0]))) > 10.0]))
    {
      objc_msgSend_removeObjectAtIndex_(v395, v390, v397, v392, v393, v394);
      if (v402 <= 1)
        v457 = 1;
      else
        v457 = v397 - 1;
      v396 = v457 + 1;
    }
  }

  v641 = v631;
  v458 = v395;
  v644 = v629;
  for (m = 1; m < (unint64_t)(objc_msgSend_count(v458, v459, v460, v461, v462, v463) - 2); ++m)
  {
    objc_msgSend_objectAtIndex_(v458, v466, m, v467, v468, v469);
    v470 = (void *)objc_claimAutoreleasedReturnValue();
    v476 = objc_msgSend_integerValue(v470, v471, v472, v473, v474, v475);

    objc_msgSend_objectAtIndex_(v458, v477, m + 1, v478, v479, v480);
    v481 = (void *)objc_claimAutoreleasedReturnValue();
    v487 = objc_msgSend_integerValue(v481, v482, v483, v484, v485, v486);

    v488 = v487 - v476;
    if (v487 - v476 < 0)
      v488 = v476 - v487;
    if (v488 == 1)
    {
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v459, v476, v461, v462, v463);
      v489 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v644, v490, (uint64_t)v489, v491, v492, v493);
      v494 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v494, v495, v496, v497, v498, v499);
      v501 = v500;
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v502, v487, v503, v504, v505);
      v506 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v644, v507, (uint64_t)v506, v508, v509, v510);
      v511 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatValue(v511, v512, v513, v514, v515, v516);
      v518 = v501 > v517;

      if (v518)
        objc_msgSend_removeObjectAtIndex_(v458, v519, m, v520, v521, v522);
      else
        objc_msgSend_removeObjectAtIndex_(v458, v519, m + 1, v520, v521, v522);
      v465 = 2;
      if (m > 2)
        v465 = m;
      m = v465 - 1;
    }
  }

  v523 = v458;
  v651 = 0u;
  v652 = 0u;
  v649 = 0u;
  v650 = 0u;
  v524 = v523;
  v527 = objc_msgSend_countByEnumeratingWithState_objects_count_(v524, v525, (uint64_t)&v649, (uint64_t)v677, 16, v526);
  if (v527)
  {
    v528 = *(_QWORD *)v650;
    do
    {
      for (n = 0; n != v527; ++n)
      {
        if (*(_QWORD *)v650 != v528)
          objc_enumerationMutation(v524);
        v530 = *(void **)(*((_QWORD *)&v649 + 1) + 8 * n);
        v531 = self->__cornerIndexSet;
        v537 = objc_msgSend_unsignedIntegerValue(v530, v532, v533, v534, v535, v536);
        objc_msgSend_addIndex_(v531, v538, v537, v539, v540, v541);

      }
      v527 = objc_msgSend_countByEnumeratingWithState_objects_count_(v524, v542, (uint64_t)&v649, (uint64_t)v677, 16, v543);
    }
    while (v527);
  }

  v667 = 0;
  v668 = (double *)&v667;
  v669 = 0x2020000000;
  v670 = 0;
  v663 = 0;
  v664 = &v663;
  v665 = 0x2020000000;
  v666 = 0;
  objc_msgSend_cornerIndexes(self, v544, v545, v546, v547, v548);
  v549 = (void *)objc_claimAutoreleasedReturnValue();
  Index = objc_msgSend_firstIndex(v549, v550, v551, v552, v553, v554);

  v666 = Index;
  objc_msgSend_cornerIndexes(self, v556, v557, v558, v559, v560);
  v561 = (void *)objc_claimAutoreleasedReturnValue();
  v562 = MEMORY[0x1E0C809B0];
  v662[0] = MEMORY[0x1E0C809B0];
  v662[1] = 3221225472;
  v662[2] = sub_1BE6AB654;
  v662[3] = &unk_1E77F2EA8;
  v662[4] = self;
  v662[5] = &v663;
  v662[6] = &v667;
  objc_msgSend_enumerateIndexesUsingBlock_(v561, v563, (uint64_t)v662, v564, v565, v566);

  v567 = v668[3];
  objc_msgSend_minimumSignificantSegmentLength(self, v568, v569, v570, v571, v572);
  v578 = v567 * 0.25;
  v580 = v579 < v567 * 0.25;
  v581 = v567 * 0.25;
  if (v580)
    objc_msgSend_minimumSignificantSegmentLength(self, v573, v574, v575, v576, v577, v581);
  v582 = 0x3F847AE147AE147BLL;
  if (v581 >= 0.01)
  {
    objc_msgSend_minimumSignificantSegmentLength(self, v573, v574, v575, v576, v577);
    v582 = *(_QWORD *)&v578;
    if (v583 < v578)
    {
      objc_msgSend_minimumSignificantSegmentLength(self, v573, v574, v575, v576, v577);
      v582 = v584;
    }
  }
  objc_msgSend_cornerIndexes(self, v573, v574, v575, v576, v577);
  v585 = (void *)objc_claimAutoreleasedReturnValue();
  v591 = objc_msgSend_firstIndex(v585, v586, v587, v588, v589, v590);
  v664[3] = v591;

  v661[0] = 0;
  v661[1] = v661;
  v661[2] = 0x2020000000;
  v661[3] = 0;
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v592, v593, v594, v595, v596);
  v597 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cornerIndexes(self, v598, v599, v600, v601, v602);
  v603 = (void *)objc_claimAutoreleasedReturnValue();
  v656[0] = v562;
  v656[1] = 3221225472;
  v656[2] = sub_1BE6AB788;
  v656[3] = &unk_1E77F2ED0;
  v656[4] = self;
  v658 = &v663;
  v660 = v582;
  v659 = v661;
  v604 = v597;
  v657 = v604;
  objc_msgSend_enumerateIndexesUsingBlock_(v603, v605, (uint64_t)v656, v606, v607, v608);

  highestDirectionChangeCount = self->_highestDirectionChangeCount;
  if (highestDirectionChangeCount <= self->_directionChangeCount)
    highestDirectionChangeCount = self->_directionChangeCount;
  self->_highestDirectionChangeCount = highestDirectionChangeCount;
  v610 = v604;
  v611 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v674[0] = 0;
  v674[1] = v674;
  v674[2] = 0x4812000000;
  v674[3] = sub_1BE6ABC1C;
  v674[4] = sub_1BE6ABC58;
  v612 = *v626;
  v676[1] = 0;
  v676[0] = 0;
  v674[5] = &unk_1BE94989A;
  v675 = v676;
  sub_1BE694588(&v675, *(_QWORD **)v612, (_QWORD *)(v612 + 8));
  v671[0] = v562;
  v671[1] = 3221225472;
  v671[2] = sub_1BE6ABC68;
  v671[3] = &unk_1E77F2EF8;
  v673 = v674;
  v613 = v611;
  v672 = v613;
  objc_msgSend_enumerateIndexesUsingBlock_(v610, v614, (uint64_t)v671, v615, v616, v617);
  v618 = v672;
  v619 = (NSMutableIndexSet *)v613;

  _Block_object_dispose(v674, 8);
  sub_1BE62033C((uint64_t)&v675, v676[0]);

  directionChangeCornerIndexes = self->__directionChangeCornerIndexes;
  self->__directionChangeCornerIndexes = v619;

  _Block_object_dispose(v661, 8);
  _Block_object_dispose(&v663, 8);
  _Block_object_dispose(&v667, 8);

  v621 = (char *)__p;
  if (__p)
  {
    v622 = v654;
    v623 = __p;
    if (v654 != __p)
    {
      do
      {
        v624 = v622 - 24;
        sub_1BE62033C((uint64_t)(v622 - 24), *((_QWORD **)v622 - 2));
        v622 = v624;
      }
      while (v624 != v621);
      v623 = __p;
    }
    v654 = v621;
    operator delete(v623);
  }
LABEL_125:

}

- (id)cornerIndexes
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_alloc(MEMORY[0x1E0CB36B8]);
  return (id)objc_msgSend_initWithIndexSet_(v3, v4, (uint64_t)self->__cornerIndexSet, v5, v6, v7);
}

- (id)directionChangeCornerIndexes
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_alloc(MEMORY[0x1E0CB36B8]);
  return (id)objc_msgSend_initWithIndexSet_(v3, v4, (uint64_t)self->__directionChangeCornerIndexes, v5, v6, v7);
}

- (void)setMinimumSignificantSegmentLength:(double)a3
{
  self->_minimumSignificantSegmentLength = a3;
}

- (BOOL)shouldUseDynamicSampling
{
  return self->_shouldUseDynamicSampling;
}

- (void)setShouldUseDynamicSampling:(BOOL)a3
{
  self->_shouldUseDynamicSampling = a3;
}

- (double)minimumSignificantSegmentLength
{
  return self->_minimumSignificantSegmentLength;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (CHDrawing)resampledDrawing
{
  return self->_resampledDrawing;
}

- (unint64_t)directionChangeCount
{
  return self->_directionChangeCount;
}

- (unint64_t)highestDirectionChangeCount
{
  return self->_highestDirectionChangeCount;
}

- (void).cxx_destruct
{
  char *begin;
  char *end;
  void *v5;
  char *v6;

  begin = (char *)self->__resampledDrawingPointMap.__begin_;
  if (begin)
  {
    end = (char *)self->__resampledDrawingPointMap.__end_;
    v5 = self->__resampledDrawingPointMap.__begin_;
    if (end != begin)
    {
      do
      {
        v6 = end - 24;
        sub_1BE62033C((uint64_t)(end - 24), *((_QWORD **)end - 2));
        end = v6;
      }
      while (v6 != begin);
      v5 = self->__resampledDrawingPointMap.__begin_;
    }
    self->__resampledDrawingPointMap.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->__directionChangeCornerIndexes, 0);
  objc_storeStrong((id *)&self->__cornerIndexSet, 0);
  objc_storeStrong((id *)&self->_resampledDrawing, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

@end
