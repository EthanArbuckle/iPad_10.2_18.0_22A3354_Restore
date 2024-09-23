@implementation SUUIPanelTemplateViewElement

- (SUUIImageViewElement)backgroundImageElement
{
  void *v2;
  void *v3;

  -[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstChildForElementType:", 49);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUUIImageViewElement *)v3;
}

@end
