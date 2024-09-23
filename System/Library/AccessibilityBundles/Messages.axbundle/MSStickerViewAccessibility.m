@implementation MSStickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MSStickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MSStickerView"), CFSTR("sticker"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MSSticker"), CFSTR("localizedDescription"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[MSStickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sticker"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("localizedDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    accessibilityLocalizedString(CFSTR("sticker.label.unknown"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("sticker.hint"));
}

@end
