@implementation TranslationCardAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SequoiaTranslator.TranslationCard");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.TranslationCard"), CFSTR("_axSourceLanguage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.TranslationCard"), CFSTR("_axSourceLanguageTranslationResult"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.TranslationCard"), CFSTR("_axTargetLanguage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.TranslationCard"), CFSTR("_axTargetLanguageTranslationResult"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.TranslationCard"), CFSTR("_axTranslationIsFavorited"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.TranslationCard"), CFSTR("_axCanPerformLookupAction"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.TranslationCard"), CFSTR("_axPerformFavoriteAction"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.TranslationCard"), CFSTR("_axPerformSpeakTranslationAction"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.TranslationCard"), CFSTR("_axPerformLookupAction"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.TranslationCard"), CFSTR("_axSenseHeader"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.TranslationCard"), CFSTR("senseTapped:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v17;

  v3 = (void *)MEMORY[0x24BDFEA60];
  -[TranslationCardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_axSourceLanguageTranslationResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axAttributedStringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TranslationCardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_axSourceLocale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)MEMORY[0x24BDFEB98];
  objc_msgSend(v5, "setAttribute:forKey:", v6, *MEMORY[0x24BDFEB98]);

  v8 = (void *)MEMORY[0x24BDFEA60];
  -[TranslationCardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_axTargetLanguageTranslationResult"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "axAttributedStringWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[TranslationCardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_axTargetLocale"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttribute:forKey:", v11, *v7);

  -[TranslationCardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_axSourceLanguage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TranslationCardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_axTargetLanguage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TranslationCardAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_axTranslationIsFavorited")))v14 = CFSTR("favorited");
  else
    v14 = &stru_2503BB0D8;
  accessibilityLocalizedString(v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)accessibilityCustomActions
{
  id v3;
  id v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc(MEMORY[0x24BDF6788]);
  if (-[TranslationCardAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_axTranslationIsFavorited")))v5 = CFSTR("remove.favorite.action");
  else
    v5 = CFSTR("favorite.action");
  accessibilityLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke;
  v18[3] = &unk_2503BAEF8;
  v18[4] = self;
  v8 = (void *)objc_msgSend(v4, "initWithName:actionHandler:", v6, v18);
  objc_msgSend(v3, "addObject:", v8);

  v9 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("speak.translation.action"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_3;
  v17[3] = &unk_2503BAEF8;
  v17[4] = self;
  v11 = (void *)objc_msgSend(v9, "initWithName:actionHandler:", v10, v17);
  objc_msgSend(v3, "addObject:", v11);

  if (-[TranslationCardAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_axCanPerformLookupAction")))
  {
    v12 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("lookup.word.action"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_5;
    v16[3] = &unk_2503BAEF8;
    v16[4] = self;
    v14 = (void *)objc_msgSend(v12, "initWithName:actionHandler:", v13, v16);
    objc_msgSend(v3, "addObject:", v14);

  }
  return v3;
}

uint64_t __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axPerformFavoriteAction");
}

uint64_t __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_3()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axPerformSpeakTranslationAction");
}

uint64_t __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_5()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __58__TranslationCardAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axPerformLookupAction");
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[TranslationCardAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_axSenseHeader"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[TranslationCardAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);
  -[TranslationCardAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_231);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

uint64_t __70__TranslationCardAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234922F70](CFSTR("SequoiaTranslator.SenseRow"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__TranslationCardAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)senseTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TranslationCardAccessibility;
  -[TranslationCardAccessibility senseTapped:](&v8, sel_senseTapped_, a3);
  v4 = (void *)MEMORY[0x24BDFEA60];
  -[TranslationCardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_axTargetLanguageTranslationResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axAttributedStringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TranslationCardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_axTargetLocale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttribute:forKey:", v7, *MEMORY[0x24BDFEB98]);

  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

@end
