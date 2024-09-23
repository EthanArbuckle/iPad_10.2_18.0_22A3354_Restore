@implementation SwiftUITabBarItem

- (void)setView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SwiftUITabBarItem;
  -[SwiftUITabBarItem setView:](&v4, sel_setView_, a3);
  -[SwiftUITabBarItem updateAccessibility](self, "updateAccessibility");
}

@end
