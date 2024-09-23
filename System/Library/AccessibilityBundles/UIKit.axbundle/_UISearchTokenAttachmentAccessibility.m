@implementation _UISearchTokenAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISearchTokenAttachment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UISearchTokenAttachment"), CFSTR("_viewProvider"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSTextAttachmentViewProvider"), CFSTR("view"), v3, 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id v5;

  v4 = (id)-[_UISearchTokenAttachmentAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_viewProvider"));
  v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("view"));
  v5 = (id)objc_msgSend(v3, "accessibilityLabel");

  return v5;
}

@end
