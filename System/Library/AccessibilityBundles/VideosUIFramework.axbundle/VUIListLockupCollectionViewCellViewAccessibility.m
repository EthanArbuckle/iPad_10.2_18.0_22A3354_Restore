@implementation VUIListLockupCollectionViewCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIListLockupCollectionViewCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIListLockupCollectionViewCellView"), CFSTR("titleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIListLockupCollectionViewCellView"), CFSTR("subTitleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIListLockupCollectionViewCellView"), CFSTR("primaryButton"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIListLockupCollectionViewCellView"), CFSTR("secondaryButton"), "@");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[VUIListLockupCollectionViewCellViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIListLockupCollectionViewCellViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("subTitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[VUIListLockupCollectionViewCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primaryButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VUIListLockupCollectionViewCellViewAccessibility;
    -[VUIListLockupCollectionViewCellViewAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  -[VUIListLockupCollectionViewCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primaryButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityActivationPoint");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VUIListLockupCollectionViewCellViewAccessibility;
    -[VUIListLockupCollectionViewCellViewAccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  objc_super v17;
  objc_super v18;
  char v19;

  v19 = 0;
  objc_opt_class();
  -[VUIListLockupCollectionViewCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("secondaryButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && objc_msgSend(v5, "length"))
  {
    v17.receiver = self;
    v17.super_class = (Class)VUIListLockupCollectionViewCellViewAccessibility;
    -[VUIListLockupCollectionViewCellViewAccessibility accessibilityCustomActions](&v17, sel_accessibilityCustomActions);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_alloc(MEMORY[0x24BDF6788]);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __78__VUIListLockupCollectionViewCellViewAccessibility_accessibilityCustomActions__block_invoke;
    v15 = &unk_2503D29F8;
    v16 = v4;
    v10 = (void *)objc_msgSend(v9, "initWithName:actionHandler:", v6, &v12);
    objc_msgSend(v8, "addObject:", v10, v12, v13, v14, v15);

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VUIListLockupCollectionViewCellViewAccessibility;
    -[VUIListLockupCollectionViewCellViewAccessibility accessibilityCustomActions](&v18, sel_accessibilityCustomActions);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __78__VUIListLockupCollectionViewCellViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 0x2000);
  return 1;
}

@end
