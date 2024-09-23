@implementation UndoButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.UndoButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.UndoButton"), CFSTR("undoButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.UndoButton"), CFSTR("undoFrom:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("UNDO_BUTTON"));
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  -[UndoButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("undoButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");
  v4 = *MEMORY[0x24BDF73B0] | v3 | *MEMORY[0x24BDF7408];

  return v4;
}

- (void)undoFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  AXMeasureAccessibilityStateObserver();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axHasConfirmedRectangle");

  v8.receiver = self;
  v8.super_class = (Class)UndoButtonAccessibility;
  -[UndoButtonAccessibility undoFrom:](&v8, sel_undoFrom_, v4);

  accessibilityLocalizedString(CFSTR("DID_UNDO_LAST_POINT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("DID_UNDO_POINT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXMeasureAnnounceUpdatedMeasurement(v6, v7);

}

@end
