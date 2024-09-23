@implementation CHStrokeGroupBaselineLegacyVisualization

- (int64_t)layeringPriority
{
  return 0;
}

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  objc_msgSend_bounds(a3, a2, (uint64_t)a3, v3, v4, v5);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  MinX = CGRectGetMinX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v12 = CGRectGetMaxY(v20) + 10.0 + -22.0;
  if (self)
    v13 = 22.0;
  else
    v13 = 0.0;
  if (self)
    v14 = v12;
  else
    v14 = 0.0;
  if (self)
    v15 = MinX + -22.0;
  else
    v15 = 0.0;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v16 = v13;
  v22 = CGRectUnion(v21, *(CGRect *)(&v13 - 2));
  result = CGRectInset(v22, -22.0, -22.0);
  v17 = result.size.height + 13.0;
  v18 = result.size.width + 7.0;
  result.size.height = v17;
  result.size.width = v18;
  return result;
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  CHQuadCurvePointFIFO *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CHBoxcarFilterPointFIFO *v49;
  double v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  CHPointFIFO *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  size_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  size_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  uint64_t v89;
  char *v90;
  double v91;
  __int128 v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  NSObject *v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  double v111;
  CGFloat v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  long double v117;
  long double v118;
  long double v119;
  double MidX;
  double MidY;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  __int128 v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char v138;
  unint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  double v151;
  CGFloat v152;
  double v153;
  CGFloat v154;
  double v155;
  CGFloat v156;
  double v157;
  CGFloat v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  long double v163;
  long double v164;
  long double v165;
  double v166;
  double v167;
  CGFloat *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  CGFloat *v173;
  unint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  double v186;
  CGFloat v187;
  double v188;
  CGFloat v189;
  double v190;
  CGFloat v191;
  double v192;
  CGFloat v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  long double v198;
  long double v199;
  long double v200;
  double v201;
  double v202;
  __int128 v203;
  __int128 v204;
  double v205;
  double MaxX;
  double MaxY;
  double v208;
  double v209;
  double v210;
  CGFloat MinX;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  BOOL v220;
  double v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  double v227;
  CGFloat v228;
  unsigned int v229;
  unsigned int v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  double v236;
  CGFloat v237;
  unsigned int v238;
  unsigned int v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  double v255;
  CGFloat v256;
  unsigned int v257;
  unsigned int v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const CGPath *v269;
  const CGPath *v270;
  double v271;
  double v272;
  CGFloat v273;
  CGFloat v274;
  double v275;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CFTypeRef v280;
  void *v281;
  void *v282;
  const void *v283;
  _QWORD *v284;
  void *v285;
  _QWORD *v286;
  void *v287;
  _QWORD *v288;
  void *v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  id v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  id v302;
  const CGPath *v303;
  void *v304;
  void *v305;
  const void *v306;
  void *v307;
  void *v308;
  const void *v309;
  void *v310;
  void *v311;
  CGColor *color;
  CGColorSpace *space;
  CGFloat v314;
  CGFloat v315;
  CGFloat v316;
  CGFloat v317;
  CGColor *v318;
  CFTypeRef v319;
  CFTypeRef cf;
  double v321;
  double v322;
  id obj;
  uint64_t v324;
  id v325;
  CGFloat v326;
  uint64_t v327;
  uint64_t v329;
  uint64_t i;
  double v332;
  double v333;
  uint64_t v335;
  uint64_t v336;
  double v337;
  double v338;
  double v339;
  double v340;
  double *v341;
  id v342;
  char *v343;
  double v344;
  double v345;
  double v346;
  double v347;
  double v348;
  double tx;
  double v350;
  double ty;
  double v352;
  __int128 v353;
  double a;
  double v355;
  double b;
  double d;
  __int128 v358;
  CGRect v359;
  CGFloat recta;
  double rect;
  CGFloat v362;
  double v363;
  void *v364;
  double v365;
  double v366;
  double v367;
  CGFloat v368;
  CGFloat v369;
  uint64_t v370;
  __int128 v371;
  CGFloat v372;
  __int128 v373;
  double v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  objc_super v379;
  __int128 v380;
  __int128 v381;
  void *v382[2];
  __int128 v383;
  __int128 v384;
  __int128 v385;
  _QWORD v386[4];
  CGAffineTransform v387;
  uint64_t v388;
  double *v389;
  uint64_t v390;
  uint64_t v391;
  CGAffineTransform v392;
  CGAffineTransform v393;
  _QWORD v394[3];
  _QWORD v395[3];
  CGFloat lengths[2];
  _BYTE v397[128];
  uint64_t v398;
  uint64_t *v399;
  uint64_t v400;
  void *v401;
  CGAffineTransform v402;
  CGAffineTransform *v403;
  uint64_t *v404;
  CGAffineTransform v405;
  CGAffineTransform buf;
  __int128 v407;
  uint64_t v408;
  CGRect v409;
  CGRect v410;
  CGRect v411;
  CGRect v412;
  CGRect v413;
  CGRect v414;
  CGRect v415;
  CGRect v416;
  CGRect v417;
  CGRect v418;
  CGRect v419;
  CGRect v420;
  CGRect v421;
  CGRect v422;
  CGRect v423;
  CGRect v424;
  CGRect v425;
  CGRect v426;
  CGRect v427;
  CGRect v428;
  CGRect v429;
  CGRect v430;
  CGRect v431;
  CGRect v432;
  CGRect v433;
  CGRect v434;

  v408 = *MEMORY[0x1E0C80C00];
  v379.receiver = self;
  v379.super_class = (Class)CHStrokeGroupBaselineLegacyVisualization;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v379, sel_drawVisualizationInRect_context_viewBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v10 = (void *)objc_msgSend_recognitionSession(self, v5, v6, v7, v8, v9);
  v370 = objc_msgSend_latestStrokeProvider(v10, v11, v12, v13, v14, v15);
  space = CGColorSpaceCreateDeviceRGB();
  color = CGColorCreate(space, dbl_1BE8E0958);
  v318 = CGColorCreate(space, dbl_1BE8E0978);
  cf = (CFTypeRef)sub_1BE893C44(10.0);
  v319 = (CFTypeRef)sub_1BE893C44(12.0);
  CGContextSetStrokeColorWithColor(a4, color);
  CGContextSetFillColorWithColor(a4, color);
  v377 = 0u;
  v378 = 0u;
  v375 = 0u;
  v376 = 0u;
  v21 = (void *)objc_msgSend_resultDrawn(self, v16, v17, v18, v19, v20);
  v27 = (void *)objc_msgSend_strokeGroupingResult(v21, v22, v23, v24, v25, v26);
  obj = (id)objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v27, v28, 1, 1, v29, v30);
  v329 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v375, (uint64_t)v397, 16, v32);
  if (v329)
  {
    v327 = *(_QWORD *)v376;
    v37 = 22.0;
    if (!self)
      v37 = 0.0;
    v326 = v37;
    v321 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v322 = *MEMORY[0x1E0C9D538];
    v339 = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
    v340 = *MEMORY[0x1E0C9BAA8];
    v337 = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
    v338 = *(double *)(MEMORY[0x1E0C9BAA8] + 16);
    v335 = *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 40);
    v336 = *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v316 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v317 = *MEMORY[0x1E0C9D648];
    v315 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v314 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      for (i = 0; i != v329; ++i)
      {
        if (*(_QWORD *)v376 != v327)
          objc_enumerationMutation(obj);
        v364 = *(void **)(*((_QWORD *)&v375 + 1) + 8 * i);
        objc_msgSend_dirtyRectForStrokeGroup_(self, v33, (uint64_t)v364, v34, v35, v36);
        if (CGRectIntersectsRect(v409, a3))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = (void *)objc_msgSend_delegate(self, v33, v38, v34, v35, v36);
            v324 = objc_msgSend_visualizationIndexForStrokeGroup_(v39, v40, (uint64_t)v364, v41, v42, v43);
            CGContextSaveGState(a4);
            *(_OWORD *)lengths = xmmword_1BE8D5D10;
            CGContextSetLineWidth(a4, 2.0);
            CGContextSetLineDash(a4, 0.0, lengths, 2uLL);
            CGContextSetAlpha(a4, 0.8);
            if (self)
            {
              v44 = [CHQuadCurvePointFIFO alloc];
              v325 = (id)objc_msgSend_initWithFIFO_(v44, v45, 0, v46, v47, v48);
              v49 = [CHBoxcarFilterPointFIFO alloc];
              LODWORD(v50) = 2.0;
              v54 = (id)objc_msgSend_initWithFIFO_width_spacing_(v49, v51, (uint64_t)v325, 3, v52, v53, v50);
              v55 = [CHPointFIFO alloc];
              v342 = (id)objc_msgSend_initWithFIFO_(v55, v56, (uint64_t)v54, v57, v58, v59);
              v65 = (void *)objc_msgSend_writingDirectionSortedStrokeIdentifiers(v364, v60, v61, v62, v63, v64);
              v71 = objc_msgSend_count(v65, v66, v67, v68, v69, v70);
              v343 = (char *)malloc_type_calloc(v71, 0x20uLL, 0x1000040E0EAB150uLL);
              v77 = objc_msgSend_count(v65, v72, v73, v74, v75, v76);
              v341 = (double *)malloc_type_calloc(v77, 8uLL, 0x100004000313F17uLL);
              v384 = 0u;
              v385 = 0u;
              *(_OWORD *)v382 = 0u;
              v383 = 0u;
              v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v78, (uint64_t)v382, (uint64_t)&v398, 16, v79);
              if (v85)
              {
                v86 = 0;
                v87 = *(_QWORD *)v383;
                v88 = 0.0;
                do
                {
                  v89 = 0;
                  v90 = &v343[32 * v86];
                  do
                  {
                    if (*(_QWORD *)v383 != v87)
                      objc_enumerationMutation(v65);
                    v93 = *((_QWORD *)v382[1] + v89);
                    v94 = (void *)objc_opt_class();
                    v103 = (void *)objc_msgSend_strokeForIdentifier_inStrokeProvider_(v94, v95, v93, v370, v96, v97);
                    v371 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
                    v373 = *MEMORY[0x1E0C9D648];
                    v380 = *MEMORY[0x1E0C9D648];
                    v381 = v371;
                    if (v103)
                    {
                      if (!(v86 - 0x7FFFFFFFFFFFFFFFLL + v89))
                      {
                        if (qword_1EF568E88 != -1)
                          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                        v104 = (id)qword_1EF568E18[0];
                        if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
                        {
                          LODWORD(buf.a) = 134217984;
                          *(CGFloat *)((char *)&buf.a + 4) = NAN;
                          _os_log_impl(&dword_1BE607000, v104, OS_LOG_TYPE_FAULT, "Invalid stroke index %ld", (uint8_t *)&buf, 0xCu);
                        }
                      }
                      objc_msgSend_bounds(v103, v98, v99, v100, v101, v102);
                      v106 = v105;
                      v108 = v107;
                      v110 = v109;
                      v112 = v111;
                      objc_msgSend_localWritingOrientationAtStrokeIndex_(v364, v113, v86 + v89, v114, v115, v116);
                      v119 = atan2(v118, v117);
                      v410.origin.x = v106;
                      v410.origin.y = v108;
                      v410.size.width = v110;
                      v410.size.height = v112;
                      MidX = CGRectGetMidX(v410);
                      v411.origin.x = v106;
                      v411.origin.y = v108;
                      v411.size.width = v110;
                      v411.size.height = v112;
                      MidY = CGRectGetMidY(v411);
                      memset(&v392, 0, sizeof(v392));
                      CGAffineTransformMakeTranslation(&v392, MidX, MidY);
                      v393 = v392;
                      CGAffineTransformRotate(&buf, &v393, v119);
                      v392 = buf;
                      v393 = buf;
                      CGAffineTransformTranslate(&buf, &v393, -MidX, -MidY);
                      v392 = buf;
                      memset(&v393, 0, sizeof(v393));
                      CGAffineTransformInvert(&v393, &buf);
                      buf.a = 0.0;
                      *(_QWORD *)&buf.b = &buf;
                      *(_QWORD *)&buf.c = 0x4010000000;
                      *(_QWORD *)&buf.d = &unk_1BE94989A;
                      *(_OWORD *)&buf.tx = v373;
                      v407 = v371;
                      v388 = 0;
                      v389 = (double *)&v388;
                      v390 = 0x2020000000;
                      v391 = 0;
                      v387.a = 0.0;
                      *(_QWORD *)&v387.b = &v387;
                      *(_QWORD *)&v387.c = 0x3010000000;
                      *(_QWORD *)&v387.d = &unk_1BE94989A;
                      *(_OWORD *)&v387.tx = *MEMORY[0x1E0C9D538];
                      v386[0] = 0;
                      v386[1] = v386;
                      v386[2] = 0x2020000000;
                      v386[3] = 0;
                      *(_QWORD *)&v402.a = MEMORY[0x1E0C809B0];
                      *(_QWORD *)&v402.b = 3221225472;
                      *(_QWORD *)&v402.c = sub_1BE893DB0;
                      *(_QWORD *)&v402.d = &unk_1E77F6608;
                      v405 = v393;
                      *(_QWORD *)&v402.tx = v386;
                      *(_QWORD *)&v402.ty = &buf;
                      v403 = &v387;
                      v404 = &v388;
                      objc_msgSend_enumeratePointsWithTimestep_usingBlock_(v103, v122, (uint64_t)&v402, v123, v124, v125, 0.00833333333);
                      v126 = *(_OWORD *)(*(_QWORD *)&buf.b + 48);
                      v380 = *(_OWORD *)(*(_QWORD *)&buf.b + 32);
                      v381 = v126;
                      v91 = v389[3];
                      _Block_object_dispose(v386, 8);
                      _Block_object_dispose(&v387, 8);
                      _Block_object_dispose(&v388, 8);
                      _Block_object_dispose(&buf, 8);
                    }
                    else
                    {
                      v91 = 0.0;
                    }
                    v92 = v381;
                    *(_OWORD *)v90 = v380;
                    *((_OWORD *)v90 + 1) = v92;
                    v90 += 32;
                    v341[v86 + v89] = v91;
                    v88 = v88 + v91;
                    ++v89;
                  }
                  while (v85 != v89);
                  v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v98, (uint64_t)v382, (uint64_t)&v398, 16, v102);
                  v86 += v89;
                }
                while (v85);
              }
              else
              {
                v88 = 0.0;
              }
              v127 = objc_msgSend_count(v65, v80, v81, v82, v83, v84);
              *(_QWORD *)&v358 = v336;
              *((_QWORD *)&v358 + 1) = v335;
              b = v339;
              d = v337;
              a = v340;
              v355 = v338;
              v359.size.width = v315;
              v359.size.height = v314;
              v359.origin.x = v317;
              v359.origin.y = v316;
              v332 = v321;
              v333 = v322;
              if (objc_msgSend_count(v65, v128, v129, v130, v131, v132))
              {
                v138 = 0;
                v139 = 0;
                v344 = v88 / (double)(unint64_t)v127 * 0.2;
                v332 = v321;
                v333 = v322;
                do
                {
                  v140 = objc_msgSend_objectAtIndexedSubscript_(v65, v133, v139, v135, v136, v137);
                  v141 = (void *)objc_opt_class();
                  v145 = (void *)objc_msgSend_strokeForIdentifier_inStrokeProvider_(v141, v142, v140, v370, v143, v144);
                  *(_QWORD *)&v358 = v336;
                  *((_QWORD *)&v358 + 1) = v335;
                  b = v339;
                  d = v337;
                  a = v340;
                  v355 = v338;
                  if (v145)
                  {
                    objc_msgSend_bounds(v145, v146, v147, v148, v149, v150);
                    v152 = v151;
                    v154 = v153;
                    v156 = v155;
                    v158 = v157;
                    objc_msgSend_localWritingOrientationAtStrokeIndex_(v364, v159, v139, v160, v161, v162);
                    v165 = atan2(v164, v163);
                    v412.origin.x = v152;
                    v412.origin.y = v154;
                    v412.size.width = v156;
                    v412.size.height = v158;
                    v166 = CGRectGetMidX(v412);
                    v413.origin.x = v152;
                    v413.origin.y = v154;
                    v413.size.width = v156;
                    v413.size.height = v158;
                    v167 = CGRectGetMidY(v413);
                    memset(&v393, 0, sizeof(v393));
                    CGAffineTransformMakeTranslation(&v393, v166, v167);
                    buf = v393;
                    CGAffineTransformRotate(&v402, &buf, v165);
                    v393 = v402;
                    buf = v402;
                    CGAffineTransformTranslate(&v402, &buf, -v166, -v167);
                    v393 = v402;
                    a = v402.a;
                    v355 = v402.c;
                    b = v402.b;
                    d = v402.d;
                    v358 = *(_OWORD *)&v402.tx;
                  }
                  v168 = (CGFloat *)&v343[32 * v139];
                  v372 = *v168;
                  v369 = v168[1];
                  v374 = v168[2];
                  v368 = v168[3];
                  if (v139 >= objc_msgSend_count(v65, v146, v147, v148, v149, v150) - 1)
                  {
                    v359.size.width = v374;
                    v359.size.height = v368;
                    v359.origin.x = v372;
                    v359.origin.y = v369;
                    v174 = v139;
LABEL_49:
                    if ((v138 & 1) != 0)
                      goto LABEL_51;
                  }
                  else
                  {
                    v359.origin.x = v372;
                    v359.origin.y = v369;
                    v359.size.width = v374;
                    v359.size.height = v368;
                    v173 = (CGFloat *)&v343[32 * v139 + 56];
                    while (1)
                    {
                      v174 = v139 + 1;
                      v366 = *(v173 - 3);
                      v365 = *(v173 - 2);
                      v362 = *(v173 - 1);
                      recta = *v173;
                      v175 = objc_msgSend_objectAtIndexedSubscript_(v65, v169, v139 + 1, v170, v171, v172);
                      v176 = (void *)objc_opt_class();
                      v180 = (void *)objc_msgSend_strokeForIdentifier_inStrokeProvider_(v176, v177, v175, v370, v178, v179);
                      objc_msgSend_bounds(v180, v181, v182, v183, v184, v185);
                      v187 = v186;
                      v189 = v188;
                      v191 = v190;
                      v193 = v192;
                      objc_msgSend_localWritingOrientationAtStrokeIndex_(v364, v194, v139 + 1, v195, v196, v197);
                      v200 = atan2(v199, v198);
                      v414.origin.x = v187;
                      v414.origin.y = v189;
                      v414.size.width = v191;
                      v414.size.height = v193;
                      v201 = CGRectGetMidX(v414);
                      v415.origin.x = v187;
                      v415.origin.y = v189;
                      v415.size.width = v191;
                      v415.size.height = v193;
                      v202 = CGRectGetMidY(v415);
                      memset(&v393, 0, sizeof(v393));
                      CGAffineTransformMakeTranslation(&v393, v201, v202);
                      buf = v393;
                      CGAffineTransformRotate(&v402, &buf, v200);
                      v393 = v402;
                      buf = v402;
                      CGAffineTransformTranslate(&v402, &buf, -v201, -v202);
                      v393 = v402;
                      v353 = *(_OWORD *)&v402.a;
                      v203 = *(_OWORD *)&v402.c;
                      v204 = *(_OWORD *)&v402.tx;
                      ty = v402.ty;
                      v352 = v402.d;
                      v402.a = a;
                      v402.b = b;
                      v402.c = v355;
                      v402.d = d;
                      *(_OWORD *)&v402.tx = v358;
                      CGAffineTransformInvert(&v392, &v402);
                      v205 = v392.c;
                      v346 = v392.d;
                      tx = v392.tx;
                      v350 = v392.a;
                      v347 = v392.ty;
                      v348 = v392.b;
                      v416.origin.x = v366;
                      v416.origin.y = v365;
                      v416.size.width = v362;
                      v416.size.height = recta;
                      MaxX = CGRectGetMaxX(v416);
                      v417.origin.x = v366;
                      v417.origin.y = v365;
                      v417.size.width = v362;
                      v417.size.height = recta;
                      MaxY = CGRectGetMaxY(v417);
                      v402.a = a;
                      v402.b = b;
                      v402.c = v355;
                      v402.d = d;
                      *(_OWORD *)&v402.tx = v358;
                      CGAffineTransformInvert(&v387, &v402);
                      v208 = v387.a;
                      v363 = v387.b;
                      v209 = v387.c;
                      v345 = v387.d;
                      v210 = v387.tx;
                      rect = v387.ty;
                      v418.origin.x = v372;
                      v418.origin.y = v369;
                      v418.size.width = v374;
                      v418.size.height = v368;
                      MinX = CGRectGetMinX(v418);
                      v212 = *(double *)&v204 + v365 * *(double *)&v203 + *(double *)&v353 * v366;
                      v367 = ty + v365 * v352 + *((double *)&v353 + 1) * v366;
                      v213 = v367 * v205;
                      v214 = v212;
                      v215 = *(double *)&v204 + *(double *)&v203 * MaxY + *(double *)&v353 * MaxX;
                      v216 = ty + v352 * MaxY + *((double *)&v353 + 1) * MaxX;
                      v217 = v210 + v216 * v209 + v208 * v215;
                      v218 = tx + v213 + v350 * v212;
                      if (MinX > v218
                        || (v419.origin.x = v372,
                            v419.origin.y = v369,
                            v419.size.width = v374,
                            v419.size.height = v368,
                            v218 > CGRectGetMaxX(v419)))
                      {
                        v420.origin.x = v372;
                        v420.origin.y = v369;
                        v420.size.width = v374;
                        v420.size.height = v368;
                        if (v218 > CGRectGetMinX(v420))
                          goto LABEL_45;
                        v421.origin.x = v372;
                        v421.origin.y = v369;
                        v421.size.width = v374;
                        v421.size.height = v368;
                        if (CGRectGetMinX(v421) > v217)
                          goto LABEL_45;
                      }
                      v422.origin.x = v372;
                      v422.origin.y = v369;
                      v422.size.width = v374;
                      v422.size.height = v368;
                      v219 = v218;
                      if (CGRectGetMinX(v422) > v218)
                      {
                        v423.origin.x = v372;
                        v423.origin.y = v369;
                        v423.size.width = v374;
                        v423.size.height = v368;
                        v219 = CGRectGetMinX(v423);
                      }
                      v424.origin.x = v372;
                      v424.origin.y = v369;
                      v424.size.width = v374;
                      v424.size.height = v368;
                      v220 = CGRectGetMaxX(v424) < v217;
                      v221 = v217;
                      if (v220)
                      {
                        v425.origin.x = v372;
                        v425.origin.y = v369;
                        v425.size.width = v374;
                        v425.size.height = v368;
                        v221 = CGRectGetMaxX(v425);
                      }
                      if ((v221 - v219) / v374 + (v221 - v219) / (v217 - v218) < 0.3)
                      {
LABEL_45:
                        if (v341[v139 + 1] >= v344)
                          break;
                      }
                      v433.origin.y = v347 + v367 * v346 + v348 * v214;
                      v433.origin.x = v218 + -1.0;
                      v433.size.width = 1.0;
                      v433.size.height = 1.0;
                      v426 = CGRectUnion(v359, v433);
                      v434.origin.y = rect + v216 * v345 + v363 * v215;
                      v434.origin.x = v217 + -1.0;
                      v434.size.width = 1.0;
                      v434.size.height = 1.0;
                      v359 = CGRectUnion(v426, v434);
                      v173 += 4;
                      ++v139;
                      if (v174 >= objc_msgSend_count(v65, v222, v223, v224, v225, v226) - 1)
                        goto LABEL_49;
                    }
                    v174 = v139;
                    if ((v138 & 1) != 0)
                      goto LABEL_51;
                  }
                  v227 = CGRectGetMinX(v359);
                  v228 = CGRectGetMaxY(v359) + 6.0;
                  v332 = *((double *)&v358 + 1) + d * v228 + b * v227;
                  v333 = *(double *)&v358 + v355 * v228 + a * v227;
                  *(float *)&v229 = v333;
                  *(float *)&v230 = v332;
                  objc_msgSend_addPoint_(v342, v231, v232, v233, v234, v235, COERCE_DOUBLE(__PAIR64__(v230, v229)));
LABEL_51:
                  v236 = CGRectGetMidX(v359);
                  v237 = CGRectGetMaxY(v359) + 6.0;
                  *(float *)&v238 = *(double *)&v358 + v355 * v237 + a * v236;
                  *(float *)&v239 = *((double *)&v358 + 1) + d * v237 + b * v236;
                  objc_msgSend_addPoint_(v342, v240, v241, v242, v243, v244, COERCE_DOUBLE(__PAIR64__(v239, v238)));
                  v139 = v174 + 1;
                  v138 = 1;
                }
                while (v174 + 1 < objc_msgSend_count(v65, v245, v246, v247, v248, v249));
              }
              if (objc_msgSend_count(v65, v133, v134, v135, v136, v137))
              {
                v255 = CGRectGetMaxX(v359);
                v256 = CGRectGetMaxY(v359) + 6.0;
                *(float *)&v257 = *(double *)&v358 + v355 * v256 + a * (v255 + 7.0);
                *(float *)&v258 = *((double *)&v358 + 1) + d * v256 + b * (v255 + 7.0);
                objc_msgSend_addPoint_(v342, v259, v260, v261, v262, v263, COERCE_DOUBLE(__PAIR64__(v258, v257)));
              }
              objc_msgSend_flush(v342, v250, v251, v252, v253, v254);
              free(v343);
              free(v341);
              v269 = (const CGPath *)objc_msgSend_path(v325, v264, v265, v266, v267, v268);
              v270 = CGPathRetain(v269);
            }
            else
            {
              v270 = 0;
              v332 = v321;
              v333 = v322;
            }
            CGContextAddPath(a4, v270);
            CGContextStrokePath(a4);
            CGPathRelease(v270);
            if (self)
              v271 = v332 + 10.0 + -22.0;
            else
              v271 = 0.0;
            if (self)
              v272 = v333 + -22.0;
            else
              v272 = 0.0;
            CGContextSetLineWidth(a4, 2.0);
            CGContextSetAlpha(a4, 0.8);
            v427.origin.x = v272;
            v427.origin.y = v271;
            v427.size.width = v326;
            v427.size.height = v326;
            CGContextFillEllipseInRect(a4, v427);
            v428.origin.x = v272;
            v428.origin.y = v271;
            v428.size.width = v326;
            v428.size.height = v326;
            v273 = CGRectGetMidY(v428);
            CGContextTranslateCTM(a4, 0.0, v273);
            CGContextScaleCTM(a4, 1.0, -1.0);
            v429.origin.x = v272;
            v429.origin.y = v271;
            v429.size.width = v326;
            v429.size.height = v326;
            v274 = CGRectGetMidY(v429);
            CGContextTranslateCTM(a4, 0.0, -v274);
            if (v324 <= 98)
              v275 = 3.0;
            else
              v275 = 4.5;
            v430.origin.x = v272;
            v430.origin.y = v271;
            v430.size.width = v326;
            v430.size.height = v326;
            v431 = CGRectInset(v430, 0.0, v275);
            x = v431.origin.x;
            y = v431.origin.y;
            width = v431.size.width;
            height = v431.size.height;
            if (v324 <= 98)
              v280 = v319;
            else
              v280 = cf;
            LOBYTE(v393.a) = 2;
            LODWORD(buf.a) = 0;
            *(_QWORD *)&buf.b = 1;
            *(_QWORD *)&buf.c = &v393;
            v398 = 0;
            v399 = &v398;
            v400 = 0x2020000000;
            v281 = off_1EF568490;
            v401 = off_1EF568490;
            if (!off_1EF568490)
            {
              v382[0] = 0;
              if (qword_1EF568488)
              {
                v282 = (void *)qword_1EF568488;
              }
              else
              {
                *(_OWORD *)&v402.a = xmmword_1E77F6628;
                v402.c = 0.0;
                qword_1EF568488 = _sl_dlopen();
                v282 = (void *)qword_1EF568488;
                if (!qword_1EF568488)
                  goto LABEL_135;
                if (v382[0])
                  free(v382[0]);
              }
              v281 = dlsym(v282, "CTParagraphStyleCreate");
              v399[3] = (uint64_t)v281;
              off_1EF568490 = v281;
            }
            _Block_object_dispose(&v398, 8);
            if (!v281)
              goto LABEL_130;
            v283 = (const void *)((uint64_t (*)(CGAffineTransform *, uint64_t))v281)(&buf, 1);
            v398 = 0;
            v399 = &v398;
            v400 = 0x2020000000;
            v284 = (_QWORD *)qword_1EF568498;
            v401 = (void *)qword_1EF568498;
            if (!qword_1EF568498)
            {
              v382[0] = 0;
              if (qword_1EF568488)
              {
                v285 = (void *)qword_1EF568488;
              }
              else
              {
                *(_OWORD *)&v402.a = xmmword_1E77F6628;
                v402.c = 0.0;
                qword_1EF568488 = _sl_dlopen();
                v285 = (void *)qword_1EF568488;
                if (!qword_1EF568488)
                  goto LABEL_135;
                if (v382[0])
                  free(v382[0]);
              }
              v284 = dlsym(v285, "kCTFontAttributeName");
              v399[3] = (uint64_t)v284;
              qword_1EF568498 = (uint64_t)v284;
            }
            _Block_object_dispose(&v398, 8);
            if (!v284)
              goto LABEL_130;
            v394[0] = *v284;
            v395[0] = v280;
            v398 = 0;
            v399 = &v398;
            v400 = 0x2020000000;
            v286 = (_QWORD *)qword_1EF5684A0;
            v401 = (void *)qword_1EF5684A0;
            if (!qword_1EF5684A0)
            {
              v382[0] = 0;
              if (qword_1EF568488)
              {
                v287 = (void *)qword_1EF568488;
              }
              else
              {
                *(_OWORD *)&v402.a = xmmword_1E77F6628;
                v402.c = 0.0;
                qword_1EF568488 = _sl_dlopen();
                v287 = (void *)qword_1EF568488;
                if (!qword_1EF568488)
                  goto LABEL_135;
                if (v382[0])
                  free(v382[0]);
              }
              v286 = dlsym(v287, "kCTForegroundColorAttributeName");
              v399[3] = (uint64_t)v286;
              qword_1EF5684A0 = (uint64_t)v286;
            }
            _Block_object_dispose(&v398, 8);
            if (!v286)
              goto LABEL_130;
            v394[1] = *v286;
            v395[1] = v318;
            v398 = 0;
            v399 = &v398;
            v400 = 0x2020000000;
            v288 = (_QWORD *)qword_1EF5684A8;
            v401 = (void *)qword_1EF5684A8;
            if (!qword_1EF5684A8)
            {
              v382[0] = 0;
              if (qword_1EF568488)
              {
                v289 = (void *)qword_1EF568488;
              }
              else
              {
                *(_OWORD *)&v402.a = xmmword_1E77F6628;
                v402.c = 0.0;
                qword_1EF568488 = _sl_dlopen();
                v289 = (void *)qword_1EF568488;
                if (!qword_1EF568488)
                  goto LABEL_135;
                if (v382[0])
                  free(v382[0]);
              }
              v288 = dlsym(v289, "kCTParagraphStyleAttributeName");
              v399[3] = (uint64_t)v288;
              qword_1EF5684A8 = (uint64_t)v288;
            }
            _Block_object_dispose(&v398, 8);
            if (!v288)
              goto LABEL_130;
            v394[2] = *v288;
            v395[2] = v283;
            v292 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v290, (uint64_t)v395, (uint64_t)v394, 3, v291);
            v293 = objc_alloc(MEMORY[0x1E0CB3498]);
            v298 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v294, (uint64_t)CFSTR("%ld"), v295, v296, v297, v324 + 1);
            v302 = (id)objc_msgSend_initWithString_attributes_(v293, v299, v298, v292, v300, v301);
            v432.origin.x = x;
            v432.origin.y = y;
            v432.size.width = width;
            v432.size.height = height;
            v303 = CGPathCreateWithRect(v432, 0);
            v398 = 0;
            v399 = &v398;
            v400 = 0x2020000000;
            v304 = off_1EF5684B0;
            v401 = off_1EF5684B0;
            if (!off_1EF5684B0)
            {
              v382[0] = 0;
              if (qword_1EF568488)
              {
                v305 = (void *)qword_1EF568488;
              }
              else
              {
                *(_OWORD *)&v402.a = xmmword_1E77F6628;
                v402.c = 0.0;
                qword_1EF568488 = _sl_dlopen();
                v305 = (void *)qword_1EF568488;
                if (!qword_1EF568488)
                  goto LABEL_135;
                if (v382[0])
                  free(v382[0]);
              }
              v304 = dlsym(v305, "CTFramesetterCreateWithAttributedString");
              v399[3] = (uint64_t)v304;
              off_1EF5684B0 = v304;
            }
            _Block_object_dispose(&v398, 8);
            if (!v304)
              goto LABEL_130;
            v306 = (const void *)((uint64_t (*)(id))v304)(v302);
            v398 = 0;
            v399 = &v398;
            v400 = 0x2020000000;
            v307 = off_1EF5684B8;
            v401 = off_1EF5684B8;
            if (!off_1EF5684B8)
            {
              v382[0] = 0;
              if (qword_1EF568488)
              {
                v308 = (void *)qword_1EF568488;
              }
              else
              {
                *(_OWORD *)&v402.a = xmmword_1E77F6628;
                v402.c = 0.0;
                qword_1EF568488 = _sl_dlopen();
                v308 = (void *)qword_1EF568488;
                if (!qword_1EF568488)
                  goto LABEL_135;
                if (v382[0])
                  free(v382[0]);
              }
              v307 = dlsym(v308, "CTFramesetterCreateFrame");
              v399[3] = (uint64_t)v307;
              off_1EF5684B8 = v307;
            }
            _Block_object_dispose(&v398, 8);
            if (!v307)
            {
LABEL_130:
              dlerror();
              abort_report_np();
              goto LABEL_136;
            }
            v309 = (const void *)((uint64_t (*)(const void *, _QWORD, _QWORD, const CGPath *, _QWORD))v307)(v306, 0, 0, v303, 0);
            CGContextSetAlpha(a4, 1.0);
            v398 = 0;
            v399 = &v398;
            v400 = 0x2020000000;
            v310 = off_1EF5684C0;
            v401 = off_1EF5684C0;
            if (!off_1EF5684C0)
            {
              v382[0] = 0;
              if (qword_1EF568488)
              {
                v311 = (void *)qword_1EF568488;
              }
              else
              {
                *(_OWORD *)&v402.a = xmmword_1E77F6628;
                v402.c = 0.0;
                qword_1EF568488 = _sl_dlopen();
                v311 = (void *)qword_1EF568488;
                if (!qword_1EF568488)
                {
LABEL_135:
                  abort_report_np();
LABEL_136:
                  __break(1u);
                }
                if (v382[0])
                  free(v382[0]);
              }
              v310 = dlsym(v311, "CTFrameDraw");
              v399[3] = (uint64_t)v310;
              off_1EF5684C0 = v310;
            }
            _Block_object_dispose(&v398, 8);
            if (!v310)
              goto LABEL_130;
            ((void (*)(const void *, CGContext *))v310)(v309, a4);
            CFRelease(v309);
            CFRelease(v306);
            CGPathRelease(v303);
            CFRelease(v283);
            CGContextRestoreGState(a4);
          }
        }
      }
      v329 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v375, (uint64_t)v397, 16, v36);
    }
    while (v329);
  }
  CGColorRelease(color);
  CGColorRelease(v318);
  CGColorSpaceRelease(space);
  CFRelease(cf);
  CFRelease(v319);
}

@end
