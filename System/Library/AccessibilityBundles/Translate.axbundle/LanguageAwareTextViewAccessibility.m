@implementation LanguageAwareTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SequoiaTranslator.LanguageAwareTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SequoiaTranslator.LanguageAwareTextView"), CFSTR("locale"), "@", 0);
}

- (id)accessibilityLanguage
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  objc_super v8;

  -[LanguageAwareTextViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("locale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "localeIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXLogAppAccessibility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[LanguageAwareTextViewAccessibility accessibilityLanguage].cold.1((uint64_t)v3, (uint64_t)self, v5);

    v8.receiver = self;
    v8.super_class = (Class)LanguageAwareTextViewAccessibility;
    -[LanguageAwareTextViewAccessibility accessibilityLanguage](&v8, sel_accessibilityLanguage);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;

  return v6;
}

- (void)accessibilityLanguage
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_232B15000, log, OS_LOG_TYPE_DEBUG, "Expected locale property to be of type NSLocale. was: %@. self=%@", (uint8_t *)&v3, 0x16u);
}

@end
