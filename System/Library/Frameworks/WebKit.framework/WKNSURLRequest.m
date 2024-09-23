@implementation WKNSURLRequest

- (id)_web_createTarget
{
  -[WKObject _apiObject](self, "_apiObject");
  return (id)objc_msgSend((id)WebCore::ResourceRequest::nsURLRequest(), "copy");
}

- (id)URL
{
  WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)(-[WKObject _apiObject](self, "_apiObject") + 16));
  return (id)WTF::URL::operator NSURL *();
}

@end
