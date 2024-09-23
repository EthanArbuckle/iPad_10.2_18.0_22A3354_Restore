@implementation EKCalendarItemEditorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKCalendarItemEditor");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKCalendarItemEditorAccessibility;
  -[EKCalendarItemEditorAccessibility tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAccessibilityTableCellUsesDetailTextAsValue:", 1);
  objc_msgSend(v4, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  return v4;
}

@end
