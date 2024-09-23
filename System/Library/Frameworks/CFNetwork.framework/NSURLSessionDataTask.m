@implementation NSURLSessionDataTask

- (NSURLSessionDataTask)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionDataTask;
  return -[NSURLSessionTask init](&v3, sel_init);
}

@end
