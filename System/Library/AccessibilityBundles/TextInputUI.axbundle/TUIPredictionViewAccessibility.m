@implementation TUIPredictionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUIPredictionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIPredictionView"), CFSTR("_reloadCellsAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIPredictionView"), CFSTR("configurePredictionCell:forCandidate:animated:"), "v", "@", "@", "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIPredictionViewAccessibility;
  return -[TUIPredictionViewAccessibility _accessibilityScannerGroupTraits](&v3, sel__accessibilityScannerGroupTraits) | 2;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("prediction.view.collapsed.label"));
}

- (void)_accessibilitySendCandidateNotificationIfNecessary:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[TUIPredictionViewAccessibility autocorrectionList](self, "autocorrectionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isContinuousPathConversion"))
  {
    objc_msgSend(v7, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length")
      && (!objc_msgSend((id)_accessibilitySendCandidateNotificationIfNecessary__PreviousLabel, "isEqualToString:", v5)|| CFAbsoluteTimeGetCurrent()- *(double *)&_accessibilitySendCandidateNotificationIfNecessary__PreviousSentNotificationTime > 1.0))
    {
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEBAEB8]);
      UIAccessibilityPostNotification(*MEMORY[0x24BEBAEB0], v6);
      objc_storeStrong((id *)&_accessibilitySendCandidateNotificationIfNecessary__PreviousLabel, v5);
      _accessibilitySendCandidateNotificationIfNecessary__PreviousSentNotificationTime = CFAbsoluteTimeGetCurrent();

    }
  }
  else if (!a3)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAEB0], 0);
  }

}

- (void)_reloadCellsAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIPredictionViewAccessibility;
  -[TUIPredictionViewAccessibility _reloadCellsAnimated:](&v4, sel__reloadCellsAnimated_, a3);
  -[TUIPredictionViewAccessibility _accessibilitySendCandidateNotificationIfNecessary:](self, "_accessibilitySendCandidateNotificationIfNecessary:", 1);
}

- (void)configurePredictionCell:(id)a3 forCandidate:(id)a4 animated:(BOOL)a5
{
  uint64_t v5;
  id v8;
  objc_super v9;

  v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)TUIPredictionViewAccessibility;
  v8 = a3;
  -[TUIPredictionViewAccessibility configurePredictionCell:forCandidate:animated:](&v9, sel_configurePredictionCell_forCandidate_animated_, v8, a4, v5);
  LODWORD(v5) = objc_msgSend(v8, "highlighted", v9.receiver, v9.super_class);

  if ((_DWORD)v5)
    -[TUIPredictionViewAccessibility _accessibilitySendCandidateNotificationIfNecessary:](self, "_accessibilitySendCandidateNotificationIfNecessary:", 0);
}

@end
