@implementation CHQuery

- (CHQuery)init
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_FAULT, "Use the designated initializer instead", v5, 2u);
  }

  return 0;
}

- (CHQuery)initWithRecognitionSession:(id)a3
{
  id v5;
  CHQuery *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *processingQueue;
  const char *v25;
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
  double v36;
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CHQuery;
  v6 = -[CHQuery init](&v38, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v7, v10, (uint64_t)CFSTR("com.apple.CoreHandwriting.%@.Processing"), v11, v12, v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_retainAutorelease(v14);
    v21 = (const char *)objc_msgSend_UTF8String(v15, v16, v17, v18, v19, v20);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create(v21, v22);
    processingQueue = v6->_processingQueue;
    v6->_processingQueue = (OS_dispatch_queue *)v23;

    objc_storeStrong((id *)&v6->_recognitionSession, a3);
    v6->_preferredUpdatesInterval = 1.0;
    objc_msgSend_distantPast(MEMORY[0x1E0C99D68], v25, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v30, v31, v32, v33, v34, v35);
    v6->_lastProcessedTime = v36;

    v6->_isTearingDown = 0;
  }

  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CHRecognitionSession *recognitionSession;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  CHRecognitionSession *v19;
  __int16 v20;
  CHQuery *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  self->_isTearingDown = 1;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_debugName(self, v4, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    recognitionSession = self->_recognitionSession;
    *(_DWORD *)buf = 134218498;
    v17 = v9;
    v18 = 2112;
    v19 = recognitionSession;
    v20 = 2048;
    v21 = self;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_DEBUG, "Query %p {class %@} attached to session %p: dealloc", buf, 0x20u);

  }
  objc_msgSend_unregisterChangeObserver_(self->_recognitionSession, v11, (uint64_t)self, v12, v13, v14);
  v15.receiver = self;
  v15.super_class = (Class)CHQuery;
  -[CHQuery dealloc](&v15, sel_dealloc);
}

- (void)start
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  _QWORD block[5];

  if (!self->_isTearingDown)
  {
    objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE7EE848;
    block[3] = &unk_1E77F29A0;
    block[4] = self;
    dispatch_sync(v7, block);

  }
}

- (void)pause
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  _QWORD block[5];

  if (!self->_isTearingDown)
  {
    objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE7EEEB4;
    block[3] = &unk_1E77F29A0;
    block[4] = self;
    dispatch_sync(v7, block);

  }
}

- (void)waitForPendingUpdates
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
  double lastProcessedTime;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[6];

  if (!self->_isTearingDown)
  {
    objc_msgSend_recognitionSession(self, a2, v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_waitForPendingRecognitionTasks(v7, v8, v9, v10, v11, v12);

    lastProcessedTime = self->_lastProcessedTime;
    objc_msgSend_processingQueue(self, v14, v15, v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1BE7EF070;
    v20[3] = &unk_1E77F57C0;
    v20[4] = self;
    *(double *)&v20[5] = lastProcessedTime;
    dispatch_sync(v19, v20);

  }
}

- (CHQueryDelegate)delegate
{
  return (CHQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CHRecognitionSession)recognitionSession
{
  return self->_recognitionSession;
}

- (CHStrokeProviderVersion)lastProcessedStrokeProviderVersion
{
  return (CHStrokeProviderVersion *)objc_getProperty(self, a2, 56, 1);
}

- (double)preferredUpdatesInterval
{
  return self->_preferredUpdatesInterval;
}

- (void)setPreferredUpdatesInterval:(double)a3
{
  self->_preferredUpdatesInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedStrokeProviderVersion, 0);
  objc_storeStrong((id *)&self->_recognitionSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentProcessingSessionResult, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

- (void)recognitionSessionDidUpdateRecognitionResult:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double lastProcessedTime;
  NSObject *v8;
  _QWORD v9[6];

  if (!self->_isTearingDown)
  {
    lastProcessedTime = self->_lastProcessedTime;
    objc_msgSend_processingQueue(self, a2, (uint64_t)a3, v3, v4, v5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1BE7EF1C4;
    v9[3] = &unk_1E77F57C0;
    v9[4] = self;
    *(double *)&v9[5] = lastProcessedTime;
    dispatch_async(v8, v9);

  }
}

- (BOOL)wantsAutoRefineUpdates
{
  return 0;
}

- (BOOL)needsForegroundRecognition
{
  return 1;
}

- (void)q_setNeedsQueryResultUpdating
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  SEL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (!self->_isTearingDown && self->__queryActive)
  {
    objc_msgSend_strokeProviderVersion(self->_currentProcessingSessionResult, a2, v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic_copy(self, v8, v7, 56);

    MEMORY[0x1E0DE7D20](self, sel_q_updateQueryResult, v9, v10, v11, v12);
  }
}

- (void)q_queryResultDidChange
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  id WeakRetained;
  _QWORD block[5];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_isTearingDown)
  {
    if (self->__queryActive && (v3 = objc_loadWeakRetained((id *)&self->_delegate), v3, v3))
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v4 = (id)qword_1EF568E28;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_debugName(self, v5, v6, v7, v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_1BE607000, v4, OS_LOG_TYPE_DEBUG, "%@: result changed, will dispatch to main queue to notify the delegate.", buf, 0xCu);

      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BE7EF46C;
      block[3] = &unk_1E77F29A0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v11 = (id)qword_1EF568E28;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_debugName(self, v12, v13, v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->__queryActive)
          v18 = CFSTR("Y");
        else
          v18 = CFSTR("N");
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        *(_DWORD *)buf = 138412802;
        v22 = v17;
        v23 = 2112;
        v24 = v18;
        v25 = 2048;
        v26 = WeakRetained;
        _os_log_impl(&dword_1BE607000, v11, OS_LOG_TYPE_DEBUG, "%@: result changed, but cannot notify delegate. queryActive: %@, delegate %p.", buf, 0x20u);

      }
    }
  }
}

- (BOOL)q_resultWantedForCompleteness:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 1;
}

- (id)q_sessionResult
{
  return self->_currentProcessingSessionResult;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (NSString)debugName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSString *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Query %p"), v2, v3, v4, self);
}

@end
