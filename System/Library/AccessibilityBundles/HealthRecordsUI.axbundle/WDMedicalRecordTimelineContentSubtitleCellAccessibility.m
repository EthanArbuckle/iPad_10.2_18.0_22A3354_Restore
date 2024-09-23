@implementation WDMedicalRecordTimelineContentSubtitleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WDMedicalRecordTimelineContentSubtitleCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("WDMedicalRecordTimelineContentSubtitleCell"), CFSTR("UITableViewCell"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDMedicalRecordTimelineContentSubtitleCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[WDMedicalRecordTimelineContentSubtitleCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
