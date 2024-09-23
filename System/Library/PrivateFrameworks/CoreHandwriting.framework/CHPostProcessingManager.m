@implementation CHPostProcessingManager

- (CHPostProcessingManager)init
{
  CHPostProcessingManager *v2;
  NSArray *v3;
  NSArray *sequence;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHPostProcessingManager;
  v2 = -[CHPostProcessingManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    sequence = v2->_sequence;
    v2->_sequence = v3;

  }
  return v2;
}

- (CHPostProcessingManager)initWithStep:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CHPostProcessingManager *v15;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99D20]);
  v10 = (void *)objc_msgSend_initWithObjects_(v5, v6, (uint64_t)v4, v7, v8, v9, 0);
  v15 = (CHPostProcessingManager *)objc_msgSend_initWithSequence_(self, v11, (uint64_t)v10, v12, v13, v14);

  return v15;
}

- (CHPostProcessingManager)initWithSequence:(id)a3
{
  id v5;
  CHPostProcessingManager *v6;
  CHPostProcessingManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHPostProcessingManager;
  v6 = -[CHPostProcessingManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sequence, a3);

  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  __int128 v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
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
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
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
  NSObject *v72;
  objc_class *v73;
  void *v74;
  __int128 v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = a4;
  v13 = 0;
  *(_QWORD *)&v14 = 138412802;
  v76 = v14;
  while (1)
  {
    objc_msgSend_sequence(self, v7, v8, v9, v10, v11, v76);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v13 < objc_msgSend_count(v15, v16, v17, v18, v19, v20);

    if (!v21)
      break;
    objc_msgSend_sequence(self, v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v27, v28, v13, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_modifiesOriginalTokens(v32, v33, v34, v35, v36, v37) & 1) != 0)
    {
      v43 = 0;
    }
    else
    {
      objc_msgSend_result(v6, v38, v39, v40, v41, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rawTranscription(v44, v45, v46, v47, v48, v49);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend_process_options_(v32, v38, (uint64_t)v6, (uint64_t)v12, v41, v42);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_modifiesOriginalTokens(v32, v51, v52, v53, v54, v55) & 1) == 0)
    {
      objc_msgSend_result(v50, v56, v57, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rawTranscription(v61, v62, v63, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend_isEqualToString_(v67, v68, (uint64_t)v43, v69, v70, v71) & 1) == 0)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v72 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
        {
          v73 = (objc_class *)objc_opt_class();
          NSStringFromClass(v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v76;
          v78 = v74;
          v79 = 2112;
          v80 = v43;
          v81 = 2112;
          v82 = v67;
          _os_log_impl(&dword_1BE607000, v72, OS_LOG_TYPE_FAULT, "%@ unexpectedly modified original tokens: \"%@\" -> \"%@\", buf, 0x20u);

        }
      }

    }
    ++v13;
    v6 = v50;
  }

  return v6;
}

- (NSArray)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
  objc_storeStrong((id *)&self->_sequence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
