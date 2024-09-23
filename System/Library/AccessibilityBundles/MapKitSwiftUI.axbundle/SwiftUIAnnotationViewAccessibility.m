@implementation SwiftUIAnnotationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MapKit_SwiftUI.SwiftUIAnnotationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("_MapKit_SwiftUI.SwiftUIAnnotationView"), CFSTR("MKAnnotationView"));
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
