@implementation PersonCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.PersonCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PersonCell"), CFSTR("personName"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.PersonCell"), CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"), CFSTR("accessoryView"), "@");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PersonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("personName"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PersonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PersonCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PersonCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;

  -[PersonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __48__PersonCellAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_2502C8F80;
    v12 = v3;
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PersonCellAccessibility;
    v5 = -[PersonCellAccessibility accessibilityActivate](&v7, sel_accessibilityActivate);
  }

  return v5;
}

uint64_t __48__PersonCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityActivate");
}

@end
