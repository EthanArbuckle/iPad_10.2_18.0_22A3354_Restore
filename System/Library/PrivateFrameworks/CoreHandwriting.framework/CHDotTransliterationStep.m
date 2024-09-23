@implementation CHDotTransliterationStep

- (id)process:(id)a3 options:(id)a4
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  const char *v69;
  uint64_t i;
  const char *v71;
  uint64_t v72;
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
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
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
  int isEqualToString;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  CHTokenizedMathResultToken *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  double v161;
  double v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  double v170;
  double v171;
  double v172;
  double v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  CHTokenizedMathResult *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  id v194;
  void *v195;
  void *v196;
  void *v197;
  id v198;
  unint64_t v199;
  unsigned int v200;
  unint64_t v201;
  _QWORD v202[4];
  id v203;
  uint8_t buf[16];

  v198 = a3;
  v194 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEBUG, "CHDotTransliterationStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8, v9, v10);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v199 = 0;
LABEL_6:
  objc_msgSend_result(v198, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_count(v22, v23, v24, v25, v26, v27);

  if (v199 < v28)
  {
    objc_msgSend_result(v198, v29, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v34, v35, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v40, v41, v199, v42, v43, v44);
    v197 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v45, v46, v47, v48, v49);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v198, v50, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v198, v56, v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend_tokenColumnCount(v61, v62, v63, v64, v65, v66);
    v202[0] = MEMORY[0x1E0C809B0];
    v202[1] = 3221225472;
    v202[2] = sub_1BE6183D8;
    v202[3] = &unk_1E77F1EC8;
    v68 = v196;
    v203 = v68;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v55, v69, (uint64_t)v197, 0, v67, (uint64_t)v202);
    for (i = -1; ; ++i)
    {

      if (i + 2 >= (unint64_t)(objc_msgSend_count(v68, v71, v72, v73, v74, v75) - 1))
      {
        objc_msgSend_addObject_(v195, v76, (uint64_t)v68, v77, v78, v79);

        ++v199;
        goto LABEL_6;
      }
      objc_msgSend_objectAtIndexedSubscript_(v68, v76, i + 2, v77, v78, v79);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v68, v80, i + 1, v81, v82, v83);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v68, v84, i + 3, v85, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v55, v89, v90, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v94, v95, (uint64_t)CFSTR("."), v96, v97, v98);

      if (isEqualToString)
      {
        v200 = objc_msgSend_properties(v61, v100, v101, v102, v103, v104);
        if ((objc_msgSend_properties(v61, v105, v106, v107, v108, v109) & 8) != 0
          || (objc_msgSend_properties(v61, v110, v111, v112, v113, v114) & 0x800) != 0
          || (objc_msgSend_properties(v61, v110, v111, v112, v113, v114) & 0x100) != 0)
        {
          LOBYTE(v201) = 1;
        }
        else if ((objc_msgSend_properties(v61, v110, v111, v112, v113, v114) & 1) != 0)
        {
          objc_msgSend_string(v61, v110, v111, v112, v113, v114);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v201) = objc_msgSend_isEqualToString_(v178, v179, (uint64_t)CFSTR("}"), v180, v181, v182) ^ 1;

        }
        else
        {
          LOBYTE(v201) = 0;
        }
        v115 = objc_msgSend_properties(v88, v110, v111, v112, v113, v114);
        if ((objc_msgSend_properties(v88, v116, v117, v118, v119, v120) & 8) != 0
          || (objc_msgSend_properties(v88, v121, v122, v123, v124, v125) & 0x1000) != 0
          || (objc_msgSend_properties(v88, v121, v122, v123, v124, v125) & 0x2000) != 0
          || (objc_msgSend_properties(v88, v121, v122, v123, v124, v125) & 0x40) != 0)
        {
          v131 = 1;
        }
        else
        {
          objc_msgSend_string(v88, v121, v122, v123, v124, v125);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = objc_msgSend_isEqualToString_(v126, v127, (uint64_t)CFSTR("}"), v128, v129, v130);

        }
        objc_msgSend_string(v61, v121, v122, v123, v124, v125);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = objc_msgSend_isEqualToString_(v132, v133, (uint64_t)CFSTR("}"), v134, v135, v136);

        v142 = v137 ^ 1;
        if ((unint64_t)(i + 2) < 2)
          v142 = 1;
        if ((v142 & 1) == 0)
        {
          if ((v201 & 1) != 0)
            goto LABEL_8;
          objc_msgSend_objectAtIndexedSubscript_(v68, v138, i, v139, v140, v141);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v201 = ((unint64_t)objc_msgSend_properties(v143, v144, v145, v146, v147, v148) >> 8) & 1;

        }
        if (!((v115 >> 1) & 1 & (v200 >> 1) | (v201 | v131) & 1))
        {
          v149 = [CHTokenizedMathResultToken alloc];
          objc_msgSend_strokeIndexes(v55, v150, v151, v152, v153, v154);
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_score(v55, v156, v157, v158, v159, v160);
          v162 = v161;
          objc_msgSend_bounds(v55, v163, v164, v165, v166, v167);
          v174 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v149, v168, (uint64_t)CFSTR("\\cdot"), (uint64_t)v155, 8, v169, v162, v170, v171, v172, v173);

          objc_msgSend_setObject_atIndexedSubscript_(v68, v175, (uint64_t)v174, i + 2, v176, v177);
        }
      }
LABEL_8:

    }
  }
  v183 = [CHTokenizedMathResult alloc];
  v188 = (void *)objc_msgSend_initWithBestPathTokens_(v183, v184, (uint64_t)v195, v185, v186, v187);
  objc_msgSend_setResult_(v198, v189, (uint64_t)v188, v190, v191, v192);

  return v198;
}

@end
