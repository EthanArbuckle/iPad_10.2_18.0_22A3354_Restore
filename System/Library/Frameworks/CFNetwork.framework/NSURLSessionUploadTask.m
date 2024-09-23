@implementation NSURLSessionUploadTask

- (NSURLSessionUploadTask)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionUploadTask;
  return -[NSURLSessionDataTask init](&v3, sel_init);
}

- (void)cancelByProducingResumeData:(void *)completionHandler
{
  (*((void (**)(void *, _QWORD))completionHandler + 2))(completionHandler, 0);
}

@end
