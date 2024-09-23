@implementation GEODataURLSessionDownloadTask

- (id)_createBackingTaskWithRequest:(id)a3 session:(id)a4
{
  return (id)objc_msgSend(a4, "downloadTaskWithRequest:", a3);
}

@end
