@implementation __NSCFLocalDataTask

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__NSCFLocalDataTask;
  if (-[__NSCFLocalDataTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4
{
  const char *v7;
  const char *v8;
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  __NSCFURLSessionDelegateWrapper *publicDelegateWrapper;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[3];

  if (self)
  {
    -[NSURLSessionTask setResponse:](self, "setResponse:", a3);
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:](self, "setCountOfBytesExpectedToReceive:", objc_msgSend(a3, "expectedContentLength"));
    if (-[NSURLSessionTask state](self, "state") >= NSURLSessionTaskStateCanceling)
    {
LABEL_3:
      memset(v15, 0, sizeof(v15));
      (*((void (**)(id, _QWORD *))a4 + 2))(a4, v15);
      return;
    }
    if (objc_getProperty(self, v7, 784, 1))
      goto LABEL_10;
    internalDelegateWrapper = self->super.super._internalDelegateWrapper;
    if (!internalDelegateWrapper)
      internalDelegateWrapper = self->super.super._publicDelegateWrapper;
  }
  else
  {
    v11 = objc_msgSend(0, "state");
    internalDelegateWrapper = 0;
    if (v11 > 1)
      goto LABEL_3;
  }
  if (-[__NSCFURLSessionDelegateWrapper didReceiveResponse]((uint64_t)internalDelegateWrapper, v8))
  {
    -[__NSCFLocalSessionTask cfConn](self, "cfConn");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[__NSCFLocalSessionTask _onqueue_suspend](self, "_onqueue_suspend");
      self->super._suspendedForDisposition = 1;
    }
    else if (!self)
    {
      publicDelegateWrapper = 0;
LABEL_15:
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __62____NSCFLocalDataTask__onqueue_didReceiveResponse_completion___block_invoke;
      v14[3] = &unk_1E14F68D8;
      v14[4] = self;
      v14[5] = a4;
      -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveResponse:completionHandler:]((uint64_t)publicDelegateWrapper, self, a3, v14);
      return;
    }
    self->super._pendingResponseDisposition = 1;
    publicDelegateWrapper = self->super.super._internalDelegateWrapper;
    if (!publicDelegateWrapper)
      publicDelegateWrapper = self->super.super._publicDelegateWrapper;
    goto LABEL_15;
  }
LABEL_10:
  v13 = 0;
  v12 = xmmword_18411DB20;
  (*((void (**)(id, __int128 *))a4 + 2))(a4, &v12);
}

@end
