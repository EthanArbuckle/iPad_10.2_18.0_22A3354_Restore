@implementation IKLoadingTemplate

- (IKViewElement)activityElement
{
  return (IKViewElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 4);
}

@end
