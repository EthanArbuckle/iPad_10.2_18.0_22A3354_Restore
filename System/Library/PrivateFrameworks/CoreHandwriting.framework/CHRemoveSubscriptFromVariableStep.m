@implementation CHRemoveSubscriptFromVariableStep

- (id)_trimSubscriptTokens:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
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
  char isEqualToString;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v3 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0;
  while (v10 < objc_msgSend_count(v3, v4, v5, v6, v7, v8))
  {
    if (v10 >= objc_msgSend_count(v3, v11, v12, v13, v14, v15) - 1)
      goto LABEL_9;
    objc_msgSend_objectAtIndexedSubscript_(v3, v4, v10, v6, v7, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_string(v16, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v22, v23, (uint64_t)CFSTR("_"), v24, v25, v26) & 1) != 0)
    {
      objc_msgSend_objectAtIndexedSubscript_(v3, v27, v10 + 1, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v31, v32, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v37, v38, (uint64_t)CFSTR("{"), v39, v40, v41);

      if ((isEqualToString & 1) == 0)
        goto LABEL_9;
      v10 += 2;
    }
    else
    {

LABEL_9:
      objc_msgSend_objectAtIndex_(v3, v4, v10, v6, v7, v8);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v43, v44, v45, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend_isEqualToString_(v49, v50, (uint64_t)CFSTR("}"), v51, v52, v53);

      if ((v54 & 1) == 0)
      {
        objc_msgSend_objectAtIndex_(v3, v4, v10, v6, v7, v8);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v9, v56, (uint64_t)v55, v57, v58, v59);

      }
      ++v10;
    }
  }

  return v9;
}

- (BOOL)isAlphabetic:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  objc_msgSend_letterCharacterSet(MEMORY[0x1E0CB3500], v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invertedSet(v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend_rangeOfCharacterFromSet_(v3, v16, (uint64_t)v15, v17, v18, v19) == 0x7FFFFFFFFFFFFFFFLL;
  return (char)v9;
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
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t i;
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
  uint64_t v51;
  unint64_t v52;
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
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
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
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  id v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void **v127;
  void **v128;
  unint64_t v129;
  unint64_t v130;
  uint64_t v131;
  void *v132;
  CHTokenizedMathResult *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v144;
  void *v146;
  void *v147;
  _QWORD v148[4];
  id v149;
  CHRemoveSubscriptFromVariableStep *v150;
  id v151;
  id v152;
  id v153;
  _QWORD *v154;
  _QWORD *v155;
  uint8_t *v156;
  _QWORD *v157;
  _QWORD *v158;
  _QWORD *v159;
  _QWORD v160[5];
  id v161;
  _QWORD v162[6];
  __int128 __p;
  __int128 v164;
  __int128 v165;
  _QWORD v166[6];
  _BYTE v167[48];
  _QWORD v168[6];
  _BYTE v169[48];
  _QWORD v170[6];
  uint8_t v171[48];
  uint8_t buf[8];
  uint8_t *v173;
  uint64_t v174;
  double (*v175)(_QWORD *, _QWORD *);
  uint64_t (*v176)(uint64_t);
  void *v177;
  _BYTE v178[48];
  _QWORD v179[4];
  id v180;

  v5 = a3;
  v144 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveSubscriptFromVariableStep is running", buf, 2u);
  }

  objc_msgSend_result(v5, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);

  if (v24)
  {
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v25, (uint64_t)CFSTR("{}_"), v26, v27, v28, v144);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v29, v30, v31, v32, v33);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; ++i)
    {
      objc_msgSend_result(v5, v34, v35, v36, v37, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v40, v41, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend_count(v46, v47, v48, v49, v50, v51);

      if (i >= v52)
      {
        v133 = [CHTokenizedMathResult alloc];
        v138 = (void *)objc_msgSend_initWithBestPathTokens_(v133, v134, (uint64_t)v147, v135, v136, v137);
        objc_msgSend_setResult_(v5, v139, (uint64_t)v138, v140, v141, v142);

        goto LABEL_23;
      }
      objc_msgSend_result(v5, v53, v54, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v58, v59, v60, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v64, v65, i, v66, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v70, v71, v72, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v5, v76, v77, v78, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v5, v82, v83, v84, v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend_tokenColumnCount(v87, v88, v89, v90, v91, v92);
      v179[0] = MEMORY[0x1E0C809B0];
      v179[1] = 3221225472;
      v179[2] = sub_1BE618EB8;
      v179[3] = &unk_1E77F1EC8;
      v94 = v75;
      v180 = v94;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v81, v95, (uint64_t)v69, 0, v93, (uint64_t)v179);

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v96, v97, v98, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      v173 = buf;
      v174 = 0x6012000000;
      v175 = sub_1BE614E98;
      v176 = sub_1BE614ED8;
      v177 = &unk_1BE94989A;
      memset(v178, 0, sizeof(v178));
      v170[0] = 0;
      v170[1] = v170;
      v170[2] = 0x6012000000;
      v170[3] = sub_1BE614E98;
      v170[4] = sub_1BE614ED8;
      v170[5] = &unk_1BE94989A;
      memset(v171, 0, sizeof(v171));
      v168[0] = 0;
      v168[1] = v168;
      v168[2] = 0x6012000000;
      v168[3] = sub_1BE614F28;
      v168[4] = sub_1BE614F68;
      v168[5] = &unk_1BE94989A;
      memset(v169, 0, sizeof(v169));
      v166[0] = 0;
      v166[1] = v166;
      v166[2] = 0x6012000000;
      v166[3] = sub_1BE614F28;
      v166[4] = sub_1BE614F68;
      v166[5] = &unk_1BE94989A;
      memset(v167, 0, sizeof(v167));
      v162[0] = 0;
      v162[1] = v162;
      v162[2] = 0x6012000000;
      v162[3] = sub_1BE611148;
      v162[4] = sub_1BE611188;
      v162[5] = &unk_1BE94989A;
      __p = 0u;
      v164 = 0u;
      v165 = 0u;
      v160[0] = 0;
      v160[1] = v160;
      v160[2] = 0x3032000000;
      v160[3] = sub_1BE618EC4;
      v160[4] = sub_1BE618ED4;
      v161 = 0;
      objc_msgSend_result(v5, v102, v103, v104, v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v5, v108, v109, v110, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend_tokenColumnCount(v113, v114, v115, v116, v117, v118);
      v148[0] = MEMORY[0x1E0C809B0];
      v148[1] = 3221225472;
      v148[2] = sub_1BE618EDC;
      v148[3] = &unk_1E77F2098;
      v154 = v160;
      v155 = v170;
      v120 = v94;
      v149 = v120;
      v150 = self;
      v156 = buf;
      v157 = v168;
      v158 = v166;
      v159 = v162;
      v151 = v146;
      v152 = v5;
      v121 = v101;
      v153 = v121;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v107, v122, (uint64_t)v69, 0, v119, (uint64_t)v148);

      objc_msgSend_addObject_(v147, v123, (uint64_t)v121, v124, v125, v126);
      _Block_object_dispose(v160, 8);

      _Block_object_dispose(v162, 8);
      v127 = (void **)*((_QWORD *)&__p + 1);
      v128 = (void **)v164;
      *((_QWORD *)&v165 + 1) = 0;
      v129 = v164 - *((_QWORD *)&__p + 1);
      if ((_QWORD)v164 - *((_QWORD *)&__p + 1) >= 0x11uLL)
      {
        do
        {
          operator delete(*v127);
          v128 = (void **)v164;
          v127 = (void **)(*((_QWORD *)&__p + 1) + 8);
          *((_QWORD *)&__p + 1) = v127;
          v129 = v164 - (_QWORD)v127;
        }
        while ((_QWORD)v164 - (_QWORD)v127 > 0x10uLL);
      }
      v130 = v129 >> 3;
      if (v130 == 1)
        break;
      if (v130 == 2)
      {
        v131 = 512;
LABEL_15:
        *(_QWORD *)&v165 = v131;
      }
      if (v127 != v128)
      {
        do
        {
          v132 = *v127++;
          operator delete(v132);
        }
        while (v127 != v128);
        if ((_QWORD)v164 != *((_QWORD *)&__p + 1))
          *(_QWORD *)&v164 = v164 + ((*((_QWORD *)&__p + 1) - v164 + 7) & 0xFFFFFFFFFFFFFFF8);
      }
      if ((_QWORD)__p)
        operator delete((void *)__p);
      _Block_object_dispose(v166, 8);
      sub_1BE61BEF4((uint64_t)v167);
      _Block_object_dispose(v168, 8);
      sub_1BE61BEF4((uint64_t)v169);
      _Block_object_dispose(v170, 8);
      sub_1BE61BEF4((uint64_t)v171);
      _Block_object_dispose(buf, 8);
      sub_1BE61BEF4((uint64_t)v178);

    }
    v131 = 256;
    goto LABEL_15;
  }
LABEL_23:

  return v5;
}

@end
