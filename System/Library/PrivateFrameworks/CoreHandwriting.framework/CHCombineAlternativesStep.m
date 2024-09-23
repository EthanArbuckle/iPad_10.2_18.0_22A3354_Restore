@implementation CHCombineAlternativesStep

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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL4 v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
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
  BOOL v59;
  id v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _BOOL4 v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t k;
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
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  CHTokenizedMathResult *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  id v155;
  void *v156;
  id obj;
  void *v158;
  void *i;
  id v160;
  _QWORD v161[4];
  id v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  uint8_t buf[8];
  _BYTE v172[128];
  _BYTE v173[128];
  uint64_t v174;

  v174 = *MEMORY[0x1E0C80C00];
  v160 = a3;
  v155 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEBUG, "CHCombineAlternativesStep is running", buf, 2u);
  }

  v6 = (void *)MEMORY[0x1E0C99E10];
  objc_msgSend_result(v160, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_orderedSetWithArray_(v6, v19, (uint64_t)v18, v20, v21, v22);
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v23, v24, v25, v26, v27);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  for (i = 0; ; i = v96)
  {
    objc_msgSend_result(v160, v28, v29, v30, v31, v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v34 < objc_msgSend_tokenColumnCount(v35, v36, v37, v38, v39, v40);

    if (!v41)
      break;
    v47 = 0;
    if (v34)
    {
      while (1)
      {
        objc_msgSend_result(v160, v42, v43, v44, v45, v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_tokenRowsAtColumnIndex_(v48, v49, v34, v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v47 < objc_msgSend_count(v53, v54, v55, v56, v57, v58);

        if (!v59)
          break;
        v169 = 0u;
        v170 = 0u;
        v167 = 0u;
        v168 = 0u;
        v60 = i;
        v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v167, (uint64_t)v173, 16, v62);
        if (v67)
        {
          v68 = *(_QWORD *)v168;
          do
          {
            for (j = 0; j != v67; ++j)
            {
              if (*(_QWORD *)v168 != v68)
                objc_enumerationMutation(v60);
              objc_msgSend_indexPathByAddingIndex_(*(void **)(*((_QWORD *)&v167 + 1) + 8 * j), v63, v47, v64, v65, v66);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v33, v71, (uint64_t)v70, v72, v73, v74);

            }
            v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v63, (uint64_t)&v167, (uint64_t)v173, 16, v66);
          }
          while (v67);
        }

        ++v47;
      }
    }
    else
    {
      while (1)
      {
        objc_msgSend_result(v160, v42, v43, v44, v45, v46);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_tokenRowsAtColumnIndex_(v80, v81, 0, v82, v83, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v47 < objc_msgSend_count(v85, v86, v87, v88, v89, v90);

        if (!v91)
          break;
        objc_msgSend_indexPathWithIndex_(MEMORY[0x1E0CB36B0], v92, v47, v93, v94, v95);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v33, v76, (uint64_t)v75, v77, v78, v79);

        ++v47;
      }
    }
    v96 = v33;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v97, v98, v99, v100, v101);
    v102 = objc_claimAutoreleasedReturnValue();

    ++v34;
    v33 = (void *)v102;
  }
  objc_msgSend_addObjectsFromArray_(v156, v42, (uint64_t)i, v44, v45, v46);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v103, v104, v105, v106, v107);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  obj = v156;
  v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v108, (uint64_t)&v163, (uint64_t)v172, 16, v109);
  if (v115)
  {
    v116 = *(_QWORD *)v164;
    do
    {
      for (k = 0; k != v115; ++k)
      {
        if (*(_QWORD *)v164 != v116)
          objc_enumerationMutation(obj);
        v118 = *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * k);
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v110, v111, v112, v113, v114);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v160, v120, v121, v122, v123, v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v160, v126, v127, v128, v129, v130);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v137 = objc_msgSend_tokenColumnCount(v131, v132, v133, v134, v135, v136);
        v161[0] = MEMORY[0x1E0C809B0];
        v161[1] = 3221225472;
        v161[2] = sub_1BE61A4C8;
        v161[3] = &unk_1E77F1EC8;
        v138 = v119;
        v162 = v138;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v125, v139, v118, 0, v137, (uint64_t)v161);

        objc_msgSend_addObject_(v158, v140, (uint64_t)v138, v141, v142, v143);
      }
      v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v110, (uint64_t)&v163, (uint64_t)v172, 16, v114);
    }
    while (v115);
  }

  v144 = [CHTokenizedMathResult alloc];
  v149 = (void *)objc_msgSend_initWithBestPathTokens_(v144, v145, (uint64_t)v158, v146, v147, v148);
  objc_msgSend_setResult_(v160, v150, (uint64_t)v149, v151, v152, v153);

  return v160;
}

@end
