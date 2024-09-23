@implementation PKPassPaymentCardFrontFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassPaymentCardFrontFaceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPassPaymentCardFrontFaceView"), CFSTR("PKPassFaceView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassFaceView"), CFSTR("_pass"), "PKPass");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassPaymentCardFrontFaceView"), CFSTR("_balanceLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPass"), CFSTR("localizedDescription"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsApplePayCashCard
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_opt_class();
  -[PKPassPaymentCardFrontFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "passType") == 1)
  {
    objc_msgSend(v4, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasAssociatedPeerPaymentAccount");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_accessibilityIsAccessPass
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[PKPassPaymentCardFrontFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "isAccessPass");

  return (char)v3;
}

- (BOOL)_accessibilityIsStoredValuePass
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[PKPassPaymentCardFrontFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "isStoredValuePass");

  return (char)v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (-[PKPassPaymentCardFrontFaceViewAccessibility _accessibilityIsApplePayCashCard](self, "_accessibilityIsApplePayCashCard"))
  {
    accessibilityLocalizedString(CFSTR("apple.pay.cash.label"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (-[PKPassPaymentCardFrontFaceViewAccessibility _accessibilityIsAccessPass](self, "_accessibilityIsAccessPass"))
  {
    -[PKPassPaymentCardFrontFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pass"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("organizationName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPassPaymentCardFrontFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pass"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("localizedDescription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    __UIAXStringForVariables();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
    return v3;
  }
  v8 = -[PKPassPaymentCardFrontFaceViewAccessibility _accessibilityIsStoredValuePass](self, "_accessibilityIsStoredValuePass");
  -[PKPassPaymentCardFrontFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v8)
  {
    objc_msgSend(v9, "safeStringForKey:", CFSTR("localizedDescription"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v9, "safeValueForKey:", CFSTR("organizationName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassPaymentCardFrontFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("primaryAccountNumberSuffix"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("card.ending.in"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  __UIAXStringForVariables();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v16, v15, CFSTR("__AXStringForVariablesSentinel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC78]);

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (-[PKPassPaymentCardFrontFaceViewAccessibility _accessibilityIsApplePayCashCard](self, "_accessibilityIsApplePayCashCard"))
  {
    -[PKPassPaymentCardFrontFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_balanceLabel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length"))
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("current.balance.fmt"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v6, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)PKPassPaymentCardFrontFaceViewAccessibility;
  -[PKPassPaymentCardFrontFaceViewAccessibility accessibilityValue](&v9, sel_accessibilityValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
