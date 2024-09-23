@implementation CHUpdateTokenPropertyForUnitConversionStep

- (id)process:(id)a3 options:(id)a4
{
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
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  const char *v60;
  _BOOL4 v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int isEqualToString;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  BOOL v100;
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
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
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
  uint64_t v140;
  uint64_t v141;
  id v142;
  const char *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  CHTokenizedMathResult *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  id v159;
  id obj;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  id v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  const char *v171;
  _QWORD v172[4];
  id v173;
  _QWORD *v174;
  uint8_t *v175;
  uint64_t v176;
  const char *v177;
  _QWORD v178[3];
  char v179;
  uint8_t buf[8];
  uint8_t *v181;
  uint64_t v182;
  char v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _BYTE v188[128];
  uint64_t v189;

  v189 = *MEMORY[0x1E0C80C00];
  v165 = a3;
  v159 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHUpdateTokenPropertyForUnitConversionStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_result(v165, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topTranscription(v17, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v23, v24, (uint64_t)CFSTR(" "), (uint64_t)&stru_1E77F6F28, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v27, v28, (uint64_t)CFSTR("\\$"), (uint64_t)CFSTR("$"), v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v31, v32, (uint64_t)CFSTR("\\,"), (uint64_t)CFSTR("\\"), v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = objc_msgSend_length(v35, v36, v37, v38, v39, v40);
  objc_msgSend_unitConversionKeywordsFromOptions_(self, v42, (uint64_t)v159, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = 0u;
  v187 = 0u;
  v184 = 0u;
  v185 = 0u;
  obj = v46;
  v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v184, (uint64_t)v188, 16, v48);
  if (v50)
  {
    v166 = 0;
    v161 = *(_QWORD *)v185;
    v168 = 0x7FFFFFFFFFFFFFFFLL;
    v170 = 0;
LABEL_7:
    v51 = 0;
    v162 = v50;
    while (1)
    {
      if (*(_QWORD *)v185 != v161)
        objc_enumerationMutation(obj);
      v52 = 0;
      v164 = v51;
      v53 = *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * v51);
      v167 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v54 = objc_msgSend_rangeOfString_options_range_(v35, v49, v53, 1, v52, v41, v159);
        v59 = v54;
        if (v54 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v60 = v49;
        v52 = (unint64_t)&v49[v54];
        v61 = v54 >= 2 && v52 <= objc_msgSend_length(v35, v49, v55, v56, v57, v58) - 2;
        objc_msgSend_substringWithRange_(v35, v49, v59 - 1, 1, v57, v58);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v62, v63, (uint64_t)CFSTR("\\"), v64, v65, v66);

        objc_msgSend_substringWithRange_(v35, v68, v52, 1, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend_isEqualToString_(v71, v72, (uint64_t)CFSTR("\\"), v73, v74, v75);

        if ((v61 & isEqualToString & v76 & 1) != 0)
        {
          v166 = v60;
          v167 = v59;
          break;
        }
        if ((v61 & (isEqualToString | v76) & 1) != 0)
        {
          v166 = v60;
          v167 = v59;
        }
        else
        {
          if (v61)
            v77 = v60;
          else
            v77 = v170;
          v78 = v168;
          if (v61)
            v78 = v59;
          v168 = v78;
          v170 = v77;
        }
        v41 = objc_msgSend_length(v35, v49, v55, v56, v57, v58) - v52;
      }
      while (v52 != 0x7FFFFFFFFFFFFFFFLL);
      if (v167 != 0x7FFFFFFFFFFFFFFFLL)
        break;
      v41 = objc_msgSend_length(v35, v49, v55, v56, v57, v58);
      v51 = v164 + 1;
      if (v164 + 1 == v162)
      {
        v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v184, (uint64_t)v188, 16, v79);
        if (v50)
          goto LABEL_7;
        goto LABEL_32;
      }
    }
  }
  else
  {
    v166 = 0;
    v168 = 0x7FFFFFFFFFFFFFFFLL;
    v170 = 0;
LABEL_32:
    v167 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v85 = 0;
  if (v167 == 0x7FFFFFFFFFFFFFFFLL)
    v86 = v170;
  else
    v86 = v166;
  v87 = v168;
  if (v167 != 0x7FFFFFFFFFFFFFFFLL)
    v87 = v167;
  v169 = v87;
  v171 = v86;
  while (1)
  {
    objc_msgSend_result(v165, v80, v81, v82, v83, v84, v159);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v88, v89, v90, v91, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v85 < objc_msgSend_count(v94, v95, v96, v97, v98, v99);

    if (!v100)
      break;
    objc_msgSend_result(v165, v101, v102, v103, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v106, v107, v108, v109, v110, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v112, v113, v85, v114, v115, v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v118, v119, v120, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v181 = buf;
    v182 = 0x2020000000;
    v183 = 0;
    v178[0] = 0;
    v178[1] = v178;
    v178[2] = 0x2020000000;
    v179 = 0;
    objc_msgSend_result(v165, v124, v125, v126, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v165, v130, v131, v132, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = objc_msgSend_tokenColumnCount(v135, v136, v137, v138, v139, v140);
    v172[0] = MEMORY[0x1E0C809B0];
    v172[1] = 3221225472;
    v172[2] = sub_1BE6125EC;
    v172[3] = &unk_1E77F1F10;
    v142 = v123;
    v173 = v142;
    v174 = v178;
    v175 = buf;
    v176 = v169;
    v177 = v171;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v129, v143, (uint64_t)v117, 0, v141, (uint64_t)v172);

    objc_msgSend_addObject_(v163, v144, (uint64_t)v142, v145, v146, v147);
    _Block_object_dispose(v178, 8);
    _Block_object_dispose(buf, 8);

    ++v85;
  }
  v148 = [CHTokenizedMathResult alloc];
  v153 = (void *)objc_msgSend_initWithBestPathTokens_(v148, v149, (uint64_t)v163, v150, v151, v152);
  objc_msgSend_setResult_(v165, v154, (uint64_t)v153, v155, v156, v157);

  return v165;
}

- (id)unitConversionKeywordsFromOptions:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE6128CC;
  block[3] = &unk_1E77F1F38;
  v11 = v3;
  v4 = qword_1EF567EE0;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&qword_1EF567EE0, block);
    v7 = v11;
  }
  v8 = (id)qword_1EF567ED8;

  return v8;
}

@end
