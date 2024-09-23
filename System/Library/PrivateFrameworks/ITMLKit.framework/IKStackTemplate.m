@implementation IKStackTemplate

- (IKBackgroundElement)background
{
  return (IKBackgroundElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 7);
}

- (IKDocumentBannerElement)documentBanner
{
  return (IKDocumentBannerElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 33);
}

- (IKCollectionListElement)collectionList
{
  return (IKCollectionListElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 20);
}

@end
