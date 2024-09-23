@implementation CHTokenizedMathResult

- (CHTokenizedMathResult)initWithBestPathTokens:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (CHTokenizedMathResult *)objc_msgSend_initWithBestPathTokens_isMinimalDrawingResult_(self, a2, (uint64_t)a3, 0, v3, v4);
}

- (CHTokenizedMathResult)initWithBestPathTokens:(id)a3 isMinimalDrawingResult:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CHTokenizedMathResult *v7;
  char *v8;
  char *v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  char *v19;
  objc_super v20;

  v4 = a4;
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CHTokenizedMathResult;
  v7 = -[CHTokenizedResult initWithIsMinimalDrawingResult:](&v20, sel_initWithIsMinimalDrawingResult_, v4);
  if (v7)
  {
    v18 = 0;
    v19 = 0;
    sub_1BE71B8A4((uint64_t)CHTokenizedMathResult, v6, &v19, &v18);
    v8 = v19;
    v9 = v19;
    v10 = v18;
    v11 = v18;
    objc_storeStrong((id *)&v7->_tokenColumns, v8);
    objc_storeStrong((id *)&v7->_transcriptionPaths, v10);
    v7->_baseCharacterHeight = -1.0;
    sub_1BE71D448((uint64_t)v7, v12, v13, v14, v15, v16);

  }
  return v7;
}

- (CHTokenizedMathResult)initWithSegmentedBestPathTokens:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t i;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t j;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  unint64_t k;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  CHTokenizedMathResult *isMinimalDrawingResult;
  CHTokenizedMathResult *v105;
  void *v106;
  void *v107;
  id obj;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v105 = self;
  v119 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5, v6, v7, v8);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11, v12, v13);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_count(v3, v14, v15, v16, v17, v18, v105); ++i)
  {
    if (i)
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v20, v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      obj = v106;
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v113, (uint64_t)v118, 16, v27);
      if (v32)
      {
        v33 = *(_QWORD *)v114;
        do
        {
          v34 = 0;
          do
          {
            if (*(_QWORD *)v114 != v33)
              objc_enumerationMutation(obj);
            v35 = 0;
            v36 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v34);
            while (1)
            {
              objc_msgSend_objectAtIndexedSubscript_(v3, v28, i, v29, v30, v31);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v35 < objc_msgSend_count(v37, v38, v39, v40, v41, v42);

              if (!v43)
                break;
              objc_msgSend_indexPathByAddingIndex_(v36, v28, v35, v29, v30, v31);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v25, v45, (uint64_t)v44, v46, v47, v48);

              ++v35;
            }
            ++v34;
          }
          while (v34 != v32);
          v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v113, (uint64_t)v118, 16, v31);
        }
        while (v32);
      }

      v106 = v25;
    }
    else
    {
      for (j = 0; ; ++j)
      {
        objc_msgSend_objectAtIndexedSubscript_(v3, v20, 0, v22, v23, v24);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = j < objc_msgSend_count(v50, v51, v52, v53, v54, v55);

        if (!v56)
          break;
        objc_msgSend_indexPathWithIndex_(MEMORY[0x1E0CB36B0], v14, j, v16, v17, v18);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v106, v58, (uint64_t)v57, v59, v60, v61);

      }
    }
  }
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v62 = v106;
  v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v109, (uint64_t)v117, 16, v64);
  if (v70)
  {
    v71 = *(_QWORD *)v110;
    do
    {
      v72 = 0;
      do
      {
        if (*(_QWORD *)v110 != v71)
          objc_enumerationMutation(v62);
        v73 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v72);
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v65, v66, v67, v68, v69);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        for (k = 0; k < objc_msgSend_length(v73, v74, v75, v76, v77, v78); ++k)
        {
          v85 = objc_msgSend_indexAtPosition_(v73, v81, k, v82, v83, v84);
          objc_msgSend_objectAtIndexedSubscript_(v3, v86, k, v87, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v90, v91, v85, v92, v93, v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v79, v96, (uint64_t)v95, v97, v98, v99);

        }
        objc_msgSend_addObject_(v107, v81, (uint64_t)v79, v82, v83, v84);

        ++v72;
      }
      while (v72 != v70);
      v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v109, (uint64_t)v117, 16, v69);
    }
    while (v70);
  }

  isMinimalDrawingResult = (CHTokenizedMathResult *)objc_msgSend_initWithBestPathTokens_isMinimalDrawingResult_(v105, v100, (uint64_t)v107, 0, v101, v102);
  return isMinimalDrawingResult;
}

- (id)newResultWithScrubbedStrokes:(id)a3 scrubbedValueTokens:(id)a4 scrubbedValueStrokeIndexes:(id)a5 scrubbedValueDrawing:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
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
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t Index;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  CHTokenizedMathResult *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v79;
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  uint64_t *v88;
  _QWORD *v89;
  _QWORD *v90;
  uint64_t v91;
  _QWORD v92[61];
  _QWORD v93[3];
  char v94;
  _QWORD v95[3];
  char v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  char v100;
  id v101;
  uint8_t buf[4];
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v80 = a6;
  v18 = objc_msgSend_count(v11, v13, v14, v15, v16, v17);
  if (v18 != objc_msgSend_count(v12, v19, v20, v21, v22, v23))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v24 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      v103 = objc_msgSend_count(v11, v25, v26, v27, v28, v29);
      v104 = 2048;
      v105 = objc_msgSend_count(v12, v30, v31, v32, v33, v34);
      _os_log_impl(&dword_1BE607000, v24, OS_LOG_TYPE_FAULT, "Number of strings (%lu) doesn't match number of segments (%lu) of the provided scrubbed value.", buf, 0x16u);
    }

  }
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 1;
  v95[0] = 0;
  v95[1] = v95;
  v95[2] = 0x2020000000;
  v96 = 0;
  v93[0] = 0;
  v93[1] = v93;
  v93[2] = 0x2020000000;
  v94 = 0;
  sub_1BE61CB7C((uint64_t)buf);
  Index = objc_msgSend_firstIndex(v10, v35, v36, v37, v38, v39);
  v46 = objc_msgSend_strokeCount(v80, v41, v42, v43, v44, v45);
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v47, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v53, v54, v55, v56, v57, v52, v12, v11, v10);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3321888768;
  v81[2] = sub_1BE71DF64;
  v81[3] = &unk_1E77F42F8;
  v88 = &v97;
  v58 = v10;
  v82 = v58;
  v89 = v95;
  v59 = v11;
  v83 = v59;
  v60 = v12;
  v84 = v60;
  v91 = Index;
  v61 = v80;
  v85 = v61;
  sub_1BE7284AC((uint64_t)v92, (uint64_t)buf);
  v62 = v79;
  v86 = v62;
  v63 = v52;
  v87 = v63;
  v90 = v93;
  v92[60] = v46;
  objc_msgSend_enumerateTokensInPreferredTranscriptionPathWithBlock_(self, v64, (uint64_t)v81, v65, v66, v67);
  if (*((_BYTE *)v98 + 24))
  {
    v68 = [CHTokenizedMathResult alloc];
    v101 = v62;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v69, (uint64_t)&v101, 1, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (void *)objc_msgSend_initWithBestPathTokens_(v68, v73, (uint64_t)v72, v74, v75, v76);

  }
  else
  {
    v77 = 0;
  }

  sub_1BE61C7EC((uint64_t)v92);
  sub_1BE61C7EC((uint64_t)buf);
  _Block_object_dispose(v93, 8);
  _Block_object_dispose(v95, 8);
  _Block_object_dispose(&v97, 8);

  return v77;
}

+ (BOOL)areTokenRowsEquivalent:(id)a3 otherRow:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __CFString *v55;
  uint64_t v56;
  __CFString *v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char isEqualToIndexSet;
  id v84;
  id obj;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v84 = a4;
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v6, v7, v8, v9, v10, v5);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v5;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v91, (uint64_t)v96, 16, v12);
  if (v18)
  {
    v19 = *(_QWORD *)v92;
    v20 = &stru_1E77F6F28;
    do
    {
      v21 = 0;
      v22 = v20;
      do
      {
        if (*(_QWORD *)v92 != v19)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v21);
        objc_msgSend_string(v23, v13, v14, v15, v16, v17);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v22, v25, (uint64_t)v24, v26, v27, v28);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_strokeIndexes(v23, v29, v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addIndexes_(v86, v35, (uint64_t)v34, v36, v37, v38);

        ++v21;
        v22 = v20;
      }
      while (v18 != v21);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v91, (uint64_t)v96, 16, v17);
    }
    while (v18);
  }
  else
  {
    v20 = &stru_1E77F6F28;
  }

  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v39, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v45 = v84;
  v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v87, (uint64_t)v95, 16, v47);
  if (v53)
  {
    v54 = *(_QWORD *)v88;
    v55 = &stru_1E77F6F28;
    do
    {
      v56 = 0;
      v57 = v55;
      do
      {
        if (*(_QWORD *)v88 != v54)
          objc_enumerationMutation(v45);
        v58 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v56);
        objc_msgSend_string(v58, v48, v49, v50, v51, v52);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v57, v60, (uint64_t)v59, v61, v62, v63);
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_strokeIndexes(v58, v64, v65, v66, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addIndexes_(v44, v70, (uint64_t)v69, v71, v72, v73);

        ++v56;
        v57 = v55;
      }
      while (v53 != v56);
      v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v87, (uint64_t)v95, 16, v52);
    }
    while (v53);
  }
  else
  {
    v55 = &stru_1E77F6F28;
  }

  if (objc_msgSend_isEqualToString_(v20, v74, (uint64_t)v55, v75, v76, v77))
    isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v86, v78, (uint64_t)v44, v79, v80, v81);
  else
    isEqualToIndexSet = 0;

  return isEqualToIndexSet;
}

+ (int64_t)mergeTokenRow:(id)a3 intoUniqueRows:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t i;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  unint64_t j;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int isEquivalentToToken;
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
  double v75;
  double v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;

  v5 = a3;
  v6 = a4;
  v7 = 0;
  for (i = objc_msgSend_count(v6, v8, v9, v10, v11, v12); v7 < i; i = objc_msgSend_count(v6, v18, v19, v20, v21, v22))
  {
    objc_msgSend_objectAtIndexedSubscript_(v6, v14, v7, v15, v16, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_areTokenRowsEquivalent_otherRow_(CHTokenizedMathResult, v24, (uint64_t)v5, (uint64_t)v23, v25, v26))
    {
      v32 = objc_msgSend_count(v23, v27, v28, v29, v30, v31);
      if (v32 != objc_msgSend_count(v5, v33, v34, v35, v36, v37))
        goto LABEL_16;
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v38, v39, v40, v41, v42);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; j < objc_msgSend_count(v5, v43, v44, v45, v46, v47); ++j)
      {
        objc_msgSend_objectAtIndexedSubscript_(v5, v50, j, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v23, v55, j, v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        isEquivalentToToken = objc_msgSend_isEquivalentToToken_(v54, v60, (uint64_t)v59, v61, v62, v63);

        if (!isEquivalentToToken)
        {

          goto LABEL_3;
        }
        objc_msgSend_objectAtIndexedSubscript_(v5, v65, j, v66, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_score(v69, v70, v71, v72, v73, v74);
        v76 = v75;
        objc_msgSend_objectAtIndexedSubscript_(v23, v77, j, v78, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_score(v81, v82, v83, v84, v85, v86);
        v88 = v87;

        if (v76 <= v88)
          objc_msgSend_objectAtIndexedSubscript_(v23, v89, j, v90, v91, v92);
        else
          objc_msgSend_objectAtIndexedSubscript_(v5, v89, j, v90, v91, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v48, v94, (uint64_t)v93, v95, v96, v97);

      }
      if (v48)
      {
        objc_msgSend_setObject_atIndexedSubscript_(v6, v50, (uint64_t)v48, v7, v52, v53);

LABEL_16:
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_18;
        break;
      }
    }
LABEL_3:

    ++v7;
  }
  objc_msgSend_addObject_(v6, v14, (uint64_t)v5, v15, v16, v17);
  v7 = objc_msgSend_count(v6, v98, v99, v100, v101, v102) - 1;
LABEL_18:

  return v7;
}

- (CHTokenizedMathResult)initWithCoder:(id)a3
{
  id v4;
  CHTokenizedMathResult *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *tokenColumns;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *transcriptionPaths;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSNumber *selectedTranscriptionPathIndex;
  NSArray *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  char v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  NSObject *v63;
  uint8_t buf[16];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  objc_super v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)CHTokenizedMathResult;
  v5 = -[CHTokenizedResult initWithCoder:](&v70, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v12, v8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v13, (uint64_t)CFSTR("tokenColumns"), v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    tokenColumns = v5->_tokenColumns;
    v5->_tokenColumns = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend_setWithObjects_(v19, v22, v20, v23, v24, v25, v21, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v27, (uint64_t)v26, (uint64_t)CFSTR("transcriptionPaths"), v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    transcriptionPaths = v5->_transcriptionPaths;
    v5->_transcriptionPaths = (NSArray *)v30;

    v32 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, (uint64_t)CFSTR("selectedTranscriptionPathIndex"), v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    selectedTranscriptionPathIndex = v5->_selectedTranscriptionPathIndex;
    v5->_selectedTranscriptionPathIndex = (NSNumber *)v36;

    v5->_baseCharacterHeight = -1.0;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v38 = v5->_tokenColumns;
    v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v66, (uint64_t)v71, 16, v40);
    if (v46)
    {
      v47 = *(_QWORD *)v67;
      while (2)
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v67 != v47)
            objc_enumerationMutation(v38);
          objc_msgSend_tokenRows(*(void **)(*((_QWORD *)&v66 + 1) + 8 * i), v41, v42, v43, v44, v45);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend_count(v49, v50, v51, v52, v53, v54) == 0;

          if (v55)
          {
            v56 = 0;
            goto LABEL_12;
          }
        }
        v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v66, (uint64_t)v71, 16, v45);
        if (v46)
          continue;
        break;
      }
    }
    v56 = 1;
LABEL_12:

    if (!v5->_tokenColumns)
      goto LABEL_17;
    v62 = v56 ^ 1;
    if (!v5->_transcriptionPaths)
      v62 = 1;
    if ((v62 & 1) != 0)
    {
LABEL_17:
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v63 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v63, OS_LOG_TYPE_ERROR, "CHTokenizedMathResult decoding failed. Token columns and transcription paths are required to be nonnull when constructing a text result.", buf, 2u);
      }

      v5 = 0;
    }
    else
    {
      sub_1BE71D448((uint64_t)v5, v57, v58, v59, v60, v61);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHTokenizedMathResult;
  -[CHTokenizedResult encodeWithCoder:](&v14, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_tokenColumns, (uint64_t)CFSTR("tokenColumns"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_transcriptionPaths, (uint64_t)CFSTR("transcriptionPaths"), v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_selectedTranscriptionPathIndex, (uint64_t)CFSTR("selectedTranscriptionPathIndex"), v12, v13);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
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
  float v15;
  float v16;
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
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)CHTokenizedMathResult;
  -[CHTokenizedResult description](&v41, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(self->_transcriptionPathScores, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v9, v10, v11, v12, v13, v14);
  v16 = v15;
  objc_msgSend_strokeIndexes(self, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_debugDescription(v22, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredTranscription(self, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v35, (uint64_t)CFSTR(" Score = %.2f, Strokes: %@ \n Latex: \"%@\"), v36, v37, v38, v16, v28, v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (id)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend_description(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v7, v8, (uint64_t)CFSTR("\nTranscription candidates:\n"), v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend_transcriptionPaths(self, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v40, (uint64_t)v44, 16, v20);
  if (v26)
  {
    v27 = *(_QWORD *)v41;
    do
    {
      v28 = 0;
      v29 = v12;
      do
      {
        if (*(_QWORD *)v41 != v27)
          objc_enumerationMutation(v18);
        v30 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v28);
        v31 = objc_msgSend_tokenColumnCount(self, v21, v22, v23, v24, v25);
        objc_msgSend_transcriptionWithPath_columnRange_(self, v32, v30, 0, v31, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingFormat_(v29, v35, (uint64_t)CFSTR("\n\"%@\"), v36, v37, v38, v34);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        ++v28;
        v29 = v12;
      }
      while (v26 != v28);
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v40, (uint64_t)v44, 16, v25);
    }
    while (v26);
  }

  return v12;
}

- (id)tokenColumns
{
  return self->_tokenColumns;
}

- (int64_t)tokenColumnCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend_count(self->_tokenColumns, a2, v2, v3, v4, v5);
}

- (id)strokeIndexes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  NSArray *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_tokenColumns;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v25, (uint64_t)v29, 16, v10);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v8);
        objc_msgSend_strokeIndexes(*(void **)(*((_QWORD *)&v25 + 1) + 8 * v18), v11, v12, v13, v14, v15, (_QWORD)v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addIndexes_(v7, v20, (uint64_t)v19, v21, v22, v23);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v25, (uint64_t)v29, 16, v15);
    }
    while (v16);
  }

  return v7;
}

- (id)tokenRowsAtColumnIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, a2, a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mathTokenRows(v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)tokensInTranscriptionPath:(id)a3 atColumnIndex:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  const char *v9;
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
  void *v24;

  v8 = objc_msgSend_indexAtPosition_(a3, a2, a4, a4, v4, v5);
  objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v9, a4, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mathTokenRows(v13, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v19, v20, v8, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)tokenAtLocation:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, a2, a3->var0, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mathTokenRows(v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v13, v14, a3->var1, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v18, v19, a3->var2, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSArray)symbolStrokeIndexes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BE71FA24;
  v14[3] = &unk_1E77F1EC8;
  v8 = v7;
  v15 = v8;
  objc_msgSend_enumerateTokensInPreferredTranscriptionPathWithBlock_(self, v9, (uint64_t)v14, v10, v11, v12);

  return (NSArray *)v8;
}

- (NSArray)symbolBounds
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BE71FB18;
  v14[3] = &unk_1E77F1EC8;
  v8 = v7;
  v15 = v8;
  objc_msgSend_enumerateTokensInPreferredTranscriptionPathWithBlock_(self, v9, (uint64_t)v14, v10, v11, v12);

  return (NSArray *)v8;
}

- (double)score
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;

  v7 = objc_msgSend_tokenColumnCount(self, a2, v2, v3, v4, v5);
  MEMORY[0x1E0DE7D20](self, sel_geometricMeanTokenScoreForColumnRange_, 0, v7, v8, v9);
  return result;
}

- (double)absoluteProbability
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;

  v7 = objc_msgSend_tokenColumnCount(self, a2, v2, v3, v4, v5);
  MEMORY[0x1E0DE7D20](self, sel_scoreForColumnRange_, 0, v7, v8, v9);
  return result;
}

- (BOOL)hasLowConfidence
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v6;
  BOOL v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  if (qword_1EF568C40 != -1)
    dispatch_once(&qword_1EF568C40, &unk_1E77EF428);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0x3FF0000000000000;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BE71FDC4;
  v9[3] = &unk_1E77F4358;
  v9[4] = &v22;
  v9[5] = &v18;
  v9[6] = &v14;
  v9[7] = &v10;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(self, a2, (uint64_t)v9, v2, v3, v4);
  v6 = exp(v19[3] / (double)v23[3]);
  v7 = 1;
  if (!*((_BYTE *)v11 + 24) && v6 >= 0.35)
    v7 = v15[3] < 0.001;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v7;
}

- (id)strokeIndexesForColumnsInRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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

  length = a3.length;
  location = a3.location;
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], a2, a3.location, a3.length, v3, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (location < location + length)
  {
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v8, location, v9, v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeIndexes(v13, v14, v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addIndexes_(v12, v20, (uint64_t)v19, v21, v22, v23);

      ++location;
      --length;
    }
    while (length);
  }
  return v12;
}

- (double)scoreForColumnRange:(_NSRange)a3
{
  double result;

  ((void (*)(CHTokenizedMathResult *, char *, NSUInteger, NSUInteger))MEMORY[0x1E0DE7D20])(self, sel_geometricMeanTokenScoreForColumnRange_, a3.location, a3.length);
  return result;
}

- (double)averageTokenScoreForColumnRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger location;
  unint64_t v6;
  double v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t j;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double result;
  NSUInteger v42;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v42 = a3.location + a3.length;
  if (a3.location >= a3.location + a3.length)
  {
    result = NAN;
  }
  else
  {
    location = a3.location;
    v6 = 0;
    v7 = 0.0;
    do
    {
      v44 = v6;
      objc_msgSend_tokenRowsAtColumnIndex_(self, a2, location, a3.length, v3, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v9 = v8;
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v49, (uint64_t)v54, 16, v11);
      if (v12)
      {
        v13 = *(_QWORD *)v50;
        v14 = 0.0;
        v15 = 1;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v50 != v13)
              objc_enumerationMutation(v9);
            v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v18 = v17;
            v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v45, (uint64_t)v53, 16, v20);
            if (v26)
            {
              v27 = *(_QWORD *)v46;
              v28 = 0.0;
              do
              {
                for (j = 0; j != v26; ++j)
                {
                  if (*(_QWORD *)v46 != v27)
                    objc_enumerationMutation(v18);
                  objc_msgSend_score(*(void **)(*((_QWORD *)&v45 + 1) + 8 * j), v21, v22, v23, v24, v25);
                  v28 = v28 + v30;
                }
                v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v45, (uint64_t)v53, 16, v25);
              }
              while (v26);
            }
            else
            {
              v28 = 0.0;
            }

            if (v28 / (double)(unint64_t)objc_msgSend_count(v18, v31, v32, v33, v34, v35) > v14 / (double)(unint64_t)v15)
            {
              v15 = objc_msgSend_count(v18, v36, v37, v38, v39, v40);
              v14 = v28;
            }
          }
          v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v36, (uint64_t)&v49, (uint64_t)v54, 16, v40);
        }
        while (v12);
      }
      else
      {
        v14 = 0.0;
        v15 = 1;
      }

      v7 = v7 + v14;
      v6 = v15 + v44;
      ++location;
    }
    while (location != v42);
    result = v7 / (double)v6;
  }
  if (result > 1.0)
    return 1.0;
  return result;
}

- (double)geometricMeanTokenScoreForColumnRange:(_NSRange)a3
{
  uint64_t v3;
  double result;

  objc_msgSend_geometricMeanTokenScoreForColumnRange_transcriptionPath_(self, a2, a3.location, a3.length, 0, v3);
  return result;
}

- (double)geometricMeanTokenScoreForColumnRange:(_NSRange)a3 transcriptionPath:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
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
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t i;
  long double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  uint64_t k;
  long double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  NSUInteger v80;
  unint64_t v82;
  void *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  length = a3.length;
  location = a3.location;
  v100 = *MEMORY[0x1E0C80C00];
  v84 = a4;
  v80 = location + length;
  if (location >= location + length)
  {
    v76 = NAN;
  }
  else
  {
    v10 = 0;
    v11 = 0.0;
    do
    {
      objc_msgSend_tokenRowsAtColumnIndex_(self, v6, location, v7, v8, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v10;
      v83 = v16;
      if (v84
        && (v17 = objc_msgSend_indexAtPosition_(v84, v12, location, v13, v14, v15),
            v17 < objc_msgSend_count(v16, v18, v19, v20, v21, v22)))
      {
        v27 = objc_msgSend_indexAtPosition_(v84, v23, location, v24, v25, v26);
        objc_msgSend_objectAtIndexedSubscript_(v16, v28, v27, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v33 = v32;
        v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v93, (uint64_t)v99, 16, v35);
        if (v41)
        {
          v42 = *(_QWORD *)v94;
          v43 = 0.0;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v94 != v42)
                objc_enumerationMutation(v33);
              objc_msgSend_score(*(void **)(*((_QWORD *)&v93 + 1) + 8 * i), v36, v37, v38, v39, v40);
              v43 = v43 + log(v45);
            }
            v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v93, (uint64_t)v99, 16, v40);
          }
          while (v41);
        }
        else
        {
          v43 = 0.0;
        }

        v50 = objc_msgSend_count(v33, v71, v72, v73, v74, v75);
      }
      else
      {
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v33 = v16;
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v46, (uint64_t)&v89, (uint64_t)v98, 16, v47);
        if (v48)
        {
          v49 = *(_QWORD *)v90;
          v50 = 0x7FFFFFFFFFFFFFFFLL;
          v43 = -3.40282347e38;
          do
          {
            for (j = 0; j != v48; ++j)
            {
              if (*(_QWORD *)v90 != v49)
                objc_enumerationMutation(v33);
              v52 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
              v85 = 0u;
              v86 = 0u;
              v87 = 0u;
              v88 = 0u;
              v53 = v52;
              v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v85, (uint64_t)v97, 16, v55);
              if (v61)
              {
                v62 = *(_QWORD *)v86;
                v63 = 0.0;
                do
                {
                  for (k = 0; k != v61; ++k)
                  {
                    if (*(_QWORD *)v86 != v62)
                      objc_enumerationMutation(v53);
                    objc_msgSend_score(*(void **)(*((_QWORD *)&v85 + 1) + 8 * k), v56, v57, v58, v59, v60);
                    v63 = v63 + log(v65);
                  }
                  v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v85, (uint64_t)v97, 16, v60);
                }
                while (v61);
              }
              else
              {
                v63 = 0.0;
              }

              if (v63 > v43)
              {
                v50 = objc_msgSend_count(v53, v66, v67, v68, v69, v70);
                v43 = v63;
              }
            }
            v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v66, (uint64_t)&v89, (uint64_t)v98, 16, v70);
          }
          while (v48);
        }
        else
        {
          v50 = 0x7FFFFFFFFFFFFFFFLL;
          v43 = -3.40282347e38;
        }
      }

      v11 = v11 + v43;
      v10 = v50 + v82;
      ++location;
    }
    while (location != v80);
    v76 = v11 / (double)v10;
  }
  v77 = exp(v76);
  if (v77 <= 1.0)
    v78 = v77;
  else
    v78 = 1.0;

  return v78;
}

- (BOOL)hasValidPaths
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
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
  uint64_t v46;

  if (objc_msgSend_count(self->_transcriptionPaths, a2, v2, v3, v4, v5))
  {
    v12 = objc_msgSend_count(self->_transcriptionPaths, v7, v8, v9, v10, v11);
    v18 = v12 == objc_msgSend_count(self->_transcriptionPathScores, v13, v14, v15, v16, v17);
    if (!objc_msgSend_count(self->_transcriptionPaths, v19, v20, v21, v22, v23))
      return v18;
  }
  else
  {
    v18 = 0;
    if (!objc_msgSend_count(self->_transcriptionPaths, v7, v8, v9, v10, v11))
      return v18;
  }
  if (!v18)
    return v18;
  objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPaths, v24, 0, v25, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_length(v29, v30, v31, v32, v33, v34);
  v41 = objc_msgSend_count(self->_tokenColumns, v36, v37, v38, v39, v40);

  objc_msgSend_count(self->_transcriptionPaths, v42, v43, v44, v45, v46);
  return v35 == v41;
}

- (BOOL)hasValidColumns
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  BOOL v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
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
  uint64_t v31;
  const char *v32;
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
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
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

  v7 = objc_msgSend_count(self->_tokenColumns, a2, v2, v3, v4, v5);
  v8 = v7 != 0;
  if (objc_msgSend_count(self->_tokenColumns, v9, v10, v11, v12, v13))
    v18 = v7 == 0;
  else
    v18 = 1;
  if (!v18)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v14, 0, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mathTokenRows(v19, v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
    v8 = v31 != 0;

    objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v32, 0, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mathTokenRows(v36, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_count(v42, v43, v44, v45, v46, v47);

    if (v48)
      v54 = v31 == 0;
    else
      v54 = 1;
    if (!v54)
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v49, 0, v51, v52, v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mathTokenRows(v55, v56, v57, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v61, v62, 0, v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend_count(v66, v67, v68, v69, v70, v71) != 0;

      objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v72, 0, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mathTokenRows(v76, v77, v78, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_count(v82, v83, v84, v85, v86, v87);

    }
    objc_msgSend_count(self->_tokenColumns, v49, v50, v51, v52, v53);
  }
  return v8;
}

- (BOOL)isValid
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int hasValidColumns;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  hasValidColumns = objc_msgSend_hasValidColumns(self, a2, v2, v3, v4, v5);
  if (hasValidColumns)
    LOBYTE(hasValidColumns) = MEMORY[0x1E0DE7D20](self, sel_hasValidPaths, v8, v9, v10, v11);
  return hasValidColumns;
}

- (id)topTranscription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  objc_msgSend_firstObject(self->_transcriptionPaths, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  if (v7
    && (v14 = objc_msgSend_length(v7, v8, v9, v10, v11, v12),
        objc_msgSend_transcriptionWithPath_columnRange_(self, v15, (uint64_t)v13, 0, v14, v16),
        (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

    return v17;
  }
  else
  {

    return &stru_1E77F6F28;
  }
}

- (id)preferredTranscription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  __CFString *v45;
  NSObject *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend_selectedTranscriptionPathIndex(self, a2, v2, v3, v4, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && (objc_msgSend_selectedTranscriptionPathIndex(self, v7, v8, v9, v10, v11),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend_integerValue(v13, v14, v15, v16, v17, v18),
        v13,
        v12,
        v19))
  {
    objc_msgSend_selectedTranscriptionPathIndex(self, v7, v8, v9, v10, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_integerValue(v20, v21, v22, v23, v24, v25);

    if (v26 < 1 || v26 >= (unint64_t)objc_msgSend_count(self->_transcriptionPaths, v27, v28, v29, v30, v31))
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v47 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = 134217984;
        v49 = v26;
        _os_log_impl(&dword_1BE607000, v47, OS_LOG_TYPE_ERROR, "Invalid selected transcription path index %lu. Returning empty string.", (uint8_t *)&v48, 0xCu);
      }

      v45 = &stru_1E77F6F28;
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPaths, v32, v26, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_length(v36, v37, v38, v39, v40, v41);
      objc_msgSend_transcriptionWithPath_columnRange_(self, v43, (uint64_t)v36, 0, v42, v44);
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend_topTranscription(self, v7, v8, v9, v10, v11);
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v45;
}

- (id)transcriptionWithPath:(id)a3 columnRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[4];
  id v23;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BE720DBC;
  v22[3] = &unk_1E77F1EC8;
  v14 = v13;
  v23 = v14;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v15, (uint64_t)v7, location, length, (uint64_t)v22);
  objc_msgSend_componentsJoinedByString_(v14, v16, (uint64_t)CFSTR(" "), v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)setSelectedTranscriptionPathIndex:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSNumber *v28;
  NSNumber *selectedTranscriptionPathIndex;
  NSNumber *v30;
  int v31;
  unint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = v4;
  if (v4)
  {
    v16 = objc_msgSend_integerValue(v4, v5, v6, v7, v8, v9);
    if ((v16 & 0x8000000000000000) != 0
      || v16 >= objc_msgSend_count(self->_transcriptionPaths, v11, v12, v13, v14, v15))
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v21 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v27 = objc_msgSend_count(self->_transcriptionPaths, v22, v23, v24, v25, v26);
        v31 = 134218240;
        v32 = v16;
        v33 = 2048;
        v34 = v27;
        _os_log_impl(&dword_1BE607000, v21, OS_LOG_TYPE_FAULT, "Invalid transcription path index %lu. Number of transcription path: %lu", (uint8_t *)&v31, 0x16u);
      }

    }
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v17, v16, v18, v19, v20);
    v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    selectedTranscriptionPathIndex = self->_selectedTranscriptionPathIndex;
    self->_selectedTranscriptionPathIndex = v28;

  }
  else
  {
    v30 = self->_selectedTranscriptionPathIndex;
    self->_selectedTranscriptionPathIndex = 0;

  }
}

- (id)selectedTranscriptionPathIndex
{
  return self->_selectedTranscriptionPathIndex;
}

- (id)renderableLatexCandidatesForColumnIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void **v39;
  uint64_t v40;
  void **v41;
  void **v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
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
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void **v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  void **v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  void *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  BOOL v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  id v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
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
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  id v159;
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
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  unint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  id v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  unint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  uint64_t v228;
  unint64_t k;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  int isEqualToString;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  int v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  char v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  char v297;
  void *v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  void **v307;
  unint64_t v308;
  unint64_t v309;
  void **v310;
  id *v311;
  uint64_t v312;
  id *v313;
  void *v314;
  void **v315;
  void *v316;
  void **v317;
  unint64_t v318;
  void *v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  void *v326;
  id obj;
  uint64_t v329;
  void *v330;
  uint64_t v331;
  uint64_t i;
  id v333;
  void *v334;
  uint64_t v335;
  void **v336;
  uint64_t v337;
  void **v338;
  void **v339;
  uint64_t v340;
  uint64_t v341;
  void **v342;
  uint64_t v343;
  id v344;
  uint64_t v345;
  void **v346;
  uint64_t v347;
  id v348;
  void **v349;
  uint64_t v350;
  void **v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  void **v357;
  uint64_t v358;
  void **v359;
  id v360;
  unint64_t v361;
  void **v362;
  uint64_t v363;
  id v364;
  void **v365;
  void **v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  void *__p[2];
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  _BYTE v378[128];
  uint8_t buf[32];
  __int128 v380;
  _BYTE v381[128];
  uint64_t v382;

  v382 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_tokenColumnCount(self, a2, a3, v3, v4, v5) <= a3)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v13 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend_tokenColumnCount(self, v14, v15, v16, v17, v18);
      _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_FAULT, "Column index %lu out of range. There is %lu columns in the result.", buf, 0x16u);
    }

  }
  if (qword_1EF568D18 != -1)
    dispatch_once(&qword_1EF568D18, &unk_1E77EFD98);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  v376 = 0u;
  v377 = 0u;
  v374 = 0u;
  v375 = 0u;
  objc_msgSend_tokenRowsAtColumnIndex_(self, v19, a3, v20, v21, v22);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v331 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v374, (uint64_t)v381, 16, v24);
  if (v331)
  {
    v329 = *(_QWORD *)v375;
    do
    {
      for (i = 0; i != v331; ++i)
      {
        if (*(_QWORD *)v375 != v329)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v374 + 1) + 8 * i);
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28, v29);
        v334 = (void *)objc_claimAutoreleasedReturnValue();
        v380 = 0u;
        memset(buf, 0, sizeof(buf));
        v372 = 0u;
        v373 = 0u;
        v370 = 0u;
        *(_OWORD *)__p = 0u;
        v367 = 0u;
        v368 = 0u;
        v369 = 0u;
        v333 = v30;
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v333, v31, (uint64_t)&v367, (uint64_t)v378, 16, v32);
        if (!v33)
        {

          v365 = 0;
          v366 = 0;
          v221 = 0;
          v39 = 0;
          v40 = 0;
          v362 = 0;
          goto LABEL_83;
        }
        v361 = 0;
        v362 = 0;
        v39 = 0;
        v363 = 0;
        v365 = 0;
        v366 = 0;
        v335 = 0;
        v336 = 0;
        v40 = 0;
        v337 = 0;
        v338 = 0;
        v347 = 0;
        v349 = 0;
        v341 = 0;
        v342 = 0;
        v350 = 0;
        v351 = 0;
        v41 = 0;
        v339 = 0;
        v340 = 0;
        v42 = 0;
        v345 = 0;
        v346 = 0;
        v343 = 0;
        v43 = 0;
        v352 = *(_QWORD *)v368;
        v353 = 0;
        do
        {
          v355 = v33;
          for (j = 0; j != v355; ++j)
          {
            while (1)
            {
              while (1)
              {
                while (1)
                {
                  v357 = v42;
                  v359 = v41;
                  if (*(_QWORD *)v368 != v352)
                    objc_enumerationMutation(v333);
                  v45 = *(void **)(*((_QWORD *)&v367 + 1) + 8 * j);
                  v46 = (void *)qword_1EF568CE0;
                  objc_msgSend_string(v45, v34, v35, v36, v37, v38);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend_containsObject_(v46, v48, (uint64_t)v47, v49, v50, v51))
                    break;

LABEL_23:
                  objc_msgSend_string(v45, v57, v58, v59, v60, v61);
                  v73 = objc_claimAutoreleasedReturnValue();
                  v74 = v366;
                  if (v365 == v366)
                    v75 = 0;
                  else
                    v75 = (((char *)v365 - (char *)v366) << 6) - 1;
                  v76 = v43 + v363;
                  if (v75 == v43 + v363)
                  {
                    sub_1BE7287C4(buf);
                    v74 = *(void ***)&buf[8];
                    v43 = *((_QWORD *)&v380 + 1);
                    v363 = v380;
                    v365 = *(void ***)&buf[16];
                    v76 = *((_QWORD *)&v380 + 1) + v380;
                  }
                  v366 = v74;
                  (*(_QWORD **)((char *)v74 + ((v76 >> 6) & 0x3FFFFFFFFFFFFF8)))[v76 & 0x1FF] = v73;
                  *((_QWORD *)&v380 + 1) = ++v43;
                  objc_msgSend_array(MEMORY[0x1E0C99DE8], v68, v69, v70, v71, v72);
                  v77 = objc_claimAutoreleasedReturnValue();
                  v79 = v361;
                  v78 = v362;
                  if (v362 == v39)
                    v80 = 0;
                  else
                    v80 = (((char *)v362 - (char *)v39) << 6) - 1;
                  v81 = v40 + v361;
                  if (v80 == v40 + v361)
                  {
                    sub_1BE728E8C(__p);
                    v39 = (void **)__p[1];
                    v78 = (void **)v372;
                    v40 = *((_QWORD *)&v373 + 1);
                    v79 = v373;
                    v81 = *((_QWORD *)&v373 + 1) + v373;
                  }
                  (*(_QWORD **)((char *)v39 + ((v81 >> 6) & 0x3FFFFFFFFFFFFF8)))[v81 & 0x1FF] = v77;
                  *((_QWORD *)&v373 + 1) = ++v40;
                  v335 = v79;
                  v336 = v39;
                  v337 = v79;
                  v338 = v39;
                  v347 = v40;
                  v349 = v39;
                  v341 = v79;
                  v342 = v39;
                  v350 = v79;
                  v351 = v39;
                  v361 = v79;
                  v362 = v78;
                  v41 = v78;
                  v42 = v365;
                  v339 = v366;
                  v340 = v363;
                  v345 = v79;
                  v346 = v366;
                  v353 = v40;
                  v343 = v363;
                  if (v355 == ++j)
                    goto LABEL_61;
                }
                v62 = (void *)qword_1EF568CF0;
                objc_msgSend_string(v45, v52, v53, v54, v55, v56);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v62) = objc_msgSend_containsObject_(v62, v64, (uint64_t)v63, v65, v66, v67);

                if ((_DWORD)v62)
                  goto LABEL_23;
                v82 = (void *)qword_1EF568D00;
                objc_msgSend_string(v45, v57, v58, v59, v60, v61);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v82, v84, (uint64_t)v83, v85, v86, v87);
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = v88 == 0;

                if (v89)
                  break;
                if (!v43)
                  goto LABEL_48;
                v95 = v43 - 1 + v343;
                v96 = v95 >> 9;
                v97 = v95 & 0x1FF;
                v98 = (void *)*((_QWORD *)v346[v95 >> 9] + v97);
                v99 = (void *)qword_1EF568D00;
                objc_msgSend_string(v45, v90, v91, v92, v93, v94);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v99, v101, (uint64_t)v100, v102, v103, v104);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v98) = objc_msgSend_isEqualToString_(v98, v106, (uint64_t)v105, v107, v108, v109);

                if ((_DWORD)v98)
                {
                  v110 = v96;
                  v111 = 8 * v97;
                  v344 = *((id *)v346[v96] + v97);
                  v40 = v353 - 1;
                  v112 = v353 - 1 + v345;
                  v113 = v112 >> 9;
                  v114 = v112 & 0x1FF;
                  v348 = *((id *)v351[v112 >> 9] + v114);

                  v115 = (((char *)v357 - (char *)v339) << 6) - 1;
                  *((_QWORD *)&v380 + 1) = v43 - 1;
                  if (v357 == v339)
                    v115 = 0;
                  if ((unint64_t)(v115 - (v43 + v340) + 1) >= 0x400)
                  {
                    operator delete(*--v357);
                    *(_QWORD *)&buf[16] = v357;
                    v365 = v357;
                  }

                  v116 = (((char *)v359 - (char *)v349) << 6) - 1;
                  *((_QWORD *)&v373 + 1) = v353 - 1;
                  if (v359 == v349)
                    v116 = 0;
                  if ((unint64_t)(v116 - (v353 + v350) + 1) >= 0x400)
                  {
                    operator delete(*--v359);
                    *(_QWORD *)&v372 = v359;
                    v362 = v359;
                  }
                  v117 = v334;
                  if (v353 != 1)
                  {
                    v117 = (void *)(*(_QWORD **)((char *)v342
                                               + (((unint64_t)(v353 + v341 - 2) >> 6) & 0x3FFFFFFFFFFFFF8)))[(v353 + v341 - 2) & 0x1FF];
                    v349 = v342;
                    v350 = v341;
                  }
                  v118 = v117;
                  objc_msgSend_addObject_(v118, v119, (uint64_t)v344, v120, v121, v122);
                  objc_msgSend_addObjectsFromArray_(v118, v123, (uint64_t)v348, v124, v125, v126);
                  objc_msgSend_string(v45, v127, v128, v129, v130, v131);
                  v132 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_addObject_(v118, v133, (uint64_t)v132, v134, v135, v136);

                  v351 = v349;
                  --v353;
                  v346 = v339;
                  v347 = v40;
                  v343 = v340;
                  v345 = v350;
                  --v43;
                  v42 = v357;
                  v41 = v359;
                  if (v355 == ++j)
                    goto LABEL_61;
                }
                else
                {
LABEL_48:
                  v137 = (void *)qword_1EF568CE8;
                  objc_msgSend_string(v45, v90, v91, v92, v93, v94);
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v137) = objc_msgSend_containsObject_(v137, v139, (uint64_t)v138, v140, v141, v142);

                  if ((_DWORD)v137)
                  {
                    objc_msgSend_addObject_(v334, v34, (uint64_t)CFSTR("\\left."), v36, v37, v38);
                    objc_msgSend_string(v45, v143, v144, v145, v146, v147);
                    v148 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_addObject_(v334, v149, (uint64_t)v148, v150, v151, v152);

                  }
                  v42 = v357;
                  v41 = v359;
                  if (v355 == ++j)
                    goto LABEL_61;
                }
              }
              if (objc_msgSend_count(v334, v90, v91, v92, v93, v94))
                break;
              if (v347)
              {
                v341 = v337;
                v342 = v338;
                v349 = v338;
                v350 = v337;
                v351 = v338;
                v345 = v337;
                if (objc_msgSend_count((*(void ***)((char *)v338 + (((unint64_t)(v347 + v337 - 1) >> 6) & 0x3FFFFFFFFFFFFF8)))[(v347 + v337 - 1) & 0x1FF], v153, v154, v155, v156, v157))
                {
                  break;
                }
              }
              v170 = qword_1EF568D08;
              objc_msgSend_string(v45, v153, v154, v155, v156, v157);
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v170) = objc_msgSend_containsObject_((void *)v170, v172, (uint64_t)v171, v173, v174, v175);

              if ((v170 & 1) == 0)
                break;
              v353 = v347;
              v42 = v357;
              v41 = v359;
              if (v355 == ++j)
                goto LABEL_61;
            }
            v158 = v334;
            if (v40)
            {
              v158 = (void *)(*(_QWORD **)((char *)v336
                                         + (((unint64_t)(v40 + v335 - 1) >> 6) & 0x3FFFFFFFFFFFFF8)))[(v40 + v335 - 1) & 0x1FF];
              v337 = v335;
              v338 = v336;
              v341 = v335;
              v342 = v336;
              v349 = v336;
              v350 = v335;
              v351 = v336;
              v345 = v335;
            }
            v159 = v158;
            objc_msgSend_string(v45, v160, v161, v162, v163, v164);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v159, v166, (uint64_t)v165, v167, v168, v169);

            v347 = v40;
            v353 = v40;
            v42 = v357;
            v41 = v359;
          }
LABEL_61:
          v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v333, v34, (uint64_t)&v367, (uint64_t)v378, 16, v38);
        }
        while (v33);

        if (v43)
        {
          v181 = 0;
          v182 = 1 - v40;
          v183 = 1 - (v363 + v43);
          v354 = v363 + v43 - 1;
          do
          {
            v356 = v183;
            v358 = v182;
            v184 = ((unint64_t)(v354 + v181) >> 6) & 0x3FFFFFFFFFFFFF8;
            v185 = 8 * ((v354 + v181) & 0x1FF);
            v360 = *(id *)(*(char **)((char *)v366 + v184) + v185);
            v186 = v40 + v181 - 1;
            v187 = (v186 + v361) >> 9;
            v188 = (v186 + v361) & 0x1FF;
            v364 = *((id *)v39[v187] + v188);

            *((_QWORD *)&v380 + 1) = v43 + v181 - 1;
            v189 = (((char *)v365 - (char *)v366) << 6) - 1;
            if (v365 == v366)
              v189 = 0;
            if ((unint64_t)(v189 + v356) >= 0x400)
            {
              operator delete(*--v365);
              *(_QWORD *)&buf[16] = v365;
            }

            v190 = (((char *)v362 - (char *)v39) << 6) - 1;
            *((_QWORD *)&v373 + 1) = v40 + v181 - 1;
            if (v362 == v39)
              v190 = 0;
            if (v358 + v190 - v361 >= 0x400)
            {
              operator delete(*--v362);
              *(_QWORD *)&v372 = v362;
            }
            v191 = v334;
            if (v40 + v181 != 1)
              v191 = (void *)(*(_QWORD **)((char *)v39 + (((v361 + v40 - 2 + v181) >> 6) & 0x3FFFFFFFFFFFFF8)))[(v361 + v40 - 2 + v181) & 0x1FF];
            v192 = v191;
            if (objc_msgSend_containsObject_((void *)qword_1EF568CE0, v193, (uint64_t)v360, v194, v195, v196))
            {
              objc_msgSend_addObject_(v192, v197, (uint64_t)v360, v198, v199, v200);
              objc_msgSend_addObjectsFromArray_(v192, v201, (uint64_t)v364, v202, v203, v204);
              objc_msgSend_addObject_(v192, v205, (uint64_t)CFSTR("\\right."), v206, v207, v208);
            }
            if (objc_msgSend_isEqualToString_(v360, v197, (uint64_t)CFSTR("{"), v198, v199, v200))
            {
              objc_msgSend_addObject_(v192, v209, (uint64_t)v360, v210, v211, v212);
              objc_msgSend_addObjectsFromArray_(v192, v213, (uint64_t)v364, v214, v215, v216);
              objc_msgSend_addObject_(v192, v217, (uint64_t)CFSTR("}"), v218, v219, v220);
            }
            else
            {
              objc_msgSend_addObjectsFromArray_(v192, v209, (uint64_t)v364, v210, v211, v212);
            }

            --v181;
            v182 = v358 + 1;
            v183 = v356 + 1;
          }
          while (v43 + v181);
          v40 += v181;
        }
        v221 = v361;
LABEL_83:
        objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v176, v177, v178, v179, v180);
        v227 = (void *)objc_claimAutoreleasedReturnValue();
        v228 = 0;
        for (k = 0; k < objc_msgSend_count(v334, v222, v223, v224, v225, v226); ++k)
        {
          if (!v228)
          {
            objc_msgSend_objectAtIndexedSubscript_(v334, v231, k, v232, v233, v234);
            v235 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v235, v236, (uint64_t)CFSTR("&"), v237, v238, v239);

            if (isEqualToString)
              objc_msgSend_addIndex_(v227, v241, k, v242, v243, v244);
            objc_msgSend_objectAtIndexedSubscript_(v334, v241, k, v242, v243, v244);
            v245 = (void *)objc_claimAutoreleasedReturnValue();
            v250 = objc_msgSend_isEqualToString_(v245, v246, (uint64_t)CFSTR("\\hline"), v247, v248, v249);

            if (v250)
              objc_msgSend_setObject_atIndexedSubscript_(v334, v231, (uint64_t)CFSTR("-"), k, v233, v234);
          }
          objc_msgSend_objectAtIndexedSubscript_(v334, v231, k, v232, v233, v234);
          v251 = (void *)objc_claimAutoreleasedReturnValue();
          v256 = objc_msgSend_isEqualToString_(v251, v252, (uint64_t)CFSTR("\\begin{array}{lr}"), v253, v254, v255);

          if ((v256 & 1) != 0)
          {
            v230 = 1;
          }
          else
          {
            objc_msgSend_objectAtIndexedSubscript_(v334, v222, k, v224, v225, v226);
            v257 = (void *)objc_claimAutoreleasedReturnValue();
            v262 = objc_msgSend_isEqualToString_(v257, v258, (uint64_t)CFSTR("\\end{array}"), v259, v260, v261);

            v230 = v262 << 63 >> 63;
          }
          v228 += v230;
        }
        objc_msgSend_removeObjectsAtIndexes_(v334, v231, (uint64_t)v227, v232, v233, v234);
        v268 = 1;
        while (2)
        {
          if (v268 - 1 < (unint64_t)objc_msgSend_count(v334, v263, v264, v265, v266, v267))
          {
            objc_msgSend_objectAtIndexedSubscript_(v334, v269, v268 - 1, v270, v271, v272);
            v273 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_((void *)qword_1EF568D10, v274, (uint64_t)v273, v275, v276, v277);
            v283 = (void *)objc_claimAutoreleasedReturnValue();
            if (v283)
            {
              if (v268 - 1 == objc_msgSend_count(v334, v278, v279, v280, v281, v282) - 1)
              {

                goto LABEL_100;
              }
              objc_msgSend_objectAtIndexedSubscript_(v334, v284, v268, v285, v286, v287);
              v292 = (void *)objc_claimAutoreleasedReturnValue();
              v297 = objc_msgSend_isEqualToString_(v292, v293, (uint64_t)CFSTR("{"), v294, v295, v296);

              if ((v297 & 1) == 0)
              {
LABEL_100:
                objc_msgSend_objectForKeyedSubscript_((void *)qword_1EF568D10, v288, (uint64_t)v273, v289, v290, v291);
                v298 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_atIndexedSubscript_(v334, v299, (uint64_t)v298, v268 - 1, v300, v301);

              }
            }

            ++v268;
            continue;
          }
          break;
        }
        objc_msgSend_componentsJoinedByString_(v334, v269, (uint64_t)CFSTR(" "), v270, v271, v272);
        v302 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v330, v303, (uint64_t)v302, v304, v305, v306);

        v307 = v39;
        v308 = (char *)v362 - (char *)v39;
        if (v362 == v39
          || (v309 = v221,
              v310 = &v39[v221 >> 9],
              v311 = (id *)((char *)*v310 + 8 * (v221 & 0x1FF)),
              v312 = *(uint64_t *)((char *)v39 + (((v40 + v309) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * ((v40 + v309) & 0x1FF),
              v307 = v362,
              v311 == (id *)v312))
        {
          if ((unint64_t)((char *)v307 - (char *)v39) < 0x11)
            goto LABEL_112;
          do
          {
LABEL_110:
            v314 = *v39++;
            operator delete(v314);
            __p[1] = v39;
            v308 -= 8;
          }
          while (v308 > 0x10);
          v315 = v362;
        }
        else
        {
          do
          {

            if ((char *)v311 - (_BYTE *)*v310 == 4096)
            {
              v313 = (id *)v310[1];
              ++v310;
              v311 = v313;
            }
          }
          while (v311 != (id *)v312);
          v307 = v362;
          if ((unint64_t)((char *)v362 - (char *)v39) >= 0x11)
            goto LABEL_110;
LABEL_112:
          v315 = v307;
        }
        while (v39 != v315)
        {
          v316 = *v39++;
          operator delete(v316);
        }
        if (__p[0])
          operator delete(__p[0]);
        v317 = v366;
        v318 = (char *)v365 - (char *)v366;
        if ((unint64_t)((char *)v365 - (char *)v366) >= 0x11)
        {
          do
          {
            v319 = *v317++;
            operator delete(v319);
            *(_QWORD *)&buf[8] = v317;
            v318 -= 8;
          }
          while (v318 > 0x10);
        }
        while (v317 != v365)
        {
          v320 = *v317++;
          operator delete(v320);
        }
        if (*(_QWORD *)buf)
          operator delete(*(void **)buf);

      }
      v331 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v374, (uint64_t)v381, 16, v29);
    }
    while (v331);
  }

  v326 = (void *)objc_msgSend_copy(v330, v321, v322, v323, v324, v325);
  return v326;
}

+ (id)textTranscriptionForLatex:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
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
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int isEqualToString;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  id v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const __CFString *v161;
  const __CFString *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  unint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  unint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  NSObject *v217;
  uint64_t j;
  uint64_t v219;
  unint64_t v220;
  uint64_t v221;
  uint64_t v222;
  NSString *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  unint64_t v227;
  uint64_t v228;
  uint64_t v229;
  id v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  unint64_t v263;
  uint64_t v264;
  uint64_t v265;
  NSObject *v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  void *v277;
  id obj;
  void *v280;
  uint8_t buf[16];
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  _BYTE v296[128];
  _BYTE v297[128];
  uint64_t v298;

  v298 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (qword_1EF568D20 != -1)
    dispatch_once(&qword_1EF568D20, &unk_1E77F4378);
  v294 = 0u;
  v295 = 0u;
  v292 = 0u;
  v293 = 0u;
  v4 = (id)qword_1EF568D30;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v292, (uint64_t)v297, 16, v6);
  if (v11)
  {
    v12 = *(_QWORD *)v293;
    do
    {
      v13 = 0;
      v14 = v3;
      do
      {
        if (*(_QWORD *)v293 != v12)
          objc_enumerationMutation(v4);
        v15 = *(_QWORD *)(*((_QWORD *)&v292 + 1) + 8 * v13);
        objc_msgSend_objectForKeyedSubscript_((void *)qword_1EF568D30, v7, v15, v8, v9, v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v14, v17, v15, (uint64_t)v16, v18, v19);
        v3 = (id)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v3;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v292, (uint64_t)v297, 16, v10);
    }
    while (v11);
  }

  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByCharactersInSet_(v3, v26, (uint64_t)v25, v27, v28, v29);
  v277 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v30, v31, v32, v33, v34);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v290 = 0u;
  v291 = 0u;
  v288 = 0u;
  v289 = 0u;
  v286 = 0u;
  v287 = 0u;
  v282 = 0u;
  v283 = 0u;
  v284 = 0u;
  v285 = 0u;
  obj = v277;
  v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v282, (uint64_t)v296, 16, v36);
  if (v41)
  {
    v42 = *(_QWORD *)v283;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v283 != v42)
          objc_enumerationMutation(obj);
        v44 = *(void **)(*((_QWORD *)&v282 + 1) + 8 * i);
        if (objc_msgSend_containsObject_((void *)qword_1EF568D28, v37, (uint64_t)v44, v38, v39, v40, v277))
        {
          v50 = *((_QWORD *)&v289 + 1);
          v51 = v290;
          v52 = (((_QWORD)v290 - *((_QWORD *)&v289 + 1)) << 6) - 1;
          if ((_QWORD)v290 == *((_QWORD *)&v289 + 1))
            v52 = 0;
          if (v52 == *((_QWORD *)&v291 + 1) + (_QWORD)v291)
          {
            sub_1BE7287C4(&v289);
            v50 = *((_QWORD *)&v289 + 1);
            v51 = v290;
          }
          if (v51 == v50)
            v53 = 0;
          else
            v53 = (_QWORD *)(*(_QWORD *)(v50 + (((*((_QWORD *)&v291 + 1) + (_QWORD)v291) >> 6) & 0x3FFFFFFFFFFFFF8))
                           + 8 * ((*((_QWORD *)&v291 + 1) + v291) & 0x1FF));
          *v53 = v44;
          ++*((_QWORD *)&v291 + 1);
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v101, v102, v103, v104, v105);
          v106 = objc_claimAutoreleasedReturnValue();
          v107 = *((_QWORD *)&v286 + 1);
          v108 = (((_QWORD)v287 - *((_QWORD *)&v286 + 1)) << 6) - 1;
          if ((_QWORD)v287 == *((_QWORD *)&v286 + 1))
            v108 = 0;
          v109 = *((_QWORD *)&v288 + 1) + v288;
          if (v108 == *((_QWORD *)&v288 + 1) + (_QWORD)v288)
          {
            sub_1BE728E8C(&v286);
            v107 = *((_QWORD *)&v286 + 1);
            v109 = *((_QWORD *)&v288 + 1) + v288;
          }
          *(_QWORD *)(*(_QWORD *)(v107 + ((v109 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v109 & 0x1FF)) = v106;
          ++*((_QWORD *)&v288 + 1);
        }
        else
        {
          if (*((_QWORD *)&v291 + 1))
          {
            if ((objc_msgSend_isEqualToString_(v44, v45, (uint64_t)CFSTR("}"), v47, v48, v49) & 1) == 0
              && !objc_msgSend_isEqualToString_(v44, v54, (uint64_t)CFSTR("]"), v55, v56, v57))
            {
              v132 = objc_retain(*(id *)(*(_QWORD *)(*((_QWORD *)&v286 + 1)
                                                   + (((unint64_t)(*((_QWORD *)&v288 + 1) + v288 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                                       + 8 * ((*((_QWORD *)&v288 + 1) + v288 - 1) & 0x1FF)));
              symbolTextTransliteration((NSString *)v44);
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v132, v134, (uint64_t)v133, v135, v136, v137);

              continue;
            }
            v58 = *((_QWORD *)&v289 + 1);
            v59 = *((_QWORD *)&v291 + 1) + v291 - 1;
            v60 = (v59 >> 6) & 0x3FFFFFFFFFFFFF8;
            v61 = 8 * (v59 & 0x1FF);
            v62 = *(id *)(*(_QWORD *)(*((_QWORD *)&v289 + 1) + v60) + v61);

            v63 = (((_QWORD)v290 - *((_QWORD *)&v289 + 1)) << 6) - 1;
            v64 = *((_QWORD *)&v291 + 1);
            if ((_QWORD)v290 == *((_QWORD *)&v289 + 1))
              v63 = 0;
            --*((_QWORD *)&v291 + 1);
            if ((unint64_t)(v63 - (v64 + v291) + 1) >= 0x400)
            {
              operator delete(*(void **)(v290 - 8));
              *(_QWORD *)&v290 = v290 - 8;
            }
            v65 = *((_QWORD *)&v286 + 1);
            v66 = *((_QWORD *)&v288 + 1) + v288 - 1;
            v67 = (v66 >> 6) & 0x3FFFFFFFFFFFFF8;
            v68 = 8 * (v66 & 0x1FF);
            v69 = *(id *)(*(_QWORD *)(*((_QWORD *)&v286 + 1) + v67) + v68);

            v70 = (((_QWORD)v287 - *((_QWORD *)&v286 + 1)) << 6) - 1;
            v71 = *((_QWORD *)&v288 + 1);
            if ((_QWORD)v287 == *((_QWORD *)&v286 + 1))
              v70 = 0;
            v72 = --*((_QWORD *)&v288 + 1);
            if ((unint64_t)(v70 - (v71 + v288) + 1) >= 0x400)
            {
              operator delete(*(void **)(v287 - 8));
              v72 = *((_QWORD *)&v288 + 1);
              *(_QWORD *)&v287 = v287 - 8;
            }
            v73 = v280;
            if (v72)
              v73 = *(void **)(*(_QWORD *)(*((_QWORD *)&v286 + 1)
                                         + (((unint64_t)(v72 + v288 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                             + 8 * ((v72 + v288 - 1) & 0x1FF));
            v74 = v73;
            v79 = v62;
            if (qword_1EF568C98 != -1)
              dispatch_once(&qword_1EF568C98, &unk_1E77EFB98);
            objc_msgSend_objectForKeyedSubscript_((void *)qword_1EF568CA0, v75, (uint64_t)v79, v76, v77, v78);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v80;
            if (v80)
            {
              v86 = v80;
            }
            else if (objc_msgSend_hasPrefix_(v79, v81, (uint64_t)CFSTR("\\text{"), v82, v83, v84)
                   && objc_msgSend_hasSuffix_(v79, v122, (uint64_t)CFSTR("}"), v123, v124, v125))
            {
              v128 = objc_msgSend_length(v79, v122, v126, v127, v124, v125);
              objc_msgSend_substringWithRange_(v79, v129, 6, v128 - 7, v130, v131);
              v86 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v79, v122, (uint64_t)CFSTR("\\"), (uint64_t)&stru_1E77F6F28, v124, v125);
              v86 = (id)objc_claimAutoreleasedReturnValue();
            }
            v148 = v86;

            objc_msgSend_addObject_(v74, v149, (uint64_t)v148, v150, v151, v152);
            v161 = CFSTR(")");
            if (objc_msgSend_isEqualToString_(v44, v153, (uint64_t)CFSTR("]"), v154, v155, v156))
            {
              if (objc_msgSend_isEqualToString_(v79, v157, (uint64_t)CFSTR("\\sqrt"), v158, v159, v160))
                v161 = CFSTR(")");
              else
                v161 = &stru_1E77F6F28;
            }
            if (objc_msgSend_isEqualToString_(v79, v157, (uint64_t)CFSTR(","), v158, v159, v160))
              v162 = &stru_1E77F6F28;
            else
              v162 = CFSTR("(");
            if (sub_1BE722120((uint64_t)a1, v69))
            {
              objc_msgSend_addObject_(v74, v163, (uint64_t)v162, v164, v165, v166);
              goto LABEL_71;
            }
            if (objc_msgSend_isEqualToString_(v79, v163, (uint64_t)CFSTR("\\sqrt"), v164, v165, v166)
              && objc_msgSend_isEqualToString_(v44, v179, (uint64_t)CFSTR("]"), v180, v181, v182))
            {
              objc_msgSend_addObject_(v74, v179, (uint64_t)v162, v180, v181, v182);
              goto LABEL_77;
            }
            if (objc_msgSend_isEqualToString_(v79, v179, (uint64_t)CFSTR(","), v180, v181, v182)
              && objc_msgSend_isEqualToString_(v44, v167, (uint64_t)CFSTR("}"), v168, v169, v170))
            {
LABEL_71:
              objc_msgSend_addObjectsFromArray_(v74, v167, (uint64_t)v69, v168, v169, v170);
              objc_msgSend_addObject_(v74, v171, (uint64_t)v161, v172, v173, v174);
            }
            else
            {
LABEL_77:
              objc_msgSend_addObjectsFromArray_(v74, v167, (uint64_t)v69, v168, v169, v170);
            }
            if (objc_msgSend_isEqualToString_(v79, v175, (uint64_t)CFSTR("\\frac"), v176, v177, v178))
            {
              v188 = *((_QWORD *)&v289 + 1);
              v189 = (((_QWORD)v290 - *((_QWORD *)&v289 + 1)) << 6) - 1;
              if ((_QWORD)v290 == *((_QWORD *)&v289 + 1))
                v189 = 0;
              v190 = *((_QWORD *)&v291 + 1) + v291;
              if (v189 == *((_QWORD *)&v291 + 1) + (_QWORD)v291)
              {
                sub_1BE7287C4(&v289);
                v188 = *((_QWORD *)&v289 + 1);
                v190 = *((_QWORD *)&v291 + 1) + v291;
              }
              *(_QWORD *)(*(_QWORD *)(v188 + ((v190 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v190 & 0x1FF)) = CFSTR("/");
              ++*((_QWORD *)&v291 + 1);
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v183, v184, v185, v186, v187);
              v191 = objc_claimAutoreleasedReturnValue();
              v192 = *((_QWORD *)&v286 + 1);
              v193 = (((_QWORD)v287 - *((_QWORD *)&v286 + 1)) << 6) - 1;
              if ((_QWORD)v287 == *((_QWORD *)&v286 + 1))
                v193 = 0;
              v194 = *((_QWORD *)&v288 + 1) + v288;
              if (v193 == *((_QWORD *)&v288 + 1) + (_QWORD)v288)
                goto LABEL_86;
              goto LABEL_87;
            }
            if (objc_msgSend_isEqualToString_(v79, v183, (uint64_t)CFSTR("\\sqrt"), v185, v186, v187)
              && objc_msgSend_isEqualToString_(v44, v195, (uint64_t)CFSTR("]"), v196, v197, v198))
            {
              v204 = *((_QWORD *)&v289 + 1);
              v205 = (((_QWORD)v290 - *((_QWORD *)&v289 + 1)) << 6) - 1;
              if ((_QWORD)v290 == *((_QWORD *)&v289 + 1))
                v205 = 0;
              v206 = *((_QWORD *)&v291 + 1) + v291;
              if (v205 == *((_QWORD *)&v291 + 1) + (_QWORD)v291)
              {
                sub_1BE7287C4(&v289);
                v204 = *((_QWORD *)&v289 + 1);
                v206 = *((_QWORD *)&v291 + 1) + v291;
              }
              *(_QWORD *)(*(_QWORD *)(v204 + ((v206 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v206 & 0x1FF)) = CFSTR(",");
              ++*((_QWORD *)&v291 + 1);
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v199, v200, v201, v202, v203);
              v191 = objc_claimAutoreleasedReturnValue();
              v192 = *((_QWORD *)&v286 + 1);
              v207 = (((_QWORD)v287 - *((_QWORD *)&v286 + 1)) << 6) - 1;
              if ((_QWORD)v287 == *((_QWORD *)&v286 + 1))
                v207 = 0;
              v194 = *((_QWORD *)&v288 + 1) + v288;
              if (v207 == *((_QWORD *)&v288 + 1) + (_QWORD)v288)
              {
LABEL_86:
                sub_1BE728E8C(&v286);
                v192 = *((_QWORD *)&v286 + 1);
                v194 = *((_QWORD *)&v288 + 1) + v288;
              }
LABEL_87:
              *(_QWORD *)(*(_QWORD *)(v192 + ((v194 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v194 & 0x1FF)) = v191;
              ++*((_QWORD *)&v288 + 1);
            }

            continue;
          }
          objc_msgSend_lastObject(v280, v45, v46, v47, v48, v49);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqualToString_(v87, v88, (uint64_t)CFSTR("hline"), v89, v90, v91))
          {
            isEqualToString = objc_msgSend_isEqualToString_(v44, v92, (uint64_t)CFSTR("&"), v93, v94, v95);

            if (isEqualToString)
              objc_msgSend_addObject_(v280, v97, (uint64_t)CFSTR("\n"), v98, v99, v100);
          }
          else
          {

          }
          v114 = v44;
          if (qword_1EF568C98 != -1)
            dispatch_once(&qword_1EF568C98, &unk_1E77EFB98);
          objc_msgSend_objectForKeyedSubscript_((void *)qword_1EF568CA0, v110, (uint64_t)v114, v111, v112, v113);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = v115;
          if (v115)
          {
            v121 = v115;
          }
          else if (objc_msgSend_hasPrefix_(v114, v116, (uint64_t)CFSTR("\\text{"), v117, v118, v119)
                 && objc_msgSend_hasSuffix_(v114, v138, (uint64_t)CFSTR("}"), v139, v140, v141))
          {
            v144 = objc_msgSend_length(v114, v138, v142, v143, v140, v141);
            objc_msgSend_substringWithRange_(v114, v145, 6, v144 - 7, v146, v147);
            v121 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v114, v138, (uint64_t)CFSTR("\\"), (uint64_t)&stru_1E77F6F28, v140, v141);
            v121 = (id)objc_claimAutoreleasedReturnValue();
          }
          v208 = v121;

          objc_msgSend_addObject_(v280, v209, (uint64_t)v208, v210, v211, v212);
        }
      }
      v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v282, (uint64_t)v296, 16, v40);
    }
    while (v41);
  }

  if (*((_QWORD *)&v291 + 1) | *((_QWORD *)&v288 + 1))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v217 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v217, OS_LOG_TYPE_ERROR, "Invalid latex encountered during text transliteration.", buf, 2u);
    }

    for (j = *((_QWORD *)&v291 + 1); *((_QWORD *)&v291 + 1); j = *((_QWORD *)&v291 + 1))
    {
      v219 = *((_QWORD *)&v289 + 1);
      v220 = j + v291 - 1;
      v221 = (v220 >> 6) & 0x3FFFFFFFFFFFFF8;
      v222 = 8 * (v220 & 0x1FF);
      v223 = (NSString *)*(id *)(*(_QWORD *)(*((_QWORD *)&v289 + 1) + v221) + v222);

      v224 = *((_QWORD *)&v291 + 1);
      if ((_QWORD)v290 == *((_QWORD *)&v289 + 1))
        v225 = 0;
      else
        v225 = (((_QWORD)v290 - *((_QWORD *)&v289 + 1)) << 6) - 1;
      --*((_QWORD *)&v291 + 1);
      if ((unint64_t)(v225 - (v224 + v291) + 1) >= 0x400)
      {
        operator delete(*(void **)(v290 - 8));
        *(_QWORD *)&v290 = v290 - 8;
      }
      v226 = *((_QWORD *)&v286 + 1);
      v227 = *((_QWORD *)&v288 + 1) + v288 - 1;
      v228 = (v227 >> 6) & 0x3FFFFFFFFFFFFF8;
      v229 = 8 * (v227 & 0x1FF);
      v230 = *(id *)(*(_QWORD *)(*((_QWORD *)&v286 + 1) + v228) + v229);

      v231 = (((_QWORD)v287 - *((_QWORD *)&v286 + 1)) << 6) - 1;
      v232 = *((_QWORD *)&v288 + 1);
      if ((_QWORD)v287 == *((_QWORD *)&v286 + 1))
        v231 = 0;
      --*((_QWORD *)&v288 + 1);
      if ((unint64_t)(v231 - (v232 + v288) + 1) >= 0x400)
      {
        operator delete(*(void **)(v287 - 8));
        *(_QWORD *)&v287 = v287 - 8;
      }
      symbolTextTransliteration(v223);
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v280, v234, (uint64_t)v233, v235, v236, v237);

      if (sub_1BE722120((uint64_t)a1, v230))
      {
        objc_msgSend_addObject_(v280, v238, (uint64_t)CFSTR("("), v239, v240, v241);
        objc_msgSend_addObjectsFromArray_(v280, v242, (uint64_t)v230, v243, v244, v245);
        objc_msgSend_addObject_(v280, v246, (uint64_t)CFSTR(")"), v247, v248, v249);
      }
      else
      {
        objc_msgSend_addObjectsFromArray_(v280, v238, (uint64_t)v230, v239, v240, v241);
      }
      if (*((_QWORD *)&v291 + 1))
      {
        v260 = objc_msgSend_copy(v280, v250, v251, v252, v253, v254);
        v261 = *((_QWORD *)&v286 + 1);
        v262 = (((_QWORD)v287 - *((_QWORD *)&v286 + 1)) << 6) - 1;
        if ((_QWORD)v287 == *((_QWORD *)&v286 + 1))
          v262 = 0;
        v263 = *((_QWORD *)&v288 + 1) + v288;
        if (v262 == *((_QWORD *)&v288 + 1) + (_QWORD)v288)
        {
          sub_1BE728E8C(&v286);
          v261 = *((_QWORD *)&v286 + 1);
          v263 = *((_QWORD *)&v288 + 1) + v288;
        }
        *(_QWORD *)(*(_QWORD *)(v261 + ((v263 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v263 & 0x1FF)) = v260;
        ++*((_QWORD *)&v288 + 1);
        objc_msgSend_removeAllObjects(v280, v255, v256, v257, v258, v259, v277);
      }
      else if (*((_QWORD *)&v288 + 1))
      {
        objc_msgSend_addObjectsFromArray_(v280, v250, *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v286 + 1)+ (((unint64_t)(*((_QWORD *)&v288 + 1) + v288 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * ((*((_QWORD *)&v288 + 1) + v288 - 1) & 0x1FF)), v252, v253, v254);
        objc_release(*(id *)(*(_QWORD *)(*((_QWORD *)&v286 + 1)
                                       + (((unint64_t)(*((_QWORD *)&v288 + 1) + v288 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                           + 8 * ((*((_QWORD *)&v288 + 1) + v288 - 1) & 0x1FF)));
        v264 = (((_QWORD)v287 - *((_QWORD *)&v286 + 1)) << 6) - 1;
        v265 = *((_QWORD *)&v288 + 1);
        if ((_QWORD)v287 == *((_QWORD *)&v286 + 1))
          v264 = 0;
        --*((_QWORD *)&v288 + 1);
        if ((unint64_t)(v264 - (v265 + v288) + 1) >= 0x400)
        {
          operator delete(*(void **)(v287 - 8));
          *(_QWORD *)&v287 = v287 - 8;
        }
      }

    }
    if (*((_QWORD *)&v288 + 1))
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v266 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v266, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v266, OS_LOG_TYPE_FAULT, "Args stack not empty at the end of text transliteration", buf, 2u);
      }

    }
  }
  objc_msgSend_componentsJoinedByString_(v280, v213, (uint64_t)&stru_1E77F6F28, v214, v215, v216, v277);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v267, v268, (uint64_t)CFSTR("\n"), (uint64_t)&stru_1E77F6F28, v269, v270);
  v271 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v271, v272, (uint64_t)CFSTR("hline"), (uint64_t)CFSTR("="), v273, v274);
  v275 = (void *)objc_claimAutoreleasedReturnValue();

  sub_1BE61BEF4((uint64_t)&v286);
  sub_1BE61BEF4((uint64_t)&v289);

  return v275;
}

+ (id)simplifiedTextTranscriptionForLatex:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (qword_1EF568D38 != -1)
    dispatch_once(&qword_1EF568D38, &unk_1E77F1CD0);
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v4, (uint64_t)CFSTR("\\color{orange}{+}"), (uint64_t)CFSTR("+"), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_textTranscriptionForLatex_(a1, v9, (uint64_t)v8, v10, v11, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = (id)qword_1EF568D40;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, (uint64_t)v36, 16, v16);
  v22 = v13;
  if (v21)
  {
    v23 = *(_QWORD *)v33;
    v22 = v13;
    do
    {
      v24 = 0;
      v25 = v22;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v14);
        v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v24);
        objc_msgSend_objectForKeyedSubscript_((void *)qword_1EF568D40, v17, v26, v18, v19, v20, (_QWORD)v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v25, v28, v26, (uint64_t)v27, v29, v30);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        ++v24;
        v25 = v22;
      }
      while (v21 != v24);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v32, (uint64_t)v36, 16, v20);
    }
    while (v21);
  }

  return v22;
}

+ (BOOL)isTrivialTextTranscriptionAvailableForLatex:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;

  v7 = a3;
  if (qword_1EF568C48 != -1)
    dispatch_once(&qword_1EF568C48, &unk_1E77F4398);
  objc_msgSend_componentsSeparatedByString_(v7, v3, (uint64_t)CFSTR(" "), v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_indexOfObjectPassingTest_(v8, v9, (uint64_t)&unk_1E77EFDB8, v10, v11, v12) == 0x7FFFFFFFFFFFFFFFLL;

  return v13;
}

+ (BOOL)isTextTranscriptionInMathAlphabet:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v7 = a3;
  if (qword_1EF568D48 != -1)
    dispatch_once(&qword_1EF568D48, &unk_1E77F43D8);
  objc_msgSend_stringByTrimmingCharactersInSet_(v7, v3, qword_1EF568D50, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_length(v8, v9, v10, v11, v12, v13) == 0;

  return v14;
}

+ (BOOL)isPartialMathUnitConversionPatternForTextTranscription:(id)a3 locales:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char isMatch;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD block[4];
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend_hasSuffix_(v5, v7, (uint64_t)CFSTR("="), v8, v9, v10) & 1) != 0)
  {
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v11, (uint64_t)CFSTR("="), (uint64_t)&stru_1E77F6F28, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_componentsSeparatedByString_(v14, v15, (uint64_t)CFSTR(" "), v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE7243FC;
    block[3] = &unk_1E77F1F38;
    v45 = v6;
    if (qword_1EF568D58 != -1)
      dispatch_once(&qword_1EF568D58, block);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v20 = v19;
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v40, (uint64_t)v46, 16, v22);
    if (v28)
    {
      v29 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v41 != v29)
            objc_enumerationMutation(v20);
          v31 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend_root((void *)qword_1EF568D60, v23, v24, v25, v26, v27, (_QWORD)v40);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v32, v33, v31, v34, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            isMatch = objc_msgSend_isMatch(v37, v23, v24, v25, v26, v27);

            if ((isMatch & 1) != 0)
            {
              LOBYTE(v28) = 1;
              goto LABEL_16;
            }
          }
        }
        v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v40, (uint64_t)v46, 16, v27);
      }
      while (v28);
    }
LABEL_16:

    v5 = v14;
  }
  else
  {
    LOBYTE(v28) = 0;
  }

  return v28;
}

+ (BOOL)isMathUnitConversionPatternForTextTranscription:(id)a3 locales:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSCharacterSet *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  BOOL v51;

  v5 = a3;
  if ((objc_msgSend_isPartialMathUnitConversionPatternForTextTranscription_locales_(CHTokenizedMathResult, v6, (uint64_t)v5, (uint64_t)a4, v7, v8) & 1) != 0)
  {
    objc_msgSend_ch_currencyCharSet(MEMORY[0x1E0CB3500], v9, v10, v11, v12, v13);
    v18 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    if (qword_1EF568D68 != -1)
      dispatch_once(&qword_1EF568D68, &unk_1E77EFDF8);
    objc_msgSend_componentsSeparatedByString_(v5, v14, (uint64_t)CFSTR(" "), v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v19, v20, 0, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (isStringEntirelyFromSet((NSString *)v24, v18)
      && (unint64_t)objc_msgSend_count(v19, v25, v26, v27, v28, v29) >= 2)
    {
      objc_msgSend_objectAtIndexedSubscript_(v19, v25, 1, v27, v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v30;
    }
    v31 = (void *)qword_1EF568D70;
    v32 = objc_msgSend_length(v24, v25, v26, v27, v28, v29);
    objc_msgSend_firstMatchInString_options_range_(v31, v33, (uint64_t)v24, 0, 0, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v34;
    v51 = 0;
    if (v34)
    {
      if (!objc_msgSend_range(v34, v35, v36, v37, v38, v39))
      {
        objc_msgSend_range(v40, v41, v42, v43, v44, v45);
        if ((unint64_t)v50 <= objc_msgSend_length(v24, v50, v46, v47, v48, v49))
          v51 = 1;
      }
    }

  }
  else
  {
    v51 = 0;
  }

  return v51;
}

- (void)enumerateTokensInTopTranscriptionPathWithBlock:(id)a3
{
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
  uint64_t v15;
  const char *v16;
  id v17;

  v17 = a3;
  objc_msgSend_firstObject(self->_transcriptionPaths, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_tokenColumnCount(self, v10, v11, v12, v13, v14);
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v16, (uint64_t)v9, 0, v15, (uint64_t)v17);

}

- (void)enumerateTokensInPreferredTranscriptionPathWithBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSNumber *selectedTranscriptionPathIndex;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  const char *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_firstObject(self->_transcriptionPaths, v5, v6, v7, v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  selectedTranscriptionPathIndex = self->_selectedTranscriptionPathIndex;
  if (selectedTranscriptionPathIndex
    && objc_msgSend_integerValue(selectedTranscriptionPathIndex, v10, v11, v12, v13, v14))
  {
    v22 = objc_msgSend_integerValue(self->_selectedTranscriptionPathIndex, v10, v11, v12, v13, v14);
    if (v22 < 1 || v22 >= (unint64_t)objc_msgSend_count(self->_transcriptionPaths, v17, v18, v19, v20, v21))
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v28 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v31 = 134217984;
        v32 = v22;
        _os_log_impl(&dword_1BE607000, v28, OS_LOG_TYPE_ERROR, "Invalid selected transcription path idnex %lu. Using top transcription path.", (uint8_t *)&v31, 0xCu);
      }

    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPaths, v23, v22, v24, v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v27;
    }
  }
  v29 = objc_msgSend_tokenColumnCount(self, v10, v11, v12, v13, v14);
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v30, (uint64_t)v15, 0, v29, (uint64_t)v4);

}

- (void)enumerateTokensInTranscriptionPath:(id)a3 columnRange:(_NSRange)a4 tokenProcessingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(id, uint64_t, uint64_t, _QWORD *);
  NSUInteger v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
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
  BOOL v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
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
  BOOL v74;
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
  uint64_t v85;
  uint64_t v86;
  NSUInteger v87;
  CHTokenizedMathResult *v88;
  id v89;
  void *v90;
  _QWORD v91[3];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t v96[128];
  uint8_t buf[4];
  NSUInteger v98;
  __int16 v99;
  uint64_t v100;
  uint64_t v101;

  length = a4.length;
  location = a4.location;
  v101 = *MEMORY[0x1E0C80C00];
  v89 = a3;
  v13 = (void (**)(id, uint64_t, uint64_t, _QWORD *))a5;
  v14 = location + length;
  if (location < location + length)
  {
    v15 = 0;
    v87 = v14;
    v88 = self;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_tokenColumns, v9, location, v10, v11, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v16;
      if (location < objc_msgSend_length(v89, v17, v18, v19, v20, v21))
        break;
      if (location >= objc_msgSend_length(v89, v22, v23, v24, v25, v26))
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v51 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        {
          v67 = objc_msgSend_length(v89, v62, v63, v64, v65, v66);
          *(_DWORD *)buf = 134218240;
          v98 = location;
          v99 = 2048;
          v100 = v67;
          _os_log_impl(&dword_1BE607000, v51, OS_LOG_TYPE_FAULT, "Trying to access index %ld outside of path of length %ld. Skipping.", buf, 0x16u);
        }
LABEL_24:

LABEL_25:
        v16 = v90;
      }

      if (++location == v14)
        goto LABEL_27;
    }
    v27 = objc_msgSend_indexAtPosition_(v89, v22, location, v24, v25, v26);
    objc_msgSend_mathTokenRows(v16, v28, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v27 < objc_msgSend_count(v33, v34, v35, v36, v37, v38);

    if (v39)
    {
      objc_msgSend_mathTokenRows(v90, v40, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v45, v46, v27, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v51 = v50;
      v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v92, (uint64_t)v96, 16, v53);
      if (v54)
      {
        v55 = 0;
        v56 = *(_QWORD *)v93;
        do
        {
          v57 = 0;
          v58 = v15;
          do
          {
            if (*(_QWORD *)v93 != v56)
              objc_enumerationMutation(v51);
            v59 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * v57);
            v91[0] = location;
            v91[1] = v27;
            v91[2] = v55 + v57;
            v13[2](v13, v59, v15 + v57++, v91);
          }
          while (v54 != v57);
          v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v60, (uint64_t)&v92, (uint64_t)v96, 16, v61);
          v55 += v57;
          v15 += v57;
        }
        while (v54);
        v15 = v58 + v57;
        v14 = v87;
        self = v88;
      }

      goto LABEL_24;
    }
    objc_msgSend_mathTokenRows(v90, v40, v41, v42, v43, v44);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v27 < objc_msgSend_count(v68, v69, v70, v71, v72, v73);

    if (!v74)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v51 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend_mathTokenRows(v90, v75, v76, v77, v78, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend_count(v80, v81, v82, v83, v84, v85);
        *(_DWORD *)buf = 134218240;
        v98 = v27;
        v99 = 2048;
        v100 = v86;
        _os_log_impl(&dword_1BE607000, v51, OS_LOG_TYPE_FAULT, "Trying to access index %ld outside of available tokenRows of length %ld. Skipping.", buf, 0x16u);

      }
      goto LABEL_24;
    }
    goto LABEL_25;
  }
LABEL_27:

}

- (BOOL)isEquivalentToTokenizedMathResult:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHTokenizedMathResult *v9;
  void *v10;
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
  void *v21;
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
  int isEqual;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
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

  v9 = (CHTokenizedMathResult *)a3;
  if (self == v9)
  {
    v39 = 1;
    goto LABEL_11;
  }
  objc_msgSend_tokenColumns(self, v4, v5, v6, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenColumns(v9, v11, v12, v13, v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v21)
  {

  }
  else
  {
    objc_msgSend_tokenColumns(self, v16, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenColumns(v9, v23, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v22, v29, (uint64_t)v28, v30, v31, v32);

    if (!isEqual)
    {
      v39 = 0;
      goto LABEL_11;
    }
  }
  objc_msgSend_transcriptionPaths(self, v34, v35, v36, v37, v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v9, v41, v42, v43, v44, v45);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40 == v51)
  {
    v39 = 1;
  }
  else
  {
    objc_msgSend_transcriptionPaths(self, v46, v47, v48, v49, v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v9, v53, v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_isEqual_(v52, v59, (uint64_t)v58, v60, v61, v62);

  }
LABEL_11:

  return v39;
}

- (BOOL)isEqualToTokenizedMathResult:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHTokenizedMathResult *v9;
  void *v10;
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
  void *v21;
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
  int isEqualToString;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
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
  int isEqualToIndexSet;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
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
  int isEqual;
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
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;

  v9 = (CHTokenizedMathResult *)a3;
  if (self == v9)
  {
    v39 = 1;
  }
  else
  {
    objc_msgSend_topTranscription(self, v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_topTranscription(v9, v11, v12, v13, v14, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v21)
    {

    }
    else
    {
      objc_msgSend_topTranscription(self, v16, v17, v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_topTranscription(v9, v23, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v22, v29, (uint64_t)v28, v30, v31, v32);

      if (!isEqualToString)
        goto LABEL_13;
    }
    objc_msgSend_strokeIndexes(self, v34, v35, v36, v37, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIndexes(v9, v41, v42, v43, v44, v45);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 == v51)
    {

    }
    else
    {
      objc_msgSend_strokeIndexes(self, v46, v47, v48, v49, v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeIndexes(v9, v53, v54, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v52, v59, (uint64_t)v58, v60, v61, v62);

      if (!isEqualToIndexSet)
      {
LABEL_13:
        v39 = 0;
        goto LABEL_19;
      }
    }
    objc_msgSend_tokenColumns(self, v64, v65, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenColumns(v9, v70, v71, v72, v73, v74);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69 == v80)
    {

    }
    else
    {
      objc_msgSend_tokenColumns(self, v75, v76, v77, v78, v79);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tokenColumns(v9, v82, v83, v84, v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v81, v88, (uint64_t)v87, v89, v90, v91);

      if (!isEqual)
        goto LABEL_13;
    }
    objc_msgSend_selectedTranscriptionPathIndex(self, v93, v94, v95, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_selectedTranscriptionPathIndex(v9, v99, v100, v101, v102, v103);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98 == v109)
    {
      v39 = 1;
    }
    else
    {
      objc_msgSend_selectedTranscriptionPathIndex(self, v104, v105, v106, v107, v108);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_selectedTranscriptionPathIndex(v9, v111, v112, v113, v114, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_isEqual_(v110, v117, (uint64_t)v116, v118, v119, v120);

    }
  }
LABEL_19:

  return v39;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToTokenizedMathResult;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToTokenizedMathResult = objc_msgSend_isEqualToTokenizedMathResult_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTokenizedMathResult;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = objc_msgSend_hash(self->_tokenColumns, a2, v2, v3, v4, v5);
  return objc_msgSend_hash(self->_transcriptionPaths, v8, v9, v10, v11, v12) ^ v7;
}

- (id)parseTree
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CHGrammar *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CHLatexParser *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
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
  void *v28;
  NSString *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CHLatexParseTree *v35;
  CHLatexParseTree *parseTree;
  NSString *correctedLatex;
  id v39;
  char v40[1024];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!self->_didAttemptParsing)
  {
    self->_didAttemptParsing = 1;
    pathForResource("latex_grammar.txt", 0, (UInt8 *)v40);
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v3, (uint64_t)v40, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [CHGrammar alloc];
    v13 = (void *)objc_msgSend_initWithFile_(v8, v9, (uint64_t)v7, v10, v11, v12);
    v14 = [CHLatexParser alloc];
    v18 = (void *)objc_msgSend_initWithGrammar_parseNormalizedLatex_(v14, v15, (uint64_t)v13, 1, v16, v17);
    objc_msgSend_preferredTranscription(self, v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend_parseLatex_outCorrectedLatex_(v18, v25, (uint64_t)v24, (uint64_t)&v39, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (NSString *)v39;
    objc_msgSend_firstObject(v28, v30, v31, v32, v33, v34);
    v35 = (CHLatexParseTree *)objc_claimAutoreleasedReturnValue();
    parseTree = self->_parseTree;
    self->_parseTree = v35;

    correctedLatex = self->_correctedLatex;
    self->_correctedLatex = v29;

  }
  return self->_parseTree;
}

- (id)evaluationWithVariables:(id)a3 caseSensitive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
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
  const char *v18;
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
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  v4 = a4;
  v6 = a3;
  objc_msgSend_parseTree(self, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputRange(v12, v13, v14, v15, v16, v17);
  v19 = v18;
  v24 = objc_msgSend_length(self->_correctedLatex, v18, v20, v21, v22, v23);

  if (v19 == (const char *)v24)
  {
    objc_msgSend_parseTree(self, v25, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_evaluationWithVariables_caseSensitive_(v30, v31, (uint64_t)v6, v4, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (id)declaredVariable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
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
  int isEqualToString;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = sub_1BE725760;
  v63[3] = &unk_1E77F1EC8;
  v8 = v7;
  v64 = v8;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(self, v9, (uint64_t)v63, v10, v11, v12);
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v19 = v8;
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v59, (uint64_t)v65, 16, v21);
  if (v27)
  {
    v28 = *(_QWORD *)v60;
LABEL_3:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v28)
        objc_enumerationMutation(v19);
      v30 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v29);
      if ((objc_msgSend_properties(v30, v22, v23, v24, v25, v26, (_QWORD)v59) & 0x10) == 0)
        break;
      objc_msgSend_string(v30, v31, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v18, v37, (uint64_t)v36, v38, v39, v40);

      if (v27 == ++v29)
      {
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v59, (uint64_t)v65, 16, v26);
        if (v27)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    if (!objc_msgSend_length(v18, v31, v32, v33, v34, v35))
      goto LABEL_13;
    objc_msgSend_string(v30, v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v46, v47, (uint64_t)CFSTR("="), v48, v49, v50);

    if (isEqualToString)
    {
      v57 = (void *)objc_msgSend_copy(v18, v52, v53, v54, v55, v56);
      goto LABEL_15;
    }
  }
  else
  {
LABEL_13:

  }
  v57 = 0;
LABEL_15:

  return v57;
}

- (BOOL)isEvaluationExpected
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char hasSuffix;

  objc_msgSend_preferredTranscription(self, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasSuffix_(v6, v7, (uint64_t)CFSTR("="), v8, v9, v10) & 1) != 0
    || (objc_msgSend_hasSuffix_(v6, v11, (uint64_t)CFSTR("\\hline"), v12, v13, v14) & 1) != 0)
  {

    return 1;
  }
  else
  {
    hasSuffix = objc_msgSend_hasSuffix_(v6, v16, (uint64_t)CFSTR("\\hline \\end{array}"), v17, v18, v19);

    return hasSuffix;
  }
}

- (id)alternativeCandidatesLog
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
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
  uint64_t i;
  void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t j;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
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
  void *v69;
  const char *v70;
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
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v93;
  NSArray *obj;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  obj = self->_tokenColumns;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v106, (uint64_t)v112, 16, v7);
  if (v13)
  {
    v96 = *(_QWORD *)v107;
    do
    {
      v97 = 0;
      v95 = v13;
      do
      {
        if (*(_QWORD *)v107 != v96)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v97);
        objc_msgSend_tokenRows(v14, v8, v9, v10, v11, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (unint64_t)objc_msgSend_count(v15, v16, v17, v18, v19, v20) > 1;

        if (v21)
        {
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          objc_msgSend_mathTokenRows(v14, v23, v24, v25, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v102, (uint64_t)v111, 16, v30);
          if (v31)
          {
            v32 = *(_QWORD *)v103;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v103 != v32)
                  objc_enumerationMutation(v28);
                v34 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
                v98 = 0u;
                v99 = 0u;
                v100 = 0u;
                v101 = 0u;
                v35 = v34;
                v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v98, (uint64_t)v110, 16, v37);
                if (v43)
                {
                  v44 = *(_QWORD *)v99;
                  v45 = 1.0;
                  do
                  {
                    for (j = 0; j != v43; ++j)
                    {
                      if (*(_QWORD *)v99 != v44)
                        objc_enumerationMutation(v35);
                      objc_msgSend_score(*(void **)(*((_QWORD *)&v98 + 1) + 8 * j), v38, v39, v40, v41, v42);
                      v45 = v45 * v47;
                    }
                    v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v98, (uint64_t)v110, 16, v42);
                  }
                  while (v43);
                }
                else
                {
                  v45 = 1.0;
                }

                objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v48, (uint64_t)CFSTR("%.3f"), v49, v50, v51, *(_QWORD *)&v45);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v22, v53, (uint64_t)v52, v54, v55, v56);

              }
              v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v57, (uint64_t)&v102, (uint64_t)v111, 16, v58);
            }
            while (v31);
          }

          v59 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend_componentsJoinedByString_(v22, v60, (uint64_t)CFSTR(", "), v61, v62, v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v59, v65, (uint64_t)CFSTR("[%@]"), v66, v67, v68, v64);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v93, v70, (uint64_t)v69, v71, v72, v73);

        }
        ++v97;
      }
      while (v97 != v95);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v106, (uint64_t)v112, 16, v12);
    }
    while (v13);
  }

  v74 = (void *)MEMORY[0x1E0CB3940];
  v80 = objc_msgSend_count(v93, v75, v76, v77, v78, v79);
  objc_msgSend_componentsJoinedByString_(v93, v81, (uint64_t)CFSTR(","), v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v74, v86, (uint64_t)CFSTR("Math result %p has %lu subexpressions with alternative candidates having these scores: %@"), v87, v88, v89, self, v80, v85);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  return v90;
}

- (double)baseCharacterHeight
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  double v19;
  double *v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  double v24;
  _QWORD v25[8];
  _QWORD v26[5];
  __CFString *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  __n128 (*v31)(__n128 *, __n128 *);
  void (*v32)(uint64_t);
  void *v33;
  void *__p;
  void *v35;
  uint64_t v36;
  _QWORD v37[6];
  _BYTE v38[48];
  _QWORD v39[4];

  result = self->_baseCharacterHeight;
  if (result >= 0.0)
    return result;
  objc_msgSend_bounds(self, a2, v2, v3, v4, v5);
  v9 = v8;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x6012000000;
  v37[3] = sub_1BE725EF4;
  v37[4] = sub_1BE725F34;
  v37[5] = &unk_1BE94989A;
  memset(v38, 0, sizeof(v38));
  v28 = 0;
  v29 = &v28;
  v30 = 0x4812000000;
  v31 = sub_1BE725F3C;
  v32 = sub_1BE725F60;
  v33 = &unk_1BE94989A;
  __p = 0;
  v35 = 0;
  v36 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_1BE725F78;
  v26[4] = sub_1BE725F88;
  v27 = &stru_1E77F6F28;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1BE725F90;
  v25[3] = &unk_1E77F4358;
  v25[4] = v26;
  v25[5] = v39;
  v25[6] = v37;
  v25[7] = &v28;
  objc_msgSend_enumerateTokensInPreferredTranscriptionPathWithBlock_(self, v10, (uint64_t)v25, v11, v12, v13);
  v15 = (double *)v29[6];
  v14 = (double *)v29[7];
  v16 = (char *)v14 - (char *)v15;
  if (v14 != v15)
  {
    v17 = v16 >> 3;
    v18 = v16 - 8;
    if (v18 >= 8)
    {
      v21 = (v18 >> 3) + 1;
      v20 = &v15[v21 & 0x3FFFFFFFFFFFFFFELL];
      v22 = v15 + 1;
      v19 = 0.0;
      v23 = v21 & 0x3FFFFFFFFFFFFFFELL;
      do
      {
        v19 = v19 + *(v22 - 1) + *v22;
        v22 += 2;
        v23 -= 2;
      }
      while (v23);
      if (v21 == (v21 & 0x3FFFFFFFFFFFFFFELL))
        goto LABEL_9;
    }
    else
    {
      v19 = 0.0;
      v20 = (double *)v29[6];
    }
    do
    {
      v24 = *v20++;
      v19 = v19 + v24;
    }
    while (v20 != v14);
LABEL_9:
    v9 = v19 / (double)(unint64_t)v17;
  }
  self->_baseCharacterHeight = v9;
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(&v28, 8);
  if (__p)
  {
    v35 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(v37, 8);
  sub_1BE61BEF4((uint64_t)v38);
  _Block_object_dispose(v39, 8);
  return self->_baseCharacterHeight;
}

- (BOOL)transformNotationToInternal
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  objc_class *v46;
  NSArray *tokenColumns;
  char *v48;
  void *v49;
  BOOL v50;
  uint64_t v52;
  NSArray *obj;
  void *v54;
  id v55;
  char *v56;
  _QWORD v57[4];
  id v58;
  uint64_t *v59;
  char v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v52 = 80;
  obj = self->_transcriptionPaths;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v61, (uint64_t)v69, 16, v8);
  if (v14)
  {
    v15 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v62 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        v18 = objc_msgSend_length(v17, v9, v10, v11, v12, v13, v52);
        objc_msgSend_transcriptionWithPath_columnRange_(self, v19, (uint64_t)v17, 0, v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend_containsString_(v21, v22, (uint64_t)CFSTR("\\begin{array}{lr}"), v23, v24, v25);
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v27, v28, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend_length(v17, v33, v34, v35, v36, v37);
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = sub_1BE72675C;
        v57[3] = &unk_1E77F4400;
        v60 = v26;
        v59 = &v65;
        v39 = v32;
        v58 = v39;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v40, (uint64_t)v17, 0, v38, (uint64_t)v57);
        objc_msgSend_addObject_(v54, v41, (uint64_t)v39, v42, v43, v44);

      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v61, (uint64_t)v69, 16, v13);
    }
    while (v14);
  }

  if (*((_BYTE *)v66 + 24))
  {
    v55 = 0;
    v56 = 0;
    sub_1BE71B8A4((uint64_t)CHTokenizedMathResult, v54, &v56, &v55);
    v45 = v56;
    v46 = (objc_class *)v55;
    tokenColumns = self->_tokenColumns;
    self->_tokenColumns = (NSArray *)v45;
    v48 = v45;

    v49 = *(Class *)((char *)&self->super.super.isa + v52);
    *(Class *)((char *)&self->super.super.isa + v52) = v46;

    v50 = *((_BYTE *)v66 + 24) != 0;
  }
  else
  {
    v50 = 0;
  }

  _Block_object_dispose(&v65, 8);
  return v50;
}

- (id)resultTransformedToOfficialNotationWithExplicitOperators:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  CHTokenizedMathResultToken *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  CHTokenizedMathResultToken *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t i;
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
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  CHTokenizedMathResultToken *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  const char *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  CHTokenizedMathResultToken *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
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
  uint64_t v155;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  void (*v160)(uint64_t, void *);
  void *v161;
  id v162;
  uint64_t *v163;
  uint64_t *v164;
  char v165;
  BOOL v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  char v170;
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  char v174;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, a3, v3, v4, v5);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(self->_transcriptionPaths, v7, v8, v9, v10, v11))
    goto LABEL_17;
  objc_msgSend_objectAtIndexedSubscript_(self->_transcriptionPaths, v12, 0, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_length(v16, v17, v18, v19, v20, v21);
  objc_msgSend_transcriptionWithPath_columnRange_(self, v23, (uint64_t)v16, 0, v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_containsString_(v25, v26, (uint64_t)CFSTR("\\hline"), v27, v28, v29);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v31, v32, v33, v34, v35);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v42 = [CHTokenizedMathResultToken alloc];
    objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v43, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v42, v49, (uint64_t)CFSTR("\\begin{array}{lr}"), (uint64_t)v48, 1, v50, 1.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    objc_msgSend_addObject_(v41, v52, (uint64_t)v51, v53, v54, v55);

  }
  v171 = 0;
  v172 = &v171;
  v173 = 0x2020000000;
  v174 = 1;
  v167 = 0;
  v168 = &v167;
  v169 = 0x2020000000;
  v170 = 1;
  v56 = objc_msgSend_length(v16, v36, v37, v38, v39, v40, 80);
  v158 = MEMORY[0x1E0C809B0];
  v159 = 3221225472;
  v160 = sub_1BE726EF4;
  v161 = &unk_1E77F4428;
  v165 = v30;
  v57 = v41;
  v162 = v57;
  v163 = &v171;
  v164 = &v167;
  v166 = a3;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v58, (uint64_t)v16, 0, v56, (uint64_t)&v158);
  if (v30)
  {
    v63 = [CHTokenizedMathResultToken alloc];
    objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v64, v65, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v63, v70, (uint64_t)CFSTR("\\end{array}"), (uint64_t)v69, 1, v71, 1.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    objc_msgSend_addObject_(v57, v73, (uint64_t)v72, v74, v75, v76);

  }
  objc_msgSend_addObject_(v157, v59, (uint64_t)v57, v60, v61, v62);

  _Block_object_dispose(&v167, 8);
  _Block_object_dispose(&v171, 8);

  for (i = 1; ; ++i)
  {
    if (i >= objc_msgSend_count(*(void **)((char *)&self->super.super.isa + v155), v77, v78, v79, v80, v81))
    {
      if ((v30 & 1) == 0)
        goto LABEL_17;
      goto LABEL_15;
    }
    objc_msgSend_objectAtIndexedSubscript_(*(void **)((char *)&self->super.super.isa + v155), v83, i, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend_length(v87, v88, v89, v90, v91, v92);
    objc_msgSend_transcriptionWithPath_columnRange_(self, v94, (uint64_t)v87, 0, v93, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend_containsString_(v96, v97, (uint64_t)CFSTR("\\hline"), v98, v99, v100);
    if (((v30 ^ v106) & 1) != 0)
      break;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v101, v102, v103, v104, v105);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (v106)
    {
      v113 = [CHTokenizedMathResultToken alloc];
      objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v114, v115, v116, v117, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v113, v120, (uint64_t)CFSTR("\\begin{array}{lr}"), (uint64_t)v119, 1, v121, 1.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      objc_msgSend_addObject_(v112, v123, (uint64_t)v122, v124, v125, v126);

    }
    v171 = 0;
    v172 = &v171;
    v173 = 0x2020000000;
    v174 = 1;
    v167 = 0;
    v168 = &v167;
    v169 = 0x2020000000;
    v170 = 1;
    v127 = objc_msgSend_length(v87, v107, v108, v109, v110, v111);
    v158 = MEMORY[0x1E0C809B0];
    v159 = 3221225472;
    v160 = sub_1BE726EF4;
    v161 = &unk_1E77F4428;
    v165 = v106;
    v128 = v112;
    v162 = v128;
    v163 = &v171;
    v164 = &v167;
    v166 = a3;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v129, (uint64_t)v87, 0, v127, (uint64_t)&v158);
    if (v106)
    {
      v134 = [CHTokenizedMathResultToken alloc];
      objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v135, v136, v137, v138, v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v134, v141, (uint64_t)CFSTR("\\end{array}"), (uint64_t)v140, 1, v142, 1.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      objc_msgSend_addObject_(v128, v144, (uint64_t)v143, v145, v146, v147);

    }
    objc_msgSend_addObject_(v157, v130, (uint64_t)v128, v131, v132, v133);
    v30 |= v106;

    _Block_object_dispose(&v167, 8);
    _Block_object_dispose(&v171, 8);

  }
  if ((v30 & 1) != 0)
  {
LABEL_15:
    v148 = [CHTokenizedMathResult alloc];
    v153 = (void *)objc_msgSend_initWithBestPathTokens_(v148, v149, (uint64_t)v157, v150, v151, v152);
    goto LABEL_18;
  }
LABEL_17:
  v153 = 0;
LABEL_18:

  return v153;
}

+ (CHTokenizedMathResult)mathResultWithReindexedTokens:(id)a3 originalStrokeIdentifiersOrdering:(id)a4 newStrokeIdentifiersOrdering:(id)a5
{
  id v7;
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
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CHTokenizedMathResult *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id obj;
  void *v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v51 = a4;
  v52 = a5;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend_transcriptionPaths(v7, v13, v14, v15, v16, v17);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v57, (uint64_t)v61, 16, v19);
  if (v25)
  {
    v26 = *(_QWORD *)v58;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v58 != v26)
          objc_enumerationMutation(obj);
        v28 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v27);
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v20, v21, v22, v23, v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend_tokenColumnCount(v7, v30, v31, v32, v33, v34);
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = sub_1BE72761C;
        v53[3] = &unk_1E77F4478;
        v54 = v51;
        v55 = v52;
        v36 = v29;
        v56 = v36;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v7, v37, v28, 0, v35, (uint64_t)v53);
        objc_msgSend_addObject_(v50, v38, (uint64_t)v36, v39, v40, v41);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v57, (uint64_t)v61, 16, v24);
    }
    while (v25);
  }

  v42 = [CHTokenizedMathResult alloc];
  v47 = (void *)objc_msgSend_initWithBestPathTokens_(v42, v43, (uint64_t)v50, v44, v45, v46);

  return (CHTokenizedMathResult *)v47;
}

+ (id)updateStrokeIndexOffsetForSubResults:(id)a3 fromResult:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  CHTokenizedMathResult *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id obj;
  uint64_t v82;
  id v83;
  id v84;
  void *v85;
  uint64_t i;
  void *v87;
  void *v88;
  _QWORD v89[4];
  id v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v84 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8, v9, v10);
  v83 = (id)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = v5;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v96, (uint64_t)v101, 16, v12);
  if (v18)
  {
    v82 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v97 != v82)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
        objc_msgSend_strokeIndexes(v19, v13, v14, v15, v16, v17);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeIndexes(v84, v20, v21, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = (void *)objc_msgSend_mutableCopy(v25, v26, v27, v28, v29, v30);

        objc_msgSend_removeIndexes_(v88, v31, (uint64_t)v85, v32, v33, v34);
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v35, v36, v37, v38, v39);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        objc_msgSend_transcriptionPaths(v19, v40, v41, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v92, (uint64_t)v100, 16, v47);
        if (v53)
        {
          v54 = *(_QWORD *)v93;
          do
          {
            for (j = 0; j != v53; ++j)
            {
              if (*(_QWORD *)v93 != v54)
                objc_enumerationMutation(v45);
              v56 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * j);
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v48, v49, v50, v51, v52);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend_tokenColumnCount(v19, v58, v59, v60, v61, v62);
              v89[0] = MEMORY[0x1E0C809B0];
              v89[1] = 3221225472;
              v89[2] = sub_1BE727C4C;
              v89[3] = &unk_1E77F1FA8;
              v90 = v88;
              v64 = v57;
              v91 = v64;
              objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v19, v65, v56, 0, v63, (uint64_t)v89);
              objc_msgSend_addObject_(v87, v66, (uint64_t)v64, v67, v68, v69);

            }
            v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v92, (uint64_t)v100, 16, v52);
          }
          while (v53);
        }

        v70 = [CHTokenizedMathResult alloc];
        v75 = (void *)objc_msgSend_initWithBestPathTokens_(v70, v71, (uint64_t)v87, v72, v73, v74);
        objc_msgSend_addObject_(v83, v76, (uint64_t)v75, v77, v78, v79);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v96, (uint64_t)v101, 16, v17);
    }
    while (v18);
  }

  return v83;
}

- (id)tokenizedMathResultByAppendingTokenizedMathResult:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
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
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
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
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t i;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
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
  uint64_t v94;
  uint64_t v95;
  id v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  CHTokenizedMathResult *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  CHTokenizedMathResult *v115;
  unint64_t v116;
  void *v117;
  void *v118;
  _QWORD v119[4];
  id v120;
  uint64_t v121;
  _QWORD v122[4];
  id v123;

  v4 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIndexes(self, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_count(v16, v17, v18, v19, v20, v21);

  v28 = 0;
  v29 = MEMORY[0x1E0C809B0];
  v115 = self;
  while (1)
  {
    objc_msgSend_transcriptionPaths(self, v23, v24, v25, v26, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_count(v30, v31, v32, v33, v34, v35);

    if (v28 >= v36)
      break;
    objc_msgSend_transcriptionPaths(self, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v42, v43, v28, v44, v45, v46);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v47, v48, v49, v50, v51);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v28;
    v57 = objc_msgSend_tokenColumnCount(self, v52, v53, v54, v55, v56);
    v122[0] = v29;
    v122[1] = 3221225472;
    v122[2] = sub_1BE728248;
    v122[3] = &unk_1E77F1EC8;
    v58 = v117;
    v123 = v58;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(self, v59, (uint64_t)v118, 0, v57, (uint64_t)v122);
    for (i = 0; ; ++i)
    {
      objc_msgSend_transcriptionPaths(v4, v60, v61, v62, v63, v64);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend_count(v66, v67, v68, v69, v70, v71);

      if (i >= v72)
        break;
      objc_msgSend_transcriptionPaths(v4, v73, v74, v75, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v78, v79, i, v80, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      v89 = (void *)objc_msgSend_mutableCopy(v58, v84, v85, v86, v87, v88);
      v95 = objc_msgSend_tokenColumnCount(v4, v90, v91, v92, v93, v94);
      v119[0] = v29;
      v119[1] = 3221225472;
      v119[2] = sub_1BE728254;
      v119[3] = &unk_1E77F44C8;
      v121 = v22;
      v96 = v89;
      v120 = v96;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v4, v97, (uint64_t)v83, 0, v95, (uint64_t)v119);
      v103 = (void *)objc_msgSend_copy(v96, v98, v99, v100, v101, v102);
      objc_msgSend_addObject_(v10, v104, (uint64_t)v103, v105, v106, v107);

    }
    self = v115;
    v28 = v116 + 1;
  }
  v108 = [CHTokenizedMathResult alloc];
  v113 = (void *)objc_msgSend_initWithBestPathTokens_(v108, v109, (uint64_t)v10, v110, v111, v112);

  return v113;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)transcriptionPaths
{
  return self->_transcriptionPaths;
}

- (NSArray)transcriptionPathScores
{
  return self->_transcriptionPathScores;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptionPathScores, 0);
  objc_storeStrong((id *)&self->_transcriptionPaths, 0);
  objc_storeStrong((id *)&self->_selectedTranscriptionPathIndex, 0);
  objc_storeStrong((id *)&self->_correctedLatex, 0);
  objc_storeStrong((id *)&self->_parseTree, 0);
  objc_storeStrong((id *)&self->_tokenColumns, 0);
}

@end
