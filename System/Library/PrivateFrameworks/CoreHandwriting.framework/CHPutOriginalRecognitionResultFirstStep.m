@implementation CHPutOriginalRecognitionResultFirstStep

- (id)process:(id)a3 options:(id)a4
{
  id *v5;
  NSObject *v6;
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
  unint64_t i;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
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
  void *v48;
  const char *v49;
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
  uint64_t v64;
  void *v65;
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
  uint64_t v76;
  const char *v77;
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
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
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
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  CHMutableTokenizedTextResult *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
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
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  id v180;
  void *v181;
  _QWORD v182[5];
  uint8_t buf[8];
  uint8_t *v184;
  uint64_t v185;
  char v186;

  v5 = (id *)a3;
  v180 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHPutOriginalRecognitionResultFirstStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v5, v12, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v18, v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_count(v24, v25, v26, v27, v28, v29);

    if (i >= v30)
      break;
    *(_QWORD *)buf = 0;
    v184 = buf;
    v185 = 0x2020000000;
    v186 = 1;
    objc_msgSend_result(v5, v31, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v42, v43, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v48, v49, i, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v54, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v59, v60, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v65, v66, i, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend_length(v70, v71, v72, v73, v74, v75);
    v182[0] = MEMORY[0x1E0C809B0];
    v182[1] = 3221225472;
    v182[2] = sub_1BE8C3910;
    v182[3] = &unk_1E77F46B0;
    v182[4] = buf;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v36, v77, (uint64_t)v53, 0, v76, (uint64_t)v182);

    if (v184[24])
    {
      objc_msgSend_result(v5, v78, v79, v80, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v83, v84, v85, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v89, v90, i, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_insertObject_atIndex_(v181, v95, (uint64_t)v94, 0, v96, v97);
    }
    else
    {
      objc_msgSend_result(v5, v78, v79, v80, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v83, v98, v99, v100, v101, v102);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v89, v103, i, v104, v105, v106);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v181, v107, (uint64_t)v94, v108, v109, v110);
    }

    _Block_object_dispose(buf, 8);
  }
  objc_msgSend_result(v5, v31, v32, v33, v34, v35);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend_baseWritingDirection(v111, v112, v113, v114, v115, v116);

  v118 = [CHMutableTokenizedTextResult alloc];
  objc_msgSend_result(v5, v119, v120, v121, v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenColumns(v124, v125, v126, v127, v128, v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_result(v5, v131, v132, v133, v134, v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPathScores(v136, v137, v138, v139, v140, v141);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_result(v5, v143, v144, v145, v146, v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trailingSeparator(v148, v149, v150, v151, v152, v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_result(v5, v155, v156, v157, v158, v159);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = objc_msgSend_recognizerGenerationIdentifier(v160, v161, v162, v163, v164, v165);
  v168 = (void *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_(v118, v167, (uint64_t)v130, (uint64_t)v181, (uint64_t)v142, (uint64_t)v154, v166);
  if (v5)
    objc_storeStrong(v5 + 3, v168);

  objc_msgSend_result(v5, v169, v170, v171, v172, v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBaseWritingDirection_(v174, v175, v117, v176, v177, v178);

  return v5;
}

@end
