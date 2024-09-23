@implementation _WKVideoFileUploadItem

- (BOOL)isVideo
{
  return 1;
}

- (RetainPtr<UIImage>)displayImage
{
  _QWORD *v2;
  _QWORD *v3;
  WebKit *v4;
  NSURL *v5;
  RetainPtr<UIImage> v6;

  v3 = v2;
  v4 = -[_WKFileUploadItem fileURL](self, "fileURL");
  WebKit::iconForVideoFile(v4, v5, v3);
  return v6;
}

@end
