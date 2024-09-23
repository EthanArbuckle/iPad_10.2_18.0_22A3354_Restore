@implementation IKLockupElement

- (IKImageElement)image
{
  return (IKImageElement *)-[IKViewElement childImageElementWithType:](self, "childImageElementWithType:", 0);
}

- (IKImageElement)fullscreenImage
{
  return (IKImageElement *)-[IKViewElement childImageElementWithType:](self, "childImageElementWithType:", 1);
}

- (IKTextElement)title
{
  return (IKTextElement *)-[IKViewElement childTextElementWithStyle:](self, "childTextElementWithStyle:", 1);
}

- (IKTextElement)subtitle
{
  return (IKTextElement *)-[IKViewElement childTextElementWithStyle:](self, "childTextElementWithStyle:", 2);
}

- (IKTextElement)descriptionText
{
  return (IKTextElement *)-[IKViewElement childTextElementWithStyle:](self, "childTextElementWithStyle:", 3);
}

- (IKOrdinalElement)ordinal
{
  return (IKOrdinalElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 80);
}

- (BOOL)showTitlesOnFocus
{
  void *v2;
  void *v3;
  char v4;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labelsState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("show-on-highlight"));

  return v4;
}

- (IKViewElement)overlays
{
  return (IKViewElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 82);
}

@end
