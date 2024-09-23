@implementation IKDialogTemplate

- (unint64_t)type
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[IKViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("error"));

  return v4;
}

- (IKTextElement)title
{
  return (IKTextElement *)-[IKViewElement childTextElementWithStyle:](self, "childTextElementWithStyle:", 1);
}

- (IKTextElement)descriptionText
{
  return (IKTextElement *)-[IKViewElement childTextElementWithStyle:](self, "childTextElementWithStyle:", 3);
}

- (NSArray)buttons
{
  return (NSArray *)-[IKViewElement childElementsWithType:](self, "childElementsWithType:", 12);
}

@end
