@implementation SeymourUI_GuidedWorkoutBrickRowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.GuidedWorkoutBrickRowCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.GuidedWorkoutBrickRowCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("SeymourUI.DownloadButton"));

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SeymourUI_GuidedWorkoutBrickRowCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_189);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      AXLabelForElements();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SeymourUI_GuidedWorkoutBrickRowCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SeymourUI_GuidedWorkoutBrickRowCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilityCustomActions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[SeymourUI_GuidedWorkoutBrickRowCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x23491D424](CFSTR("SeymourUI.DownloadButton"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc(MEMORY[0x24BDF6788]);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __79__SeymourUI_GuidedWorkoutBrickRowCellAccessibility__accessibilityCustomActions__block_invoke;
    v8[3] = &unk_2503484B8;
    v9 = v2;
    v5 = (void *)objc_msgSend(v4, "initWithName:actionHandler:", v3, v8);
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
