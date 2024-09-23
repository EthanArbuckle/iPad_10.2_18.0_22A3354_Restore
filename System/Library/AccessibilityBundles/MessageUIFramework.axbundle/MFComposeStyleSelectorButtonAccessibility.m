@implementation MFComposeStyleSelectorButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeStyleSelectorButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeStyleSelectorButton"), CFSTR("styleType"), "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MFComposeFontSelectorButton"));

}

- (int64_t)_accessibilityScannerActivateBehavior
{
  unint64_t v3;
  objc_super v6;

  v3 = -[MFComposeStyleSelectorButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("styleType"));
  if (v3 > 0xF || ((1 << v3) & 0xE19E) == 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)MFComposeStyleSelectorButtonAccessibility;
  return -[MFComposeStyleSelectorButtonAccessibility _accessibilityScannerActivateBehavior](&v6, sel__accessibilityScannerActivateBehavior);
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  objc_super v6;

  NSClassFromString(CFSTR("MFComposeFontSelectorButton"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    switch(-[MFComposeStyleSelectorButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("styleType")))
    {
      case 1:
        v4 = CFSTR("text.style.button.bold");
        goto LABEL_20;
      case 2:
        v4 = CFSTR("text.style.button.italic");
        goto LABEL_20;
      case 3:
        v4 = CFSTR("text.style.button.underline");
        goto LABEL_20;
      case 4:
        v4 = CFSTR("text.style.button.strikethrough");
        goto LABEL_20;
      case 5:
        v4 = CFSTR("text.style.button.decrease.font.size");
        goto LABEL_20;
      case 6:
        v4 = CFSTR("text.style.button.increase.font.size");
        goto LABEL_20;
      case 7:
        v4 = CFSTR("text.style.button.list.number");
        goto LABEL_20;
      case 8:
        v4 = CFSTR("text.style.button.list.bullets");
        goto LABEL_20;
      case 9:
        v4 = CFSTR("text.style.button.indent.left");
        goto LABEL_20;
      case 10:
        v4 = CFSTR("text.style.button.indent.right");
        goto LABEL_20;
      case 11:
        v4 = CFSTR("text.style.button.increase.quote");
        goto LABEL_20;
      case 12:
        v4 = CFSTR("text.style.button.decrease.quote");
        goto LABEL_20;
      case 13:
        v4 = CFSTR("text.style.button.justify.left");
        goto LABEL_20;
      case 14:
        v4 = CFSTR("text.style.button.justify.center");
        goto LABEL_20;
      case 15:
        v4 = CFSTR("text.style.button.justify.right");
LABEL_20:
        accessibilityLocalizedString(v4);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        return v3;
      default:
        return 0;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)MFComposeStyleSelectorButtonAccessibility;
  -[MFComposeStyleSelectorButtonAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

@end
