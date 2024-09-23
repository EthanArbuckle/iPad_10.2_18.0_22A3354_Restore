@implementation CKTranscriptBalloonCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptBalloonCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKTranscriptBalloonCell"), CFSTR("CKEditableCollectionViewCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKEditableCollectionViewCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKTranscriptBalloonCell"), CFSTR("CKTranscriptMessageCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptMessageCell"), CFSTR("failureButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEditableCollectionViewCell"), CFSTR("updateCheckmarkImage"), "v", 0);

}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)-[CKTranscriptBalloonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_balloonView"));
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CKTranscriptBalloonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_balloonView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  void *v2;
  char v3;

  -[CKTranscriptBalloonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_balloonView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilitySupportsActivateAction");

  return v3;
}

- (id)accessibilityCustomRotors
{
  void *v2;
  void *v3;

  -[CKTranscriptBalloonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_balloonView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomRotors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)accessibilityActivate
{
  void *v2;
  char v3;

  -[CKTranscriptBalloonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_balloonView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityActivate");

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CKTranscriptBalloonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_balloonView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;

  -[CKTranscriptBalloonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_balloonView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("failureButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!objc_msgSend(v7, "_accessibilityAutomationHitTest"))
    goto LABEL_3;
  -[CKTranscriptBalloonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_balloonView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_balloonView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonCellAccessibility convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
  objc_msgSend(v8, "_accessibilityHitTest:withEvent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_3:
    v12.receiver = self;
    v12.super_class = (Class)CKTranscriptBalloonCellAccessibility;
    -[CKTranscriptBalloonCellAccessibility _accessibilityHitTest:withEvent:](&v12, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)updateCheckmarkImage
{
  void *v3;
  _QWORD *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptBalloonCellAccessibility;
  -[CKTranscriptBalloonCellAccessibility updateCheckmarkImage](&v5, sel_updateCheckmarkImage);
  -[CKTranscriptBalloonCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_balloonView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[CKTranscriptBalloonCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isHighlighted")) & 1) != 0
    || -[CKTranscriptBalloonCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))
  {
    v4 = (_QWORD *)MEMORY[0x24BDF7400];
  }
  else
  {
    v4 = (_QWORD *)MEMORY[0x24BDF73E0];
  }
  objc_msgSend(v3, "setAccessibilityTraits:", *v4);

}

@end
