@implementation IKHeaderElement

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

- (IKImageElement)image
{
  return (IKImageElement *)-[IKViewElement childImageElementWithType:](self, "childImageElementWithType:", 0);
}

- (int64_t)separator
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = (void *)objc_opt_class();
  -[IKViewElement attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("separator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "ik_valueForBooleanAttribute:", v5);

  return v6;
}

@end
