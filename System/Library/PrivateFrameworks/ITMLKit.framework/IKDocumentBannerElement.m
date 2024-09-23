@implementation IKDocumentBannerElement

- (IKTextElement)title
{
  return (IKTextElement *)-[IKViewElement childTextElementWithStyle:](self, "childTextElementWithStyle:", 1);
}

- (IKTextElement)subtitle
{
  return (IKTextElement *)-[IKViewElement childTextElementWithStyle:](self, "childTextElementWithStyle:", 2);
}

- (IKBackgroundElement)background
{
  return (IKBackgroundElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 7);
}

- (UIColor)backgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ikBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (BOOL)fixed
{
  void *v2;
  void *v3;
  char v4;

  -[IKViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fixed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ik_attributeBoolValue");

  return v4;
}

- (NSArray)buttons
{
  return (NSArray *)-[IKViewElement childElementsWithType:](self, "childElementsWithType:", 12);
}

- (IKLockupElement)lockup
{
  return (IKLockupElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 66);
}

- (BOOL)isFixed
{
  return self->_fixed;
}

@end
