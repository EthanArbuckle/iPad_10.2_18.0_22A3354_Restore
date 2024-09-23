@implementation HKUnitPreferenceControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKUnitPreferenceController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKUnitPreferenceController"), CFSTR("unitForDisplayType:"), "@", 0);
}

- (id)accessibilityNameForUnit:(id)a3
{
  id v3;
  void *v4;
  char v5;
  __CFString *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "unitString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("mi"));

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("miles");
  }
  else
  {
    objc_msgSend(v3, "unitString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("km"));

    if (!v8)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v6 = CFSTR("kilometers");
  }
  accessibilityLocalizedString(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v9;
}

- (id)accessibilityNameForDisplayType:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  char v17;

  v4 = a3;
  v17 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v10 = MEMORY[0x24BDAC760];
  v5 = v4;
  AXPerformSafeBlock();
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    abort();
  -[HKUnitPreferenceControllerAccessibility accessibilityNameForUnit:](self, "accessibilityNameForUnit:", v7, v10, 3221225472, __75__HKUnitPreferenceControllerAccessibility_accessibilityNameForDisplayType___block_invoke, &unk_25022AD80, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __75__HKUnitPreferenceControllerAccessibility_accessibilityNameForDisplayType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "unitForDisplayType:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
