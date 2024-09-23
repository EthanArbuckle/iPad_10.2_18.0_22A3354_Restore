@implementation CKConversationSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKConversationSearchResultCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationSearchResultCell"), CFSTR("searchCell"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CKConversationSearchResultCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("searchCell"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKConversationSearchResultCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CKConversationSearchResultCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
