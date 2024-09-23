@implementation InCallControlButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.InCallControlButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.InCallControlButton"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ConversationKit.InCallControlButton"), CFSTR("cnkContentAlpha"), "CGFloat");

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  double v8;

  -[InCallControlButtonAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isUserInteractionEnabled"))
    {
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "_accessibilityViewIsVisible"))
      {
        -[InCallControlButtonAccessibility safeSwiftCGFloatForKey:](self, "safeSwiftCGFloatForKey:", CFSTR("cnkContentAlpha"));
        v5 = v8 > 0.0;
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  id v5;
  void *v7;
  void *v8;
  objc_super v9;

  -[InCallControlButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("viewAppButton")))
  {
    v4 = CFSTR("view.app");
LABEL_13:
    accessibilityLocalizedString(v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("openAppButton")))
  {
    v4 = CFSTR("open.app");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("tvRemoteButton")))
  {
    v4 = CFSTR("tv.remote");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("reviewButton")))
  {
    v4 = CFSTR("review.join.request");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("approveRequestButton")))
  {
LABEL_10:
    v4 = CFSTR("approve.join.request");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("dismissRequestButton")))
    goto LABEL_12;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("lmiApproveButton")))
    goto LABEL_10;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("lmiRejectButton")))
  {
LABEL_12:
    v4 = CFSTR("reject.join.request");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("kickMemberButton")))
  {
    v4 = CFSTR("kick.member");
    goto LABEL_13;
  }
  v9.receiver = self;
  v9.super_class = (Class)InCallControlButtonAccessibility;
  -[InCallControlButtonAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v5 = v7;
  }
  else
  {
    -[InCallControlButtonAccessibility _axGetLabelSubview](self, "_axGetLabelSubview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_14:

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InCallControlButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[InCallControlButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_axGetLabelSubview
{
  return (id)-[InCallControlButtonAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
}

@end
