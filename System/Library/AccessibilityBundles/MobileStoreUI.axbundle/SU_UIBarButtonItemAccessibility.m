@implementation SU_UIBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIBarButtonItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  SU_UIBarButtonItemAccessibility *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __53__SU_UIBarButtonItemAccessibility_accessibilityLabel__block_invoke;
  v11 = &unk_2502A6940;
  v12 = self;
  v13 = &v14;
  AXPerformSafeBlock();
  v3 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("_shareButtonAction:")))
  {
    UIKitAccessibilityLocalizedString();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SU_UIBarButtonItemAccessibility;
    -[SU_UIBarButtonItemAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

@end
