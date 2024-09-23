@implementation IKMenuBarTemplate

- (IKMenuBarElement)menuBar
{
  return (IKMenuBarElement *)-[IKViewElement childElementWithType:](self, "childElementWithType:", 70);
}

@end
