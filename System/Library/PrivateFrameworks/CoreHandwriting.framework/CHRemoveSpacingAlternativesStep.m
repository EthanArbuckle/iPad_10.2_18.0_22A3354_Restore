@implementation CHRemoveSpacingAlternativesStep

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
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t i;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
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
  uint64_t v154;
  id v155;
  const char *v156;
  const void *v157;
  size_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  CHTokenizedMathResult *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  id v173;
  id v174;
  id v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  void (*v180)(uint64_t, void *, uint64_t, _QWORD *);
  void *v181;
  id v182;
  uint8_t *v183;
  uint8_t buf[8];
  uint8_t *v185;
  uint64_t v186;
  __n128 (*v187)(__n128 *, __n128 *);
  void (*v188)(uint64_t);
  void *v189;
  void *__p;
  void *v191;
  uint64_t v192;
  _BYTE *v193;
  _BYTE *v194;
  uint64_t v195;

  v5 = a3;
  v176 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveSpacingAlternativesStep is running", buf, 2u);
  }

  objc_msgSend_result(v5, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);

  if (v24)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28, v29, v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = 0;
    v194 = 0;
    v195 = 0;
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
      v185 = buf;
      v186 = 0x4812000000;
      v187 = sub_1BE6144F4;
      v188 = sub_1BE614518;
      v189 = &unk_1BE94989A;
      v191 = 0;
      v192 = 0;
      __p = 0;
      objc_msgSend_result(v5, v71, v72, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v5, v77, v78, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend_tokenColumnCount(v82, v83, v84, v85, v86, v87);
      v178 = MEMORY[0x1E0C809B0];
      v179 = 3221225472;
      v180 = sub_1BE614530;
      v181 = &unk_1E77F1FF8;
      v183 = buf;
      v89 = v70;
      v182 = v89;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v76, v90, (uint64_t)v64, 0, v88, (uint64_t)&v178);

      if (&v193 != (_BYTE **)(v185 + 48))
        sub_1BE62037C(&v193, *((char **)v185 + 6), *((char **)v185 + 7), (uint64_t)(*((_QWORD *)v185 + 7) - *((_QWORD *)v185 + 6)) >> 3);
      objc_msgSend_addObject_(v177, v91, (uint64_t)v89, v92, v93, v94);

      _Block_object_dispose(buf, 8);
      if (__p)
      {
        v191 = __p;
        operator delete(__p);
      }

      for (i = 1; ; ++i)
      {
        objc_msgSend_result(v5, v95, v96, v97, v98, v99);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPaths(v101, v102, v103, v104, v105, v106);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = objc_msgSend_count(v107, v108, v109, v110, v111, v112);

        if (i >= v113)
          break;
        objc_msgSend_result(v5, v114, v115, v116, v117, v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPaths(v119, v120, v121, v122, v123, v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v125, v126, i, v127, v128, v129);
        v130 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_array(MEMORY[0x1E0C99DE8], v131, v132, v133, v134, v135);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        v185 = buf;
        v186 = 0x4812000000;
        v187 = sub_1BE6144F4;
        v188 = sub_1BE614518;
        v189 = &unk_1BE94989A;
        v191 = 0;
        v192 = 0;
        __p = 0;
        objc_msgSend_result(v5, v137, v138, v139, v140, v141);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v5, v143, v144, v145, v146, v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = objc_msgSend_tokenColumnCount(v148, v149, v150, v151, v152, v153);
        v178 = MEMORY[0x1E0C809B0];
        v179 = 3221225472;
        v180 = sub_1BE614530;
        v181 = &unk_1E77F1FF8;
        v183 = buf;
        v155 = v136;
        v182 = v155;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v142, v156, (uint64_t)v130, 0, v154, (uint64_t)&v178);

        v157 = (const void *)*((_QWORD *)v185 + 6);
        v158 = *((_QWORD *)v185 + 7) - (_QWORD)v157;
        if (v158 == v194 - v193 && !memcmp(v157, v193, v158))
          objc_msgSend_addObject_(v177, v159, (uint64_t)v155, v160, v161, v162);

        _Block_object_dispose(buf, 8);
        if (__p)
        {
          v191 = __p;
          operator delete(__p);
        }

      }
    }
    v163 = [CHTokenizedMathResult alloc];
    v168 = (void *)objc_msgSend_initWithBestPathTokens_(v163, v164, (uint64_t)v177, v165, v166, v167);
    objc_msgSend_setResult_(v5, v169, (uint64_t)v168, v170, v171, v172);

    v173 = v5;
    if (v193)
    {
      v194 = v193;
      operator delete(v193);
    }

  }
  else
  {
    v174 = v5;
  }

  return v5;
}

@end
