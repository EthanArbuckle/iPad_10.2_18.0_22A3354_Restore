@implementation MFMailDropBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFMailDropBannerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailDropBannerView"), CFSTR("_setupDownloadIcon"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailDropBannerView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailDropBannerView"), CFSTR("bannerState"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailDropBannerView"), CFSTR("_downloadLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailDropBannerView"), CFSTR("_expirationLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailDropBannerView"), CFSTR("_downloadIcon"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailDropBannerView"), CFSTR("_progressView"), "MFProgressView");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[MFMailDropBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_downloadLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailDropBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_expirationLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_setupDownloadIcon
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailDropBannerViewAccessibility;
  -[MFMailDropBannerViewAccessibility _setupDownloadIcon](&v3, sel__setupDownloadIcon);
  -[MFMailDropBannerViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMailDropBannerViewAccessibility;
  -[MFMailDropBannerViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[MFMailDropBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_downloadIcon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFMailDropBannerViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("bannerState"));
  v5 = *MEMORY[0x24BDF73B0];
  if (v4 >= 2)
  {
    if (v4 == 2)
    {
      accessibilityLocalizedString(CFSTR("air.drop.downloading"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 |= *MEMORY[0x24BDF73E8];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    accessibilityLocalizedString(CFSTR("air.drop.download"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setAccessibilityLabel:", v6);
  objc_msgSend(v3, "setAccessibilityTraits:", v5);

}

- (MFMailDropBannerViewAccessibility)initWithFrame:(CGRect)a3
{
  MFMailDropBannerViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMailDropBannerViewAccessibility;
  v3 = -[MFMailDropBannerViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MFMailDropBannerViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[MFMailDropBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_downloadIcon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailDropBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_progressView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MFMailDropBannerViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("bannerState"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityViewIsVisible") && (unint64_t)(v5 - 1) <= 1)
    objc_msgSend(v6, "addObject:", v3);
  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
    objc_msgSend(v6, "addObject:", v4);

  return v6;
}

@end
