@implementation CKNanoDateLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNanoDateLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CKNanoDateLabel"), CFSTR("UILabel"));
}

- (id)accessibilityLabel
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDFEA60]);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithString:", v4);

  objc_msgSend(v5, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB00]);
  return v5;
}

@end
