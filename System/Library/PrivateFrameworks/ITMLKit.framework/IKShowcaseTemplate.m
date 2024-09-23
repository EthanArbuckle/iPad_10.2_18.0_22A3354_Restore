@implementation IKShowcaseTemplate

- (NSArray)modes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[IKViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (IKDocumentBannerElement)documentBanner
{
  return (IKDocumentBannerElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 33);
}

- (IKCarouselElement)carousel
{
  return (IKCarouselElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 15);
}

- (IKBackgroundElement)background
{
  return (IKBackgroundElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 7);
}

- (unint64_t)transition
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[IKViewElementStyle transitionFromString:](IKViewElementStyle, "transitionFromString:", v3);

  return v4;
}

@end
