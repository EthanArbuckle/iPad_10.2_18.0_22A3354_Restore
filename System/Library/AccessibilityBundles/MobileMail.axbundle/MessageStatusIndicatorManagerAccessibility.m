@implementation MessageStatusIndicatorManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MessageStatusIndicatorManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageStatusIndicatorManager"), CFSTR("statusIndicatorImageWithOptionsMask:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageStatusIndicatorManager"), CFSTR("statusIndicatorColorWithOptionsMask:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageStatusIndicatorManager"), CFSTR("effectiveIndicatorOptions"), "Q", 0);

}

- (id)_axLabelForMask:(unint64_t)a3
{
  __int16 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a3;
  if ((a3 & 0x40) != 0)
  {
    accessibilityLocalizedString(CFSTR("notify.message"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v3 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v4 = 0;
  if ((a3 & 1) != 0)
  {
LABEL_5:
    accessibilityLocalizedString(CFSTR("unread"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
LABEL_6:
  if ((v3 & 4) != 0)
  {
    accessibilityLocalizedString(CFSTR("flagged"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
    if ((v3 & 0x10) == 0)
    {
LABEL_8:
      if ((v3 & 0x80) == 0)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  else if ((v3 & 0x10) == 0)
  {
    goto LABEL_8;
  }
  accessibilityLocalizedString(CFSTR("forwarded"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v9;
  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 8) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  accessibilityLocalizedString(CFSTR("muted.message"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v10;
  if ((v3 & 8) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  accessibilityLocalizedString(CFSTR("replied"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v11;
  if ((v3 & 2) == 0)
  {
LABEL_11:
    if ((v3 & 0x100) == 0)
      goto LABEL_12;
LABEL_20:
    accessibilityLocalizedString(CFSTR("blockedsender.message"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v13;
    if ((v3 & 0x20) == 0)
      return v4;
    goto LABEL_13;
  }
LABEL_19:
  accessibilityLocalizedString(CFSTR("vip.message"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v12;
  if ((v3 & 0x100) != 0)
    goto LABEL_20;
LABEL_12:
  if ((v3 & 0x20) != 0)
  {
LABEL_13:
    accessibilityLocalizedString(CFSTR("attachment.message"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (id)_axValueForMask:(unint64_t)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if ((a3 & 4) == 0)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  AXPerformSafeBlock();
  v4 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  accessibilityLabelForFlagColor(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __62__MessageStatusIndicatorManagerAccessibility__axValueForMask___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "statusIndicatorColorWithOptionsMask:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axIdentificationForMask:(unint64_t)a3
{
  const __CFString *v3;

  v3 = (const __CFString *)((unint64_t)CFSTR("statusIndicatorNotify") & ((uint64_t)(a3 << 57) >> 63));
  if ((a3 & 5) != 0)
    v3 = CFSTR("statusIndicatorUnreadFlagged");
  if ((a3 & 0x10) != 0)
    v3 = CFSTR("statusIndicatorForwarded");
  if ((a3 & 0x80) != 0)
    return CFSTR("statusIndicatorMuted");
  else
    return (id)v3;
}

- (id)statusIndicatorImageWithOptionsMask:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  objc_super v8;

  v5 = -[MessageStatusIndicatorManagerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("effectiveIndicatorOptions")) & a3;
  v8.receiver = self;
  v8.super_class = (Class)MessageStatusIndicatorManagerAccessibility;
  -[MessageStatusIndicatorManagerAccessibility statusIndicatorImageWithOptionsMask:](&v8, sel_statusIndicatorImageWithOptionsMask_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageStatusIndicatorManagerAccessibility _accessibilitySetImageNameForImage:options:](self, "_accessibilitySetImageNameForImage:options:", v6, v5);
  return v6;
}

- (void)_accessibilitySetImageNameForImage:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[MessageStatusIndicatorManagerAccessibility _axLabelForMask:](self, "_axLabelForMask:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MessageStatusIndicatorManagerAccessibility _axValueForMask:](self, "_axValueForMask:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageStatusIndicatorManagerAccessibility _axIdentificationForMask:](self, "_axIdentificationForMask:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v9);
  objc_msgSend(v6, "setAccessibilityValue:", v7);
  objc_msgSend(v6, "accessibilitySetIdentification:", v8);

}

@end
