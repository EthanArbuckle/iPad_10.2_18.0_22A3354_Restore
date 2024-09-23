@implementation IndividualSwipeOptionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("IndividualSwipeOptionController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IndividualSwipeOptionController"), CFSTR("tableView: willDisplayCell: forRowAtIndexPath:"), "v", "@", "@", "@", 0);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IndividualSwipeOptionControllerAccessibility;
  v7 = a4;
  -[IndividualSwipeOptionControllerAccessibility tableView:willDisplayCell:forRowAtIndexPath:](&v10, sel_tableView_willDisplayCell_forRowAtIndexPath_, a3, v7, a5);
  objc_msgSend(v7, "textLabel", v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEnabled"))
    v9 = 0;
  else
    v9 = *MEMORY[0x24BDF73E8];
  objc_msgSend(v7, "setAccessibilityTraits:", v9);

}

@end
