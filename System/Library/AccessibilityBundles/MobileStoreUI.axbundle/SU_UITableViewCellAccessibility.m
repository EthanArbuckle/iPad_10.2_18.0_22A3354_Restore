@implementation SU_UITableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SUUICircleProgressIndicator"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("tableTextAccessibleLabel:"), "@", 0);

}

- (id)tableTextAccessibleLabel:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SU_UITableViewCellAccessibility;
  -[SU_UITableViewCellAccessibility tableTextAccessibleLabel:](&v10, sel_tableTextAccessibleLabel_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SU_UITableViewCellAccessibility accessoryView](self, "accessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUUICircleProgressIndicator"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("loading.status"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  return v4;
}

@end
