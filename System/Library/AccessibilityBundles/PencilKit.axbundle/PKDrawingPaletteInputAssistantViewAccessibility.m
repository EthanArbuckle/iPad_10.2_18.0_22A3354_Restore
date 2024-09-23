@implementation PKDrawingPaletteInputAssistantViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKDrawingPaletteInputAssistantView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDrawingPaletteInputAssistantView"), CFSTR("keyboardButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDrawingPaletteInputAssistantView"), CFSTR("returnKeyButton"), "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;

  -[PKDrawingPaletteInputAssistantViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("keyboardButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDrawingPaletteInputAssistantViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("returnKeyButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
