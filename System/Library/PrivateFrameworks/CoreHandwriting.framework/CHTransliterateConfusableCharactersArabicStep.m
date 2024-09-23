@implementation CHTransliterateConfusableCharactersArabicStep

- (CHTransliterateConfusableCharactersArabicStep)init
{
  id v2;
  id v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHTransliterateConfusableCharactersArabicStep;
  v2 = -[CHTransliterateConfusableCharactersArabicStep init](&v8, sel_init);
  v3 = v2;
  if (!v2)
    return (CHTransliterateConfusableCharactersArabicStep *)v3;
  v6 = 2;
  strcpy((char *)__p, "و");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v2 + 1, "9", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  strcpy((char *)__p, "و");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v3 + 1, "g", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  strcpy((char *)__p, "ز");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v3 + 1, "j", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  strcpy((char *)__p, "ل");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v3 + 1, "J", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  strcpy((char *)__p, "ه");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v3 + 1, "o", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  strcpy((char *)__p, "٥");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v3 + 4, "o", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  strcpy((char *)__p, "٥");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v3 + 4, "0", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  strcpy((char *)__p, "١");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v3 + 4, "1", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  strcpy((char *)__p, "٦");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v3 + 4, "7", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  strcpy((char *)__p, "٩");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v3 + 4, "9", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  strcpy((char *)__p, "٩");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v3 + 4, "q", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  strcpy((char *)__p, "٧");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v3 + 4, "v", (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  v6 = 2;
  strcpy((char *)__p, "٧");
  v7 = 0x3FF0000000000000;
  sub_1BE8C3944((uint64_t **)v3 + 4, "V", (uint64_t)__p);
  if ((v6 & 0x80000000) == 0)
    return (CHTransliterateConfusableCharactersArabicStep *)v3;
  operator delete(__p[0]);
  return (CHTransliterateConfusableCharactersArabicStep *)v3;
}

- (id)process:(id)a3 options:(id)a4
{
  NSObject *v5;
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
  void *v29;
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
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t i;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
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
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
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
  uint64_t v116;
  id *v117;
  id v118;
  id v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
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
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
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
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  CHTransliterateConfusableCharactersArabicStep *v187;
  void *v188;
  void *v189;
  id v190;
  void *v191;
  id *v192;
  _QWORD v193[4];
  id *v194;
  CHTransliterateConfusableCharactersArabicStep *v195;
  id v196;
  id v197;
  id v198;
  unint64_t v199;
  uint8_t buf[16];

  v187 = self;
  v192 = (id *)a3;
  v190 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEBUG, "CHTransliterateConfusableCharactersArabicStep is running", buf, 2u);
  }

  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_result(v192, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);
  objc_msgSend_arrayWithCapacity_(v6, v25, v24, v26, v27, v28);
  v189 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_result(v192, v30, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v35, v36, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend_count(v41, v42, v43, v44, v45, v46);
  objc_msgSend_arrayWithCapacity_(v29, v48, v47, v49, v50, v51);
  v188 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1EF568DB8 != -1)
    dispatch_once(&qword_1EF568DB8, &unk_1E77F6950);
  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v192, v52, v53, v54, v55, v56, v187);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v58, v59, v60, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend_count(v64, v65, v66, v67, v68, v69);

    if (i >= v70)
      break;
    objc_msgSend_result(v192, v71, v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v76, v77, v78, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v82, v83, i, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v88, v89, v90, v91, v92);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v93, v94, v95, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v192, v99, v100, v101, v102, v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v192, v105, v106, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend_tokenColumnCount(v110, v111, v112, v113, v114, v115);
    v193[0] = MEMORY[0x1E0C809B0];
    v193[1] = 3221225472;
    v193[2] = sub_1BE8B9B00;
    v193[3] = &unk_1E77F6978;
    v199 = i;
    v117 = v192;
    v194 = v117;
    v195 = v187;
    v196 = v190;
    v118 = v191;
    v197 = v118;
    v119 = v98;
    v198 = v119;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v104, v120, (uint64_t)v87, 0, v116, (uint64_t)v193);

    if (objc_msgSend_count(v118, v121, v122, v123, v124, v125))
    {
      objc_msgSend_addObject_(v189, v126, (uint64_t)v118, v128, v129, v130);
      objc_msgSend_result(v117, v131, v132, v133, v134, v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v136, v137, v138, v139, v140, v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v142, v143, i, v144, v145, v146);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v188, v148, (uint64_t)v147, v149, v150, v151);

    }
    if (objc_msgSend_count(v119, v126, v127, v128, v129, v130))
    {
      if ((objc_msgSend_isEqual_(v119, v152, (uint64_t)v118, v153, v154, v155) & 1) == 0)
      {
        objc_msgSend_addObject_(v189, v156, (uint64_t)v119, v157, v158, v159);
        objc_msgSend_result(v117, v160, v161, v162, v163, v164);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPathScores(v165, v166, v167, v168, v169, v170);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v171, v172, i, v173, v174, v175);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v188, v177, (uint64_t)v176, v178, v179, v180);

      }
    }

  }
  objc_msgSend_result(v192, v71, v72, v73, v74, v75);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v181, v182, (uint64_t)v189, (uint64_t)v188, v183, v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  if (v192)
    objc_storeStrong(v192 + 3, v185);

  return v192;
}

- (void).cxx_destruct
{
  sub_1BE8C3C10((uint64_t)self->_transliterationMapArabicNumbers.__tree_.__pair1_.__value_.__left_);
  sub_1BE8C3C10((uint64_t)self->_transliterationMapArabicLetters.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  return self;
}

@end
