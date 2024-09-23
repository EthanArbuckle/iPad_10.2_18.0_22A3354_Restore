@implementation CKAvatarCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAvatarCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarCollectionViewCell"), CFSTR("configureWithEntity:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("_CKAcknowledgmentTally"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_CKAcknowledgmentTally"), CFSTR("contacts"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKGroupAcknowledgmentVotingLayout"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKGroupAcknowledgmentVotingLayout"), CFSTR("layoutMode"), "Q", 0);

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[CKAvatarCollectionViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXTapbackTally"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[CKAvatarCollectionViewCellAccessibility _axCollectionViewLayoutMode](self, "_axCollectionViewLayoutMode") != 1
      || -[CKAvatarCollectionViewCellAccessibility _accessibilityIntegerValueForKey:](self, "_accessibilityIntegerValueForKey:", CFSTR("AXTapbackContactIndex")) == 0;
  }
  else
  {
    -[CKAvatarCollectionViewCellAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CKAvatarCollectionViewCellAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "BOOLValue");

    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)CKAvatarCollectionViewCellAccessibility;
      v4 = -[CKAvatarCollectionViewCellAccessibility isAccessibilityElement](&v8, sel_isAccessibilityElement);
    }
  }

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CKAvatarCollectionViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXTapbackTally"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CKAvatarCollectionViewCellAccessibility _axTapbackLabelWithTally:](self, "_axTapbackLabelWithTally:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    -[CKAvatarCollectionViewCellAccessibility _axCKEntity](self, "_axCKEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "abbreviatedDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)accessibilityHint
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[CKAvatarCollectionViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXTapbackTally"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    accessibilityLocalizedString(CFSTR("acknowledgment.tally.hint"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKAvatarCollectionViewCellAccessibility;
    -[CKAvatarCollectionViewCellAccessibility accessibilityHint](&v7, sel_accessibilityHint);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)_axCKEntity
{
  JUMPOUT(0x23490A888);
}

- (void)_setAXCKEntity:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)configureWithEntity:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAvatarCollectionViewCellAccessibility;
  v4 = a3;
  -[CKAvatarCollectionViewCellAccessibility configureWithEntity:](&v5, sel_configureWithEntity_, v4);
  -[CKAvatarCollectionViewCellAccessibility _setAXCKEntity:](self, "_setAXCKEntity:", v4, v5.receiver, v5.super_class);

}

- (id)_axTapbackLabelWithTally:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;

  v4 = objc_msgSend(a3, "safeIntegerForKey:", CFSTR("type"));
  if (-[CKAvatarCollectionViewCellAccessibility _axCollectionViewLayoutMode](self, "_axCollectionViewLayoutMode") == 1)
  {
    -[CKAvatarCollectionViewCellAccessibility _axTapbackContacts](self, "_axTapbackContacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[CKAvatarCollectionViewCellAccessibility _axLocalizedFormatStringForAcknowledgmentType:](self, "_axLocalizedFormatStringForAcknowledgmentType:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count") == 1)
    {
      v9 = -[CKAvatarCollectionViewCellAccessibility _accessibilityIntegerValueForKey:](self, "_accessibilityIntegerValueForKey:", CFSTR("AXTapbackContactIndex"));
      -[CKAvatarCollectionViewCellAccessibility _axTapbackContacts](self, "_axTapbackContacts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "safeValueForKey:", CFSTR("name"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
  }
  else
  {
    v13 = -[CKAvatarCollectionViewCellAccessibility _accessibilityIntegerValueForKey:](self, "_accessibilityIntegerValueForKey:", CFSTR("AXTapbackContactIndex"));
    -[CKAvatarCollectionViewCellAccessibility _axTapbackContacts](self, "_axTapbackContacts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safeValueForKey:", CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_axLocalizedFormatStringForAcknowledgmentType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2000) > 5)
    return 0;
  accessibilityLocalizedString(off_2501B1DF0[a3 - 2000]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_axTapbackType
{
  void *v2;
  int64_t v3;

  -[CKAvatarCollectionViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXTapbackTally"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("type"));

  return v3;
}

- (id)_axTapbackContacts
{
  void *v2;
  void *v3;
  void *v4;

  -[CKAvatarCollectionViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXTapbackTally"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("contacts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)_axCollectionViewLayoutMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("layoutMode"));

  return v6;
}

@end
