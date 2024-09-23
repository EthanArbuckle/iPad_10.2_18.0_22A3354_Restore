@implementation IKListItemLockupElement

- (NSString)itemHeight
{
  void *v2;
  void *v3;

  -[IKViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemHeight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)images
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[IKViewElement childElementsWithType:](self, "childElementsWithType:", 49);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

BOOL __33__IKListItemLockupElement_images__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "imageType") == 0;
}

- (IKTextElement)title
{
  return (IKTextElement *)-[IKViewElement childTextElementWithStyle:](self, "childTextElementWithStyle:", 1);
}

- (IKTextElement)subtitle
{
  return (IKTextElement *)-[IKViewElement childTextElementWithStyle:](self, "childTextElementWithStyle:", 2);
}

- (NSArray)decorationImages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[IKViewElement childElementsWithType:](self, "childElementsWithType:", 49);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

BOOL __43__IKListItemLockupElement_decorationImages__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "imageType") == 2;
}

- (IKTextElement)decorationLabel
{
  return (IKTextElement *)-[IKViewElement childTextElementWithStyle:](self, "childTextElementWithStyle:", 4);
}

- (IKProgressIndicatorElement)progressIndicator
{
  return (IKProgressIndicatorElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 95);
}

- (IKActivityIndicatorElement)activityIndicator
{
  return (IKActivityIndicatorElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 4);
}

- (IKCheckMarkElement)checkMark
{
  return (IKCheckMarkElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 19);
}

- (IKOrdinalElement)ordinal
{
  return (IKOrdinalElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 80);
}

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

@end
