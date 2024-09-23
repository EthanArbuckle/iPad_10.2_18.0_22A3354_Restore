@implementation HKInteractiveChartAnnotationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKInteractiveChartAnnotationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKInteractiveChartAnnotationView"), CFSTR("bodyMarginsLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_HKBodyMarginsLayout"), CFSTR("bodyView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_HKDateContentLayout"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_HKAnnotationColumnLayout"), CFSTR("columnViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKInteractiveChartAnnotationViewKeyValueLabel"), CFSTR("tapOutBlock"), "@?", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HKInteractiveChartAnnotationViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("bodyMarginsLayout.bodyView.contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("columnViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "safeValueForKey:", CFSTR("tapOutBlock"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 |= v10 != 0;

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)HKInteractiveChartAnnotationViewAccessibility;
  v11 = -[HKInteractiveChartAnnotationViewAccessibility accessibilityTraits](&v14, sel_accessibilityTraits);
  if ((v7 & 1) != 0)
    v12 = *MEMORY[0x24BDF73B0];
  else
    v12 = 0;

  return v12 | v11;
}

@end
