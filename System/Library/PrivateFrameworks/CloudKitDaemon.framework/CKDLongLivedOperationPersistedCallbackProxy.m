@implementation CKDLongLivedOperationPersistedCallbackProxy

- (CKDLongLivedOperationPersistedCallbackProxy)initWithOperationID:(id)a3 callbackProtocol:(id)a4 completionSelector:(SEL)a5 operationInfoCache:(id)a6
{
  Protocol *v10;
  CKDOperationInfoCache *v11;
  const char *v12;
  uint64_t v13;
  NSString *v14;
  NSString *operationID;
  Protocol *callbackProtocol;
  Protocol *v17;
  CKDOperationInfoCache *operationInfoCache;

  v10 = (Protocol *)a4;
  v11 = (CKDOperationInfoCache *)a6;
  v14 = (NSString *)objc_msgSend_copy(a3, v12, v13);
  operationID = self->_operationID;
  self->_operationID = v14;

  callbackProtocol = self->_callbackProtocol;
  self->_callbackProtocol = v10;
  v17 = v10;

  operationInfoCache = self->_operationInfoCache;
  self->_completionSelector = a5;
  self->_operationInfoCache = v11;

  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  Protocol *v5;
  objc_method_description MethodDescription;
  const char *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  Protocol *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend_callbackProtocol(self, a2, (uint64_t)a3);
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  MethodDescription = protocol_getMethodDescription(v5, a3, 1, 1);

  if (MethodDescription.name)
  {
    objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], v7, (uint64_t)MethodDescription.types);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v11 = v9;
      NSStringFromSelector(a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_callbackProtocol(self, v13, v14);
      v15 = (Protocol *)objc_claimAutoreleasedReturnValue();
      NSStringFromProtocol(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v16;
      _os_log_error_impl(&dword_1BE990000, v11, OS_LOG_TYPE_ERROR, "Unexpectedly found nil for SEL %@ in protocol named %@", (uint8_t *)&v17, 0x16u);

    }
    v8 = 0;
  }
  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  _BOOL8 isEqual;
  CKDLongLivedOperationPersistedCallback *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id isCompletionCallback;

  v4 = a3;
  objc_msgSend_retainArguments(v4, v5, v6);
  objc_msgSend_callbackProtocol(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKInvokeAndNilOutReplyBlockWithError_forProtocol_(v4, v10, 0, v9);

  v13 = (const char *)objc_msgSend_selector(v4, v11, v12);
  isEqual = sel_isEqual(v13, self->_completionSelector);
  v15 = [CKDLongLivedOperationPersistedCallback alloc];
  objc_msgSend_callbackProtocol(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isCompletionCallback = (id)objc_msgSend_initWithProtocol_invocation_isCompletionCallback_(v15, v19, (uint64_t)v18, v4, isEqual);

  objc_msgSend_operationInfoCache(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_archiveCallback_forOperationID_(v22, v26, (uint64_t)isCompletionCallback, v25);

}

- (void)addBarrierBlock:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (NSString)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (Protocol)callbackProtocol
{
  return self->_callbackProtocol;
}

- (void)setCallbackProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_callbackProtocol, a3);
}

- (SEL)completionSelector
{
  return self->_completionSelector;
}

- (void)setCompletionSelector:(SEL)a3
{
  self->_completionSelector = a3;
}

- (CKDOperationInfoCache)operationInfoCache
{
  return self->_operationInfoCache;
}

- (void)setOperationInfoCache:(id)a3
{
  objc_storeStrong((id *)&self->_operationInfoCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationInfoCache, 0);
  objc_storeStrong((id *)&self->_callbackProtocol, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
}

@end
