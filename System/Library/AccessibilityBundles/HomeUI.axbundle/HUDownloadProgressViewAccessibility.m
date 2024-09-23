@implementation HUDownloadProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUDownloadProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUDownloadProgressView"), CFSTR("downloadProgress"), "d", 0);
}

- (id)accessibilityValue
{
  -[HUDownloadProgressViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("downloadProgress"));
  return (id)AXFormatFloatWithPercentage();
}

@end
