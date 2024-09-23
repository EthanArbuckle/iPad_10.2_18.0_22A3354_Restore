@implementation PXPeopleBootstrapCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPeopleBootstrapCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleBootstrapCollectionViewCell"), CFSTR("image"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleBootstrapCollectionViewCell"), CFSTR("setConfirmed:"), "v", "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PXPeopleBootstrapCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("image"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setConfirmed:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPeopleBootstrapCollectionViewCellAccessibility;
  -[PXPeopleBootstrapCollectionViewCellAccessibility setConfirmed:](&v7, sel_setConfirmed_);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__PXPeopleBootstrapCollectionViewCellAccessibility_setConfirmed___block_invoke;
  v5[3] = &__block_descriptor_33_e15___NSString_8__0l;
  v6 = a3;
  -[PXPeopleBootstrapCollectionViewCellAccessibility _setAccessibilityValueBlock:](self, "_setAccessibilityValueBlock:", v5);
}

id __65__PXPeopleBootstrapCollectionViewCellAccessibility_setConfirmed___block_invoke(uint64_t a1)
{
  __CFString *v1;

  if (*(_BYTE *)(a1 + 32))
    v1 = CFSTR("bootstrap.cell.confirmed.status");
  else
    v1 = CFSTR("bootstrap.cell.unconfirmed.status");
  accessibilityPhotosUICoreLocalizedString(v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityHint
{
  return accessibilityPhotosUICoreLocalizedString(CFSTR("bootstrap.cell.confirm.hint"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleBootstrapCollectionViewCellAccessibility;
  return -[PXPeopleBootstrapCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) & ~*MEMORY[0x24BDF7400];
}

@end
