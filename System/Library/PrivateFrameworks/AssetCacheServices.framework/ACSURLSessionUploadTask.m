@implementation ACSURLSessionUploadTask

- (ACSURLSessionUploadTask)initWithNSURLUploadTaskCreator:(id)a3 initialRequest:(id)a4 forSession:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACSURLSessionUploadTask;
  return -[ACSURLSessionTask initWithNSURLTaskCreator:initialRequest:forSession:](&v6, sel_initWithNSURLTaskCreator_initialRequest_forSession_, a3, a4, a5);
}

- (BOOL)_isUpload
{
  return 1;
}

@end
