@implementation CHRemoveInvalidStringCandidatesStep

- (id)process:(id)a3 options:(id)a4
{
  id v5;
  NSObject *v6;
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
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
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
  unint64_t i;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
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
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  char *v110;
  char *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t j;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  BOOL v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  unint64_t k;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t m;
  unint64_t n;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  BOOL v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  unint64_t v209;
  unint64_t v210;
  uint64_t v211;
  int64x2_t *v212;
  uint64_t *v213;
  uint64_t v214;
  uint64_t *v215;
  id v216;
  unint64_t v217;
  int64x2_t v218;
  int64x2_t *v219;
  int64x2_t v220;
  int64x2_t v221;
  uint64_t v222;
  unint64_t v223;
  unint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
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
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  CHTokenizedMathResult *v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  id v264;
  id v266;
  void *v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  uint8_t buf[8];
  char *v273;
  char *v274;
  _QWORD v275[4];
  id v276;
  uint8_t *v277;
  _BYTE v278[128];
  uint64_t v279;

  v279 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v266 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveInvalidStringCandidatesStep is running", buf, 2u);
  }

  objc_msgSend_result(v5, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23) == 0;

  if (v24)
  {
    v216 = v5;
    goto LABEL_61;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28, v29);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v5, v30, v31, v32, v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v36, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = i < objc_msgSend_count(v42, v43, v44, v45, v46, v47);

    if (!v48)
      break;
    objc_msgSend_result(v5, v49, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v54, v55, v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v60, v61, i, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v66, v67, v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v72, v73, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v78, v79, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend_tokenColumnCount(v83, v84, v85, v86, v87, v88);
    v275[0] = MEMORY[0x1E0C809B0];
    v275[1] = 3221225472;
    v275[2] = sub_1BE6170E4;
    v275[3] = &unk_1E77F1EC8;
    v90 = v71;
    v276 = v90;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v77, v91, (uint64_t)v65, 0, v89, (uint64_t)v275);

    objc_msgSend_addObject_(v267, v92, (uint64_t)v90, v93, v94, v95);
  }
  objc_msgSend_result(v5, v49, v50, v51, v52, v53);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v96, v97, v98, v99, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend_count(v102, v103, v104, v105, v106, v107);
  v109 = v108;
  *(_QWORD *)buf = 0;
  v273 = 0;
  v274 = 0;
  if (v108)
  {
    if (v108 >> 61)
      sub_1BE61F930();
    v110 = (char *)operator new(8 * v108);
    v111 = &v110[8 * v109];
    *(_QWORD *)buf = v110;
    v274 = v111;
    bzero(v110, 8 * v109);
    v273 = v111;
  }

  for (j = 0; ; ++j)
  {
    objc_msgSend_result(v5, v112, v113, v114, v115, v116);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = j < objc_msgSend_tokenColumnCount(v118, v119, v120, v121, v122, v123);

    if (!v124)
      break;
    objc_msgSend_result(v5, v125, v126, v127, v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenRowsAtColumnIndex_(v130, v131, j, v132, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend_count(v135, v136, v137, v138, v139, v140) >= 2)
    {
      objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v141, v142, v143, v144, v145);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      for (k = 0; k < objc_msgSend_count(v135, v146, v147, v148, v149, v150); ++k)
      {
        v270 = 0u;
        v271 = 0u;
        v268 = 0u;
        v269 = 0u;
        objc_msgSend_objectAtIndexedSubscript_(v135, v153, k, v155, v156, v157);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v159, (uint64_t)&v268, (uint64_t)v278, 16, v160);
        if (v166)
        {
          v167 = *(_QWORD *)v269;
          while (2)
          {
            for (m = 0; m != v166; ++m)
            {
              if (*(_QWORD *)v269 != v167)
                objc_enumerationMutation(v158);
              if (!objc_msgSend_properties(*(void **)(*((_QWORD *)&v268 + 1) + 8 * m), v161, v162, v163, v164, v165))
              {
                objc_msgSend_addIndex_(v151, v161, k, v163, v164, v165);
                goto LABEL_27;
              }
            }
            v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v161, (uint64_t)&v268, (uint64_t)v278, 16, v165);
            if (v166)
              continue;
            break;
          }
        }
LABEL_27:

      }
      for (n = 0; ; ++n)
      {
        objc_msgSend_result(v5, v153, v154, v155, v156, v157);
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPaths(v170, v171, v172, v173, v174, v175);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        v182 = n < objc_msgSend_count(v176, v177, v178, v179, v180, v181);

        if (!v182)
          break;
        objc_msgSend_result(v5, v183, v184, v185, v186, v187);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPaths(v188, v189, v190, v191, v192, v193);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v194, v195, n, v196, v197, v198);
        v199 = (void *)objc_claimAutoreleasedReturnValue();

        v204 = objc_msgSend_indexAtPosition_(v199, v200, j, v201, v202, v203);
        if (objc_msgSend_containsIndex_(v151, v205, v204, v206, v207, v208))
          ++*(_QWORD *)(*(_QWORD *)buf + 8 * n);

      }
    }

  }
  v209 = objc_msgSend_count(v267, v125, v126, v127, v128, v129);
  v210 = v209;
  if (!v209)
  {
    v212 = 0;
    v213 = 0;
    goto LABEL_45;
  }
  if (v209 >> 61)
    sub_1BE61F930();
  v211 = 8 * v209;
  v212 = (int64x2_t *)operator new(8 * v209);
  bzero(v212, 8 * v210);
  v213 = &v212->i64[(unint64_t)v211 / 8];
  if ((unint64_t)(v211 - 8) < 0x18)
  {
    v214 = 0;
    v215 = (uint64_t *)v212;
    do
LABEL_44:
      *v215++ = v214++;
    while (v215 != v213);
    goto LABEL_45;
  }
  v217 = ((unint64_t)(v211 - 8) >> 3) + 1;
  v214 = v217 & 0x3FFFFFFFFFFFFFFCLL;
  v215 = &v212->i64[v217 & 0x3FFFFFFFFFFFFFFCLL];
  v218 = (int64x2_t)xmmword_1BE8D5080;
  v219 = v212 + 1;
  v220 = vdupq_n_s64(2uLL);
  v221 = vdupq_n_s64(4uLL);
  v222 = v217 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v219[-1] = v218;
    *v219 = vaddq_s64(v218, v220);
    v218 = vaddq_s64(v218, v221);
    v219 += 2;
    v222 -= 4;
  }
  while (v222);
  if (v217 != v214)
    goto LABEL_44;
LABEL_45:
  v277 = buf;
  v223 = ((char *)v213 - (char *)v212) >> 3;
  v224 = 126 - 2 * __clz(v223);
  if (v210)
    v225 = v224;
  else
    v225 = 0;
  sub_1BE621250((uint64_t)v212, v213, (uint64_t **)&v277, v225, 1);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v226, v227, v228, v229, v230);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v267, v232, v233, v234, v235, v236);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v231, v238, (uint64_t)v237, v239, v240, v241);

  if (v210)
  {
    if (v223 <= 1)
      v223 = 1;
    v246 = (uint64_t *)v212;
    do
    {
      v248 = *v246++;
      v247 = v248;
      if (v248)
      {
        if (*(_QWORD *)(*(_QWORD *)buf + 8 * v247) > **(_QWORD **)buf)
          break;
        objc_msgSend_objectAtIndexedSubscript_(v267, v242, v247, v243, v244, v245);
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v231, v250, (uint64_t)v249, v251, v252, v253);

      }
      --v223;
    }
    while (v223);
  }
  v254 = [CHTokenizedMathResult alloc];
  v259 = (void *)objc_msgSend_initWithBestPathTokens_(v254, v255, (uint64_t)v231, v256, v257, v258);
  objc_msgSend_setResult_(v5, v260, (uint64_t)v259, v261, v262, v263);

  v264 = v5;
  if (v212)
    operator delete(v212);
  if (*(_QWORD *)buf)
  {
    v273 = *(char **)buf;
    operator delete(*(void **)buf);
  }

LABEL_61:
  return v5;
}

@end
