@implementation _CKVideoMessageRecordingWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_CKVideoMessageRecordingWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWindowVisible
{
  return 1;
}

@end
