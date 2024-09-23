@implementation ISInternationalViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ISInternationalViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ISInternationalViewController"), CFSTR("updateCell: forPreferredLanguageAtIndex:"), "v", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ISInternationalViewController"), CFSTR("updatedAppleLanguages"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ISInternationalViewController"), CFSTR("tableView: cellForRowAtIndexPath:"), "@", "@", "@", 0);

}

- (void)updateCell:(id)a3 forPreferredLanguageAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISInternationalViewControllerAccessibility;
  -[ISInternationalViewControllerAccessibility updateCell:forPreferredLanguageAtIndex:](&v10, sel_updateCell_forPreferredLanguageAtIndex_, v6, a4);
  -[ISInternationalViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("updatedAppleLanguages"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v8, "count") > a4)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilitySetIdentification:", CFSTR("LanguageCell"));
    objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("axLanguage"));

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ISInternationalViewControllerAccessibility;
  -[ISInternationalViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v20, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "section"))
  {
    v9 = 0;
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexForIndexPath:", v7);

    objc_opt_class();
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = 0;
    AXPerformSafeBlock();
    v11 = (id)v15[5];
    _Block_object_dispose(&v14, 8);

    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "name");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("pt")))
  {

    v9 = CFSTR("pt-BR");
  }
  objc_msgSend(v8, "accessibilitySetIdentification:", CFSTR("LanguageCell"));
  objc_msgSend(v8, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("axLanguage"));

  return v8;
}

void __78__ISInternationalViewControllerAccessibility_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_specifiers"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
