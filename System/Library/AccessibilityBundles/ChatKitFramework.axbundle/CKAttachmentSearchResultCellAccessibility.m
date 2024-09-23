@implementation CKAttachmentSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAttachmentSearchResultCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axContact
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetContact:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAttachmentSearchResultCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAttachmentSearchResultCell"), CFSTR("dateLabel"), "@", 0);

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
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  -[CKAttachmentSearchResultCellAccessibility _axContact](self, "_axContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXCKLocalizedFromStringWithContact(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAttachmentSearchResultCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAttachmentSearchResultCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dateLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("search.item.attachment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
