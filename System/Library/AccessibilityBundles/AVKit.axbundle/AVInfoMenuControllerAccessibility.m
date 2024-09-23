@implementation AVInfoMenuControllerAccessibility

uint64_t __69__tvOS_AVInfoMenuControllerAccessibility_accessibilityHeaderElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("AVInfoPanelMetadataViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
