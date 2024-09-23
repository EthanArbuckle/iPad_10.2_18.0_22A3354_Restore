@implementation IKColumnTemplate

- (IKDocumentBannerElement)documentBanner
{
  return (IKDocumentBannerElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 33);
}

- (IKColumnCollectionElement)columnCollection
{
  return (IKColumnCollectionElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 22);
}

@end
