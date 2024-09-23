@implementation CHPruneCandidatesComparingColumnScoresStep

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
  unint64_t v48;
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
  uint64_t v96;
  uint64_t j;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
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
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  double v149;
  double v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  double v159;
  double v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  CHTokenizedMathResult *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  id v191;
  void *v192;
  _QWORD v193[4];
  id v194;
  uint8_t buf[16];

  v5 = a3;
  v191 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHPruneCandidatesComparingColumnScoresStep is running", buf, 2u);
  }

  objc_msgSend_result(v5, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);

  if (v24)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28, v29);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; ++i)
    {
      objc_msgSend_result(v5, v30, v31, v32, v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v36, v37, v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_count(v42, v43, v44, v45, v46, v47);

      if (i >= v48)
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
      v193[0] = MEMORY[0x1E0C809B0];
      v193[1] = 3221225472;
      v193[2] = sub_1BE617DC0;
      v193[3] = &unk_1E77F1EC8;
      v90 = v71;
      v194 = v90;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v77, v91, (uint64_t)v65, 0, v89, (uint64_t)v193);

      if (i)
      {
        for (j = 0; ; ++j)
        {
          objc_msgSend_result(v5, v92, v93, v94, v95, v96);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = objc_msgSend_tokenColumnCount(v98, v99, v100, v101, v102, v103);

          if (j >= v104)
            break;
          objc_msgSend_result(v5, v92, v105, v94, v95, v96);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_transcriptionPaths(v106, v107, v108, v109, v110, v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v112, v113, v114, v115, v116, v117);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = objc_msgSend_indexAtPosition_(v118, v119, j, v120, v121, v122);

          if (objc_msgSend_indexAtPosition_(v65, v124, j, v125, v126, v127) != v123)
          {
            objc_msgSend_result(v5, v92, v93, v94, v95, v96);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_result(v5, v129, v130, v131, v132, v133);
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_transcriptionPaths(v134, v135, v136, v137, v138, v139);
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_firstObject(v140, v141, v142, v143, v144, v145);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_geometricMeanTokenScoreForColumnRange_transcriptionPath_(v128, v147, j, 1, (uint64_t)v146, v148);
            v150 = v149;

            objc_msgSend_result(v5, v151, v152, v153, v154, v155);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_geometricMeanTokenScoreForColumnRange_transcriptionPath_(v156, v157, j, 1, (uint64_t)v65, v158);
            v160 = v159;

            if (v160 < v150 * 0.05)
              goto LABEL_8;
          }
        }
      }
      objc_msgSend_addObject_(v192, v92, (uint64_t)v90, v94, v95, v96);
LABEL_8:

    }
    v161 = objc_msgSend_count(v192, v49, v50, v51, v52, v53);
    objc_msgSend_result(v5, v162, v163, v164, v165, v166);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v167, v168, v169, v170, v171, v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = objc_msgSend_count(v173, v174, v175, v176, v177, v178);

    if (v161 != v179)
    {
      v180 = [CHTokenizedMathResult alloc];
      v185 = (void *)objc_msgSend_initWithBestPathTokens_(v180, v181, (uint64_t)v192, v182, v183, v184);
      objc_msgSend_setResult_(v5, v186, (uint64_t)v185, v187, v188, v189);

    }
  }

  return v5;
}

@end
