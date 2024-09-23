@implementation STSegmentItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STSegmentItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STSegmentItem"), CFSTR("_titleText"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STSegmentItem"), CFSTR("_detailText"), "NSString");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[STSegmentItemAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_titleText"));
}

- (id)accessibilityValue
{
  return (id)-[STSegmentItemAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_detailText"));
}

@end
