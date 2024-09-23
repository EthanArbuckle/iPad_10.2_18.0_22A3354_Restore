@implementation CHRemoveVariableCasingAlternativesStep

- (id)process:(id)a3 options:(id)a4
{
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
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t i;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
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
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t j;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  int isEqualToString;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  CHTokenizedMathResult *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  id v184;
  void *v185;
  unint64_t v186;
  void *v187;
  id v188;
  _QWORD v189[5];
  uint8_t buf[8];
  uint8_t *v191;
  uint64_t v192;
  char v193;

  v188 = a3;
  v184 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveVariableCasingAlternativesStep is running", buf, 2u);
  }

  objc_msgSend_result(v188, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);

  if (v24)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28, v29, v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v188, v30, v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v35, v36, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v41, v42, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_retrievePathTokens_atPathIndex_(self, v48, (uint64_t)v188, 0, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v185, v52, (uint64_t)v51, v53, v54, v55);

    for (i = 1; ; i = v186 + 1)
    {
      objc_msgSend_result(v188, v56, v57, v58, v59, v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v62, v63, v64, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend_count(v68, v69, v70, v71, v72, v73);

      if (i >= v74)
        break;
      objc_msgSend_result(v188, v75, v76, v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v80, v81, v82, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = i;
      objc_msgSend_objectAtIndexedSubscript_(v86, v87, i, v88, v89, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v92, v93, v94, v95, v96);
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; ; ++j)
      {
        objc_msgSend_result(v188, v97, v98, v99, v100, v101);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = objc_msgSend_tokenColumnCount(v103, v104, v105, v106, v107, v108);

        if (j >= v109)
          break;
        v114 = objc_msgSend_indexAtPosition_(v91, v110, j, v111, v112, v113);
        if (v114 == objc_msgSend_indexAtPosition_(v47, v115, j, v116, v117, v118))
          goto LABEL_15;
        *(_QWORD *)buf = 0;
        v191 = buf;
        v192 = 0x2020000000;
        v193 = 1;
        objc_msgSend_result(v188, v119, v120, v121, v122, v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v189[0] = MEMORY[0x1E0C809B0];
        v189[1] = 3221225472;
        v189[2] = sub_1BE613CBC;
        v189[3] = &unk_1E77F1FD0;
        v189[4] = buf;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v124, v125, (uint64_t)v91, j, 1, (uint64_t)v189);

        LODWORD(v124) = v191[24];
        _Block_object_dispose(buf, 8);
        if (!(_DWORD)v124)
          goto LABEL_15;
        objc_msgSend_result(v188, v119, v120, v121, v122, v123);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionWithPath_columnRange_(v126, v127, (uint64_t)v91, j, 1, v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v129, v130, v131, v132, v133, v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v188, v136, v137, v138, v139, v140);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = (uint64_t)v47;
        objc_msgSend_transcriptionWithPath_columnRange_(v141, v143, (uint64_t)v47, j, 1, v144);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lowercaseString(v145, v146, v147, v148, v149, v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v135, v152, (uint64_t)v151, v153, v154, v155);

        v47 = (void *)v142;
        if (isEqualToString)
        {
          objc_msgSend_result(v188, v119, v120, v121, v122, v123);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v157, v158, v142, j, v159, v160);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v187, v162, (uint64_t)v161, v163, v164, v165);
        }
        else
        {
LABEL_15:
          objc_msgSend_result(v188, v119, v120, v121, v122, v123);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v157, v166, (uint64_t)v91, j, v167, v168);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v187, v169, (uint64_t)v161, v170, v171, v172);
        }

      }
      objc_msgSend_addObject_(v185, v110, (uint64_t)v187, v111, v112, v113);

    }
    v173 = [CHTokenizedMathResult alloc];
    v178 = (void *)objc_msgSend_initWithBestPathTokens_(v173, v174, (uint64_t)v185, v175, v176, v177);
    objc_msgSend_setResult_(v188, v179, (uint64_t)v178, v180, v181, v182);

  }
  return v188;
}

@end
