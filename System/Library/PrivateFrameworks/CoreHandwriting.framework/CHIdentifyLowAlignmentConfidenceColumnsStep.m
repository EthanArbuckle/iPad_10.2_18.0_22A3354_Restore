@implementation CHIdentifyLowAlignmentConfidenceColumnsStep

- (id)process:(id)a3 options:(id)a4
{
  NSObject *v4;
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
  uint64_t v23;
  const char *v24;
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
  const char *v36;
  uint64_t v37;
  uint64_t v38;
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
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  uint64_t i;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint8_t buf[16];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v110 = a3;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v4 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v4, OS_LOG_TYPE_DEBUG, "CHIdentifyLowAlignmentConfidenceColumnsStep is running", buf, 2u);
  }

  objc_msgSend_result(v110, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenColumns(v10, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_count(v16, v17, v18, v19, v20, v21);
  v23 = v22 != 0;

  objc_msgSend_tokenColumns(v10, v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_count(v29, v30, v31, v32, v33, v34);

  v41 = v35 - 2;
  if (((v35 - 2) & 0x8000000000000000) == 0)
  {
    v42 = (__PAIR128__(v35, v22) - 1) >> 64;
    while (1)
    {
      objc_msgSend_tokenColumns(v10, v36, v37, v38, v39, v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v43, v44, v41, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      objc_msgSend_textTokenRows(v48, v49, v50, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v111, (uint64_t)v116, 16, v56);
      if (!v62)
        break;
      v63 = *(_QWORD *)v112;
      v64 = 1.0;
      do
      {
        for (i = 0; i != v62; ++i)
        {
          if (*(_QWORD *)v112 != v63)
            objc_enumerationMutation(v54);
          objc_msgSend_lastObject(*(void **)(*((_QWORD *)&v111 + 1) + 8 * i), v57, v58, v59, v60, v61);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_alignmentScore(v66, v67, v68, v69, v70, v71);
          v73 = v72;

          if (v73 < v64)
            v64 = v73;
        }
        v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v111, (uint64_t)v116, 16, v61);
      }
      while (v62);

      if (v64 >= 0.9)
        goto LABEL_21;
      ++v23;
      if (v41-- <= 0)
      {
        v23 = v42;
        goto LABEL_21;
      }
    }

  }
LABEL_21:
  if (v23 <= objc_msgSend_changeableTokenColumnCount(v10, v36, v37, v38, v39, v40))
    v23 = objc_msgSend_changeableTokenColumnCount(v10, v75, v76, v77, v78, v79);
  if (objc_msgSend_tokenColumnCount(v10, v75, v76, v77, v78, v79) - v23 == 1)
  {
    objc_msgSend_transcriptionPaths(v10, v80, v81, v82, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v85, v86, v87, v88, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v10, v92, (uint64_t)v91, 0, 1, 0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_countCharacters(v93, v94, v95, v96, v97, v98) == 1)
      v23 = objc_msgSend_tokenColumnCount(v10, v99, v100, v101, v102, v103);

  }
  if (v23 < objc_msgSend_changeableTokenColumnCount(v10, v80, v81, v82, v83, v84))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v108 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v108, OS_LOG_TYPE_FAULT, "CHIdentifyLowAlignmentConfidenceColumnsStep unexpectedly decreased the changeable token column count.", buf, 2u);
    }

  }
  objc_msgSend_setChangeableTokenColumnCount_(v10, v104, v23, v105, v106, v107);

  return v110;
}

@end
