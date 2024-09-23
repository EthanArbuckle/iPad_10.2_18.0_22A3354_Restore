@implementation CHTextLineStrokeGroup

- (CHTextLineStrokeGroup)initWithStrokeIdentifiers:(id)a3 firstStrokeIdentifier:(id)a4 lastStrokeIdentifier:(id)a5 bounds:(CGRect)a6 classification:(int64_t)a7 strategyIdentifier:(id)a8 writingDirectionSortedSubstrokes:(id)a9 averageWritingOrientation:(CGVector)a10 averageStrokeDeviation:(CGVector)a11 writingDirectionSortedStrokeIdentifiers:(id)a12 localStrokeWritingOrientations:(const void *)a13 coalescedLastSubstrokes:(id)a14 groupingConfidence:(double)a15 firstStrokeOrigin:(CGPoint)a16
{
  return (CHTextLineStrokeGroup *)objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_strategyIdentifier_writingDirectionSortedSubstrokes_averageWritingOrientation_averageStrokeDeviation_writingDirectionSortedStrokeIdentifiers_localStrokeWritingOrientations_coalescedLastSubstrokes_groupingConfidence_firstStrokeOrigin_(self, a2, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a7, a8, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a10.dx, a10.dy, a11.dx, a11.dy, a9, a12, a13,
                                    a14,
                                    *(_QWORD *)&a15,
                                    *(_QWORD *)&a16.x,
                                    *(_QWORD *)&a16.y);
}

- (CHTextLineStrokeGroup)initWithAncestorIdentifier:(int64_t)a3 strokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 classification:(int64_t)a8 strategyIdentifier:(id)a9 writingDirectionSortedSubstrokes:(id)a10 averageWritingOrientation:(CGVector)a11 averageStrokeDeviation:(CGVector)a12 writingDirectionSortedStrokeIdentifiers:(id)a13 localStrokeWritingOrientations:(const void *)a14 coalescedLastSubstrokes:(id)a15 groupingConfidence:(double)a16 firstStrokeOrigin:(CGPoint)a17
{
  CGFloat dx;
  double height;
  double width;
  double y;
  double x;
  id v28;
  id v29;
  id v30;
  id v31;
  CHTextLineStrokeGroup *v32;
  CHTextLineStrokeGroup *v33;
  CGFloat dy;
  id v37;
  id v38;
  id v39;
  objc_super v40;

  dy = a11.dy;
  dx = a11.dx;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v28 = a4;
  v29 = a5;
  v30 = a6;
  v31 = a9;
  v39 = a10;
  v38 = a13;
  v37 = a15;
  v40.receiver = self;
  v40.super_class = (Class)CHTextLineStrokeGroup;
  v32 = -[CHStrokeGroup initWithAncestorIdentifier:strokeIdentifiers:firstStrokeIdentifier:lastStrokeIdentifier:bounds:classification:groupingConfidence:strategyIdentifier:firstStrokeOrigin:](&v40, sel_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_, a3, v28, v29, v30, a8, v31, x, y, width, height, a16, a17.x, a17.y);
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_writingDirectionSortedSubstrokes, a10);
    v33->_averageWritingOrientation.dx = dx;
    v33->_averageWritingOrientation.dy = dy;
    v33->_averageStrokeDeviation = a12;
    objc_storeStrong((id *)&v33->_writingDirectionSortedStrokeIdentifiers, a13);
    if (&v33->_localStrokeWritingOrientations != a14)
      sub_1BE6F5A88(&v33->_localStrokeWritingOrientations.__begin_, *(char **)a14, *((char **)a14 + 1), (uint64_t)(*((_QWORD *)a14 + 1) - *(_QWORD *)a14) >> 4);
    v33->_lastSubstrokeIndexBeforeMerge = -1;
    objc_storeStrong((id *)&v33->_coalescedLastSubstrokes, a15);
  }

  return v33;
}

- (CHTextLineStrokeGroup)initWithUniqueIdentifier:(int64_t)a3 ancestorIdentifier:(int64_t)a4 strokeIdentifiers:(id)a5 firstStrokeIdentifier:(id)a6 lastStrokeIdentifier:(id)a7 bounds:(CGRect)a8 classification:(int64_t)a9 strategyIdentifier:(id)a10 writingDirectionSortedSubstrokes:(id)a11 averageWritingOrientation:(CGVector)a12 averageStrokeDeviation:(CGVector)a13 writingDirectionSortedStrokeIdentifiers:(id)a14 localStrokeWritingOrientations:(const void *)a15 coalescedLastSubstrokes:(id)a16 groupingConfidence:(double)a17 firstStrokeOrigin:(CGPoint)a18
{
  CGFloat dx;
  double height;
  double width;
  double y;
  double x;
  id v28;
  id v29;
  id v30;
  id v31;
  CHTextLineStrokeGroup *v32;
  CHTextLineStrokeGroup *v33;
  CGFloat dy;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  dy = a12.dy;
  dx = a12.dx;
  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v28 = a5;
  v29 = a6;
  v30 = a7;
  v31 = a10;
  v40 = a11;
  v39 = a14;
  v38 = a16;
  v41.receiver = self;
  v41.super_class = (Class)CHTextLineStrokeGroup;
  v32 = -[CHStrokeGroup initWithUniqueIdentifier:ancestorIdentifier:strokeIdentifiers:firstStrokeIdentifier:lastStrokeIdentifier:bounds:classification:groupingConfidence:strategyIdentifier:firstStrokeOrigin:](&v41, sel_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_, a3, a4, v28, v29, v30, a9, x, y, width, height, a17, a18.x, a18.y, v31);
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_writingDirectionSortedSubstrokes, a11);
    v33->_averageWritingOrientation.dx = dx;
    v33->_averageWritingOrientation.dy = dy;
    v33->_averageStrokeDeviation = a13;
    objc_storeStrong((id *)&v33->_writingDirectionSortedStrokeIdentifiers, a14);
    if (&v33->_localStrokeWritingOrientations != a15)
      sub_1BE6F5A88(&v33->_localStrokeWritingOrientations.__begin_, *(char **)a15, *((char **)a15 + 1), (uint64_t)(*((_QWORD *)a15 + 1) - *(_QWORD *)a15) >> 4);
    v33->_lastSubstrokeIndexBeforeMerge = -1;
    objc_storeStrong((id *)&v33->_coalescedLastSubstrokes, a16);
  }

  return v33;
}

- (id)groupByAddingStrokeIdentifiers:(id)a3 removingStrokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 writingDirectionSortedSubstrokes:(id)a8 averageWritingOrientation:(CGVector)a9 averageStrokeDeviation:(CGVector)a10 writingDirectionSortedStrokeIdentifiers:(id)a11 localStrokeWritingOrientations:(const void *)a12 coalescedLastSubstrokes:(id)a13 groupingConfidence:(double)a14 lastSubstrokeIndexBeforeMerge:(int64_t)a15 firstStrokeOrigin:(CGPoint)a16
{
  CGFloat dx;
  double height;
  double width;
  double y;
  double x;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  CGFloat dy;
  id v43;
  id v44;
  objc_super v45;

  dy = a9.dy;
  dx = a9.dx;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v27 = a3;
  v28 = a4;
  v29 = a5;
  v30 = a6;
  v44 = a8;
  v43 = a11;
  v31 = a13;
  v37 = objc_msgSend_classification(self, v32, v33, v34, v35, v36);
  v45.receiver = self;
  v45.super_class = (Class)CHTextLineStrokeGroup;
  -[CHStrokeGroup groupByAddingStrokeIdentifiers:removingStrokeIdentifiers:firstStrokeIdentifier:lastStrokeIdentifier:bounds:classification:groupingConfidence:firstStrokeOrigin:](&v45, sel_groupByAddingStrokeIdentifiers_removingStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_firstStrokeOrigin_, v27, v28, v29, v30, v37, x, y, width, height, a14, a16.x, a16.y);
  v38 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v38 + 136), a8);
  *(CGFloat *)(v38 + 144) = dx;
  *(CGFloat *)(v38 + 152) = dy;
  *(CGVector *)(v38 + 160) = a10;
  objc_storeStrong((id *)(v38 + 216), a11);
  if ((const void *)(v38 + 176) != a12)
    sub_1BE6F5A88((_QWORD *)(v38 + 176), *(char **)a12, *((char **)a12 + 1), (uint64_t)(*((_QWORD *)a12 + 1) - *(_QWORD *)a12) >> 4);
  *(_QWORD *)(v38 + 200) = a15;
  v39 = *(void **)(v38 + 208);
  *(_QWORD *)(v38 + 208) = v31;

  return (id)v38;
}

- (id)writingDirectionSortedSubstrokes
{
  return self->_writingDirectionSortedSubstrokes;
}

- (void)localStrokeWritingOrientations
{
  return &self->_localStrokeWritingOrientations;
}

- (CGVector)localWritingOrientationAtStrokeIndex:(int64_t)a3
{
  CGVector *v3;
  double dx;
  double dy;
  CGVector result;

  v3 = &self->_localStrokeWritingOrientations.__begin_[a3];
  dx = v3->dx;
  dy = v3->dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (CGVector)averageWritingOrientation
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_averageWritingOrientation.dx;
  dy = self->_averageWritingOrientation.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (CGVector)averageStrokeDeviation
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_averageStrokeDeviation.dx;
  dy = self->_averageStrokeDeviation.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (int64_t)lastSubstrokeIndexBeforeMerge
{
  return self->_lastSubstrokeIndexBeforeMerge;
}

- (id)coalescedLastSubstrokes
{
  return self->_coalescedLastSubstrokes;
}

- (CGPath)newEstimatedBaselineForStrokesWithTokens:(id)a3 tokenStrokeIdentifiers:(id)a4
{
  return (CGPath *)((uint64_t (*)(CHTextLineStrokeGroup *, char *, id, id, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_newEstimatedBaselineForStrokesWithTokens_tokenStrokeIdentifiers_relaxedChecks_, a3, a4, 0);
}

- (CGPath)newEstimatedBaselineForStrokesWithTokens:(id)a3 tokenStrokeIdentifiers:(id)a4 relaxedChecks:(BOOL)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t i;
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
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
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
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _BOOL4 v87;
  NSObject *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t j;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  NSObject *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  id v128;
  id v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t k;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  char *v156;
  char *v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  unint64_t v161;
  char *v162;
  char *v163;
  char *v164;
  __int128 v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  unint64_t v174;
  char *v175;
  char *v176;
  char *v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  double *v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  float v196;
  unint64_t v197;
  _BOOL4 v198;
  double *v199;
  char *v200;
  double *v201;
  BOOL v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  char v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  CGFloat *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  double v232;
  double v233;
  CGFloat v234;
  CGFloat v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  double a;
  double c;
  double tx;
  double MaxX;
  CGFloat MaxY;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  double v257;
  double v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  char v264;
  double MinX;
  double v266;
  double v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  double MinY;
  double v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  float v293;
  float v294;
  double v295;
  double v296;
  double v297;
  double v298;
  double v299;
  double *v300;
  double *v301;
  double *v302;
  uint64_t v303;
  unint64_t v304;
  uint64_t v305;
  unint64_t v306;
  char *v307;
  double *v308;
  double *v309;
  CGFloat MidX;
  double v311;
  double v312;
  double v313;
  double *v314;
  double *v315;
  uint64_t v316;
  unint64_t v317;
  uint64_t v318;
  unint64_t v319;
  char *v320;
  double *v321;
  double *v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  double v328;
  _BOOL4 v329;
  void *v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  id v349;
  const char *v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  void *v359;
  id v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  NSObject *v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  void *v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  void *v375;
  NSObject *v376;
  CGPath *v377;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  double v384;
  double v385;
  double v386;
  float v387;
  double v388;
  double v389;
  double v390;
  double v391;
  double *v392;
  double *v393;
  double *v394;
  uint64_t v395;
  unint64_t v396;
  uint64_t v397;
  unint64_t v398;
  char *v399;
  double *v400;
  char *v401;
  NSObject *v402;
  NSObject *v403;
  uint64_t v404;
  uint64_t v405;
  void *v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  NSObject *v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  double *v416;
  _BYTE *v417;
  uint64_t v418;
  uint64_t v419;
  CHQuadCurvePointFIFO *v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  void *v425;
  CHBoxcarFilterPointFIFO *v426;
  double v427;
  const char *v428;
  uint64_t v429;
  uint64_t v430;
  void *v431;
  CHPointFIFO *v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  void *v442;
  float64x2_t *v443;
  unint64_t v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  const CGPath *v450;
  void *v452;
  id v453;
  id v454;
  id v456;
  float v457;
  char v458;
  uint64_t v459;
  id v460;
  uint64_t v461;
  id obj;
  double d;
  double ty;
  double b;
  double v466;
  double v467;
  double v468;
  double v469;
  double v470;
  double v471;
  double v472;
  double v473;
  double v474;
  double v475;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v480;
  double v481;
  double v482;
  double v483;
  double v484;
  double v485;
  void *v486;
  id v487;
  CGFloat v488;
  CGFloat v489;
  double rect;
  void *v491;
  id v492;
  double v493;
  _QWORD v494[4];
  id v495;
  _QWORD v496[4];
  id v497;
  _QWORD v498[5];
  __int128 v499;
  __int128 v500;
  __int128 v501;
  __int128 v502;
  _QWORD v503[4];
  id v504;
  id v505;
  void *v506;
  _BYTE *v507;
  uint64_t v508;
  uint64_t v509;
  CGAffineTransform v510;
  CGAffineTransform v511;
  CGAffineTransform v512;
  CGAffineTransform v513;
  _QWORD v514[5];
  void *v515;
  double *v516;
  char *v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  void *__p;
  char *v523;
  char *v524;
  void *v525;
  char *v526;
  char *v527;
  _BYTE v528[128];
  uint8_t v529[32];
  __int128 v530;
  uint8_t buf[4];
  void *v532;
  __int16 v533;
  void *v534;
  uint64_t v535;
  CGRect v536;
  CGRect v537;
  CGRect v538;
  CGRect v539;
  CGRect v540;
  CGRect v541;
  CGRect v542;
  CGRect v543;
  CGRect v544;
  CGRect v545;
  CGRect v546;
  CGRect v547;
  CGRect v548;
  CGRect v549;
  CGRect v550;
  CGRect v551;
  CGRect v552;
  CGRect v553;
  CGRect v554;
  CGRect v555;
  CGRect v556;
  CGRect v557;
  CGRect v558;
  CGRect v559;
  CGRect v560;
  CGRect v561;

  v535 = *MEMORY[0x1E0C80C00];
  v454 = a3;
  v492 = a4;
  if (!a5 && !objc_msgSend_count(v492, v7, v8, v9, v10, v11))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v12 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v12, OS_LOG_TYPE_FAULT, "There needs to be at least one array of token stroke identifiers to get a baseline.", buf, 2u);
    }

  }
  if (v454)
  {
    objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v454, v7, (uint64_t)&stru_1E77F6F28, (uint64_t)&unk_1E77F16F0, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ch_possibleDescenderCharSet(MEMORY[0x1E0CB3500], v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_indexesOfCharacters_(v13, v20, (uint64_t)v19, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0C99DE8];
    v31 = objc_msgSend_count(v24, v26, v27, v28, v29, v30);
    objc_msgSend_arrayWithCapacity_(v25, v32, v31, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v503[0] = MEMORY[0x1E0C809B0];
    v503[1] = 3221225472;
    v503[2] = sub_1BE6F4DB4;
    v503[3] = &unk_1E77F3DD0;
    v453 = v36;
    v504 = v453;
    v37 = v13;
    v505 = v37;
    objc_msgSend_enumerateIndexesUsingBlock_(v24, v38, (uint64_t)v503, v39, v40, v41);

  }
  else
  {
    v453 = 0;
  }
  v42 = (void *)MEMORY[0x1E0C99DE8];
  v43 = objc_msgSend_count(v492, v7, v8, v9, v10, v11);
  objc_msgSend_arrayWithCapacity_(v42, v44, v43, v45, v46, v47);
  v486 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_count(v492, v48, v49, v50, v51, v52); ++i)
  {
    objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v54, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v486, v60, (uint64_t)v59, v61, v62, v63);

  }
  v64 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_writingDirectionSortedSubstrokes(self, v54, v55, v56, v57, v58);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend_count(v65, v66, v67, v68, v69, v70);
  objc_msgSend_arrayWithCapacity_(v64, v72, v71, v73, v74, v75);
  v491 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a5)
  {
    objc_msgSend_writingDirectionSortedSubstrokes(self, v76, v77, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend_count(v81, v82, v83, v84, v85, v86) == 0;

    if (v87)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v88 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v88, OS_LOG_TYPE_FAULT, "There should be at least one substroke for a text line stroke group to get a baseline.", buf, 2u);
      }

    }
  }
  v501 = 0u;
  v502 = 0u;
  v500 = 0u;
  v499 = 0u;
  objc_msgSend_writingDirectionSortedSubstrokes(self, v76, v77, v78, v79, v80);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v90, (uint64_t)&v499, (uint64_t)v528, 16, v91);
  if (v96)
  {
    v97 = *(_QWORD *)v500;
    do
    {
      for (j = 0; j != v96; ++j)
      {
        if (*(_QWORD *)v500 != v97)
          objc_enumerationMutation(v89);
        v99 = *(_QWORD *)(*((_QWORD *)&v499 + 1) + 8 * j);
        v498[0] = MEMORY[0x1E0C809B0];
        v498[1] = 3221225472;
        v498[2] = sub_1BE6F4E2C;
        v498[3] = &unk_1E77F3DF8;
        v498[4] = v99;
        v100 = objc_msgSend_indexOfObjectPassingTest_(v492, v92, (uint64_t)v498, v93, v94, v95);
        if (v100 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend_addObject_(v491, v92, v99, v93, v94, v95);
          objc_msgSend_objectAtIndexedSubscript_(v486, v101, v100, v102, v103, v104);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = objc_msgSend_count(v491, v106, v107, v108, v109, v110);
          objc_msgSend_addIndex_(v105, v112, v111 - 1, v113, v114, v115);

        }
      }
      v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v92, (uint64_t)&v499, (uint64_t)v528, 16, v95);
    }
    while (v96);
  }

  if (!a5 && !objc_msgSend_count(v491, v116, v117, v118, v119, v120))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v121 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v121, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v121, OS_LOG_TYPE_FAULT, "There should be at least one substroke covering one of the strokeIdentifiers.", buf, 2u);
    }

  }
  if (!objc_msgSend_count(v491, v116, v117, v118, v119, v120))
  {
    v330 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend_writingDirectionSortedSubstrokes(self, v122, v123, v124, v125, v126);
    v331 = (void *)objc_claimAutoreleasedReturnValue();
    v337 = objc_msgSend_count(v331, v332, v333, v334, v335, v336);
    objc_msgSend_arrayWithCapacity_(v330, v338, v337, v339, v340, v341);
    v342 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_writingDirectionSortedSubstrokes(self, v343, v344, v345, v346, v347);
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    v496[0] = MEMORY[0x1E0C809B0];
    v496[1] = 3221225472;
    v496[2] = sub_1BE6F4EC8;
    v496[3] = &unk_1E77F3E20;
    v349 = v342;
    v497 = v349;
    objc_msgSend_enumerateObjectsUsingBlock_(v348, v350, (uint64_t)v496, v351, v352, v353);

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v354, v355, v356, v357, v358);
    v359 = (void *)objc_claimAutoreleasedReturnValue();
    v494[0] = MEMORY[0x1E0C809B0];
    v494[1] = 3221225472;
    v494[2] = sub_1BE6F4F48;
    v494[3] = &unk_1E77F3E48;
    v360 = v359;
    v495 = v360;
    objc_msgSend_enumerateObjectsUsingBlock_(v492, v361, (uint64_t)v494, v362, v363, v364);
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v365 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v365, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_componentsJoinedByString_(v360, v366, (uint64_t)CFSTR(", "), v367, v368, v369);
      v370 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v349, v371, (uint64_t)CFSTR(", "), v372, v373, v374);
      v375 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v532 = v370;
      v533 = 2112;
      v534 = v375;
      _os_log_impl(&dword_1BE607000, v365, OS_LOG_TYPE_ERROR, "Failed to match any substrokes with token stroke identifiers.\nToken Stroke Identifiers: %@\nSubstroke Stroke Identifiers: %@", buf, 0x16u);

    }
    if (qword_1EF568E88 == -1)
    {
      v376 = (id)qword_1EF568E20;
      if (!os_log_type_enabled(v376, OS_LOG_TYPE_ERROR))
      {
LABEL_179:

        v377 = 0;
        goto LABEL_235;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v376 = (id)qword_1EF568E20;
      if (!os_log_type_enabled(v376, OS_LOG_TYPE_ERROR))
        goto LABEL_179;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v376, OS_LOG_TYPE_ERROR, "Skipping baseline estimation since substroke count == 0", buf, 2u);
    goto LABEL_179;
  }
  v127 = v491;
  v456 = v454;
  v460 = v486;
  v128 = v453;
  v452 = v127;
  if (!self)
  {
    v377 = 0;
    goto LABEL_234;
  }
  v526 = 0;
  v525 = 0;
  v527 = 0;
  v523 = 0;
  __p = 0;
  v524 = 0;
  v518 = 0u;
  v519 = 0u;
  v520 = 0u;
  v521 = 0u;
  v129 = v127;
  v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v129, v130, (uint64_t)&v518, (uint64_t)buf, 16, v131);
  v487 = v128;
  obj = v129;
  if (v137)
  {
    v138 = 0;
    v139 = *(_QWORD *)v519;
    do
    {
      for (k = 0; k != v137; ++k)
      {
        if (*(_QWORD *)v519 != v139)
          objc_enumerationMutation(obj);
        v141 = *(void **)(*((_QWORD *)&v518 + 1) + 8 * k);
        objc_msgSend_orientedBounds(v141, v132, v133, v134, v135, v136);
        v151 = v147;
        v152 = v148;
        v153 = v149;
        v154 = v150;
        v155 = v526;
        if (v526 < v527)
        {
          *(_QWORD *)v526 = v147;
          *((_QWORD *)v155 + 1) = v148;
          v156 = v155 + 32;
          *((_QWORD *)v155 + 2) = v149;
          *((_QWORD *)v155 + 3) = v150;
          goto LABEL_64;
        }
        v157 = (char *)v525;
        v158 = (v526 - (_BYTE *)v525) >> 5;
        v159 = v158 + 1;
        if ((unint64_t)(v158 + 1) >> 59)
          sub_1BE61F930();
        v160 = v527 - (_BYTE *)v525;
        if ((v527 - (_BYTE *)v525) >> 4 > v159)
          v159 = v160 >> 4;
        if ((unint64_t)v160 >= 0x7FFFFFFFFFFFFFE0)
          v161 = 0x7FFFFFFFFFFFFFFLL;
        else
          v161 = v159;
        if (v161)
        {
          if (v161 >> 59)
            sub_1BE61F100();
          v162 = (char *)operator new(32 * v161);
          v163 = &v162[32 * v158];
          *(_QWORD *)v163 = v151;
          *((_QWORD *)v163 + 1) = v152;
          *((_QWORD *)v163 + 2) = v153;
          *((_QWORD *)v163 + 3) = v154;
          v164 = v163;
          if (v155 == v157)
          {
LABEL_62:
            v156 = v163 + 32;
            v525 = v164;
            v527 = &v162[32 * v161];
            if (!v155)
              goto LABEL_64;
LABEL_63:
            operator delete(v155);
            goto LABEL_64;
          }
        }
        else
        {
          v162 = 0;
          v163 = (char *)(32 * v158);
          *(_QWORD *)v163 = v147;
          *((_QWORD *)v163 + 1) = v148;
          *((_QWORD *)v163 + 2) = v149;
          *((_QWORD *)v163 + 3) = v150;
          v164 = (char *)(32 * v158);
          if (v155 == v157)
            goto LABEL_62;
        }
        do
        {
          v165 = *((_OWORD *)v155 - 1);
          *((_OWORD *)v164 - 2) = *((_OWORD *)v155 - 2);
          *((_OWORD *)v164 - 1) = v165;
          v164 -= 32;
          v155 -= 32;
        }
        while (v155 != v157);
        v155 = v157;
        v156 = v163 + 32;
        v525 = v164;
        v527 = &v162[32 * v161];
        if (v157)
          goto LABEL_63;
LABEL_64:
        v526 = v156;
        objc_msgSend_writingOrientation(v141, v142, v143, v144, v145, v146);
        v168 = v166;
        v169 = v167;
        if (v138 < v524)
        {
          *(_QWORD *)v138 = v166;
          *((_QWORD *)v138 + 1) = v167;
          v138 += 16;
          v128 = v487;
          goto LABEL_43;
        }
        v170 = (char *)__p;
        v171 = (v138 - (_BYTE *)__p) >> 4;
        v172 = v171 + 1;
        if ((unint64_t)(v171 + 1) >> 60)
          sub_1BE61F930();
        v173 = v524 - (_BYTE *)__p;
        if ((v524 - (_BYTE *)__p) >> 3 > v172)
          v172 = v173 >> 3;
        if ((unint64_t)v173 >= 0x7FFFFFFFFFFFFFF0)
          v174 = 0xFFFFFFFFFFFFFFFLL;
        else
          v174 = v172;
        if (v174)
        {
          if (v174 >> 60)
            sub_1BE61F100();
          v175 = (char *)operator new(16 * v174);
          v176 = &v175[16 * v171];
          *(_QWORD *)v176 = v168;
          *((_QWORD *)v176 + 1) = v169;
          if (v138 == v170)
          {
LABEL_79:
            v178 = v138;
            v128 = v487;
            v138 = v176 + 16;
            __p = v176;
            v523 = v176 + 16;
            v524 = &v175[16 * v174];
            if (!v178)
              goto LABEL_43;
LABEL_80:
            operator delete(v178);
            goto LABEL_43;
          }
        }
        else
        {
          v175 = 0;
          v176 = (char *)(16 * v171);
          *(_QWORD *)v176 = v166;
          *((_QWORD *)v176 + 1) = v167;
          if (v138 == v170)
            goto LABEL_79;
        }
        v177 = v176;
        v128 = v487;
        do
        {
          *((_OWORD *)v177 - 1) = *((_OWORD *)v138 - 1);
          v177 -= 16;
          v138 -= 16;
        }
        while (v138 != v170);
        v178 = __p;
        v138 = v176 + 16;
        __p = v177;
        v523 = v176 + 16;
        v524 = &v175[16 * v174];
        if (v178)
          goto LABEL_80;
LABEL_43:
        v523 = v138;
      }
      v129 = obj;
      v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v132, (uint64_t)&v518, (uint64_t)buf, 16, v136);
    }
    while (v137);
  }

  v184 = (double *)MEMORY[0x1E0C9BAA8];
  v185 = *MEMORY[0x1E0C9BAA8];
  v473 = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
  v186 = *(double *)(MEMORY[0x1E0C9BAA8] + 16);
  v187 = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
  v188 = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
  v189 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  x = *MEMORY[0x1E0C9D648];
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v516 = 0;
  v515 = 0;
  v517 = 0;
  if (v128 && objc_msgSend_count(v128, v179, v180, v181, v182, v183))
  {
    objc_msgSend_objectAtIndex_(v128, v179, 0, v181, v182, v183);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v190, v191, v192, v193, v194, v195);
    v457 = v196;

    v459 = 0;
  }
  else
  {
    v459 = -1;
    v457 = INFINITY;
  }
  v197 = 0;
  LOBYTE(v198) = 0;
  v458 = 0;
  v461 = 0x7FFFFFFFFFFFFFFFLL;
  while (v197 < objc_msgSend_count(v129, v179, v180, v181, v182, v183))
  {
    v484 = v184[1];
    v485 = *v184;
    v482 = v184[3];
    v483 = v184[2];
    v480 = v184[5];
    v481 = v184[4];
    v200 = (char *)v525;
    v201 = (double *)((char *)v525 + 32 * v197);
    v488 = v201[1];
    v489 = *v201;
    v493 = v201[2];
    rect = v201[3];
    if (v516 == v515 && v197 >= objc_msgSend_count(v129, v179, v180, v181, v182, v183) - 1
      || (v493 < 9.0 ? (v202 = rect < 9.0) : (v202 = 0), !v202))
    {
      if (v461 == 0x7FFFFFFFFFFFFFFFLL
        || (objc_msgSend_objectAtIndexedSubscript_(v460, v179, v461, v181, v182, v183),
            v203 = (void *)objc_claimAutoreleasedReturnValue(),
            v208 = objc_msgSend_containsIndex_(v203, v204, v197, v205, v206, v207),
            v203,
            (v208 & 1) == 0))
      {
        v514[0] = MEMORY[0x1E0C809B0];
        v514[1] = 3221225472;
        v514[2] = sub_1BE6F4F54;
        v514[3] = &unk_1E77F3E68;
        v514[4] = v197;
        v461 = objc_msgSend_indexOfObjectPassingTest_(v460, v179, (uint64_t)v514, v181, v182, v183);
      }
      objc_msgSend_objectAtIndex_(v456, v179, v461, v181, v182, v183);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v209, v210, v211, v212, v213, v214);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      v221 = objc_msgSend_countCharacters(v215, v216, v217, v218, v219, v220);

      v227 = (CGFloat *)&v200[32 * v197 + 56];
      y = v488;
      x = v489;
      height = rect;
      width = v493;
      while (v197 < objc_msgSend_count(v129, v222, v223, v224, v225, v226) - 1)
      {
        v232 = *(v227 - 3);
        v233 = *(v227 - 2);
        v234 = *(v227 - 1);
        v235 = *v227;
        objc_msgSend_objectAtIndexedSubscript_(v129, v228, v197 + 1, v229, v230, v231);
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        v242 = v236;
        v530 = 0u;
        memset(v529, 0, sizeof(v529));
        if (v236)
        {
          objc_msgSend_orientationTransform(v236, v237, v238, v239, v240, v241);
          v466 = *(double *)&v529[16];
          v467 = *(double *)v529;
          v469 = *(double *)&v529[24];
          v471 = *(double *)&v529[8];
          v474 = *((double *)&v530 + 1);
          v468 = *(double *)&v530;
        }
        else
        {
          v471 = 0.0;
          v474 = 0.0;
          v468 = 0.0;
          v469 = 0.0;
          v466 = 0.0;
          v467 = 0.0;
        }
        v512.a = v485;
        v512.b = v484;
        v512.c = v483;
        v512.d = v482;
        v512.tx = v481;
        v512.ty = v480;
        CGAffineTransformInvert(&v513, &v512);
        a = v513.a;
        c = v513.c;
        d = v513.d;
        tx = v513.tx;
        ty = v513.ty;
        b = v513.b;
        v536.origin.x = v232;
        v536.origin.y = v233;
        v536.size.width = v234;
        v536.size.height = v235;
        MaxX = CGRectGetMaxX(v536);
        v537.origin.x = v232;
        v537.origin.y = v233;
        v537.size.width = v234;
        v537.size.height = v235;
        MaxY = CGRectGetMaxY(v537);
        v248 = v468 + v233 * v466 + v467 * v232;
        v249 = v474 + v233 * v469 + v471 * v232;
        v250 = tx + v249 * c + a * v248;
        v251 = *(double *)&v530 + MaxY * *(double *)&v529[16] + *(double *)v529 * MaxX;
        v510.a = v485;
        v510.b = v484;
        v252 = *((double *)&v530 + 1) + MaxY * *(double *)&v529[24] + *(double *)&v529[8] * MaxX;
        v510.c = v483;
        v510.d = v482;
        v510.tx = v481;
        v510.ty = v480;
        CGAffineTransformInvert(&v511, &v510);
        v472 = v511.b;
        v475 = v511.d;
        v257 = v251;
        v470 = v511.ty;
        v258 = v511.tx + v252 * v511.c + v511.a * v251;
        if (v221 != 1
          || (objc_msgSend_objectAtIndexedSubscript_(v460, v253, v461, v254, v255, v256),
              v259 = (void *)objc_claimAutoreleasedReturnValue(),
              v264 = objc_msgSend_containsIndex_(v259, v260, v197 + 1, v261, v262, v263),
              v259,
              (v264 & 1) == 0))
        {
          v538.origin.y = v488;
          v538.origin.x = v489;
          v538.size.width = v493;
          v538.size.height = rect;
          if (CGRectGetMinX(v538) > v250
            || (v539.origin.y = v488,
                v539.origin.x = v489,
                v539.size.width = v493,
                v539.size.height = rect,
                v250 > CGRectGetMaxX(v539)))
          {
            v540.origin.y = v488;
            v540.origin.x = v489;
            v540.size.width = v493;
            v540.size.height = rect;
            if (v250 > CGRectGetMinX(v540))
              goto LABEL_118;
            v541.origin.y = v488;
            v541.origin.x = v489;
            v541.size.width = v493;
            v541.size.height = rect;
            if (CGRectGetMinX(v541) > v258)
              goto LABEL_118;
          }
          v542.origin.y = v488;
          v542.origin.x = v489;
          v542.size.width = v493;
          v542.size.height = rect;
          MinX = v250;
          if (CGRectGetMinX(v542) > v250)
          {
            v543.origin.y = v488;
            v543.origin.x = v489;
            v543.size.width = v493;
            v543.size.height = rect;
            MinX = CGRectGetMinX(v543);
          }
          v544.origin.y = v488;
          v544.origin.x = v489;
          v544.size.width = v493;
          v544.size.height = rect;
          v202 = CGRectGetMaxX(v544) < v258;
          v266 = v258;
          if (v202)
          {
            v545.origin.y = v488;
            v545.origin.x = v489;
            v545.size.width = v493;
            v545.size.height = rect;
            v266 = CGRectGetMaxX(v545);
          }
          if ((v266 - MinX) / v493 + (v266 - MinX) / (v258 - v250) < 0.1)
          {
LABEL_118:

            break;
          }
        }
        v560.origin.y = ty + v249 * d + b * v248;
        v560.origin.x = v250 + -1.0;
        v560.size.width = 1.0;
        v560.size.height = 1.0;
        v546.origin.y = y;
        v546.origin.x = x;
        v546.size.height = height;
        v546.size.width = width;
        v547 = CGRectUnion(v546, v560);
        v561.origin.y = v470 + v252 * v475 + v472 * v257;
        v561.origin.x = v258 + -1.0;
        v561.size.width = 1.0;
        v561.size.height = 1.0;
        v548 = CGRectUnion(v547, v561);
        y = v548.origin.y;
        x = v548.origin.x;
        height = v548.size.height;
        width = v548.size.width;

        v227 += 4;
        ++v197;
      }
      v549.origin.y = y;
      v549.origin.x = x;
      v549.size.height = height;
      v549.size.width = width;
      v267 = CGRectGetMaxY(v549);
      v198 = (float)((float)(uint64_t)v197
                   / (float)(unint64_t)objc_msgSend_count(v129, v268, v269, v270, v271, v272)) >= v457
          && v459 >= 0;
      if (v198)
      {
        v550.origin.y = y;
        v550.origin.x = x;
        v550.size.height = height;
        v550.size.width = width;
        MinY = CGRectGetMinY(v550);
        v551.origin.y = y;
        v551.origin.x = x;
        v551.size.height = height;
        v551.size.width = width;
        v280 = CGRectGetMaxY(v551);
        v286 = objc_msgSend_count(v128, v281, v282, v283, v284, v285);
        v267 = (MinY + v280) * 0.5;
        v274 = v459;
        if (v459 < (unint64_t)(v286 - 1))
        {
          objc_msgSend_objectAtIndex_(v128, v273, ++v459, v275, v276, v277);
          v287 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_floatValue(v287, v288, v289, v290, v291, v292);
          v457 = v293;

          goto LABEL_128;
        }
        v459 = -1;
        v457 = INFINITY;
        v294 = v267;
        if ((v458 & 1) != 0)
        {
LABEL_153:
          v554.origin.y = y;
          v554.origin.x = x;
          v554.size.height = height;
          v554.size.width = width;
          MidX = CGRectGetMidX(v554);
          v311 = v294 + 6.0;
          v312 = v481 + v483 * v311 + v485 * MidX;
          v313 = v480 + v482 * v311 + v484 * MidX;
          v314 = v516;
          if (v516 < (double *)v517)
          {
            *v516 = v312;
            v314[1] = v313;
            v199 = v314 + 2;
            v128 = v487;
            goto LABEL_88;
          }
          v315 = (double *)v515;
          v316 = ((char *)v516 - (_BYTE *)v515) >> 4;
          v317 = v316 + 1;
          if ((unint64_t)(v316 + 1) >> 60)
            sub_1BE61F930();
          v318 = v517 - (_BYTE *)v515;
          if ((v517 - (_BYTE *)v515) >> 3 > v317)
            v317 = v318 >> 3;
          if ((unint64_t)v318 >= 0x7FFFFFFFFFFFFFF0)
            v319 = 0xFFFFFFFFFFFFFFFLL;
          else
            v319 = v317;
          if (v319)
          {
            if (v319 >> 60)
              sub_1BE61F100();
            v320 = (char *)operator new(16 * v319);
            v321 = (double *)&v320[16 * v316];
            *v321 = v312;
            v321[1] = v313;
            v322 = v321;
            if (v314 != v315)
            {
LABEL_163:
              v128 = v487;
              do
              {
                *((_OWORD *)v322 - 1) = *((_OWORD *)v314 - 1);
                v322 -= 2;
                v314 -= 2;
              }
              while (v314 != v315);
              v314 = (double *)v515;
              v199 = v321 + 2;
              v515 = v322;
              v516 = v321 + 2;
              v517 = &v320[16 * v319];
              if (!v314)
                goto LABEL_88;
LABEL_169:
              operator delete(v314);
LABEL_88:
              v458 = 1;
              v185 = v485;
              v516 = v199;
              v473 = v484;
              v187 = v482;
              v186 = v483;
              v189 = v480;
              v188 = v481;
              goto LABEL_89;
            }
          }
          else
          {
            v320 = 0;
            v321 = (double *)(16 * v316);
            *v321 = v312;
            v321[1] = v313;
            v322 = (double *)(16 * v316);
            if (v314 != v315)
              goto LABEL_163;
          }
          v128 = v487;
          v199 = v321 + 2;
          v515 = v322;
          v516 = v321 + 2;
          v517 = &v320[16 * v319];
          if (v314)
            goto LABEL_169;
          goto LABEL_88;
        }
      }
      else
      {
LABEL_128:
        v294 = v267;
        if ((v458 & 1) != 0)
          goto LABEL_153;
      }
      objc_msgSend_averageWritingOrientation(self, v273, v274, v275, v276, v277);
      if (v295 >= 0.0)
      {
        v553.origin.y = y;
        v553.origin.x = x;
        v553.size.height = height;
        v553.size.width = width;
        v296 = CGRectGetMinX(v553);
      }
      else
      {
        v552.origin.y = y;
        v552.origin.x = x;
        v552.size.height = height;
        v552.size.width = width;
        v296 = CGRectGetMaxX(v552);
      }
      v297 = v294 + 6.0;
      v298 = v481 + v483 * v297 + v485 * v296;
      v299 = v480 + v482 * v297 + v484 * v296;
      v300 = v516;
      if (v516 < (double *)v517)
      {
        *v516 = v298;
        v300[1] = v299;
        v301 = v300 + 2;
LABEL_152:
        v516 = v301;
        goto LABEL_153;
      }
      v302 = (double *)v515;
      v303 = ((char *)v516 - (_BYTE *)v515) >> 4;
      v304 = v303 + 1;
      if ((unint64_t)(v303 + 1) >> 60)
        sub_1BE61F930();
      v305 = v517 - (_BYTE *)v515;
      if ((v517 - (_BYTE *)v515) >> 3 > v304)
        v304 = v305 >> 3;
      if ((unint64_t)v305 >= 0x7FFFFFFFFFFFFFF0)
        v306 = 0xFFFFFFFFFFFFFFFLL;
      else
        v306 = v304;
      if (v306)
      {
        if (v306 >> 60)
          sub_1BE61F100();
        v307 = (char *)operator new(16 * v306);
        v308 = (double *)&v307[16 * v303];
        *v308 = v298;
        v308[1] = v299;
        v309 = v308;
        if (v300 == v302)
          goto LABEL_150;
        do
        {
LABEL_147:
          *((_OWORD *)v309 - 1) = *((_OWORD *)v300 - 1);
          v309 -= 2;
          v300 -= 2;
        }
        while (v300 != v302);
        v300 = (double *)v515;
        v301 = v308 + 2;
        v515 = v309;
        v516 = v308 + 2;
        v517 = &v307[16 * v306];
        if (!v300)
          goto LABEL_152;
      }
      else
      {
        v307 = 0;
        v308 = (double *)(16 * v303);
        *v308 = v298;
        v308[1] = v299;
        v309 = (double *)(16 * v303);
        if (v300 != v302)
          goto LABEL_147;
LABEL_150:
        v301 = v308 + 2;
        v515 = v309;
        v516 = v308 + 2;
        v517 = &v307[16 * v306];
        if (!v300)
          goto LABEL_152;
      }
      operator delete(v300);
      goto LABEL_152;
    }
LABEL_89:
    ++v197;
  }
  v555.origin.y = y;
  v555.origin.x = x;
  v555.size.height = height;
  v555.size.width = width;
  v328 = CGRectGetMaxY(v555);
  v329 = v198 || v457 <= 1.0 && v459 >= 0;
  if (!objc_msgSend_count(v129, v323, v324, v325, v326, v327))
  {
    if (v516 == v515)
      goto LABEL_210;
    goto LABEL_215;
  }
  if (v329)
  {
    v556.origin.y = y;
    v556.origin.x = x;
    v556.size.height = height;
    v556.size.width = width;
    v384 = CGRectGetMinY(v556);
    v557.origin.y = y;
    v557.origin.x = x;
    v557.size.height = height;
    v557.size.width = width;
    v328 = (v384 + CGRectGetMaxY(v557)) * 0.5;
  }
  objc_msgSend_averageWritingOrientation(self, v379, v380, v381, v382, v383);
  if (v385 >= 0.0)
  {
    v559.origin.y = y;
    v559.origin.x = x;
    v559.size.height = height;
    v559.size.width = width;
    v386 = CGRectGetMaxX(v559);
  }
  else
  {
    v558.origin.y = y;
    v558.origin.x = x;
    v558.size.height = height;
    v558.size.width = width;
    v386 = CGRectGetMinX(v558);
  }
  v387 = v328;
  v388 = v386 + 7.0;
  v389 = v387 + 6.0;
  v390 = v188 + v186 * v389 + v185 * v388;
  v391 = v189 + v187 * v389 + v473 * v388;
  v392 = v516;
  if (v516 < (double *)v517)
  {
    *v516 = v390;
    v392[1] = v391;
    v393 = v392 + 2;
    goto LABEL_209;
  }
  v394 = (double *)v515;
  v395 = ((char *)v516 - (_BYTE *)v515) >> 4;
  v396 = v395 + 1;
  if ((unint64_t)(v395 + 1) >> 60)
    sub_1BE61F930();
  v397 = v517 - (_BYTE *)v515;
  if ((v517 - (_BYTE *)v515) >> 3 > v396)
    v396 = v397 >> 3;
  if ((unint64_t)v397 >= 0x7FFFFFFFFFFFFFF0)
    v398 = 0xFFFFFFFFFFFFFFFLL;
  else
    v398 = v396;
  if (!v398)
  {
    v400 = (double *)(16 * v395);
    v401 = 0;
    *v400 = v390;
    v400[1] = v391;
    v393 = (double *)(16 * v395 + 16);
    if (v392 != v394)
      goto LABEL_205;
LABEL_240:
    v128 = v487;
    v515 = v400;
    v516 = v393;
    v517 = v401;
    if (v392)
      goto LABEL_208;
    goto LABEL_209;
  }
  if (v398 >> 60)
    sub_1BE61F100();
  v399 = (char *)operator new(16 * v398);
  v400 = (double *)&v399[16 * v395];
  v401 = &v399[16 * v398];
  *v400 = v390;
  v400[1] = v391;
  v393 = v400 + 2;
  if (v392 == v394)
    goto LABEL_240;
LABEL_205:
  v128 = v487;
  do
  {
    *((_OWORD *)v400 - 1) = *((_OWORD *)v392 - 1);
    v400 -= 2;
    v392 -= 2;
  }
  while (v392 != v394);
  v392 = (double *)v515;
  v515 = v400;
  v516 = v393;
  v517 = v401;
  if (v392)
LABEL_208:
    operator delete(v392);
LABEL_209:
  v516 = v393;
  if (v393 == v515)
  {
LABEL_210:
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v402 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v402, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v529 = 0;
      _os_log_impl(&dword_1BE607000, v402, OS_LOG_TYPE_FAULT, "The number of points in the raw baseline estimate must be > 0 at this point.", v529, 2u);
    }

  }
LABEL_215:
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v403 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v403, OS_LOG_TYPE_DEBUG))
  {
    v405 = *(_QWORD *)v515;
    v404 = *((_QWORD *)v515 + 1);
    *(_DWORD *)v529 = 134218240;
    *(_QWORD *)&v529[4] = v405;
    *(_WORD *)&v529[12] = 2048;
    *(_QWORD *)&v529[14] = v404;
    _os_log_impl(&dword_1BE607000, v403, OS_LOG_TYPE_DEBUG, "Raw points[0] = %.2f, %.2f\n", v529, 0x16u);
  }

  v509 = 0;
  v406 = (void *)objc_opt_class();
  if (v406)
  {
    objc_msgSend_regularizedPathFromPoints_delta_gamma_outError_(v406, v407, (uint64_t)&v515, (uint64_t)&v509, v408, v409, 1.0, 0.9);
    if (qword_1EF568E88 == -1)
      goto LABEL_221;
LABEL_237:
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v410 = (id)qword_1EF568E20;
    if (!os_log_type_enabled(v410, OS_LOG_TYPE_DEFAULT))
      goto LABEL_223;
LABEL_222:
    v416 = v516;
    v417 = v515;
    v418 = v509;
    v419 = objc_msgSend_count(v129, v411, v412, v413, v414, v415);
    *(_DWORD *)v529 = 134218496;
    *(_QWORD *)&v529[4] = ((char *)v416 - v417) >> 4;
    *(_WORD *)&v529[12] = 2048;
    *(_QWORD *)&v529[14] = v418;
    *(_WORD *)&v529[22] = 2048;
    *(_QWORD *)&v529[24] = v419;
    _os_log_impl(&dword_1BE607000, v410, OS_LOG_TYPE_DEFAULT, "Baseline Data detectors baseline approximation with %lu points, correction error = %.2f, number of substrokes %lu", v529, 0x20u);
    v128 = v487;
    goto LABEL_223;
  }
  v507 = 0;
  v506 = 0;
  v508 = 0;
  if (qword_1EF568E88 != -1)
    goto LABEL_237;
LABEL_221:
  v410 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v410, OS_LOG_TYPE_DEFAULT))
    goto LABEL_222;
LABEL_223:

  v420 = [CHQuadCurvePointFIFO alloc];
  v425 = (void *)objc_msgSend_initWithFIFO_(v420, v421, 0, v422, v423, v424);
  v426 = [CHBoxcarFilterPointFIFO alloc];
  LODWORD(v427) = 2.0;
  v431 = (void *)objc_msgSend_initWithFIFO_width_spacing_(v426, v428, (uint64_t)v425, 2, v429, v430, v427);
  v432 = [CHPointFIFO alloc];
  v442 = (void *)objc_msgSend_initWithFIFO_(v432, v433, (uint64_t)v431, v434, v435, v436);
  v443 = (float64x2_t *)v506;
  if (v507 != v506)
  {
    v444 = 0;
    do
    {
      objc_msgSend_addPoint_(v442, v437, v438, v439, v440, v441, COERCE_DOUBLE(vcvt_f32_f64(v443[v444++])));
      v443 = (float64x2_t *)v506;
    }
    while (v444 < (v507 - (_BYTE *)v506) >> 4);
  }
  objc_msgSend_flush(v442, v437, v438, v439, v440, v441);
  v450 = (const CGPath *)objc_msgSend_path(v425, v445, v446, v447, v448, v449);
  v377 = CGPathRetain(v450);

  if (v506)
  {
    v507 = v506;
    operator delete(v506);
  }
  if (v515)
  {
    v516 = (double *)v515;
    operator delete(v515);
  }
  if (__p)
    operator delete(__p);
  if (v525)
    operator delete(v525);
LABEL_234:

LABEL_235:
  return v377;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  _QWORD v153[2];
  _QWORD v154[4];

  v4 = a3;
  v10 = objc_msgSend_ancestorIdentifier(self, v5, v6, v7, v8, v9);
  objc_msgSend_encodeInteger_forKey_(v4, v11, v10, (uint64_t)CFSTR("ancestorIdentifier"), v12, v13);
  v19 = objc_msgSend_uniqueIdentifier(self, v14, v15, v16, v17, v18);
  objc_msgSend_encodeInteger_forKey_(v4, v20, v19, (uint64_t)CFSTR("uniqueIdentifier"), v21, v22);
  objc_msgSend_strokeIdentifiers(self, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v29, (uint64_t)v28, (uint64_t)CFSTR("strokeIdentifiers"), v30, v31);

  objc_msgSend_firstStrokeIdentifier(self, v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, (uint64_t)CFSTR("firstStrokeIdentifier"), v39, v40);

  objc_msgSend_lastStrokeIdentifier(self, v41, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v47, (uint64_t)v46, (uint64_t)CFSTR("lastStrokeIdentifier"), v48, v49);

  objc_msgSend_bounds(self, v50, v51, v52, v53, v54);
  v154[0] = v55;
  v154[1] = v56;
  v154[2] = v57;
  v154[3] = v58;
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v59, (uint64_t)v154, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v63, (uint64_t)v62, (uint64_t)CFSTR("bounds"), v64, v65);
  v71 = objc_msgSend_classification(self, v66, v67, v68, v69, v70);
  objc_msgSend_encodeInteger_forKey_(v4, v72, v71, (uint64_t)CFSTR("classification"), v73, v74);
  objc_msgSend_groupingConfidence(self, v75, v76, v77, v78, v79);
  objc_msgSend_encodeDouble_forKey_(v4, v80, (uint64_t)CFSTR("groupingConfidence"), v81, v82, v83);
  objc_msgSend_strategyIdentifier(self, v84, v85, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v90, (uint64_t)v89, (uint64_t)CFSTR("strategyIdentifier"), v91, v92);

  objc_msgSend_firstStrokeOrigin(self, v93, v94, v95, v96, v97);
  v153[0] = v98;
  v153[1] = v99;
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v100, (uint64_t)v153, (uint64_t)"{CGPoint=dd}", v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v104, (uint64_t)v103, (uint64_t)CFSTR("firstStrokeOrigin"), v105, v106);
  objc_msgSend_encodeObject_forKey_(v4, v107, (uint64_t)self->_writingDirectionSortedStrokeIdentifiers, (uint64_t)CFSTR("writingDirectionSortedStrokeIdentifiers"), v108, v109);
  objc_msgSend_encodeObject_forKey_(v4, v110, (uint64_t)self->_writingDirectionSortedSubstrokes, (uint64_t)CFSTR("writingDirectionSortedSubstrokes"), v111, v112);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v113, (uint64_t)&self->_averageStrokeDeviation, (uint64_t)"{CGPoint=dd}", v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v117, (uint64_t)v116, (uint64_t)CFSTR("averageStrokeDeviation"), v118, v119);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v120, (uint64_t)&self->_averageWritingOrientation, (uint64_t)"{CGPoint=dd}", v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v124, (uint64_t)v123, (uint64_t)CFSTR("averageWritingOrientation"), v125, v126);
  v127 = (void *)MEMORY[0x1E0C99D50];
  v133 = *(_QWORD *)objc_msgSend_localStrokeWritingOrientations(self, v128, v129, v130, v131, v132);
  v139 = (_QWORD *)objc_msgSend_localStrokeWritingOrientations(self, v134, v135, v136, v137, v138);
  objc_msgSend_dataWithBytes_length_(v127, v140, v133, v139[1] - *v139, v141, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v144, (uint64_t)v143, (uint64_t)CFSTR("localStrokeWritingOrientations"), v145, v146);
  objc_msgSend_encodeInteger_forKey_(v4, v147, self->_lastSubstrokeIndexBeforeMerge, (uint64_t)CFSTR("lastSubstrokeIndexBeforeMerge"), v148, v149);
  objc_msgSend_encodeObject_forKey_(v4, v150, (uint64_t)self->_coalescedLastSubstrokes, (uint64_t)CFSTR("coalescedLastSubstrokes"), v151, v152);

}

- (CHTextLineStrokeGroup)initWithCoder:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  CHTextLineStrokeGroup *v143;
  void *v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *__p;
  void *v156;
  uint64_t v157;
  double v158[2];
  double v159[2];
  _QWORD v160[2];
  __int128 v161;
  __int128 v162;
  _QWORD v163[2];
  _QWORD v164[2];
  _QWORD v165[2];
  _QWORD v166[4];

  v166[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = objc_msgSend_decodeIntegerForKey_(v3, v4, (uint64_t)CFSTR("ancestorIdentifier"), v5, v6, v7);
  v13 = objc_msgSend_decodeIntegerForKey_(v3, v9, (uint64_t)CFSTR("uniqueIdentifier"), v10, v11, v12);
  v14 = (void *)MEMORY[0x1E0C99E60];
  v166[0] = objc_opt_class();
  v166[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v166, 2, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v14, v19, (uint64_t)v18, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = v13;
  v148 = v8;
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v24, (uint64_t)v23, (uint64_t)CFSTR("strokeIdentifiers"), v25, v26);
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v28, v27, (uint64_t)CFSTR("firstStrokeIdentifier"), v29, v30);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v32, v31, (uint64_t)CFSTR("lastStrokeIdentifier"), v33, v34);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v36, v35, (uint64_t)CFSTR("bounds"), v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v161 = *MEMORY[0x1E0C9D628];
  v162 = v40;
  v146 = v39;
  objc_msgSend_getValue_size_(v39, v41, (uint64_t)&v161, 32, v42, v43);
  objc_msgSend_decodeDoubleForKey_(v3, v44, (uint64_t)CFSTR("groupingConfidence"), v45, v46, v47);
  v49 = v48;
  v54 = objc_msgSend_decodeIntegerForKey_(v3, v50, (uint64_t)CFSTR("classification"), v51, v52, v53);
  v55 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v56, v55, (uint64_t)CFSTR("strategyIdentifier"), v57, v58);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v60, v59, (uint64_t)CFSTR("firstStrokeOrigin"), v61, v62);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getValue_size_(v145, v63, (uint64_t)v160, 16, v64, v65);
  v66 = (void *)MEMORY[0x1E0C99E60];
  v165[0] = objc_opt_class();
  v165[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v67, (uint64_t)v165, 2, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v66, v71, (uint64_t)v70, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v54;
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v77, (uint64_t)v75, (uint64_t)CFSTR("writingDirectionSortedStrokeIdentifiers"), v78, v79);
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  v80 = (void *)MEMORY[0x1E0C99E60];
  v164[0] = objc_opt_class();
  v164[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v81, (uint64_t)v164, 2, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v80, v85, (uint64_t)v84, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v90, (uint64_t)v89, (uint64_t)CFSTR("writingDirectionSortedSubstrokes"), v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v95, v94, (uint64_t)CFSTR("averageStrokeDeviation"), v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getValue_size_(v98, v99, (uint64_t)v159, 16, v100, v101);
  v102 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v103, v102, (uint64_t)CFSTR("averageWritingOrientation"), v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getValue_size_(v106, v107, (uint64_t)v158, 16, v108, v109);
  v110 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v111, v110, (uint64_t)CFSTR("localStrokeWritingOrientations"), v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend_length(v114, v115, v116, v117, v118, v119);
  v121 = objc_retainAutorelease(v114);
  v127 = (char *)objc_msgSend_bytes(v121, v122, v123, v124, v125, v126);
  __p = 0;
  v156 = 0;
  v157 = 0;
  sub_1BE6F5A88(&__p, v127, &v127[v120 & 0xFFFFFFFFFFFFFFF0], v120 >> 4);
  v128 = (void *)MEMORY[0x1E0C99E60];
  v163[0] = objc_opt_class();
  v163[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v129, (uint64_t)v163, 2, v130, v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v128, v133, (uint64_t)v132, v134, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v138, (uint64_t)v137, (uint64_t)CFSTR("coalescedLastSubstrokes"), v139, v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  v143 = (CHTextLineStrokeGroup *)objc_msgSend_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_strategyIdentifier_writingDirectionSortedSubstrokes_averageWritingOrientation_averageStrokeDeviation_writingDirectionSortedStrokeIdentifiers_localStrokeWritingOrientations_coalescedLastSubstrokes_groupingConfidence_firstStrokeOrigin_(self, v142, v147, v148, (uint64_t)v154, (uint64_t)v153, v152, v76, v161, v162, v158[0], v158[1], v159[0], v159[1], v151, v93, v150, &__p, v141,
                                    v49,
                                    v160[0],
                                    v160[1]);

  if (__p)
  {
    v156 = __p;
    operator delete(__p);
  }

  return v143;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)writingDirectionSortedStrokeIdentifiers
{
  return self->_writingDirectionSortedStrokeIdentifiers;
}

- (void).cxx_destruct
{
  CGVector *begin;

  objc_storeStrong((id *)&self->_writingDirectionSortedStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_coalescedLastSubstrokes, 0);
  begin = self->_localStrokeWritingOrientations.__begin_;
  if (begin)
  {
    self->_localStrokeWritingOrientations.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_writingDirectionSortedSubstrokes, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 22) = 0;
  return self;
}

@end
