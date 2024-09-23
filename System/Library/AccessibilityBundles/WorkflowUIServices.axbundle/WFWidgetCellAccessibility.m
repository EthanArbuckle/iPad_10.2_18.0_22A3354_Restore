@implementation WFWidgetCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFWidgetCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFWidgetCell"), CFSTR("nameView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFWidgetCell"), CFSTR("setRunningState:"), "v", "q", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[WFWidgetCellAccessibility _axWorkflowCellName](self, "_axWorkflowCellName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setRunningState:(int64_t)a3
{
  __CFString *v4;
  UIAccessibilityNotifications v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWidgetCellAccessibility;
  -[WFWidgetCellAccessibility setRunningState:](&v7, sel_setRunningState_);
  if ((unint64_t)a3 <= 3)
  {
    v4 = off_2503EC888[a3];
    v5 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v5, v6);

  }
}

- (id)_axWorkflowCellName
{
  void *v2;
  void *v3;

  -[WFWidgetCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("nameView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
