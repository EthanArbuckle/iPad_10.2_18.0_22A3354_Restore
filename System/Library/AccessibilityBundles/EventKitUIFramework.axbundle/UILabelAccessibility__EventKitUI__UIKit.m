@implementation UILabelAccessibility__EventKitUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  -[UILabelAccessibility__EventKitUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AllDayLabel"));

  if (v6)
  {
    v8 = (id)*MEMORY[0x24BDF76A0] != v4 && *MEMORY[0x24BDF7648] != (_QWORD)v4 && *MEMORY[0x24BDF7640] != (_QWORD)v4;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UILabelAccessibility__EventKitUI__UIKit;
    v8 = -[UILabelAccessibility__EventKitUI__UIKit _accessibilitySupportsContentSizeCategory:](&v10, sel__accessibilitySupportsContentSizeCategory_, v4);
  }

  return v8;
}

@end
