@implementation DSDictionaryTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DSDictionaryTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("DUDefinitionDictionary"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("DSDictionaryTableCell"), CFSTR("PSTableCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DSDictionaryTableCell"), CFSTR("definitionDictionary"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DUDefinitionDictionary"), CFSTR("definitionLanguage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DSDictionaryTableCell"), CFSTR("updateLabels"), "v", 0);

}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DSDictionaryTableCellAccessibility;
  v3 = -[DSDictionaryTableCellAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[DSDictionaryTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "isHidden");
  v6 = *MEMORY[0x24BDF7400];
  if ((_DWORD)v4)
    v6 = 0;
  return v6 | v3;
}

- (void)updateLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DSDictionaryTableCellAccessibility;
  -[DSDictionaryTableCellAccessibility updateLabels](&v11, sel_updateLabels);
  v3 = (void *)MEMORY[0x24BDFEA60];
  objc_opt_class();
  -[DSDictionaryTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailTextLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axAttributedStringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DSDictionaryTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("definitionDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeStringForKey:", CFSTR("definitionLanguage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttribute:forKey:", v9, *MEMORY[0x24BDFEBE0]);

  -[DSDictionaryTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailTextLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v7);

}

@end
