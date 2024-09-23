@implementation NSURLSessionDownloadTask

- (NSURLSessionDownloadTask)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionDownloadTask;
  return -[NSURLSessionTask init](&v3, sel_init);
}

- (void)cancelByProducingResumeData:(void *)completionHandler
{
  (*((void (**)(void *, _QWORD))completionHandler + 2))(completionHandler, 0);
}

@end
