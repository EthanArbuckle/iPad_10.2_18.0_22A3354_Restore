@implementation QLThumbnailProvider

- (void)provideThumbnailForFileRequest:(QLFileThumbnailRequest *)request completionHandler:(void *)handler
{
  (*((void (**)(void *, _QWORD, _QWORD))handler + 2))(handler, 0, 0);
}

@end
