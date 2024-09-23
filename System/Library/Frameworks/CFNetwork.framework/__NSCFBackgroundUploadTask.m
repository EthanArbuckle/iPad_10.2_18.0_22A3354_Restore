@implementation __NSCFBackgroundUploadTask

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__NSCFBackgroundUploadTask;
  if (-[__NSCFBackgroundDataTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__NSCFBackgroundUploadTask;
  -[__NSCFBackgroundDataTask dealloc](&v3, sel_dealloc);
}

- (void)cancelByProducingResumeData:(id)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[6];

  v5 = -[NSURLSessionTask workQueue](self, "workQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58____NSCFBackgroundUploadTask_cancelByProducingResumeData___block_invoke;
  v6[3] = &unk_1E14FDF00;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  id v3;
  void *v5;
  void *v6;
  __NSCFResumableUploadState *v7;
  const char *v8;
  id Property;
  id v10;
  objc_super v11;

  v3 = a3;
  v5 = (void *)objc_msgSend(a3, "userInfo");
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSURLSessionUploadTaskResumeData"));
  if (v6)
  {
    v7 = +[__NSCFResumableUploadState rusWithResumeData:]((uint64_t)__NSCFResumableUploadState, v6);
    if (v7)
    {
      -[NSURLSessionTask setResumableUploadState:](self, "setResumableUploadState:", v7);
      if (self)
        Property = objc_getProperty(self, v8, 848, 1);
      else
        Property = 0;
      -[__NSCFResumableUploadState setUploadFile:](-[NSURLSessionTask resumableUploadState](self, "resumableUploadState"), "setUploadFile:", Property);
      v10 = (id)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", -[__NSCFResumableUploadState createResumeData:](-[NSURLSessionTask resumableUploadState](self, "resumableUploadState"), 0), CFSTR("NSURLSessionUploadTaskResumeData"));
      v3 = (id)objc_msgSend(MEMORY[0x1E0CB39B8], "errorWithDomain:code:userInfo:", objc_msgSend(v3, "domain"), objc_msgSend(v3, "code"), v10);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)__NSCFBackgroundUploadTask;
  -[__NSCFBackgroundDataTask _onqueue_didFinishWithError:](&v11, sel__onqueue_didFinishWithError_, v3);
}

@end
