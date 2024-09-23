@implementation IKListElement

- (IKViewElement)relatedContent
{
  void *v2;
  void *v3;
  void *v4;

  -[IKViewElement childElementWithType:](self, "childElementWithType:", 100);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKViewElement *)v4;
}

- (BOOL)isLeftAligned
{
  void *v2;
  BOOL v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "elementAlignment") == 1;

  return v3;
}

@end
