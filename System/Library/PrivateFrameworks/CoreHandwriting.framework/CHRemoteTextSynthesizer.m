@implementation CHRemoteTextSynthesizer

- (CHRemoteTextSynthesizer)initWithShouldSkipInventoryLookup:(BOOL)a3 shouldSaveStyleSample:(BOOL)a4
{
  CHRemoteTextSynthesizer *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHRemoteTextSynthesizer;
  result = -[CHRemoteTextSynthesizer init](&v7, sel_init);
  if (result)
  {
    result->_shouldSkipStyleInventoryLookup = a3;
    result->_shouldSaveStyleSample = a4;
  }
  return result;
}

- (CHRemoteTextSynthesizer)init
{
  return (CHRemoteTextSynthesizer *)((uint64_t (*)(CHRemoteTextSynthesizer *, char *, _QWORD, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_initWithShouldSkipInventoryLookup_shouldSaveStyleSample_, 0, 0);
}

- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t (**v12)(_QWORD);
  NSObject *v13;
  void *v14;
  CHRemoteSynthesisRequest *v15;
  const char *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v22;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = (uint64_t (**)(_QWORD))a5;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v13 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_DEFAULT, "Remote Synthesis Request for synthesize drawing", buf, 2u);
  }

  sub_1BE883970((uint64_t)self, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [CHRemoteSynthesisRequest alloc];
  v17 = (void *)objc_msgSend_initWithString_drawing_options_requestType_(v15, v16, (uint64_t)v10, 0, (uint64_t)v14, 0);
  if (v12 && (v12[2](v12) & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    v22 = 0;
    sub_1BE883BFC(self, v17, &v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v22;
    v20 = v19;
    if (a6)
      *a6 = objc_retainAutorelease(v19);

  }
  return v18;
}

- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t (**v15)(_QWORD);
  NSObject *v16;
  void *v17;
  CHRemoteSynthesisRequest *v18;
  const char *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (uint64_t (**)(_QWORD))a6;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v16 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v16, OS_LOG_TYPE_DEFAULT, "Remote Synthesis Request for refine drawing", buf, 2u);
  }

  sub_1BE883970((uint64_t)self, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [CHRemoteSynthesisRequest alloc];
  v20 = (void *)objc_msgSend_initWithString_drawing_options_requestType_(v18, v19, (uint64_t)v13, (uint64_t)v12, (uint64_t)v17, 1);
  if (v15 && (v15[2](v15) & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    v25 = 0;
    sub_1BE883BFC(self, v20, &v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v25;
    v23 = v22;
    if (a7)
      *a7 = objc_retainAutorelease(v22);

  }
  return v21;
}

- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t (**v18)(_QWORD);
  NSObject *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CHRemoteSynthesisRequest *v29;
  const char *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v36;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (uint64_t (**)(_QWORD))a7;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v19 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_DEFAULT, "Remote Synthesis Request for replace drawing", buf, 2u);
  }

  sub_1BE883970((uint64_t)self, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStyleDrawing_(v20, v21, (uint64_t)v14, v22, v23, v24);
  objc_msgSend_setStyleContent_(v20, v25, (uint64_t)v15, v26, v27, v28);
  v29 = [CHRemoteSynthesisRequest alloc];
  v31 = (void *)objc_msgSend_initWithString_drawing_options_requestType_(v29, v30, (uint64_t)v16, (uint64_t)v14, (uint64_t)v20, 2);
  if (v18 && (v18[2](v18) & 1) != 0)
  {
    v32 = 0;
  }
  else
  {
    v36 = 0;
    sub_1BE883BFC(self, v31, &v36);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v36;
    v34 = v33;
    if (a8)
      *a8 = objc_retainAutorelease(v33);

  }
  return v32;
}

- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4
{
  id v5;
  id v6;
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
  uint64_t v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  if ((CHHasPersonalizedSynthesisModelReady((uint64_t)v6, v7, v8, v9, v10, v11) & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(v6, v12, (uint64_t)CHTextSynthesisOptionSupportedCharactersStrict[0], v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_BOOLValue(v17, v18, v19, v20, v21, v22);

    indicesWithPersonalizedSynthesisSupport(v5, v23);
  }
  else
  {
    objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v12, v13, v14, v15, v16);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)dealloc
{
  objc_super v3;

  sub_1BE8848A0(self);
  v3.receiver = self;
  v3.super_class = (Class)CHRemoteTextSynthesizer;
  -[CHRemoteTextSynthesizer dealloc](&v3, sel_dealloc);
}

- (BOOL)populateStyleInventoryWithTokenizedResult:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  CHRemoteInventoryRequest *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = [CHRemoteInventoryRequest alloc];
  v16 = (void *)objc_msgSend_initWithTokenizedResult_drawing_strokeIdentifiers_(v13, v14, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v15);
  v21 = 0;
  v17 = sub_1BE885B4C(self, v16, &v21);
  v18 = v21;
  v19 = v18;
  if (a6)
    *a6 = objc_retainAutorelease(v18);

  return v17;
}

- (BOOL)updateStyleInventoryWithRemovedStrokeIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  CHRemoteInventoryRequest *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  id v17;

  v6 = a3;
  v7 = [CHRemoteInventoryRequest alloc];
  v12 = (void *)objc_msgSend_initWithRemovedStrokeIdentifiers_(v7, v8, (uint64_t)v6, v9, v10, v11);
  v17 = 0;
  v13 = sub_1BE885B4C(self, v12, &v17);
  v14 = v17;
  v15 = v14;
  if (a4)
    *a4 = objc_retainAutorelease(v14);

  return v13;
}

- (BOOL)resetStyleInventory:(id *)a3
{
  CHRemoteInventoryRequest *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *inited;
  BOOL v12;
  id v13;
  void *v14;
  id v16;

  v5 = [CHRemoteInventoryRequest alloc];
  inited = (void *)objc_msgSend_initResetInventoryRequest(v5, v6, v7, v8, v9, v10);
  v16 = 0;
  v12 = sub_1BE885B4C(self, inited, &v16);
  v13 = v16;
  v14 = v13;
  if (a3)
    *a3 = objc_retainAutorelease(v13);

  return v12;
}

- (id)styleInventoryStatus
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_DEBUG, "Remote Inventory Status Request", v5, 2u);
  }

  sub_1BE886394(self, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cachedStyleInventoryStatus
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_DEBUG, "Remote Cached Inventory Status Request", v5, 2u);
  }

  sub_1BE886394(self, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__connection, 0);
  objc_storeStrong((id *)&self->_cachedStyleInventoryStatus, 0);
}

@end
