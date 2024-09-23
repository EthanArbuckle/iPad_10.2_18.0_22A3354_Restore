@implementation MFAttachmentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFAttachmentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFAttachmentView"), CFSTR("_filenameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFAttachmentView"), CFSTR("_statusLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFAttachmentView"), CFSTR("_totalSizeString"), "NSString");

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MFAttachmentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_filenameLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  -[MFAttachmentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_statusLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    -[MFAttachmentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_totalSizeString"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("view.attachment.hint"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
