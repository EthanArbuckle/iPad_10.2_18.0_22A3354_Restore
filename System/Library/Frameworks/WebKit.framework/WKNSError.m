@implementation WKNSError

- (id)_web_createTarget
{
  return (id)objc_msgSend((id)WebCore::ResourceError::nsError((WebCore::ResourceError *)(-[WKObject _apiObject](self, "_apiObject")+ 16)), "copy");
}

@end
