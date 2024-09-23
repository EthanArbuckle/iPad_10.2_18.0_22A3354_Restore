@implementation CHRemoveInvalidSegmentationCandidatesStep

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
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
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
  uint64_t v52;
  void *v53;
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
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t i;
  void *v102;
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
  uint64_t v113;
  unint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  id v151;
  const char *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  CHTokenizedMathResult *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  id v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  void (*v191)(uint64_t, void *);
  void *v192;
  id v193;
  uint8_t *v194;
  uint64_t *v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  char v199;
  uint8_t buf[8];
  uint8_t *v201;
  uint64_t v202;
  uint64_t v203;

  v5 = a3;
  v187 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveInvalidSegmentationCandidatesStep is running", buf, 2u);
  }

  objc_msgSend_result(v5, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);

  if (v24)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28, v29);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v30, v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v35, v36, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_count(v41, v42, v43, v44, v45, v46);

    if (v47)
    {
      objc_msgSend_result(v5, v48, v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v53, v54, v55, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v59, v60, 0, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v65, v66, v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      v201 = buf;
      v202 = 0x2020000000;
      v203 = 0;
      v196 = 0;
      v197 = &v196;
      v198 = 0x2020000000;
      v199 = 0;
      objc_msgSend_result(v5, v71, v72, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v5, v77, v78, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend_tokenColumnCount(v82, v83, v84, v85, v86, v87);
      v189 = MEMORY[0x1E0C809B0];
      v190 = 3221225472;
      v191 = sub_1BE617710;
      v192 = &unk_1E77F2048;
      v194 = buf;
      v195 = &v196;
      v89 = v70;
      v193 = v89;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v76, v90, (uint64_t)v64, 0, v88, (uint64_t)&v189);

      v91 = *((_QWORD *)v201 + 3);
      objc_msgSend_addObject_(v188, v92, (uint64_t)v89, v93, v94, v95);

      _Block_object_dispose(&v196, 8);
      _Block_object_dispose(buf, 8);

      for (i = 1; ; ++i)
      {
        objc_msgSend_result(v5, v96, v97, v98, v99, v100);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPaths(v102, v103, v104, v105, v106, v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = objc_msgSend_count(v108, v109, v110, v111, v112, v113);

        if (i >= v114)
          break;
        objc_msgSend_result(v5, v48, v49, v50, v51, v52);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPaths(v115, v116, v117, v118, v119, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v121, v122, i, v123, v124, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_array(MEMORY[0x1E0C99DE8], v127, v128, v129, v130, v131);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        v201 = buf;
        v202 = 0x2020000000;
        v203 = 0;
        v196 = 0;
        v197 = &v196;
        v198 = 0x2020000000;
        v199 = 0;
        objc_msgSend_result(v5, v133, v134, v135, v136, v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v5, v139, v140, v141, v142, v143);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        v150 = objc_msgSend_tokenColumnCount(v144, v145, v146, v147, v148, v149);
        v189 = MEMORY[0x1E0C809B0];
        v190 = 3221225472;
        v191 = sub_1BE617710;
        v192 = &unk_1E77F2048;
        v194 = buf;
        v195 = &v196;
        v151 = v132;
        v193 = v151;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v138, v152, (uint64_t)v126, 0, v150, (uint64_t)&v189);

        if (*((_QWORD *)v201 + 3) <= v91 || !*((_BYTE *)v197 + 24))
          objc_msgSend_addObject_(v188, v153, (uint64_t)v151, v154, v155, v156);

        _Block_object_dispose(&v196, 8);
        _Block_object_dispose(buf, 8);

      }
    }
    v157 = objc_msgSend_count(v188, v48, v49, v50, v51, v52);
    objc_msgSend_result(v5, v158, v159, v160, v161, v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v163, v164, v165, v166, v167, v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = objc_msgSend_count(v169, v170, v171, v172, v173, v174);

    if (v157 != v175)
    {
      v176 = [CHTokenizedMathResult alloc];
      v181 = (void *)objc_msgSend_initWithBestPathTokens_(v176, v177, (uint64_t)v188, v178, v179, v180);
      objc_msgSend_setResult_(v5, v182, (uint64_t)v181, v183, v184, v185);

    }
  }

  return v5;
}

@end
