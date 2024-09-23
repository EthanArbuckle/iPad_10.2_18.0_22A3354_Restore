@implementation CKFetchNotificationChangesOperation

- (CKFetchNotificationChangesOperation)initWithPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKFetchNotificationChangesOperation;
  return -[CKOperation init](&v4, sel_init, previousServerChangeToken);
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v4 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v9 = v4;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v11;
    _os_log_fault_impl(&dword_18A5C5000, v9, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.", buf, 0xCu);

    if (!a3)
      return 0;
    goto LABEL_5;
  }
  if (a3)
  {
LABEL_5:
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v7, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("%@ is no longer supported"), v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  objc_super v19;

  v4 = a3;
  objc_msgSend_fetchNotificationChangesCompletionBlock(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend_fetchNotificationChangesCompletionBlock(self, v9, v10, v11);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v16);

    objc_msgSend_setFetchNotificationChangesCompletionBlock_(self, v17, 0, v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)CKFetchNotificationChangesOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v19, sel__finishOnCallbackQueueWithError_, v4);

}

- (CKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken
{
  objc_setProperty_nonatomic_copy(self, a2, previousServerChangeToken, 512);
}

- (NSUInteger)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(NSUInteger)resultsLimit
{
  self->_resultsLimit = resultsLimit;
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)notificationChangedBlock
{
  return self->_notificationChangedBlock;
}

- (void)setNotificationChangedBlock:(void *)notificationChangedBlock
{
  objc_setProperty_nonatomic_copy(self, a2, notificationChangedBlock, 528);
}

- (void)fetchNotificationChangesCompletionBlock
{
  return self->_fetchNotificationChangesCompletionBlock;
}

- (void)setFetchNotificationChangesCompletionBlock:(void *)fetchNotificationChangesCompletionBlock
{
  objc_setProperty_nonatomic_copy(self, a2, fetchNotificationChangesCompletionBlock, 536);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchNotificationChangesCompletionBlock, 0);
  objc_storeStrong(&self->_notificationChangedBlock, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
}

@end
