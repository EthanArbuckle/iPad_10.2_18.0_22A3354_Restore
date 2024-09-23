@implementation CHBracketsMatchingStep

- (CHBracketsMatchingStep)initWithCodemap:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  size_t v22;
  __int128 *v23;
  __int128 *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  __int128 *v33;
  __int128 *v34;
  int v35;
  char *v36;
  int v37;
  size_t v38;
  __int128 *v39;
  char **v40;
  char *v41;
  char **v42;
  char *v43;
  char *v44;
  int v45;
  size_t v46;
  char *v47;
  size_t v48;
  int v49;
  _BOOL4 v50;
  char **v51;
  char *v52;
  BOOL v53;
  _QWORD *v54;
  size_t v55;
  size_t v56;
  char *v57;
  size_t v58;
  char *v59;
  size_t v60;
  int v61;
  _BOOL4 v62;
  uint64_t **v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t value;
  uint64_t v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSSet *bracketSymbols;
  void **v78;
  void **v79;
  void *v80;
  CHBracketsMatchingStep *v82;
  void *__p;
  __int128 *v84;
  char **v85;
  char *v86[2];
  objc_super v87;
  __int128 *__dst[2];
  unint64_t v89;
  void *v90[2];
  char v91;
  void *v92[2];
  char v93;
  void *v94[2];
  char v95;
  void *v96[2];
  char v97;
  void *v98[2];
  char v99;
  void *v100[2];
  char v101;
  void *v102[2];
  char v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)CHBracketsMatchingStep;
  v82 = -[CHBracketsMatchingStep init](&v87, sel_init);
  if (!v82)
    goto LABEL_82;
  v10 = 0;
  v86[0] = 0;
  v86[1] = 0;
  v85 = v86;
  while (objc_msgSend_count(v4, v5, v6, v7, v8, v9) > v10)
  {
    objc_msgSend_objectAtIndexedSubscript_(v4, v11, v10, v12, v13, v14);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const char *)objc_msgSend_UTF8String(v15, v16, v17, v18, v19, v20);
    v22 = strlen(v21);
    if (v22 >= 0x7FFFFFFFFFFFFFF8)
      sub_1BE61F1B4();
    v23 = (__int128 *)v22;
    if (v22 >= 0x17)
    {
      v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v22 | 7) != 0x17)
        v25 = v22 | 7;
      v26 = v25 + 1;
      v24 = (__int128 *)operator new(v25 + 1);
      __dst[1] = v23;
      v89 = v26 | 0x8000000000000000;
      __dst[0] = v24;
LABEL_11:
      memmove(v24, v21, (size_t)v23);
      goto LABEL_12;
    }
    HIBYTE(v89) = v22;
    v24 = (__int128 *)__dst;
    if (v22)
      goto LABEL_11;
LABEL_12:
    *((_BYTE *)v23 + (_QWORD)v24) = 0;
    __p = __dst;
    *((_DWORD *)sub_1BE61F448((uint64_t **)&v85, (const void **)__dst, (uint64_t)&unk_1BE8D50A2, (_OWORD **)&__p) + 14) = v10;
    if (SHIBYTE(v89) < 0)
      operator delete(__dst[0]);

    ++v10;
  }
  HIBYTE(v89) = 6;
  strcpy((char *)__dst, "\\left(");
  v91 = 6;
  strcpy((char *)v90, "\\left|");
  v93 = 12;
  strcpy((char *)v92, "\\left\\lfloor");
  v95 = 11;
  strcpy((char *)v94, "\\left\\lceil");
  v97 = 7;
  strcpy((char *)v96, "\\right)");
  v99 = 7;
  strcpy((char *)v98, "\\right|");
  v101 = 13;
  strcpy((char *)v100, "\\right\\rfloor");
  v103 = 12;
  strcpy((char *)v102, "\\right\\rceil");
  sub_1BE61F774(&__p, (uint64_t)__dst, 8uLL);
  if ((v103 & 0x80000000) == 0)
  {
    if ((v101 & 0x80000000) == 0)
      goto LABEL_17;
LABEL_84:
    operator delete(v100[0]);
    if (v99 < 0)
      goto LABEL_85;
LABEL_18:
    if ((v97 & 0x80000000) == 0)
      goto LABEL_19;
LABEL_86:
    operator delete(v96[0]);
    if (v95 < 0)
      goto LABEL_87;
LABEL_20:
    if ((v93 & 0x80000000) == 0)
      goto LABEL_21;
LABEL_88:
    operator delete(v92[0]);
    if (v91 < 0)
      goto LABEL_89;
LABEL_22:
    if ((SHIBYTE(v89) & 0x80000000) == 0)
      goto LABEL_23;
LABEL_90:
    operator delete(__dst[0]);
    goto LABEL_23;
  }
  operator delete(v102[0]);
  if (v101 < 0)
    goto LABEL_84;
LABEL_17:
  if ((v99 & 0x80000000) == 0)
    goto LABEL_18;
LABEL_85:
  operator delete(v98[0]);
  if (v97 < 0)
    goto LABEL_86;
LABEL_19:
  if ((v95 & 0x80000000) == 0)
    goto LABEL_20;
LABEL_87:
  operator delete(v94[0]);
  if (v93 < 0)
    goto LABEL_88;
LABEL_21:
  if ((v91 & 0x80000000) == 0)
    goto LABEL_22;
LABEL_89:
  operator delete(v90[0]);
  if (SHIBYTE(v89) < 0)
    goto LABEL_90;
LABEL_23:
  v32 = objc_msgSend_count(v4, v27, v28, v29, v30, v31);
  v34 = (__int128 *)__p;
  v33 = v84;
  if (__p != v84)
  {
    v35 = v32;
    do
    {
      v36 = v86[0];
      if (!v86[0])
        goto LABEL_25;
      v37 = *((char *)v34 + 23);
      v38 = v37 >= 0 ? *((unsigned __int8 *)v34 + 23) : *((_QWORD *)v34 + 1);
      v39 = v37 >= 0 ? v34 : *(__int128 **)v34;
      v40 = v86;
      do
      {
        v41 = v36;
        v42 = v40;
        v44 = v36 + 32;
        v43 = (char *)*((_QWORD *)v36 + 4);
        v45 = v41[55];
        if (v45 >= 0)
          v46 = v41[55];
        else
          v46 = *((_QWORD *)v41 + 5);
        if (v45 >= 0)
          v47 = v44;
        else
          v47 = v43;
        if (v38 >= v46)
          v48 = v46;
        else
          v48 = v38;
        v49 = memcmp(v47, v39, v48);
        if (v49)
          v50 = v49 < 0;
        else
          v50 = v46 < v38;
        v51 = (char **)(v41 + 8);
        if (v50)
        {
          v40 = v42;
        }
        else
        {
          v51 = (char **)v41;
          v40 = (char **)v41;
        }
        v36 = *v51;
      }
      while (v36);
      if (v40 == v86)
        goto LABEL_25;
      v52 = (char *)(v42 + 4);
      v53 = !v50;
      if (v50)
        v54 = v42;
      else
        v54 = v41;
      if (v53)
        v52 = v44;
      v55 = *((unsigned __int8 *)v40 + 55);
      v57 = (char *)v54[4];
      v56 = v54[5];
      if ((v55 & 0x80u) == 0)
        v58 = v55;
      else
        v58 = v56;
      if ((v55 & 0x80u) == 0)
        v59 = v52;
      else
        v59 = v57;
      if (v58 >= v38)
        v60 = v38;
      else
        v60 = v58;
      v61 = memcmp(v39, v59, v60);
      v62 = v38 < v58;
      if (v61)
        v62 = v61 < 0;
      if (v62)
      {
LABEL_25:
        __dst[0] = v34;
        *((_DWORD *)sub_1BE61F944((uint64_t **)&v85, (const void **)v34, (uint64_t)&unk_1BE8D50A2, __dst) + 14) = v35++;
      }
      v34 = (__int128 *)((char *)v34 + 24);
    }
    while (v34 != v33);
  }
  v63 = (uint64_t **)operator new();
  sub_1BE7C4518(v63, (uint64_t **)&v85);
  value = (uint64_t)v82->latexHelper.__ptr_.__value_;
  v82->latexHelper.__ptr_.__value_ = (LaTeXSyntaxHelper *)v63;
  if (value)
  {
    v69 = sub_1BE61FAE0(value);
    MEMORY[0x1C3B812EC](v69, 0x10A0C409F3568C5);
  }
  v70 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_componentsSeparatedByString_(CFSTR("() \\lfloor \\rfloor \\lceil \\rceil |"), v64, (uint64_t)CFSTR(" "), v65, v66, v67);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v70, v72, (uint64_t)v71, v73, v74, v75);
  v76 = objc_claimAutoreleasedReturnValue();
  bracketSymbols = v82->_bracketSymbols;
  v82->_bracketSymbols = (NSSet *)v76;

  v78 = (void **)__p;
  if (__p)
  {
    v79 = (void **)v84;
    v80 = __p;
    if (v84 != __p)
    {
      do
      {
        if (*((char *)v79 - 1) < 0)
          operator delete(*(v79 - 3));
        v79 -= 3;
      }
      while (v79 != v78);
      v80 = __p;
    }
    v84 = (__int128 *)v78;
    operator delete(v80);
  }
  sub_1BE61F3E8((uint64_t)&v85, v86[0]);
LABEL_82:

  return v82;
}

- (id)process:(id)a3 options:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t i;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
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
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void **v79;
  void **v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  void *v84;
  void **v85;
  void **v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  void *v90;
  void **v91;
  void **v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  void *v96;
  void **v97;
  void **v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  NSSet *bracketSymbols;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  CHTokenizedMathResult *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  id v147;
  void *v148;
  id v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _QWORD v154[4];
  id v155;
  CHBracketsMatchingStep *v156;
  _QWORD *v157;
  _QWORD *v158;
  _QWORD *v159;
  uint8_t *v160;
  _QWORD v161[6];
  __int128 __p;
  __int128 v163;
  __int128 v164;
  _QWORD v165[6];
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _QWORD v169[6];
  __int128 v170;
  __int128 v171;
  __int128 v172;
  uint8_t buf[8];
  uint8_t *v174;
  uint64_t v175;
  double (*v176)(_QWORD *, _QWORD *);
  uint64_t (*v177)(uint64_t);
  void *v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  _BYTE v182[128];
  uint64_t v183;

  v183 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v147 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v149 = v6;
  v7 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEBUG, "CHBracketsMatchingStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v149, v13, v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v19, v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = i < objc_msgSend_count(v25, v26, v27, v28, v29, v30);

    if (!v31)
      break;
    objc_msgSend_result(v149, v32, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v37, v38, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v43, v44, i, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v49, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v174 = buf;
    v175 = 0x6012000000;
    v176 = sub_1BE611148;
    v177 = sub_1BE611188;
    v178 = &unk_1BE94989A;
    v179 = 0u;
    v180 = 0u;
    v181 = 0u;
    v169[0] = 0;
    v169[1] = v169;
    v169[2] = 0x6012000000;
    v169[3] = sub_1BE611148;
    v169[4] = sub_1BE611188;
    v169[5] = &unk_1BE94989A;
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v165[0] = 0;
    v165[1] = v165;
    v165[2] = 0x6012000000;
    v165[3] = sub_1BE611148;
    v165[4] = sub_1BE611188;
    v165[5] = &unk_1BE94989A;
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v161[0] = 0;
    v161[1] = v161;
    v161[2] = 0x6012000000;
    v161[3] = sub_1BE611148;
    v161[4] = sub_1BE611188;
    v161[5] = &unk_1BE94989A;
    __p = 0u;
    v163 = 0u;
    v164 = 0u;
    objc_msgSend_result(v149, v55, v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v149, v61, v62, v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend_tokenColumnCount(v66, v67, v68, v69, v70, v71);
    v154[0] = MEMORY[0x1E0C809B0];
    v154[1] = 3221225472;
    v154[2] = sub_1BE611190;
    v154[3] = &unk_1E77F2020;
    v73 = v54;
    v156 = self;
    v157 = v169;
    v158 = v165;
    v159 = v161;
    v160 = buf;
    v155 = v73;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v60, v74, (uint64_t)v48, 0, v72, (uint64_t)v154);

    objc_msgSend_addObject_(v148, v75, (uint64_t)v73, v76, v77, v78);
    _Block_object_dispose(v161, 8);
    v79 = (void **)*((_QWORD *)&__p + 1);
    v80 = (void **)v163;
    *((_QWORD *)&v164 + 1) = 0;
    v81 = v163 - *((_QWORD *)&__p + 1);
    if ((_QWORD)v163 - *((_QWORD *)&__p + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v79);
        v80 = (void **)v163;
        v79 = (void **)(*((_QWORD *)&__p + 1) + 8);
        *((_QWORD *)&__p + 1) = v79;
        v81 = v163 - (_QWORD)v79;
      }
      while ((_QWORD)v163 - (_QWORD)v79 > 0x10uLL);
    }
    v82 = v81 >> 3;
    if (v82 == 1)
    {
      v83 = 256;
      goto LABEL_13;
    }
    if (v82 == 2)
    {
      v83 = 512;
LABEL_13:
      *(_QWORD *)&v164 = v83;
    }
    if (v79 != v80)
    {
      do
      {
        v84 = *v79++;
        operator delete(v84);
      }
      while (v79 != v80);
      if ((_QWORD)v163 != *((_QWORD *)&__p + 1))
        *(_QWORD *)&v163 = v163 + ((*((_QWORD *)&__p + 1) - v163 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
    if ((_QWORD)__p)
      operator delete((void *)__p);
    _Block_object_dispose(v165, 8);
    v85 = (void **)*((_QWORD *)&v166 + 1);
    v86 = (void **)v167;
    *((_QWORD *)&v168 + 1) = 0;
    v87 = v167 - *((_QWORD *)&v166 + 1);
    if ((_QWORD)v167 - *((_QWORD *)&v166 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v85);
        v86 = (void **)v167;
        v85 = (void **)(*((_QWORD *)&v166 + 1) + 8);
        *((_QWORD *)&v166 + 1) = v85;
        v87 = v167 - (_QWORD)v85;
      }
      while ((_QWORD)v167 - (_QWORD)v85 > 0x10uLL);
    }
    v88 = v87 >> 3;
    if (v88 == 1)
    {
      v89 = 256;
      goto LABEL_26;
    }
    if (v88 == 2)
    {
      v89 = 512;
LABEL_26:
      *(_QWORD *)&v168 = v89;
    }
    if (v85 != v86)
    {
      do
      {
        v90 = *v85++;
        operator delete(v90);
      }
      while (v85 != v86);
      if ((_QWORD)v167 != *((_QWORD *)&v166 + 1))
        *(_QWORD *)&v167 = v167 + ((*((_QWORD *)&v166 + 1) - v167 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
    if ((_QWORD)v166)
      operator delete((void *)v166);
    _Block_object_dispose(v169, 8);
    v91 = (void **)*((_QWORD *)&v170 + 1);
    v92 = (void **)v171;
    *((_QWORD *)&v172 + 1) = 0;
    v93 = v171 - *((_QWORD *)&v170 + 1);
    if ((_QWORD)v171 - *((_QWORD *)&v170 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v91);
        v92 = (void **)v171;
        v91 = (void **)(*((_QWORD *)&v170 + 1) + 8);
        *((_QWORD *)&v170 + 1) = v91;
        v93 = v171 - (_QWORD)v91;
      }
      while ((_QWORD)v171 - (_QWORD)v91 > 0x10uLL);
    }
    v94 = v93 >> 3;
    if (v94 == 1)
    {
      v95 = 256;
      goto LABEL_39;
    }
    if (v94 == 2)
    {
      v95 = 512;
LABEL_39:
      *(_QWORD *)&v172 = v95;
    }
    if (v91 != v92)
    {
      do
      {
        v96 = *v91++;
        operator delete(v96);
      }
      while (v91 != v92);
      if ((_QWORD)v171 != *((_QWORD *)&v170 + 1))
        *(_QWORD *)&v171 = v171 + ((*((_QWORD *)&v170 + 1) - v171 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
    if ((_QWORD)v170)
      operator delete((void *)v170);
    _Block_object_dispose(buf, 8);
    v97 = (void **)*((_QWORD *)&v179 + 1);
    v98 = (void **)v180;
    *((_QWORD *)&v181 + 1) = 0;
    v99 = v180 - *((_QWORD *)&v179 + 1);
    if ((_QWORD)v180 - *((_QWORD *)&v179 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v97);
        v98 = (void **)v180;
        v97 = (void **)(*((_QWORD *)&v179 + 1) + 8);
        *((_QWORD *)&v179 + 1) = v97;
        v99 = v180 - (_QWORD)v97;
      }
      while ((_QWORD)v180 - (_QWORD)v97 > 0x10uLL);
    }
    v100 = v99 >> 3;
    if (v100 == 1)
    {
      v101 = 256;
      goto LABEL_52;
    }
    if (v100 == 2)
    {
      v101 = 512;
LABEL_52:
      *(_QWORD *)&v181 = v101;
    }
    if (v97 != v98)
    {
      do
      {
        v102 = *v97++;
        operator delete(v102);
      }
      while (v97 != v98);
      if ((_QWORD)v180 != *((_QWORD *)&v179 + 1))
        *(_QWORD *)&v180 = v180 + ((*((_QWORD *)&v179 + 1) - v180 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
    if ((_QWORD)v179)
      operator delete((void *)v179);

  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v32, v33, v34, v35, v36);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend_count(v148, v104, v105, v106, v107, v108) - 1;
  if (v114 >= 0)
  {
    do
    {
      if (v114 || objc_msgSend_count(v103, v109, v110, v111, v112, v113))
      {
        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        objc_msgSend_objectAtIndexedSubscript_(v148, v109, v114, v111, v112, v113);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v116, (uint64_t)&v150, (uint64_t)v182, 16, v117);
        if (v123)
        {
          v124 = *(_QWORD *)v151;
LABEL_65:
          v125 = 0;
          while (1)
          {
            if (*(_QWORD *)v151 != v124)
              objc_enumerationMutation(v115);
            bracketSymbols = self->_bracketSymbols;
            objc_msgSend_string(*(void **)(*((_QWORD *)&v150 + 1) + 8 * v125), v118, v119, v120, v121, v122);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(bracketSymbols) = objc_msgSend_containsObject_(bracketSymbols, v128, (uint64_t)v127, v129, v130, v131);

            if ((bracketSymbols & 1) != 0)
              goto LABEL_73;
            if (v123 == ++v125)
            {
              v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v115, v118, (uint64_t)&v150, (uint64_t)v182, 16, v122);
              if (v123)
                goto LABEL_65;
              break;
            }
          }
        }

      }
      objc_msgSend_objectAtIndexedSubscript_(v148, v109, v114, v111, v112, v113);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_insertObject_atIndex_(v103, v132, (uint64_t)v115, 0, v133, v134);
LABEL_73:

    }
    while (v114-- > 0);
  }
  v136 = [CHTokenizedMathResult alloc];
  v141 = (void *)objc_msgSend_initWithBestPathTokens_(v136, v137, (uint64_t)v103, v138, v139, v140);
  objc_msgSend_setResult_(v149, v142, (uint64_t)v141, v143, v144, v145);

  return v149;
}

- (NSArray)codemap
{
  return self->_codemap;
}

- (void).cxx_destruct
{
  LaTeXSyntaxHelper *value;

  objc_storeStrong((id *)&self->_codemap, 0);
  objc_storeStrong((id *)&self->_bracketSymbols, 0);
  value = self->latexHelper.__ptr_.__value_;
  self->latexHelper.__ptr_.__value_ = 0;
  if (value)
  {
    sub_1BE61FAE0((uint64_t)value);
    JUMPOUT(0x1C3B812ECLL);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
