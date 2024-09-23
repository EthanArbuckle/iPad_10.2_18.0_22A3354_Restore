@implementation __NSCFBackgroundDownloadTask

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__NSCFBackgroundDownloadTask;
  if (-[__NSCFBackgroundDownloadTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  NSData *v5;
  objc_super v6;

  v5 = (NSData *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSURLSessionDownloadTaskResumeData"));
  if (v5)
    -[__NSURLBackgroundSession moveFileToTempForBackgroundResumeData:]((uint64_t)-[NSURLSessionTask session](self, "session"), v5);
  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundDownloadTask;
  -[__NSCFBackgroundSessionTask _onqueue_didFinishWithError:](&v6, sel__onqueue_didFinishWithError_, a3);
}

- (void)_onqueue_didReceiveResponse:(id)a3
{
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)__NSCFBackgroundDownloadTask;
  -[__NSCFBackgroundSessionTask _onqueue_didReceiveResponse:](&v6, sel__onqueue_didReceiveResponse_);
  if (self)
  {
    internalDelegateWrapper = self->super.super._internalDelegateWrapper;
    if (!internalDelegateWrapper)
      internalDelegateWrapper = self->super.super._publicDelegateWrapper;
  }
  else
  {
    internalDelegateWrapper = 0;
  }
  -[__NSCFURLSessionDelegateWrapper downloadTask:_didReceiveResponse:]((uint64_t)internalDelegateWrapper, self, a3);
}

- (void)cancelByProducingResumeData:(id)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[6];

  v5 = -[NSURLSessionTask workQueue](self, "workQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60____NSCFBackgroundDownloadTask_cancelByProducingResumeData___block_invoke;
  v6[3] = &unk_1E14FDF00;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

@end
