@implementation IKButtonElement

- (int64_t)buttonType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IKViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = IKButtonTypeForString(v3);

  return v4;
}

- (IKTextElement)text
{
  return (IKTextElement *)-[IKViewElement childTextElementWithStyle:](self, "childTextElementWithStyle:", 0);
}

- (NSString)confirmationText
{
  void *v2;
  void *v3;

  -[IKViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("confirm-text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (IKImageElement)image
{
  return (IKImageElement *)-[IKViewElement childImageElementWithType:](self, "childImageElementWithType:", 0);
}

@end
