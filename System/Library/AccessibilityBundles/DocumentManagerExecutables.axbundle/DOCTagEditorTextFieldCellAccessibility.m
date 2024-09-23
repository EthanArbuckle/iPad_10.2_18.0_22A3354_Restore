@implementation DOCTagEditorTextFieldCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DOCTagEditorTextFieldCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DOCTagEditorTextFieldCell"), CFSTR("addTagView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DOCAddTagView"), CFSTR("_addNewTagLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  char v4;

  -[DOCTagEditorTextFieldCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("addTagView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("_addNewTagLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  return v4;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[DOCTagEditorTextFieldCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("addTagView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_addNewTagLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
