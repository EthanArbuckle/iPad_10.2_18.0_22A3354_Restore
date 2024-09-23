@implementation _CNAtomTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_CNAtomTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTextView"), CFSTR("_isTextViewCollapsed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNComposeRecipientTextView"), CFSTR("_inactiveTextView"), "UITextView");
  objc_msgSend(v3, "validateClass:", CFSTR("CNComposeRecipientTextView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_CNAtomTextView"), CFSTR("UITextView"));

}

- (BOOL)_accessibilityOverridesInvisibility
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[_CNAtomTextViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_CNAtomTextViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAtomTextViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("toField")) & 1) != 0)
  {
    v7 = CFSTR("to.text");
LABEL_11:
    accessibilityLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v8);

    goto LABEL_12;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("subjectField")) & 1) != 0)
  {
    v7 = CFSTR("subject.text");
    goto LABEL_11;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ccField")) & 1) != 0)
  {
    v7 = CFSTR("cc.text");
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("bccField")))
  {
    v7 = CFSTR("bcc.text");
    goto LABEL_11;
  }
LABEL_12:
  v10.receiver = self;
  v10.super_class = (Class)_CNAtomTextViewAccessibility;
  -[_CNAtomTextViewAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v5, "appendString:", v9);

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  unint64_t v3;
  double v4;
  double v5;
  objc_super v6;
  CGPoint result;

  v3 = -[_CNAtomTextViewAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BEBB128] & v3) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)_CNAtomTextViewAccessibility;
    -[_CNAtomTextViewAccessibility accessibilityActivationPoint](&v6, sel_accessibilityActivationPoint);
  }
  else
  {
    -[_CNAtomTextViewAccessibility accessibilityFrame](self, "accessibilityFrame");
    AX_CGRectGetCenter();
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[_CNAtomTextViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("CNComposeRecipientTextView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_CNAtomTextViewAccessibility _accessibilityUseInactiveTextViewValueForParent:](self, "_accessibilityUseInactiveTextViewValueForParent:", v3))
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_inactiveTextView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_CNAtomTextViewAccessibility;
    -[_CNAtomTextViewAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)accessibilityAttributedValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  objc_super v15;

  -[_CNAtomTextViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("CNComposeRecipientTextView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_CNAtomTextViewAccessibility _accessibilityUseInactiveTextViewValueForParent:](self, "_accessibilityUseInactiveTextViewValueForParent:", v3))
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_inactiveTextView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityAttributedValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_CNAtomTextViewAccessibility;
    -[_CNAtomTextViewAccessibility accessibilityAttributedValue](&v15, sel_accessibilityAttributedValue);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (AXDoesRequestingClientDeserveAutomation())
    {
      v6 = (void *)objc_msgSend(v5, "mutableCopy");
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x2020000000;
      v14[3] = 0;
      v7 = objc_msgSend(v5, "length");
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __60___CNAtomTextViewAccessibility_accessibilityAttributedValue__block_invoke;
      v11[3] = &unk_2501D5528;
      v8 = v6;
      v12 = v8;
      v13 = v14;
      objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v11);
      v9 = v8;

      _Block_object_dispose(v14, 8);
      v5 = v9;
    }
  }

  return v5;
}

- (BOOL)_accessibilityUseInactiveTextViewValueForParent:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  char v7;

  v4 = a3;
  v5 = -[_CNAtomTextViewAccessibility accessibilityTraits](self, "accessibilityTraits");
  v6 = *MEMORY[0x24BDFEED8];
  v7 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("_isTextViewCollapsed"));

  if ((v6 & ~v5) != 0)
    return v7;
  else
    return 0;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CNAtomTextViewAccessibility;
  -[_CNAtomTextViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
  return _AXTraitsRemoveTrait();
}

- (_NSRange)_accessibilitySelectedTextRange
{
  void *v3;
  void *v4;
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  objc_super v11;
  _NSRange result;

  -[_CNAtomTextViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("CNComposeRecipientTextView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_CNAtomTextViewAccessibility _accessibilityUseInactiveTextViewValueForParent:](self, "_accessibilityUseInactiveTextViewValueForParent:", v3))
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_inactiveTextView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "_accessibilitySelectedTextRange");
    v7 = v6;

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_CNAtomTextViewAccessibility;
    v5 = -[_CNAtomTextViewAccessibility _accessibilitySelectedTextRange](&v11, sel__accessibilitySelectedTextRange);
    v7 = v8;
  }

  v9 = (NSUInteger)v5;
  v10 = v7;
  result.length = v10;
  result.location = v9;
  return result;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect result;

  length = a3.length;
  location = a3.location;
  -[_CNAtomTextViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("CNComposeRecipientTextView")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_CNAtomTextViewAccessibility _accessibilityUseInactiveTextViewValueForParent:](self, "_accessibilityUseInactiveTextViewValueForParent:", v6))
  {
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_inactiveTextView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_accessibilityBoundsForRange:", location, length);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)_CNAtomTextViewAccessibility;
    -[_CNAtomTextViewAccessibility _accessibilityBoundsForRange:](&v24, sel__accessibilityBoundsForRange_, location, length);
    v9 = v16;
    v11 = v17;
    v13 = v18;
    v15 = v19;
  }

  v20 = v9;
  v21 = v11;
  v22 = v13;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

@end
