@implementation TPNumberPadButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPNumberPadButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("TPNumberPadButton"), CFSTR("usesTelephonyGlyphsWhereAvailable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("TPNumberPadButton"), CFSTR("localizedLettersForCharacter:"), "@", "q", 0);

}

- (BOOL)isAccessibilityElement
{
  double v3;
  void *v4;
  BOOL v5;

  if ((-[TPNumberPadButtonAccessibility isHidden](self, "isHidden") & 1) != 0)
    return 0;
  -[TPNumberPadButtonAccessibility alpha](self, "alpha");
  if (v3 <= 0.0)
    return 0;
  -[TPNumberPadButtonAccessibility accessibilityLabel](self, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73D0] | *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDF73F0];
}

- (id)accessibilityHint
{
  void *v3;
  int v4;
  int v5;
  id v6;
  const __CFString *v7;
  uint64_t v8;
  id result;
  objc_super v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  TPNumberPadButtonAccessibility *v15;
  uint64_t *v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  -[TPNumberPadButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("character"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  v5 = v4 - 1;
  if ((v4 - 1) > 7)
  {
    v6 = 0;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __51__TPNumberPadButtonAccessibility_accessibilityHint__block_invoke;
    v14 = &unk_2503B0A38;
    v15 = self;
    v16 = &v18;
    v17 = v4;
    AXPerformSafeBlock();
    v6 = (id)v19[5];
    _Block_object_dispose(&v18, 8);

  }
  if (objc_msgSend(v6, "length"))
    return v6;
  v7 = CFSTR("2.key.hint");
  switch(v5)
  {
    case 0:
      goto LABEL_15;
    case 1:
      v7 = CFSTR("3.key.hint");
      goto LABEL_15;
    case 2:
      v7 = CFSTR("4.key.hint");
      goto LABEL_15;
    case 3:
      v7 = CFSTR("5.key.hint");
      goto LABEL_15;
    case 4:
      v7 = CFSTR("6.key.hint");
      goto LABEL_15;
    case 5:
      v7 = CFSTR("7.key.hint");
      goto LABEL_15;
    case 6:
      v7 = CFSTR("8.key.hint");
      goto LABEL_15;
    case 7:
      v7 = CFSTR("9.key.hint");
      goto LABEL_15;
    case 9:
      if ((objc_msgSend((id)objc_opt_class(), "safeBoolForKey:", CFSTR("usesTelephonyGlyphsWhereAvailable")) & 1) == 0)
        goto LABEL_19;
      v7 = CFSTR("0.key.hint");
LABEL_15:

      v6 = (id)v7;
      goto LABEL_16;
    default:
LABEL_19:
      if (v6)
      {
LABEL_16:
        accessibilityLocalizedString(v6);
        v8 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v8;
        return v6;
      }
      v10.receiver = self;
      v10.super_class = (Class)TPNumberPadButtonAccessibility;
      -[TPNumberPadButtonAccessibility accessibilityHint](&v10, sel_accessibilityHint);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return result;
}

void __51__TPNumberPadButtonAccessibility_accessibilityHint__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "localizedLettersForCharacter:", *(int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_accessibilityKeyboardKeyAllowsTouchTyping
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  int v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  -[TPNumberPadButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("character"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  v4 = CFSTR("number.pad.star");
  switch(v3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
      AXFormatInteger();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 9:
      goto LABEL_7;
    case 11:
      v4 = CFSTR("number.pad.octothorpe");
      goto LABEL_7;
    case 12:
      v4 = CFSTR("number.pad.delete");
LABEL_7:
      accessibilityLocalizedString(v4);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
LABEL_4:
      v6 = v5;
      v4 = v6;
      break;
  }
  v7 = v6;

  return v7;
}

@end
