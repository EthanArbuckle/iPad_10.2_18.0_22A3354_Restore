@implementation CHReflowableTextLine

- (CHReflowableTextLine)initWithTokens:(id)a3 principalLines:(id *)a4 bounds:(CGRect)a5 headIndent:(double)a6 leading:(double)a7 hasStartingLineBreak:(BOOL)a8 hasEndingLineBreak:(BOOL)a9 alignmentType:(unint64_t)a10 writingDirection:(int64_t)a11 locale:(id)a12
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CHReflowableTextLine *v31;
  uint64_t v32;
  NSArray *tokens;
  CGPoint var0;
  CGPoint var1;
  CGPoint v36;
  CGPoint v37;
  CGPoint v38;
  CGPoint v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSLocale *locale;
  objc_super v48;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v24 = a3;
  v25 = a12;
  v48.receiver = self;
  v48.super_class = (Class)CHReflowableTextLine;
  v31 = -[CHReflowableTextLine init](&v48, sel_init);
  if (v31)
  {
    v32 = objc_msgSend_copy(v24, v26, v27, v28, v29, v30);
    tokens = v31->_tokens;
    v31->_tokens = (NSArray *)v32;

    var0 = a4->var0.var0;
    var1 = a4->var0.var1;
    v36 = a4->var1.var1;
    v31->_principalLines.base.start = a4->var1.var0;
    v31->_principalLines.base.end = v36;
    v31->_principalLines.descender.start = var0;
    v31->_principalLines.descender.end = var1;
    v37 = a4->var2.var0;
    v38 = a4->var2.var1;
    v39 = a4->var3.var1;
    v31->_principalLines.top.start = a4->var3.var0;
    v31->_principalLines.top.end = v39;
    v31->_principalLines.median.start = v37;
    v31->_principalLines.median.end = v38;
    v31->_bounds.origin.x = x;
    v31->_bounds.origin.y = y;
    v31->_bounds.size.width = width;
    v31->_bounds.size.height = height;
    v31->_headIndent = a6;
    v31->_leading = a7;
    v31->_hasStartingLineBreak = a8;
    v31->_hasEndingLineBreak = a9;
    v31->_alignmentType = a10;
    v31->_writingDirection = a11;
    v45 = objc_msgSend_copy(v25, v40, v41, v42, v43, v44);
    locale = v31->_locale;
    v31->_locale = (NSLocale *)v45;

  }
  return v31;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
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
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend_tokens(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v67, (uint64_t)v71, 16, v15);
  if (v21)
  {
    v22 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v68 != v22)
          objc_enumerationMutation(v13);
        v24 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend_strokeIdentifiers(v24, v16, v17, v18, v19, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
        objc_msgSend_nonTextStrokeIdentifiers(v24, v32, v33, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend_count(v37, v38, v39, v40, v41, v42);
        objc_msgSend_appendFormat_(v7, v44, (uint64_t)CFSTR("(T: %lu, NT%lu), "), v45, v46, v47, v31, v43);

      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v67, (uint64_t)v71, 16, v20);
    }
    while (v21);
  }

  v48 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_tokens(self, v49, v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_count(v54, v55, v56, v57, v58, v59);
  objc_msgSend_stringWithFormat_(v48, v61, (uint64_t)CFSTR("ReflowableLine %lu tokens, stroke counts per token = %@"), v62, v63, v64, v60, v7);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v65;
}

+ (BOOL)supportsReflowForLocale:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  objc_msgSend_languageCode(a3, a2, (uint64_t)a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v17 = objc_msgSend_containsObject_(&unk_1E7827C20, v13, (uint64_t)v12, v14, v15, v16);

    return v17;
  }
  else
  {

    return 0;
  }
}

+ (BOOL)useRightToLeftReflow:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  objc_msgSend_languageCode(a3, a2, (uint64_t)a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v17 = objc_msgSend_containsObject_(&unk_1E7827C38, v13, (uint64_t)v12, v14, v15, v16);

    return v17;
  }
  else
  {

    return 0;
  }
}

- (id)_string
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend_tokens(self, a2, v2, v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v32, (uint64_t)v36, 16, v8);
  if (v14)
  {
    v15 = *(_QWORD *)v33;
    v16 = &stru_1E77F6F28;
    do
    {
      v17 = 0;
      v18 = v16;
      do
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v6);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v17);
        if (objc_msgSend_hasPrecedingSpace(v19, v9, v10, v11, v12, v13))
        {
          objc_msgSend_stringByAppendingString_(v18, v20, (uint64_t)CFSTR(" "), v22, v23, v24);
          v25 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v25;
        }
        objc_msgSend_string(v19, v20, v21, v22, v23, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v18, v27, (uint64_t)v26, v28, v29, v30);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v17;
        v18 = v16;
      }
      while (v14 != v17);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v32, (uint64_t)v36, 16, v13);
    }
    while (v14);
  }
  else
  {
    v16 = &stru_1E77F6F28;
  }

  return v16;
}

- (CRNormalizedQuad)boundingQuad
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;

  objc_msgSend_principalLines(self, a2, v2, v3, v4, v5);
  objc_msgSend_bounds(self, v7, v8, v9, v10, v11);
  if (v14 == 0.0)
    v14 = 1.0;
  if (v15 == 0.0)
    v15 = 1.0;
  v16 = v12 + v31 * v14;
  v17 = v13 + v32 * v15;
  v18 = v12 + v33 * v14;
  v19 = v13 + v34 * v15;
  v20 = v12 + v35 * v14;
  v21 = v13 + v36 * v15;
  v22 = v12 + v37 * v14;
  v23 = v13 + v38 * v15;
  v24 = objc_alloc(MEMORY[0x1E0DBECD8]);
  return (CRNormalizedQuad *)(id)objc_msgSend_initWithNormalizedTopLeft_topRight_bottomRight_bottomLeft_size_(v24, v25, v26, v27, v28, v29, v20, v21, v22, v23, v18, v19, v16, v17, 0x3FF0000000000000, 0x3FF0000000000000);
}

- (unint64_t)layoutDirection
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = objc_msgSend_writingDirection(self, a2, v2, v3, v4, v5);
  if ((unint64_t)(v6 - 1) > 2)
    return 0;
  else
    return qword_1BE8D51D8[v6 - 1];
}

+ (id)reflowableLines:(id)a3 withLineWrapper:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double x;
  double y;
  double width;
  double height;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  double v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  double v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  double v121;
  id v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  CHLineWrappableLine *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char v155;
  CHLineWrappableGroup *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  NSObject *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  uint64_t m;
  void *v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  unint64_t v210;
  void *v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  BOOL v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  NSObject *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  NSObject *v232;
  _BOOL4 v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  BOOL v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  unint64_t v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  BOOL v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  NSObject *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  void *v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  void *v349;
  uint64_t v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  unint64_t v360;
  char v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  unint64_t v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  void *v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  char hasStartingLineBreak;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  int hasEndingLineBreak;
  CHReflowableTextLine *v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  const char *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  void *v404;
  double v405;
  double v406;
  double v407;
  double v408;
  double v409;
  double v410;
  double v411;
  double v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  double v418;
  double v419;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  double v425;
  double v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  void *v444;
  char v445;
  unsigned int v446;
  const char *v447;
  void *hasEndingLineBreak_alignmentType_writingDirection_locale;
  const char *v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  const char *v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  int v458;
  const char *v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  int v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  const char *v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  const char *v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  void *v482;
  const char *v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  const char *v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  void *v495;
  const char *v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  const char *v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  void *v508;
  const char *v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  NSObject *v515;
  CHCTLD *v517;
  id v518;
  void *v519;
  void *v520;
  void *v521;
  id v522;
  id v523;
  unint64_t v524;
  uint64_t v525;
  void *v526;
  id v527;
  id v528;
  id obj;
  id v530;
  NSObject *v531;
  double v532;
  unint64_t v533;
  void *v534;
  id v535;
  id v536;
  id v537;
  char *v538;
  double v539;
  uint64_t v540;
  void *v541;
  int v542;
  double v543;
  uint64_t v544;
  void *v545;
  unint64_t v546;
  unint64_t v547;
  _OWORD v548[8];
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  __int128 v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  uint8_t buf[4];
  unint64_t v574;
  __int16 v575;
  unint64_t v576;
  __int16 v577;
  _BYTE v578[10];
  void *v579;
  _BYTE v580[10];
  __int16 v581;
  uint64_t v582;
  __int16 v583;
  uint64_t v584;
  __int16 v585;
  uint64_t v586;
  __int16 v587;
  uint64_t v588;
  _BYTE v589[128];
  _BYTE v590[128];
  _BYTE v591[128];
  _BYTE v592[128];
  _BYTE v593[128];
  _BYTE v594[128];
  uint64_t v595;
  CGRect v596;
  CGRect v597;
  CGRect v598;

  v595 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v518 = a4;
  v520 = v5;
  if ((unint64_t)objc_msgSend_count(v5, v6, v7, v8, v9, v10) > 1)
  {
    v517 = objc_alloc_init(CHCTLD);
    objc_msgSend_reflowableLineRegions_(v517, v11, (uint64_t)v5, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v569 = 0u;
    v570 = 0u;
    v571 = 0u;
    v572 = 0u;
    obj = v15;
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v569, (uint64_t)v594, 16, v21);
    if (v22)
    {
      v23 = *(_QWORD *)v570;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v570 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v569 + 1) + 8 * i);
          v565 = 0u;
          v566 = 0u;
          v567 = 0u;
          v568 = 0u;
          v26 = v25;
          v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v565, (uint64_t)v593, 16, v28);
          if (v34)
          {
            v35 = *(_QWORD *)v566;
            do
            {
              for (j = 0; j != v34; ++j)
              {
                if (*(_QWORD *)v566 != v35)
                  objc_enumerationMutation(v26);
                objc_msgSend_bounds(*(void **)(*((_QWORD *)&v565 + 1) + 8 * j), v29, v30, v31, v32, v33);
                v598.origin.x = v37;
                v598.origin.y = v38;
                v598.size.width = v39;
                v598.size.height = v40;
                v596.origin.x = x;
                v596.origin.y = y;
                v596.size.width = width;
                v596.size.height = height;
                v597 = CGRectUnion(v596, v598);
                x = v597.origin.x;
                y = v597.origin.y;
                width = v597.size.width;
                height = v597.size.height;
              }
              v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v565, (uint64_t)v593, 16, v33);
            }
            while (v34);
          }

        }
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v569, (uint64_t)v594, 16, v42);
      }
      while (v22);
    }

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v43, v44, v45, v46, v47);
    v521 = (void *)objc_claimAutoreleasedReturnValue();
    v563 = 0u;
    v564 = 0u;
    v561 = 0u;
    v562 = 0u;
    v522 = obj;
    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v522, v48, (uint64_t)&v561, (uint64_t)v592, 16, v49);
    if (v55)
    {
      v525 = *(_QWORD *)v562;
      while (2)
      {
        v528 = 0;
        v523 = (id)v55;
        do
        {
          if (*(_QWORD *)v562 != v525)
            objc_enumerationMutation(v522);
          v56 = *(void **)(*((_QWORD *)&v561 + 1) + 8 * (_QWORD)v528);
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v50, v51, v52, v53, v54);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v559 = 0u;
          v560 = 0u;
          v557 = 0u;
          v558 = 0u;
          v530 = v56;
          v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v530, v58, (uint64_t)&v557, (uint64_t)v591, 16, v59);
          if (v65)
          {
            v66 = *(_QWORD *)v558;
            while (2)
            {
              for (k = 0; k != v65; ++k)
              {
                if (*(_QWORD *)v558 != v66)
                  objc_enumerationMutation(v530);
                v68 = *(void **)(*((_QWORD *)&v557 + 1) + 8 * k);
                objc_msgSend_boundingQuad(v68, v60, v61, v62, v63, v64);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_topLeft(v69, v70, v71, v72, v73, v74);
                v543 = v75;
                objc_msgSend_topLeft(v69, v76, v77, v78, v79, v80);
                v539 = v81;
                objc_msgSend_topRight(v69, v82, v83, v84, v85, v86);
                v535 = v87;
                objc_msgSend_topRight(v69, v88, v89, v90, v91, v92);
                v532 = v93;
                objc_msgSend_bottomRight(v69, v94, v95, v96, v97, v98);
                v100 = v99;
                objc_msgSend_bottomRight(v69, v101, v102, v103, v104, v105);
                v107 = v106;
                objc_msgSend_bottomLeft(v69, v108, v109, v110, v111, v112);
                v114 = v113;
                objc_msgSend_bottomLeft(v69, v115, v116, v117, v118, v119);
                v121 = v120;
                v122 = objc_alloc(MEMORY[0x1E0DBECD8]);
                v128 = (void *)objc_msgSend_initWithNormalizedTopLeft_topRight_bottomRight_bottomLeft_size_(v122, v123, v124, v125, v126, v127, (v543 - x) / width, (v539 - y) / height, (*(double *)&v535 - x) / width, (v532 - y) / height, (v100 - x) / width, (v107 - y) / height, (v114 - x) / width, (v121 - y) / height, *(_QWORD *)&width, *(_QWORD *)&height);
                objc_msgSend_locale(v68, v129, v130, v131, v132, v133);
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                v135 = (void *)objc_opt_class();
                objc_msgSend__normalizedLocaleForCRLineWrapper_(v135, v136, (uint64_t)v134, v137, v138, v139);
                v140 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v140)
                {

                  v155 = 0;
                  goto LABEL_32;
                }
                v141 = [CHLineWrappableLine alloc];
                objc_msgSend__string(v68, v142, v143, v144, v145, v146);
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                v150 = (void *)objc_msgSend_initWithQuad_text_locale_(v141, v148, (uint64_t)v128, (uint64_t)v147, (uint64_t)v140, v149);

                objc_msgSend_addObject_(v57, v151, (uint64_t)v150, v152, v153, v154);
              }
              v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v530, v60, (uint64_t)&v557, (uint64_t)v591, 16, v64);
              if (v65)
                continue;
              break;
            }
          }
          v155 = 1;
LABEL_32:

          v156 = [CHLineWrappableGroup alloc];
          v161 = (void *)objc_msgSend_initWithLines_(v156, v157, (uint64_t)v57, v158, v159, v160);
          objc_msgSend_addObject_(v521, v162, (uint64_t)v161, v163, v164, v165);

          if ((v155 & 1) == 0)
          {

            v527 = v520;
            goto LABEL_93;
          }
          v528 = (char *)v528 + 1;
        }
        while (v528 != v523);
        v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v522, v50, (uint64_t)&v561, (uint64_t)v592, 16, v54);
        if (v55)
          continue;
        break;
      }
    }

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v166 = (id)qword_1EF568E70;
    if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
    {
      v172 = objc_msgSend_count(v520, v167, v168, v169, v170, v171);
      v178 = objc_msgSend_count(v522, v173, v174, v175, v176, v177);
      *(_DWORD *)buf = 134218240;
      v574 = v172;
      v575 = 2048;
      v576 = v178;
      _os_log_impl(&dword_1BE607000, v166, OS_LOG_TYPE_DEBUG, "Running line wrapper for %lu lines in %lu groups.", buf, 0x16u);
    }

    objc_msgSend_lineWrappingResultForGroups_options_error_(v518, v179, (uint64_t)v521, 0, 0, v180);
    v519 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = (void *)objc_opt_new();
    v555 = 0u;
    v556 = 0u;
    v553 = 0u;
    v554 = 0u;
    objc_msgSend_lineWrappableGroups(v519, v182, v183, v184, v185, v186);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v536 = v187;
    v190 = objc_msgSend_countByEnumeratingWithState_objects_count_(v187, v188, (uint64_t)&v553, (uint64_t)v590, 16, v189);
    v196 = 0;
    if (v190)
    {
      v540 = *(_QWORD *)v554;
      do
      {
        v544 = v190;
        for (m = 0; m != v544; ++m)
        {
          if (*(_QWORD *)v554 != v540)
            objc_enumerationMutation(v536);
          v198 = *(void **)(*((_QWORD *)&v553 + 1) + 8 * m);
          v549 = 0u;
          v550 = 0u;
          v551 = 0u;
          v552 = 0u;
          objc_msgSend_subregions(v198, v191, v192, v193, v194, v195);
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          v207 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v200, (uint64_t)&v549, (uint64_t)v589, 16, v201);
          if (v207)
          {
            v208 = *(_QWORD *)v550;
            do
            {
              v209 = 0;
              v210 = v196;
              do
              {
                if (*(_QWORD *)v550 != v208)
                  objc_enumerationMutation(v199);
                v211 = *(void **)(*((_QWORD *)&v549 + 1) + 8 * v209);
                if (objc_msgSend_lineWrappingType(v211, v202, v203, v204, v205, v206) != 1)
                {
                  objc_msgSend_subregions(v198, v202, v203, v204, v205, v206);
                  v212 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_lastObject(v212, v213, v214, v215, v216, v217);
                  v218 = (void *)objc_claimAutoreleasedReturnValue();
                  v219 = v211 == v218;

                  if (!v219)
                    objc_msgSend_addIndex_(v181, v202, v210 + v209, v204, v205, v206);
                }
                ++v209;
              }
              while (v207 != v209);
              v207 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v202, (uint64_t)&v549, (uint64_t)v589, 16, v206);
              v196 = v210 + v209;
            }
            while (v207);
            v196 = v210 + v209;
          }

        }
        v187 = v536;
        v190 = objc_msgSend_countByEnumeratingWithState_objects_count_(v536, v191, (uint64_t)&v553, (uint64_t)v590, 16, v195);
      }
      while (v190);
    }

    if (v196 != objc_msgSend_count(v520, v220, v221, v222, v223, v224))
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v225 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v225, OS_LOG_TYPE_FAULT))
      {
        v231 = objc_msgSend_count(v520, v226, v227, v228, v229, v230);
        *(_DWORD *)buf = 134218240;
        v574 = v196;
        v575 = 2048;
        v576 = v231;
        _os_log_impl(&dword_1BE607000, v225, OS_LOG_TYPE_FAULT, "Number of wrapping result lines should match that of reflowable lines: %lu != %lu", buf, 0x16u);
      }

    }
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v232 = (id)qword_1EF568E70;
    v233 = os_log_type_enabled(v232, OS_LOG_TYPE_DEBUG);

    if (v233)
    {
      v533 = 0;
      while (1)
      {
        objc_msgSend_lineWrappableGroups(v519, v234, v235, v236, v237, v238);
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        v245 = v533 < objc_msgSend_count(v239, v240, v241, v242, v243, v244);

        if (!v245)
          break;
        objc_msgSend_lineWrappableGroups(v519, v234, v235, v236, v237, v238);
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v246, v247, v533, v248, v249, v250);
        v545 = (void *)objc_claimAutoreleasedReturnValue();

        v256 = 0;
        ++v533;
        while (1)
        {
          objc_msgSend_subregions(v545, v251, v252, v253, v254, v255);
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          v263 = v256 < objc_msgSend_count(v257, v258, v259, v260, v261, v262);

          if (!v263)
            break;
          objc_msgSend_subregions(v545, v264, v265, v266, v267, v268);
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v269, v270, v256, v271, v272, v273);
          v274 = (void *)objc_claimAutoreleasedReturnValue();

          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v275 = (id)qword_1EF568E70;
          if (os_log_type_enabled(v275, OS_LOG_TYPE_DEBUG))
          {
            v281 = objc_msgSend_lineWrappingType(v274, v276, v277, v278, v279, v280);
            objc_msgSend_text(v274, v282, v283, v284, v285, v286);
            v541 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_locale(v274, v287, v288, v289, v290, v291);
            v537 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_localeIdentifier(v537, v292, v293, v294, v295, v296);
            v297 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_boundingQuad(v274, v298, v299, v300, v301, v302);
            v303 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_topLeft(v303, v304, v305, v306, v307, v308);
            v310 = v309;
            objc_msgSend_boundingQuad(v274, v311, v312, v313, v314, v315);
            v316 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_topLeft(v316, v317, v318, v319, v320, v321);
            v323 = v322;
            objc_msgSend_boundingQuad(v274, v324, v325, v326, v327, v328);
            v329 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_size(v329, v330, v331, v332, v333, v334);
            v336 = v335;
            objc_msgSend_boundingQuad(v274, v337, v338, v339, v340, v341);
            v342 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_size(v342, v343, v344, v345, v346, v347);
            ++v256;
            *(_DWORD *)buf = 134220035;
            v574 = v533;
            v575 = 2048;
            v576 = v256;
            v577 = 2048;
            *(_QWORD *)v578 = v281;
            *(_WORD *)&v578[8] = 2117;
            v579 = v541;
            *(_WORD *)v580 = 2112;
            *(_QWORD *)&v580[2] = v297;
            v581 = 2048;
            v582 = v310;
            v583 = 2048;
            v584 = v323;
            v585 = 2048;
            v586 = v336;
            v587 = 2048;
            v588 = v348;
            _os_log_impl(&dword_1BE607000, v275, OS_LOG_TYPE_DEBUG, "Line Wrapping Line:%lu-%lu result:%lu text:'%{sensitive}@' (%@) (x:%lf y:%lf w:%lf h:%lf)", buf, 0x5Cu);

          }
          else
          {
            ++v256;
          }

        }
      }
    }
    v349 = (void *)MEMORY[0x1E0C99DE8];
    v350 = objc_msgSend_count(v520, v234, v235, v236, v237, v238);
    objc_msgSend_arrayWithCapacity_(v349, v351, v350, v352, v353, v354);
    v527 = (id)objc_claimAutoreleasedReturnValue();
    v538 = 0;
    v360 = 0;
    v361 = 1;
    while (v360 < objc_msgSend_count(v522, v355, v356, v357, v358, v359))
    {
      objc_msgSend_objectAtIndexedSubscript_(v522, v362, v360, v363, v364, v365);
      v534 = (void *)objc_claimAutoreleasedReturnValue();
      v371 = 0;
      v524 = v360 + 1;
      while (v371 < objc_msgSend_count(v534, v366, v367, v368, v369, v370))
      {
        v546 = v371;
        objc_msgSend_objectAtIndexedSubscript_(v534, v372, v371, v373, v374, v375);
        v376 = (void *)objc_claimAutoreleasedReturnValue();
        v542 = objc_msgSend_containsIndex_(v181, v377, (uint64_t)v538, v378, v379, v380);
        hasStartingLineBreak = objc_msgSend_hasStartingLineBreak(v376, v381, v382, v383, v384, v385);
        hasEndingLineBreak = objc_msgSend_hasEndingLineBreak(v376, v387, v388, v389, v390, v391);
        v393 = [CHReflowableTextLine alloc];
        objc_msgSend_tokens(v376, v394, v395, v396, v397, v398);
        v404 = (void *)objc_claimAutoreleasedReturnValue();
        if (v376)
          objc_msgSend_principalLines(v376, v399, v400, v401, v402, v403);
        else
          memset(v548, 0, sizeof(v548));
        objc_msgSend_bounds(v376, v399, v400, v401, v402, v403);
        v406 = v405;
        v408 = v407;
        v410 = v409;
        v412 = v411;
        objc_msgSend_headIndent(v376, v413, v414, v415, v416, v417);
        v419 = v418;
        objc_msgSend_leading(v376, v420, v421, v422, v423, v424);
        v426 = v425;
        v432 = objc_msgSend_alignmentType(v376, v427, v428, v429, v430, v431);
        v438 = objc_msgSend_writingDirection(v376, v433, v434, v435, v436, v437);
        objc_msgSend_locale(v376, v439, v440, v441, v442, v443);
        v444 = (void *)objc_claimAutoreleasedReturnValue();
        v445 = hasStartingLineBreak | v361 ^ 1;
        v446 = hasEndingLineBreak | v542 ^ 1;
        hasEndingLineBreak_alignmentType_writingDirection_locale = (void *)objc_msgSend_initWithTokens_principalLines_bounds_headIndent_leading_hasStartingLineBreak_hasEndingLineBreak_alignmentType_writingDirection_locale_(v393, v447, (uint64_t)v404, (uint64_t)v548, v445 & 1, v446, v432, v438, v406, v408, v410, v412, v419, v426, v444);

        objc_msgSend_addObject_(v527, v449, (uint64_t)hasEndingLineBreak_alignmentType_writingDirection_locale, v450, v451, v452);
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v531 = (id)qword_1EF568E70;
        if (os_log_type_enabled(v531, OS_LOG_TYPE_DEBUG))
        {
          v458 = objc_msgSend_hasStartingLineBreak(v376, v453, v454, v455, v456, v457);
          v464 = objc_msgSend_hasEndingLineBreak(v376, v459, v460, v461, v462, v463);
          objc_msgSend_boundingQuad(v376, v465, v466, v467, v468, v469);
          v526 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_topLeft(v526, v470, v471, v472, v473, v474);
          v476 = v475;
          objc_msgSend_boundingQuad(v376, v477, v478, v479, v480, v481);
          v482 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_topLeft(v482, v483, v484, v485, v486, v487);
          v489 = v488;
          objc_msgSend_boundingQuad(v376, v490, v491, v492, v493, v494);
          v495 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_size(v495, v496, v497, v498, v499, v500);
          v502 = v501;
          objc_msgSend_boundingQuad(v376, v503, v504, v505, v506, v507);
          v508 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_size(v508, v509, v510, v511, v512, v513);
          *(_DWORD *)buf = 134220544;
          v574 = v524;
          v575 = 2048;
          v547 = v546 + 1;
          v576 = v547;
          v577 = 1024;
          *(_DWORD *)v578 = v542;
          *(_WORD *)&v578[4] = 1024;
          *(_DWORD *)&v578[6] = v458;
          LOWORD(v579) = 1024;
          *(_DWORD *)((char *)&v579 + 2) = v445 & 1;
          HIWORD(v579) = 1024;
          *(_DWORD *)v580 = v464;
          *(_WORD *)&v580[4] = 1024;
          *(_DWORD *)&v580[6] = v446;
          v581 = 2048;
          v582 = v476;
          v583 = 2048;
          v584 = v489;
          v585 = 2048;
          v586 = v502;
          v587 = 2048;
          v588 = v514;
          v515 = v531;
          _os_log_impl(&dword_1BE607000, v531, OS_LOG_TYPE_DEBUG, "Reflow Line:%lu-%lu canWrap:%d startingLineBreak:%d=>%d endingLineBreak:%d=>%d (x:%lf y:%lf w:%lf h:%lf)", buf, 0x5Cu);

        }
        else
        {
          v547 = v546 + 1;
          v515 = v531;
        }

        ++v538;
        v361 = v542;
        v371 = v547;
      }

      v360 = v524;
    }

LABEL_93:
  }
  else
  {
    v527 = v5;
  }

  return v527;
}

+ (id)_normalizedLocaleForCRLineWrapper:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  v8 = a3;
  if (qword_1EF568C08 != -1)
    dispatch_once(&qword_1EF568C08, &unk_1E77F14B0);
  objc_msgSend_languageCode(v8, v3, v4, v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseString(v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_((void *)qword_1EF568C00, v16, (uint64_t)v15, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_objectForKey_((void *)qword_1EF568C00, v21, (uint64_t)v15, v22, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v25, v27, (uint64_t)CFSTR("%@-%@"), v28, v29, v30, v15, v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v32, (uint64_t)v31, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- ($6DEFAE59D8B0B490C28D581BBA01C329)principalLines
{
  CGPoint var1;
  CGPoint v4;
  CGPoint v5;
  CGPoint v6;

  var1 = self[1].var1.var1;
  retstr->var2.var0 = self[1].var1.var0;
  retstr->var2.var1 = var1;
  v4 = self[1].var2.var1;
  retstr->var3.var0 = self[1].var2.var0;
  retstr->var3.var1 = v4;
  v5 = self->var3.var1;
  retstr->var0.var0 = self->var3.var0;
  retstr->var0.var1 = v5;
  v6 = self[1].var0.var1;
  retstr->var1.var0 = self[1].var0.var0;
  retstr->var1.var1 = v6;
  return self;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)headIndent
{
  return self->_headIndent;
}

- (double)leading
{
  return self->_leading;
}

- (BOOL)hasStartingLineBreak
{
  return self->_hasStartingLineBreak;
}

- (void)setHasStartingLineBreak:(BOOL)a3
{
  self->_hasStartingLineBreak = a3;
}

- (BOOL)hasEndingLineBreak
{
  return self->_hasEndingLineBreak;
}

- (void)setHasEndingLineBreak:(BOOL)a3
{
  self->_hasEndingLineBreak = a3;
}

- (unint64_t)alignmentType
{
  return self->_alignmentType;
}

- (int64_t)writingDirection
{
  return self->_writingDirection;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
