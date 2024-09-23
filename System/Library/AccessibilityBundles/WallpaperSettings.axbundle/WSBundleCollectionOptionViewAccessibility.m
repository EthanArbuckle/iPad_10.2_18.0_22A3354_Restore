@implementation WSBundleCollectionOptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WSBundleCollectionOptionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WSBundleCollectionOptionView"), CFSTR("bundleCollection"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKWallpaperBundleCollection"), CFSTR("wallpaperType"), "Q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;

  -[WSBundleCollectionOptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bundleCollection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("wallpaperType"));

  switch(v3)
  {
    case 0:
      v4 = CFSTR("still.wallpapers");
      goto LABEL_8;
    case 1:
      accessibilityLocalizedString(CFSTR("motion.wallpapers"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      AXAttributedStringForBetterPronuciation();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    case 2:
      v4 = CFSTR("dynamic.wallpapers");
      goto LABEL_8;
    case 3:
      v4 = CFSTR("stripe.wallpapers");
      goto LABEL_8;
    case 4:
      v4 = CFSTR("photo.wallpapers");
LABEL_8:
      accessibilityLocalizedString(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void **v7;
  void *v8;
  objc_super v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[WSBundleCollectionOptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bundleCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("wallpaperType"));

  if (v4 == 2)
  {
    accessibilityLocalizedString(CFSTR("dynamic.wallpapers.short"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v5;
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = &v11;
    goto LABEL_5;
  }
  if (!v4)
  {
    accessibilityLocalizedString(CFSTR("still.wallpapers.short"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = (void **)v12;
LABEL_5:
    objc_msgSend(v6, "arrayWithObjects:count:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  v10.receiver = self;
  v10.super_class = (Class)WSBundleCollectionOptionViewAccessibility;
  -[WSBundleCollectionOptionViewAccessibility accessibilityUserInputLabels](&v10, sel_accessibilityUserInputLabels);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
