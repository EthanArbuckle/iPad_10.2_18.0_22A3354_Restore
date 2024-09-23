@implementation SFPrivacyReportBannerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFPrivacyReportBannerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFInteractiveBannerCell"), CFSTR("leadingLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SFPrivacyReportBannerCell"), CFSTR("SFInteractiveBannerCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFPrivacyReportBannerCell"), CFSTR("_numberOfTrackers"), "q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFPrivacyReportBannerCell"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFPrivacyReportBannerCellAccessibility;
  -[SFPrivacyReportBannerCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SFPrivacyReportBannerCellAccessibility _axMarkupTrackerLabel](self, "_axMarkupTrackerLabel");
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (AXRequestingClient() == 4)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportBannerCellAccessibility;
  return -[SFPrivacyReportBannerCellAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (SFPrivacyReportBannerCellAccessibility)initWithFrame:(CGRect)a3
{
  SFPrivacyReportBannerCellAccessibility *v3;
  SFPrivacyReportBannerCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFPrivacyReportBannerCellAccessibility;
  v3 = -[SFPrivacyReportBannerCellAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SFPrivacyReportBannerCellAccessibility _axMarkupTrackerLabel](v3, "_axMarkupTrackerLabel");

  return v4;
}

- (void)_axMarkupTrackerLabel
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SFPrivacyReportBannerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leadingLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__SFPrivacyReportBannerCellAccessibility__axMarkupTrackerLabel__block_invoke;
  v4[3] = &unk_250296AA0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

__CFString *__63__SFPrivacyReportBannerCellAccessibility__axMarkupTrackerLabel__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  void *v4;
  __CFString *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeIntegerForKey:", CFSTR("_numberOfTrackers"));

  if (v2 < 0)
  {
    v5 = &stru_250296D50;
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    accessibilityMobileSafariLocalizedString(CFSTR("number.of.trackers.blocked"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, v2);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
