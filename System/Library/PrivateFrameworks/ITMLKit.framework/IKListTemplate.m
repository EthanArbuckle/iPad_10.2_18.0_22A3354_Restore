@implementation IKListTemplate

- (IKBackgroundElement)background
{
  return (IKBackgroundElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 7);
}

- (IKDocumentBannerElement)documentBanner
{
  return (IKDocumentBannerElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 33);
}

- (IKListElement)list
{
  return (IKListElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 62);
}

@end
