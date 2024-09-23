@implementation UIToolbarButtonAccessibility__AnnotationKit__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIToolbarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;
  char v12;

  v12 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allTargets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("tag"));

  v11.receiver = self;
  v11.super_class = (Class)UIToolbarButtonAccessibility__AnnotationKit__UIKit;
  -[UIToolbarButtonAccessibility__AnnotationKit__UIKit accessibilityLabel](&v11, sel_accessibilityLabel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 - 764014;
  if ((unint64_t)(v6 - 764014) <= 6 && ((0x77u >> v8) & 1) != 0)
  {
    accessibilityLocalizedString(off_25014EFE0[v8]);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  return v7;
}

@end
