@implementation NSURLDownloadInternal

- (void)dealloc
{
  objc_super v3;

  if (self->delegate)
    __assert_rtn("-[NSURLDownloadInternal dealloc]", "NSURLDownload.mm", 52, "!delegate");

  v3.receiver = self;
  v3.super_class = (Class)NSURLDownloadInternal;
  -[NSURLDownloadInternal dealloc](&v3, sel_dealloc);
}

@end
