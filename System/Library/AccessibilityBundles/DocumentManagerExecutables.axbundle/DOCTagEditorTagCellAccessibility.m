@implementation DOCTagEditorTagCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DOCTagEditorTagCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DOCTagEditorTagCell"), CFSTR("_tagView"), "DOCLargeTagView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DOCTagEditorTagCell"), CFSTR("_mixedSelection"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DOCLargeTagView"), CFSTR("tagNameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("DOCTagEditorTagCell"), CFSTR("UICollectionViewCell"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[DOCTagEditorTagCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tagView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("tagNameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[DOCTagEditorTagCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (id)accessibilityValue
{
  void *v2;

  if (-[DOCTagEditorTagCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_mixedSelection")))
  {
    accessibilityLocalizedString(CFSTR("mixed.selected"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
