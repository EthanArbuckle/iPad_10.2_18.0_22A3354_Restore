@implementation CKDLongLivedCallbackRelayOperation

- (BOOL)isInvalidated
{
  uint64_t v2;
  int isCancelled;
  const char *v5;
  uint64_t v6;

  isCancelled = objc_msgSend_isCancelled(self, a2, v2);
  if (isCancelled)
    LOBYTE(isCancelled) = objc_msgSend_isFinished(self, v5, v6) ^ 1;
  return isCancelled;
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (BOOL)isLongLivedCallbackRelayOperation
{
  return 1;
}

- (void)main
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  objc_msgSend_deviceContext(self, a2, v2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationInfoCache(v11, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerDelegate_forOperationWithID_(v6, v10, (uint64_t)self, v9);

}

- (void)wasUnexpectedlyUnregisteredForOperationID:(id)a3
{
  objc_msgSend_finishWithError_(self, a2, 0);
}

- (CKDLongLivedCallbackRelayOperation)operationWithID:(id)a3 receivedCallback:(id)a4
{
  const char *v5;
  uint64_t v6;
  char isCancelled;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  CKDLongLivedCallbackRelayOperation *result;
  id v21;

  v21 = a4;
  isCancelled = objc_msgSend_isCancelled(self, v5, v6);
  v9 = v21;
  if ((isCancelled & 1) == 0)
  {
    objc_msgSend_invocation(v21, (const char *)v21, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientOperationCallbackProxy(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTarget_(v10, v14, (uint64_t)v13);

    objc_msgSend_invoke(v10, v15, v16);
    if (objc_msgSend_isCompletionCallback(v21, v17, v18))
      objc_msgSend_finishWithError_(self, v19, 0);

    v9 = v21;
  }

  return result;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  objc_super v15;

  v4 = a3;
  objc_msgSend_deviceContext(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationInfoCache(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterDelegate_forOperationWithID_(v10, v14, (uint64_t)self, v13);

  v15.receiver = self;
  v15.super_class = (Class)CKDLongLivedCallbackRelayOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v15, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)cancel
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CKDLongLivedCallbackRelayOperation;
  -[CKDOperation cancel](&v17, sel_cancel);
  if (objc_msgSend_isExecuting(self, v3, v4))
  {
    v7 = (void *)MEMORY[0x1E0C94FF8];
    v8 = *MEMORY[0x1E0C94B20];
    objc_msgSend_operationID(self, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v7, v10, v8, 1, CFSTR("Operation %@ was cancelled"), v9);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_finishWithError_(self, v12, (uint64_t)v11);
LABEL_3:

    return;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v13 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v11 = v13;
    objc_msgSend_operationID(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v16;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "CallbackRelayOperation %{public}@ was cancelled before starting", buf, 0xCu);

    goto LABEL_3;
  }
}

@end
