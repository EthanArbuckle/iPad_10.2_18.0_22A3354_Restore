@implementation CHMutableTokenizedTextResult

- (id)copyWithZone:(_NSZone *)a3
{
  CHTokenizedTextResult *v4;
  NSArray *tokenColumns;
  NSArray *transcriptionPaths;
  NSArray *transcriptionPathScores;
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
  uint64_t v19;
  int64_t changeableCount;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char isMinimalDrawingResult;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t isMinimalDrawingResult_baseWritingDirection;
  char v36;

  v4 = [CHTokenizedTextResult alloc];
  tokenColumns = self->super._tokenColumns;
  transcriptionPaths = self->super._transcriptionPaths;
  transcriptionPathScores = self->super._transcriptionPathScores;
  objc_msgSend_trailingSeparator(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_recognizerGenerationIdentifier(self, v14, v15, v16, v17, v18);
  changeableCount = self->super._changeableCount;
  isMinimalDrawingResult = objc_msgSend_isMinimalDrawingResult(self, v21, v22, v23, v24, v25);
  v32 = objc_msgSend_baseWritingDirection(self, v27, v28, v29, v30, v31);
  v36 = isMinimalDrawingResult;
  isMinimalDrawingResult_baseWritingDirection = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_isMinimalDrawingResult_baseWritingDirection_(v4, v33, (uint64_t)tokenColumns, (uint64_t)transcriptionPaths, (uint64_t)transcriptionPathScores, (uint64_t)v13, v19, changeableCount, v36, v32);

  *(_QWORD *)(isMinimalDrawingResult_baseWritingDirection + 64) = self->super._precedingLineBreaks;
  objc_storeStrong((id *)(isMinimalDrawingResult_baseWritingDirection + 80), self->super._inputStrokeIdentifiers);
  objc_storeStrong((id *)(isMinimalDrawingResult_baseWritingDirection + 88), self->super._locale);
  return (id)isMinimalDrawingResult_baseWritingDirection;
}

- (void)setTokenColumns:(id)a3
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  NSArray *tokenColumns;
  NSArray *v12;

  v4 = (NSArray *)a3;
  if (self->super._tokenColumns != v4)
  {
    v12 = v4;
    v10 = (NSArray *)objc_msgSend_copy(v4, v5, v6, v7, v8, v9);
    tokenColumns = self->super._tokenColumns;
    self->super._tokenColumns = v10;

    v4 = v12;
  }

}

- (void)setTranscriptionPaths:(id)a3 scores:(id)a4
{
  NSArray *v6;
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  NSObject *v24;
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
  NSArray *v35;
  NSArray *transcriptionPaths;
  NSArray *v37;
  NSArray *transcriptionPathScores;
  int v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = (NSArray *)a3;
  v7 = (NSArray *)a4;
  v13 = objc_msgSend_count(v6, v8, v9, v10, v11, v12);
  if (v13 != objc_msgSend_count(v7, v14, v15, v16, v17, v18))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v24 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      v39 = 134218240;
      v40 = objc_msgSend_count(v6, v25, v26, v27, v28, v29);
      v41 = 2048;
      v42 = objc_msgSend_count(v7, v30, v31, v32, v33, v34);
      _os_log_impl(&dword_1BE607000, v24, OS_LOG_TYPE_FAULT, "transcriptionPaths count (%ld) != scores count (%ld)", (uint8_t *)&v39, 0x16u);
    }

  }
  if (self->super._transcriptionPaths != v6)
  {
    v35 = (NSArray *)objc_msgSend_copy(v6, v19, v20, v21, v22, v23);
    transcriptionPaths = self->super._transcriptionPaths;
    self->super._transcriptionPaths = v35;

  }
  if (self->super._transcriptionPathScores != v7)
  {
    v37 = (NSArray *)objc_msgSend_copy(v7, v19, v20, v21, v22, v23);
    transcriptionPathScores = self->super._transcriptionPathScores;
    self->super._transcriptionPathScores = v37;

  }
}

- (void)appendTokenColumns:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  if (objc_msgSend_count(v21, v4, v5, v6, v7, v8))
  {
    objc_msgSend_arrayByAddingObjectsFromArray_(self->super._tokenColumns, v9, (uint64_t)v21, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTokenColumns_(self, v14, (uint64_t)v13, v15, v16, v17);
    objc_msgSend_setTranscriptionPaths_scores_(self, v18, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v19, v20);

  }
}

- (void)adjustColumns
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t i;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t j;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char **v82;
  char **v83;
  unint64_t v84;
  unint64_t v85;
  char *v86;
  char *v87;
  char **v88;
  __int128 v89;
  char **v90;
  char **v91;
  char *v92;
  char *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t k;
  CHMutableTokenizedResultColumn *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  unint64_t v112;
  unint64_t v113;
  char *v114;
  char *v115;
  char *v116;
  char *v117;
  char *v118;
  __int128 v119;
  char *v120;
  void *v121;
  void *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  BOOL v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  char *v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  char *v206;
  uint64_t *v207;
  uint64_t *v208;
  unint64_t v209;
  char *v210;
  uint64_t v211;
  uint64_t *v212;
  uint64_t v213;
  uint64_t v214;
  unint64_t v215;
  uint64_t v216;
  unint64_t v217;
  char *v218;
  unint64_t v219;
  _BYTE *v220;
  uint64_t *v221;
  int64_t v222;
  unint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t *v226;
  _OWORD *v227;
  uint64_t *v228;
  uint64_t v229;
  __int128 v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  char *v242;
  char *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  char *v248;
  void *v249;
  void *v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
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
  uint64_t v278;
  uint64_t v279;
  char *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  char *v287;
  char *v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  const char *v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t m;
  void *v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  BOOL v311;
  char *v312;
  char *v313;
  id v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  id v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  void *v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  char **v337;
  char **v338;
  char **v339;
  char **v340;
  char *v341;
  char *v342;
  uint64_t v343;
  uint64_t v344;
  void *v345;
  CHMutableTokenizedTextResult *v346;
  uint64_t v347;
  void *v348;
  unint64_t v349;
  char *v350;
  uint64_t v351;
  void *v352;
  void *v353;
  void *v354;
  id v355;
  char *v356;
  void *v357;
  uint64_t *v358;
  char *v359;
  uint64_t v360;
  id v361;
  uint64_t v362;
  char *v363;
  _QWORD v364[4];
  id v365;
  _QWORD v366[4];
  id v367;
  char **v368;
  char **v369;
  unint64_t v370;
  uint8_t buf[8];
  uint64_t v372;

  v372 = *MEMORY[0x1E0C80C00];
  v346 = self;
  v344 = 32;
  v347 = objc_msgSend_count(self->super._tokenColumns, a2, v2, v3, v4, v5);
  v6 = 0x1E0C99000uLL;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14, v15, v16);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  v368 = 0;
  v369 = 0;
  v370 = 0;
  if (!v347)
  {
    v22 = 0;
    goto LABEL_105;
  }
  v22 = 0;
  for (i = 0; i != v347; ++i)
  {
    objc_msgSend_objectAtIndex_(*(void **)((char *)&v346->super.super.super.isa + v344), v17, i, v19, v20, v21);
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_textTokenRows(v348, v24, v25, v26, v27, v28);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v29, v30, v31, v32, v33, v34))
    {
      objc_msgSend_firstObject(v29, v35, v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BE740384((uint64_t)CHTokenizedTextResult, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      for (j = 1;
            j < objc_msgSend_count(v29, v42, v43, v44, v45, v46) && objc_msgSend_count(v41, v48, v49, v50, v51, v52);
            ++j)
      {
        objc_msgSend_objectAtIndexedSubscript_(v29, v53, j, v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1BE740384((uint64_t)CHTokenizedTextResult, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        commonIndexSetsFromSets(v41, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend_count(v59, v60, v61, v62, v63, v64))
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v65 = (id)qword_1EF568E20;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BE607000, v65, OS_LOG_TYPE_ERROR, "Incompatible index sets have no partition of common index sets.", buf, 2u);
          }

        }
        v41 = v59;
      }
      v66 = v41;
    }
    else
    {
      v66 = (id)MEMORY[0x1E0C9AA60];
    }
    v357 = v66;

    if (!objc_msgSend_count(v357, v67, v68, v69, v70, v71) || objc_msgSend_count(v357, v72, v73, v74, v75, v76) == 1)
    {
      objc_msgSend_addObject_(v345, v72, (uint64_t)v348, v74, v75, v76);
      objc_msgSend_addObject_(v354, v78, (uint64_t)&unk_1E7828898, v79, v80, v81);
      v82 = v369;
      if ((unint64_t)v369 >= v370)
      {
        v83 = v368;
        v84 = 0xAAAAAAAAAAAAAAABLL * (v369 - v368) + 1;
        if (v84 > 0xAAAAAAAAAAAAAAALL)
          sub_1BE61F930();
        if (0x5555555555555556 * ((uint64_t)(v370 - (_QWORD)v368) >> 3) > v84)
          v84 = 0x5555555555555556 * ((uint64_t)(v370 - (_QWORD)v368) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v370 - (_QWORD)v368) >> 3) >= 0x555555555555555)
          v85 = 0xAAAAAAAAAAAAAAALL;
        else
          v85 = v84;
        if (v85 > 0xAAAAAAAAAAAAAAALL)
          sub_1BE61F100();
        v86 = (char *)operator new(24 * v85);
        v87 = &v86[8 * (v82 - v83)];
        v88 = (char **)(v87 + 24);
        *(_QWORD *)v87 = 0;
        *((_QWORD *)v87 + 1) = 0;
        *((_QWORD *)v87 + 2) = 0;
        if (v82 == v83)
        {
          v368 = (char **)&v86[8 * (v82 - v83)];
          v369 = (char **)(v87 + 24);
          v370 = (unint64_t)&v86[24 * v85];
        }
        else
        {
          do
          {
            v89 = *(_OWORD *)(v82 - 3);
            v82 -= 3;
            *(_OWORD *)(v87 - 24) = v89;
            v87 -= 24;
            *((_QWORD *)v87 + 2) = v82[2];
            *v82 = 0;
            v82[1] = 0;
            v82[2] = 0;
          }
          while (v82 != v83);
          v82 = v368;
          v90 = v369;
          v368 = (char **)v87;
          v369 = v88;
          v370 = (unint64_t)&v86[24 * v85];
          if (v90 != v82)
          {
            v91 = v90;
            do
            {
              v93 = *(v91 - 3);
              v91 -= 3;
              v92 = v93;
              if (v93)
              {
                *(v90 - 2) = v92;
                operator delete(v92);
              }
              v90 = v91;
            }
            while (v91 != v82);
          }
        }
        if (v82)
          operator delete(v82);
        v369 = v88;
      }
      else
      {
        *v369 = 0;
        v82[1] = 0;
        v82[2] = 0;
        v369 = v82 + 3;
      }
      goto LABEL_102;
    }
    objc_msgSend_array(*(void **)(v6 + 3560), v72, v77, v74, v75, v76);
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend_count(v357, v94, v95, v96, v97, v98);
    if (v103)
    {
      v356 = 0;
      v350 = 0;
      v104 = 0;
      for (k = 0; k != v103; ++k)
      {
        while (1)
        {
          v106 = objc_alloc_init(CHMutableTokenizedResultColumn);
          objc_msgSend_addObject_(v352, v107, (uint64_t)v106, v108, v109, v110);

          v111 = v350;
          if ((unint64_t)v350 >= v104)
            break;
          *(_QWORD *)v350 = 0;
          *((_QWORD *)v111 + 1) = 0;
          *((_QWORD *)v111 + 2) = 0;
          v350 = v111 + 24;
          if (++k == v103)
            goto LABEL_61;
        }
        v112 = 0xAAAAAAAAAAAAAAABLL * ((v350 - v356) >> 3) + 1;
        if (v112 > 0xAAAAAAAAAAAAAAALL)
          sub_1BE61F930();
        if (0x5555555555555556 * ((uint64_t)(v104 - (_QWORD)v356) >> 3) > v112)
          v112 = 0x5555555555555556 * ((uint64_t)(v104 - (_QWORD)v356) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v104 - (_QWORD)v356) >> 3) >= 0x555555555555555)
          v113 = 0xAAAAAAAAAAAAAAALL;
        else
          v113 = v112;
        if (v113 > 0xAAAAAAAAAAAAAAALL)
          sub_1BE61F100();
        v114 = (char *)operator new(24 * v113);
        v115 = &v114[8 * ((v350 - v356) >> 3)];
        *(_QWORD *)v115 = 0;
        *((_QWORD *)v115 + 1) = 0;
        *((_QWORD *)v115 + 2) = 0;
        v116 = v115;
        if (v350 != v356)
        {
          v117 = v350;
          v118 = v356;
          do
          {
            v119 = *(_OWORD *)(v117 - 24);
            v117 -= 24;
            *(_OWORD *)(v116 - 24) = v119;
            v116 -= 24;
            *((_QWORD *)v116 + 2) = *((_QWORD *)v117 + 2);
            *(_QWORD *)v117 = 0;
            *((_QWORD *)v117 + 1) = 0;
            *((_QWORD *)v117 + 2) = 0;
          }
          while (v117 != v118);
          v120 = v350;
          do
          {
            v122 = (void *)*((_QWORD *)v120 - 3);
            v120 -= 24;
            v121 = v122;
            if (v122)
            {
              *((_QWORD *)v350 - 2) = v121;
              operator delete(v121);
            }
            v350 = v120;
          }
          while (v120 != v356);
        }
        v104 = (unint64_t)&v114[24 * v113];
        v350 = v115 + 24;
        if (v356)
          operator delete(v356);
        v356 = v116;
      }
    }
    else
    {
      v356 = 0;
      v350 = 0;
    }
LABEL_61:
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v99, v103, v100, v101, v102);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v354, v124, (uint64_t)v123, v125, v126, v127);

    v349 = 0;
    v351 = i;
LABEL_62:
    objc_msgSend_textTokenRows(v348, v128, v129, v130, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v349 < objc_msgSend_count(v133, v134, v135, v136, v137, v138);

    if (v139)
    {
      objc_msgSend_textTokenRows(v348, v140, v141, v142, v143, v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v145, v146, v349, v147, v148, v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v151, v152, v153, v154, v155);
      v355 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v357, v156, 0, v157, v158, v159);
      v358 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      v165 = 0;
      v166 = 0;
      v167 = 0;
      v353 = v150;
      while (1)
      {
        if ((unint64_t)v165 >= objc_msgSend_count(v150, v160, v161, v162, v163, v164))
        {

          ++v349;
          goto LABEL_62;
        }
        objc_msgSend_objectAtIndex_(v150, v168, (uint64_t)v165, v169, v170, v171);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeIndexes(v172, v173, v174, v175, v176, v177);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        v366[0] = MEMORY[0x1E0C809B0];
        v366[1] = 3221225472;
        v366[2] = sub_1BE74F89C;
        v366[3] = &unk_1E77F2CB8;
        v361 = v355;
        v367 = v361;
        objc_msgSend_enumerateIndexesUsingBlock_(v178, v179, (uint64_t)v366, v180, v181, v182);

        if (v165 != (char *)(objc_msgSend_count(v150, v183, v184, v185, v186, v187) - 1)
          && (objc_msgSend_isEqualToIndexSet_(v361, v188, (uint64_t)v358, v189, v190, v191) & 1) == 0)
        {
          ++v165;
          goto LABEL_92;
        }
        objc_msgSend_objectAtIndex_(v352, v188, v167, v189, v190, v191);
        v363 = (char *)objc_claimAutoreleasedReturnValue();
        v362 = v167;
        v360 = (uint64_t)v172;
        v359 = v165 + 1;
        objc_msgSend_subarrayWithRange_(v150, v192, (uint64_t)v166, v165 + 1 - v166, v193, v194);
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        v200 = objc_msgSend_addTokenRowWithTokens_(v363, v196, (uint64_t)v195, v197, v198, v199);

        v206 = &v356[24 * v167];
        v208 = (uint64_t *)(v206 + 8);
        v207 = (uint64_t *)*((_QWORD *)v206 + 1);
        v210 = v206 + 16;
        v209 = *((_QWORD *)v206 + 2);
        if ((unint64_t)v207 >= v209)
          break;
        *v207 = v200;
        v211 = (uint64_t)(v207 + 1);
LABEL_89:
        *v208 = v211;
        v167 = v362 + 1;
        if (v362 + 1 < (unint64_t)objc_msgSend_count(v357, v201, v202, v203, v204, v205))
        {
          objc_msgSend_objectAtIndex_(v357, v232, v362 + 1, v233, v234, v235);
          v236 = (uint64_t *)objc_claimAutoreleasedReturnValue();

          v358 = v236;
          objc_msgSend_removeAllIndexes(v361, v237, v238, v239, v240, v241);
        }

        v6 = 0x1E0C99000;
        i = v351;
        v172 = (void *)v360;
        v150 = v353;
        v165 = v359;
        v166 = v359;
LABEL_92:

      }
      v212 = *(uint64_t **)v206;
      v213 = (uint64_t)v207 - *(_QWORD *)v206;
      v214 = v213 >> 3;
      v215 = (v213 >> 3) + 1;
      if (v215 >> 61)
        sub_1BE61F930();
      v216 = v209 - (_QWORD)v212;
      if (v216 >> 2 > v215)
        v215 = v216 >> 2;
      if ((unint64_t)v216 >= 0x7FFFFFFFFFFFFFF8)
        v217 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v217 = v215;
      if (v217)
      {
        if (v217 >> 61)
          sub_1BE61F100();
        v218 = v206 + 16;
        v219 = v217;
        v220 = operator new(8 * v217);
        v210 = v218;
        v217 = v219;
        v206 = &v356[24 * v362];
        v221 = (uint64_t *)&v220[8 * v214];
        *v221 = v200;
        v211 = (uint64_t)(v221 + 1);
        v222 = (char *)v207 - (char *)v212;
        if (v207 == v212)
          goto LABEL_87;
      }
      else
      {
        v220 = 0;
        v221 = (uint64_t *)(8 * v214);
        *(_QWORD *)(8 * v214) = v200;
        v211 = 8 * v214 + 8;
        v222 = (char *)v207 - (char *)v212;
        if (v207 == v212)
        {
LABEL_87:
          *(_QWORD *)v206 = v221;
          *v208 = v211;
          *(_QWORD *)v210 = &v220[8 * v217];
          if (v212)
            operator delete(v212);
          goto LABEL_89;
        }
      }
      v223 = v222 - 8;
      if (v223 < 0x58)
        goto LABEL_138;
      if ((unint64_t)((char *)v207 - v220 - v213) < 0x20)
        goto LABEL_138;
      v224 = (v223 >> 3) + 1;
      v225 = 8 * (v224 & 0x3FFFFFFFFFFFFFFCLL);
      v226 = &v207[v225 / 0xFFFFFFFFFFFFFFF8];
      v221 = (uint64_t *)((char *)v221 - v225);
      v227 = &v220[8 * v214 - 16];
      v228 = v207 - 2;
      v229 = v224 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v230 = *(_OWORD *)v228;
        *(v227 - 1) = *((_OWORD *)v228 - 1);
        *v227 = v230;
        v227 -= 2;
        v228 -= 4;
        v229 -= 4;
      }
      while (v229);
      v207 = v226;
      if (v224 != (v224 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_138:
        do
        {
          v231 = *--v207;
          *--v221 = v231;
        }
        while (v207 != v212);
      }
      goto LABEL_87;
    }
    v242 = v356;
    v243 = v350;
    sub_1BE7535F0(&v368, (uint64_t)v369, (char **)v356, (uint64_t)v350, 0xAAAAAAAAAAAAAAABLL * ((v350 - v356) >> 3));
    objc_msgSend_addObjectsFromArray_(v345, v244, (uint64_t)v352, v245, v246, v247);
    if (v356)
    {
      if (v350 != v356)
      {
        v248 = v350;
        do
        {
          v250 = (void *)*((_QWORD *)v248 - 3);
          v248 -= 24;
          v249 = v250;
          if (v250)
          {
            *((_QWORD *)v243 - 2) = v249;
            operator delete(v249);
          }
          v243 = v248;
        }
        while (v248 != v242);
      }
      operator delete(v242);
    }

    v22 = 1;
LABEL_102:

  }
LABEL_105:
  objc_msgSend_transcriptionPaths(v346, v17, v18, v19, v20, v21);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v257 = objc_msgSend_count(v251, v252, v253, v254, v255, v256);

  v262 = v347;
  if ((v22 & 1) != 0)
  {
    objc_msgSend_setTokenColumns_(v346, v258, (uint64_t)v345, v259, v260, v261);
    if (v257)
    {
      objc_msgSend_array(*(void **)(v6 + 3560), v263, v264, v265, v266, v267);
      v362 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_array(*(void **)(v6 + 3560), v268, v269, v270, v271, v272);
      v359 = (char *)objc_claimAutoreleasedReturnValue();
      v358 = &v343;
      v361 = (id)objc_msgSend_count(v345, v273, v274, v275, v276, v277);
      v278 = MEMORY[0x1E0C80A78](v361);
      v280 = (char *)&v343 - ((v279 + 15) & 0xFFFFFFFFFFFFFFF0);
      MEMORY[0x1E0C80A78](v278);
      v287 = (char *)&v343 - ((v286 + 15) & 0xFFFFFFFFFFFFFFF0);
      v288 = 0;
      v289 = 40;
      v360 = 40;
      while ((unint64_t)v288 < objc_msgSend_count(*(void **)((char *)&v346->super.super.super.isa + v289), v281, v282, v283, v284, v285))
      {
        objc_msgSend_objectAtIndex_(*(void **)((char *)&v346->super.super.super.isa + v289), v290, (uint64_t)v288, v291, v292, v293);
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        v363 = v288;
        objc_msgSend_getIndexes_range_(v294, v295, (uint64_t)v287, 0, v262, v296);

        if (v262)
        {
          v301 = 0;
          v302 = 0;
          do
          {
            v303 = 0;
            for (m = 3 * v302; ; m += 3)
            {
              objc_msgSend_objectAtIndex_(v354, v297, v301, v298, v299, v300);
              v305 = (void *)objc_claimAutoreleasedReturnValue();
              v311 = v303 < (int)objc_msgSend_intValue(v305, v306, v307, v308, v309, v310);

              if (!v311)
                break;
              v312 = v368[m];
              v313 = &v287[8 * v301];
              if (v368[m + 1] != v312)
                v313 = &v312[8 * *(_QWORD *)&v287[8 * v301]];
              *(_QWORD *)&v280[8 * v302 + 8 * v303++] = *(_QWORD *)v313;
            }
            ++v301;
            v302 += v303;
          }
          while (v301 != v347);
        }
        v314 = objc_alloc(MEMORY[0x1E0CB36B0]);
        v318 = (void *)objc_msgSend_initWithIndexes_length_(v314, v315, (uint64_t)v280, (uint64_t)v361, v316, v317);
        v364[0] = MEMORY[0x1E0C809B0];
        v364[1] = 3221225472;
        v364[2] = sub_1BE74F8A8;
        v364[3] = &unk_1E77F4A50;
        v319 = v318;
        v365 = v319;
        if (objc_msgSend_indexOfObjectPassingTest_((void *)v362, v320, (uint64_t)v364, v321, v322, v323) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend_addObject_((void *)v362, v324, (uint64_t)v319, v325, v326, v327);
          objc_msgSend_objectAtIndex_(v346->super._transcriptionPathScores, v328, (uint64_t)v363, v329, v330, v331);
          v332 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v359, v333, (uint64_t)v332, v334, v335, v336);

        }
        v288 = v363 + 1;
        v262 = v347;
        v289 = v360;
      }
      objc_msgSend_setTranscriptionPaths_scores_(v346, v290, v362, (uint64_t)v359, v292, v293);

    }
  }
  v337 = v368;
  if (v368)
  {
    v338 = v369;
    v339 = v368;
    if (v369 != v368)
    {
      v340 = v369;
      do
      {
        v342 = *(v340 - 3);
        v340 -= 3;
        v341 = v342;
        if (v342)
        {
          *(v338 - 2) = v341;
          operator delete(v341);
        }
        v338 = v340;
      }
      while (v340 != v337);
      v339 = v368;
    }
    v369 = v337;
    operator delete(v339);
  }

}

- (void)prependTokenColumns:(id)a3 prefixTopPath:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSArray *tokenColumns;
  NSArray *v30;
  NSArray *transcriptionPaths;
  unint64_t i;
  NSIndexPath *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;

  v44 = a3;
  v6 = a4;
  objc_msgSend_arrayByAddingObjectsFromArray_(v44, v7, (uint64_t)self->super._tokenColumns, v8, v9, v10);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v17 = (NSArray *)objc_msgSend_mutableCopy(self->super._transcriptionPaths, v12, v13, v14, v15, v16);
  v28 = objc_msgSend_count(v44, v18, v19, v20, v21, v22) - 1;
  if (v28 >= 0)
  {
    do
    {
      for (i = 0; i < objc_msgSend_count(v17, v23, v24, v25, v26, v27); ++i)
      {
        objc_msgSend_objectAtIndexedSubscript_(v17, v23, i, v25, v26, v27);
        v34 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend_indexAtPosition_(v6, v35, v28, v36, v37, v38);
        insertToIndexPath(v34, 0, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_replaceObjectAtIndex_withObject_(v17, v41, i, (uint64_t)v40, v42, v43);
      }
    }
    while (v28-- >= 1);
  }
  tokenColumns = self->super._tokenColumns;
  self->super._tokenColumns = v11;
  v30 = v11;

  transcriptionPaths = self->super._transcriptionPaths;
  self->super._transcriptionPaths = v17;

}

- (void)trimTokensToTranscriptionPathCount:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  unint64_t v27;
  _QWORD *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _BYTE *v38;
  uint64_t *v39;
  int64_t v40;
  unint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD *v47;
  uint64_t *v48;
  uint64_t v49;
  __int128 v50;
  char *v51;
  int64_t v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  int64_t v57;
  char *v58;
  char *v59;
  char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  _BYTE *v80;
  int64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  _BYTE *v85;
  _QWORD *v86;
  uint64_t v87;
  _BYTE *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  _BYTE *v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  _OWORD *v100;
  char *v101;
  uint64_t v102;
  __int128 v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  _OWORD *v109;
  char *v110;
  uint64_t v111;
  __int128 v112;
  uint64_t v113;
  unint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  unint64_t v126;
  void *v127;
  __int128 v128;
  uint64_t v129;
  const void *v130;
  int64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v138;
  _QWORD **v139;
  _QWORD *v140;
  _QWORD *v141;
  _QWORD **v142;
  uint64_t v143;
  uint64_t *v144;
  _QWORD **v145;
  uint64_t v146;
  _QWORD *v147;
  _QWORD *v148;
  _QWORD *v149;
  _QWORD *v150;
  uint64_t v151;
  _QWORD *v152;
  uint64_t v153;
  _BYTE *v154;
  int v155;
  uint64_t v156;
  int v157;
  uint64_t *v158;
  uint64_t v159;
  uint64_t v160;
  _QWORD *v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  _QWORD **v172;
  _QWORD *v173;
  _QWORD *v174;
  _QWORD **v175;
  uint64_t v176;
  _QWORD *v177;
  uint64_t v178;
  _QWORD *v179;
  _QWORD *v180;
  _QWORD *v181;
  uint64_t v182;
  _QWORD *v183;
  uint64_t v184;
  _BYTE *v185;
  int v186;
  uint64_t v187;
  int v188;
  uint64_t *v189;
  uint64_t v190;
  uint64_t v191;
  char *v192;
  char *v193;
  char *v194;
  uint64_t v195;
  _QWORD *v196;
  int64_t v197;
  char *v198;
  char *v199;
  _BYTE *v200;
  char *v201;
  char *v202;
  char *v203;
  int64_t v204;
  unint64_t v205;
  uint64_t v206;
  unint64_t v207;
  _BYTE *v208;
  char *v209;
  int64_t v210;
  unint64_t v211;
  uint64_t v212;
  uint64_t v213;
  char *v214;
  _OWORD *v215;
  char *v216;
  uint64_t v217;
  __int128 v218;
  uint64_t v219;
  uint64_t v220;
  char **v221;
  unint64_t v222;
  char *v223;
  char *v224;
  char **v225;
  char *v226;
  char *v227;
  int64_t v228;
  _QWORD *v229;
  uint64_t v230;
  _QWORD **v231;
  _QWORD *v232;
  _QWORD *v233;
  _QWORD **v234;
  uint64_t v235;
  _QWORD *v236;
  uint64_t v237;
  _QWORD *v238;
  _QWORD *v239;
  _QWORD *v240;
  uint64_t v241;
  _QWORD *v242;
  uint64_t v243;
  _BYTE *v244;
  int v245;
  uint64_t v246;
  int v247;
  uint64_t *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  _QWORD *v252;
  char *v253;
  char *v254;
  int64_t v255;
  char *v256;
  char *v257;
  char *v258;
  _BYTE *v259;
  char *v260;
  char *v261;
  int64_t v262;
  unint64_t v263;
  uint64_t v264;
  unint64_t v265;
  _BYTE *v266;
  char *v267;
  int64_t v268;
  unint64_t v269;
  uint64_t v270;
  uint64_t v271;
  char *v272;
  _OWORD *v273;
  char *v274;
  uint64_t v275;
  __int128 v276;
  uint64_t v277;
  uint64_t v278;
  CHTokenizedResultColumn *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  char *v289;
  char *v290;
  char *v291;
  char *v292;
  void *v293;
  void *v294;
  char *v295;
  char *v296;
  char *v297;
  char *v298;
  void *v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  char *v307;
  size_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  char *v312;
  uint64_t v313;
  uint64_t v314;
  char *v315;
  unint64_t v316;
  int64_t v317;
  int64_t v318;
  unint64_t v319;
  uint64_t v320;
  unint64_t v321;
  _BYTE *v322;
  char *v323;
  char *v324;
  unint64_t v325;
  char *v326;
  uint64_t v327;
  uint64_t v328;
  char *v329;
  size_t v330;
  char *v331;
  char *v332;
  size_t v333;
  uint64_t v334;
  char *v335;
  char *v336;
  unint64_t v337;
  unint64_t v338;
  unint64_t v339;
  uint64_t v340;
  uint64_t v341;
  char *v342;
  __int128 *v343;
  _OWORD *v344;
  uint64_t v345;
  __int128 v346;
  uint64_t v347;
  char *v348;
  unint64_t v349;
  uint64_t v350;
  uint64_t v351;
  _OWORD *v352;
  __int128 *v353;
  uint64_t v354;
  __int128 v355;
  uint64_t v356;
  char *v357;
  size_t v358;
  uint64_t v359;
  uint64_t v360;
  _OWORD *v361;
  __int128 *v362;
  uint64_t v363;
  __int128 v364;
  uint64_t v365;
  char *v366;
  unint64_t v367;
  uint64_t v368;
  const char *v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  char *v375;
  unint64_t i;
  void *v377;
  uint64_t v378;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  void *v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  void *v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  CHMutableTokenizedTextResult *v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  char *v401;
  char *v402;
  char *v403;
  char *v404;
  void *v405;
  void *v406;
  char *v407;
  char *v408;
  char *v409;
  char *v410;
  void *v411;
  void *v412;
  void *v413;
  uint64_t v414;
  char *v415;
  uint64_t v416;
  char *v417;
  CHMutableTokenizedTextResult *v418;
  char *v419;
  char *v420;
  char *v421;
  char *v422;
  char *v423;
  unint64_t v424;
  char *v425;
  char *v426;
  unint64_t v427;
  char **v428;
  char *v429;
  unint64_t v430;
  char **v431;
  char *v432;
  unint64_t v433;
  void **v434;
  _QWORD *v435;
  uint64_t *v436;
  char *v437;
  char *v438;
  char *v439;
  _BYTE *v440;
  char *v441;
  unint64_t v442;
  char **v443;
  char *v444;
  unint64_t v445;
  char *v446;
  char *v447;
  unint64_t v448;
  uint64_t v449;

  v415 = (char *)a3;
  v418 = self;
  v449 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, a3, v3, v4, v5);
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v446 = 0;
  v447 = 0;
  v448 = 0;
  v443 = 0;
  v444 = 0;
  v445 = 0;
  v440 = 0;
  v441 = 0;
  v442 = 0;
  v437 = 0;
  v438 = 0;
  v439 = 0;
  v12 = 40;
  v414 = 40;
  while ((unint64_t)v11 < objc_msgSend_count(*(void **)((char *)&v418->super.super.super.isa + v12), v6, v7, v8, v9, v10, v413))
  {
    objc_msgSend_objectAtIndex_(*(void **)((char *)&v418->super.super.super.isa + v12), v13, (uint64_t)v11, v15, v16, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v434 = 0;
    v435 = 0;
    v436 = 0;
    v416 = (uint64_t)v23;
    v417 = v11;
    while (v27 < objc_msgSend_count(v418->super._tokenColumns, v18, v19, v20, v21, v22))
    {
      v33 = objc_msgSend_indexAtPosition_(v23, v29, v27, v30, v31, v32);
      v34 = v33;
      if (v25 < v24)
      {
        *v25 = v33;
        v28 = v25 + 1;
        goto LABEL_5;
      }
      v35 = v25 - v26;
      v36 = v35 + 1;
      if ((unint64_t)(v35 + 1) >> 61)
        sub_1BE61F930();
      if (((char *)v24 - (char *)v26) >> 2 > v36)
        v36 = ((char *)v24 - (char *)v26) >> 2;
      if ((unint64_t)((char *)v24 - (char *)v26) >= 0x7FFFFFFFFFFFFFF8)
        v37 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v37 = v36;
      if (v37)
      {
        if (v37 >> 61)
          sub_1BE61F100();
        v38 = operator new(8 * v37);
        v39 = (uint64_t *)&v38[8 * v35];
        *v39 = v34;
        v28 = v39 + 1;
        v40 = (char *)v25 - (char *)v26;
        if (v25 == v26)
          goto LABEL_22;
      }
      else
      {
        v38 = 0;
        v39 = (uint64_t *)(8 * v35);
        *(_QWORD *)(8 * v35) = v34;
        v28 = (_QWORD *)(8 * v35 + 8);
        v40 = (char *)v25 - (char *)v26;
        if (v25 == v26)
          goto LABEL_22;
      }
      v41 = v40 - 8;
      if (v41 < 0x168)
      {
        v42 = v25;
        goto LABEL_21;
      }
      v44 = ((char *)(v25 - 1) - (char *)v26) & 0xFFFFFFFFFFFFFFF8;
      if (&v38[(char *)v25 - (char *)v26 - 8 - v44] > &v38[(char *)v25 - (char *)v26 - 8])
      {
        v42 = v25;
        do
        {
LABEL_21:
          v43 = *--v42;
          *--v39 = v43;
        }
        while (v42 != v26);
        goto LABEL_22;
      }
      if ((uint64_t *)((char *)v25 - v44 - 8) > v25 - 1)
      {
        v42 = v25;
        goto LABEL_21;
      }
      if ((unint64_t)((char *)v26 - v38) < 0x20)
      {
        v42 = v25;
        goto LABEL_21;
      }
      v45 = (v41 >> 3) + 1;
      v46 = 8 * (v45 & 0x3FFFFFFFFFFFFFFCLL);
      v42 = &v25[v46 / 0xFFFFFFFFFFFFFFF8];
      v39 = (uint64_t *)((char *)v39 - v46);
      v47 = &v38[8 * v35 - 16];
      v48 = v25 - 2;
      v49 = v45 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v50 = *(_OWORD *)v48;
        *(v47 - 1) = *((_OWORD *)v48 - 1);
        *v47 = v50;
        v47 -= 2;
        v48 -= 4;
        v49 -= 4;
      }
      while (v49);
      if (v45 != (v45 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_21;
LABEL_22:
      v24 = (uint64_t *)&v38[8 * v37];
      v434 = (void **)v39;
      v435 = v28;
      v436 = v24;
      if (v26)
        operator delete(v26);
      v26 = v39;
      v23 = (void *)v416;
LABEL_5:
      v435 = v28;
      ++v27;
      v25 = v28;
      v11 = v417;
    }
    if ((uint64_t)v11 >= (uint64_t)v415)
    {
      v56 = v444;
      if ((unint64_t)v444 >= v445)
      {
        v60 = sub_1BE753B30((char **)&v443, v26, (uint64_t)v25);
      }
      else
      {
        *(_QWORD *)v444 = 0;
        *((_QWORD *)v56 + 1) = 0;
        *((_QWORD *)v56 + 2) = 0;
        v57 = (char *)v25 - (char *)v26;
        if (v25 != v26)
        {
          if (v57 < 0)
            sub_1BE61F930();
          v58 = (char *)operator new((char *)v25 - (char *)v26);
          *(_QWORD *)v56 = v58;
          *((_QWORD *)v56 + 1) = v58;
          v59 = &v58[8 * (v57 >> 3)];
          *((_QWORD *)v56 + 2) = v59;
          memcpy(v58, v26, v57);
          *((_QWORD *)v56 + 1) = v59;
        }
        v60 = v56 + 24;
        v23 = (void *)v416;
      }
      v444 = v60;
      objc_msgSend_objectAtIndex_(v418->super._transcriptionPathScores, v29, (uint64_t)v11, v30, v31, v32);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v61, v71, v72, v73, v74, v75);
      v77 = v76;
      v78 = v438;
      if (v438 < v439)
      {
        *(_QWORD *)v438 = v76;
        v79 = (uint64_t)(v78 + 8);
LABEL_91:
        v12 = v414;
        v438 = (char *)v79;
        goto LABEL_92;
      }
      v88 = v437;
      v89 = (v438 - v437) >> 3;
      v90 = v89 + 1;
      if ((unint64_t)(v89 + 1) >> 61)
        sub_1BE61F930();
      v91 = v439 - v437;
      if ((v439 - v437) >> 2 > v90)
        v90 = v91 >> 2;
      if ((unint64_t)v91 >= 0x7FFFFFFFFFFFFFF8)
        v92 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v92 = v90;
      if (v92)
      {
        if (v92 >> 61)
          sub_1BE61F100();
        v93 = operator new(8 * v92);
        v94 = &v93[8 * v89];
        *(_QWORD *)v94 = v77;
        v79 = (uint64_t)(v94 + 8);
        v95 = v78 - v88;
        if (v78 == v88)
          goto LABEL_89;
LABEL_83:
        v105 = v95 - 8;
        if (v105 < 0x58)
          goto LABEL_433;
        if ((unint64_t)(v88 - v93) < 0x20)
          goto LABEL_433;
        v106 = (v105 >> 3) + 1;
        v107 = 8 * (v106 & 0x3FFFFFFFFFFFFFFCLL);
        v108 = &v78[-v107];
        v94 -= v107;
        v109 = &v93[8 * v89 - 16];
        v110 = v78 - 16;
        v111 = v106 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v112 = *(_OWORD *)v110;
          *(v109 - 1) = *((_OWORD *)v110 - 1);
          *v109 = v112;
          v109 -= 2;
          v110 -= 32;
          v111 -= 4;
        }
        while (v111);
        v78 = v108;
        if (v106 != (v106 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_433:
          do
          {
            v113 = *((_QWORD *)v78 - 1);
            v78 -= 8;
            *((_QWORD *)v94 - 1) = v113;
            v94 -= 8;
          }
          while (v78 != v88);
        }
      }
      else
      {
        v93 = 0;
        v94 = (char *)(8 * v89);
        *(_QWORD *)(8 * v89) = v76;
        v79 = 8 * v89 + 8;
        v95 = v78 - v88;
        if (v78 != v88)
          goto LABEL_83;
      }
LABEL_89:
      v437 = v94;
      v438 = (char *)v79;
      v439 = &v93[8 * v92];
      if (v88)
        operator delete(v88);
      goto LABEL_91;
    }
    v51 = v447;
    if ((unint64_t)v447 >= v448)
    {
      v55 = sub_1BE753B30(&v446, v26, (uint64_t)v25);
    }
    else
    {
      *(_QWORD *)v447 = 0;
      *((_QWORD *)v51 + 1) = 0;
      *((_QWORD *)v51 + 2) = 0;
      v52 = (char *)v25 - (char *)v26;
      if (v25 != v26)
      {
        if (v52 < 0)
          sub_1BE61F930();
        v53 = (char *)operator new((char *)v25 - (char *)v26);
        *(_QWORD *)v51 = v53;
        *((_QWORD *)v51 + 1) = v53;
        v54 = &v53[8 * (v52 >> 3)];
        *((_QWORD *)v51 + 2) = v54;
        memcpy(v53, v26, v52);
        *((_QWORD *)v51 + 1) = v54;
      }
      v55 = v51 + 24;
      v23 = (void *)v416;
    }
    v447 = v55;
    objc_msgSend_objectAtIndex_(v418->super._transcriptionPathScores, v29, (uint64_t)v11, v30, v31, v32);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v61, v62, v63, v64, v65, v66);
    v68 = v67;
    v69 = v441;
    if ((unint64_t)v441 < v442)
    {
      *(_QWORD *)v441 = v67;
      v70 = v69 + 8;
      goto LABEL_81;
    }
    v80 = v440;
    v81 = (v441 - v440) >> 3;
    v82 = v81 + 1;
    if ((unint64_t)(v81 + 1) >> 61)
      sub_1BE61F930();
    v83 = v442 - (_QWORD)v440;
    if ((uint64_t)(v442 - (_QWORD)v440) >> 2 > v82)
      v82 = v83 >> 2;
    if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFF8)
      v84 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v84 = v82;
    if (v84)
    {
      if (v84 >> 61)
        sub_1BE61F100();
      v85 = operator new(8 * v84);
      v86 = &v85[8 * v81];
      *v86 = v68;
      v70 = (char *)(v86 + 1);
      v87 = v69 - v80;
      if (v69 == v80)
        goto LABEL_79;
LABEL_73:
      v96 = v87 - 8;
      if (v96 < 0x58)
        goto LABEL_434;
      if ((unint64_t)(v80 - v85) < 0x20)
        goto LABEL_434;
      v97 = (v96 >> 3) + 1;
      v98 = 8 * (v97 & 0x3FFFFFFFFFFFFFFCLL);
      v99 = &v69[-v98];
      v86 = (_QWORD *)((char *)v86 - v98);
      v100 = &v85[8 * v81 - 16];
      v101 = v69 - 16;
      v102 = v97 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v103 = *(_OWORD *)v101;
        *(v100 - 1) = *((_OWORD *)v101 - 1);
        *v100 = v103;
        v100 -= 2;
        v101 -= 32;
        v102 -= 4;
      }
      while (v102);
      v69 = v99;
      if (v97 != (v97 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_434:
        do
        {
          v104 = *((_QWORD *)v69 - 1);
          v69 -= 8;
          *--v86 = v104;
        }
        while (v69 != v80);
      }
    }
    else
    {
      v85 = 0;
      v86 = (_QWORD *)(8 * v81);
      *(_QWORD *)(8 * v81) = v67;
      v70 = (char *)(8 * v81 + 8);
      v87 = v69 - v80;
      if (v69 != v80)
        goto LABEL_73;
    }
LABEL_79:
    v440 = v86;
    v441 = v70;
    v442 = (unint64_t)&v85[8 * v84];
    if (v80)
      operator delete(v80);
LABEL_81:
    v12 = v414;
    v441 = v70;
LABEL_92:

    if (v434)
      operator delete(v434);

    v11 = v417 + 1;
  }
  v114 = 0;
  v416 = 32;
  while (v114 < objc_msgSend_count(*(void **)((char *)&v418->super.super.super.isa + v416), v13, v14, v15, v16, v17))
  {
    objc_msgSend_objectAtIndexedSubscript_(*(void **)((char *)&v418->super.super.super.isa + v416), v115, v114, v117, v118, v119);
    v414 = objc_claimAutoreleasedReturnValue();
    v435 = 0;
    v436 = 0;
    v434 = (void **)&v435;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v120, v121, v122, v123, v124);
    v415 = (char *)objc_claimAutoreleasedReturnValue();
    v431 = 0;
    v432 = 0;
    v433 = 0;
    v429 = 0;
    v428 = 0;
    v430 = 0;
    v426 = 0;
    v425 = 0;
    v427 = 0;
    v423 = 0;
    v422 = 0;
    v424 = 0;
    v125 = v446;
    v417 = (char *)v114;
    if (v447 != v446)
    {
      v126 = 0;
      while (1)
      {
        v420 = 0;
        v419 = 0;
        v421 = 0;
        v128 = *(_OWORD *)&v125[24 * v126];
        v129 = *(_QWORD *)&v125[24 * v126 + 8];
        v130 = (const void *)v128;
        v131 = v129 - v128;
        if (v129 - (uint64_t)v128 < 0)
          sub_1BE61F930();
        v419 = (char *)operator new(v129 - v128);
        v421 = &v419[8 * (v131 >> 3)];
        memcpy(v419, v130, v131);
        v420 = v421;
        v137 = *(_QWORD *)&v419[8 * v114];
        v138 = v435;
        v139 = &v435;
        v140 = v435;
        if (!v435)
          break;
        do
        {
          v141 = v140;
          v142 = v139;
          v143 = v140[4];
          if (v143 >= v137)
            v139 = (_QWORD **)v140;
          else
            ++v140;
          v140 = (_QWORD *)*v140;
        }
        while (v140);
        if (v139 == &v435)
          goto LABEL_112;
        if (v143 < v137)
          v141 = v142;
        if (v137 < v141[4])
        {
LABEL_112:
          v144 = v436;
          while (1)
          {
            while (1)
            {
              v145 = (_QWORD **)v138;
              v146 = v138[4];
              if (v137 >= v146)
                break;
              v138 = *v145;
              if (!*v145)
              {
                v147 = v145;
                goto LABEL_120;
              }
            }
            if (v146 >= v137)
              break;
            v138 = v145[1];
            if (!v138)
            {
              v147 = v145 + 1;
              goto LABEL_120;
            }
          }
          v148 = v145;
          goto LABEL_145;
        }
LABEL_146:
        if (v138)
        {
          v172 = &v435;
          v173 = v138;
          do
          {
            v174 = v173;
            v175 = v172;
            v176 = v173[4];
            if (v176 >= v137)
              v172 = (_QWORD **)v173;
            else
              ++v173;
            v173 = (_QWORD *)*v173;
          }
          while (v173);
          if (v172 != &v435)
          {
            if (v176 < v137)
              v174 = v175;
            if (v137 >= v174[4])
            {
              do
              {
                while (1)
                {
                  v177 = v138;
                  v178 = v138[4];
                  if (v137 < v178)
                    break;
                  if (v178 >= v137)
                  {
                    v192 = v419;
                    *(_QWORD *)&v419[8 * v114] = v177[5];
                    v193 = v432;
                    if ((unint64_t)v432 >= v433)
                      goto LABEL_182;
                    goto LABEL_195;
                  }
                  v138 = (_QWORD *)v177[1];
                  if (!v138)
                  {
                    v179 = v177 + 1;
                    goto LABEL_163;
                  }
                }
                v138 = (_QWORD *)*v177;
              }
              while (*v177);
              v179 = v177;
LABEL_163:
              v180 = operator new(0x30uLL);
              v180[4] = v137;
              v180[5] = 0;
              *v180 = 0;
              v180[1] = 0;
              v180[2] = v177;
              *v179 = v180;
              if (*v434)
              {
                v434 = (void **)*v434;
                v180 = (_QWORD *)*v179;
              }
              v181 = v435;
              *((_BYTE *)v180 + 24) = v180 == v435;
              v114 = (unint64_t)v417;
              if (v180 != v181)
              {
                do
                {
                  v182 = v180[2];
                  if (*(_BYTE *)(v182 + 24))
                    break;
                  v183 = *(_QWORD **)(v182 + 16);
                  v184 = *v183;
                  if (*v183 == v182)
                  {
                    v187 = v183[1];
                    if (!v187 || (v188 = *(unsigned __int8 *)(v187 + 24), v185 = (_BYTE *)(v187 + 24), v188))
                    {
                      if (*(_QWORD **)v182 == v180)
                      {
                        *(_BYTE *)(v182 + 24) = 1;
                        *((_BYTE *)v183 + 24) = 0;
                        v191 = *(_QWORD *)(v182 + 8);
                        *v183 = v191;
                        if (v191)
                          goto LABEL_179;
                      }
                      else
                      {
                        v189 = *(uint64_t **)(v182 + 8);
                        v190 = *v189;
                        *(_QWORD *)(v182 + 8) = *v189;
                        if (v190)
                        {
                          *(_QWORD *)(v190 + 16) = v182;
                          v183 = *(_QWORD **)(v182 + 16);
                        }
                        v189[2] = (uint64_t)v183;
                        *(_QWORD *)(*(_QWORD *)(v182 + 16) + 8 * (**(_QWORD **)(v182 + 16) != v182)) = v189;
                        *v189 = v182;
                        *(_QWORD *)(v182 + 16) = v189;
                        v183 = (_QWORD *)v189[2];
                        v182 = *v183;
                        *((_BYTE *)v189 + 24) = 1;
                        *((_BYTE *)v183 + 24) = 0;
                        v191 = *(_QWORD *)(v182 + 8);
                        *v183 = v191;
                        if (v191)
LABEL_179:
                          *(_QWORD *)(v191 + 16) = v183;
                      }
                      *(_QWORD *)(v182 + 16) = v183[2];
                      *(_QWORD *)(v183[2] + 8 * (*(_QWORD *)v183[2] != (_QWORD)v183)) = v182;
                      *(_QWORD *)(v182 + 8) = v183;
LABEL_193:
                      v183[2] = v182;
                      break;
                    }
                  }
                  else if (!v184 || (v186 = *(unsigned __int8 *)(v184 + 24), v185 = (_BYTE *)(v184 + 24), v186))
                  {
                    if (*(_QWORD **)v182 == v180)
                    {
                      v220 = v180[1];
                      *(_QWORD *)v182 = v220;
                      if (v220)
                      {
                        *(_QWORD *)(v220 + 16) = v182;
                        v183 = *(_QWORD **)(v182 + 16);
                      }
                      v180[2] = v183;
                      *(_QWORD *)(*(_QWORD *)(v182 + 16) + 8 * (**(_QWORD **)(v182 + 16) != v182)) = v180;
                      v180[1] = v182;
                      *(_QWORD *)(v182 + 16) = v180;
                      v183 = (_QWORD *)v180[2];
                      *((_BYTE *)v180 + 24) = 1;
                      *((_BYTE *)v183 + 24) = 0;
                      v182 = v183[1];
                      v196 = *(_QWORD **)v182;
                      v183[1] = *(_QWORD *)v182;
                      if (v196)
LABEL_191:
                        v196[2] = v183;
                    }
                    else
                    {
                      *(_BYTE *)(v182 + 24) = 1;
                      *((_BYTE *)v183 + 24) = 0;
                      v182 = v183[1];
                      v196 = *(_QWORD **)v182;
                      v183[1] = *(_QWORD *)v182;
                      if (v196)
                        goto LABEL_191;
                    }
                    *(_QWORD *)(v182 + 16) = v183[2];
                    *(_QWORD *)(v183[2] + 8 * (*(_QWORD *)v183[2] != (_QWORD)v183)) = v182;
                    *(_QWORD *)v182 = v183;
                    goto LABEL_193;
                  }
                  *(_BYTE *)(v182 + 24) = 1;
                  v180 = v183;
                  *((_BYTE *)v183 + 24) = v183 == v181;
                  *v185 = 1;
                }
                while (v183 != v181);
              }
              v436 = (uint64_t *)((char *)v436 + 1);
              v192 = v419;
              *(_QWORD *)&v419[8 * v114] = 0;
              v193 = v432;
              if ((unint64_t)v432 >= v433)
              {
LABEL_182:
                v194 = sub_1BE753B30((char **)&v431, v192, (uint64_t)v420);
                v114 = (unint64_t)v417;
                goto LABEL_199;
              }
LABEL_195:
              *(_QWORD *)v193 = 0;
              *((_QWORD *)v193 + 1) = 0;
              *((_QWORD *)v193 + 2) = 0;
              v197 = v420 - v192;
              if (v420 != v192)
              {
                if (v197 < 0)
                  sub_1BE61F930();
                v198 = (char *)operator new(v420 - v192);
                *(_QWORD *)v193 = v198;
                *((_QWORD *)v193 + 1) = v198;
                v199 = &v198[8 * (v197 >> 3)];
                *((_QWORD *)v193 + 2) = v199;
                memcpy(v198, v192, v197);
                *((_QWORD *)v193 + 1) = v199;
              }
              v194 = v193 + 24;
LABEL_199:
              v432 = v194;
              v200 = v440;
              v201 = v426;
              if ((unint64_t)v426 < v427)
              {
                *(_QWORD *)v426 = *(_QWORD *)&v440[8 * v126];
                v202 = v201 + 8;
                goto LABEL_221;
              }
              v203 = v425;
              v204 = (v426 - v425) >> 3;
              v205 = v204 + 1;
              if ((unint64_t)(v204 + 1) >> 61)
                sub_1BE61F930();
              v206 = v427 - (_QWORD)v425;
              if ((uint64_t)(v427 - (_QWORD)v425) >> 2 > v205)
                v205 = v206 >> 2;
              if ((unint64_t)v206 >= 0x7FFFFFFFFFFFFFF8)
                v207 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v207 = v205;
              if (v207)
              {
                if (v207 >> 61)
                  sub_1BE61F100();
                v208 = operator new(8 * v207);
                v209 = &v208[8 * v204];
                *(_QWORD *)v209 = *(_QWORD *)&v200[8 * v126];
                v202 = v209 + 8;
                v210 = v201 - v203;
                if (v201 != v203)
                {
LABEL_210:
                  v211 = v210 - 8;
                  if (v211 < 0x58)
                  {
                    v114 = (unint64_t)v417;
                    goto LABEL_218;
                  }
                  v114 = (unint64_t)v417;
                  if ((unint64_t)(v203 - v208) < 0x20)
                    goto LABEL_435;
                  v212 = (v211 >> 3) + 1;
                  v213 = 8 * (v212 & 0x3FFFFFFFFFFFFFFCLL);
                  v214 = &v201[-v213];
                  v209 -= v213;
                  v215 = &v208[8 * v204 - 16];
                  v216 = v201 - 16;
                  v217 = v212 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    v218 = *(_OWORD *)v216;
                    *(v215 - 1) = *((_OWORD *)v216 - 1);
                    *v215 = v218;
                    v215 -= 2;
                    v216 -= 32;
                    v217 -= 4;
                  }
                  while (v217);
                  v201 = v214;
                  if (v212 != (v212 & 0x3FFFFFFFFFFFFFFCLL))
                  {
LABEL_435:
                    do
                    {
LABEL_218:
                      v219 = *((_QWORD *)v201 - 1);
                      v201 -= 8;
                      *((_QWORD *)v209 - 1) = v219;
                      v209 -= 8;
                    }
                    while (v201 != v203);
                  }
LABEL_219:
                  v425 = v209;
                  v427 = (unint64_t)&v208[8 * v207];
                  if (v203)
                    operator delete(v203);
LABEL_221:
                  v426 = v202;
                  v127 = v419;
                  if (!v419)
                    goto LABEL_101;
LABEL_100:
                  operator delete(v127);
                  goto LABEL_101;
                }
              }
              else
              {
                v208 = 0;
                v209 = (char *)(8 * v204);
                *(_QWORD *)(8 * v204) = *(_QWORD *)&v440[8 * v126];
                v202 = (char *)(8 * v204 + 8);
                v210 = v201 - v203;
                if (v201 != v203)
                  goto LABEL_210;
              }
              v114 = (unint64_t)v417;
              goto LABEL_219;
            }
          }
        }
        v127 = v419;
        if (v419)
          goto LABEL_100;
LABEL_101:
        ++v126;
        v125 = v446;
        if (v126 >= 0xAAAAAAAAAAAAAAABLL * ((v447 - v446) >> 3))
          goto LABEL_229;
      }
      v144 = v436;
      v147 = &v435;
      v145 = &v435;
LABEL_120:
      v148 = operator new(0x30uLL);
      v148[4] = v137;
      v148[5] = 0;
      *v148 = 0;
      v148[1] = 0;
      v148[2] = v145;
      *v147 = v148;
      v149 = v148;
      if (*v434)
      {
        v434 = (void **)*v434;
        v149 = (_QWORD *)*v147;
      }
      v150 = v435;
      *((_BYTE *)v149 + 24) = v149 == v435;
      if (v149 != v150)
      {
        do
        {
          v151 = v149[2];
          if (*(_BYTE *)(v151 + 24))
            break;
          v152 = *(_QWORD **)(v151 + 16);
          v153 = *v152;
          if (*v152 == v151)
          {
            v156 = v152[1];
            if (!v156 || (v157 = *(unsigned __int8 *)(v156 + 24), v154 = (_BYTE *)(v156 + 24), v157))
            {
              if (*(_QWORD **)v151 == v149)
              {
                *(_BYTE *)(v151 + 24) = 1;
                *((_BYTE *)v152 + 24) = 0;
                v160 = *(_QWORD *)(v151 + 8);
                *v152 = v160;
                if (v160)
                  goto LABEL_136;
              }
              else
              {
                v158 = *(uint64_t **)(v151 + 8);
                v159 = *v158;
                *(_QWORD *)(v151 + 8) = *v158;
                if (v159)
                {
                  *(_QWORD *)(v159 + 16) = v151;
                  v152 = *(_QWORD **)(v151 + 16);
                }
                v158[2] = (uint64_t)v152;
                *(_QWORD *)(*(_QWORD *)(v151 + 16) + 8 * (**(_QWORD **)(v151 + 16) != v151)) = v158;
                *v158 = v151;
                *(_QWORD *)(v151 + 16) = v158;
                v152 = (_QWORD *)v158[2];
                v151 = *v152;
                *((_BYTE *)v158 + 24) = 1;
                *((_BYTE *)v152 + 24) = 0;
                v160 = *(_QWORD *)(v151 + 8);
                *v152 = v160;
                if (v160)
LABEL_136:
                  *(_QWORD *)(v160 + 16) = v152;
              }
              *(_QWORD *)(v151 + 16) = v152[2];
              *(_QWORD *)(v152[2] + 8 * (*(_QWORD *)v152[2] != (_QWORD)v152)) = v151;
              *(_QWORD *)(v151 + 8) = v152;
LABEL_143:
              v152[2] = v151;
              break;
            }
          }
          else if (!v153 || (v155 = *(unsigned __int8 *)(v153 + 24), v154 = (_BYTE *)(v153 + 24), v155))
          {
            if (*(_QWORD **)v151 == v149)
            {
              v195 = v149[1];
              *(_QWORD *)v151 = v195;
              if (v195)
              {
                *(_QWORD *)(v195 + 16) = v151;
                v152 = *(_QWORD **)(v151 + 16);
              }
              v149[2] = v152;
              *(_QWORD *)(*(_QWORD *)(v151 + 16) + 8 * (**(_QWORD **)(v151 + 16) != v151)) = v149;
              v149[1] = v151;
              *(_QWORD *)(v151 + 16) = v149;
              v152 = (_QWORD *)v149[2];
              *((_BYTE *)v149 + 24) = 1;
              *((_BYTE *)v152 + 24) = 0;
              v151 = v152[1];
              v161 = *(_QWORD **)v151;
              v152[1] = *(_QWORD *)v151;
              if (v161)
LABEL_141:
                v161[2] = v152;
            }
            else
            {
              *(_BYTE *)(v151 + 24) = 1;
              *((_BYTE *)v152 + 24) = 0;
              v151 = v152[1];
              v161 = *(_QWORD **)v151;
              v152[1] = *(_QWORD *)v151;
              if (v161)
                goto LABEL_141;
            }
            *(_QWORD *)(v151 + 16) = v152[2];
            *(_QWORD *)(v152[2] + 8 * (*(_QWORD *)v152[2] != (_QWORD)v152)) = v151;
            *(_QWORD *)v151 = v152;
            goto LABEL_143;
          }
          *(_BYTE *)(v151 + 24) = 1;
          v149 = v152;
          *((_BYTE *)v152 + 24) = v152 == v150;
          *v154 = 1;
        }
        while (v152 != v150);
      }
      v436 = (uint64_t *)((char *)v144 + 1);
LABEL_145:
      v148[5] = v144;
      objc_msgSend_textTokenRows((void *)v414, v132, v133, v134, v135, v136);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v162, v163, v137, v164, v165, v166);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v415, v168, (uint64_t)v167, v169, v170, v171);

      v114 = (unint64_t)v417;
      v138 = v435;
      goto LABEL_146;
    }
LABEL_229:
    v221 = v443;
    if (v444 != (char *)v443)
    {
      v222 = 0;
      while (1)
      {
        v225 = &v221[3 * v222];
        v420 = 0;
        v419 = 0;
        v421 = 0;
        v227 = *v225;
        v226 = v225[1];
        v228 = v226 - v227;
        if (v226 == v227)
        {
          v224 = 0;
          v229 = v435;
          if (!v435)
            goto LABEL_234;
        }
        else
        {
          if (v228 < 0)
            sub_1BE61F930();
          v224 = (char *)operator new(v226 - v227);
          v419 = v224;
          v421 = &v224[8 * (v228 >> 3)];
          memcpy(v224, v227, v228);
          v420 = v421;
          v229 = v435;
          if (!v435)
          {
LABEL_234:
            v420 = v224;
            operator delete(v224);
            goto LABEL_235;
          }
        }
        v230 = *(_QWORD *)&v224[8 * v114];
        v231 = &v435;
        v232 = v229;
        do
        {
          v233 = v232;
          v234 = v231;
          v235 = v232[4];
          if (v235 >= v230)
            v231 = (_QWORD **)v232;
          else
            ++v232;
          v232 = (_QWORD *)*v232;
        }
        while (v232);
        if (v231 != &v435)
        {
          if (v235 < v230)
            v233 = v234;
          if (v230 >= v233[4])
            break;
        }
LABEL_233:
        if (v224)
          goto LABEL_234;
LABEL_235:
        ++v222;
        v221 = v443;
        if (v222 >= 0xAAAAAAAAAAAAAAABLL * ((v444 - (char *)v443) >> 3))
          goto LABEL_315;
      }
      do
      {
        while (1)
        {
          v236 = v229;
          v237 = v229[4];
          if (v230 < v237)
            break;
          if (v237 >= v230)
          {
            v251 = v236[5];
            goto LABEL_282;
          }
          v229 = (_QWORD *)v236[1];
          if (!v229)
          {
            v238 = v236 + 1;
            goto LABEL_257;
          }
        }
        v229 = (_QWORD *)*v236;
      }
      while (*v236);
      v238 = v236;
LABEL_257:
      v239 = operator new(0x30uLL);
      v239[4] = v230;
      v239[5] = 0;
      *v239 = 0;
      v239[1] = 0;
      v239[2] = v236;
      *v238 = v239;
      if (*v434)
      {
        v434 = (void **)*v434;
        v239 = (_QWORD *)*v238;
      }
      v240 = v435;
      *((_BYTE *)v239 + 24) = v239 == v435;
      v114 = (unint64_t)v417;
      if (v239 != v240)
      {
        do
        {
          v241 = v239[2];
          if (*(_BYTE *)(v241 + 24))
            break;
          v242 = *(_QWORD **)(v241 + 16);
          v243 = *v242;
          if (*v242 == v241)
          {
            v246 = v242[1];
            if (!v246 || (v247 = *(unsigned __int8 *)(v246 + 24), v244 = (_BYTE *)(v246 + 24), v247))
            {
              if (*(_QWORD **)v241 == v239)
              {
                *(_BYTE *)(v241 + 24) = 1;
                *((_BYTE *)v242 + 24) = 0;
                v250 = *(_QWORD *)(v241 + 8);
                *v242 = v250;
                if (v250)
                  goto LABEL_273;
              }
              else
              {
                v248 = *(uint64_t **)(v241 + 8);
                v249 = *v248;
                *(_QWORD *)(v241 + 8) = *v248;
                if (v249)
                {
                  *(_QWORD *)(v249 + 16) = v241;
                  v242 = *(_QWORD **)(v241 + 16);
                }
                v248[2] = (uint64_t)v242;
                *(_QWORD *)(*(_QWORD *)(v241 + 16) + 8 * (**(_QWORD **)(v241 + 16) != v241)) = v248;
                *v248 = v241;
                *(_QWORD *)(v241 + 16) = v248;
                v242 = (_QWORD *)v248[2];
                v241 = *v242;
                *((_BYTE *)v248 + 24) = 1;
                *((_BYTE *)v242 + 24) = 0;
                v250 = *(_QWORD *)(v241 + 8);
                *v242 = v250;
                if (v250)
LABEL_273:
                  *(_QWORD *)(v250 + 16) = v242;
              }
              *(_QWORD *)(v241 + 16) = v242[2];
              *(_QWORD *)(v242[2] + 8 * (*(_QWORD *)v242[2] != (_QWORD)v242)) = v241;
              *(_QWORD *)(v241 + 8) = v242;
LABEL_280:
              v242[2] = v241;
              break;
            }
          }
          else if (!v243 || (v245 = *(unsigned __int8 *)(v243 + 24), v244 = (_BYTE *)(v243 + 24), v245))
          {
            if (*(_QWORD **)v241 == v239)
            {
              v278 = v239[1];
              *(_QWORD *)v241 = v278;
              if (v278)
              {
                *(_QWORD *)(v278 + 16) = v241;
                v242 = *(_QWORD **)(v241 + 16);
              }
              v239[2] = v242;
              *(_QWORD *)(*(_QWORD *)(v241 + 16) + 8 * (**(_QWORD **)(v241 + 16) != v241)) = v239;
              v239[1] = v241;
              *(_QWORD *)(v241 + 16) = v239;
              v242 = (_QWORD *)v239[2];
              *((_BYTE *)v239 + 24) = 1;
              *((_BYTE *)v242 + 24) = 0;
              v241 = v242[1];
              v252 = *(_QWORD **)v241;
              v242[1] = *(_QWORD *)v241;
              if (v252)
LABEL_278:
                v252[2] = v242;
            }
            else
            {
              *(_BYTE *)(v241 + 24) = 1;
              *((_BYTE *)v242 + 24) = 0;
              v241 = v242[1];
              v252 = *(_QWORD **)v241;
              v242[1] = *(_QWORD *)v241;
              if (v252)
                goto LABEL_278;
            }
            *(_QWORD *)(v241 + 16) = v242[2];
            *(_QWORD *)(v242[2] + 8 * (*(_QWORD *)v242[2] != (_QWORD)v242)) = v241;
            *(_QWORD *)v241 = v242;
            goto LABEL_280;
          }
          *(_BYTE *)(v241 + 24) = 1;
          v239 = v242;
          *((_BYTE *)v242 + 24) = v242 == v240;
          *v244 = 1;
        }
        while (v242 != v240);
      }
      v251 = 0;
      v436 = (uint64_t *)((char *)v436 + 1);
      v224 = v419;
LABEL_282:
      *(_QWORD *)&v224[8 * v114] = v251;
      v253 = v429;
      if ((unint64_t)v429 >= v430)
      {
        v258 = sub_1BE753B30((char **)&v428, v419, (uint64_t)v420);
      }
      else
      {
        *(_QWORD *)v429 = 0;
        *((_QWORD *)v253 + 1) = 0;
        *((_QWORD *)v253 + 2) = 0;
        v254 = v419;
        v255 = v420 - v419;
        if (v420 != v419)
        {
          if (v255 < 0)
            sub_1BE61F930();
          v256 = (char *)operator new(v420 - v419);
          *(_QWORD *)v253 = v256;
          *((_QWORD *)v253 + 1) = v256;
          v257 = &v256[8 * (v255 >> 3)];
          *((_QWORD *)v253 + 2) = v257;
          memcpy(v256, v254, v255);
          *((_QWORD *)v253 + 1) = v257;
        }
        v258 = v253 + 24;
      }
      v429 = v258;
      v259 = v440;
      v260 = v423;
      if ((unint64_t)v423 < v424)
      {
        *(_QWORD *)v423 = *(_QWORD *)&v440[8 * v222];
        v223 = v260 + 8;
        v114 = (unint64_t)v417;
        goto LABEL_232;
      }
      v261 = v422;
      v262 = (v423 - v422) >> 3;
      v263 = v262 + 1;
      if ((unint64_t)(v262 + 1) >> 61)
        sub_1BE61F930();
      v264 = v424 - (_QWORD)v422;
      if ((uint64_t)(v424 - (_QWORD)v422) >> 2 > v263)
        v263 = v264 >> 2;
      if ((unint64_t)v264 >= 0x7FFFFFFFFFFFFFF8)
        v265 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v265 = v263;
      if (v265)
      {
        if (v265 >> 61)
          sub_1BE61F100();
        v266 = operator new(8 * v265);
        v267 = &v266[8 * v262];
        *(_QWORD *)v267 = *(_QWORD *)&v259[8 * v222];
        v223 = v267 + 8;
        v268 = v260 - v261;
        if (v260 != v261)
        {
LABEL_298:
          v269 = v268 - 8;
          v114 = (unint64_t)v417;
          if (v269 < 0x58)
            goto LABEL_436;
          if ((unint64_t)(v261 - v266) < 0x20)
            goto LABEL_436;
          v270 = (v269 >> 3) + 1;
          v271 = 8 * (v270 & 0x3FFFFFFFFFFFFFFCLL);
          v272 = &v260[-v271];
          v267 -= v271;
          v273 = &v266[8 * v262 - 16];
          v274 = v260 - 16;
          v275 = v270 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v276 = *(_OWORD *)v274;
            *(v273 - 1) = *((_OWORD *)v274 - 1);
            *v273 = v276;
            v273 -= 2;
            v274 -= 32;
            v275 -= 4;
          }
          while (v275);
          v260 = v272;
          if (v270 != (v270 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_436:
            do
            {
              v277 = *((_QWORD *)v260 - 1);
              v260 -= 8;
              *((_QWORD *)v267 - 1) = v277;
              v267 -= 8;
            }
            while (v260 != v261);
          }
          v422 = v267;
          v424 = (unint64_t)&v266[8 * v265];
          if (!v261)
            goto LABEL_232;
LABEL_308:
          operator delete(v261);
LABEL_232:
          v423 = v223;
          v224 = v419;
          goto LABEL_233;
        }
      }
      else
      {
        v266 = 0;
        v267 = (char *)(8 * v262);
        *(_QWORD *)(8 * v262) = *(_QWORD *)&v440[8 * v222];
        v223 = (char *)(8 * v262 + 8);
        v268 = v260 - v261;
        if (v260 != v261)
          goto LABEL_298;
      }
      v114 = (unint64_t)v417;
      v422 = v267;
      v424 = (unint64_t)&v266[8 * v265];
      if (v261)
        goto LABEL_308;
      goto LABEL_232;
    }
LABEL_315:
    sub_1BE753D20((uint64_t)&v446, v431, (uint64_t)v432, 0xAAAAAAAAAAAAAAABLL * ((v432 - (char *)v431) >> 3));
    sub_1BE62037C(&v440, v425, v426, (v426 - v425) >> 3);
    sub_1BE753D20((uint64_t)&v443, v428, (uint64_t)v429, 0xAAAAAAAAAAAAAAABLL * ((v429 - (char *)v428) >> 3));
    sub_1BE62037C(&v437, v422, v423, (v423 - v422) >> 3);
    v279 = [CHTokenizedResultColumn alloc];
    v284 = (void *)objc_msgSend_initWithTokenRows_(v279, v280, (uint64_t)v415, v281, v282, v283);
    objc_msgSend_addObject_(v413, v285, (uint64_t)v284, v286, v287, v288);

    if (v422)
      operator delete(v422);
    if (v425)
      operator delete(v425);
    v289 = (char *)v428;
    if (v428)
    {
      v290 = v429;
      v291 = (char *)v428;
      if (v429 != (char *)v428)
      {
        v292 = v429;
        do
        {
          v294 = (void *)*((_QWORD *)v292 - 3);
          v292 -= 24;
          v293 = v294;
          if (v294)
          {
            *((_QWORD *)v290 - 2) = v293;
            operator delete(v293);
          }
          v290 = v292;
        }
        while (v292 != v289);
        v291 = (char *)v428;
      }
      v429 = v289;
      operator delete(v291);
    }
    v295 = (char *)v431;
    if (v431)
    {
      v296 = v432;
      v297 = (char *)v431;
      if (v432 != (char *)v431)
      {
        v298 = v432;
        do
        {
          v300 = (void *)*((_QWORD *)v298 - 3);
          v298 -= 24;
          v299 = v300;
          if (v300)
          {
            *((_QWORD *)v296 - 2) = v299;
            operator delete(v299);
          }
          v296 = v298;
        }
        while (v298 != v295);
        v297 = (char *)v431;
      }
      v432 = v295;
      operator delete(v297);
    }

    sub_1BE62033C((uint64_t)&v434, v435);
    ++v114;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v115, v116, v117, v118, v119);
  v417 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v301, v302, v303, v304, v305);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1BE7535F0((char ***)&v446, (uint64_t)v447, v443, (uint64_t)v444, 0xAAAAAAAAAAAAAAABLL * ((v444 - (char *)v443) >> 3));
  v312 = v437;
  v313 = v438 - v437;
  if (v438 - v437 >= 1)
  {
    v314 = v313 >> 3;
    v316 = (unint64_t)v440;
    v315 = v441;
    v317 = v441 - v440;
    v318 = (v441 - v440) >> 3;
    v307 = (char *)(v316 + ((unint64_t)&v441[-v316] & 0xFFFFFFFFFFFFFFF8));
    if (v313 >> 3 > (uint64_t)(v442 - (_QWORD)v441) >> 3)
    {
      v319 = v318 + v314;
      if ((unint64_t)(v318 + v314) >> 61)
        sub_1BE61F930();
      v320 = v442 - (_QWORD)v440;
      if ((uint64_t)(v442 - (_QWORD)v440) >> 2 > v319)
        v319 = v320 >> 2;
      if ((unint64_t)v320 >= 0x7FFFFFFFFFFFFFF8)
        v321 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v321 = v319;
      if (v321)
      {
        if (v321 >> 61)
          sub_1BE61F100();
        v322 = operator new(8 * v321);
        v307 = (char *)(v316 + ((unint64_t)&v315[-v316] & 0xFFFFFFFFFFFFFFF8));
        v318 = (uint64_t)&v315[-v316] >> 3;
        v323 = &v322[8 * v318];
        v324 = &v323[8 * v314];
        v325 = v313 - 8;
        if ((unint64_t)(v313 - 8) < 0x38)
          goto LABEL_347;
      }
      else
      {
        v322 = 0;
        v323 = (char *)(8 * v318);
        v324 = (char *)(8 * v318 + 8 * v314);
        v325 = v313 - 8;
        if ((unint64_t)(v313 - 8) < 0x38)
        {
LABEL_347:
          v326 = v323;
          goto LABEL_364;
        }
      }
      v326 = v323;
      if ((unint64_t)(&v322[v317 & 0xFFFFFFFFFFFFFFF8] - v312) >= 0x20)
      {
        v340 = (v325 >> 3) + 1;
        v341 = 8 * (v340 & 0x3FFFFFFFFFFFFFFCLL);
        v326 = &v323[v341];
        v342 = &v312[v341];
        v343 = (__int128 *)(v312 + 16);
        v344 = &v322[8 * v318 + 16];
        v345 = v340 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v346 = *v343;
          *(v344 - 1) = *(v343 - 1);
          *v344 = v346;
          v343 += 2;
          v344 += 2;
          v345 -= 4;
        }
        while (v345);
        v312 = v342;
        if (v340 == (v340 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_365:
          if ((char *)v316 != v315)
          {
            if ((unint64_t)(v317 - 8) >= 0x68)
            {
              v348 = v307;
              if ((v317 & 0xFFFFFFFFFFFFFFF8) + v316 - (unint64_t)&v322[v317 & 0xFFFFFFFFFFFFFFF8] >= 0x20)
              {
                v349 = ((unint64_t)(v317 - 8) >> 3) + 1;
                v350 = 8 * (v349 & 0x3FFFFFFFFFFFFFFCLL);
                v348 = &v307[-v350];
                v323 -= v350;
                v351 = 8 * v318 - 16;
                v352 = &v322[v351];
                v353 = (__int128 *)(v316 + v351);
                v354 = v349 & 0x3FFFFFFFFFFFFFFCLL;
                do
                {
                  v355 = *v353;
                  *(v352 - 1) = *(v353 - 1);
                  *v352 = v355;
                  v352 -= 2;
                  v353 -= 2;
                  v354 -= 4;
                }
                while (v354);
                if (v349 == (v349 & 0x3FFFFFFFFFFFFFFCLL))
                  goto LABEL_373;
              }
            }
            else
            {
              v348 = v307;
            }
            do
            {
              v356 = *((_QWORD *)v348 - 1);
              v348 -= 8;
              *((_QWORD *)v323 - 1) = v356;
              v323 -= 8;
            }
            while (v348 != (char *)v316);
          }
LABEL_373:
          v357 = &v322[8 * v321];
          v358 = v315 - v307;
          if (v358)
            memmove(v324, v307, v358);
          v440 = v323;
          v441 = &v324[v358];
          v442 = (unint64_t)v357;
          if (v316)
            operator delete((void *)v316);
          goto LABEL_386;
        }
      }
      do
      {
LABEL_364:
        v347 = *(_QWORD *)v312;
        v312 += 8;
        *(_QWORD *)v326 = v347;
        v326 += 8;
      }
      while (v326 != v324);
      goto LABEL_365;
    }
    v327 = v441 - v307;
    v328 = (v441 - v307) >> 3;
    if (v328 >= v314)
    {
      v329 = &v437[8 * v314];
      v331 = v441;
    }
    else
    {
      v329 = &v437[8 * v328];
      v330 = v438 - v329;
      if (v438 != v329)
      {
        v415 = &v440[(v441 - v440) & 0xFFFFFFFFFFFFFFF8];
        memmove(v441, &v437[8 * v328], v330);
        v318 = (uint64_t)&v315[-v316] >> 3;
        v307 = v415;
      }
      v331 = &v315[v330];
      v441 = &v315[v330];
      if (v327 < 1)
        goto LABEL_386;
    }
    v332 = &v307[8 * v314];
    v333 = v331 - v332;
    v334 = (v331 - v332) >> 3;
    v335 = &v331[-8 * v314];
    v336 = v331;
    if (v335 < v315)
    {
      v337 = (v317 & 0xFFFFFFFFFFFFFFF8) + v333;
      v338 = v337 + v316 + 8;
      if ((unint64_t)v315 > v338)
        v338 = (unint64_t)v315;
      v339 = v338 + ~v316 - v337;
      if (v339 >= 0x58)
      {
        v336 = v331;
        if ((unint64_t)&v332[-(v317 & 0xFFFFFFFFFFFFFFF8) - v316] >= 0x20)
        {
          v359 = (v339 >> 3) + 1;
          v360 = 8 * (v359 & 0x3FFFFFFFFFFFFFFCLL);
          v335 += v360;
          v336 = &v331[v360];
          v361 = v331 + 16;
          v362 = (__int128 *)(8 * v334 + 8 * v318 + v316 + 16);
          v363 = v359 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v364 = *v362;
            *(v361 - 1) = *(v362 - 1);
            *v361 = v364;
            v361 += 2;
            v362 += 2;
            v363 -= 4;
          }
          while (v363);
          if (v359 == (v359 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_382;
        }
      }
      else
      {
        v336 = v331;
      }
      do
      {
        v365 = *(_QWORD *)v335;
        v335 += 8;
        *(_QWORD *)v336 = v365;
        v336 += 8;
      }
      while (v335 < v315);
    }
LABEL_382:
    v441 = v336;
    if (v331 != v332)
    {
      v366 = v307;
      memmove(&v331[-8 * v334], v307, v333);
      v307 = v366;
    }
    v308 = v329 - v312;
    if (v329 != v312)
      memmove(v307, v312, v308);
  }
LABEL_386:
  if (v447 != v446)
  {
    v367 = 0;
    do
    {
      v368 = objc_msgSend_count(*(void **)((char *)&v418->super.super.super.isa + v416), v307, v308, v309, v310, v311);
      MEMORY[0x1E0C80A78](v368);
      v375 = (char *)&v413 - ((v374 + 15) & 0xFFFFFFFFFFFFFFF0);
      for (i = 0;
            i < objc_msgSend_count(*(void **)((char *)&v418->super.super.super.isa + v416), v369, v370, v371, v372, v373);
            ++i)
      {
        *(_QWORD *)&v375[8 * i] = *(_QWORD *)(*(_QWORD *)&v446[24 * v367] + 8 * i);
      }
      v377 = (void *)MEMORY[0x1E0CB36B0];
      v378 = objc_msgSend_count(*(void **)((char *)&v418->super.super.super.isa + v416), v369, v370, v371, v372, v373);
      objc_msgSend_indexPathWithIndexes_length_(v377, v379, (uint64_t)v375, v378, v380, v381);
      v382 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v417, v383, (uint64_t)v382, v384, v385, v386);

      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v387, v388, v389, v390, v391, *(double *)&v440[8 * v367]);
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v306, v393, (uint64_t)v392, v394, v395, v396);

      ++v367;
    }
    while (v367 < 0xAAAAAAAAAAAAAAABLL * ((v447 - v446) >> 3));
  }
  v397 = v418;
  objc_msgSend_setTokenColumns_(v418, v307, (uint64_t)v413, v309, v310, v311);
  objc_msgSend_setTranscriptionPaths_scores_(v397, v398, (uint64_t)v417, (uint64_t)v306, v399, v400);

  if (v437)
  {
    v438 = v437;
    operator delete(v437);
  }
  if (v440)
  {
    v441 = v440;
    operator delete(v440);
  }
  v401 = (char *)v443;
  if (v443)
  {
    v402 = v444;
    v403 = (char *)v443;
    if (v444 != (char *)v443)
    {
      v404 = v444;
      do
      {
        v406 = (void *)*((_QWORD *)v404 - 3);
        v404 -= 24;
        v405 = v406;
        if (v406)
        {
          *((_QWORD *)v402 - 2) = v405;
          operator delete(v405);
        }
        v402 = v404;
      }
      while (v404 != v401);
      v403 = (char *)v443;
    }
    v444 = v401;
    operator delete(v403);
  }
  v407 = v446;
  if (v446)
  {
    v408 = v447;
    v409 = v446;
    if (v447 != v446)
    {
      v410 = v447;
      do
      {
        v412 = (void *)*((_QWORD *)v410 - 3);
        v410 -= 24;
        v411 = v412;
        if (v412)
        {
          *((_QWORD *)v408 - 2) = v411;
          operator delete(v411);
        }
        v408 = v410;
      }
      while (v410 != v407);
      v409 = v446;
    }
    v447 = v407;
    operator delete(v409);
  }

}

- (void)filterCandidatesWithOutOfPattern:(BOOL)a3 duplicateTokenIDs:(BOOL)a4 keepOutOfLexiconAlternatives:(BOOL)a5 keepAlternativeLengths:(BOOL)a6 keepSubstrings:(BOOL)a7 shouldKeepOriginalSpelling:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t *p_transcriptionPaths;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CHMutableTokenizedTextResult *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CHMutableTokenizedResultColumn *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __CFString *v73;
  void *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  BOOL v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  __CFString *v124;
  void *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char v155;
  int v156;
  int v157;
  int v158;
  uint64_t v159;
  void *v160;
  int isTopOriginal;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  double v172;
  _BOOL4 v173;
  BOOL v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  int isTransliterated;
  void *v181;
  unsigned int v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  int v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  int v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  NSIndexPath *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  _BOOL4 v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  unint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  _BOOL4 v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  int v277;
  void *v278;
  void *v280;
  void *v281;
  _BOOL4 v282;
  uint64_t v283;
  _BOOL4 v284;
  _BOOL4 v285;
  int v286;
  _BOOL4 v287;
  uint64_t v288;
  void *v289;
  void *v290;
  unint64_t i;
  void *v292;
  id obj;
  void *v294;
  unint64_t v295;
  void *v296;
  unint64_t v297;
  __CFString *v298;
  void *v299;
  id v300;
  id v301;
  uint64_t v302;
  uint64_t v303;
  unint64_t v304;
  unint64_t v305;
  unint64_t v306;
  unint64_t v307;
  __CFString *v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  _BYTE v321[128];
  _BYTE v322[128];
  _BYTE v323[128];
  uint64_t v324;

  v287 = a8;
  v8 = a7;
  v284 = a6;
  v285 = a3;
  v282 = a5;
  v9 = a4;
  v324 = *MEMORY[0x1E0C80C00];
  p_transcriptionPaths = (uint64_t *)&self->super._transcriptionPaths;
  objc_msgSend_firstObject(self->super._transcriptionPaths, a2, a3, a4, a5, a6);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99DE8], v11, *p_transcriptionPaths, v12, v13, v14);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = self;
  objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99DE8], v16, (uint64_t)self->super._transcriptionPathScores, v17, v18, v19);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v20, v21, v22, v23, v24);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  v295 = 0;
  v286 = !v9;
  v277 = !v8;
LABEL_2:
  if (v295 < objc_msgSend_count(v15->super._tokenColumns, v25, v26, v27, v28, v29))
  {
    objc_msgSend_objectAtIndex_(v15->super._tokenColumns, v30, v295, v31, v32, v33);
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = [CHMutableTokenizedResultColumn alloc];
    v294 = (void *)objc_msgSend_initWithTokenRows_(v34, v35, MEMORY[0x1E0C9AA60], v36, v37, v38);
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v39, v40, v41, v42, v43);
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    v288 = objc_msgSend_indexAtPosition_(v280, v44, v295, v45, v46, v47);
    objc_msgSend_textTokenRows(v290, v48, v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v53, v54, v288, v55, v56, v57);
    v281 = (void *)objc_claimAutoreleasedReturnValue();

    v283 = objc_msgSend_count(v281, v58, v59, v60, v61, v62);
    v319 = 0u;
    v320 = 0u;
    v317 = 0u;
    v318 = 0u;
    obj = v281;
    v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v317, (uint64_t)v323, 16, v64);
    if (v70)
    {
      v71 = *(_QWORD *)v318;
      LOBYTE(v297) = 1;
      v298 = &stru_1E77F6F28;
      do
      {
        v72 = 0;
        v73 = v298;
        do
        {
          if (*(_QWORD *)v318 != v71)
            objc_enumerationMutation(obj);
          v74 = *(void **)(*((_QWORD *)&v317 + 1) + 8 * v72);
          if ((v297 & 1) != 0)
            v297 = ((unint64_t)objc_msgSend_properties(*(void **)(*((_QWORD *)&v317 + 1) + 8 * v72), v65, v66, v67, v68, v69) >> 2) & 1;
          else
            LODWORD(v297) = 0;
          objc_msgSend_string(v74, v65, v66, v67, v68, v69);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_length(v75, v76, v77, v78, v79, v80);

          objc_msgSend_string(v74, v81, v82, v83, v84, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingString_(v73, v87, (uint64_t)v86, v88, v89, v90);
          v298 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v72;
          v73 = v298;
        }
        while (v70 != v72);
        v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v65, (uint64_t)&v317, (uint64_t)v323, 16, v69);
      }
      while (v70);
    }
    else
    {
      LODWORD(v297) = 1;
      v298 = &stru_1E77F6F28;
    }

    for (i = 0; ; ++i)
    {
      objc_msgSend_textTokenRows(v290, v91, v92, v93, v94, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = i < objc_msgSend_count(v96, v97, v98, v99, v100, v101);

      if (!v102)
      {
        objc_msgSend_addObject_(v278, v103, (uint64_t)v294, v105, v106, v107);

        ++v295;
        v15 = self;
        goto LABEL_2;
      }
      objc_msgSend_textTokenRows(v290, v103, v104, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v108, v109, i, v110, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();

      v315 = 0u;
      v316 = 0u;
      v313 = 0u;
      v314 = 0u;
      v301 = v113;
      v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v301, v114, (uint64_t)&v313, (uint64_t)v322, 16, v115);
      if (!v121)
      {
        LODWORD(v306) = 0;
        LODWORD(v307) = 0;
        LODWORD(v304) = 1;
        LODWORD(v305) = 1;
        v308 = &stru_1E77F6F28;
        goto LABEL_35;
      }
      LOBYTE(v306) = 0;
      LOBYTE(v307) = 0;
      v122 = *(_QWORD *)v314;
      LOBYTE(v304) = 1;
      LOBYTE(v305) = 1;
      v308 = &stru_1E77F6F28;
      do
      {
        v123 = 0;
        v124 = v308;
        do
        {
          if (*(_QWORD *)v314 != v122)
            objc_enumerationMutation(v301);
          v125 = *(void **)(*((_QWORD *)&v313 + 1) + 8 * v123);
          if ((v307 & 1) != 0)
          {
            LODWORD(v307) = 1;
            if ((v306 & 1) != 0)
              goto LABEL_24;
          }
          else
          {
            v307 = ((unint64_t)objc_msgSend_properties(*(void **)(*((_QWORD *)&v313 + 1) + 8 * v123), v116, v117, v118, v119, v120) >> 4) & 1;
            if ((v306 & 1) != 0)
            {
LABEL_24:
              LODWORD(v306) = 1;
              if ((v304 & 1) != 0)
                goto LABEL_25;
              goto LABEL_29;
            }
          }
          v306 = ((unint64_t)objc_msgSend_inputSources(v125, v116, v117, v118, v119, v120) >> 4) & 1;
          if ((v304 & 1) != 0)
          {
LABEL_25:
            v304 = ((unint64_t)objc_msgSend_properties(v125, v116, v117, v118, v119, v120) >> 2) & 1;
            if ((v305 & 1) == 0)
              goto LABEL_26;
            goto LABEL_30;
          }
LABEL_29:
          LODWORD(v304) = 0;
          if ((v305 & 1) == 0)
          {
LABEL_26:
            LODWORD(v305) = 0;
            goto LABEL_31;
          }
LABEL_30:
          v305 = ((unint64_t)objc_msgSend_properties(v125, v116, v117, v118, v119, v120) >> 3) & 1;
LABEL_31:
          objc_msgSend_string(v125, v116, v117, v118, v119, v120);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_length(v126, v127, v128, v129, v130, v131);

          objc_msgSend_string(v125, v132, v133, v134, v135, v136);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingString_(v124, v138, (uint64_t)v137, v139, v140, v141);
          v308 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v123;
          v124 = v308;
        }
        while (v121 != v123);
        v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v301, v116, (uint64_t)&v313, (uint64_t)v322, 16, v120);
      }
      while (v121);
LABEL_35:

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v142, v143, v144, v145, v146);
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      v311 = 0u;
      v312 = 0u;
      v309 = 0u;
      v310 = 0u;
      v300 = v301;
      v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(v300, v147, (uint64_t)&v309, (uint64_t)v321, 16, v148);
      if (!v149)
      {

        v156 = 0;
        v158 = 1;
        v157 = 1;
LABEL_50:
        v197 = objc_msgSend_containsObject_(v289, v192, (uint64_t)v299, v194, v195, v196);
        objc_msgSend_addObject_(v289, v198, (uint64_t)v299, v199, v200, v201);
        goto LABEL_51;
      }
      v155 = 0;
      v156 = 0;
      v302 = *(_QWORD *)v310;
      v157 = 1;
      v158 = 1;
      do
      {
        v159 = 0;
        v303 = v149;
        do
        {
          if (*(_QWORD *)v310 != v302)
            objc_enumerationMutation(v300);
          v160 = *(void **)(*((_QWORD *)&v309 + 1) + 8 * v159);
          isTopOriginal = objc_msgSend_isTopOriginal(v160, v150, v151, v152, v153, v154);
          if (objc_msgSend_isOriginal(v160, v162, v163, v164, v165, v166))
          {
            objc_msgSend_modelScore(v160, v167, v168, v169, v170, v171);
            v173 = v172 > 0.8;
          }
          else
          {
            v173 = 0;
          }
          v174 = objc_msgSend_wordID(v160, v167, v168, v169, v170, v171) < 0x1F4;
          isTransliterated = objc_msgSend_isTransliterated(v160, v175, v176, v177, v178, v179);
          v155 |= v174;
          if ((v155 & 1) == 0)
          {
            v181 = (void *)MEMORY[0x1E0CB37E8];
            v182 = objc_msgSend_wordID(v160, v150, v151, v152, v153, v154);
            objc_msgSend_numberWithUnsignedInteger_(v181, v183, v182, v184, v185, v186);
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v299, v188, (uint64_t)v187, v189, v190, v191);

          }
          v157 &= isTopOriginal;
          v158 &= v173;
          v156 |= isTransliterated;
          ++v159;
        }
        while (v303 != v159);
        v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(v300, v150, (uint64_t)&v309, (uint64_t)v321, 16, v154);
      }
      while (v149);

      if ((v155 & 1) == 0)
        goto LABEL_50;
      v197 = 0;
LABEL_51:
      if (i == v288 || ((v157 | v158) & v287 & 1) != 0)
        goto LABEL_65;
      if (((v307 | v306) & 1) != 0 || (v197 & v286 & 1) != 0)
        goto LABEL_66;
      if (((v305 | v285) & v297) != 1)
      {
        if (v305 | v285)
          goto LABEL_59;
LABEL_66:
        v225 = objc_msgSend_count(v296, v192, v193, v194, v195, v196);
        if (v225 - 1 >= 0)
        {
          do
          {
            objc_msgSend_objectAtIndex_(v296, v221, --v225, v222, v223, v224);
            v226 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
            v231 = objc_msgSend_indexAtPosition_(v226, v227, v295, v228, v229, v230);
            objc_msgSend_textTokenRows(v294, v232, v233, v234, v235, v236);
            v237 = (void *)objc_claimAutoreleasedReturnValue();
            v243 = v231 == objc_msgSend_count(v237, v238, v239, v240, v241, v242);

            if (v243)
            {
              objc_msgSend_removeObjectAtIndex_(v296, v244, v225, v245, v246, v247);
              objc_msgSend_removeObjectAtIndex_(v292, v248, v225, v249, v250, v251);
            }
            else
            {
              v252 = objc_msgSend_indexAtPosition_(v226, v244, v295, v245, v246, v247);
              objc_msgSend_textTokenRows(v294, v253, v254, v255, v256, v257);
              v258 = (void *)objc_claimAutoreleasedReturnValue();
              v264 = v252 > objc_msgSend_count(v258, v259, v260, v261, v262, v263);

              if (v264)
              {
                v269 = objc_msgSend_indexAtPosition_(v226, v265, v295, v266, v267, v268);
                modifyIndexPath(v226, v295, v269 - 1);
                v270 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_replaceObjectAtIndex_withObject_(v296, v271, v225, (uint64_t)v270, v272, v273);

              }
            }

          }
          while (v225 > 0);
        }
        goto LABEL_72;
      }
      if (((v304 | v282) & 1) == 0)
        goto LABEL_66;
LABEL_59:
      if (v283 != objc_msgSend_count(v300, v192, v193, v194, v195, v196) && !v284)
        goto LABEL_66;
      v202 = objc_msgSend_length(v308, v192, v193, v194, v195, v196);
      v208 = objc_msgSend_length(v298, v203, v204, v205, v206, v207);
      v209 = v284;
      if ((double)(unint64_t)v208 * 0.75 <= (double)(unint64_t)v202)
        v209 = 1;
      if (((v209 | v156) & 1) == 0
        || (objc_msgSend_containsString_(v298, v192, (uint64_t)v308, v194, v195, v196) & v277 & 1) != 0)
      {
        goto LABEL_66;
      }
LABEL_65:
      objc_msgSend_textTokenRows(v294, v192, v193, v194, v195, v196);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      v216 = objc_msgSend_count(v210, v211, v212, v213, v214, v215);

      if (objc_msgSend_addTokenRowWithTokens_(v294, v217, (uint64_t)v300, v218, v219, v220) != v216)
        goto LABEL_66;
LABEL_72:

    }
  }
  objc_msgSend_setTokenColumns_(v15, v30, (uint64_t)v278, v31, v32, v33);
  objc_msgSend_setTranscriptionPaths_scores_(v15, v274, (uint64_t)v296, (uint64_t)v292, v275, v276);

}

- (void)setPrecedingLineBreaks:(int64_t)a3
{
  self->super._precedingLineBreaks = a3;
}

- (void)setChangeableTokenColumnCount:(int64_t)a3
{
  self->super._changeableCount = a3;
}

- (void)setBaseWritingDirection:(int)a3
{
  *(_QWORD *)&self->super._baseWritingDirection = *(_QWORD *)&a3;
}

- (void)setRecognizerGenerationIdentifier:(int64_t)a3
{
  self->super._recognizerGenerationIdentifier = a3;
}

- (void)offsetAllStrokeIndexesBy:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  NSArray **p_tokenColumns;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t j;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t k;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  BOOL v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
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
  CHTokenizedResultColumn *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  NSArray *tokenColumns;
  NSArray *obj;
  uint64_t v147;
  NSArray *v148;
  uint64_t v149;
  uint64_t i;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99DE8];
  p_tokenColumns = &self->super._tokenColumns;
  v9 = objc_msgSend_count(self->super._tokenColumns, a2, a3, v3, v4, v5);
  objc_msgSend_arrayWithCapacity_(v7, v10, v9, v11, v12, v13);
  v148 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  obj = *p_tokenColumns;
  v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v151, (uint64_t)v155, 16, v15);
  if (v149)
  {
    v147 = *(_QWORD *)v152;
    do
    {
      for (i = 0; i != v149; ++i)
      {
        if (*(_QWORD *)v152 != v147)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend_textTokenRows(v21, v16, v17, v18, v19, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend_count(v23, v24, v25, v26, v27, v28);
        objc_msgSend_arrayWithCapacity_(v22, v30, v29, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        for (j = 0; ; ++j)
        {
          objc_msgSend_textTokenRows(v21, v35, v36, v37, v38, v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = j < objc_msgSend_count(v41, v42, v43, v44, v45, v46);

          if (!v47)
            break;
          v53 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend_textTokenRows(v21, v48, v49, v50, v51, v52);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v54, v55, j, v56, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend_count(v59, v60, v61, v62, v63, v64);
          objc_msgSend_arrayWithCapacity_(v53, v66, v65, v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          for (k = 0; ; ++k)
          {
            objc_msgSend_textTokenRows(v21, v71, v72, v73, v74, v75);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v77, v78, j, v79, v80, v81);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = k < objc_msgSend_count(v82, v83, v84, v85, v86, v87);

            if (!v88)
              break;
            objc_msgSend_textTokenRows(v21, v89, v90, v91, v92, v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v94, v95, j, v96, v97, v98);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v99, v100, k, v101, v102, v103);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = (void *)objc_msgSend_mutableCopy(v104, v105, v106, v107, v108, v109);

            objc_msgSend_strokeIndexes(v110, v111, v112, v113, v114, v115);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v122 = (void *)objc_msgSend_mutableCopy(v116, v117, v118, v119, v120, v121);

            objc_msgSend_shiftIndexesStartingAtIndex_by_(v122, v123, 0, a3, v124, v125);
            objc_msgSend_setStrokeIndexes_(v110, v126, (uint64_t)v122, v127, v128, v129);
            objc_msgSend_addObject_(v70, v130, (uint64_t)v110, v131, v132, v133);

          }
          objc_msgSend_addObject_(v34, v89, (uint64_t)v70, v91, v92, v93);

        }
        v134 = [CHTokenizedResultColumn alloc];
        v139 = (void *)objc_msgSend_initWithTokenRows_(v134, v135, (uint64_t)v34, v136, v137, v138);
        objc_msgSend_addObject_(v148, v140, (uint64_t)v139, v141, v142, v143);

      }
      v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v151, (uint64_t)v155, 16, v20);
    }
    while (v149);
  }

  tokenColumns = self->super._tokenColumns;
  self->super._tokenColumns = v148;

}

- (void)remapAllStrokeIndexesWithIndexSet:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t j;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t k;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  id v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  CHTokenizedResultColumn *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  NSArray *tokenColumns;
  id v164;
  NSArray *obj;
  uint64_t v167;
  NSArray *v168;
  uint64_t v169;
  uint64_t i;
  void *v171;
  _QWORD v172[4];
  id v173;
  id v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _QWORD v179[4];
  id v180;
  _BYTE v181[128];
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E08];
  v164 = v3;
  v10 = objc_msgSend_count(v3, v5, v6, v7, v8, v9);
  objc_msgSend_dictionaryWithCapacity_(v4, v11, v10, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v179[0] = MEMORY[0x1E0C809B0];
  v179[1] = 3221225472;
  v179[2] = sub_1BE752F8C;
  v179[3] = &unk_1E77F2CB8;
  v16 = v15;
  v180 = v16;
  objc_msgSend_enumerateIndexesUsingBlock_(v164, v17, (uint64_t)v179, v18, v19, v20);
  v21 = (void *)MEMORY[0x1E0C99DE8];
  v27 = objc_msgSend_count(self->super._tokenColumns, v22, v23, v24, v25, v26);
  objc_msgSend_arrayWithCapacity_(v21, v28, v27, v29, v30, v31);
  v168 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  obj = self->super._tokenColumns;
  v169 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v175, (uint64_t)v181, 16, v33);
  if (v169)
  {
    v167 = *(_QWORD *)v176;
    do
    {
      for (i = 0; i != v169; ++i)
      {
        if (*(_QWORD *)v176 != v167)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * i);
        v40 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend_textTokenRows(v39, v34, v35, v36, v37, v38);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend_count(v41, v42, v43, v44, v45, v46);
        objc_msgSend_arrayWithCapacity_(v40, v48, v47, v49, v50, v51);
        v171 = (void *)objc_claimAutoreleasedReturnValue();

        for (j = 0; ; ++j)
        {
          objc_msgSend_textTokenRows(v39, v52, v53, v54, v55, v56);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = j < objc_msgSend_count(v58, v59, v60, v61, v62, v63);

          if (!v64)
            break;
          v70 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend_textTokenRows(v39, v65, v66, v67, v68, v69);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v71, v72, j, v73, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend_count(v76, v77, v78, v79, v80, v81);
          objc_msgSend_arrayWithCapacity_(v70, v83, v82, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          for (k = 0; ; ++k)
          {
            objc_msgSend_textTokenRows(v39, v88, v89, v90, v91, v92);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v94, v95, j, v96, v97, v98);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = k < objc_msgSend_count(v99, v100, v101, v102, v103, v104);

            if (!v105)
              break;
            objc_msgSend_textTokenRows(v39, v106, v107, v108, v109, v110);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v111, v112, j, v113, v114, v115);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v116, v117, k, v118, v119, v120);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            v127 = (void *)objc_msgSend_mutableCopy(v121, v122, v123, v124, v125, v126);

            objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v128, v129, v130, v131, v132);
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIndexes(v127, v134, v135, v136, v137, v138);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            v172[0] = MEMORY[0x1E0C809B0];
            v172[1] = 3221225472;
            v172[2] = sub_1BE75303C;
            v172[3] = &unk_1E77F3DD0;
            v140 = v133;
            v173 = v140;
            v174 = v16;
            objc_msgSend_enumerateIndexesUsingBlock_(v139, v141, (uint64_t)v172, v142, v143, v144);

            objc_msgSend_setStrokeIndexes_(v127, v145, (uint64_t)v140, v146, v147, v148);
            objc_msgSend_addObject_(v87, v149, (uint64_t)v127, v150, v151, v152);

          }
          objc_msgSend_addObject_(v171, v106, (uint64_t)v87, v108, v109, v110);

        }
        v153 = [CHTokenizedResultColumn alloc];
        v158 = (void *)objc_msgSend_initWithTokenRows_(v153, v154, (uint64_t)v171, v155, v156, v157);
        objc_msgSend_addObject_(v168, v159, (uint64_t)v158, v160, v161, v162);

      }
      v169 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v175, (uint64_t)v181, 16, v38);
    }
    while (v169);
  }

  tokenColumns = self->super._tokenColumns;
  self->super._tokenColumns = v168;

}

- (void)remapAllStrokeIndexesWithArray:(id)a3
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
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
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t j;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t k;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  BOOL v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
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
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  id v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  CHTokenizedResultColumn *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSArray *tokenColumns;
  CHMutableTokenizedTextResult *v148;
  NSArray *obj;
  uint64_t v150;
  NSArray *v151;
  uint64_t v152;
  uint64_t i;
  void *v154;
  _QWORD v155[4];
  id v156;
  id v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v148 = self;
  v11 = objc_msgSend_count(self->super._tokenColumns, v6, v7, v8, v9, v10);
  objc_msgSend_arrayWithCapacity_(v5, v12, v11, v13, v14, v15);
  v151 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  obj = self->super._tokenColumns;
  v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v158, (uint64_t)v162, 16, v17);
  if (v152)
  {
    v150 = *(_QWORD *)v159;
    do
    {
      for (i = 0; i != v152; ++i)
      {
        if (*(_QWORD *)v159 != v150)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * i);
        v24 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend_textTokenRows(v23, v18, v19, v20, v21, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
        objc_msgSend_arrayWithCapacity_(v24, v32, v31, v33, v34, v35);
        v154 = (void *)objc_claimAutoreleasedReturnValue();

        for (j = 0; ; ++j)
        {
          objc_msgSend_textTokenRows(v23, v36, v37, v38, v39, v40);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = j < objc_msgSend_count(v42, v43, v44, v45, v46, v47);

          if (!v48)
            break;
          v54 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend_textTokenRows(v23, v49, v50, v51, v52, v53);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v55, v56, j, v57, v58, v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend_count(v60, v61, v62, v63, v64, v65);
          objc_msgSend_arrayWithCapacity_(v54, v67, v66, v68, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          for (k = 0; ; ++k)
          {
            objc_msgSend_textTokenRows(v23, v72, v73, v74, v75, v76);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v78, v79, j, v80, v81, v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = k < objc_msgSend_count(v83, v84, v85, v86, v87, v88);

            if (!v89)
              break;
            objc_msgSend_textTokenRows(v23, v90, v91, v92, v93, v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v95, v96, j, v97, v98, v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v100, v101, k, v102, v103, v104);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = (void *)objc_msgSend_mutableCopy(v105, v106, v107, v108, v109, v110);

            objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v112, v113, v114, v115, v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIndexes(v111, v118, v119, v120, v121, v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            v155[0] = MEMORY[0x1E0C809B0];
            v155[1] = 3221225472;
            v155[2] = sub_1BE753594;
            v155[3] = &unk_1E77F3DD0;
            v156 = v4;
            v124 = v117;
            v157 = v124;
            objc_msgSend_enumerateIndexesUsingBlock_(v123, v125, (uint64_t)v155, v126, v127, v128);

            objc_msgSend_setStrokeIndexes_(v111, v129, (uint64_t)v124, v130, v131, v132);
            objc_msgSend_addObject_(v71, v133, (uint64_t)v111, v134, v135, v136);

          }
          objc_msgSend_addObject_(v154, v90, (uint64_t)v71, v92, v93, v94);

        }
        v137 = [CHTokenizedResultColumn alloc];
        v142 = (void *)objc_msgSend_initWithTokenRows_(v137, v138, (uint64_t)v154, v139, v140, v141);
        objc_msgSend_addObject_(v151, v143, (uint64_t)v142, v144, v145, v146);

      }
      v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v158, (uint64_t)v162, 16, v22);
    }
    while (v152);
  }

  tokenColumns = v148->super._tokenColumns;
  v148->super._tokenColumns = v151;

}

@end
