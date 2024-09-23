@implementation _WKImageFileUploadItem

- (BOOL)isVideo
{
  return 0;
}

- (RetainPtr<UIImage>)displayImage
{
  _QWORD *v2;
  RetainPtr<UIImage> v3;

  WebKit::iconForImageFile((WebKit *)-[_WKFileUploadItem fileURL](self, "fileURL"), v2);
  return v3;
}

@end
