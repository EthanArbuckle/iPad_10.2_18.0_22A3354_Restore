@implementation __NSCFLocalUploadTask

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__NSCFLocalUploadTask;
  if (-[__NSCFLocalDataTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (void)_private_completionAfterMetrics
{
  const char *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;

  if (a1)
  {
    if (objc_msgSend(a1, "error") && !objc_msgSend(a1, "resumeCallback"))
    {
      -[__NSCFLocalUploadTask _private_errorCompletionAfterMetrics](a1);
    }
    else
    {
      if (objc_msgSend(a1, "resumeCallback"))
      {
        v11 = 0;
        v3 = -[__NSCFResumableUploadState createResumeData:]((void *)objc_msgSend(a1, "resumableUploadState"), &v11);
        if (v11)
        {
          objc_msgSend(a1, "setError:");
          -[__NSCFLocalUploadTask _private_errorCompletionAfterMetrics](a1);
        }
        else
        {
          v4 = v3;
          v5 = _Block_copy((const void *)objc_msgSend(a1, "resumeCallback"));
          objc_msgSend(a1, "setResumeCallback:", 0);
          v6 = (void *)objc_msgSend(a1, "error:code:", *MEMORY[0x1E0CB32E8], -999);
          v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
          objc_msgSend(v7, "addEntriesFromDictionary:", objc_msgSend(v6, "userInfo"));
          if (v4)
            objc_msgSend(v7, "setObject:forKey:", v4, CFSTR("NSURLSessionUploadTaskResumeData"));
          v8 = objc_msgSend(MEMORY[0x1E0CB39B8], "errorWithDomain:code:userInfo:", objc_msgSend(v6, "domain"), objc_msgSend(v6, "code"), v7);
          v9 = objc_msgSend(a1, "session");
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __56____NSCFLocalUploadTask__private_completionAfterMetrics__block_invoke;
          v10[3] = &unk_1E14FDF00;
          v10[4] = v4;
          v10[5] = v5;
          -[NSURLSession runDelegateBlock:](v9, v10);
          objc_msgSend(a1, "setError:", v8);
        }
      }
      -[__NSCFLocalUploadTask _private_issueDidFinish](a1, v2);
    }
  }
}

- (id)resumeCallback
{
  return objc_getProperty(self, a2, 944, 1);
}

- (void)_private_issueDidFinish
{
  const char *v3;
  id Property;
  void *v5;
  SEL v6;
  uint64_t v7;

  if (objc_getProperty(a1, a2, 784, 1))
  {
    Property = objc_getProperty(a1, v3, 784, 1);
    v5 = _Block_copy(Property);
    objc_setProperty_atomic_copy(a1, v6, 0, 784);
    if (objc_msgSend(a1, "_callCompletionHandlerInline", MEMORY[0x1E0C809B0], 3221225472, __48____NSCFLocalUploadTask__private_issueDidFinish__block_invoke, &unk_1E14FDF00, a1, v5))__48____NSCFLocalUploadTask__private_issueDidFinish__block_invoke((uint64_t)&v7);
    else
      -[NSURLSession runDelegateBlock:](objc_msgSend(a1, "session"), &v7);
  }
  else if ((a1[927] & 1) == 0)
  {
    a1[927] = 1;
    -[NSURLSession _onqueue_didCompleteTask:withError:](objc_msgSend(a1, "session"), a1, (void *)objc_msgSend(a1, "error"));
  }
  objc_msgSend(a1, "setState:", 3);
  -[__NSURLSessionLocal removeUnresumedTask:](objc_msgSend(a1, "session"), (uint64_t)a1);
}

- (void)_task_onqueue_didFinish
{
  id *v3;
  uint64_t v4;

  -[NSURLSessionTask _finishProgressReporting](self, "_finishProgressReporting");
  if (self && self->super.super._pendingResponseDisposition)
  {
    self->super.super._pendingResponseDisposition_didFinish = 1;
  }
  else
  {
    -[__CFN_TaskMetrics completeWithError:]((uint64_t)-[NSURLSessionTask _metrics](self, "_metrics"), -[NSURLSessionTask error](self, "error"));
    if (-[__NSCFLocalSessionTask _needSendingMetrics](self, "_needSendingMetrics"))
    {
      -[__NSCFLocalSessionTask _didSendMetrics](self, "_didSendMetrics");
      v3 = -[NSURLSessionTaskMetrics initWithMetrics:]((id *)[NSURLSessionTaskMetrics alloc], -[NSURLSessionTask _metrics](self, "_metrics"));
      -[NSURLSessionTaskMetrics collectWithCompletionHandler:queue:]((uint64_t)v3, &v4, -[NSURLSessionTask workQueue](self, "workQueue", MEMORY[0x1E0C809B0], 3221225472, __48____NSCFLocalUploadTask__task_onqueue_didFinish__block_invoke, &unk_1E14FDE88, self, v3));
    }
    else
    {
      -[__NSCFLocalUploadTask _private_completionAfterMetrics](self);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[__NSCFLocalUploadTask setResumeCallback:](self, "setResumeCallback:", 0);
  v3.receiver = self;
  v3.super_class = (Class)__NSCFLocalUploadTask;
  -[__NSCFLocalSessionTask dealloc](&v3, sel_dealloc);
}

- (void)_onqueue_cancelByProducingResumeData:(id)a3
{
  void *v5;
  NSURLSession *v6;
  NSObject *global_queue;
  _QWORD v8[5];
  _QWORD v9[6];
  _QWORD block[5];
  objc_super v11;

  if (-[NSURLSessionTask state](self, "state") > NSURLSessionTaskStateCanceling)
  {
    v6 = -[NSURLSessionTask session](self, "session");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke_3;
    v8[3] = &unk_1E14FDEB0;
    v8[4] = a3;
    -[NSURLSession runDelegateBlock:]((uint64_t)v6, v8);
  }
  else if (*(&self->_startedProducingResumeData + 3))
  {
    if (-[__NSCFLocalUploadTask resumeCallback](self, "resumeCallback"))
    {
      v5 = _Block_copy(-[__NSCFLocalUploadTask resumeCallback](self, "resumeCallback"));
      -[__NSCFLocalUploadTask setResumeCallback:](self, "setResumeCallback:", 0);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke_2;
      v9[3] = &unk_1E14F69A0;
      v9[4] = v5;
      v9[5] = a3;
      -[__NSCFLocalUploadTask setResumeCallback:](self, "setResumeCallback:", v9);
    }
    else
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke;
      block[3] = &unk_1E14FDEB0;
      block[4] = a3;
      dispatch_async(global_queue, block);
    }
  }
  else
  {
    -[__NSCFLocalUploadTask setResumeCallback:](self, "setResumeCallback:", a3);
    *(&self->_startedProducingResumeData + 3) = 1;
    v11.receiver = self;
    v11.super_class = (Class)__NSCFLocalUploadTask;
    -[__NSCFLocalSessionTask _onqueue_cancel](&v11, sel__onqueue_cancel);
  }
}

- (void)cancelByProducingResumeData:(id)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[6];

  v5 = -[NSURLSessionTask workQueue](self, "workQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53____NSCFLocalUploadTask_cancelByProducingResumeData___block_invoke;
  v6[3] = &unk_1E14FDF00;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

- (__NSCFLocalUploadTask)initWithResumeData:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  __NSCFResumableUploadState *v8;
  const char *v9;
  __NSCFResumableUploadState *v10;
  const char *v11;
  id Property;
  __NSCFLocalUploadTask *v13;
  __NSCFLocalUploadTask *v14;
  objc_super v16;

  v8 = +[__NSCFResumableUploadState rusWithResumeData:]((uint64_t)__NSCFResumableUploadState, a3);
  if (!v8)
    return 0;
  v10 = v8;
  if (!objc_getProperty(v8, v9, 32, 1))
    return 0;
  Property = objc_getProperty(v10, v11, 32, 1);
  v16.receiver = self;
  v16.super_class = (Class)__NSCFLocalUploadTask;
  v13 = -[__NSCFLocalSessionTask initWithOriginalRequest:ident:taskGroup:](&v16, sel_initWithOriginalRequest_ident_taskGroup_, Property, a4, a5);
  v14 = v13;
  if (v13)
    -[NSURLSessionTask setResumableUploadState:](v13, "setResumableUploadState:", v10);
  return v14;
}

- (void)setResumeCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 944);
}

- (void)_private_errorCompletionAfterMetrics
{
  void *v2;
  const char *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v2 = (void *)objc_msgSend(a1, "error");
  if (v2)
  {
    v4 = v2;
    v5 = (void *)objc_msgSend(v2, "domain");
    if (((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]) & 1) != 0
       || objc_msgSend(v5, "isEqualToString:", CFSTR("_nsurlsessiondErrorDomain")))
      && objc_msgSend(v4, "code") != -999)
    {
      v6 = (void *)objc_msgSend(v4, "userInfo");
      if (!v6 || !objc_msgSend(v6, "objectForKey:", CFSTR("NSURLSessionUploadTaskResumeData")))
      {
        v7 = -[__NSCFResumableUploadState createResumeData:]((void *)objc_msgSend(a1, "resumableUploadState"), 0);
        if (v7)
        {
          v8 = v7;
          v9 = (void *)objc_msgSend((id)objc_msgSend(a1, "error"), "userInfo");
          if (v9)
          {
            v10 = (id)objc_msgSend(v9, "mutableCopy");
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("NSURLSessionUploadTaskResumeData"));
          }
          else
          {
            v10 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v8, CFSTR("NSURLSessionUploadTaskResumeData"));
          }
          objc_msgSend(a1, "setError:", objc_msgSend(MEMORY[0x1E0CB39B8], "errorWithDomain:code:userInfo:", objc_msgSend((id)objc_msgSend(a1, "error"), "domain"), objc_msgSend((id)objc_msgSend(a1, "error"), "code"), v10));
        }
      }
    }
  }
  -[__NSCFLocalUploadTask _private_issueDidFinish](a1, v3);
}

@end
