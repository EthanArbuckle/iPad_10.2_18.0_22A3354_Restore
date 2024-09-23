@implementation SmsFilterTrialModelManager

- (SmsFilterTrialModelManager)init
{
  SmsFilterTrialModelManager *v2;
  SmsFilterTrialModelManager *v3;
  id v4;
  uint64_t v5;
  OS_os_log *log;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SmsFilterTrialModelManager;
  v2 = -[SmsFilterTrialModelManager init](&v13, "init");
  if (!v2)
    -[SmsFilterTrialModelManager init].cold.1();
  v3 = v2;
  v4 = trialLogHandle();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  log = v3->_log;
  v3->_log = (OS_os_log *)v5;

  v3->_newModelUpdateAvailable = 0;
  __asm { FMOV            V0.2D, #0.5 }
  *(_OWORD *)&v3->_thresholdTrans = _Q0;
  v3->_transitionTimer = 1440;
  return v3;
}

- (void)initializeWithNamespace:(unsigned int)a3
{
  uint64_t v3;
  SmsFilterTrialManager *v5;
  SmsFilterTrialManager *trialManager;
  SmsFilterTrialManager *v7;
  void *v8;
  void *v9;
  id v10;
  OS_os_log *log;
  _QWORD v12[4];
  id v13;
  uint8_t buf[8];
  id location;

  v3 = *(_QWORD *)&a3;
  objc_initWeak(&location, self);
  v5 = -[SmsFilterTrialManager initWithDefaultsDomain:]([SmsFilterTrialManager alloc], "initWithDefaultsDomain:", v3);
  trialManager = self->_trialManager;
  self->_trialManager = v5;

  v7 = self->_trialManager;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager trialClient](v7, "trialClient"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager trialNamespaceName](self->_trialManager, "trialNamespaceName"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __54__SmsFilterTrialModelManager_initializeWithNamespace___block_invoke;
    v12[3] = &unk_1000207E0;
    objc_copyWeak(&v13, &location);
    v10 = objc_msgSend(v8, "addUpdateHandlerForNamespaceName:usingBlock:", v9, v12);

    objc_destroyWeak(&v13);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "_trialManager is nil", buf, 2u);
    }
  }
  objc_destroyWeak(&location);
}

void __54__SmsFilterTrialModelManager_initializeWithNamespace___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    v5 = objc_loadWeakRetained(&to);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trialManager"));
    objc_msgSend(v6, "loadTrialUpdates");

    v7 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "prepareForTrialParamsUpdate");

    v8 = objc_loadWeakRetained(&to);
    objc_msgSend(v8, "setNewModelUpdateAvailable:", 1);

  }
  objc_destroyWeak(&to);

}

- (MLModel)mainModel
{
  os_unfair_lock_s *p_loadModelLock;
  MLModel *v4;
  MLModel *mainModel;
  OS_os_log *log;
  uint8_t v8[16];

  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  if (!self->_mainModel)
  {
    v4 = (MLModel *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager loadTrialMainModelByDeletingExistingModel:](self->_trialManager, "loadTrialMainModelByDeletingExistingModel:", 1));
    mainModel = self->_mainModel;
    self->_mainModel = v4;

    if (!self->_mainModel)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Trial main model Not found!", v8, 2u);
      }
    }
  }
  os_unfair_lock_unlock(p_loadModelLock);
  return self->_mainModel;
}

- (MLModel)basicModel
{
  os_unfair_lock_s *p_loadModelLock;
  MLModel *v4;
  MLModel *basicModel;
  OS_os_log *log;
  uint8_t v8[16];

  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  if (!self->_basicModel)
  {
    v4 = (MLModel *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager loadTrialBasicModelByDeletingExistingModel:](self->_trialManager, "loadTrialBasicModelByDeletingExistingModel:", 1));
    basicModel = self->_basicModel;
    self->_basicModel = v4;

    if (!self->_basicModel)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Trial basic model Not found!", v8, 2u);
      }
    }
  }
  os_unfair_lock_unlock(p_loadModelLock);
  return self->_basicModel;
}

- (MLModel)subClassificationModel
{
  os_unfair_lock_s *p_loadModelLock;
  MLModel *v4;
  MLModel *subClassificationModel;
  OS_os_log *log;
  uint8_t v8[16];

  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  if (!self->_subClassificationModel)
  {
    v4 = (MLModel *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager loadTrialSubClassificationModelByDeletingExistingModel:](self->_trialManager, "loadTrialSubClassificationModelByDeletingExistingModel:", 1));
    subClassificationModel = self->_subClassificationModel;
    self->_subClassificationModel = v4;

    if (!self->_subClassificationModel)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Trial sub-classification model Not found!", v8, 2u);
      }
    }
  }
  os_unfair_lock_unlock(p_loadModelLock);
  return self->_subClassificationModel;
}

- (id)getLocalModel:(id)a3
{
  return -[SmsFilterTrialManager loadTrialModelByDeletingExistingModel:](self->_trialManager, "loadTrialModelByDeletingExistingModel:", a3);
}

- (void)prepareForTrialParamsUpdate
{
  os_unfair_lock_s *p_loadModelLock;
  MLModel *mainModel;
  MLModel *basicModel;
  MLModel *subClassificationModel;
  NSString *regexFilePath;

  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  mainModel = self->_mainModel;
  self->_mainModel = 0;

  basicModel = self->_basicModel;
  self->_basicModel = 0;

  subClassificationModel = self->_subClassificationModel;
  self->_subClassificationModel = 0;

  regexFilePath = self->_regexFilePath;
  self->_regexFilePath = 0;

  os_unfair_lock_unlock(p_loadModelLock);
}

- (id)getRegexFilePath
{
  void *v3;
  OS_os_log *log;
  int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SmsFilterTrialManager getRegexFileNameWithPath](self->_trialManager, "getRegexFileNameWithPath"));
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "regex filepath: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

- (double)loadTransactionalThreshold
{
  double v3;
  double v4;
  OS_os_log *log;
  int v8;
  uint64_t v9;

  if (!self->_mainModel)
    return self->_thresholdTrans;
  -[SmsFilterTrialManager loadTrialTransThreshold](self->_trialManager, "loadTrialTransThreshold");
  v4 = v3;
  if (v3 <= 0.0 || v3 >= 1.0)
  {
    log = self->_log;
    v4 = 0.5;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = 0x3FE0000000000000;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load trial threshold. Falling back to default %lf", (uint8_t *)&v8, 0xCu);
    }
  }
  return v4;
}

- (double)loadPromotionalThreshold
{
  double v3;
  double v4;
  OS_os_log *log;
  int v8;
  uint64_t v9;

  if (!self->_mainModel)
    return self->_thresholdPromo;
  -[SmsFilterTrialManager loadTrialPromoThreshold](self->_trialManager, "loadTrialPromoThreshold");
  v4 = v3;
  if (v3 <= 0.0 || v3 >= 1.0)
  {
    log = self->_log;
    v4 = 0.5;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = 0x3FE0000000000000;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load trial threshold. Falling back to default %lf", (uint8_t *)&v8, 0xCu);
    }
  }
  return v4;
}

- (int64_t)loadTransitionTimer
{
  int64_t v3;
  OS_os_log *log;
  int v6;
  uint64_t v7;

  v3 = -[SmsFilterTrialManager loadTrialModelTransitionTimer](self->_trialManager, "loadTrialModelTransitionTimer");
  if (v3 <= 0)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v3 = 1440;
      v7 = 1440;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load trial transition timer value. Falling back to default %ld", (uint8_t *)&v6, 0xCu);
    }
    else
    {
      return 1440;
    }
  }
  return v3;
}

- (BOOL)updateAvailable
{
  _BOOL4 newModelUpdateAvailable;

  newModelUpdateAvailable = self->_newModelUpdateAvailable;
  if (self->_newModelUpdateAvailable)
    self->_newModelUpdateAvailable = 0;
  return newModelUpdateAvailable;
}

- (SmsFilterTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
  objc_storeStrong((id *)&self->_trialManager, a3);
}

- (os_unfair_lock_s)loadModelLock
{
  return self->_loadModelLock;
}

- (void)setLoadModelLock:(os_unfair_lock_s)a3
{
  self->_loadModelLock = a3;
}

- (NSString)regexFilePath
{
  return self->_regexFilePath;
}

- (void)setRegexFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_regexFilePath, a3);
}

- (double)thresholdTrans
{
  return self->_thresholdTrans;
}

- (void)setThresholdTrans:(double)a3
{
  self->_thresholdTrans = a3;
}

- (double)thresholdPromo
{
  return self->_thresholdPromo;
}

- (void)setThresholdPromo:(double)a3
{
  self->_thresholdPromo = a3;
}

- (int64_t)transitionTimer
{
  return self->_transitionTimer;
}

- (void)setTransitionTimer:(int64_t)a3
{
  self->_transitionTimer = a3;
}

- (BOOL)newModelUpdateAvailable
{
  return self->_newModelUpdateAvailable;
}

- (void)setNewModelUpdateAvailable:(BOOL)a3
{
  self->_newModelUpdateAvailable = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_regexFilePath, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_subClassificationModel, 0);
  objc_storeStrong((id *)&self->_basicModel, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
}

- (void)init
{
  __assert_rtn("-[SmsFilterTrialModelManager init]", "SFETrialModelManager.m", 48, "self");
}

@end
