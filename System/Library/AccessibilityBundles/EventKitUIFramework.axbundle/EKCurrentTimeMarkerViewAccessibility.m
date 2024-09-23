@implementation EKCurrentTimeMarkerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKCurrentTimeMarkerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  return (id)*MEMORY[0x24BDF76A0] == a3 || *MEMORY[0x24BDF7640] == (_QWORD)a3;
}

@end
