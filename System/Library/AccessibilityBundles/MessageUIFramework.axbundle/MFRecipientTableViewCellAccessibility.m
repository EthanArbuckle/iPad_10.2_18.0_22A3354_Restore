@implementation MFRecipientTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFRecipientTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("MFRecipientTableViewCell"), CFSTR("UITableViewCell"));
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  -[MFRecipientTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");
  v5 = 0;
  if (v4)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v5;
  v16 = 0;
  -[MFRecipientTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v7, "attributedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__MFRecipientTableViewCellAccessibility_accessibilityLabel__block_invoke;
    v13[3] = &unk_24FEFA070;
    v10 = v8;
    v14 = v10;
    v15 = &v17;
    objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("mf_tintType"), 0, v9, 0, v13);

  }
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __59__MFRecipientTableViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "substringWithRange:", a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    __UIAXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

@end
