@implementation NSTextAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSTextAttachment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  NSTextAttachmentAccessibility *v4;

  v4 = self;
  v3 = a2;
  -[NSTextAttachmentAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");
  v2.receiver = v4;
  v2.super_class = (Class)NSTextAttachmentAccessibility;
  -[NSTextAttachmentAccessibility dealloc](&v2, sel_dealloc);
}

@end
