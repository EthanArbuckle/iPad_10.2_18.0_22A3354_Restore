@implementation CHTransliterateIsolatedConfusableCharactersStep

- (CHTransliterateIsolatedConfusableCharactersStep)init
{
  id v2;
  id v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHTransliterateIsolatedConfusableCharactersStep;
  v2 = -[CHTransliterateIsolatedConfusableCharactersStep init](&v8, sel_init);
  v3 = v2;
  if (!v2)
    return (CHTransliterateIsolatedConfusableCharactersStep *)v3;
  v6 = 2;
  LOWORD(__p[0]) = -16446;
  BYTE2(__p[0]) = 0;
  v7 = 0x3FEE666666666666;
  sub_1BE8C3944((uint64_t **)v2 + 1, "j", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  LOWORD(__p[0]) = -16446;
  BYTE2(__p[0]) = 0;
  v7 = 0x3FEE666666666666;
  sub_1BE8C3944((uint64_t **)v3 + 1, "d", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  LOWORD(__p[0]) = -16446;
  BYTE2(__p[0]) = 0;
  v7 = 0x3FE6666666666666;
  sub_1BE8C3944((uint64_t **)v3 + 1, "q", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  LOWORD(__p[0]) = -16446;
  BYTE2(__p[0]) = 0;
  v7 = 0x3FE6666666666666;
  sub_1BE8C3944((uint64_t **)v3 + 1, "c", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  LOWORD(__p[0]) = -24126;
  BYTE2(__p[0]) = 0;
  v7 = 0x3FEE666666666666;
  sub_1BE8C3944((uint64_t **)v3 + 1, "i", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  LOWORD(__p[0]) = -24126;
  BYTE2(__p[0]) = 0;
  v7 = 0x3FEE666666666666;
  sub_1BE8C3944((uint64_t **)v3 + 1, ";", (uint64_t)__p);
  if ((v6 & 0x80000000) == 0)
    return (CHTransliterateIsolatedConfusableCharactersStep *)v3;
  operator delete(__p[0]);
  return (CHTransliterateIsolatedConfusableCharactersStep *)v3;
}

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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t i;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
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
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
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
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id *v82;
  id v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
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
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  id v151;
  void *v153;
  void *v154;
  void *v155;
  id *v156;
  _QWORD v157[4];
  id v158;
  id *v159;
  CHTransliterateIsolatedConfusableCharactersStep *v160;
  id v161;
  unint64_t v162;
  uint8_t buf[16];

  v156 = (id *)a3;
  v151 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEBUG, "CHTransliterateIsolatedConfusableCharactersStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8, v9, v10);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12, v13, v14, v15);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v156, v16, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v22, v23, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_count(v28, v29, v30, v31, v32, v33);

    if (i >= v34)
      break;
    objc_msgSend_result(v156, v35, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v40, v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v46, v47, i, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v52, v53, v54, v55, v56);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v57, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v156, v63, v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v156, v69, v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend_tokenColumnCount(v74, v75, v76, v77, v78, v79);
    v157[0] = MEMORY[0x1E0C809B0];
    v157[1] = 3221225472;
    v157[2] = sub_1BE8B8A7C;
    v157[3] = &unk_1E77F6930;
    v162 = i;
    v81 = v62;
    v158 = v81;
    v82 = v156;
    v159 = v82;
    v160 = self;
    v83 = v155;
    v161 = v83;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v68, v84, (uint64_t)v51, 0, v80, (uint64_t)v157);

    if (objc_msgSend_count(v81, v85, v86, v87, v88, v89))
    {
      objc_msgSend_addObject_(v154, v90, (uint64_t)v81, v92, v93, v94);
      objc_msgSend_result(v82, v95, v96, v97, v98, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v100, v101, v102, v103, v104, v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v106, v107, i, v108, v109, v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v153, v112, (uint64_t)v111, v113, v114, v115);

    }
    if (objc_msgSend_count(v83, v90, v91, v92, v93, v94))
    {
      if ((objc_msgSend_isEqual_(v83, v116, (uint64_t)v81, v117, v118, v119) & 1) == 0)
      {
        objc_msgSend_addObject_(v154, v120, (uint64_t)v83, v121, v122, v123);
        objc_msgSend_result(v82, v124, v125, v126, v127, v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPathScores(v129, v130, v131, v132, v133, v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v135, v136, i, v137, v138, v139);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v153, v141, (uint64_t)v140, v142, v143, v144);

      }
    }

  }
  objc_msgSend_result(v156, v35, v36, v37, v38, v39);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v145, v146, (uint64_t)v154, (uint64_t)v153, v147, v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  if (v156)
    objc_storeStrong(v156 + 3, v149);

  return v156;
}

- (void).cxx_destruct
{
  sub_1BE8C3C10((uint64_t)self->_transliterationMap.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

@end
