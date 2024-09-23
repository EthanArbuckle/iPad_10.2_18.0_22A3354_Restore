@implementation NSFilePresenterManagedProxy

- (void)setFilePresenterResponses:(unint64_t)a3
{
  self->_filePresenterResponses = a3;
}

- (NSFilePresenterManagedProxy)initWithXPCProxy:(id)a3
{
  NSFilePresenterManagedProxy *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSFilePresenterManagedProxy;
  v4 = -[NSFilePresenterManagedProxy init](&v6, sel_init);
  if (v4)
  {
    v4->_xpcProxy = (NSFilePresenterXPCInterface *)a3;
    v4->_nonboostingXPCProxy = (NSFilePresenterXPCInterface *)(id)objc_msgSend(a3, "_unboostingRemoteObjectProxy");
  }
  return v4;
}

- (void)setProcessManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)_presenterRespondsToSelector:(SEL)a3
{
  void *v6;
  uint64_t v7;

  if (qword_1ECD09128 != -1)
    dispatch_once(&qword_1ECD09128, &__block_literal_global_293_1);
  v6 = (void *)objc_msgSend((id)_MergedGlobals_3_0, "objectForKey:", NSStringFromSelector(a3));
  if (!v6)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileReactorProxy.m"), 1272, CFSTR("Unexpected message in -[_NSFilePresenterManagedProxy _remoteObjectRespondsToMessage:]: %@"), NSStringFromSelector(a3));
  v7 = objc_msgSend(v6, "unsignedLongLongValue");
  return !v7 || (self->_filePresenterResponses & v7) != 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFilePresenterManagedProxy;
  -[NSFilePresenterManagedProxy dealloc](&v3, sel_dealloc);
}

- (void)_safelySendMessageWithSelector:(SEL)a3 withErrorCompletionHandler:(id)a4 sender:(id)a5
{
  NSFileAccessProcessManager *processManager;
  NSFilePresenterXPCInterface *xpcProxy;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  if (-[NSFilePresenterManagedProxy _presenterRespondsToSelector:](self, "_presenterRespondsToSelector:", a3))
  {
    if (a4 && (processManager = self->_processManager) != 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke;
      v12[3] = &unk_1E0F54A08;
      v12[4] = self;
      v12[5] = a5;
      v12[6] = a4;
      -[NSFileAccessProcessManager safelySendMessageWithReplyUsingBlock:](processManager, "safelySendMessageWithReplyUsingBlock:", v12);
    }
    else
    {
      xpcProxy = self->_xpcProxy;
      if (self->_errorHandler)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_4;
        v11[3] = &unk_1E0F4E178;
        v11[4] = self;
        xpcProxy = (NSFilePresenterXPCInterface *)-[NSFilePresenterXPCInterface remoteObjectProxyWithErrorHandler:](xpcProxy, "remoteObjectProxyWithErrorHandler:", v11);
      }
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_5;
      v10[3] = &unk_1E0F4E088;
      v10[4] = a4;
      (*((void (**)(id, NSFilePresenterXPCInterface *, _QWORD *))a5 + 2))(a5, xpcProxy, v10);
    }
  }
  else if (a4)
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

uint64_t __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_2;
  v6[3] = &unk_1E0F54940;
  v6[4] = v3;
  v6[5] = a2;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __96__NSFilePresenterManagedProxy__safelySendMessageWithSelector_withErrorCompletionHandler_sender___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)relinquishToReadingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 completionHandler:(id)a6
{
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__NSFilePresenterManagedProxy_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke;
  v6[3] = &unk_1E0F54A30;
  v6[5] = a5;
  v6[6] = a4;
  v6[4] = a3;
  -[NSFilePresenterManagedProxy _safelySendMessageWithSelector:withErrorCompletionHandler:sender:](self, "_safelySendMessageWithSelector:withErrorCompletionHandler:sender:", a2, a6, v6);
}

uint64_t __98__NSFilePresenterManagedProxy_relinquishToReadingClaimWithID_options_purposeID_completionHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "relinquishToReadingClaimWithID:options:purposeID:completionHandler:", a1[4], a1[6], a1[5], a3);
}

- (void)relinquishToWritingClaimWithID:(id)a3 options:(unint64_t)a4 purposeID:(id)a5 subitemURL:(id)a6 completionHandler:(id)a7
{
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __109__NSFilePresenterManagedProxy_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke;
  v7[3] = &unk_1E0F54A58;
  v7[4] = a3;
  v7[5] = a5;
  v7[6] = a6;
  v7[7] = a4;
  -[NSFilePresenterManagedProxy _safelySendMessageWithSelector:withErrorCompletionHandler:sender:](self, "_safelySendMessageWithSelector:withErrorCompletionHandler:sender:", a2, a7, v7);
}

uint64_t __109__NSFilePresenterManagedProxy_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "relinquishToWritingClaimWithID:options:purposeID:subitemURL:completionHandler:", a1[4], a1[7], a1[5], a1[6], a3);
}

- (void)reacquireFromWritingClaimForID:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __80__NSFilePresenterManagedProxy_reacquireFromWritingClaimForID_completionHandler___block_invoke;
    v5[3] = &unk_1E0F4E088;
    v5[4] = a4;
    a4 = v5;
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__NSFilePresenterManagedProxy_reacquireFromWritingClaimForID_completionHandler___block_invoke_2;
  v4[3] = &unk_1E0F54A80;
  v4[4] = a3;
  -[NSFilePresenterManagedProxy _safelySendMessageWithSelector:withErrorCompletionHandler:sender:](self, "_safelySendMessageWithSelector:withErrorCompletionHandler:sender:", a2, a4, v4);
}

uint64_t __80__NSFilePresenterManagedProxy_reacquireFromWritingClaimForID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__NSFilePresenterManagedProxy_reacquireFromWritingClaimForID_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__NSFilePresenterManagedProxy_reacquireFromWritingClaimForID_completionHandler___block_invoke_3;
  v5[3] = &unk_1E0F4E870;
  v5[4] = a3;
  return objc_msgSend(a2, "reacquireFromWritingClaimForID:completionHandler:", v3, v5);
}

uint64_t __80__NSFilePresenterManagedProxy_reacquireFromWritingClaimForID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveChangesWithCompletionHandler:(id)a3
{
  -[NSFilePresenterManagedProxy _safelySendMessageWithSelector:withErrorCompletionHandler:sender:](self, "_safelySendMessageWithSelector:withErrorCompletionHandler:sender:", a2, a3, &__block_literal_global_256);
}

uint64_t __64__NSFilePresenterManagedProxy_saveChangesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "saveChangesWithCompletionHandler:");
}

- (void)accommodateDeletionOfSubitemAtURL:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__NSFilePresenterManagedProxy_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke;
  v4[3] = &unk_1E0F54A80;
  v4[4] = a3;
  -[NSFilePresenterManagedProxy _safelySendMessageWithSelector:withErrorCompletionHandler:sender:](self, "_safelySendMessageWithSelector:withErrorCompletionHandler:sender:", a2, a4, v4);
}

uint64_t __83__NSFilePresenterManagedProxy_accommodateDeletionOfSubitemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "accommodateDeletionOfSubitemAtURL:completionHandler:", *(_QWORD *)(a1 + 32), a3);
}

- (void)collectDebuggingInformationWithCompletionHandler:(id)a3
{
  -[NSFilePresenterXPCInterface collectDebuggingInformationWithCompletionHandler:](self->_xpcProxy, "collectDebuggingInformationWithCompletionHandler:", a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[NSFilePresenterXPCInterface methodSignatureForSelector:](self->_xpcProxy, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  if (objc_msgSend(a3, "_hasBlockArgument"))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSFileReactorProxy.m"), 1400, CFSTR("NSFilePresenter messages with reply blocks need their own special override on NSFilePresenterManagedProxy"));
  if (-[NSFilePresenterManagedProxy _presenterRespondsToSelector:](self, "_presenterRespondsToSelector:", objc_msgSend(a3, "selector")))
  {
    -[NSFilePresenterXPCInterface forwardInvocation:](self->_nonboostingXPCProxy, "forwardInvocation:", a3);
  }
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithXPCProxy:", self->_xpcProxy);
  objc_msgSend(v5, "setErrorHandler:", a3);
  objc_msgSend(v5, "setFilePresenterResponses:", -[NSFilePresenterManagedProxy filePresenterResponses](self, "filePresenterResponses"));
  objc_msgSend(v5, "setProcessManager:", -[NSFilePresenterManagedProxy processManager](self, "processManager"));
  return v5;
}

- (unint64_t)filePresenterResponses
{
  return self->_filePresenterResponses;
}

- (NSFileAccessProcessManager)processManager
{
  return (NSFileAccessProcessManager *)objc_getProperty(self, a2, 32, 1);
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

@end
