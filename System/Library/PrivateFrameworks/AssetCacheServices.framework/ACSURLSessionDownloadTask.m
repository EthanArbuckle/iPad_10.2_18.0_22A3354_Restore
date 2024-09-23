@implementation ACSURLSessionDownloadTask

- (NSURLRequest)originalRequest
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[ACSURLSessionDownloadTask _resumedOriginalRequest](self, "_resumedOriginalRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ACSURLSessionDownloadTask;
    -[ACSURLSessionTask originalRequest](&v8, sel_originalRequest);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSURLRequest *)v6;
}

- (void)cancelByProducingResumeData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ACSURLSessionTask _weakSession](self, "_weakSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cancelDownloadTask:byProducingResumeData:", self, v4);

}

- (ACSURLSessionDownloadTask)initWithNSURLDownloadTaskCreator:(id)a3 initialRequest:(id)a4 forSession:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACSURLSessionDownloadTask;
  return -[ACSURLSessionTask initWithNSURLTaskCreator:initialRequest:forSession:](&v6, sel_initWithNSURLTaskCreator_initialRequest_forSession_, a3, a4, a5);
}

- (BOOL)_isUpload
{
  return 0;
}

- (id)_clientLocationCompletionHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)set_clientLocationCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSURLRequest)_resumedOriginalRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 64, 1);
}

- (void)set_resumedOriginalRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSError)_deferredLinkError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)set_deferredLinkError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__deferredLinkError, 0);
  objc_storeStrong((id *)&self->__resumedOriginalRequest, 0);
  objc_storeStrong(&self->__clientLocationCompletionHandler, 0);
}

@end
