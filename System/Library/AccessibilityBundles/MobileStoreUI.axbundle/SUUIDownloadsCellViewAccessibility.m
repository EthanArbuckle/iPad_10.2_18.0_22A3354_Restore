@implementation SUUIDownloadsCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIDownloadsCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIDownloadsCellView"), CFSTR("button"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIDownloadsCellView"), CFSTR("attributedTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIDownloadsCellView"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIDownloadsCellView"), CFSTR("progress"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIDownloadsCellView"), CFSTR("buttonType"), "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SUUIDownloadsCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIDownloadsCollectionViewCell"), CFSTR("_editIndicator"), "UIImageView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  void *v6;
  char v7;

  -[SUUIDownloadsCellViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SUUIDownloadsCollectionViewCell")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_editIndicator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 0;
  -[SUUIDownloadsCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "accessibilityActivate");

  return v7;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = *MEMORY[0x24BDF73B0];
  -[SUUIDownloadsCellViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SUUIDownloadsCollectionViewCell")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelected");

  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v2;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[SUUIDownloadsCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attributedTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIDownloadsCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v10;

  -[SUUIDownloadsCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("progress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");

  -[SUUIDownloadsCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5 == 1)
  {
    v6 = CFSTR("item.downloading");
  }
  else
  {
    if (v5 != 2)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = CFSTR("item.download.paused");
  }
  accessibilityLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  AXFormatFloatWithPercentage();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
