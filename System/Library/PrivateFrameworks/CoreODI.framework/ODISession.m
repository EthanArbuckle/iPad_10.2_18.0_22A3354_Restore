@implementation ODISession

- (id)description
{
  return -[ODISessionInternal description](self->_internalSession, "description");
}

+ (void)_initLogCategories
{
  if (once != -1)
    dispatch_once(&once, &__block_literal_global);
}

void __32__ODISession__initLogCategories__block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create("com.apple.CoreODI", "ODISession");
  v1 = (void *)mlog;
  mlog = (uint64_t)v0;

  v2 = os_log_create("com.apple.CoreODI", "SessionInitialisation");
  v3 = (void *)initLog;
  initLog = (uint64_t)v2;

  v4 = os_log_create("com.apple.CoreODI", "APIInterface");
  v5 = (void *)apiLog;
  apiLog = (uint64_t)v4;

}

- (ODISession)initWithServiceIdentifier:(id)a3 forDSIDType:(unint64_t)a4 andLocationBundleIdentifier:(id)a5
{
  char *v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  ODISession *v13;
  _TtC7CoreODI29ODIPartialAssessmentInitiator *v14;
  uint64_t v15;
  NSString *availablePartialAssessment;
  uint64_t v17;
  NSString *partialAssessmentID;
  dispatch_queue_t v19;
  OS_dispatch_queue *partial_assessment_queue;
  _TtC7CoreODI18ODISessionInternal *v21;
  _TtC7CoreODI18ODISessionInternal *internalSession;
  ODISession *v23;
  NSObject *v24;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v9 = (char *)a5;
  +[ODISession _initLogCategories](ODISession, "_initLogCategories");
  v10 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v28 = "-[ODISession initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:]";
    v29 = 2112;
    v30 = (unint64_t)v8;
    v31 = 2048;
    v32 = a4;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_20A9B1000, v10, OS_LOG_TYPE_DEFAULT, "Call to %s | identifier: %@, dsidType: %lu, locationBundleID: %@", buf, 0x2Au);
  }
  v11 = initLog;
  if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v8;
    v29 = 2048;
    v30 = a4;
    _os_log_impl(&dword_20A9B1000, v11, OS_LOG_TYPE_INFO, "Initializing ODISession with identifier %@ for DSID of type %lu", buf, 0x16u);
  }
  v12 = initLog;
  if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v9;
    _os_log_impl(&dword_20A9B1000, v12, OS_LOG_TYPE_INFO, "Initializing ODISession: Location bundle identifier: %@", buf, 0xCu);
  }
  v26.receiver = self;
  v26.super_class = (Class)ODISession;
  v13 = -[ODISession init](&v26, sel_init);
  if (v13)
  {
    v14 = -[ODIPartialAssessmentInitiator initWithProviderID:]([_TtC7CoreODI29ODIPartialAssessmentInitiator alloc], "initWithProviderID:", v8);
    -[ODIPartialAssessmentInitiator makeInitialPartialAssessmentPayload](v14, "makeInitialPartialAssessmentPayload");
    v15 = objc_claimAutoreleasedReturnValue();
    availablePartialAssessment = v13->_availablePartialAssessment;
    v13->_availablePartialAssessment = (NSString *)v15;

    -[ODIPartialAssessmentInitiator makeInitialPartialAssessmentID](v14, "makeInitialPartialAssessmentID");
    v17 = objc_claimAutoreleasedReturnValue();
    partialAssessmentID = v13->_partialAssessmentID;
    v13->_partialAssessmentID = (NSString *)v17;

    v19 = dispatch_queue_create("com.apple.CoreODI.apa", 0);
    partial_assessment_queue = v13->_partial_assessment_queue;
    v13->_partial_assessment_queue = (OS_dispatch_queue *)v19;

    v21 = -[ODISessionInternal initWithServiceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:]([_TtC7CoreODI18ODISessionInternal alloc], "initWithServiceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:", v8, a4, 0, v9, v13);
    internalSession = v13->_internalSession;
    v13->_internalSession = v21;

    if (v13->_internalSession)
    {
      v23 = v13;
    }
    else
    {
      v24 = initLog;
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v28 = v8;
          v29 = 2050;
          v30 = a4;
          v31 = 2114;
          v32 = (unint64_t)v9;
          _os_log_error_impl(&dword_20A9B1000, v24, OS_LOG_TYPE_ERROR, "Internal session failed to init, returning nil. identifier: %{public}@, for DSID: %{public}lu, location bundle: %{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_FAULT))
      {
        -[ODISession initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:].cold.1();
      }
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (ODISession)initWithServiceIdentifier:(id)a3 forDSIDType:(unint64_t)a4 andLocationBundle:(id)a5
{
  char *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  ODISession *v15;
  _TtC7CoreODI29ODIPartialAssessmentInitiator *v16;
  uint64_t v17;
  NSString *availablePartialAssessment;
  uint64_t v19;
  NSString *partialAssessmentID;
  dispatch_queue_t v21;
  OS_dispatch_queue *partial_assessment_queue;
  _TtC7CoreODI18ODISessionInternal *v23;
  _TtC7CoreODI18ODISessionInternal *internalSession;
  ODISession *v25;
  NSObject *v26;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v9 = a5;
  +[ODISession _initLogCategories](ODISession, "_initLogCategories");
  v10 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v30 = "-[ODISession initWithServiceIdentifier:forDSIDType:andLocationBundle:]";
    v31 = 2112;
    v32 = (unint64_t)v8;
    v33 = 2048;
    v34 = a4;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_20A9B1000, v10, OS_LOG_TYPE_DEFAULT, "Call to %s | identifier: %@, dsidType: %lu, locationBundle: %@", buf, 0x2Au);
  }
  v11 = initLog;
  if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v8;
    v31 = 2048;
    v32 = a4;
    _os_log_impl(&dword_20A9B1000, v11, OS_LOG_TYPE_INFO, "Initializing ODISession with bundle with identifier %@ for DSID of type %lu", buf, 0x16u);
  }
  v12 = (void *)initLog;
  if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    objc_msgSend(v9, "bundleIdentifier");
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v14;
    _os_log_impl(&dword_20A9B1000, v13, OS_LOG_TYPE_INFO, "Initializing ODISession: Location bundle identifier: %@", buf, 0xCu);

  }
  v28.receiver = self;
  v28.super_class = (Class)ODISession;
  v15 = -[ODISession init](&v28, sel_init);
  if (v15)
  {
    v16 = -[ODIPartialAssessmentInitiator initWithProviderID:]([_TtC7CoreODI29ODIPartialAssessmentInitiator alloc], "initWithProviderID:", v8);
    -[ODIPartialAssessmentInitiator makeInitialPartialAssessmentPayload](v16, "makeInitialPartialAssessmentPayload");
    v17 = objc_claimAutoreleasedReturnValue();
    availablePartialAssessment = v15->_availablePartialAssessment;
    v15->_availablePartialAssessment = (NSString *)v17;

    -[ODIPartialAssessmentInitiator makeInitialPartialAssessmentID](v16, "makeInitialPartialAssessmentID");
    v19 = objc_claimAutoreleasedReturnValue();
    partialAssessmentID = v15->_partialAssessmentID;
    v15->_partialAssessmentID = (NSString *)v19;

    v21 = dispatch_queue_create("com.apple.CoreODI.apa", 0);
    partial_assessment_queue = v15->_partial_assessment_queue;
    v15->_partial_assessment_queue = (OS_dispatch_queue *)v21;

    v23 = -[ODISessionInternal initWithServiceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:]([_TtC7CoreODI18ODISessionInternal alloc], "initWithServiceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:", v8, a4, v9, 0, v15);
    internalSession = v15->_internalSession;
    v15->_internalSession = v23;

    if (v15->_internalSession)
    {
      v25 = v15;
    }
    else
    {
      v26 = initLog;
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v30 = v8;
          v31 = 2050;
          v32 = a4;
          v33 = 2114;
          v34 = (unint64_t)v9;
          _os_log_error_impl(&dword_20A9B1000, v26, OS_LOG_TYPE_ERROR, "Internal session failed to init, returning nil. identifier: %{public}@, for DSID: %{public}lu, location bundle: %{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_FAULT))
      {
        -[ODISession initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:].cold.1();
      }
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (ODISession)initWithServiceIdentifier:(id)a3 forDSIDType:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  ODISession *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[ODISession initWithServiceIdentifier:forDSIDType:]";
    v13 = 2112;
    v14 = v6;
    v15 = 2048;
    v16 = a4;
    _os_log_impl(&dword_20A9B1000, v7, OS_LOG_TYPE_DEFAULT, "Call to %s | identifier: %@, dsidType: %lu", (uint8_t *)&v11, 0x20u);
  }
  v8 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_20A9B1000, v8, OS_LOG_TYPE_INFO, "Called initWithServiceIdentifier", (uint8_t *)&v11, 2u);
  }
  v9 = -[ODISession initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:](self, "initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:", v6, a4, 0);

  return v9;
}

- (id)initForTransaction
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  ODISession *v6;
  _TtC7CoreODI29ODIPartialAssessmentInitiator *v7;
  uint64_t v8;
  NSString *availablePartialAssessment;
  uint64_t v10;
  NSString *partialAssessmentID;
  dispatch_queue_t v12;
  OS_dispatch_queue *partial_assessment_queue;
  _TtC7CoreODI18ODISessionInternal *v14;
  _TtC7CoreODI18ODISessionInternal *internalSession;
  ODISession *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[ODISession _initLogCategories](ODISession, "_initLogCategories");
  v3 = initLog;
  if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_FAULT))
    -[ODISession initForTransaction].cold.2(v3);
  v4 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[ODISession initForTransaction]";
    _os_log_impl(&dword_20A9B1000, v4, OS_LOG_TYPE_DEFAULT, "Call to %s", buf, 0xCu);
  }
  v5 = initLog;
  if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A9B1000, v5, OS_LOG_TYPE_INFO, "Initializing ODISession for transaction mode", buf, 2u);
  }
  v19.receiver = self;
  v19.super_class = (Class)ODISession;
  v6 = -[ODISession init](&v19, sel_init);
  if (v6)
  {
    v7 = -[ODIPartialAssessmentInitiator initWithProviderID:]([_TtC7CoreODI29ODIPartialAssessmentInitiator alloc], "initWithProviderID:", CFSTR("com.apple.apc.sp.tier1"));
    -[ODIPartialAssessmentInitiator makeInitialPartialAssessmentPayload](v7, "makeInitialPartialAssessmentPayload");
    v8 = objc_claimAutoreleasedReturnValue();
    availablePartialAssessment = v6->_availablePartialAssessment;
    v6->_availablePartialAssessment = (NSString *)v8;

    -[ODIPartialAssessmentInitiator makeInitialPartialAssessmentID](v7, "makeInitialPartialAssessmentID");
    v10 = objc_claimAutoreleasedReturnValue();
    partialAssessmentID = v6->_partialAssessmentID;
    v6->_partialAssessmentID = (NSString *)v10;

    v12 = dispatch_queue_create("com.apple.CoreODI.apa", 0);
    partial_assessment_queue = v6->_partial_assessment_queue;
    v6->_partial_assessment_queue = (OS_dispatch_queue *)v12;

    v14 = -[ODISessionInternal initWithServiceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:]([_TtC7CoreODI18ODISessionInternal alloc], "initWithServiceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:", CFSTR("com.apple.apc.sp.tier1"), 1, 0, 0, v6);
    internalSession = v6->_internalSession;
    v6->_internalSession = v14;

    if (v6->_internalSession)
    {
      v16 = v6;
    }
    else
    {
      v17 = initLog;
      if (os_log_type_enabled((os_log_t)initLog, OS_LOG_TYPE_ERROR))
        -[ODISession initForTransaction].cold.1(v17);
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)availablePartialAssessment
{
  NSObject *v3;
  ODISession *v4;
  NSString *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ODISession availablePartialAssessment]";
    _os_log_impl(&dword_20A9B1000, v3, OS_LOG_TYPE_DEFAULT, "Call to %s", (uint8_t *)&v7, 0xCu);
  }
  v4 = self;
  objc_sync_enter(v4);
  -[ODISessionInternal provideFeedbackOnPartialAssessmentID:](v4->_internalSession, "provideFeedbackOnPartialAssessmentID:", v4->_partialAssessmentID);
  v5 = v4->_availablePartialAssessment;
  objc_sync_exit(v4);

  return v5;
}

- (void)setAvailablePartialAssessment:(id)a3
{
  ODISession *v4;
  uint64_t v5;
  NSString *availablePartialAssessment;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  availablePartialAssessment = v4->_availablePartialAssessment;
  v4->_availablePartialAssessment = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)updateWithAdditionalAttributes:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[ODISession updateWithAdditionalAttributes:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_20A9B1000, v5, OS_LOG_TYPE_DEFAULT, "Call to %s | attributes: %@", (uint8_t *)&v11, 0x16u);
  }
  v6 = (void *)mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend(v4, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_20A9B1000, v7, OS_LOG_TYPE_INFO, "Updating with attributes - Keys: %@", (uint8_t *)&v11, 0xCu);

  }
  -[ODISessionInternal updateWithAdditionalAttributes:](self->_internalSession, "updateWithAdditionalAttributes:", v4);
  v10 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_20A9B1000, v10, OS_LOG_TYPE_INFO, "Update with attribute completed", (uint8_t *)&v11, 2u);
  }

}

- (void)getAssessment:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ODISession getAssessment:]";
    _os_log_impl(&dword_20A9B1000, v5, OS_LOG_TYPE_DEFAULT, "Call to %s", (uint8_t *)&v8, 0xCu);
  }
  v6 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_20A9B1000, v6, OS_LOG_TYPE_INFO, "Called getAssessment", (uint8_t *)&v8, 2u);
  }
  -[ODISessionInternal getAssessment:](self->_internalSession, "getAssessment:", v4);
  v7 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_20A9B1000, v7, OS_LOG_TYPE_INFO, "GetAssessment completed", (uint8_t *)&v8, 2u);
  }

}

- (void)getAssessmentForTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ODISession getAssessmentForTransaction:]";
    _os_log_impl(&dword_20A9B1000, v5, OS_LOG_TYPE_DEFAULT, "Call to %s", (uint8_t *)&v8, 0xCu);
  }
  v6 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_20A9B1000, v6, OS_LOG_TYPE_INFO, "Called getAssessmentForTransaction", (uint8_t *)&v8, 2u);
  }
  -[ODISessionInternal getAssessment:](self->_internalSession, "getAssessment:", v4);
  v7 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_20A9B1000, v7, OS_LOG_TYPE_INFO, "GetAssessmentForTransaction completed", (uint8_t *)&v8, 2u);
  }

}

- (void)provideFeedbackOnPayloadOutcome:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[ODISession provideFeedbackOnPayloadOutcome:]";
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_20A9B1000, v5, OS_LOG_TYPE_DEFAULT, "Call to %s | outcomeType: %lu", (uint8_t *)&v8, 0x16u);
  }
  v6 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_20A9B1000, v6, OS_LOG_TYPE_INFO, "Called provideFeedbackOnPayloadOutcome", (uint8_t *)&v8, 2u);
  }
  -[ODISessionInternal provideFeedbackOnPayloadOutcome:](self->_internalSession, "provideFeedbackOnPayloadOutcome:", a3);
  v7 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_20A9B1000, v7, OS_LOG_TYPE_INFO, "provideFeedbackOnPayloadOutcome completed", (uint8_t *)&v8, 2u);
  }
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = apiLog;
  if (os_log_type_enabled((os_log_t)apiLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ODISession dealloc]";
    _os_log_impl(&dword_20A9B1000, v3, OS_LOG_TYPE_DEFAULT, "Call to %s", buf, 0xCu);
  }
  v4 = mlog;
  if (os_log_type_enabled((os_log_t)mlog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A9B1000, v4, OS_LOG_TYPE_INFO, "ODISession dealloc", buf, 2u);
  }
  -[ODISessionInternal validateForDeinit](self->_internalSession, "validateForDeinit");
  v5.receiver = self;
  v5.super_class = (Class)ODISession;
  -[ODISession dealloc](&v5, sel_dealloc);
}

- (void)didChangeStateWith:(id)a3 assessmentID:(id)a4
{
  id v6;
  id v7;
  NSObject *partial_assessment_queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  partial_assessment_queue = self->_partial_assessment_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ODISession_didChangeStateWith_assessmentID___block_invoke;
  block[3] = &unk_24C355230;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(partial_assessment_queue, block);

}

uint64_t __46__ODISession_didChangeStateWith_assessmentID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAvailablePartialAssessment:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setPartialAssessmentID:", *(_QWORD *)(a1 + 48));
}

- (_TtC7CoreODI18ODISessionInternal)internalSession
{
  return self->_internalSession;
}

- (NSString)partialAssessmentID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPartialAssessmentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)partial_assessment_queue
{
  return self->_partial_assessment_queue;
}

- (void)setPartial_assessment_queue:(id)a3
{
  objc_storeStrong((id *)&self->_partial_assessment_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partial_assessment_queue, 0);
  objc_storeStrong((id *)&self->_partialAssessmentID, 0);
  objc_storeStrong((id *)&self->_internalSession, 0);
  objc_storeStrong((id *)&self->_availablePartialAssessment, 0);
}

- (void)initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_20A9B1000, v0, v1, "Tried to init session with NULL identifier, returning nil. identifier: %{public}@, for DSID: %{public}lu, location bundle: %{public}@");
}

- (void)initForTransaction
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20A9B1000, log, OS_LOG_TYPE_FAULT, "initForTransaction is deprecated", v1, 2u);
}

@end
