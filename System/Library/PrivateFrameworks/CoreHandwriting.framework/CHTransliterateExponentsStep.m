@implementation CHTransliterateExponentsStep

- (CHTransliterateExponentsStep)init
{
  CHTransliterateExponentsStep *v2;
  CHTransliterateExponentsStep *v3;
  NSDictionary *exponentTransliterations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHTransliterateExponentsStep;
  v2 = -[CHTransliterateExponentsStep init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    exponentTransliterations = v2->_exponentTransliterations;
    v2->_exponentTransliterations = (NSDictionary *)&unk_1E78271A0;

  }
  return v3;
}

- (id)process:(id)a3 options:(id)a4
{
  id v5;
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
  BOOL v30;
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
  void *v47;
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
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  const char *v73;
  NSObject *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint8_t *v80;
  uint64_t v81;
  _QWORD *v82;
  id v83;
  unint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void **v94;
  void **v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  void *v99;
  CHTokenizedMathResult *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v111;
  void *v113;
  id v114;
  _QWORD v115[4];
  id v116;
  CHTransliterateExponentsStep *v117;
  uint8_t *v118;
  _QWORD *v119;
  _QWORD *v120;
  _QWORD *v121;
  _QWORD v122[6];
  __int128 __p;
  __int128 v124;
  __int128 v125;
  _QWORD v126[6];
  _BYTE v127[48];
  _QWORD v128[6];
  uint8_t v129[48];
  uint8_t buf[8];
  uint8_t *v131;
  uint64_t v132;
  double (*v133)(_QWORD *, _QWORD *);
  uint64_t (*v134)(uint64_t);
  void *v135;
  uint8_t v136[48];
  uint8_t v137[4];
  uint64_t v138;
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v111 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v114 = v5;
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHTransliterateExponentsStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v114, v12, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v18, v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = i < objc_msgSend_count(v24, v25, v26, v27, v28, v29);

    if (!v30)
      break;
    objc_msgSend_result(v114, v31, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v36, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v42, v43, i, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v48, v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v131 = buf;
    v132 = 0x6012000000;
    v133 = sub_1BE614E98;
    v134 = sub_1BE614ED8;
    v135 = &unk_1BE94989A;
    memset(v136, 0, sizeof(v136));
    v128[0] = 0;
    v128[1] = v128;
    v128[2] = 0x6012000000;
    v128[3] = sub_1BE614EE0;
    v128[4] = sub_1BE614F20;
    v128[5] = &unk_1BE94989A;
    memset(v129, 0, sizeof(v129));
    v126[0] = 0;
    v126[1] = v126;
    v126[2] = 0x6012000000;
    v126[3] = sub_1BE614F28;
    v126[4] = sub_1BE614F68;
    v126[5] = &unk_1BE94989A;
    memset(v127, 0, sizeof(v127));
    v122[0] = 0;
    v122[1] = v122;
    v122[2] = 0x6012000000;
    v122[3] = sub_1BE611148;
    v122[4] = sub_1BE611188;
    v122[5] = &unk_1BE94989A;
    __p = 0u;
    v124 = 0u;
    v125 = 0u;
    objc_msgSend_result(v114, v54, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v114, v60, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend_tokenColumnCount(v65, v66, v67, v68, v69, v70);
    v115[0] = MEMORY[0x1E0C809B0];
    v115[1] = 3221225472;
    v115[2] = sub_1BE614F70;
    v115[3] = &unk_1E77F2020;
    v118 = buf;
    v119 = v128;
    v120 = v126;
    v121 = v122;
    v72 = v53;
    v116 = v72;
    v117 = self;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v59, v73, (uint64_t)v47, 0, v71, (uint64_t)v115);

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v74 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      v75 = *((_QWORD *)v131 + 11);
      *(_DWORD *)v137 = 134217984;
      v138 = v75;
      _os_log_impl(&dword_1BE607000, v74, OS_LOG_TYPE_DEBUG, "CHTransliterateExponentsStep warning: %lu open exponents after enumerating all the tokens in the path ", v137, 0xCu);
    }

    while (1)
    {
      v80 = v131;
      v81 = *((_QWORD *)v131 + 11);
      if (!v81)
        break;
      v82 = v131 + 80;
      v83 = objc_retain(*(id *)(*(_QWORD *)(*((_QWORD *)v131 + 7)
                                          + (((unint64_t)(v81 + *((_QWORD *)v131 + 10) - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                              + 8 * ((v81 + *((_QWORD *)v131 + 10) - 1) & 0x1FF)));
      v84 = *((_QWORD *)v80 + 11) + *((_QWORD *)v80 + 10) - 1;

      v89 = *((_QWORD *)v80 + 8);
      v90 = ((v89 - *((_QWORD *)v80 + 7)) << 6) - 1;
      v91 = *((_QWORD *)v80 + 11);
      if (v89 == *((_QWORD *)v80 + 7))
        v90 = 0;
      *((_QWORD *)v80 + 11) = v91 - 1;
      if ((unint64_t)(v90 - (v91 + *v82) + 1) >= 0x400)
      {
        operator delete(*(void **)(v89 - 8));
        *((_QWORD *)v80 + 8) -= 8;
      }
      v92 = *((_QWORD *)v131 + 11);
      v93 = v72;
      if (v92)
        v93 = *(void **)(*(_QWORD *)(*((_QWORD *)v131 + 7)
                                   + (((unint64_t)(v92 + *((_QWORD *)v131 + 10) - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                       + 8 * ((v92 + *((_QWORD *)v131 + 10) - 1) & 0x1FF));
      objc_msgSend_addObjectsFromArray_(v93, v85, (uint64_t)v83, v86, v87, v88);

    }
    objc_msgSend_addObject_(v113, v76, (uint64_t)v72, v77, v78, v79);

    _Block_object_dispose(v122, 8);
    v94 = (void **)*((_QWORD *)&__p + 1);
    v95 = (void **)v124;
    *((_QWORD *)&v125 + 1) = 0;
    v96 = v124 - *((_QWORD *)&__p + 1);
    if ((_QWORD)v124 - *((_QWORD *)&__p + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v94);
        v95 = (void **)v124;
        v94 = (void **)(*((_QWORD *)&__p + 1) + 8);
        *((_QWORD *)&__p + 1) = v94;
        v96 = v124 - (_QWORD)v94;
      }
      while ((_QWORD)v124 - (_QWORD)v94 > 0x10uLL);
    }
    v97 = v96 >> 3;
    if (v97 == 1)
    {
      v98 = 256;
      goto LABEL_26;
    }
    if (v97 == 2)
    {
      v98 = 512;
LABEL_26:
      *(_QWORD *)&v125 = v98;
    }
    if (v94 != v95)
    {
      do
      {
        v99 = *v94++;
        operator delete(v99);
      }
      while (v94 != v95);
      if ((_QWORD)v124 != *((_QWORD *)&__p + 1))
        *(_QWORD *)&v124 = v124 + ((*((_QWORD *)&__p + 1) - v124 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
    if ((_QWORD)__p)
      operator delete((void *)__p);
    _Block_object_dispose(v126, 8);
    sub_1BE61BEF4((uint64_t)v127);
    _Block_object_dispose(v128, 8);
    sub_1BE61BEF4((uint64_t)v129);
    _Block_object_dispose(buf, 8);
    sub_1BE61BEF4((uint64_t)v136);

  }
  v100 = [CHTokenizedMathResult alloc];
  v105 = (void *)objc_msgSend_initWithBestPathTokens_(v100, v101, (uint64_t)v113, v102, v103, v104);
  objc_msgSend_setResult_(v114, v106, (uint64_t)v105, v107, v108, v109);

  return v114;
}

- (void).cxx_destruct
{
  sub_1BE61C7EC((uint64_t)&self->_tokenPropertiesHelper);
  objc_storeStrong((id *)&self->_exponentTransliterations, 0);
}

- (id).cxx_construct
{
  sub_1BE61CB7C((uint64_t)&self->_tokenPropertiesHelper);
  return self;
}

@end
