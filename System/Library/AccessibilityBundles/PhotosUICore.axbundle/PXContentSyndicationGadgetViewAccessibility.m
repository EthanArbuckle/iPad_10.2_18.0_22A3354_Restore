@implementation PXContentSyndicationGadgetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXContentSyndicationGadgetView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXContentSyndicationGadgetView"), CFSTR("_assetPreviewView"), "PXContentSyndicationItemAssetPreviewView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXContentSyndicationGadgetView"), CFSTR("_socialLayerAttributionView"), "SLAttributionView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PXContentSyndicationGadgetViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_assetPreviewView"));
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  -[PXContentSyndicationGadgetViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_socialLayerAttributionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCEB8];
  v11.receiver = self;
  v11.super_class = (Class)PXContentSyndicationGadgetViewAccessibility;
  -[PXContentSyndicationGadgetViewAccessibility _accessibilitySupplementaryFooterViews](&v11, sel__accessibilitySupplementaryFooterViews);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axArrayWithPossiblyNilArrays:", 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
    objc_msgSend(v9, "axSafelyAddObject:", v3);

  return v9;
}

@end
