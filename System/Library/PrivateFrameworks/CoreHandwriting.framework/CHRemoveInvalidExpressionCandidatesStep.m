@implementation CHRemoveInvalidExpressionCandidatesStep

- (CHRemoveInvalidExpressionCandidatesStep)initWithCodemap:(id)a3
{
  CHRemoveInvalidExpressionCandidatesStep *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHRemoveInvalidExpressionCandidatesStep *i;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  size_t v23;
  size_t v24;
  __int128 *p_dst;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  size_t v52;
  const char *v53;
  uint64_t v54;
  size_t v55;
  __int128 *v56;
  char *v57;
  void **v58;
  uint64_t v59;
  uint64_t v60;
  void **v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  void **v68;
  __int128 v69;
  void **v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  const void **v77;
  const void **v78;
  int v79;
  char *v80;
  int v81;
  size_t v82;
  const void **v83;
  char **v84;
  char *v85;
  char **v86;
  char *v87;
  char *v88;
  int v89;
  size_t v90;
  char *v91;
  size_t v92;
  int v93;
  _BOOL4 v94;
  char **v95;
  char *v96;
  BOOL v97;
  char *v98;
  size_t v99;
  size_t v100;
  char *v101;
  size_t v102;
  char *v103;
  size_t v104;
  int v105;
  _BOOL4 v106;
  uint64_t **v107;
  uint64_t value;
  uint64_t v109;
  void **v110;
  void **v111;
  void *v112;
  char **v114;
  id v115;
  id obj;
  CHRemoveInvalidExpressionCandidatesStep *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  void *__p;
  void **v123;
  char *v124;
  char **v125;
  char *v126[2];
  objc_super v127;
  _BYTE v128[128];
  __int128 __dst;
  __int128 v130;
  char v131;
  void *v132[2];
  char v133;
  void *v134[2];
  char v135;
  void *v136[2];
  char v137;
  void *v138[2];
  char v139;
  void *v140[2];
  char v141;
  void *v142[2];
  char v143;
  void *v144[2];
  char v145;
  void *v146[2];
  char v147;
  void *v148[2];
  char v149;
  void *v150[2];
  char v151;
  void *v152[2];
  char v153;
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v115 = a3;
  v127.receiver = self;
  v127.super_class = (Class)CHRemoveInvalidExpressionCandidatesStep;
  v4 = -[CHRemoveInvalidExpressionCandidatesStep init](&v127, sel_init);
  i = v4;
  if (!v4)
    goto LABEL_125;
  v11 = 0;
  v126[0] = 0;
  v126[1] = 0;
  v114 = v126;
  v125 = v126;
  v117 = v4;
  while (objc_msgSend_count(v115, v5, v6, v7, v8, v9, v114) > v11)
  {
    objc_msgSend_objectAtIndexedSubscript_(v115, v12, v11, v13, v14, v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19, v20, v21);
    v23 = strlen(v22);
    if (v23 > 0x7FFFFFFFFFFFFFF7)
      sub_1BE61F1B4();
    v24 = v23;
    if (v23 >= 0x17)
    {
      v26 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v23 | 7) != 0x17)
        v26 = v23 | 7;
      v27 = v26 + 1;
      p_dst = (__int128 *)operator new(v26 + 1);
      *((_QWORD *)&__dst + 1) = v24;
      *(_QWORD *)&v130 = v27 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
LABEL_11:
      memmove(p_dst, v22, v24);
      goto LABEL_12;
    }
    BYTE7(v130) = v23;
    p_dst = &__dst;
    if (v23)
      goto LABEL_11;
LABEL_12:
    *((_BYTE *)p_dst + v24) = 0;
    __p = &__dst;
    *((_DWORD *)sub_1BE61F448((uint64_t **)&v125, (const void **)&__dst, (uint64_t)&unk_1BE8D50A2, (_OWORD **)&__p) + 14) = v11;
    i = v117;
    if (SBYTE7(v130) < 0)
      operator delete((void *)__dst);

    ++v11;
  }
  *(_WORD *)((char *)&v130 + 7) = 9986;
  strcpy((char *)&__dst, "\\,");
  v131 = 1;
  BYTE9(v130) = 0;
  v133 = 2;
  strcpy((char *)v132, "''");
  v135 = 2;
  strcpy((char *)v134, "°");
  v137 = 6;
  strcpy((char *)v136, "\\left(");
  v139 = 6;
  strcpy((char *)v138, "\\left|");
  v141 = 12;
  strcpy((char *)v140, "\\left\\lfloor");
  v143 = 11;
  strcpy((char *)v142, "\\left\\lceil");
  v145 = 7;
  strcpy((char *)v144, "\\right)");
  v147 = 7;
  strcpy((char *)v146, "\\right|");
  v149 = 13;
  strcpy((char *)v148, "\\right\\rfloor");
  v151 = 12;
  strcpy((char *)v150, "\\right\\rceil");
  v153 = 7;
  strcpy((char *)v152, "\\mathrm");
  sub_1BE61F774(&__p, (uint64_t)&__dst, 0xDuLL);
  if (v153 < 0)
  {
    operator delete(v152[0]);
    if (v151 < 0)
      goto LABEL_127;
LABEL_17:
    if ((v149 & 0x80000000) == 0)
      goto LABEL_18;
LABEL_128:
    operator delete(v148[0]);
    if (v147 < 0)
      goto LABEL_129;
LABEL_19:
    if ((v145 & 0x80000000) == 0)
      goto LABEL_20;
LABEL_130:
    operator delete(v144[0]);
    if (v143 < 0)
      goto LABEL_131;
LABEL_21:
    if ((v141 & 0x80000000) == 0)
      goto LABEL_22;
LABEL_132:
    operator delete(v140[0]);
    if (v139 < 0)
      goto LABEL_133;
LABEL_23:
    if ((v137 & 0x80000000) == 0)
      goto LABEL_24;
LABEL_134:
    operator delete(v136[0]);
    if (v135 < 0)
      goto LABEL_135;
LABEL_25:
    if ((v133 & 0x80000000) == 0)
      goto LABEL_26;
LABEL_136:
    operator delete(v132[0]);
    if (v131 < 0)
      goto LABEL_137;
LABEL_27:
    if (SBYTE7(v130) < 0)
LABEL_138:
      operator delete((void *)__dst);
  }
  else
  {
    if ((v151 & 0x80000000) == 0)
      goto LABEL_17;
LABEL_127:
    operator delete(v150[0]);
    if (v149 < 0)
      goto LABEL_128;
LABEL_18:
    if ((v147 & 0x80000000) == 0)
      goto LABEL_19;
LABEL_129:
    operator delete(v146[0]);
    if (v145 < 0)
      goto LABEL_130;
LABEL_20:
    if ((v143 & 0x80000000) == 0)
      goto LABEL_21;
LABEL_131:
    operator delete(v142[0]);
    if (v141 < 0)
      goto LABEL_132;
LABEL_22:
    if ((v139 & 0x80000000) == 0)
      goto LABEL_23;
LABEL_133:
    operator delete(v138[0]);
    if (v137 < 0)
      goto LABEL_134;
LABEL_24:
    if ((v135 & 0x80000000) == 0)
      goto LABEL_25;
LABEL_135:
    operator delete(v134[0]);
    if (v133 < 0)
      goto LABEL_136;
LABEL_26:
    if ((v131 & 0x80000000) == 0)
      goto LABEL_27;
LABEL_137:
    operator delete(*((void **)&v130 + 1));
    if (SBYTE7(v130) < 0)
      goto LABEL_138;
  }
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  objc_msgSend_definedMathFunctionNameMapping(CHDecodeMathFunctionStep, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v33, v34, v35, v36, v37, v38);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v118, (uint64_t)v128, 16, v40);
  if (!v41)
    goto LABEL_67;
  v42 = *(_QWORD *)v119;
  while (2)
  {
    v43 = 0;
    while (2)
    {
      if (*(_QWORD *)v119 != v42)
        objc_enumerationMutation(obj);
      v45 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v118 + 1) + 8 * v43));
      v51 = (const char *)objc_msgSend_UTF8String(v45, v46, v47, v48, v49, v50);
      v52 = strlen(v51);
      if (v52 > 0x7FFFFFFFFFFFFFF7)
        sub_1BE61F1B4();
      v55 = v52;
      if (v52 >= 0x17)
      {
        v59 = (v52 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v52 | 7) != 0x17)
          v59 = v52 | 7;
        v60 = v59 + 1;
        v56 = (__int128 *)operator new(v59 + 1);
        *((_QWORD *)&__dst + 1) = v55;
        *(_QWORD *)&v130 = v60 | 0x8000000000000000;
        *(_QWORD *)&__dst = v56;
LABEL_43:
        memmove(v56, v51, v55);
        *((_BYTE *)v56 + v55) = 0;
        v58 = v123;
        v57 = v124;
        i = v117;
        if (v123 >= (void **)v124)
          goto LABEL_44;
        goto LABEL_31;
      }
      BYTE7(v130) = v52;
      v56 = &__dst;
      if (v52)
        goto LABEL_43;
      LOBYTE(__dst) = 0;
      v58 = v123;
      v57 = v124;
      i = v117;
      if (v123 < (void **)v124)
      {
LABEL_31:
        v44 = __dst;
        v58[2] = (void *)v130;
        *(_OWORD *)v58 = v44;
        v123 = v58 + 3;
        goto LABEL_32;
      }
LABEL_44:
      v61 = (void **)__p;
      v62 = 0xAAAAAAAAAAAAAAABLL * (((char *)v58 - (_BYTE *)__p) >> 3);
      v63 = v62 + 1;
      if (v62 + 1 > 0xAAAAAAAAAAAAAAALL)
        sub_1BE61F930();
      v64 = 0xAAAAAAAAAAAAAAABLL * ((v57 - (_BYTE *)__p) >> 3);
      if (2 * v64 > v63)
        v63 = 2 * v64;
      if (v64 >= 0x555555555555555)
        v65 = 0xAAAAAAAAAAAAAAALL;
      else
        v65 = v63;
      if (v65)
      {
        if (v65 > 0xAAAAAAAAAAAAAAALL)
          sub_1BE61F100();
        v66 = (char *)operator new(24 * v65);
      }
      else
      {
        v66 = 0;
      }
      v67 = &v66[24 * v62];
      *(_OWORD *)v67 = __dst;
      *((_QWORD *)v67 + 2) = v130;
      *(_QWORD *)&v130 = 0;
      __dst = 0uLL;
      v68 = (void **)(v67 + 24);
      if (v58 == v61)
      {
        __p = v67;
        v123 = (void **)(v67 + 24);
        v124 = &v66[24 * v65];
        i = v117;
      }
      else
      {
        do
        {
          v69 = *(_OWORD *)(v58 - 3);
          *((_QWORD *)v67 - 1) = *(v58 - 1);
          *(_OWORD *)(v67 - 24) = v69;
          v67 -= 24;
          *(v58 - 2) = 0;
          *(v58 - 1) = 0;
          *(v58 - 3) = 0;
          v58 -= 3;
        }
        while (v58 != v61);
        v58 = (void **)__p;
        v70 = v123;
        __p = v67;
        v123 = v68;
        v124 = &v66[24 * v65];
        for (i = v117; v70 != v58; v70 -= 3)
        {
          if (*((char *)v70 - 1) < 0)
            operator delete(*(v70 - 3));
        }
      }
      if (v58)
        operator delete(v58);
      v123 = v68;
      if (SBYTE7(v130) < 0)
        operator delete((void *)__dst);
LABEL_32:
      if (++v43 != v41)
        continue;
      break;
    }
    v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v118, (uint64_t)v128, 16, v54);
    if (v41)
      continue;
    break;
  }
LABEL_67:

  v76 = objc_msgSend_count(v115, v71, v72, v73, v74, v75);
  v78 = (const void **)__p;
  v77 = (const void **)v123;
  if (__p != v123)
  {
    v79 = v76;
    do
    {
      v80 = v126[0];
      if (!v126[0])
        goto LABEL_113;
      v81 = *((char *)v78 + 23);
      v82 = v81 >= 0 ? *((unsigned __int8 *)v78 + 23) : (size_t)v78[1];
      v83 = v81 >= 0 ? v78 : (const void **)*v78;
      v84 = v114;
      do
      {
        v85 = v80;
        v86 = v84;
        v88 = v80 + 32;
        v87 = (char *)*((_QWORD *)v80 + 4);
        v89 = v85[55];
        if (v89 >= 0)
          v90 = v85[55];
        else
          v90 = *((_QWORD *)v85 + 5);
        if (v89 >= 0)
          v91 = v88;
        else
          v91 = v87;
        if (v82 >= v90)
          v92 = v90;
        else
          v92 = v82;
        v93 = memcmp(v91, v83, v92);
        if (v93)
          v94 = v93 < 0;
        else
          v94 = v90 < v82;
        v95 = (char **)(v85 + 8);
        if (v94)
        {
          v84 = v86;
        }
        else
        {
          v95 = (char **)v85;
          v84 = (char **)v85;
        }
        v80 = *v95;
      }
      while (v80);
      if (v84 == v114)
        goto LABEL_113;
      v96 = (char *)(v86 + 4);
      v97 = !v94;
      if (v94)
        v98 = (char *)v86;
      else
        v98 = v85;
      if (v97)
        v96 = v88;
      v99 = *((unsigned __int8 *)v84 + 55);
      v101 = (char *)*((_QWORD *)v98 + 4);
      v100 = *((_QWORD *)v98 + 5);
      if ((v99 & 0x80u) == 0)
        v102 = v99;
      else
        v102 = v100;
      if ((v99 & 0x80u) == 0)
        v103 = v96;
      else
        v103 = v101;
      if (v102 >= v82)
        v104 = v82;
      else
        v104 = v102;
      v105 = memcmp(v83, v103, v104);
      v106 = v82 < v102;
      if (v105)
        v106 = v105 < 0;
      if (v106)
      {
LABEL_113:
        *(_QWORD *)&__dst = v78;
        *((_DWORD *)sub_1BE61F944((uint64_t **)&v125, v78, (uint64_t)&unk_1BE8D50A2, (__int128 **)&__dst) + 14) = v79++;
      }
      i = v117;
      v78 += 3;
    }
    while (v78 != v77);
  }
  v107 = (uint64_t **)operator new();
  sub_1BE7C4518(v107, (uint64_t **)&v125);
  value = (uint64_t)i->_latexSyntaxHelper.__ptr_.__value_;
  i->_latexSyntaxHelper.__ptr_.__value_ = (LaTeXSyntaxHelper *)v107;
  if (value)
  {
    v109 = sub_1BE61FAE0(value);
    MEMORY[0x1C3B812EC](v109, 0x10A0C409F3568C5);
  }
  v110 = (void **)__p;
  if (__p)
  {
    v111 = v123;
    v112 = __p;
    if (v123 != __p)
    {
      do
      {
        if (*((char *)v111 - 1) < 0)
          operator delete(*(v111 - 3));
        v111 -= 3;
      }
      while (v111 != v110);
      v112 = __p;
    }
    v123 = v110;
    operator delete(v112);
  }
  sub_1BE61F3E8((uint64_t)&v125, v126[0]);
LABEL_125:

  return i;
}

- (id)process:(id)a3 options:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
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
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  int isTranscriptionValidExpression_transcriptionPath;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
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
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t j;
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
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  CHTokenizedMathResult *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v132;
  id v133;
  id obj;
  void *v135;
  _QWORD v136[4];
  id v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint8_t buf[8];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveInvalidExpressionCandidatesStep is running", buf, 2u);
  }

  v7 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_result(v5, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v13, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_count(v19, v20, v21, v22, v23, v24);
  objc_msgSend_arrayWithCapacity_(v7, v26, v25, v27, v28, v29);
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  objc_msgSend_result(v5, v30, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v35, v36, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v142, (uint64_t)v148, 16, v43);
  if (v49)
  {
    v50 = *(_QWORD *)v143;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v143 != v50)
          objc_enumerationMutation(v41);
        v52 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * i);
        objc_msgSend_result(v5, v44, v45, v46, v47, v48, v132);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        isTranscriptionValidExpression_transcriptionPath = objc_msgSend_isTranscriptionValidExpression_transcriptionPath_(self, v54, (uint64_t)v53, v52, v55, v56);

        if (isTranscriptionValidExpression_transcriptionPath)
          objc_msgSend_addObject_(v132, v44, v52, v46, v47, v48);
      }
      v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v142, (uint64_t)v148, 16, v48);
    }
    while (v49);
  }

  if (!objc_msgSend_count(v132, v58, v59, v60, v61, v62))
  {
    objc_msgSend_result(v5, v63, v64, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v68, v69, v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v74, v75, v76, v77, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v132, v81, (uint64_t)v80, v82, v83, v84);

  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v63, v64, v65, v66, v67, v132);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  obj = v133;
  v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v85, (uint64_t)&v138, (uint64_t)v147, 16, v86);
  if (v92)
  {
    v93 = *(_QWORD *)v139;
    do
    {
      for (j = 0; j != v92; ++j)
      {
        if (*(_QWORD *)v139 != v93)
          objc_enumerationMutation(obj);
        v95 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * j);
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v87, v88, v89, v90, v91);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v5, v97, v98, v99, v100, v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v5, v103, v104, v105, v106, v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = objc_msgSend_tokenColumnCount(v108, v109, v110, v111, v112, v113);
        v136[0] = MEMORY[0x1E0C809B0];
        v136[1] = 3221225472;
        v136[2] = sub_1BE61B54C;
        v136[3] = &unk_1E77F1EC8;
        v115 = v96;
        v137 = v115;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v102, v116, v95, 0, v114, (uint64_t)v136);

        objc_msgSend_addObject_(v135, v117, (uint64_t)v115, v118, v119, v120);
      }
      v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v87, (uint64_t)&v138, (uint64_t)v147, 16, v91);
    }
    while (v92);
  }

  v121 = [CHTokenizedMathResult alloc];
  v126 = (void *)objc_msgSend_initWithBestPathTokens_(v121, v122, (uint64_t)v135, v123, v124, v125);
  objc_msgSend_setResult_(v5, v127, (uint64_t)v126, v128, v129, v130);

  return v5;
}

- (BOOL)isTranscriptionValidExpression:(id)a3 transcriptionPath:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  LaTeXSyntaxHelper *value;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  size_t v22;
  void *v23;
  void **v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD **v33;
  _QWORD *v34;
  _QWORD **v35;
  int v36;
  _QWORD *v37;
  int *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  NSString *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  void *v95;
  char v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _BOOL4 v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
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
  char isEqualToString;
  const __CFString *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  int isLatexTranscriptionValidExpression;
  BOOL v177;
  void *v179;
  void *v180;
  void *v181;
  id obj;
  uint64_t v183;
  uint64_t v184;
  id v185;
  id v186;
  id v187;
  uint64_t v188;
  void *v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  _QWORD v198[4];
  id v199;
  id v200;
  void *__dst[2];
  unint64_t v202;
  uint64_t *v203;
  _QWORD *v204;
  uint64_t v205;
  _BYTE v206[128];
  _BYTE v207[128];
  uint64_t v208;

  v208 = *MEMORY[0x1E0C80C00];
  v186 = a3;
  v187 = a4;
  v11 = objc_msgSend_tokenColumnCount(v186, v6, v7, v8, v9, v10);
  objc_msgSend_transcriptionWithPath_columnRange_(v186, v12, (uint64_t)v187, 0, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_latexSyntaxHelper.__ptr_.__value_;
  v185 = objc_retainAutorelease(v14);
  v21 = (const char *)objc_msgSend_UTF8String(v185, v16, v17, v18, v19, v20);
  v22 = strlen(v21);
  if (v22 >= 0x7FFFFFFFFFFFFFF8)
    sub_1BE61F1B4();
  v23 = (void *)v22;
  if (v22 >= 0x17)
  {
    v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v22 | 7) != 0x17)
      v25 = v22 | 7;
    v26 = v25 + 1;
    v24 = (void **)operator new(v25 + 1);
    __dst[1] = v23;
    v202 = v26 | 0x8000000000000000;
    __dst[0] = v24;
    goto LABEL_8;
  }
  HIBYTE(v202) = v22;
  v24 = __dst;
  if (v22)
LABEL_8:
    memmove(v24, v21, (size_t)v23);
  *((_BYTE *)v23 + (_QWORD)v24) = 0;
  sub_1BE7C6930((CoreHandwriting::LaTeXSyntaxHelper *)value, (uint64_t *)__dst, &v203);
  if ((SHIBYTE(v202) & 0x80000000) == 0)
  {
    if (v205 != 1)
      goto LABEL_65;
    goto LABEL_13;
  }
  operator delete(__dst[0]);
  if (v205 == 1)
  {
LABEL_13:
    v32 = v204;
    if (!v204)
      goto LABEL_65;
    v33 = &v204;
    do
    {
      v34 = v32;
      v35 = v33;
      v36 = *((_DWORD *)v32 + 7);
      v37 = v32 + 1;
      if (v36 >= 2)
      {
        v37 = v34;
        v33 = (_QWORD **)v34;
      }
      v32 = (_QWORD *)*v37;
    }
    while (v32);
    if (v33 == &v204)
      goto LABEL_65;
    v38 = (int *)(v36 >= 2 ? v34 : v35);
    if (v38[7] > 2)
      goto LABEL_65;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v27, v28, v29, v30, v31);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v39, v40, v41, v42, v43);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend_tokenColumnCount(v186, v44, v45, v46, v47, v48);
    v198[0] = MEMORY[0x1E0C809B0];
    v198[1] = 3221225472;
    v198[2] = sub_1BE61BD2C;
    v198[3] = &unk_1E77F1FA8;
    v50 = v180;
    v199 = v50;
    v51 = v181;
    v200 = v51;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v186, v52, (uint64_t)v187, 0, v49, (uint64_t)v198);
    v179 = v51;
    v58 = (void *)objc_msgSend_copy(v51, v53, v54, v55, v56, v57);
    objc_msgSend_addObject_(v50, v59, (uint64_t)v58, v60, v61, v62);

    v196 = 0u;
    v197 = 0u;
    v194 = 0u;
    v195 = 0u;
    obj = v50;
    v184 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v194, (uint64_t)v207, 16, v64);
    if (!v184)
    {
      v177 = 1;
      goto LABEL_69;
    }
    v183 = *(_QWORD *)v195;
LABEL_25:
    v188 = 0;
LABEL_26:
    if (*(_QWORD *)v195 != v183)
      objc_enumerationMutation(obj);
    v70 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * v188);
    objc_msgSend_string(MEMORY[0x1E0CB37A0], v65, v66, v67, v68, v69);
    v71 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_string(MEMORY[0x1E0CB37A0], v72, v73, v74, v75, v76);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_string(MEMORY[0x1E0CB37A0], v77, v78, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = 0u;
    v193 = 0u;
    v190 = 0u;
    v191 = 0u;
    v83 = v70;
    v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v190, (uint64_t)v206, 16, v85);
    if (!v91)
    {
      v93 = 1;
      goto LABEL_54;
    }
    v92 = *(_QWORD *)v191;
    v93 = 1;
LABEL_30:
    v94 = 0;
    while (1)
    {
      if (*(_QWORD *)v191 != v92)
        objc_enumerationMutation(v83);
      v95 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * v94);
      v96 = objc_msgSend_properties(v95, v86, v87, v88, v89, v90);
      if ((objc_msgSend_properties(v95, v97, v98, v99, v100, v101) & 0x10) != 0)
      {
        v107 = 1;
        if ((v96 & 6) == 0)
        {
LABEL_35:
          if (objc_msgSend_length(v71, v102, v103, v104, v105, v106))
          {
            if ((v93 & 1) != 0)
              v93 = isStringNumber(v71);
            else
              v93 = 0;
            objc_msgSend_setString_(v71, v108, (uint64_t)&stru_1E77F6F28, v110, v111, v112);
            objc_msgSend_appendString_(v82, v118, (uint64_t)CFSTR(" 1"), v119, v120, v121);
          }
          if (v107)
          {
            objc_msgSend_string(v95, v108, v109, v110, v111, v112);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_appendString_(v189, v122, (uint64_t)v113, v123, v124, v125);
          }
          else
          {
            if (objc_msgSend_length(v189, v108, v109, v110, v111, v112))
            {
              if (objc_msgSend_length(v82, v126, v127, v128, v129, v130)
                || (objc_msgSend_string(v95, v131, v132, v133, v134, v135),
                    v136 = (void *)objc_claimAutoreleasedReturnValue(),
                    isEqualToString = objc_msgSend_isEqualToString_(v136, v137, (uint64_t)CFSTR("="), v138, v139, v140),
                    v136,
                    v142 = CFSTR("y"),
                    (isEqualToString & 1) == 0))
              {
                v142 = CFSTR(" 1");
              }
              objc_msgSend_appendString_(v82, v131, (uint64_t)v142, v133, v134, v135);
              objc_msgSend_setString_(v189, v143, (uint64_t)&stru_1E77F6F28, v144, v145, v146);
            }
            objc_msgSend_string(v95, v126, v127, v128, v129, v130);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_appendFormat_(v82, v147, (uint64_t)CFSTR(" %@"), v148, v149, v150, v113);
          }
          goto LABEL_50;
        }
      }
      else
      {
        v107 = objc_msgSend_properties(v95, v102, v103, v104, v105, v106) == 0;
        if ((v96 & 6) == 0)
          goto LABEL_35;
      }
      objc_msgSend_string(v95, v102, v103, v104, v105, v106);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v71, v114, (uint64_t)v113, v115, v116, v117);
LABEL_50:

      if (v91 == ++v94)
      {
        v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v86, (uint64_t)&v190, (uint64_t)v206, 16, v90);
        if (!v91)
        {
LABEL_54:

          if (objc_msgSend_length(v71, v151, v152, v153, v154, v155))
          {
            objc_msgSend_appendString_(v82, v156, (uint64_t)CFSTR(" 1"), v158, v159, v160);
            if ((v93 & 1) != 0)
              v93 = isStringNumber(v71);
            else
              v93 = 0;
          }
          if (objc_msgSend_length(v189, v156, v157, v158, v159, v160))
            objc_msgSend_appendString_(v82, v161, (uint64_t)CFSTR(" 1"), v163, v164, v165);
          if ((v93 & 1) == 0
            || (objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v161, v162, v163, v164, v165),
                v166 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend_stringByTrimmingCharactersInSet_(v82, v167, (uint64_t)v166, v168, v169, v170),
                v171 = (void *)objc_claimAutoreleasedReturnValue(),
                isLatexTranscriptionValidExpression = objc_msgSend_isLatexTranscriptionValidExpression_(CHCalculateWrapper, v172, (uint64_t)v171, v173, v174, v175), v171, v166, !isLatexTranscriptionValidExpression))
          {

            v177 = 0;
            goto LABEL_69;
          }

          if (++v188 == v184)
          {
            v177 = 1;
            v184 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v65, (uint64_t)&v194, (uint64_t)v207, 16, v69);
            if (!v184)
            {
LABEL_69:

              goto LABEL_66;
            }
            goto LABEL_25;
          }
          goto LABEL_26;
        }
        goto LABEL_30;
      }
    }
  }
LABEL_65:
  v177 = 0;
LABEL_66:
  sub_1BE62033C((uint64_t)&v203, v204);

  return v177;
}

- (void).cxx_destruct
{
  LaTeXSyntaxHelper *value;

  value = self->_latexSyntaxHelper.__ptr_.__value_;
  self->_latexSyntaxHelper.__ptr_.__value_ = 0;
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
