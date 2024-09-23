@implementation CHDecorateSpecialSymbolsStep

- (CHDecorateSpecialSymbolsStep)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CHDecorateSpecialSymbolsStep *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSSet *symbols;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CHDecorateSpecialSymbolsStep;
  v6 = -[CHDecorateSpecialSymbolsStep init](&v15, sel_init);
  if (v6)
  {
    objc_msgSend_componentsSeparatedByString_(CFSTR("€ £ ¥ ¢ ₺ ₴ ₽ ₩ °"), v2, (uint64_t)CFSTR(" "), v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v8, (uint64_t)v7, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    symbols = v6->_symbols;
    v6->_symbols = (NSSet *)v12;

  }
  return v6;
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
  void *v18;
  unint64_t i;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
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
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  CHTokenizedMathResult *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v91;
  _QWORD v92[5];
  id v93;
  uint8_t buf[16];

  v6 = a3;
  v91 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEBUG, "CHDecorateSpecialSymbolsStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v6, v13, v14, v15, v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v20, v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_count(v26, v27, v28, v29, v30, v31);

    if (i >= v32)
      break;
    objc_msgSend_result(v6, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v38, v39, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v44, v45, i, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v50, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v6, v56, v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v6, v62, v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend_tokenColumnCount(v67, v68, v69, v70, v71, v72);
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = sub_1BE613540;
    v92[3] = &unk_1E77F1FA8;
    v92[4] = self;
    v74 = v55;
    v93 = v74;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v61, v75, (uint64_t)v49, 0, v73, (uint64_t)v92);

    objc_msgSend_addObject_(v18, v76, (uint64_t)v74, v77, v78, v79);
  }
  v80 = [CHTokenizedMathResult alloc];
  v85 = (void *)objc_msgSend_initWithBestPathTokens_(v80, v81, (uint64_t)v18, v82, v83, v84);
  objc_msgSend_setResult_(v6, v86, (uint64_t)v85, v87, v88, v89);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbols, 0);
}

@end
