@implementation MFCollapsedMessageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFCollapsedMessageCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFCollapsedMessageCell"), CFSTR("verticalStatusIndicatorManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFCollapsedMessageCell"), CFSTR("horizontalStatusIndicatorManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageViewStatusIndicatorManager"), CFSTR("statusIndicatorImageViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFCollapsedMessageCell"), CFSTR("senderOrSubjectLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFCollapsedMessageCell"), CFSTR("timestampLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFCollapsedMessageCell"), CFSTR("summaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MailActionViewHeader"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MailActionViewHeader"), CFSTR("MFCollapsedMessageCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFCollapsedMessageCell"), CFSTR("UICollectionViewCell"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  char isKindOfClass;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFCollapsedMessageCellAccessibility;
  v2 = -[MFCollapsedMessageCellAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  NSClassFromString(CFSTR("MailActionViewHeader"));
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = *MEMORY[0x24BDF73C0];
  if ((isKindOfClass & 1) == 0)
    v4 = 0;
  return v4 | v2;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;

  NSClassFromString(CFSTR("MailActionViewHeader"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MFCollapsedMessageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("senderOrSubjectLabel"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[MFCollapsedMessageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("summaryLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    accessibilityApproximateVisibleSummaryText(self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    -[MFCollapsedMessageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("verticalStatusIndicatorManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeValueForKey:", CFSTR("statusIndicatorImageViews"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x234914D6C](v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    -[MFCollapsedMessageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("horizontalStatusIndicatorManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeValueForKey:", CFSTR("statusIndicatorImageViews"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x234914D6C](v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    __UIAccessibilityCastAsSafeCategory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityMessageIndexDescription", v19, CFSTR("__AXStringForVariablesSentinel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("conversation.cell.collapsed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFCollapsedMessageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("senderOrSubjectLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFCollapsedMessageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timestampLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFCollapsedMessageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("summaryLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  NSClassFromString(CFSTR("MailActionViewHeader"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)MFCollapsedMessageCellAccessibility;
    -[MFCollapsedMessageCellAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("conversation.cell.collapsed.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFCollapsedMessageCellAccessibility;
  -[MFCollapsedMessageCellAccessibility prepareForReuse](&v3, sel_prepareForReuse);
  -[MFCollapsedMessageCellAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("ApproximateVisibleSummary"));
}

@end
