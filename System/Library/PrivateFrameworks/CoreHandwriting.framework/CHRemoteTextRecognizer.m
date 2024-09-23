@implementation CHRemoteTextRecognizer

- (CHRemoteTextRecognizer)initWithMode:(int)a3 locale:(id)a4
{
  uint64_t v4;
  id v6;
  CHRecognizerOptions *v7;
  const char *v8;
  uint64_t v9;
  CHRemoteTextRecognizer *v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = objc_alloc_init(CHRecognizerOptions);
  v10 = (CHRemoteTextRecognizer *)objc_msgSend_initWithMode_locale_recognizerOptions_(self, v8, v4, (uint64_t)v6, (uint64_t)v7, v9);

  return v10;
}

- (CHRemoteTextRecognizer)initWithMode:(int)a3 locale:(id)a4 recognizerOptions:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  CHRemoteTextRecognizer *active;
  _QWORD v17[2];

  v6 = *(_QWORD *)&a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v17[0] = v8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v17, 1, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  active = (CHRemoteTextRecognizer *)objc_msgSend_initWithMode_locales_activeCharacterSetPerLocale_recognizerOptions_(self, v14, v6, (uint64_t)v13, MEMORY[0x1E0C9AA70], (uint64_t)v9);

  return active;
}

- (CHRemoteTextRecognizer)initWithMode:(int)a3 locales:(id)a4 activeCharacterSetPerLocale:(id)a5 recognizerOptions:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  CHRecognizerOptions *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  CHRemoteTextRecognizer *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CHRemoteTextRecognizer *v31;
  CHRemoteTextRecognizer *v32;
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
  uint64_t v43;
  NSDictionary *activeCharacterSetPerLocale;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  objc_super v58;
  uint8_t buf[16];

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v12 = (CHRecognizerOptions *)a6;
  if (objc_msgSend_count(v10, v13, v14, v15, v16, v17))
  {
    if (v12)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v23 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v23, OS_LOG_TYPE_FAULT, "CHRemoteRecognizer must be initialized with at least one locale", buf, 2u);
  }

  if (!v12)
LABEL_9:
    v12 = objc_alloc_init(CHRecognizerOptions);
LABEL_10:
  v24 = objc_msgSend_enableCachingIfAvailable(v12, v18, v19, v20, v21, v22);
  v58.receiver = self;
  v58.super_class = (Class)CHRemoteTextRecognizer;
  v25 = -[CHRemoteRecognizer initWithEnableCachingIfAvailable:](&v58, sel_initWithEnableCachingIfAvailable_, v24);
  v31 = v25;
  v32 = v25;
  if (v25)
  {
    v25->_recognitionMode = v8;
    v25->_shouldUseTextReplacements = 1;
    v25->_enableGen2ModelIfAvailable = objc_msgSend_enableGen2ModelIfAvailable(v12, v26, v27, v28, v29, v30);
    v32->_enableGen2CharacterLMIfAvailable = objc_msgSend_enableGen2CharacterLMIfAvailable(v12, v33, v34, v35, v36, v37);
    v43 = objc_msgSend_copy(v10, v38, v39, v40, v41, v42);
    activeCharacterSetPerLocale = v32->_activeCharacterSetPerLocale;
    v32->_activeCharacterSetPerLocale = (NSDictionary *)v43;

    if (v11)
      v50 = (id)objc_msgSend_copy(v11, v45, v46, v47, v48, v49);
    else
      v50 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v51 = v50;
    objc_storeStrong((id *)&v31[1].super.super.isa, v50);

    v52 = (void *)objc_opt_class();
    v32->_shouldUseStrokeReordering = objc_msgSend_shouldUseStrokeReorderingForMode_(v52, v53, v8, v54, v55, v56);
  }

  return v32;
}

+ (id)newRemoteRecognizerWithMode:(int)a3 locales:(id)a4
{
  uint64_t v4;
  id v5;
  CHRecognizerOptions *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
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
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CHRemoteTextRecognizer *v38;
  const char *v39;
  void *active;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = objc_alloc_init(CHRecognizerOptions);
  v7 = (void *)objc_opt_class();
  objc_msgSend_effectiveRecognitionLocales_recognitionMode_(v7, v8, (uint64_t)v5, v4, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_class();
  objc_msgSend_defaultActiveCharacterSetForLocales_(v12, v13, (uint64_t)v11, v14, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  switch((_DWORD)v4)
  {
    case 6:
      objc_msgSend_setEnableCachingIfAvailable_(v6, v17, 0, v18, v19, v20);
      objc_msgSend_setEnableGen2ModelIfAvailable_(v6, v26, 1, v27, v28, v29);
      objc_msgSend_setEnableGen2CharacterLMIfAvailable_(v6, v30, 0, v31, v32, v33);
      break;
    case 4:
      objc_msgSend_setEnableCachingIfAvailable_(v6, v17, 0, v18, v19, v20);
      goto LABEL_7;
    case 2:
      objc_msgSend_setEnableCachingIfAvailable_(v6, v17, 1, v18, v19, v20);
LABEL_7:
      objc_msgSend_setEnableGen2ModelIfAvailable_(v6, v22, 1, v23, v24, v25);
      objc_msgSend_setEnableGen2CharacterLMIfAvailable_(v6, v34, 1, v35, v36, v37);
      break;
  }
  v38 = [CHRemoteTextRecognizer alloc];
  active = (void *)objc_msgSend_initWithMode_locales_activeCharacterSetPerLocale_recognizerOptions_(v38, v39, v4, (uint64_t)v11, (uint64_t)v21, (uint64_t)v6);

  return active;
}

- (NSLocale)locale
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (NSLocale *)objc_msgSend_firstObject(self->_activeCharacterSetPerLocale, a2, v2, v3, v4, v5);
}

- (NSCharacterSet)activeCharacterSet
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  isa = self[1].super.super.isa;
  objc_msgSend_firstObject(self->_activeCharacterSetPerLocale, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(isa, v8, (uint64_t)v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSCharacterSet *)v12;
}

- (void)setActiveCharacterSet:(id)a3
{
  Class isa;
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
  char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSDictionary *activeCharacterSetPerLocale;
  void *v27;
  const char *v28;
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
  objc_class *v40;
  Class v41;
  char *v42;

  v42 = (char *)a3;
  isa = self[1].super.super.isa;
  objc_msgSend_firstObject(self->_activeCharacterSetPerLocale, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(isa, v11, (uint64_t)v10, v12, v13, v14);
  v15 = (char *)objc_claimAutoreleasedReturnValue();

  if (v15 != v42)
  {
    v25 = (void *)objc_msgSend_mutableCopy(self[1].super.super.isa, v16, v17, v18, v19, v20);
    activeCharacterSetPerLocale = self->_activeCharacterSetPerLocale;
    if (v42)
    {
      objc_msgSend_firstObject(activeCharacterSetPerLocale, v42, v21, v22, v23, v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v25, v28, (uint64_t)v42, (uint64_t)v27, v29, v30);
    }
    else
    {
      objc_msgSend_firstObject(activeCharacterSetPerLocale, 0, v21, v22, v23, v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectForKey_(v25, v31, (uint64_t)v27, v32, v33, v34);
    }

    v40 = (objc_class *)objc_msgSend_copy(v25, v35, v36, v37, v38, v39);
    v41 = self[1].super.super.isa;
    self[1].super.super.isa = v40;

  }
}

- (id)textRecognitionResultForDrawing:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
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
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
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
  void *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  _QWORD v74[5];
  id v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  _QWORD v83[5];
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;

  v8 = a3;
  v9 = a4;
  objc_msgSend_locale(self, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v16 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v74[0]) = 0;
      _os_log_impl(&dword_1BE607000, v16, OS_LOG_TYPE_FAULT, "A locale is required to build the remote recognition request", (uint8_t *)v74, 2u);
    }

  }
  sub_1BE634754((unsigned __int8 *)self, v8, v9);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v23 = v17;
  if (!self)
  {

    v72 = 0;
    if (!a5)
      goto LABEL_22;
    goto LABEL_21;
  }
  objc_msgSend_setupXPCConnectionIfNeeded(self, v18, v19, v20, v21, v22);
  objc_msgSend_connection(self, v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v35 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v74[0]) = 0;
      _os_log_impl(&dword_1BE607000, v35, OS_LOG_TYPE_FAULT, "XPC connection must be non-nil", (uint8_t *)v74, 2u);
    }

  }
  v96 = 0;
  v97 = &v96;
  v98 = 0x3032000000;
  v99 = sub_1BE634CD4;
  v100 = sub_1BE634CE4;
  v101 = 0;
  v90 = 0;
  v91 = &v90;
  v92 = 0x3032000000;
  v93 = sub_1BE634CD4;
  v94 = sub_1BE634CE4;
  v95 = 0;
  if (objc_msgSend_shouldRemoveUnnaturalGaps(v23, v30, v31, v32, v33, v34))
  {
    objc_msgSend_drawing(v23, v36, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_drawingByRemovingUnnaturalHorizontalGaps_(v41, v42, v43, v44, v45, v46, 10000.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDrawing_(v23, v48, (uint64_t)v47, v49, v50, v51);

  }
  objc_msgSend_setHasBeenSubmitted_(v23, v36, 1, v38, v39, v40);
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = sub_1BE634CD4;
  v88 = sub_1BE634CE4;
  v89 = 0;
  objc_msgSend_connection(self, v52, v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = MEMORY[0x1E0C809B0];
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = sub_1BE634FA4;
  v83[3] = &unk_1E77F2310;
  v83[4] = &v84;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v57, v59, (uint64_t)v83, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v74[0] = v58;
  v74[1] = 3221225472;
  v74[2] = sub_1BE6350C0;
  v74[3] = &unk_1E77F2360;
  v76 = &v96;
  v77 = &v90;
  v74[4] = self;
  v64 = v23;
  v75 = v64;
  v78 = &v79;
  objc_msgSend_handleRecognitionRequest_withReply_(v63, v65, (uint64_t)v64, (uint64_t)v74, v66, v67);
  if (!*((_BYTE *)v80 + 24))
    objc_msgSend_logDrawingsAndResultsForRequest_result_error_(self, v68, (uint64_t)v64, 0, v85[5], v69);
  v70 = (void *)v85[5];
  if (!v70)
    v70 = (void *)v91[5];
  v71 = objc_retainAutorelease(v70);
  self = (CHRemoteTextRecognizer *)(id)v97[5];

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v96, 8);

  v72 = v71;
  if (a5)
LABEL_21:
    *a5 = objc_retainAutorelease(v72);
LABEL_22:

  return self;
}

- (id)transcriptionPathsForTokenizedTextResult:(id)a3 withHistory:(id)a4 scores:(id *)a5 error:(id *)a6
{
  id v10;
  CHDrawing *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v43;
  id v44;
  _QWORD v45[7];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[5];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  __CFString *v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v10 = a4;
  v11 = objc_alloc_init(CHDrawing);
  objc_msgSend_addPoint_(v11, v12, v13, v14, v15, v16, 0.0, 0.0);
  objc_msgSend_endStroke(v11, v17, v18, v19, v20, v21);
  if (v10)
  {
    v71 = CHRecognitionOptionTextBefore[0];
    v72[0] = v10;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v72, (uint64_t)&v71, 1, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  v43 = v24;
  sub_1BE634754((unsigned __int8 *)self, v11, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_1BE634CD4;
  v69 = sub_1BE634CE4;
  v70 = 0;
  objc_msgSend_connection(self, v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = sub_1BE634CEC;
  v64[3] = &unk_1E77F2310;
  v64[4] = &v65;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v31, v33, (uint64_t)v64, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = sub_1BE634CD4;
  v62 = sub_1BE634CE4;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = sub_1BE634CD4;
  v56 = sub_1BE634CE4;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = sub_1BE634CD4;
  v50 = sub_1BE634CE4;
  v51 = 0;
  v45[0] = v32;
  v45[1] = 3221225472;
  v45[2] = sub_1BE634E08;
  v45[3] = &unk_1E77F2338;
  v45[4] = &v52;
  v45[5] = &v58;
  v45[6] = &v46;
  objc_msgSend_transcriptionPathsForTokenizedTextResult_recognitionRequest_withReply_(v37, v38, (uint64_t)v44, (uint64_t)v25, (uint64_t)v45, v39);
  if (a6)
  {
    v40 = (void *)v66[5];
    if (!v40)
      v40 = (void *)v47[5];
    *a6 = objc_retainAutorelease(v40);
  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v59[5]);
  v41 = (id)v53[5];
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v65, 8);
  return v41;
}

- (BOOL)isEqualToRemoteTextRecognizer:(id)a3
{
  CHRemoteTextRecognizer *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
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
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
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
  int v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
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
  int v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char isEqualToDictionary;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
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
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  int isEqualToArray;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  objc_super v162;

  v4 = (CHRemoteTextRecognizer *)a3;
  if (self == v4)
  {
    isEqualToDictionary = 1;
    goto LABEL_12;
  }
  v162.receiver = self;
  v162.super_class = (Class)CHRemoteTextRecognizer;
  if (-[CHRemoteRecognizer isEqualToRemoteRecognizer:](&v162, sel_isEqualToRemoteRecognizer_, v4))
  {
    v10 = objc_msgSend_recognitionMode(self, v5, v6, v7, v8, v9);
    if (v10 == objc_msgSend_recognitionMode(v4, v11, v12, v13, v14, v15))
    {
      v21 = objc_msgSend_contentType(self, v16, v17, v18, v19, v20);
      if (v21 == objc_msgSend_contentType(v4, v22, v23, v24, v25, v26))
      {
        v32 = objc_msgSend_autoCapitalizationMode(self, v27, v28, v29, v30, v31);
        if (v32 == objc_msgSend_autoCapitalizationMode(v4, v33, v34, v35, v36, v37))
        {
          v43 = objc_msgSend_autoCorrectionMode(self, v38, v39, v40, v41, v42);
          if (v43 == objc_msgSend_autoCorrectionMode(v4, v44, v45, v46, v47, v48))
          {
            v54 = objc_msgSend_baseWritingDirection(self, v49, v50, v51, v52, v53);
            if (v54 == objc_msgSend_baseWritingDirection(v4, v55, v56, v57, v58, v59))
            {
              v65 = objc_msgSend_enableGen2ModelIfAvailable(self, v60, v61, v62, v63, v64);
              if (v65 == objc_msgSend_enableGen2ModelIfAvailable(v4, v66, v67, v68, v69, v70))
              {
                v76 = objc_msgSend_enableGen2CharacterLMIfAvailable(self, v71, v72, v73, v74, v75);
                if (v76 == objc_msgSend_enableGen2CharacterLMIfAvailable(v4, v77, v78, v79, v80, v81))
                {
                  objc_msgSend_locales(self, v82, v83, v84, v85, v86);
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_locales(v4, v90, v91, v92, v93, v94);
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v89 == v100)
                  {

                  }
                  else
                  {
                    objc_msgSend_locales(self, v95, v96, v97, v98, v99);
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v106)
                    {
                      isEqualToDictionary = 0;
                      goto LABEL_29;
                    }
                    objc_msgSend_locales(v4, v101, v102, v103, v104, v105);
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v112)
                      goto LABEL_23;
                    objc_msgSend_locales(self, v107, v108, v109, v110, v111);
                    v113 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_locales(v4, v114, v115, v116, v117, v118);
                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                    isEqualToArray = objc_msgSend_isEqualToArray_(v113, v120, (uint64_t)v119, v121, v122, v123);

                    if (!isEqualToArray)
                      goto LABEL_10;
                  }
                  objc_msgSend_activeCharacterSetPerLocale(self, v125, v126, v127, v128, v129);
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_activeCharacterSetPerLocale(v4, v130, v131, v132, v133, v134);
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v89 != v100)
                  {
                    objc_msgSend_activeCharacterSetPerLocale(self, v135, v136, v137, v138, v139);
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v106)
                    {
                      objc_msgSend_activeCharacterSetPerLocale(v4, v140, v141, v142, v143, v144);
                      v150 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v150)
                      {
                        objc_msgSend_activeCharacterSetPerLocale(self, v145, v146, v147, v148, v149);
                        v151 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_activeCharacterSetPerLocale(v4, v152, v153, v154, v155, v156);
                        v157 = (void *)objc_claimAutoreleasedReturnValue();
                        isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v151, v158, (uint64_t)v157, v159, v160, v161);

                      }
                      else
                      {
                        isEqualToDictionary = 0;
                      }

                      goto LABEL_28;
                    }
LABEL_23:
                    isEqualToDictionary = 0;
LABEL_28:

                    goto LABEL_29;
                  }
                  isEqualToDictionary = 1;
                  v100 = v89;
LABEL_29:

                  goto LABEL_12;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_10:
  isEqualToDictionary = 0;
LABEL_12:

  return isEqualToDictionary;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRemoteTextRecognizer;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToRemoteTextRecognizer = objc_msgSend_isEqualToRemoteTextRecognizer_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteTextRecognizer;
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
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v20;
  unint64_t v21;
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
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  objc_super v86;

  v7 = 0;
  v8 = 0;
  v9 = 0;
  objc_msgSend_locales(self, a2, v2, v3, v4, v5);
  while (1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_count(v15, v16, v17, v18, v19, v20);

    if (v7 >= v21)
      break;
    objc_msgSend_locales(self, v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v27, v28, v7, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_activeCharacterSetPerLocale(self, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v38, v39, (uint64_t)v32, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_msgSend_hash(v32, v44, v45, v46, v47, v48);
    if (v43)
      v8 ^= objc_msgSend_hash(v43, v49, v50, v51, v52, v53);
    v9 ^= v54 << v7;

    ++v7;
    objc_msgSend_locales(self, v10, v11, v12, v13, v14);
  }
  v86.receiver = self;
  v86.super_class = (Class)CHRemoteTextRecognizer;
  v55 = -[CHRemoteRecognizer hash](&v86, sel_hash);
  v61 = objc_msgSend_recognitionMode(self, v56, v57, v58, v59, v60);
  v67 = objc_msgSend_contentType(self, v62, v63, v64, v65, v66);
  v73 = objc_msgSend_autoCapitalizationMode(self, v68, v69, v70, v71, v72);
  v79 = objc_msgSend_autoCorrectionMode(self, v74, v75, v76, v77, v78);
  return v55 ^ v61 ^ v67 ^ v73 ^ v79 ^ objc_msgSend_baseWritingDirection(self, v80, v81, v82, v83, v84) ^ v8 ^ v9;
}

+ (int64_t)maxRequestStrokeCountForLocale:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v9 = objc_msgSend_drawingStrokeLimitForLocale_(v4, v5, (uint64_t)v3, v6, v7, v8);

  return v9;
}

- (int)recognitionMode
{
  return self->_recognitionMode;
}

- (int)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int)a3
{
  self->_contentType = a3;
}

- (int)autoCapitalizationMode
{
  return self->_autoCapitalizationMode;
}

- (void)setAutoCapitalizationMode:(int)a3
{
  self->_autoCapitalizationMode = a3;
}

- (int)autoCorrectionMode
{
  return self->_autoCorrectionMode;
}

- (void)setAutoCorrectionMode:(int)a3
{
  self->_autoCorrectionMode = a3;
}

- (int)baseWritingDirection
{
  return (int)self->_locales;
}

- (void)setBaseWritingDirection:(int)a3
{
  self->_locales = *(NSArray **)&a3;
}

- (BOOL)enableGen2ModelIfAvailable
{
  return self->_enableGen2ModelIfAvailable;
}

- (BOOL)enableGen2CharacterLMIfAvailable
{
  return self->_enableGen2CharacterLMIfAvailable;
}

- (NSArray)locales
{
  return (NSArray *)self->_activeCharacterSetPerLocale;
}

- (NSDictionary)activeCharacterSetPerLocale
{
  return (NSDictionary *)self[1].super.super.isa;
}

- (BOOL)shouldUseTextReplacements
{
  return self->_shouldUseTextReplacements;
}

- (void)setShouldUseTextReplacements:(BOOL)a3
{
  self->_shouldUseTextReplacements = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.super.isa, 0);
  objc_storeStrong((id *)&self->_activeCharacterSetPerLocale, 0);
}

@end
