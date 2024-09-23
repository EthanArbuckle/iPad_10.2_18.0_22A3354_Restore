@implementation CHNormalizedDrawingVisualization

- (int64_t)layeringPriority
{
  return 2;
}

- (BOOL)wantsInputDrawings
{
  return 1;
}

- (CGRect)dirtyRectForStrokeGroup:(id)a3
{
  double y;
  double height;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)CHNormalizedDrawingVisualization;
  -[CHStrokeGroupBasedVisualization dirtyRectForStrokeGroup:](&v13, sel_dirtyRectForStrokeGroup_, a3);
  y = v14.origin.y;
  height = v14.size.height;
  v5 = 200.0 - CGRectGetHeight(v14);
  v6 = v5 * 0.5;
  v7 = v5 <= 0.0;
  if (v5 <= 0.0)
    v5 = -0.0;
  v8 = height + v5;
  v9 = 0.0;
  if (!v7)
    v9 = v6;
  v10 = y - v9;
  v11 = 0x40C3880000000000;
  v12 = 0;
  return CGRectInset(*(CGRect *)(&v8 - 3), -2.0, -2.0);
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  CGFloat height;
  CHNormalizedDrawingVisualization *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int shouldDrawStrokeGroup;
  uint64_t v50;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  CGColorSpace *v68;
  double v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  __int128 v92;
  CGFloat MidY;
  double v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  CGFloat v102;
  double MaxX;
  BOOL v104;
  double v105;
  CGFloat v106;
  double MinX;
  CGFloat v108;
  double MaxY;
  double v110;
  CGFloat v111;
  double MinY;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  void *v118;
  CGColorSpace *DeviceRGB;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  CGColor *v124;
  CGColor *v125;
  id v126;
  CGColorSpace *v127;
  CGColor *v128;
  CGColor *v129;
  CGPath *Mutable;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t i;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  CGFloat v151;
  CGFloat v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  CGFloat v158;
  CGFloat v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t j;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  unint64_t v184;
  double v185;
  double v186;
  CGFloat v187;
  CGFloat v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  double a;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  id v205;
  CGColor *v206;
  id v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t k;
  void *v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  double v228;
  double v229;
  double v230;
  double v231;
  id v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  void *v239;
  CHNormalizedDrawingVisualization *v240;
  double v241;
  double v242;
  __int128 v243;
  __int128 v244;
  id obj;
  uint64_t v246;
  __int128 v247;
  CGFloat v248;
  double v249;
  CGFloat rect;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  void *v254;
  void *v255;
  uint64_t v256;
  double MidX;
  uint64_t v258;
  double v260;
  double v261;
  CGFloat v262;
  CGColorSpaceRef space;
  CGFloat spacea;
  CGColorSpace *spaceb;
  CGFloat v266;
  CGFloat v267;
  id v268;
  CGAffineTransform v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  objc_super v274;
  CGAffineTransform v275;
  __int128 v276;
  _BYTE v277[128];
  CGAffineTransform m;
  uint64_t v279;
  CGRect v280;
  CGRect v281;
  CGRect v282;
  CGRect v283;
  CGRect v284;
  CGRect v285;
  CGRect v286;
  CGRect v287;
  CGRect v288;
  CGRect v289;
  CGRect v290;
  CGRect v291;
  CGRect v292;
  CGRect v293;
  CGRect v294;
  CGRect v295;
  CGRect v296;
  CGRect v297;
  CGRect v298;
  CGRect v299;
  CGRect v300;
  CGRect v301;
  CGRect v302;
  CGRect v303;
  CGRect v304;
  CGRect v305;
  CGRect v306;
  CGRect v307;
  CGRect v308;
  CGRect v309;
  CGRect v310;
  CGRect v311;
  CGRect v312;
  CGRect v313;

  height = a5.size.height;
  v7 = self;
  v279 = *MEMORY[0x1E0C80C00];
  v274.receiver = self;
  v274.super_class = (Class)CHNormalizedDrawingVisualization;
  x = a5.origin.x;
  y = a5.origin.y;
  width = a5.size.width;
  -[CHStrokeGroupBasedVisualization drawVisualizationInRect:context:viewBounds:](&v274, sel_drawVisualizationInRect_context_viewBounds_);
  objc_msgSend_resultDrawn(v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(v13, v14, v15, v16, v17, v18);
  v270 = 0u;
  v271 = 0u;
  v272 = 0u;
  v273 = 0u;
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroups(v238, v19, v20, v21, v22, v23);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v270, (uint64_t)v277, 16, v25);
  if (v26)
  {
    v31 = v26;
    v258 = *(_QWORD *)v271;
    v241 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v242 = *MEMORY[0x1E0C9D820];
    rect = height;
    v239 = v13;
    v240 = v7;
    do
    {
      v32 = 0;
      v246 = v31;
      do
      {
        if (*(_QWORD *)v271 != v258)
          objc_enumerationMutation(obj);
        v36 = *(void **)(*((_QWORD *)&v270 + 1) + 8 * v32);
        objc_msgSend_dirtyRectForStrokeGroup_(v7, v27, (uint64_t)v36, v28, v29, v30);
        v38 = v37;
        v40 = v39;
        v42 = v41;
        v44 = v43;
        shouldDrawStrokeGroup = objc_msgSend_shouldDrawStrokeGroup_(v7, v45, (uint64_t)v36, v46, v47, v48);
        v280.origin.x = v38;
        v280.origin.y = v40;
        v280.size.width = v42;
        v280.size.height = v44;
        if (CGRectIntersectsRect(v280, a3) && shouldDrawStrokeGroup != 0)
        {
          v52 = objc_msgSend_uniqueIdentifier(v36, v27, v50, v28, v29, v30);
          objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v13, v53, v52, v54, v55, v56);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_inputDrawing(v33, v57, v58, v59, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v62;
          if (v62)
          {
            memset(&v269, 0, sizeof(v269));
            objc_msgSend_bounds(v62, v63, v64, v65, v66, v67);
            space = v68;
            v266 = v69;
            v71 = v70;
            v73 = v72;
            objc_msgSend_bounds(v36, v74, v75, v76, v77, v78);
            if (v7)
            {
              v88 = v84;
              v89 = v85;
              v90 = v86;
              v91 = v87;
              v92 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
              v247 = *MEMORY[0x1E0C9BAA8];
              *(_OWORD *)&v269.a = *MEMORY[0x1E0C9BAA8];
              *(_OWORD *)&v269.c = v92;
              v243 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
              v244 = v92;
              *(_OWORD *)&v269.tx = v243;
              *(CGFloat *)&v92 = v89;
              MidX = CGRectGetMidX(*(CGRect *)&v84);
              v281.origin.x = v88;
              v281.origin.y = v89;
              v281.size.width = v90;
              v281.size.height = v91;
              MidY = CGRectGetMidY(v281);
              v282.origin.x = x;
              v282.origin.y = y;
              v282.size.width = width;
              v282.size.height = rect;
              v94 = CGRectGetWidth(v282);
              *(_QWORD *)&v283.origin.x = space;
              v283.origin.y = v266;
              v283.size.width = v71;
              v283.size.height = v73;
              v260 = 1.0;
              v261 = MidY;
              if (CGRectGetWidth(v283) > 0.0)
              {
                *(_QWORD *)&v284.origin.x = space;
                v284.origin.y = v266;
                v284.size.width = v71;
                v284.size.height = v73;
                if (CGRectGetWidth(v284) > v94 + -8.0)
                {
                  *(_QWORD *)&v285.origin.x = space;
                  v285.origin.y = v266;
                  v285.size.width = v71;
                  v285.size.height = v73;
                  v95 = CGRectGetWidth(v285);
                  *(_OWORD *)&m.a = v247;
                  *(_OWORD *)&m.c = v244;
                  *(_OWORD *)&m.tx = v243;
                  v260 = (v94 + -8.0) / v95;
                  CGAffineTransformScale(&v269, &m, v260, v260);
                }
              }
              m = v269;
              v286.size.height = v73;
              v286.origin.y = v266;
              *(_QWORD *)&v286.origin.x = space;
              v286.size.width = v71;
              v287 = CGRectApplyAffineTransform(v286, &m);
              v96 = v287.origin.x;
              v248 = v71;
              v97 = v287.origin.y;
              v98 = v287.size.width;
              v99 = v287.size.height;
              v100 = MidX - CGRectGetMidX(v287);
              v288.origin.x = v96;
              v288.origin.y = v97;
              v288.size.width = v98;
              v288.size.height = v99;
              v101 = CGRectGetMidY(v288);
              v275 = v269;
              CGAffineTransformTranslate(&m, &v275, v100 / v260, (v261 - v101) / v260);
              v269 = m;
              *(_QWORD *)&v289.origin.x = space;
              v289.origin.y = v266;
              v289.size.width = v248;
              v289.size.height = v73;
              v290 = CGRectApplyAffineTransform(v289, &m);
              v102 = v290.origin.x;
              spacea = v290.size.width;
              v267 = v290.origin.y;
              v262 = v290.size.height;
              MaxX = CGRectGetMaxX(v290);
              v291.origin.x = x;
              v291.origin.y = y;
              v291.size.width = width;
              v291.size.height = rect;
              v104 = MaxX <= CGRectGetMaxX(v291) + -4.0;
              v105 = v242;
              if (!v104)
              {
                v292.origin.x = x;
                v292.origin.y = y;
                v292.size.width = width;
                v292.size.height = rect;
                v106 = CGRectGetMaxX(v292) + -4.0;
                v293.origin.x = v102;
                v293.size.width = spacea;
                v293.origin.y = v267;
                v293.size.height = v262;
                v105 = v106 - CGRectGetMaxX(v293);
              }
              v249 = v105;
              v294.origin.x = v102;
              v294.size.width = spacea;
              v294.origin.y = v267;
              v294.size.height = v262;
              MinX = CGRectGetMinX(v294);
              v295.origin.x = x;
              v295.origin.y = y;
              v295.size.width = width;
              v295.size.height = rect;
              if (MinX < CGRectGetMinX(v295) + 4.0)
              {
                v296.origin.x = x;
                v296.origin.y = y;
                v296.size.width = width;
                v296.size.height = rect;
                v108 = CGRectGetMinX(v296) + 4.0;
                v297.origin.x = v102;
                v297.size.width = spacea;
                v297.origin.y = v267;
                v297.size.height = v262;
                v249 = v108 - CGRectGetMinX(v297);
              }
              v298.origin.x = v102;
              v298.size.width = spacea;
              v298.origin.y = v267;
              v298.size.height = v262;
              MaxY = CGRectGetMaxY(v298);
              v299.origin.x = x;
              v299.origin.y = y;
              v299.size.width = width;
              v299.size.height = rect;
              v110 = v241;
              if (MaxY > CGRectGetMaxY(v299) + -4.0)
              {
                v300.origin.x = x;
                v300.origin.y = y;
                v300.size.width = width;
                v300.size.height = rect;
                v111 = CGRectGetMaxY(v300) + -4.0;
                v301.origin.x = v102;
                v301.size.width = spacea;
                v301.origin.y = v267;
                v301.size.height = v262;
                v110 = v111 - CGRectGetMaxY(v301);
              }
              v302.origin.x = v102;
              v302.size.width = spacea;
              v302.origin.y = v267;
              v302.size.height = v262;
              MinY = CGRectGetMinY(v302);
              v303.origin.x = x;
              v303.origin.y = y;
              v303.size.width = width;
              v303.size.height = rect;
              if (MinY < CGRectGetMinY(v303) + 4.0)
              {
                v304.origin.x = x;
                v304.origin.y = y;
                v304.size.width = width;
                v304.size.height = rect;
                v113 = CGRectGetMinY(v304) + 4.0;
                v305.origin.x = v102;
                v305.size.width = spacea;
                v305.origin.y = v267;
                v305.size.height = v262;
                v110 = v113 - CGRectGetMinY(v305);
              }
              v275 = v269;
              CGAffineTransformTranslate(&m, &v275, v249 / v260, v110 / v260);
              v269 = m;
            }
            else
            {
              memset(&v269, 0, sizeof(v269));
            }
            objc_msgSend_bounds(v34, v79, v80, v81, v82, v83);
            m = v269;
            v307 = CGRectApplyAffineTransform(v306, &m);
            v255 = v33;
            v256 = v32;
            v254 = v34;
            if (v7)
            {
              v114 = v307.origin.x;
              v115 = v307.origin.y;
              v116 = v307.size.width;
              v117 = v307.size.height;
              v118 = v13;
              DeviceRGB = CGColorSpaceCreateDeviceRGB();
              v308.origin.x = v114;
              v308.origin.y = v115;
              v308.size.width = v116;
              v308.size.height = v117;
              v309 = CGRectInset(v308, -1.0, -1.0);
              v120 = v309.origin.x;
              v121 = v309.origin.y;
              v122 = v309.size.width;
              v123 = v309.size.height;
              v124 = CGColorCreate(DeviceRGB, dbl_1BE8D5D98);
              CGContextSetFillColorWithColor(a4, v124);
              v310.origin.x = v120;
              v310.origin.y = v121;
              v310.size.width = v122;
              v310.size.height = v123;
              CGContextFillRect(a4, v310);
              v125 = CGColorCreate(DeviceRGB, dbl_1BE8D5DB8);
              CGContextSetStrokeColorWithColor(a4, v125);
              CGContextSetLineWidth(a4, 1.0);
              v311.origin.x = v120;
              v311.origin.y = v121;
              v311.size.width = v122;
              v311.size.height = v123;
              CGContextStrokeRect(a4, v311);
              CGColorRelease(v124);
              CGColorRelease(v125);
              CGColorSpaceRelease(DeviceRGB);
              m = v269;
              v126 = v34;
              v127 = CGColorSpaceCreateDeviceRGB();
              v128 = CGColorCreate(v127, dbl_1BE8D5DD8);
              v129 = CGColorCreate(v127, dbl_1BE8D5DF8);
              CGContextSetLineWidth(a4, 1.0);
              CGContextSetLineCap(a4, kCGLineCapRound);
              CGContextSetLineJoin(a4, kCGLineJoinRound);
              Mutable = CGPathCreateMutable();
              if (objc_msgSend_strokeCount(v126, v131, v132, v133, v134, v135))
              {
                v140 = 0;
                for (i = objc_msgSend_pointCountForStrokeIndex_(v126, v136, 0, v137, v138, v139);
                      ;
                      i = objc_msgSend_pointCountForStrokeIndex_(v126, v147, v140, v148, v149, v150))
                {
                  if (i)
                  {
                    objc_msgSend_pointForStrokeIndex_pointIndex_(v126, v142, v140, 0, v145, v146);
                    CGPathMoveToPoint(Mutable, &m, v151, v152);
                    if ((unint64_t)objc_msgSend_pointCountForStrokeIndex_(v126, v153, v140, v154, v155, v156) >= 2)
                    {
                      v157 = 1;
                      do
                      {
                        objc_msgSend_pointForStrokeIndex_pointIndex_(v126, v142, v140, v157, v145, v146);
                        CGPathAddLineToPoint(Mutable, &m, v158, v159);
                        ++v157;
                      }
                      while (v157 < objc_msgSend_pointCountForStrokeIndex_(v126, v160, v140, v161, v162, v163));
                    }
                  }
                  if (++v140 >= (unint64_t)objc_msgSend_strokeCount(v126, v142, v143, v144, v145, v146))
                    break;
                }
              }
              CGContextSetStrokeColorWithColor(a4, v128);
              CGContextAddPath(a4, Mutable);
              CGContextStrokePath(a4);
              CGPathRelease(Mutable);
              CGContextSetFillColorWithColor(a4, v129);
              v13 = v118;
              if (objc_msgSend_strokeCount(v126, v164, v165, v166, v167, v168))
              {
                v173 = 0;
                for (j = objc_msgSend_pointCountForStrokeIndex_(v126, v169, 0, v170, v171, v172);
                      ;
                      j = objc_msgSend_pointCountForStrokeIndex_(v126, v180, v173, v181, v182, v183))
                {
                  if (j)
                  {
                    v184 = 0;
                    do
                    {
                      objc_msgSend_pointForStrokeIndex_pointIndex_(v126, v175, v173, v184, v178, v179);
                      v187 = m.tx + v185 * m.c + m.a * v186;
                      v188 = m.ty + v185 * m.d + m.b * v186;
                      v312.origin.x = v187 + -1.5;
                      v312.origin.y = v188 + -1.5;
                      v312.size.width = 3.0;
                      v312.size.height = 3.0;
                      CGContextFillEllipseInRect(a4, v312);
                      ++v184;
                    }
                    while (v184 < objc_msgSend_pointCountForStrokeIndex_(v126, v189, v173, v190, v191, v192));
                  }
                  if (++v173 >= (unint64_t)objc_msgSend_strokeCount(v126, v175, v176, v177, v178, v179))
                    break;
                }
              }
              CGColorRelease(v128);
              CGColorRelease(v129);
              CGColorSpaceRelease(v127);
              v31 = v246;
              v33 = v255;
              v32 = v256;
              v34 = v254;

              objc_msgSend_inputDrawingCutPoints(v255, v193, v194, v195, v196, v197);
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              if (v198)
              {
LABEL_49:
                a = v269.a;
                b = v269.b;
                c = v269.c;
                d = v269.d;
                tx = v269.tx;
                ty = v269.ty;
                v35 = v198;
                v205 = v34;
                if (v7)
                {
                  spaceb = CGColorSpaceCreateDeviceRGB();
                  v206 = CGColorCreate(spaceb, dbl_1BE8D5E18);
                  CGContextSetFillColorWithColor(a4, v206);
                  v276 = 0u;
                  memset(&v275, 0, sizeof(v275));
                  v268 = v35;
                  v207 = v35;
                  v210 = objc_msgSend_countByEnumeratingWithState_objects_count_(v207, v208, (uint64_t)&v275, (uint64_t)&m, 16, v209);
                  if (v210)
                  {
                    v215 = v210;
                    v216 = **(_QWORD **)&v275.c;
                    do
                    {
                      for (k = 0; k != v215; ++k)
                      {
                        if (**(_QWORD **)&v275.c != v216)
                          objc_enumerationMutation(v207);
                        v218 = *(void **)(*(_QWORD *)&v275.b + 8 * k);
                        v219 = objc_msgSend_indexAtPosition_(v218, v211, 0, v212, v213, v214);
                        v224 = objc_msgSend_indexAtPosition_(v218, v220, 1, v221, v222, v223);
                        objc_msgSend_pointForStrokeIndex_pointIndex_(v205, v225, v219, v224, v226, v227);
                        v230 = tx + c * v228 + a * v229;
                        v231 = ty + d * v228 + b * v229;
                        v313.origin.x = v230 + -2.0;
                        v313.origin.y = v231 + -2.0;
                        v313.size.width = 4.0;
                        v313.size.height = 4.0;
                        CGContextFillEllipseInRect(a4, v313);
                      }
                      v215 = objc_msgSend_countByEnumeratingWithState_objects_count_(v207, v211, (uint64_t)&v275, (uint64_t)&m, 16, v214);
                    }
                    while (v215);
                  }

                  CGColorSpaceRelease(spaceb);
                  CGColorRelease(v206);
                  v13 = v239;
                  v7 = v240;
                  v31 = v246;
                  v33 = v255;
                  v32 = v256;
                  v34 = v254;
                  v35 = v268;
                }

              }
            }
            else
            {
              m = v269;
              v232 = v34;

              objc_msgSend_inputDrawingCutPoints(v33, v233, v234, v235, v236, v237);
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              if (v198)
                goto LABEL_49;
            }

          }
        }
        ++v32;
      }
      while (v32 != v31);
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v270, (uint64_t)v277, 16, v30);
    }
    while (v31);
  }

}

- (BOOL)shouldDrawStrokeGroup:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v11 = objc_msgSend_classification(v4, v6, v7, v8, v9, v10);
  if (objc_msgSend_isStrokeClassificationTextOrMath_(v5, v12, v11, v13, v14, v15))
  {
    objc_msgSend_activeStrokeGroupAncestorIdentifiers(self, v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v28 = objc_msgSend_ancestorIdentifier(v4, v23, v24, v25, v26, v27);
    objc_msgSend_numberWithInteger_(v22, v29, v28, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v22) = objc_msgSend_containsObject_(v21, v34, (uint64_t)v33, v35, v36, v37);

    return (char)v22;
  }
  else
  {

    return 0;
  }
}

@end
