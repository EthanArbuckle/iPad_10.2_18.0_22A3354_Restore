@implementation _MFAtomTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MFAtomTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MFAtomTextView"), CFSTR("atoms"), "@", 0);
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

  -[_MFAtomTextViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_MFAtomTextViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MFAtomTextViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
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
  v10.super_class = (Class)_MFAtomTextViewAccessibility;
  -[_MFAtomTextViewAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
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

  v3 = -[_MFAtomTextViewAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BEBB128] & v3) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)_MFAtomTextViewAccessibility;
    -[_MFAtomTextViewAccessibility accessibilityActivationPoint](&v6, sel_accessibilityActivationPoint);
  }
  else
  {
    -[_MFAtomTextViewAccessibility accessibilityFrame](self, "accessibilityFrame");
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
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  LOBYTE(v11) = 0;
  objc_opt_class();
  -[_MFAtomTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("atoms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MFAtomTextViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("MFComposeRecipientTextView")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "safeBoolForKey:", CFSTR("_isTextViewCollapsed")))
  {
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_inactiveTextView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v4, "count"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __50___MFAtomTextViewAccessibility_accessibilityValue__block_invoke;
    v10[3] = &unk_24FEFA098;
    v10[4] = &v11;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
    objc_msgSend((id)v12[5], "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_MFAtomTextViewAccessibility;
    -[_MFAtomTextViewAccessibility accessibilityValue](&v9, sel_accessibilityValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MFAtomTextViewAccessibility;
  -[_MFAtomTextViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
  return _AXTraitsRemoveTrait();
}

@end
