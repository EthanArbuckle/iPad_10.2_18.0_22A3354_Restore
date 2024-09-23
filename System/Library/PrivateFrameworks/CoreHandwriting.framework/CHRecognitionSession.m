@implementation CHRecognitionSession

+ (BOOL)isLocaleSupported:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_isLocaleSupported_withMode_(CHRecognizerConfiguration, a2, (uint64_t)a3, 4, v3, v4);
}

- (CHRecognitionSession)initWithMode:(int64_t)a3
{
  CHRecognitionSession *v4;
  CHRecognitionSession *v5;
  NSMutableArray *v6;
  NSMutableArray *activeTasks;
  NSMutableDictionary *v8;
  NSMutableDictionary *correctionRecognizersByLocalesKey;
  NSMutableDictionary *v10;
  NSMutableDictionary *recognizersByLocaleID;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSHashTable *changeObserversTable;
  NSMutableArray *v19;
  NSMutableArray *inputDrawingClients;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CHStrokeClassificationModel *strokeClassificationModel;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CHGroupingModel *strokeGroupingModel;
  CHRecognitionSessionVersion *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CHRecognitionSessionVersion *sessionVersion;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  id *p_tasksWorkQueueForeground;
  NSObject *v47;
  id *p_tasksWorkQueueBackground;
  id *p_highResponsivenessQueue;
  NSObject *v50;
  NSObject *v51;
  dispatch_queue_t v52;
  NSObject *p_super;
  NSObject *v54;
  CHRecognitionSession *v55;
  uint64_t v56;
  NSObject *v57;
  dispatch_queue_t v58;
  OS_dispatch_queue *sessionQueue;
  uint64_t v60;
  NSMutableDictionary *recognitionOptions;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  CHSessionStateTracker *v78;
  CHSessionStateTracker *stateTracker;
  objc_super v81;
  uint8_t buf[8];
  uint64_t v83;
  void (*v84)(uint64_t);
  void *v85;
  CHRecognitionSession *v86;

  v81.receiver = self;
  v81.super_class = (Class)CHRecognitionSession;
  v4 = -[CHRecognitionSession init](&v81, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activeTasks = v4->__activeTasks;
    v4->__activeTasks = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    correctionRecognizersByLocalesKey = v4->__correctionRecognizersByLocalesKey;
    v4->__correctionRecognizersByLocalesKey = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recognizersByLocaleID = v4->__recognizersByLocaleID;
    v4->__recognizersByLocaleID = v10;

    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v12, v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    changeObserversTable = v4->__changeObserversTable;
    v4->__changeObserversTable = (NSHashTable *)v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    inputDrawingClients = v4->__inputDrawingClients;
    v4->__inputDrawingClients = v19;

    if (!a3)
    {
      objc_msgSend_modelWithModelName_(CHStrokeClassificationModel, v21, (uint64_t)CFSTR("stroke_classification.bundle"), v22, v23, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      strokeClassificationModel = v4->_strokeClassificationModel;
      v4->_strokeClassificationModel = (CHStrokeClassificationModel *)v25;

      v4->_autoCorrectionMode = 1;
    }
    if (_os_feature_enabled_impl() && (a3 | 2) == 2)
    {
      objc_msgSend_modelWithModelName_contentType_(CHGroupingModel, v27, (uint64_t)CFSTR("math_grouping.bundle"), 3, v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      strokeGroupingModel = v4->_strokeGroupingModel;
      v4->_strokeGroupingModel = (CHGroupingModel *)v30;

    }
    v4->_status = 1;
    v4->_mode = a3;
    v32 = [CHRecognitionSessionVersion alloc];
    v36 = objc_msgSend_initWithSessionVersion_sessionResultVersion_(v32, v33, 1, 4, v34, v35);
    sessionVersion = v4->_sessionVersion;
    v4->_sessionVersion = (CHRecognitionSessionVersion *)v36;

    v4->_recognitionEnvironment = 0;
    v4->_priority = 0;
    *(_QWORD *)&v4->_baseWritingDirection = 0x7FFFFFFFFFFFFFFFLL;
    if (!v4->__sessionQueue)
    {
LABEL_12:
      if (!v4->__tasksWorkQueueForeground)
        goto LABEL_17;
      if (qword_1EF568E88 == -1)
      {
        v44 = (id)qword_1EF568E18[0];
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
LABEL_16:

LABEL_17:
          if (!v4->__tasksWorkQueueBackground)
            goto LABEL_22;
          if (qword_1EF568E88 == -1)
          {
            v45 = (id)qword_1EF568E18[0];
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
            {
LABEL_21:

LABEL_22:
              p_tasksWorkQueueForeground = (id *)&v4->__tasksWorkQueueForeground;
              if (!v4->__highResponsivenessQueue)
                goto LABEL_27;
              if (qword_1EF568E88 == -1)
              {
                v47 = (id)qword_1EF568E18[0];
                if (!os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
                {
LABEL_26:

LABEL_27:
                  if (a3 != 2)
                  {
                    if (a3 == 1)
                    {
                      v4->__taskQueueQoSClass = 25;
                      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                      v54 = objc_claimAutoreleasedReturnValue();
                      dispatch_queue_attr_make_with_qos_class(v54, QOS_CLASS_USER_INITIATED, 0);
                      v55 = (CHRecognitionSession *)objc_claimAutoreleasedReturnValue();

                      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                      v83 = 3221225472;
                      v84 = sub_1BE83D9A0;
                      v85 = &unk_1E77F1F38;
                      v86 = v55;
                      v56 = qword_1EF568408;
                      v57 = v55;
                      v51 = v57;
                      if (v56 == -1)
                      {
                        p_super = v57;
                      }
                      else
                      {
                        dispatch_once(&qword_1EF568408, buf);
                        p_super = &v86->super;
                      }
                      objc_storeStrong(p_tasksWorkQueueForeground, (id)qword_1EF568400);
                      v58 = dispatch_queue_create("com.apple.CoreHandwriting.RecognitionSession", v51);
                      sessionQueue = v5->__sessionQueue;
                      v5->__sessionQueue = (OS_dispatch_queue *)v58;

LABEL_36:
                      goto LABEL_37;
                    }
                    if (a3)
                    {
LABEL_37:
                      *(_DWORD *)&v5->__shouldForceFastGrouping = 0;
                      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v38, v39, v40, v41, v42);
                      v60 = objc_claimAutoreleasedReturnValue();
                      recognitionOptions = v5->_recognitionOptions;
                      v5->_recognitionOptions = (NSMutableDictionary *)v60;

                      objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v62, !v5->__skipMathOperatorsInference, v63, v64, v65);
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setObject_forKeyedSubscript_(v5->_recognitionOptions, v67, (uint64_t)v66, (uint64_t)CHGroupingPostProcessingManagerOptionExplicitOperators, v68, v69);

                      objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v70, v5->__skipPopulatingStyleInventory, v71, v72, v73);
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setObject_forKeyedSubscript_(v5->_recognitionOptions, v75, (uint64_t)v74, (uint64_t)CFSTR("CHRecognitionTaskSkipPopulatingInventory"), v76, v77);

                      v78 = objc_alloc_init(CHSessionStateTracker);
                      stateTracker = v5->_stateTracker;
                      v5->_stateTracker = v78;

                      return v5;
                    }
                  }
                  p_tasksWorkQueueBackground = (id *)&v4->__tasksWorkQueueBackground;
                  p_highResponsivenessQueue = (id *)&v4->__highResponsivenessQueue;
                  v5->__taskQueueQoSClass = 21;
                  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                  v50 = objc_claimAutoreleasedReturnValue();
                  dispatch_queue_attr_make_with_qos_class(v50, QOS_CLASS_DEFAULT, -15);
                  v51 = objc_claimAutoreleasedReturnValue();

                  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                  v83 = 3221225472;
                  v84 = sub_1BE83D85C;
                  v85 = &unk_1E77F1F38;
                  v86 = v5;
                  if (qword_1EF5683F8 != -1)
                    dispatch_once(&qword_1EF5683F8, buf);
                  objc_storeStrong(p_tasksWorkQueueBackground, (id)qword_1EF5683E0);
                  objc_storeStrong(p_highResponsivenessQueue, (id)qword_1EF5683E8);
                  objc_storeStrong(p_tasksWorkQueueForeground, (id)qword_1EF5683D8);
                  v52 = dispatch_queue_create("com.apple.CoreHandwriting.RecognitionSession", v51);
                  p_super = v5->__sessionQueue;
                  v5->__sessionQueue = (OS_dispatch_queue *)v52;
                  goto LABEL_36;
                }
              }
              else
              {
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v47 = (id)qword_1EF568E18[0];
                if (!os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
                  goto LABEL_26;
              }
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BE607000, v47, OS_LOG_TYPE_FAULT, "Queue setup can only be performed once.", buf, 2u);
              goto LABEL_26;
            }
          }
          else
          {
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v45 = (id)qword_1EF568E18[0];
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
              goto LABEL_21;
          }
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE607000, v45, OS_LOG_TYPE_FAULT, "Queue setup can only be performed once.", buf, 2u);
          goto LABEL_21;
        }
      }
      else
      {
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v44 = (id)qword_1EF568E18[0];
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          goto LABEL_16;
      }
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v44, OS_LOG_TYPE_FAULT, "Queue setup can only be performed once.", buf, 2u);
      goto LABEL_16;
    }
    if (qword_1EF568E88 == -1)
    {
      v43 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v43 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
        goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v43, OS_LOG_TYPE_FAULT, "Queue setup can only be performed once.", buf, 2u);
    goto LABEL_11;
  }
  return v5;
}

- (CHRecognitionSession)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (CHRecognitionSession *)objc_msgSend_initWithMode_(self, a2, 0, v2, v3, v4);
}

- (CHRecognitionSession)initWithMode:(int64_t)a3 recognitionSessionResult:(id)a4 dataSource:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CHRecognitionSession *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CHRecognitionSession *v17;
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
  const char *v28;
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
  CHRecognitionSessionResult *cachedFastGroupingRecognitionResult;
  CHRecognitionSessionResult *partialRecognitionResult;

  v7 = a5;
  v12 = (CHRecognitionSession *)objc_msgSend_initWithMode_(self, v8, a3, v9, v10, v11);
  v17 = v12;
  if (v12)
  {
    objc_msgSend_setDataSource_(v12, v13, (uint64_t)v7, v14, v15, v16);
    objc_msgSend_strokeProviderSnapshot(v7, v18, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__setLatestStrokeProvider_(v17, v24, (uint64_t)v23, v25, v26, v27);
    if (!objc_msgSend_mode(v17, v28, v29, v30, v31, v32) || objc_msgSend_mode(v17, v33, v34, v35, v36, v37) == 2)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_calculateDocumentProviderSnapshot(v7, v38, v39, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v43 = 0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_canvasAttachmentProviderSnapshot(v7, v44, v45, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v49 = 0;
      }
      objc_msgSend__setLatestCalculateDocumentProvider_(v17, v44, (uint64_t)v43, v46, v47, v48);
      objc_msgSend__setLatestCanvasAttachmentProvider_(v17, v50, (uint64_t)v49, v51, v52, v53);
      sub_1BE83D700((uint64_t)v17);
      cachedFastGroupingRecognitionResult = v17->_cachedFastGroupingRecognitionResult;
      if (cachedFastGroupingRecognitionResult)
      {
        v17->_cachedFastGroupingRecognitionResult = 0;

      }
      partialRecognitionResult = v17->_partialRecognitionResult;
      if (partialRecognitionResult)
      {
        v17->_partialRecognitionResult = 0;

      }
    }

  }
  return v17;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_super v12;
  _QWORD v13[5];
  uint8_t buf[4];
  CHRecognitionSession *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend_count(self->__changeObserversTable, v4, v5, v6, v7, v8);
    *(_DWORD *)buf = 134218240;
    v15 = self;
    v16 = 2048;
    v17 = v9;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_DEFAULT, "Starting dealloc for session %p - number of observers = %ld", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE83DCD8;
  v13[3] = &unk_1E77F1F38;
  v13[4] = self;
  v10 = (void *)MEMORY[0x1C3B81A84](v13);
  sub_1BE83D9CC((uint64_t)self, v10);
  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v11 = (id)qword_1EF568E28;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    goto LABEL_7;
  }
  v11 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
LABEL_7:
    *(_DWORD *)buf = 134217984;
    v15 = self;
    _os_log_impl(&dword_1BE607000, v11, OS_LOG_TYPE_DEFAULT, "Ending dealloc for session %p", buf, 0xCu);
  }
LABEL_8:

  v12.receiver = self;
  v12.super_class = (Class)CHRecognitionSession;
  -[CHRecognitionSession dealloc](&v12, sel_dealloc);
}

- (void)setIdle
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E80;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_DEFAULT, "Session is idle", v9, 2u);
  }

  objc_msgSend_setIdle(self->_stateTracker, v4, v5, v6, v7, v8);
}

- (void)setActive
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E80;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_DEFAULT, "Session is active", v9, 2u);
  }

  objc_msgSend_setActive(self->_stateTracker, v4, v5, v6, v7, v8);
}

- (CHRecognitionSessionVersion)sessionVersion
{
  return self->_sessionVersion;
}

- (void)_setSessionVersion:(id)a3
{
  CHRecognitionSessionVersion *v5;
  CHRecognitionSessionVersion **p_sessionVersion;
  CHRecognitionSessionVersion *sessionVersion;
  CHRecognitionSessionVersion *v8;

  v5 = (CHRecognitionSessionVersion *)a3;
  sessionVersion = self->_sessionVersion;
  p_sessionVersion = &self->_sessionVersion;
  if (sessionVersion != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_sessionVersion, a3);
    v5 = v8;
  }

}

- (void)setPreferredLocales:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v14;
  id v15;
  CHRecognitionSession *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = sub_1BE83EA58;
  v14 = &unk_1E77F5E80;
  v5 = v4;
  v15 = v5;
  v16 = self;
  v17 = &v23;
  v18 = &v19;
  sub_1BE83D9CC((uint64_t)self, &v11);
  if (*((_BYTE *)v20 + 24))
  {
    if (*((_BYTE *)v24 + 24))
      objc_msgSend_rebuildRecognitionResults(self, v6, v7, v8, v9, v10, v11, v12, v13, v14);
    else
      objc_msgSend_setNeedsRecognitionUpdate(self, v6, v7, v8, v9, v10, v11, v12, v13, v14);
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

}

- (void)setDataSource:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  CHRecognitionSession *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE83F0E0;
  v10[3] = &unk_1E77F24F0;
  v5 = v4;
  v11 = v5;
  v12 = self;
  v13 = &v14;
  sub_1BE83D9CC((uint64_t)self, v10);
  if (*((_BYTE *)v15 + 24))
    objc_msgSend_setNeedsRecognitionUpdateImmediately_(self, v6, 1, v7, v8, v9);

  _Block_object_dispose(&v14, 8);
}

- (CHRecognitionSessionResult)lastRecognitionResult
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE83F220;
  v9 = sub_1BE83F230;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE83F238;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE83D9CC((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CHRecognitionSessionResult *)v2;
}

- (void)_setLastRecognitionResult:(id)a3
{
  CHRecognitionSessionResult *v5;
  _QWORD v6[5];

  v5 = (CHRecognitionSessionResult *)a3;
  if (self->_lastRecognitionResult != v5)
  {
    objc_storeStrong((id *)&self->_lastRecognitionResult, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1BE83F2EC;
    v6[3] = &unk_1E77F5EA8;
    v6[4] = self;
    sub_1BE83F2F8((uint64_t)self, v6);
  }

}

- (CHStrokeProvider)latestStrokeProvider
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE83F220;
  v9 = sub_1BE83F230;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE83F528;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE83D9CC((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CHStrokeProvider *)v2;
}

- (void)_setLatestStrokeProvider:(id)a3
{
  CHStrokeProvider *v5;
  CHStrokeProvider **p_latestStrokeProvider;
  CHStrokeProvider *latestStrokeProvider;
  CHStrokeProvider *v8;

  v5 = (CHStrokeProvider *)a3;
  latestStrokeProvider = self->_latestStrokeProvider;
  p_latestStrokeProvider = &self->_latestStrokeProvider;
  if (latestStrokeProvider != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_latestStrokeProvider, a3);
    v5 = v8;
  }

}

- (CHCalculateDocumentProvider)latestCalculateDocumentProvider
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE83F220;
  v9 = sub_1BE83F230;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE83F654;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE83D9CC((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CHCalculateDocumentProvider *)v2;
}

- (void)_setLatestCalculateDocumentProvider:(id)a3
{
  CHCalculateDocumentProvider *v5;
  void **p_latestCalculateDocumentProvider;
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
  uint64_t v18;
  NSObject *v19;
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
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  CHRecognitionSession *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = (CHCalculateDocumentProvider *)a3;
  p_latestCalculateDocumentProvider = (void **)&self->_latestCalculateDocumentProvider;
  if (self->_latestCalculateDocumentProvider != v5)
  {
    objc_storeStrong((id *)&self->_latestCalculateDocumentProvider, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_expressionEvaluationResults(*p_latestCalculateDocumentProvider, v7, v8, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend_count(v12, v13, v14, v15, v16, v17);

    }
    else
    {
      v18 = 0;
    }
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v19 = (id)qword_1EF568E28;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_declaredVariables(*p_latestCalculateDocumentProvider, v20, v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
      objc_msgSend_recognizedExpressions(*p_latestCalculateDocumentProvider, v32, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 134218752;
      v44 = self;
      v45 = 2048;
      v46 = v31;
      v47 = 2048;
      v48 = objc_msgSend_count(v37, v38, v39, v40, v41, v42);
      v49 = 2048;
      v50 = v18;
      _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_DEFAULT, "RecognitionSession %p received updated calculate document provider. Declared variables: %lu, Recognized expressions: %lu, Evaluation results: %lu", (uint8_t *)&v43, 0x2Au);

    }
  }

}

- (CHCanvasAttachmentProvider)latestCanvasAttachmentProvider
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE83F220;
  v9 = sub_1BE83F230;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE83F93C;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE83D9CC((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CHCanvasAttachmentProvider *)v2;
}

- (void)_setLatestCanvasAttachmentProvider:(id)a3
{
  CHCanvasAttachmentProvider *v5;
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
  int v18;
  CHRecognitionSession *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (CHCanvasAttachmentProvider *)a3;
  if (self->_latestCanvasAttachmentProvider != v5)
  {
    objc_storeStrong((id *)&self->_latestCanvasAttachmentProvider, a3);
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v6 = (id)qword_1EF568E28;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_attachments(self->_latestCanvasAttachmentProvider, v7, v8, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 134218240;
      v19 = self;
      v20 = 2048;
      v21 = objc_msgSend_count(v12, v13, v14, v15, v16, v17);
      _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEFAULT, "RecognitionSession %p received updated canvas attachment provider with %lu attachments.", (uint8_t *)&v18, 0x16u);

    }
  }

}

- (CHTextInputQuery)activeTextInputQuery
{
  return (CHTextInputQuery *)objc_loadWeakRetained((id *)&self->_activeTextInputQuery);
}

- (void)setActiveTextInputQuery:(id)a3
{
  objc_storeWeak((id *)&self->_activeTextInputQuery, a3);
}

- (int64_t)status
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE83FB68;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE83D9CC((uint64_t)self, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_setStatus:(int64_t)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_status != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_status = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = sub_1BE83FBE0;
    v4[3] = &unk_1E77F5EA8;
    v4[4] = self;
    sub_1BE83F2F8((uint64_t)self, v4);
  }
}

- (id)indexableContent
{
  CHIndexableContentQuery *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v3 = [CHIndexableContentQuery alloc];
  v8 = (void *)objc_msgSend_initWithRecognitionSession_(v3, v4, (uint64_t)self, v5, v6, v7);
  objc_msgSend_start(v8, v9, v10, v11, v12, v13);
  objc_msgSend_waitForPendingUpdates(v8, v14, v15, v16, v17, v18);
  objc_msgSend_indexableContent(v8, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)setNeedsRecognitionUpdate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_setNeedsRecognitionUpdateImmediately_(self, a2, 0, v2, v3, v4);
}

- (void)cancelOngoingRequests
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  CHRecognitionSession *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_DEFAULT, "Starting cancelOngoingRequests for session", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BE83FECC;
  v6[3] = &unk_1E77F1F38;
  v6[4] = self;
  v4 = (void *)MEMORY[0x1C3B81A84](v6);
  sub_1BE83D9CC((uint64_t)self, v4);
  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v5 = (id)qword_1EF568E28;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    goto LABEL_7;
  }
  v5 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
LABEL_7:
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEFAULT, "Ending cancelOngoingRequests for session %p", buf, 0xCu);
  }
LABEL_8:

}

- (void)rebuildRecognitionResults
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
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
  void *v31;
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
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  id v58;

  objc_msgSend_dataSource(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeProviderSnapshot(v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_mode(self, v14, v15, v16, v17, v18);
  if (v19)
  {
    if (v19 == 1)
    {
      objc_msgSend_activeTextInputQuery(self, v20, v21, v22, v23, v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textInputTargetsDataSource(v32, v33, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textInputTargets(v38, v39, v40, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend_copy(v44, v45, v46, v47, v48, v49);

      goto LABEL_8;
    }
    if (v19 != 2)
      goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_6:
    v31 = 0;
LABEL_8:
    v30 = 0;
    goto LABEL_9;
  }
  objc_msgSend_calculateDocumentProviderSnapshot(v7, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
LABEL_9:
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = sub_1BE840288;
  v54[3] = &unk_1E77F5ED0;
  v54[4] = self;
  v50 = v13;
  v55 = v50;
  v51 = v7;
  v56 = v51;
  v57 = v30;
  v58 = v31;
  v52 = v31;
  v53 = v30;
  sub_1BE83D9CC((uint64_t)self, v54);

}

- (NSData)sessionData
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE83F220;
  v9 = sub_1BE83F230;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE8428B0;
  v4[3] = &unk_1E77F2D50;
  v4[4] = &v5;
  sub_1BE83D9CC((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSData *)v2;
}

- (BOOL)loadSessionData:(id)a3 error:(id *)a4
{
  sub_1BE83D9CC((uint64_t)self, &unk_1E77F5F88);
  return 0;
}

+ (BOOL)shouldRunRecognitionLocallyWithEnvironment:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

+ (void)updateStyleInventoryWithRemovedStrokeIdentifiers:(id)a3
{
  id v4;
  CHRemoteTextSynthesizer *v5;
  void *v6;
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
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char updated;
  id v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(CHRemoteTextSynthesizer);
  v6 = (void *)MEMORY[0x1E0C99E20];
  v12 = objc_msgSend_count(v4, v7, v8, v9, v10, v11);
  objc_msgSend_setWithCapacity_(v6, v13, v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = sub_1BE842C44;
  v36[3] = &unk_1E77F4E48;
  v18 = v17;
  v37 = v18;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v19, (uint64_t)v36, v20, v21, v22);
  v35 = 0;
  updated = objc_msgSend_updateStyleInventoryWithRemovedStrokeIdentifiers_error_(v5, v23, (uint64_t)v18, (uint64_t)&v35, v24, v25);
  v27 = v35;
  if ((updated & 1) == 0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v28 = (id)qword_1EF568E28;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v27, v29, v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v39 = a1;
      v40 = 2112;
      v41 = v4;
      v42 = 2112;
      v43 = v34;
      _os_log_impl(&dword_1BE607000, v28, OS_LOG_TYPE_ERROR, "RecognitionSession %p couldn't remove strokes from the inventory with identifiers: %@. Error: %@", buf, 0x20u);

    }
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  CHRecognitionSession *v75;
  __int16 v76;
  id v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = objc_msgSend_mode(self, v5, v6, v7, v8, v9);
  objc_msgSend_encodeInteger_forKey_(v4, v11, v10, (uint64_t)CFSTR("mode"), v12, v13);
  objc_msgSend_sessionVersion(self, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, (uint64_t)CFSTR("version"), v21, v22);

  objc_msgSend_lastRecognitionResult(self, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v29, (uint64_t)v28, (uint64_t)CFSTR("lastRecognitionResult"), v30, v31);

  objc_msgSend_preferredLocales(self, v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, (uint64_t)CFSTR("preferredLocales"), v39, v40);

  v46 = objc_msgSend_recognitionEnvironment(self, v41, v42, v43, v44, v45);
  objc_msgSend_encodeInteger_forKey_(v4, v47, v46, (uint64_t)CFSTR("recognitionEnvironment"), v48, v49);
  v55 = objc_msgSend_priority(self, v50, v51, v52, v53, v54);
  objc_msgSend_encodeInteger_forKey_(v4, v56, v55, (uint64_t)CFSTR("priority"), v57, v58);
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v59 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ch_descriptionWithSeparator_filterBlock_(self->_preferredLocales, v60, (uint64_t)CFSTR(", "), (uint64_t)&unk_1E77F5FA8, v61, v62);
    v63 = (id)objc_claimAutoreleasedReturnValue();
    v74 = 134218754;
    v75 = self;
    v76 = 2112;
    v77 = v63;
    v78 = 2048;
    v79 = objc_msgSend_recognitionEnvironment(self, v64, v65, v66, v67, v68);
    v80 = 2048;
    v81 = objc_msgSend_priority(self, v69, v70, v71, v72, v73);
    _os_log_impl(&dword_1BE607000, v59, OS_LOG_TYPE_DEFAULT, "RecognitionSession %p has been serialized with preferredLocales: %@, recognitionEnvironment: %ld, priority: %ld, and lastRecognitionResult.", (uint8_t *)&v74, 0x2Au);

  }
}

- (CHRecognitionSession)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void **v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
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
  uint64_t v78;
  CHRecognitionSession *v79;
  NSObject *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  CHRecognitionSessionVersion *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int v113;
  uint64_t v114;
  __int16 v115;
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  uint64_t v120;
  _QWORD v121[3];

  v121[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("version"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isValidSessionVersion(v9, v10, v11, v12, v13, v14))
  {
    v19 = objc_msgSend_decodeIntegerForKey_(v4, v15, (uint64_t)CFSTR("mode"), v16, v17, v18);
    v20 = (void *)MEMORY[0x1E0C99E60];
    v121[0] = objc_opt_class();
    v121[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v21, (uint64_t)v121, 2, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v20, v25, (uint64_t)v24, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v29, (uint64_t)CFSTR("preferredLocales"), v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();

    v38 = objc_msgSend_decodeIntegerForKey_(v4, v34, (uint64_t)CFSTR("recognitionEnvironment"), v35, v36, v37);
    v43 = objc_msgSend_decodeIntegerForKey_(v4, v39, (uint64_t)CFSTR("priority"), v40, v41, v42);
    v47 = (void **)objc_msgSend_initWithMode_withVersion_(self, v44, v19, (uint64_t)v9, v45, v46);
    objc_msgSend_setPreferredLocales_(v47, v48, (uint64_t)v33, v49, v50, v51);
    objc_msgSend_setRecognitionEnvironment_(v47, v52, v38, v53, v54, v55);
    objc_msgSend_setPriority_(v47, v56, v43, v57, v58, v59);
    if (objc_msgSend_isValidSessionResultVersion(v47[14], v60, v61, v62, v63, v64))
    {
      v65 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v66, v65, (uint64_t)CFSTR("lastRecognitionResult"), v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__setLastRecognitionResult_(v47, v70, (uint64_t)v69, v71, v72, v73);
    }
    else
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v80 = (id)qword_1EF568E28;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        v86 = objc_msgSend_sessionResultVersion(v47[14], v81, v82, v83, v84, v85);
        v113 = 134218240;
        v114 = v86;
        v115 = 2048;
        v116 = 4;
        _os_log_impl(&dword_1BE607000, v80, OS_LOG_TYPE_DEFAULT, "Last recognition result not loaded because session result version %ld does not match the current result version %ld.", (uint8_t *)&v113, 0x16u);
      }

      v87 = [CHRecognitionSessionVersion alloc];
      v69 = (void *)objc_msgSend_initWithSessionVersion_sessionResultVersion_(v87, v88, 1, 4, v89, v90);
      objc_msgSend__setSessionVersion_(v47, v91, (uint64_t)v69, v92, v93, v94);
    }

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v95 = (id)qword_1EF568E28;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v47[21], v96, (uint64_t)CFSTR(", "), (uint64_t)&unk_1E77EFC78, v97, v98);
      v99 = (id)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend_recognitionEnvironment(v47, v100, v101, v102, v103, v104);
      v111 = objc_msgSend_priority(v47, v106, v107, v108, v109, v110);
      v113 = 134218754;
      v114 = (uint64_t)v47;
      v115 = 2112;
      v116 = (uint64_t)v99;
      v117 = 2048;
      v118 = v105;
      v119 = 2048;
      v120 = v111;
      _os_log_impl(&dword_1BE607000, v95, OS_LOG_TYPE_DEFAULT, "RecognitionSession %p has been deserialized with preferredLocales: %@, recognitionEnvironment: %ld, priority: %ld, and lastRecognitionResult.", (uint8_t *)&v113, 0x2Au);

    }
    self = v47;
    v79 = self;
  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v33 = (id)qword_1EF568E28;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v113 = 134218240;
      v114 = objc_msgSend_sessionVersion(v9, v74, v75, v76, v77, v78);
      v115 = 2048;
      v116 = 1;
      _os_log_impl(&dword_1BE607000, v33, OS_LOG_TYPE_DEFAULT, "Nil RecognitionSession has been returned because session version %ld does not match the current session version %ld.", (uint8_t *)&v113, 0x16u);
    }
    v79 = 0;
  }

  return v79;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)mode
{
  return self->_mode;
}

- (NSArray)preferredLocales
{
  return self->_preferredLocales;
}

- (CHRecognitionSessionDataSource)dataSource
{
  return self->_dataSource;
}

- (int64_t)recognitionEnvironment
{
  return self->_recognitionEnvironment;
}

- (void)setRecognitionEnvironment:(int64_t)a3
{
  self->_recognitionEnvironment = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeGroupingModel, 0);
  objc_storeStrong((id *)&self->_strokeClassificationModel, 0);
  objc_storeStrong((id *)&self->__activeTasks, 0);
  objc_storeStrong((id *)&self->__highResponsivenessQueue, 0);
  objc_storeStrong((id *)&self->__sessionQueue, 0);
  objc_storeStrong((id *)&self->__tasksWorkQueueBackground, 0);
  objc_storeStrong((id *)&self->__tasksWorkQueueForeground, 0);
  objc_storeStrong((id *)&self->__inputDrawingClients, 0);
  objc_storeStrong((id *)&self->__changeObserversTable, 0);
  objc_storeStrong((id *)&self->__lineWrapper, 0);
  objc_storeStrong((id *)&self->__textSynthesizer, 0);
  objc_storeStrong((id *)&self->__mathRecognizer, 0);
  objc_storeStrong((id *)&self->__correctionRecognizersByLocalesKey, 0);
  objc_storeStrong((id *)&self->__latestTextInputTargets, 0);
  objc_storeStrong((id *)&self->__recognizersByLocaleID, 0);
  objc_storeStrong((id *)&self->__textRecognitionLocales, 0);
  objc_storeStrong((id *)&self->_preferredLocales, 0);
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_recognitionOptions, 0);
  objc_storeStrong((id *)&self->_sessionVersion, 0);
  objc_storeStrong((id *)&self->_partialRecognitionResult, 0);
  objc_storeStrong((id *)&self->_cachedFastGroupingRecognitionResult, 0);
  objc_destroyWeak((id *)&self->_activeTextInputQuery);
  objc_storeStrong((id *)&self->_latestCanvasAttachmentProvider, 0);
  objc_storeStrong((id *)&self->_latestCalculateDocumentProvider, 0);
  objc_storeStrong((id *)&self->_latestStrokeProviderVisibleStrokes, 0);
  objc_storeStrong((id *)&self->_latestStrokeProvider, 0);
  objc_storeStrong((id *)&self->_lastRecognitionResult, 0);
}

- (BOOL)strokeGroupingOnly
{
  return self->_strokeGroupingOnly;
}

- (void)setStrokeGroupingOnly:(BOOL)a3
{
  self->_strokeGroupingOnly = a3;
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
  return *(_QWORD *)&self->_baseWritingDirection;
}

- (void)setBaseWritingDirection:(int)a3
{
  *(_QWORD *)&self->_baseWritingDirection = *(_QWORD *)&a3;
}

- (unint64_t)strokeGroupOrdering
{
  return self->_strokeGroupOrdering;
}

- (void)setStrokeGroupOrdering:(unint64_t)a3
{
  self->_strokeGroupOrdering = a3;
}

- (BOOL)disableMathTextSwapping
{
  return self->_disableMathTextSwapping;
}

- (void)setDisableMathTextSwapping:(BOOL)a3
{
  self->_disableMathTextSwapping = a3;
}

- (void)updateRecognitionOptions:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_addEntriesFromDictionary_(self->_recognitionOptions, a2, (uint64_t)a3, v3, v4, v5);
}

- (id)recognitionOptionForKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_objectForKey_(self->_recognitionOptions, a2, (uint64_t)a3, v3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)lineWrapper
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE83F220;
  v9 = sub_1BE83F230;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE843748;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE83D9CC((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (id)createRecognizerForLocale:(id)a3 sessionMode:(int64_t)a4 remote:(BOOL)a5 priority:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *RecognizerForLocales_sessionMode_remote_priority;
  _QWORD v18[2];

  v7 = a5;
  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v18[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v18, 1, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  RecognizerForLocales_sessionMode_remote_priority = (void *)objc_msgSend_createRecognizerForLocales_sessionMode_remote_priority_(a1, v15, (uint64_t)v14, a4, v7, a6);

  return RecognizerForLocales_sessionMode_remote_priority;
}

+ (id)createRecognizerForLocales:(id)a3 sessionMode:(int64_t)a4 remote:(BOOL)a5 priority:(int64_t)a6
{
  _BOOL4 v7;
  id v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  CHRecognizerOptions *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  CHRecognizer *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int64_t v117;
  void *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  void *v123;
  uint8_t buf[4];
  uint64_t v125;
  __int16 v126;
  void *v127;
  _BYTE v128[128];
  uint64_t v129;

  v7 = a5;
  v129 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (a4 == 1)
    v10 = 4;
  else
    v10 = 6;
  v118 = v9;
  v11 = (void *)objc_opt_class();
  objc_msgSend_effectiveRecognitionLocales_recognitionMode_(v11, v12, (uint64_t)v9, v10, v13, v14);
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v119, (uint64_t)v128, 16, v17);
  v117 = a6;
  if (v18)
  {
    v19 = *(_QWORD *)v120;
    v20 = 3;
    if (a4 == 1)
    {
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v120 != v19)
            objc_enumerationMutation(v15);
          v22 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i);
          v23 = (void *)objc_opt_class();
          if (objc_msgSend_shouldForceNoAlternativeRecognitionCandidates_(v23, v24, v22, v25, v26, v27))
            v20 = 1;
        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v28, (uint64_t)&v119, (uint64_t)v128, 16, v29);
      }
      while (v18);
    }
    else
    {
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v120 != v19)
            objc_enumerationMutation(v15);
          v31 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * j);
          v32 = (void *)objc_opt_class();
          objc_msgSend_shouldForceNoAlternativeRecognitionCandidates_(v32, v33, v31, v34, v35, v36);
        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v37, (uint64_t)&v119, (uint64_t)v128, 16, v38);
      }
      while (v18);
    }
  }
  else
  {
    v20 = 3;
  }

  if (v7)
  {
    v39 = (void *)objc_opt_class();
    v43 = (void *)objc_msgSend_newRemoteRecognizerWithMode_locales_(v39, v40, v10, (uint64_t)v118, v41, v42);
    objc_msgSend_setPriority_(v43, v44, v117, v45, v46, v47);
  }
  else
  {
    v53 = objc_alloc_init(CHRecognizerOptions);
    objc_msgSend_setEnableCachingIfAvailable_(v53, v54, 0, v55, v56, v57);
    objc_msgSend_setEnableGen2ModelIfAvailable_(v53, v58, 1, v59, v60, v61);
    objc_msgSend_setEnableGen2CharacterLMIfAvailable_(v53, v62, a4 == 1, v63, v64, v65);
    objc_msgSend_firstObject(v15, v66, v67, v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend_count(v15, v72, v73, v74, v75, v76) >= 2)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v77 = (id)qword_1EF568E28;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v83 = objc_msgSend_count(v15, v78, v79, v80, v81, v82);
        objc_msgSend_localeIdentifier(v71, v84, v85, v86, v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v125 = v83;
        v126 = 2112;
        v127 = v89;
        _os_log_impl(&dword_1BE607000, v77, OS_LOG_TYPE_ERROR, "Requested creating in-process recognizer with %ld locales. Only the top one will be honored: %@", buf, 0x16u);

      }
    }
    v90 = (void *)objc_opt_class();
    v123 = v71;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v91, (uint64_t)&v123, 1, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultActiveCharacterSetForLocales_(v90, v95, (uint64_t)v94, v96, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    v100 = [CHRecognizer alloc];
    v43 = (void *)objc_msgSend_initWithMode_locale_recognizerOptions_(v100, v101, v10, (uint64_t)v71, (uint64_t)v53, v102);
    objc_msgSend_objectForKeyedSubscript_(v99, v103, (uint64_t)v71, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActiveCharacterSet_(v43, v108, (uint64_t)v107, v109, v110, v111);

  }
  objc_msgSend_setMinimumDrawingSize_(v43, v48, v49, v50, v51, v52, 3.0, 3.0, v117);
  objc_msgSend_setMaxRecognitionResultCount_(v43, v112, v20, v113, v114, v115);

  return v43;
}

+ (id)createMathRecognizerRunningRemote:(BOOL)a3 priority:(int64_t)a4
{
  CHRemoteMathRecognizer *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHMathRecognizer *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  __int16 v29;

  if (a3)
  {
    v5 = [CHRemoteMathRecognizer alloc];
    v10 = (CHMathRecognizer *)objc_msgSend_initWithEnableCachingIfAvailable_(v5, v6, 1, v7, v8, v9);
    objc_msgSend_setPriority_(v10, v11, a4, v12, v13, v14);
    if (!v10)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v20 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        goto LABEL_13;
      v29 = 0;
      v21 = "Failed to initialize CHRemoteMathRecognizer";
      v22 = (uint8_t *)&v29;
LABEL_12:
      _os_log_impl(&dword_1BE607000, v20, OS_LOG_TYPE_FAULT, v21, v22, 2u);
LABEL_13:

      v10 = 0;
    }
  }
  else
  {
    v10 = objc_alloc_init(CHMathRecognizer);
    if (!v10)
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v20 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        goto LABEL_13;
      LOWORD(v28) = 0;
      v21 = "Failed to initialize CHMathRecognizer";
      v22 = (uint8_t *)&v28;
      goto LABEL_12;
    }
  }
  objc_msgSend_setMinimumDrawingSize_(v10, v15, v16, v17, v18, v19, 3.0, 3.0, v28);
  objc_msgSend_setMaxRecognitionResultCount_(v10, v23, 1, v24, v25, v26);
  return v10;
}

- (id)recognizableDrawingForStrokeGroupQueryItem:(id)a3
{
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
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSArray *textRecognitionLocales;
  NSArray *preferredLocales;
  CHRecognitionSessionResult *lastRecognitionResult;
  unsigned int taskQueueQoSClass;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CHGroupingModel *strokeGroupingModel;
  NSMutableDictionary *recognitionOptions;
  BOOL disableMathTextSwapping;
  CHStrokeClassificationModel *v43;
  const char *v44;
  void *isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_recognitionOptions_disableMathTextSwapping_partialResultBlock_wantsAutoRefine;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  NSObject *v77;
  id v78;
  uint64_t v80;
  CHRecognitionSessionTask *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  _QWORD block[4];
  id v88;
  id v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;

  v91 = 0;
  v92 = &v91;
  v93 = 0x3032000000;
  v94 = sub_1BE83F220;
  v95 = sub_1BE83F230;
  v96 = 0;
  v84 = a3;
  objc_msgSend_strokeGroupIdentifier(v84, v4, v5, v6, v7, v8);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataSource(self, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v14;
  objc_msgSend_strokeProviderSnapshot(v14, v15, v16, v17, v18, v19);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if ((self->_mode | 2) == 2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_calculateDocumentProviderSnapshot(v14, v20, v21, v22, v23, v24);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v83 = 0;
  }
  v81 = [CHRecognitionSessionTask alloc];
  v80 = objc_msgSend_mode(self, v25, v26, v27, v28, v29);
  textRecognitionLocales = self->__textRecognitionLocales;
  preferredLocales = self->_preferredLocales;
  lastRecognitionResult = self->_lastRecognitionResult;
  taskQueueQoSClass = self->__taskQueueQoSClass;
  v39 = objc_msgSend_recognitionEnvironment(self, v34, v35, v36, v37, v38);
  strokeGroupingModel = self->_strokeGroupingModel;
  recognitionOptions = self->_recognitionOptions;
  disableMathTextSwapping = self->_disableMathTextSwapping;
  v43 = self->_strokeClassificationModel;
  isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_recognitionOptions_disableMathTextSwapping_partialResultBlock_wantsAutoRefine = (void *)objc_msgSend_initWithSessionMode_locales_preferredLocales_strokeProvider_calculateDocumentProvider_inputResult_recognitionQOSClass_recognitionEnvironment_isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_recognitionOptions_disableMathTextSwapping_partialResultBlock_wantsAutoRefine_(v81, v44, v80, (uint64_t)textRecognitionLocales, (uint64_t)preferredLocales, (uint64_t)v85, v83, lastRecognitionResult, taskQueueQoSClass, v39, 0, v43, strokeGroupingModel, 0, 0, 0, recognitionOptions, disableMathTextSwapping, 0, 0);

  objc_msgSend_setDelegate_(isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_recognitionOptions_disableMathTextSwapping_partialResultBlock_wantsAutoRefine, v46, (uint64_t)self, v47, v48, v49);
  objc_msgSend_setStrokeGroupingOnly_(isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_recognitionOptions_disableMathTextSwapping_partialResultBlock_wantsAutoRefine, v50, 1, v51, v52, v53);
  objc_msgSend_setSaveInputDrawings_(isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_recognitionOptions_disableMathTextSwapping_partialResultBlock_wantsAutoRefine, v54, 1, v55, v56, v57);
  objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], v58, (uint64_t)v86, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setForceRecognitionStrokeGroupIdentifiers_(isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_recognitionOptions_disableMathTextSwapping_partialResultBlock_wantsAutoRefine, v63, (uint64_t)v62, v64, v65, v66);

  v72 = objc_msgSend_q_needsForegroundRecognition(self, v67, v68, v69, v70, v71);
  v73 = 288;
  if (v72)
    v73 = 280;
  v74 = *(Class *)((char *)&self->super.isa + v73);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE8442D0;
  block[3] = &unk_1E77F24F0;
  v88 = isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_recognitionOptions_disableMathTextSwapping_partialResultBlock_wantsAutoRefine;
  v89 = v86;
  v90 = &v91;
  v75 = v86;
  v76 = isHighResponsivenessTask_strokeClassificationModel_strokeGroupingModel_strokeGroupingRequirement_principalLineRequirement_subjectStrokeIdentifiers_recognitionOptions_disableMathTextSwapping_partialResultBlock_wantsAutoRefine;
  v77 = v74;
  dispatch_sync(v77, block);
  v78 = (id)v92[5];

  _Block_object_dispose(&v91, 8);
  return v78;
}

- (void)registerChangeObserver:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  sessionQueue = self->__sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE84465C;
  block[3] = &unk_1E77F2428;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(sessionQueue, block);

}

- (void)unregisterChangeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *sessionQueue;
  id v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v24;
  CHRecognitionSession *v25;
  id v26;
  uint8_t buf[4];
  CHRecognitionSession *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend_count(self->__changeObserversTable, v6, v7, v8, v9, v10);
    *(_DWORD *)buf = 134218240;
    v28 = self;
    v29 = 2048;
    v30 = v11;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEFAULT, "Starting unregistering an observer change on session %p (%ld observers)", buf, 0x16u);
  }

  sessionQueue = self->__sessionQueue;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = sub_1BE844894;
  v24 = &unk_1E77F2428;
  v25 = self;
  v13 = v4;
  v26 = v13;
  dispatch_sync(sessionQueue, &v21);
  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v14 = (id)qword_1EF568E28;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    goto LABEL_7;
  }
  v14 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
LABEL_7:
    v20 = objc_msgSend_count(self->__changeObserversTable, v15, v16, v17, v18, v19, v21, v22, v23, v24, v25);
    *(_DWORD *)buf = 134218240;
    v28 = self;
    v29 = 2048;
    v30 = v20;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEFAULT, "Ending unregistering an observer change on session %p (%ld observers remaining)", buf, 0x16u);
  }
LABEL_8:

}

- (id)textSynthesizer
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE83F220;
  v9 = sub_1BE83F230;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE844978;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE83D9CC((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)textSynthesizerWithLocaleFallback
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  CHRecognitionSession *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  objc_msgSend_textSynthesizer(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1BE83F220;
  v19 = sub_1BE83F230;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BE844B84;
  v11[3] = &unk_1E77F5FD0;
  v13 = self;
  v14 = &v15;
  v12 = v7;
  v8 = v7;
  sub_1BE83D9CC((uint64_t)self, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (BOOL)textSynthesizerWithLocaleFallbackIsSupported
{
  return 1;
}

- (CHRecognitionSession)initWithMode:(int64_t)a3 withVersion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CHRecognitionSession *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CHRecognitionSession *v16;

  v6 = a4;
  v11 = (CHRecognitionSession *)objc_msgSend_initWithMode_(self, v7, a3, v8, v9, v10);
  v16 = v11;
  if (v11)
    objc_msgSend__setSessionVersion_(v11, v12, (uint64_t)v6, v13, v14, v15);

  return v16;
}

- (void)setNeedsRecognitionUpdateImmediately:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
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
  uint64_t v43;
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
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[5];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  BOOL v68;

  objc_msgSend_dataSource(self, a2, a3, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeProviderSnapshot(v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_mode(self, v15, v16, v17, v18, v19);
  if (!v20)
    goto LABEL_4;
  if (v20 == 1)
  {
    objc_msgSend_activeTextInputQuery(self, v21, v22, v23, v24, v25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_textInputTargetsDataSource(v32, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_textInputTargets(v38, v39, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend_copy(v44, v45, v46, v47, v48, v49);

    v31 = 0;
LABEL_12:
    v56 = 0;
    goto LABEL_13;
  }
  if (v20 != 2)
  {
    v50 = 0;
    v31 = 0;
    goto LABEL_12;
  }
LABEL_4:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_calculateDocumentProviderSnapshot(v8, v26, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v50 = 0;
    goto LABEL_12;
  }
  objc_msgSend_canvasAttachmentProviderSnapshot(v8, v51, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
LABEL_13:
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = sub_1BE844EF4;
  v62[3] = &unk_1E77F5FF8;
  v62[4] = self;
  v57 = v14;
  v63 = v57;
  v58 = v8;
  v64 = v58;
  v65 = v31;
  v66 = v56;
  v67 = v50;
  v68 = a3;
  v59 = v50;
  v60 = v56;
  v61 = v31;
  sub_1BE83D9CC((uint64_t)self, v62);

}

- (BOOL)shouldForceFastGrouping
{
  return self->__shouldForceFastGrouping;
}

- (void)setShouldForceFastGrouping:(BOOL)a3
{
  self->__shouldForceFastGrouping = a3;
}

- (BOOL)skipMathOperatorsInference
{
  return self->__skipMathOperatorsInference;
}

- (void)setSkipMathOperatorsInference:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  self->__skipMathOperatorsInference = a3;
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, !a3, v3, v4, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_recognitionOptions, v7, (uint64_t)v10, (uint64_t)CHGroupingPostProcessingManagerOptionExplicitOperators, v8, v9);

}

- (BOOL)skipPopulatingStyleInventory
{
  return self->__skipPopulatingStyleInventory;
}

- (void)setSkipPopulatingStyleInventory:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  self->__skipPopulatingStyleInventory = a3;
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_recognitionOptions, v7, (uint64_t)v10, (uint64_t)CFSTR("CHRecognitionTaskSkipPopulatingInventory"), v8, v9);

}

- (BOOL)skipPrincipalLines
{
  return self->__skipPrincipalLines;
}

- (void)setSkipPrincipalLines:(BOOL)a3
{
  self->__skipPrincipalLines = a3;
}

+ (id)effectiveLocalesFromLocales:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  id v65;
  id obj;
  id v68;
  _QWORD v69[4];
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v65 = v3;
  v10 = objc_msgSend_count(v3, v5, v6, v7, v8, v9);
  objc_msgSend_arrayWithCapacity_(v4, v11, v10, v12, v13, v14);
  v68 = (id)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v65;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v71, (uint64_t)v75, 16, v16);
  if (v21)
  {
    v22 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v72 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        if ((objc_msgSend_isLocaleSupported_(a1, v17, (uint64_t)v24, v18, v19, v20) & 1) != 0)
        {
          objc_msgSend_languageCode(v24, v17, v25, v18, v19, v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v69[0] = MEMORY[0x1E0C809B0];
          v69[1] = 3221225472;
          v69[2] = sub_1BE8455FC;
          v69[3] = &unk_1E77F3540;
          v27 = v26;
          v70 = v27;
          v36 = objc_msgSend_indexOfObjectPassingTest_(v68, v28, (uint64_t)v69, v29, v30, v31);
          if (v36 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend_addObject_(v68, v32, (uint64_t)v24, v33, v34, v35);
          }
          else
          {
            objc_msgSend_objectAtIndexedSubscript_(v68, v32, v36, v33, v34, v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_countryCode(v37, v38, v39, v40, v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_length(v43, v44, v45, v46, v47, v48))
            {

            }
            else
            {
              objc_msgSend_countryCode(v24, v49, v50, v51, v52, v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend_length(v54, v55, v56, v57, v58, v59) == 0;

              if (!v60)
                objc_msgSend_replaceObjectAtIndex_withObject_(v68, v61, v36, (uint64_t)v24, v62, v63);
            }

          }
        }
      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v71, (uint64_t)v75, 16, v20);
    }
    while (v21);
  }

  return v68;
}

+ (double)autoRefineTriggerFactor
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
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
  float v24;
  float v25;

  v7 = 1.0;
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v2, v3, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v8, v9, (uint64_t)CFSTR("CHAutoRefineTriggerFactor"), v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v14, v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_floatForKey_(v19, v20, (uint64_t)CFSTR("CHAutoRefineTriggerFactor"), v21, v22, v23);
      v25 = v24;

      return v25;
    }
  }
  return v7;
}

- (void)waitForPendingRecognitionTasks
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  _QWORD v5[5];
  dispatch_semaphore_t v6;

  v3 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1BE8457A8;
  v5[3] = &unk_1E77F2428;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  sub_1BE83D9CC((uint64_t)self, v5);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

- (id)lastRecognitionResultWaitingForPendingTasks
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

  objc_msgSend_waitForPendingRecognitionTasks(self, a2, v2, v3, v4, v5);
  return (id)objc_msgSend_lastRecognitionResult(self, v7, v8, v9, v10, v11);
}

- (void)registerInputDrawingClient:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  sessionQueue = self->__sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE845A30;
  block[3] = &unk_1E77F24F0;
  block[4] = self;
  v6 = v4;
  v13 = v6;
  v14 = &v15;
  dispatch_sync(sessionQueue, block);
  if (*((_BYTE *)v16 + 24))
    objc_msgSend_rebuildRecognitionResults(self, v7, v8, v9, v10, v11);

  _Block_object_dispose(&v15, 8);
}

- (void)unregisterInputDrawingClient:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  sessionQueue = self->__sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE845C40;
  block[3] = &unk_1E77F24F0;
  block[4] = self;
  v6 = v4;
  v13 = v6;
  v14 = &v15;
  dispatch_sync(sessionQueue, block);
  if (*((_BYTE *)v16 + 24))
    objc_msgSend_rebuildRecognitionResults(self, v7, v8, v9, v10, v11);

  _Block_object_dispose(&v15, 8);
}

- (id)recognizerForLocale:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1BE83F220;
  v15 = sub_1BE83F230;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BE848648;
  v8[3] = &unk_1E77F23D8;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  sub_1BE83D9CC((uint64_t)self, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)textCorrectionRecognizerForLocales:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  objc_opt_self();
  objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v4, v5, (uint64_t)CFSTR("."), (uint64_t)&unk_1E77F5F68, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1BE83F220;
  v21 = sub_1BE83F230;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE848AD4;
  v13[3] = &unk_1E77F6070;
  v16 = &v17;
  v13[4] = self;
  v14 = v8;
  v9 = v4;
  v15 = v9;
  v10 = v8;
  sub_1BE83D9CC((uint64_t)self, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)mathRecognizer
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE83F220;
  v9 = sub_1BE83F230;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE848CF4;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE83D9CC((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)evaluationResultForStrokeGroupIdentifier:(int64_t)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend_expressionEvaluationResults(self->_latestCalculateDocumentProvider, v5, v6, v7, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v31, (uint64_t)v35, 16, v12);
  if (v18)
  {
    v19 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v10);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend_strokeGroupIdentifier(v21, v13, v14, v15, v16, v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend_integerValue(v22, v23, v24, v25, v26, v27) == a3;

        if (v28)
        {
          v29 = v21;
          goto LABEL_13;
        }
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v31, (uint64_t)v35, 16, v17);
      if (v18)
        continue;
      break;
    }
  }
  v29 = 0;
LABEL_13:

  return v29;
}

- (id)mathTranscriptionWithEvaluationResultForStrokeGroup:(id)a3 outStrokeIdentifiers:(id *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
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
  uint64_t v39;
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
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
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
  uint64_t v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  id v171;
  void *v173;
  void *v174;
  id v175;
  void *v176;
  id v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  _QWORD v182[4];
  id v183;
  _BYTE v184[128];
  uint64_t v185;

  v185 = *MEMORY[0x1E0C80C00];
  v177 = a3;
  objc_msgSend_lastRecognitionResult(self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_uniqueIdentifier(v177, v12, v13, v14, v15, v16);
  objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v11, v18, v17, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    v28 = 0;
    goto LABEL_8;
  }
  objc_msgSend_mathResult(v22, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
LABEL_8:
    v40 = 0;
    goto LABEL_21;
  }
  objc_msgSend_mathResult(v22, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredTranscription(v34, v35, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_strokeIdentifiers(v177, v41, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v46, v47, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_latestStrokeProvider(self, v53, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifiersForData_withStrokeProvider_(CHStrokeUtilities, v59, (uint64_t)v52, (uint64_t)v58, v60, v61);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = objc_msgSend_uniqueIdentifier(v177, v62, v63, v64, v65, v66);
  objc_msgSend_evaluationResultForStrokeGroupIdentifier_(self, v68, v67, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = v72;
  if (v72)
  {
    v78 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend_string(v72, v73, v74, v75, v76, v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend_length(v79, v80, v81, v82, v83, v84);
    objc_msgSend_arrayWithCapacity_(v78, v86, v85, v87, v88, v89);
    v173 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_string(v176, v90, v91, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_string(v176, v96, v97, v98, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend_length(v101, v102, v103, v104, v105, v106);
    v182[0] = MEMORY[0x1E0C809B0];
    v182[1] = 3221225472;
    v182[2] = sub_1BE849544;
    v182[3] = &unk_1E77F2070;
    v175 = v173;
    v183 = v175;
    objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v95, v108, 0, v107, 2, (uint64_t)v182);

    objc_msgSend_componentsJoinedByString_(v175, v109, (uint64_t)CFSTR(" "), v110, v111, v112);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasPrefix_(v40, v113, (uint64_t)CFSTR("\\begin{array}{lr}"), v114, v115, v116)
      && objc_msgSend_hasSuffix_(v40, v117, (uint64_t)CFSTR("\\hline \\end{array}"), v118, v119, v120))
    {
      v122 = objc_msgSend_length(v40, v117, v121, v118, v119, v120);
      v128 = objc_msgSend_length(CFSTR("\\end{array}"), v123, v124, v125, v126, v127);
      objc_msgSend_substringToIndex_(v40, v129, v122 - v128, v130, v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingFormat_(v133, v134, (uint64_t)CFSTR("%@ %@"), v135, v136, v137, v174, CFSTR("\\end{array}"));
      v138 = objc_claimAutoreleasedReturnValue();

      v40 = (void *)v138;
    }
    else
    {
      if (!objc_msgSend_hasSuffix_(v40, v117, (uint64_t)CFSTR("="), v118, v119, v120))
      {
LABEL_12:
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v139, v140, v141, v142, v143);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        v180 = 0u;
        v181 = 0u;
        v178 = 0u;
        v179 = 0u;
        objc_msgSend_strokes(v176, v145, v146, v147, v148, v149);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v158 = objc_msgSend_countByEnumeratingWithState_objects_count_(v150, v151, (uint64_t)&v178, (uint64_t)v184, 16, v152);
        if (v158)
        {
          v159 = *(_QWORD *)v179;
          do
          {
            v160 = 0;
            do
            {
              if (*(_QWORD *)v179 != v159)
                objc_enumerationMutation(v150);
              objc_msgSend_strokeIdentifier(*(void **)(*((_QWORD *)&v178 + 1) + 8 * v160), v153, v154, v155, v156, v157);
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v144, v162, (uint64_t)v161, v163, v164, v165);

              ++v160;
            }
            while (v158 != v160);
            v158 = objc_msgSend_countByEnumeratingWithState_objects_count_(v150, v153, (uint64_t)&v178, (uint64_t)v184, 16, v157);
          }
          while (v158);
        }

        objc_msgSend_arrayByAddingObjectsFromArray_(v28, v166, (uint64_t)v144, v167, v168, v169);
        v170 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v170;
        goto LABEL_20;
      }
      objc_msgSend_stringByAppendingFormat_(v40, v139, (uint64_t)CFSTR(" %@"), v141, v142, v143, v174);
      v133 = v40;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_12;
  }
LABEL_20:

LABEL_21:
  if (a4)
    *a4 = objc_retainAutorelease(v28);
  v171 = v40;

  return v171;
}

- (id)tokenStrokeIdentifiersForContextStrokes:(id)a3 point:(CGPoint)a4 tokenizationLevel:(int64_t)a5 completion:(id)a6 shouldCancel:(id)a7
{
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  OS_dispatch_queue *highResponsivenessQueue;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  CGFloat v34;
  CGFloat v35;
  int64_t v36;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v16, 1, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1BE849700;
  v29[3] = &unk_1E77F6098;
  v29[4] = self;
  v22 = v13;
  v30 = v22;
  v34 = x;
  v35 = y;
  v36 = a5;
  v23 = v15;
  v32 = v23;
  v24 = v20;
  v31 = v24;
  v25 = v14;
  v33 = v25;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("OnDemandGrouping"), v29);
  v26 = v33;
  v27 = v24;

  return v27;
}

- (id)reflowableTextLinesForContextStrokes:(id)a3 point:(CGPoint)a4 completion:(id)a5 shouldCancel:(id)a6
{
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  OS_dispatch_queue *highResponsivenessQueue;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  CGFloat v38;
  CGFloat v39;
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  y = a4.y;
  x = a4.x;
  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v41 = objc_msgSend_count(v11, v15, v16, v17, v18, v19);
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEFAULT, "reflowable text lines query with context strokes %ld", buf, 0xCu);
  }

  objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v20, 100, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1BE849C08;
  v33[3] = &unk_1E77F60C0;
  v33[4] = self;
  v26 = v11;
  v34 = v26;
  v38 = x;
  v39 = y;
  v27 = v13;
  v36 = v27;
  v28 = v24;
  v35 = v28;
  v29 = v12;
  v37 = v29;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("ReflowableTextLines"), v33);
  v30 = v37;
  v31 = v28;

  return v31;
}

+ (id)strokeIdentifiersInProximalGroupsForStrokeIdentifiers:(id)a3 sortedStrokeGroups:(id)a4 clusteredStrokeGroups:(id)a5 unusedStrokeIdentifiers:(id *)a6
{
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
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  id v46;
  uint64_t v47;
  id v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t m;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v90;
  id v91;
  id v92;
  id v94;
  id obj;
  void *v96;
  void *v97;
  id v98;
  id v99;
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
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v92 = a3;
  v99 = a4;
  v91 = a5;
  objc_msgSend_set(MEMORY[0x1E0C99E20], v8, v9, v10, v11, v12);
  v94 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15, v16, v17);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v18 = v92;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v104, (uint64_t)v117, 16, v20);
  if (v21)
  {
    v22 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v105 != v22)
          objc_enumerationMutation(v18);
        v24 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * i);
        v25 = (void *)objc_opt_class();
        objc_msgSend_strokeGroupContainingStrokeIdentifier_strokeGroups_(v25, v26, v24, (uint64_t)v99, v27, v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
          objc_msgSend_addObject_(v97, v29, (uint64_t)v33, v30, v31, v32);
        else
          objc_msgSend_addObject_(v94, v29, v24, v30, v31, v32);

      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v34, (uint64_t)&v104, (uint64_t)v117, 16, v35);
    }
    while (v21);
  }

  v90 = v97;
  v98 = v91;
  objc_opt_self();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v36, v37, v38, v39, v40);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v90;
  v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v112, (uint64_t)v119, 16, v42);
  if (v43)
  {
    v44 = *(_QWORD *)v113;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v113 != v44)
          objc_enumerationMutation(obj);
        v46 = v18;
        v47 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * j);
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v48 = v98;
        v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v108, (uint64_t)v118, 16, v50);
        if (v55)
        {
          v56 = *(_QWORD *)v109;
          while (2)
          {
            for (k = 0; k != v55; ++k)
            {
              if (*(_QWORD *)v109 != v56)
                objc_enumerationMutation(v48);
              v58 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * k);
              if (objc_msgSend_containsObject_(v58, v51, v47, v52, v53, v54, v90))
              {
                objc_msgSend_addObjectsFromArray_(v96, v51, (uint64_t)v58, v52, v53, v54);
                goto LABEL_26;
              }
            }
            v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v51, (uint64_t)&v108, (uint64_t)v118, 16, v54);
            if (v55)
              continue;
            break;
          }
        }
LABEL_26:

        v18 = v46;
      }
      v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v59, (uint64_t)&v112, (uint64_t)v119, 16, v60);
    }
    while (v43);
  }

  objc_msgSend_set(MEMORY[0x1E0C99E20], v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v67 = v96;
  v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v100, (uint64_t)v116, 16, v69);
  if (v75)
  {
    v76 = *(_QWORD *)v101;
    do
    {
      for (m = 0; m != v75; ++m)
      {
        if (*(_QWORD *)v101 != v76)
          objc_enumerationMutation(v67);
        objc_msgSend_strokeIdentifiers(*(void **)(*((_QWORD *)&v100 + 1) + 8 * m), v70, v71, v72, v73, v74, v90);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allObjects(v78, v79, v80, v81, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v66, v85, (uint64_t)v84, v86, v87, v88);

      }
      v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v70, (uint64_t)&v100, (uint64_t)v116, 16, v74);
    }
    while (v75);
  }

  if (a6)
    *a6 = objc_retainAutorelease(v94);

  return v66;
}

+ (id)strokeIdentifiersInFullContextForStrokeIdentifiers:(id)a3 sortedStrokeGroups:(id)a4 clusteredStrokeGroups:(id)a5 unusedStrokeIdentifiers:(id *)a6
{
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
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  id v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  const char *v57;
  uint64_t v58;
  id v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
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
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t m;
  void *v86;
  id v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t n;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  void *v113;
  id v114;
  id v115;
  id v116;
  uint64_t v117;
  id v118;
  id v119;
  id obj;
  void *v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v115 = a3;
  v122 = a4;
  v114 = a5;
  objc_msgSend_set(MEMORY[0x1E0C99E20], v8, v9, v10, v11, v12);
  v118 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  obj = v115;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v139, (uint64_t)v147, 16, v20);
  if (v21)
  {
    v22 = *(_QWORD *)v140;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v140 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * i);
        v25 = (void *)objc_opt_class();
        objc_msgSend_strokeGroupContainingStrokeIdentifier_strokeGroups_(v25, v26, v24, (uint64_t)v122, v27, v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
          objc_msgSend_addObject_(v18, v29, (uint64_t)v33, v30, v31, v32);
        else
          objc_msgSend_addObject_(v118, v29, v24, v30, v31, v32);

      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v139, (uint64_t)v147, 16, v35);
    }
    while (v21);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v36, v37, v38, v39, v40);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v119 = v114;
  v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v41, (uint64_t)&v135, (uint64_t)v146, 16, v42);
  if (v43)
  {
    v44 = *(_QWORD *)v136;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v136 != v44)
          objc_enumerationMutation(v119);
        v46 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * j);
        v131 = 0u;
        v132 = 0u;
        v133 = 0u;
        v134 = 0u;
        v47 = v18;
        v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v131, (uint64_t)v145, 16, v49);
        if (v54)
        {
          v55 = *(_QWORD *)v132;
          while (2)
          {
            for (k = 0; k != v54; ++k)
            {
              if (*(_QWORD *)v132 != v55)
                objc_enumerationMutation(v47);
              if (objc_msgSend_containsObject_(v46, v50, *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * k), v51, v52, v53))
              {
                objc_msgSend_addObject_(v121, v50, (uint64_t)v46, v51, v52, v53);
                goto LABEL_26;
              }
            }
            v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v50, (uint64_t)&v131, (uint64_t)v145, 16, v53);
            if (v54)
              continue;
            break;
          }
        }
LABEL_26:

      }
      v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v57, (uint64_t)&v135, (uint64_t)v146, 16, v58);
    }
    while (v43);
  }

  v59 = v121;
  v65 = objc_msgSend_count(v59, v60, v61, v62, v63, v64);
  v113 = v59;
  v76 = v59;
  if (v65 != objc_msgSend_count(v119, v66, v67, v68, v69, v70))
  {
    v77 = (void *)objc_opt_class();
    objc_msgSend_expandedStrokeGroupClusters_allClusters_(v77, v78, (uint64_t)v59, (uint64_t)v119, v79, v80);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_set(MEMORY[0x1E0C99E20], v71, v72, v73, v74, v75);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v116 = v76;
  v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v116, v82, (uint64_t)&v127, (uint64_t)v144, 16, v83);
  if (v84)
  {
    v117 = *(_QWORD *)v128;
    do
    {
      for (m = 0; m != v84; ++m)
      {
        if (*(_QWORD *)v128 != v117)
          objc_enumerationMutation(v116);
        v86 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * m);
        v123 = 0u;
        v124 = 0u;
        v125 = 0u;
        v126 = 0u;
        v87 = v86;
        v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v123, (uint64_t)v143, 16, v89);
        if (v95)
        {
          v96 = *(_QWORD *)v124;
          do
          {
            for (n = 0; n != v95; ++n)
            {
              if (*(_QWORD *)v124 != v96)
                objc_enumerationMutation(v87);
              objc_msgSend_strokeIdentifiers(*(void **)(*((_QWORD *)&v123 + 1) + 8 * n), v90, v91, v92, v93, v94);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_allObjects(v98, v99, v100, v101, v102, v103);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObjectsFromArray_(v81, v105, (uint64_t)v104, v106, v107, v108);

            }
            v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v90, (uint64_t)&v123, (uint64_t)v143, 16, v94);
          }
          while (v95);
        }

      }
      v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v116, v109, (uint64_t)&v127, (uint64_t)v144, 16, v110);
    }
    while (v84);
  }

  if (a6)
    *a6 = objc_retainAutorelease(v118);

  return v81;
}

- (id)contextLookupResultsAtLocation:(CGPoint)a3 completion:(id)a4 shouldCancel:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  OS_dispatch_queue *highResponsivenessQueue;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  CGFloat v27;
  CGFloat v28;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v11, 100, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1BE84CDA4;
  v23[3] = &unk_1E77F6138;
  v17 = v10;
  v25 = v17;
  v23[4] = self;
  v18 = v15;
  v24 = v18;
  v27 = x;
  v28 = y;
  v19 = v9;
  v26 = v19;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("ContextLookupAtLocation"), v23);
  v20 = v26;
  v21 = v18;

  return v21;
}

- (id)structuredContextualTextResultsWithTextResults:(id)a3
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
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  unint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
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
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  uint64_t v92;
  CHContextualTextResults *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  id v106;
  id obj;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v106 = a3;
  objc_msgSend_strokeGroupingResult(self->_lastRecognitionResult, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textStrokeGroupClusters(v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  obj = v106;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v114, (uint64_t)v119, 16, v23);
  if (v24)
  {
    v108 = *(_QWORD *)v115;
    do
    {
      v109 = v24;
      for (i = 0; i != v109; ++i)
      {
        if (*(_QWORD *)v115 != v108)
          objc_enumerationMutation(obj);
        v31 = 0;
        v32 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
        while (v31 < objc_msgSend_count(v15, v25, v26, v27, v28, v29))
        {
          objc_msgSend_objectAtIndexedSubscript_(v15, v25, v31, v27, v28, v29);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeGroup(v32, v34, v35, v36, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend_containsObject_(v33, v40, (uint64_t)v39, v41, v42, v43);

          if (v44)
          {
            objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v25, v31, v27, v28, v29);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v21, v46, (uint64_t)v45, v47, v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v50)
            {
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v51, v52, v53, v54, v55);
              v56 = objc_claimAutoreleasedReturnValue();
              objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v57, v31, v58, v59, v60);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v21, v62, v56, (uint64_t)v61, v63, v64);

              v50 = (void *)v56;
            }
            objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v51, v31, v53, v54, v55);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v21, v66, (uint64_t)v65, v67, v68, v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v70, v71, (uint64_t)v32, v72, v73, v74);

          }
          ++v31;
        }
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v114, (uint64_t)v119, 16, v29);
    }
    while (v24);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v75, v76, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  objc_msgSend_allValues(v21, v81, v82, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v86, v87, (uint64_t)&v110, (uint64_t)v118, 16, v88);
  if (v89)
  {
    v90 = *(_QWORD *)v111;
    do
    {
      for (j = 0; j != v89; ++j)
      {
        if (*(_QWORD *)v111 != v90)
          objc_enumerationMutation(v86);
        v92 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * j);
        v93 = [CHContextualTextResults alloc];
        v98 = (void *)objc_msgSend_initWithTextResults_(v93, v94, v92, v95, v96, v97);
        objc_msgSend_addObject_(v80, v99, (uint64_t)v98, v100, v101, v102);

      }
      v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v86, v103, (uint64_t)&v110, (uint64_t)v118, 16, v104);
    }
    while (v89);
  }

  return v80;
}

- (id)contextLookupResultsWithSelectedStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  OS_dispatch_queue *highResponsivenessQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  CHRecognitionSession *v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v11, 100, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1BE84EF40;
  v24[3] = &unk_1E77F61D8;
  v17 = v10;
  v28 = v17;
  v18 = v15;
  v25 = v18;
  v19 = v8;
  v26 = v19;
  v27 = self;
  v20 = v9;
  v29 = v20;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("ContextLookupWithSelectedStrokes"), v24);
  v21 = v29;
  v22 = v18;

  return v22;
}

- (id)contextLookupResultsWithSelectionPath:(CGPath *)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  OS_dispatch_queue *highResponsivenessQueue;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  CGPath *v26;

  v8 = a4;
  v9 = a5;
  objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v10, 100, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BE84F1C8;
  v22[3] = &unk_1E77F6188;
  v16 = v9;
  v24 = v16;
  v22[4] = self;
  v17 = v14;
  v23 = v17;
  v26 = a3;
  v18 = v8;
  v25 = v18;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("ContextLookupWithPath"), v22);
  v19 = v25;
  v20 = v17;

  return v20;
}

- (id)contextualTextResultsForContextStrokes:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  OS_dispatch_queue *highResponsivenessQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  CHRecognitionSession *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v11 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v11, OS_LOG_TYPE_DEFAULT, "contextualTextResultsForContextStrokes", buf, 2u);
  }

  objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v12, 100, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1BE84F9F0;
  v25[3] = &unk_1E77F61D8;
  v18 = v16;
  v26 = v18;
  v27 = self;
  v19 = v8;
  v28 = v19;
  v20 = v10;
  v29 = v20;
  v21 = v9;
  v30 = v21;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("ContextualTextResults"), v25);
  v22 = v30;
  v23 = v18;

  return v23;
}

- (id)tokenStrokeIdentifiersWithCoveringStroke:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  OS_dispatch_queue *highResponsivenessQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v11, 100, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1BE84FC54;
  v24[3] = &unk_1E77F61D8;
  v24[4] = self;
  v17 = v8;
  v25 = v17;
  v18 = v10;
  v27 = v18;
  v19 = v15;
  v26 = v19;
  v20 = v9;
  v28 = v20;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("StrokesCoveredByStroke"), v24);
  v21 = v28;
  v22 = v19;

  return v22;
}

- (id)strokePointTransformationsForContextStrokes:(id)a3 parameters:(id)a4 completionWithTelemetry:(id)a5 shouldCancel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  OS_dispatch_queue *highResponsivenessQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v14, 100, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1BE851560;
  v28[3] = &unk_1E77F62E8;
  v28[4] = self;
  v20 = v10;
  v29 = v20;
  v21 = v13;
  v32 = v21;
  v22 = v12;
  v33 = v22;
  v23 = v11;
  v30 = v23;
  v24 = v18;
  v31 = v24;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("StrokePointTransformations"), v28);
  v25 = v31;
  v26 = v24;

  return v26;
}

+ (id)alignReflowableTokens:(id)a3 resultTokens:(id)a4 strokeIdentifiers:(id)a5 outStrokeIdentifiers:(id *)a6
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
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
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  __CFString *v35;
  uint64_t i;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
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
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  CHReflowableSynthesisResultToken *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  double x;
  double y;
  double width;
  double height;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t hasPrecedingSpace;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  __CFString *v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  id v214;
  id v216;
  id v218;
  id v219;
  id obj;
  uint64_t v221;
  uint64_t v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  void *v227;
  _QWORD v228[2];
  __int128 v229;
  uint64_t v230;
  uint64_t v231;
  __int128 v232;
  uint64_t v233;
  uint64_t v234;
  __int128 v235;
  uint64_t v236;
  uint64_t v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  _BYTE v259[128];
  uint64_t v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;

  v260 = *MEMORY[0x1E0C80C00];
  v216 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13, v14);
  v218 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v15, v16, v17, v18, v19);
  v219 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v257 = 0u;
  v258 = 0u;
  v255 = 0u;
  v256 = 0u;
  obj = v216;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v255, (uint64_t)v259, 16, v27);
  if (v28)
  {
    v34 = 0;
    v227 = 0;
    v35 = &stru_1E77F6F28;
    v221 = *(_QWORD *)v256;
    do
    {
      v222 = v28;
      for (i = 0; i != v222; ++i)
      {
        if (*(_QWORD *)v256 != v221)
          objc_enumerationMutation(obj);
        v37 = *(void **)(*((_QWORD *)&v255 + 1) + 8 * i);
        if (v227)
        {
          objc_msgSend_string(v227, v29, v30, v31, v32, v33);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_hasPrecedingSpace(v37, v39, v40, v41, v42, v43))
          {
            objc_msgSend_stringByAppendingString_(v38, v44, (uint64_t)CFSTR(" "), v46, v47, v48);
            v49 = objc_claimAutoreleasedReturnValue();

            v38 = (void *)v49;
          }
          objc_msgSend_string(v37, v44, v45, v46, v47, v48, v216);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingString_(v38, v51, (uint64_t)v50, v52, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_principalLines(v227, v56, v57, v58, v59, v60);
          if (v37)
          {
            objc_msgSend_principalLines(v37, v61, v62, v63, v64, v65);
            v226 = v246;
            v225 = v244;
            v224 = v242;
            v223 = v240;
          }
          else
          {
            v245 = 0u;
            v246 = 0u;
            v223 = 0uLL;
            v243 = 0u;
            v244 = 0u;
            v224 = 0uLL;
            v241 = 0u;
            v242 = 0u;
            v225 = 0uLL;
            v226 = 0uLL;
            v239 = 0u;
            v240 = 0u;
          }
          v72 = v253;
          v73 = v254;
          v74 = v251;
          v75 = v252;
          v76 = v249;
          v77 = v250;
          v78 = v247;
          v79 = v248;
          objc_msgSend_drawing(v227, v61, v62, v63, v64, v65);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_drawing(v37, v81, v82, v83, v84, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendDrawing_(v80, v87, (uint64_t)v86, v88, v89, v90);

          v91 = [CHReflowableSynthesisResultToken alloc];
          objc_msgSend_drawing(v227, v92, v93, v94, v95, v96);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v228[0] = v78;
          v228[1] = v79;
          v229 = v223;
          v230 = v76;
          v231 = v77;
          v232 = v224;
          v233 = v74;
          v234 = v75;
          v235 = v225;
          v236 = v72;
          v237 = v73;
          v238 = v226;
          objc_msgSend_bounds(v227, v98, v99, v100, v101, v102);
          v104 = v103;
          v106 = v105;
          v108 = v107;
          v110 = v109;
          objc_msgSend_bounds(v37, v111, v112, v113, v114, v115);
          v263.origin.x = v116;
          v263.origin.y = v117;
          v263.size.width = v118;
          v263.size.height = v119;
          v261.origin.x = v104;
          v261.origin.y = v106;
          v261.size.width = v108;
          v261.size.height = v110;
          v262 = CGRectUnion(v261, v263);
          x = v262.origin.x;
          y = v262.origin.y;
          width = v262.size.width;
          height = v262.size.height;
          hasPrecedingSpace = objc_msgSend_hasPrecedingSpace(v227, v124, v125, v126, v127, v128);
          v131 = objc_msgSend_initWithDrawing_string_principalLines_bounds_hasPrecedingSpace_(v91, v130, (uint64_t)v97, (uint64_t)v55, (uint64_t)v228, hasPrecedingSpace, x, y, width, height);

          v66 = (id)v131;
        }
        else
        {
          v66 = v37;
        }
        v227 = v66;
        if (objc_msgSend_hasPrecedingSpace(v66, v67, v68, v69, v70, v71, v216))
          v137 = CFSTR(" ");
        else
          v137 = &stru_1E77F6F28;
        objc_msgSend_string(v227, v132, v133, v134, v135, v136);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v137, v139, (uint64_t)v138, v140, v141, v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        while (1)
        {

          v149 = objc_msgSend_length(v35, v144, v145, v146, v147, v148);
          if (v149 >= objc_msgSend_length(v143, v150, v151, v152, v153, v154)
            || v34 >= objc_msgSend_count(v8, v155, v156, v157, v158, v159))
          {
            break;
          }
          objc_msgSend_objectAtIndexedSubscript_(v8, v155, v34, v157, v158, v159);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_properties(v138, v160, v161, v162, v163, v164) & 0x20) != 0)
          {
            objc_msgSend_stringByAppendingString_(v35, v165, (uint64_t)CFSTR(" "), v167, v168, v169);
            v170 = objc_claimAutoreleasedReturnValue();

            v35 = (__CFString *)v170;
          }
          objc_msgSend_string(v138, v165, v166, v167, v168, v169);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingString_(v35, v172, (uint64_t)v171, v173, v174, v175);
          v176 = objc_claimAutoreleasedReturnValue();

          objc_msgSend_strokeIndexes(v138, v177, v178, v179, v180, v181);
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectsAtIndexes_(v9, v183, (uint64_t)v182, v184, v185, v186);
          v187 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_addObjectsFromArray_(v25, v188, (uint64_t)v187, v189, v190, v191);
          ++v34;
          v35 = (__CFString *)v176;
        }
        if (objc_msgSend_isEqualToString_(v35, v155, (uint64_t)v143, v157, v158, v159))
        {
          objc_msgSend_addObject_(v218, v192, (uint64_t)v227, v193, v194, v195);
          objc_msgSend_addObject_(v219, v196, (uint64_t)v25, v197, v198, v199);

          v35 = &stru_1E77F6F28;
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v200, v201, v202, v203, v204);
          v205 = objc_claimAutoreleasedReturnValue();

          v227 = 0;
          v25 = (void *)v205;
        }

      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v255, (uint64_t)v259, 16, v33);
    }
    while (v28);

    if (!v227)
    {
      v227 = 0;
      if (!a6)
        goto LABEL_32;
      goto LABEL_31;
    }
    objc_msgSend_addObject_(v218, v206, (uint64_t)v227, v207, v208, v209);
    objc_msgSend_addObject_(v219, v210, (uint64_t)v25, v211, v212, v213);
  }
  else
  {

    v227 = 0;
    v35 = &stru_1E77F6F28;
  }
  if (a6)
LABEL_31:
    *a6 = objc_retainAutorelease(v219);
LABEL_32:
  v214 = v218;

  return v214;
}

- (id)refinedTokensForSingleLineContextStrokes:(id)a3 styleControlParameter:(id)a4 transcription:(id)a5 completion:(id)a6 shouldCancel:(id)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
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
  uint64_t v42;
  OS_dispatch_queue *highResponsivenessQueue;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v53;
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v54 = a7;
  objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v15, 100, v16, v17, v18);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v19 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend_count(v55, v20, v21, v22, v23, v24);
    objc_msgSend_latestStrokeProvider(self, v26, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_orderedStrokes(v31, v32, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v64 = v25;
    v65 = 2048;
    v66 = objc_msgSend_count(v37, v38, v39, v40, v41, v42);
    _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_DEFAULT, "Session scheduling a synthesis for AutoRefine with strokes to replace = %ld, strokes in provider = %ld", buf, 0x16u);

  }
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = sub_1BE854164;
  v56[3] = &unk_1E77F62C0;
  v44 = v54;
  v61 = v44;
  v45 = v14;
  v62 = v45;
  v56[4] = self;
  v46 = v55;
  v57 = v46;
  v47 = v13;
  v58 = v47;
  v48 = v12;
  v59 = v48;
  v49 = v53;
  v60 = v49;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("RefinedTokensForSingleLineContextStroke"), v56);
  v50 = v60;
  v51 = v49;

  return v51;
}

- (id)refinedTokensForContextStrokes:(id)a3 styleControlParameter:(id)a4 completion:(id)a5 shouldCancel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  OS_dispatch_queue *highResponsivenessQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v14, 100, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1BE854B9C;
  v28[3] = &unk_1E77F62E8;
  v28[4] = self;
  v20 = v10;
  v29 = v20;
  v21 = v13;
  v32 = v21;
  v22 = v11;
  v30 = v22;
  v23 = v18;
  v31 = v23;
  v24 = v12;
  v33 = v24;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("RefinedTokensForContextStroke"), v28);
  v25 = v33;
  v26 = v23;

  return v26;
}

- (id)refinementOfContextStrokes:(id)a3 styleControlParameter:(id)a4 completion:(id)a5 shouldCancel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  OS_dispatch_queue *highResponsivenessQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v14, 100, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1BE8552D4;
  v28[3] = &unk_1E77F62E8;
  v28[4] = self;
  v20 = v10;
  v29 = v20;
  v21 = v13;
  v32 = v21;
  v22 = v11;
  v30 = v22;
  v23 = v18;
  v31 = v23;
  v24 = v12;
  v33 = v24;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("RefinementOfContextStrokes"), v28);
  v25 = v33;
  v26 = v23;

  return v26;
}

- (id)styleSampleOptionsForPoint:(CGPoint)a3 shouldCancel:(id)a4
{
  double y;
  double x;
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
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CHRecognitionSessionResult *lastRecognitionResult;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
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
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  uint64_t v66;
  void *v67;
  const char *v68;
  char isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes;
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
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  void *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  NSObject *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
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
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  NSObject *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  NSObject *v243;
  id v245;
  void *v246;
  void *v247;
  NSObject *v248;
  id v249;
  id v250;
  void *v251;
  id obj;
  id obja;
  void *v254;
  void *v255;
  CHRecognitionSession *v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  _QWORD v261[4];
  id v262;
  CHRecognitionSession *v263;
  NSObject *v264;
  double v265;
  double v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  _BYTE v271[128];
  void *v272;
  uint8_t buf[4];
  double v274;
  __int16 v275;
  double v276;
  __int16 v277;
  double v278;
  uint8_t v279[4];
  double v280;
  __int16 v281;
  double v282;
  uint64_t v283;

  y = a3.y;
  x = a3.x;
  v283 = *MEMORY[0x1E0C80C00];
  v249 = a4;
  if (!self || !self->_lastRecognitionResult)
  {
    v105 = 0;
    v112 = 0;
    goto LABEL_45;
  }
  v256 = self;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v274 = x;
    v275 = 2048;
    v276 = y;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEBUG, "Style Sampling: evaluate if stroke group near the point: x: @%f y: @%f is acceptable", buf, 0x16u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(v256->_lastRecognitionResult, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_strokeGroupOrdering(v256, v19, v20, v21, v22, v23);
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v18, v25, v24, 1, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupClosestToPoint_strokeGroups_(CHStrokeGroup, v29, (uint64_t)v28, v30, v31, v32, x, y);
  v254 = (void *)objc_claimAutoreleasedReturnValue();

  lastRecognitionResult = v256->_lastRecognitionResult;
  v39 = objc_msgSend_uniqueIdentifier(v254, v34, v35, v36, v37, v38);
  objc_msgSend_recognitionResultForStrokeGroupIdentifier_(lastRecognitionResult, v40, v39, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeClassificationResult(v256->_lastRecognitionResult, v45, v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v269 = 0u;
  v270 = 0u;
  v267 = 0u;
  v268 = 0u;
  objc_msgSend_inputStrokeIdentifiers(v44, v51, v52, v53, v54, v55);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v56, (uint64_t)&v267, (uint64_t)v279, 16, v57);
  if (v63)
  {
    v64 = *(_QWORD *)v268;
    do
    {
      for (i = 0; i != v63; ++i)
      {
        if (*(_QWORD *)v268 != v64)
          objc_enumerationMutation(obj);
        v66 = *(_QWORD *)(*((_QWORD *)&v267 + 1) + 8 * i);
        objc_msgSend_textSynthesizer(v256, v58, v59, v60, v61, v62);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes = objc_msgSend_isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes_(CHRecognitionSessionTask, v68, (uint64_t)v254, (uint64_t)v67, (uint64_t)v256->_latestStrokeProvider, (uint64_t)v44, v50, 1);

        if ((isGroupAcceptableForInventory_textSynthesizer_strokeProvider_recognitionResult_strokeClassificationResult_allowSyntheticStrokes & 1) != 0)
        {
          objc_msgSend_addObject_(v251, v70, v66, v72, v73, v74);
        }
        else
        {
          objc_msgSend_mathResult(v44, v70, v71, v72, v73, v74);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if (v80)
          {
            objc_msgSend_mathResult(v44, v75, v76, v77, v78, v79);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_topTranscription(v81, v82, v83, v84, v85, v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend_recognitionResultsByLocale(v44, v75, v76, v77, v78, v79);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_preferredLocale(v44, v88, v89, v90, v91, v92);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v81, v94, (uint64_t)v93, v95, v96, v97);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_topTranscription(v98, v99, v100, v101, v102, v103);
            v87 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v104 = (id)qword_1EF568E28;
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138740483;
            v274 = *(double *)&v87;
            v275 = 2048;
            v276 = x;
            v277 = 2048;
            v278 = y;
            _os_log_impl(&dword_1BE607000, v104, OS_LOG_TYPE_DEFAULT, "Style Sampling: stroke group with recognition result: %{sensitive}@ near the point: x: @%f y: @%f rejected since it does not pass the style inventory gating criteria", buf, 0x20u);
          }

        }
      }
      v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v58, (uint64_t)&v267, (uint64_t)v279, 16, v62);
    }
    while (v63);
  }

  v105 = v251;
  if (!v251)
  {
    v112 = 0;
    if (qword_1EF568E88 == -1)
      goto LABEL_46;
    goto LABEL_51;
  }
  sub_1BE84AA04((uint64_t)v256, v251, 0, 0, 0, 0, 0, v249);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v106;
  if (!v106 || !objc_msgSend_count(v106, v107, v108, v109, v110, v111))
  {
LABEL_45:
    if (qword_1EF568E88 == -1)
    {
LABEL_46:
      obja = v112;
      v243 = (id)qword_1EF568E28;
      if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v279 = 134218240;
        v280 = x;
        v281 = 2048;
        v282 = y;
        _os_log_impl(&dword_1BE607000, v243, OS_LOG_TYPE_DEFAULT, "Style Sampling: No style sample in surrounding context of point: x: @%f y: @%f, fallback to default style", v279, 0x16u);
      }
      v223 = 0;
      goto LABEL_49;
    }
LABEL_51:
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    goto LABEL_46;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  obja = v112;
  v113 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v279 = 134218240;
    v280 = x;
    v281 = 2048;
    v282 = y;
    _os_log_impl(&dword_1BE607000, v113, OS_LOG_TYPE_DEFAULT, "Style Sampling: Finding an input style sample from the text group in surrounding context of point: x: @%f y: @%f", v279, 0x16u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v114, v115, v116, v117, v118);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v112, v119, 0, v120, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textResult(v123, v124, v125, v126, v127, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v261[0] = MEMORY[0x1E0C809B0];
  v261[1] = 3221225472;
  v261[2] = sub_1BE8566FC;
  v261[3] = &unk_1E77F6310;
  v265 = x;
  v266 = y;
  v245 = v251;
  v262 = v245;
  v263 = v256;
  v248 = v246;
  v264 = v248;
  objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v129, v130, (uint64_t)v261, v131, v132, v133);

  objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v134, (uint64_t)CFSTR("distance"), 1, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v272 = v137;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v138, (uint64_t)&v272, 1, v139, v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingDescriptors_(v248, v142, (uint64_t)v141, v143, v144, v145);
  v247 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v146, v147, v148, v149, v150);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v259 = 0u;
  v260 = 0u;
  v257 = 0u;
  v258 = 0u;
  v250 = v247;
  v153 = objc_msgSend_countByEnumeratingWithState_objects_count_(v250, v151, (uint64_t)&v257, (uint64_t)v271, 16, v152);
  if (v153)
  {
    v154 = 0;
    v155 = *(_QWORD *)v258;
LABEL_33:
    v156 = 0;
    while (1)
    {
      if (*(_QWORD *)v258 != v155)
        objc_enumerationMutation(v250);
      v157 = *(void **)(*((_QWORD *)&v257 + 1) + 8 * v156);
      v158 = (void *)objc_opt_class();
      objc_msgSend_objectForKeyedSubscript_(v157, v159, (uint64_t)CFSTR("strokeIdentifiers"), v160, v161, v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_latestStrokeProvider(v256, v164, v165, v166, v167, v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_createDrawingForStrokeIdentifiers_strokeProvider_interpolationType_resolution_cancellationBlock_(v158, v170, (uint64_t)v163, (uint64_t)v169, 1, 2, v249);
      v171 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectForKeyedSubscript_(v157, v172, (uint64_t)CFSTR("transcription"), v173, v174, v175);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_set(MEMORY[0x1E0C99E60], v177, v178, v179, v180, v181);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sampleWithTranscription_drawing_strokeIdentifiers_(CHSynthesisStyleSample, v183, (uint64_t)v176, (uint64_t)v171, (uint64_t)v182, v184);
      v185 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectForKeyedSubscript_(v157, v186, (uint64_t)CFSTR("transcription"), v187, v188, v189);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v196 = objc_msgSend_countCharacters(v190, v191, v192, v193, v194, v195);

      objc_msgSend_addObject_(v255, v197, (uint64_t)v185, v198, v199, v200);
      v154 += v196;

      if (v154 >= 15)
        break;
      if (v153 == ++v156)
      {
        v153 = objc_msgSend_countByEnumeratingWithState_objects_count_(v250, v201, (uint64_t)&v257, (uint64_t)v271, 16, v202);
        if (v153)
          goto LABEL_33;
        break;
      }
    }
  }

  objc_msgSend_stitchStyleSamples_(CHSynthesisStyleInventory, v203, (uint64_t)v255, v204, v205, v206);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_drawing(v207, v208, v209, v210, v211, v212);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcription(v207, v214, v215, v216, v217, v218);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synthesisOptionsWithDrawing_content_(CHSynthesisRequestOptions, v220, (uint64_t)v213, (uint64_t)v219, v221, v222);
  v223 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v224 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_transcription(v207, v225, v226, v227, v228, v229);
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcription(v207, v231, v232, v233, v234, v235);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = objc_msgSend_length(v236, v237, v238, v239, v240, v241);
    *(_DWORD *)v279 = 138740227;
    v280 = *(double *)&v230;
    v281 = 2048;
    v282 = *(double *)&v242;
    _os_log_impl(&dword_1BE607000, v224, OS_LOG_TYPE_DEFAULT, "Style Sampling: Found input style sample: %{sensitive}@ from surrounding text with length: %lu", v279, 0x16u);

  }
  v105 = v245;
  v243 = v248;
LABEL_49:

  return v223;
}

- (id)synthesizeTokensForString:(id)a3 point:(CGPoint)a4 completion:(id)a5 shouldCancel:(id)a6
{
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  OS_dispatch_queue *highResponsivenessQueue;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  _QWORD v34[4];
  id v35;
  CHRecognitionSession *v36;
  id v37;
  id v38;
  id v39;
  CGFloat v40;
  CGFloat v41;

  y = a4.y;
  x = a4.x;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1E0CB38A8];
  v20 = objc_msgSend_length(v11, v15, v16, v17, v18, v19);
  objc_msgSend_progressWithTotalUnitCount_(v14, v21, v20, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1BE856A78;
  v34[3] = &unk_1E77F60C0;
  v27 = v11;
  v35 = v27;
  v36 = self;
  v40 = x;
  v41 = y;
  v28 = v13;
  v38 = v28;
  v29 = v25;
  v37 = v29;
  v30 = v12;
  v39 = v30;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("SynthesizeTokensForString"), v34);
  v31 = v39;
  v32 = v29;

  return v32;
}

- (id)synthesizeTokensForString:(id)a3 replacingStrokes:(id)a4 completion:(id)a5 shouldCancel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  OS_dispatch_queue *highResponsivenessQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x1E0CB38A8], v14, 100, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  highResponsivenessQueue = self->__highResponsivenessQueue;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1BE857754;
  v28[3] = &unk_1E77F62E8;
  v28[4] = self;
  v20 = v11;
  v29 = v20;
  v21 = v13;
  v32 = v21;
  v22 = v10;
  v30 = v22;
  v23 = v18;
  v31 = v23;
  v24 = v12;
  v33 = v24;
  sub_1BE83E4D4((uint64_t)self, highResponsivenessQueue, CFSTR("HighResponsiveness"), CFSTR("SynthesizeTokensReplacingStrokesForString"), v28);
  v25 = v33;
  v26 = v23;

  return v26;
}

- (BOOL)q_wantsAutoRefine
{
  NSHashTable *changeObserversTable;
  NSHashTable *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  if (self)
    changeObserversTable = self->__changeObserversTable;
  else
    changeObserversTable = 0;
  v3 = changeObserversTable;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v16, (uint64_t)v20, 16, v5);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend_wantsAutoRefineUpdates(v9, v10, v11, v12, v13, v14, (_QWORD)v16) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v10, (uint64_t)&v16, (uint64_t)v20, 16, v14);
    }
    while (v6);
  }
LABEL_13:

  return v6;
}

- (BOOL)q_needsForegroundRecognition
{
  NSHashTable *changeObserversTable;
  NSHashTable *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  if (self)
    changeObserversTable = self->__changeObserversTable;
  else
    changeObserversTable = 0;
  v3 = changeObserversTable;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v16, (uint64_t)v20, 16, v5);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend_needsForegroundRecognition(v9, v10, v11, v12, v13, v14, (_QWORD)v16) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v10, (uint64_t)&v16, (uint64_t)v20, 16, v14);
    }
    while (v6);
  }
LABEL_13:

  return v6;
}

@end
