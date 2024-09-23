@implementation UIViewController

- (void)su_setBridgedNavigationItem:(id)a3
{
  objc_setAssociatedObject(self, "su_bridgedNavigationItem", a3, (void *)1);
}

- (ServiceBridgedNavigationItem)su_bridgedNavigationItem
{
  return (ServiceBridgedNavigationItem *)objc_getAssociatedObject(self, "su_bridgedNavigationItem");
}

@end
