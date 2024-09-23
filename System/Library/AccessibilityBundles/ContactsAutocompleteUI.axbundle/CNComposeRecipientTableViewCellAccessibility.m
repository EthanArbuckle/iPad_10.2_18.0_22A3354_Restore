@implementation CNComposeRecipientTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNComposeRecipientTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTableViewCell"), CFSTR("actionType"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTableViewCell"), CFSTR("actionButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTableViewCell"), CFSTR("actionButtonTapped"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNComposeRecipientTableViewCellAccessibility;
  -[CNComposeRecipientTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  switch(-[CNComposeRecipientTableViewCellAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("actionType")))
  {
    case 1:
      v3 = CFSTR("info.button.label");
      goto LABEL_6;
    case 2:
      v3 = CFSTR("collapsed.button.label");
      goto LABEL_6;
    case 3:
      v3 = CFSTR("expanded.button.label");
LABEL_6:
      accessibilityLocalizedString(v3);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      accessibilityLocalizedStringStewie(CFSTR("stewie.button.label"));
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v4 = (void *)v5;
      break;
    default:
      v4 = 0;
      break;
  }
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__CNComposeRecipientTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_2501D54E0;
  v6 = v4;
  v8 = v6;
  objc_copyWeak(&v9, &location);
  -[CNComposeRecipientTableViewCellAccessibility setAccessibilityCustomActionsBlock:](self, "setAccessibilityCustomActionsBlock:", v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

id __90__CNComposeRecipientTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDF6788]);
  v3 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__CNComposeRecipientTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v7[3] = &unk_2501D54B8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v4 = (void *)objc_msgSend(v2, "initWithName:actionHandler:", v3, v7);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v8);
  return v5;
}

uint64_t __90__CNComposeRecipientTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __90__CNComposeRecipientTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "actionButtonTapped");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNComposeRecipientTableViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CNComposeRecipientTableViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)actionButtonTapped
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNComposeRecipientTableViewCellAccessibility;
  -[CNComposeRecipientTableViewCellAccessibility actionButtonTapped](&v3, sel_actionButtonTapped);
  -[CNComposeRecipientTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
