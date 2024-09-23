@implementation DOCTransitionUtils

+ (void)performZoomTransitionInContainer:(id)a3 withSourceView:(id)a4 destinationView:(id)a5 duration:(double)a6 alterativeView:(id)a7 thumbnail:(id)a8 thumbnailStyle:(unint64_t)a9 location:(CGRect)a10 presenting:(BOOL)a11 fadingSource:(BOOL)a12 completion:(id)a13
{
  void *v13;
  double height;
  double width;
  double y;
  double x;
  char v18;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  __int128 v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  uint64_t v88;
  uint64_t v89;
  CGFloat v90;
  double v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  double v103;
  CGFloat v104;
  double v105;
  double v106;
  CGFloat v107;
  double v108;
  double v109;
  double v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  double v115;
  double v116;
  CGFloat v117;
  double v118;
  double v119;
  double v120;
  double v121;
  CGFloat v122;
  double v123;
  double v124;
  CGFloat v125;
  double v126;
  CGFloat v127;
  double v128;
  CGFloat v129;
  double v130;
  CGFloat v131;
  double v132;
  double v133;
  CGFloat v134;
  double v135;
  double v136;
  double v137;
  double v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  CGFloat v151;
  double v152;
  double v153;
  double v154;
  CGFloat v155;
  double v156;
  double v157;
  CGFloat v158;
  double v159;
  double v160;
  CGFloat v161;
  double v162;
  CGFloat v163;
  double v164;
  CGFloat v165;
  double v166;
  CGFloat v167;
  double v168;
  double v169;
  CGFloat v170;
  double v171;
  double v172;
  double v173;
  uint64_t v174;
  uint64_t v175;
  double v176;
  double v177;
  double v178;
  double v179;
  CGFloat v180;
  double v181;
  double v182;
  double v183;
  double v184;
  CGFloat v185;
  double v186;
  uint64_t v187;
  double v188;
  uint64_t v189;
  uint64_t v190;
  id v191;
  id v192;
  id v193;
  id v194;
  void (**v195)(_QWORD);
  id v196;
  id v197;
  id v198;
  id v199;
  void *v200;
  id v201;
  id v202;
  id v203;
  id v204;
  void *v205;
  void *v206;
  id *v207;
  id *v208;
  id v209;
  id v210;
  double v211;
  uint64_t v212;
  double v213;
  _BOOL4 IsReduceMotionEnabled;
  double v215;
  double v216;
  double v217;
  double v218;
  uint64_t v219;
  id v220;
  void *v221;
  double v222;
  void *v223;
  double v224;
  __int128 v225;
  id v226;
  __int128 v227;
  id v228;
  __int128 v229;
  id v230;
  _QWORD v231[4];
  void *v232;
  _QWORD v233[4];
  id v234;
  _QWORD v235[4];
  void *v236;
  _QWORD v237[4];
  id v238;
  _QWORD v239[4];
  id v240;
  id v241;
  id v242;
  id v243;
  id v244;
  id v245;
  _QWORD v246[4];
  id v247;
  id v248;
  id v249;
  id v250;
  uint64_t v251;
  uint64_t v252;
  double v253;
  double v254;
  double v255;
  double v256;
  uint64_t v257;
  double v258;
  CGAffineTransform v259;
  CGAffineTransform v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  _QWORD v264[4];
  id v265;
  id v266;
  id v267;
  id v268;
  id v269;
  uint64_t v270;
  uint64_t v271;
  double v272;
  double v273;
  uint64_t v274;
  double v275;
  double v276;
  double v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  CGAffineTransform v281;
  CGAffineTransform v282;
  BOOL v283;
  CGAffineTransform v284;
  CGAffineTransform v285;
  CGAffineTransform v286;
  CGAffineTransform v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  CGAffineTransform v291;
  CGAffineTransform v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;

  height = a10.size.height;
  width = a10.size.width;
  y = a10.origin.y;
  x = a10.origin.x;
  v18 = a9;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a7;
  v28 = a8;
  v220 = a13;
  if (!v28)
  {
    objc_msgSend(v24, "center");
    x = v29 + -20.0;
    objc_msgSend(v24, "center");
    y = v30 + -20.0;
    height = 40.0;
    width = 40.0;
  }
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v28);
  objc_msgSend(v31, "setContentMode:", 1);
  objc_msgSend(v31, "setFrame:", x, y, width, height);
  objc_msgSend(v31, "setAccessibilityIgnoresInvertColors:", 1);
  if ((v18 & 1) != 0)
  {
    v32 = v27;
    if ((v18 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scale");
      v33 = 1.0 / v34;
    }
    else
    {
      v33 = 1.0;
    }
    objc_msgSend(v31, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBorderWidth:", v33);

    if ((v18 & 2) != 0)
    objc_msgSend(v31, "frame");
    v37 = v36;
    objc_msgSend(v31, "frame");
    if (v37 >= v38)
      v39 = v37;
    else
      v39 = v38;
    v40 = v39 * 6.0 * 0.0078125 + -1.0;
    if (v40 >= 3.0)
      v41 = v40;
    else
      v41 = 3.0;
    objc_msgSend(v31, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCornerRadius:", v41);

    v43 = *MEMORY[0x24BDE58E8];
    objc_msgSend(v31, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setCornerCurve:", v43);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.121568627);
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v46 = objc_msgSend(v45, "CGColor");
    objc_msgSend(v31, "layer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setBorderColor:", v46);

    objc_msgSend(v31, "setClipsToBounds:", 1);
    v27 = v32;
  }
  objc_msgSend(v24, "addSubview:", v31);
  v222 = a6;
  v221 = v27;
  if (v27)
  {
    objc_msgSend(v27, "snapshotViewAfterScreenUpdates:", 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    objc_msgSend(v27, "convertRect:toView:", v24);
    objc_msgSend(v48, "setFrame:");
    objc_msgSend(v24, "addSubview:", v48);
    objc_msgSend(v27, "setAlpha:", 0.0);
  }
  else
  {
    v48 = 0;
  }
  v49 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v293 = *MEMORY[0x24BDBD8B8];
  v294 = v49;
  v295 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v292.a = v293;
  *(_OWORD *)&v292.c = v49;
  *(_OWORD *)&v292.tx = v295;
  *(_OWORD *)&v291.a = v293;
  *(_OWORD *)&v291.c = v49;
  *(_OWORD *)&v291.tx = v295;
  v288 = v293;
  v289 = v49;
  v290 = v295;
  *(_OWORD *)&v287.a = v293;
  *(_OWORD *)&v287.c = v49;
  *(_OWORD *)&v287.tx = v295;
  v227 = v49;
  v229 = v293;
  *(_OWORD *)&v286.a = v293;
  *(_OWORD *)&v286.c = v49;
  v225 = v295;
  *(_OWORD *)&v286.tx = v295;
  objc_msgSend(v24, "traitCollection");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "displayScale");
  v52 = v51;

  if (a11)
  {
    if (v48)
    {
      objc_msgSend(v48, "frame");
      v54 = v53;
      v56 = v55;
      v58 = v57;
      v60 = v59;
      objc_msgSend(v31, "frame");
      v63 = DOCAdaptSizeToRect(0, v54, v56, v58, v60, v61, v62, v52);
      v65 = v64;
      v67 = v66;
      objc_msgSend(v48, "frame", v63);
      v219 = v68;
      v212 = v69;
      objc_msgSend(v31, "frame");
      v71 = v70;
      v73 = v72;
      v75 = v74;
      v224 = v76;
      v218 = 0.0;
      if (a12)
        v77 = 0.0;
      else
        v77 = 1.0;
      v216 = 1.0;
      v217 = v77;
      objc_msgSend(v31, "center");
      v79 = v78;
      objc_msgSend(v48, "center");
      v81 = v79 - v80;
      objc_msgSend(v31, "center");
      v83 = v82;
      objc_msgSend(v48, "center");
      *(_OWORD *)&v285.a = v293;
      *(_OWORD *)&v285.c = v227;
      *(_OWORD *)&v285.tx = v295;
      CGAffineTransformTranslate(&v286, &v285, v81, v83 - v84);
      v284 = v286;
      v85 = v67;
      CGAffineTransformScale(&v285, &v284, v75 / v65, v75 / v65);
      v286 = v285;
      objc_msgSend(v48, "frame");
      v211 = v65;
      v87 = v86 - v65;
      v88 = v73;
      v89 = v71;
      v90 = v87 * 0.5;
      objc_msgSend(v48, "frame");
      v284 = v286;
      CGAffineTransformTranslate(&v285, &v284, v90, (v91 - v67) * 0.5);
      v286 = v285;
    }
    else
    {
      objc_msgSend(v25, "frame");
      v125 = v124;
      v127 = v126;
      v129 = v128;
      v131 = v130;
      objc_msgSend(v31, "frame");
      v134 = DOCAdaptSizeToRect(0, v125, v127, v129, v131, v132, v133, v52);
      v136 = v135;
      v138 = v137;
      objc_msgSend(v25, "frame", v134);
      v219 = v139;
      v212 = v140;
      objc_msgSend(v31, "frame");
      v142 = v141;
      v144 = v143;
      v75 = v145;
      v224 = v146;
      v218 = 0.0;
      if (a12)
        v147 = 0.0;
      else
        v147 = 1.0;
      v216 = 1.0;
      v217 = v147;
      objc_msgSend(v31, "center");
      v149 = v148;
      objc_msgSend(v26, "center");
      v151 = v149 - v150;
      objc_msgSend(v31, "center");
      v153 = v152;
      objc_msgSend(v26, "center");
      *(_OWORD *)&v285.a = v293;
      *(_OWORD *)&v285.c = v227;
      *(_OWORD *)&v285.tx = v295;
      v155 = v151;
      v85 = v138;
      CGAffineTransformTranslate(&v292, &v285, v155, v153 - v154);
      v284 = v292;
      CGAffineTransformScale(&v285, &v284, v75 / v136, v75 / v136);
      v292 = v285;
      objc_msgSend(v26, "frame");
      v211 = v136;
      v157 = v156 - v136;
      v88 = v144;
      v89 = v142;
      v158 = v157 * 0.5;
      objc_msgSend(v26, "frame");
      v284 = v292;
      CGAffineTransformTranslate(&v285, &v284, v158, (v159 - v138) * 0.5);
      v292 = v285;
    }
    v215 = 0.0;
  }
  else
  {
    objc_msgSend(v31, "frame");
    v219 = v92;
    v212 = v93;
    v213 = v94;
    v96 = v95;
    v211 = v95;
    if (v48)
    {
      objc_msgSend(v48, "frame");
      v98 = v97;
      v100 = v99;
      v102 = v101;
      v104 = v103;
      objc_msgSend(v31, "frame");
      v107 = DOCAdaptSizeToRect(0, v98, v100, v102, v104, v105, v106, v52);
      v75 = v108;
      v110 = v109;
      objc_msgSend(v48, "frame", v107);
      v89 = v111;
      v88 = v112;
      v217 = 0.0;
      v215 = 1.0;
      if (a12)
        v113 = 0.0;
      else
        v113 = 1.0;
      v218 = v113;
      objc_msgSend(v31, "center");
      v115 = v114;
      objc_msgSend(v48, "center");
      v117 = v115 - v116;
      objc_msgSend(v31, "center");
      v119 = v118;
      objc_msgSend(v48, "center");
      *(_OWORD *)&v285.a = v293;
      *(_OWORD *)&v285.c = v227;
      *(_OWORD *)&v285.tx = v295;
      CGAffineTransformTranslate(&v287, &v285, v117, v119 - v120);
      v284 = v287;
      CGAffineTransformScale(&v285, &v284, v96 / v75, v96 / v75);
      v287 = v285;
      objc_msgSend(v48, "frame");
      v122 = (v121 - v75) * 0.5;
      objc_msgSend(v48, "frame");
      v224 = v110;
      v284 = v287;
      CGAffineTransformTranslate(&v285, &v284, v122, (v123 - v110) * 0.5);
      v287 = v285;
    }
    else
    {
      objc_msgSend(v26, "frame");
      v161 = v160;
      v163 = v162;
      v165 = v164;
      v167 = v166;
      objc_msgSend(v31, "frame");
      v170 = DOCAdaptSizeToRect(0, v161, v163, v165, v167, v168, v169, v52);
      v75 = v171;
      v173 = v172;
      objc_msgSend(v26, "frame", v170);
      v89 = v174;
      v88 = v175;
      v217 = 0.0;
      v215 = 1.0;
      if (a12)
        v176 = 0.0;
      else
        v176 = 1.0;
      v218 = v176;
      objc_msgSend(v31, "center");
      v178 = v177;
      objc_msgSend(v26, "center");
      v180 = v178 - v179;
      objc_msgSend(v31, "center");
      v182 = v181;
      objc_msgSend(v26, "center");
      *(_OWORD *)&v285.a = v293;
      *(_OWORD *)&v285.c = v227;
      *(_OWORD *)&v285.tx = v295;
      CGAffineTransformTranslate(&v291, &v285, v180, v182 - v183);
      v284 = v291;
      CGAffineTransformScale(&v285, &v284, v96 / v75, v96 / v75);
      v291 = v285;
      objc_msgSend(v26, "frame");
      v185 = (v184 - v75) * 0.5;
      objc_msgSend(v26, "frame");
      v224 = v173;
      v284 = v291;
      CGAffineTransformTranslate(&v285, &v284, v185, (v186 - v173) * 0.5);
      v291 = v285;
    }
    v216 = 0.0;
    v85 = v213;
  }
  v223 = v28;
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  if (IsReduceMotionEnabled)
  {
    v288 = v229;
    v289 = v227;
    v290 = v225;
    *(_OWORD *)&v291.a = v229;
    *(_OWORD *)&v291.c = v227;
    *(_OWORD *)&v291.tx = v225;
    *(_OWORD *)&v292.a = v229;
    *(_OWORD *)&v292.c = v227;
    *(_OWORD *)&v292.tx = v225;
    v293 = v229;
    v294 = v227;
    v295 = v225;
    v187 = v219;
    if (a11)
    {
      v286 = v287;
      v85 = v224;
      v188 = v75;
      v189 = v88;
      v187 = v89;
    }
    else
    {
      v287 = v286;
      v224 = v85;
      v75 = v211;
      v88 = v212;
      v188 = v211;
      v189 = v212;
      v89 = v219;
    }
  }
  else
  {
    v187 = v219;
    v189 = v88;
    v188 = v75;
    v75 = v211;
    v88 = v212;
  }
  v190 = MEMORY[0x24BDAC760];
  v264[0] = MEMORY[0x24BDAC760];
  v264[1] = 3221225472;
  v264[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke;
  v264[3] = &unk_24C0F1620;
  v283 = a11;
  v191 = v31;
  v265 = v191;
  v230 = v24;
  v266 = v230;
  v270 = v187;
  v271 = v88;
  v272 = v75;
  v273 = v85;
  v192 = v25;
  v267 = v192;
  v274 = 0x3FF0000000000000;
  v193 = v26;
  v268 = v193;
  v275 = v217;
  v276 = v215;
  v194 = v48;
  v278 = v293;
  v279 = v294;
  v280 = v295;
  v281 = v291;
  v282 = v287;
  v269 = v194;
  v277 = v216;
  v195 = (void (**)(_QWORD))MEMORY[0x20BD0CEF0](v264);
  v246[0] = v190;
  v246[1] = 3221225472;
  v246[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_2;
  v246[3] = &unk_24C0F1648;
  v196 = v191;
  v247 = v196;
  v251 = v89;
  v252 = v189;
  v253 = v188;
  v254 = v224;
  v197 = v194;
  v248 = v197;
  v255 = v215;
  v198 = v192;
  v249 = v198;
  v256 = v218;
  v199 = v193;
  v250 = v199;
  v257 = 0x3FF0000000000000;
  v258 = v216;
  v259 = v286;
  v260 = v292;
  v262 = v289;
  v263 = v290;
  v261 = v288;
  v200 = (void *)MEMORY[0x20BD0CEF0](v246);
  v239[0] = v190;
  v239[1] = 3221225472;
  v239[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_3;
  v239[3] = &unk_24C0F1670;
  v228 = v198;
  v240 = v228;
  v201 = v196;
  v241 = v201;
  v202 = v197;
  v242 = v202;
  v226 = v199;
  v243 = v226;
  v203 = v221;
  v244 = v203;
  v204 = v220;
  v245 = v204;
  v205 = (void *)MEMORY[0x20BD0CEF0](v239);
  v195[2](v195);
  v206 = (void *)MEMORY[0x24BEBDB00];
  if (IsReduceMotionEnabled)
  {
    v233[0] = v190;
    v233[1] = 3221225472;
    v233[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_6;
    v233[3] = &unk_24C0F06E8;
    v207 = &v234;
    v234 = v200;
    v231[0] = v190;
    v231[1] = 3221225472;
    v231[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_7;
    v231[3] = &unk_24C0F1698;
    v208 = &v232;
    v232 = v205;
    v209 = v205;
    objc_msgSend(v206, "animateWithDuration:animations:completion:", v233, v231, v222);
  }
  else
  {
    v237[0] = v190;
    v237[1] = 3221225472;
    v237[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_4;
    v237[3] = &unk_24C0F06E8;
    v207 = &v238;
    v238 = v200;
    v235[0] = v190;
    v235[1] = 3221225472;
    v235[2] = __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_5;
    v235[3] = &unk_24C0F1698;
    v208 = &v236;
    v236 = v205;
    v210 = v205;
    objc_msgSend(v206, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v237, v235, v222, 0.0, 3.0, 1000.0, 500.0, 0.0);
  }

}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[3];
  _OWORD v7[3];
  _OWORD v8[3];

  if (*(_BYTE *)(a1 + 280))
  {
    objc_msgSend(*(id *)(a1 + 40), "center");
    objc_msgSend(*(id *)(a1 + 32), "setCenter:");
  }
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 56), "setAlpha:", *(double *)(a1 + 112));
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 120));
  objc_msgSend(*(id *)(a1 + 64), "setAlpha:", *(double *)(a1 + 128));
  v2 = *(_OWORD *)(a1 + 152);
  v8[0] = *(_OWORD *)(a1 + 136);
  v8[1] = v2;
  v8[2] = *(_OWORD *)(a1 + 168);
  objc_msgSend(*(id *)(a1 + 48), "setTransform:", v8);
  v3 = *(_OWORD *)(a1 + 200);
  v7[0] = *(_OWORD *)(a1 + 184);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 216);
  objc_msgSend(*(id *)(a1 + 56), "setTransform:", v7);
  v4 = *(_OWORD *)(a1 + 248);
  v6[0] = *(_OWORD *)(a1 + 232);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 264);
  return objc_msgSend(*(id *)(a1 + 64), "setTransform:", v6);
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[3];
  _OWORD v7[3];
  _OWORD v8[3];

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 56), "setAlpha:", *(double *)(a1 + 112));
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 120));
  v2 = *(_OWORD *)(a1 + 144);
  v8[0] = *(_OWORD *)(a1 + 128);
  v8[1] = v2;
  v8[2] = *(_OWORD *)(a1 + 160);
  objc_msgSend(*(id *)(a1 + 40), "setTransform:", v8);
  v3 = *(_OWORD *)(a1 + 192);
  v7[0] = *(_OWORD *)(a1 + 176);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 208);
  objc_msgSend(*(id *)(a1 + 48), "setTransform:", v7);
  v4 = *(_OWORD *)(a1 + 240);
  v6[0] = *(_OWORD *)(a1 + 224);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 256);
  return objc_msgSend(*(id *)(a1 + 56), "setTransform:", v6);
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[3];
  _OWORD v9[2];
  __int128 v10;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  v2 = *(void **)(a1 + 32);
  v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v9[0] = *MEMORY[0x24BDBD8B8];
  v6 = v9[0];
  v9[1] = v7;
  v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v5 = v10;
  objc_msgSend(v2, "setTransform:", v9);
  v3 = *(void **)(a1 + 56);
  v8[0] = v6;
  v8[1] = v7;
  v8[2] = v5;
  objc_msgSend(v3, "setTransform:", v8);
  objc_msgSend(*(id *)(a1 + 64), "setAlpha:", 1.0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __179__DOCTransitionUtils_performZoomTransitionInContainer_withSourceView_destinationView_duration_alterativeView_thumbnail_thumbnailStyle_location_presenting_fadingSource_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
