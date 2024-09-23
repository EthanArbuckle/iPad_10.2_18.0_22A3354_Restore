@implementation CHInsertPrecedingSpaceForUnitsStep

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
  unint64_t v30;
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
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
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
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  CHTokenizedMathResult *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v89;
  void *v90;
  _QWORD v91[4];
  id v92;
  uint8_t *v93;
  _QWORD *v94;
  _QWORD *v95;
  _QWORD *v96;
  _QWORD v97[3];
  char v98;
  _QWORD v99[3];
  char v100;
  _QWORD v101[3];
  char v102;
  uint8_t buf[8];
  uint8_t *v104;
  uint64_t v105;
  char v106;

  v5 = a3;
  v89 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHInsertPrecedingSpaceForUnitsStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v5, v12, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v18, v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_count(v24, v25, v26, v27, v28, v29);

    if (i >= v30)
      break;
    objc_msgSend_result(v5, v31, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v36, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v42, v43, i, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v48, v49, v50, v51, v52);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1EF568BE0 != -1)
      dispatch_once(&qword_1EF568BE0, &unk_1E77F1F58);
    *(_QWORD *)buf = 0;
    v104 = buf;
    v105 = 0x2020000000;
    v106 = 1;
    v101[0] = 0;
    v101[1] = v101;
    v101[2] = 0x2020000000;
    v102 = 1;
    v99[0] = 0;
    v99[1] = v99;
    v99[2] = 0x2020000000;
    v100 = 1;
    v97[0] = 0;
    v97[1] = v97;
    v97[2] = 0x2020000000;
    v98 = 0;
    objc_msgSend_result(v5, v53, v54, v55, v56, v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v60, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend_tokenColumnCount(v65, v66, v67, v68, v69, v70);
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = sub_1BE612E0C;
    v91[3] = &unk_1E77F1F80;
    v93 = buf;
    v94 = v99;
    v95 = v97;
    v72 = v58;
    v92 = v72;
    v96 = v101;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v59, v73, (uint64_t)v47, 0, v71, (uint64_t)v91);

    objc_msgSend_addObject_(v90, v74, (uint64_t)v72, v75, v76, v77);
    _Block_object_dispose(v97, 8);
    _Block_object_dispose(v99, 8);
    _Block_object_dispose(v101, 8);
    _Block_object_dispose(buf, 8);

  }
  v78 = [CHTokenizedMathResult alloc];
  v83 = (void *)objc_msgSend_initWithBestPathTokens_(v78, v79, (uint64_t)v90, v80, v81, v82);
  objc_msgSend_setResult_(v5, v84, (uint64_t)v83, v85, v86, v87);

  return v5;
}

@end
