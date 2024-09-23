@implementation SUUILoadingTemplateViewElement

- (SUUIActivityIndicatorViewElement)activityIndicator
{
  return (SUUIActivityIndicatorViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 4);
}

@end
