@implementation MediaControlsTransportButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsTransportButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MediaControlsTransportButtonAccessibility;
  -[MediaControlsTransportButtonAccessibility accessibilityCustomActions](&v5, sel_accessibilityCustomActions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXGuaranteedMutableArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded();
  return v3;
}

@end
