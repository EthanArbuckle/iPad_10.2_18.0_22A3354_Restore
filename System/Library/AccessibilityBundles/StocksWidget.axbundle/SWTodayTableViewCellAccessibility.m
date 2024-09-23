@implementation SWTodayTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SWTodayTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SWTodayTableViewCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SWTodayTableViewController"), CFSTR("clipView"), "@", 0);

}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  id v20;
  objc_super v22;
  char v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v23 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeValueForKey:", CFSTR("clipView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SWTodayTableViewCellAccessibility accessibilityFrame](self, "accessibilityFrame");
  v26.origin.x = v15;
  v26.origin.y = v16;
  v26.size.width = v17;
  v26.size.height = v18;
  v24.origin.x = v8;
  v24.origin.y = v10;
  v24.size.width = v12;
  v24.size.height = v14;
  v25 = CGRectIntersection(v24, v26);
  if (v25.size.width < 2.0 || v25.size.height < 2.0)
  {
    v20 = (id)*MEMORY[0x24BEBB178];
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SWTodayTableViewCellAccessibility;
    v20 = -[SWTodayTableViewCellAccessibility accessibilityTraits](&v22, sel_accessibilityTraits);
  }

  return (unint64_t)v20;
}

@end
