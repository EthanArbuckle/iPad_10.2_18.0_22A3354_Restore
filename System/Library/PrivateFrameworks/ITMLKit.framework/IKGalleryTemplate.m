@implementation IKGalleryTemplate

- (IKBackgroundElement)background
{
  return (IKBackgroundElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 7);
}

- (IKDocumentBannerElement)documentBanner
{
  return (IKDocumentBannerElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 33);
}

- (IKGridElement)grid
{
  return (IKGridElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 45);
}

@end
