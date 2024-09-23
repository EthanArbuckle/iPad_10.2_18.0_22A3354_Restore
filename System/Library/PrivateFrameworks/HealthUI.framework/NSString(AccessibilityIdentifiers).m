@implementation NSString(AccessibilityIdentifiers)

+ (id)hk_chartAccessibilityIdentifier:()AccessibilityIdentifiers
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("UIA.Health"), "stringByAppendingFormat:", CFSTR(".Chart.%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hk_chartOverlayAccessibilityIdentifier:()AccessibilityIdentifiers
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Overlay.%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_chartAccessibilityIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_chartOverlayCardioFitnessAccessibilityIdentifier:()AccessibilityIdentifiers
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CardioFitnessLevel.%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_chartOverlayAccessibilityIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hk_chartLollipopAccessibilityIdentifier:()AccessibilityIdentifiers
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LollipopContainer.%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_chartAccessibilityIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
