@implementation IKMainTemplate

- (IKMenuBarElement)menuBar
{
  return (IKMenuBarElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 70);
}

- (IKBackgroundElement)background
{
  return (IKBackgroundElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 7);
}

- (IKButtonElement)button
{
  return (IKButtonElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 12);
}

- (IKDocumentBannerElement)banner
{
  return (IKDocumentBannerElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 33);
}

@end
