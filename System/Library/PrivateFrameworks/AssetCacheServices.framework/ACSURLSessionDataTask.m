@implementation ACSURLSessionDataTask

- (ACSURLSessionDataTask)initWithNSURLDataTaskCreator:(id)a3 initialRequest:(id)a4 forSession:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACSURLSessionDataTask;
  return -[ACSURLSessionTask initWithNSURLTaskCreator:initialRequest:forSession:](&v6, sel_initWithNSURLTaskCreator_initialRequest_forSession_, a3, a4, a5);
}

- (BOOL)_isUpload
{
  return 0;
}

- (id)_clientDataCompletionHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)set_clientDataCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__clientDataCompletionHandler, 0);
}

@end
