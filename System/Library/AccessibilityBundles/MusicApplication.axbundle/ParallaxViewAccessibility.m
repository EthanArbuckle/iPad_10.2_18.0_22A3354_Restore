@implementation ParallaxViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.ParallaxView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("MusicApplication.DetailHeader"));
}

- (id)accessibilityElements
{
  if (accessibilityElements_onceToken != -1)
    dispatch_once(&accessibilityElements_onceToken, &__block_literal_global_2);
  return (id)-[ParallaxViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_184);
}

uint64_t __50__ParallaxViewAccessibility_accessibilityElements__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x234917594](CFSTR("MusicApplication.DetailHeader"));
  accessibilityElements_detailHeader = result;
  return result;
}

uint64_t __50__ParallaxViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char isKindOfClass;

  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    *a3 = 1;
  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
