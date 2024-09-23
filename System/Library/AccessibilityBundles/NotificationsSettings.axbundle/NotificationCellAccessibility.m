@implementation NotificationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NotificationCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_imageView:"), "@", "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NotificationCell"), CFSTR("UITableViewCell"));

}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  char v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NotificationCellAccessibility;
  v2 = -[NotificationCellAccessibility accessibilityTraits](&v18, sel_accessibilityTraits);
  v17 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  AXPerformSafeBlock();
  v3 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    abort();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityIdentification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("UIPreferencesBlueCheck"));

  v8 = *MEMORY[0x24BDF7400];
  if (!v7)
    v8 = 0;
  v9 = v8 | v2;

  return v9;
}

void __52__NotificationCellAccessibility_accessibilityTraits__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_imageView:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
