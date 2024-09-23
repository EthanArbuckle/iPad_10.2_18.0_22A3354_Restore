@implementation CKTranscriptMessageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptMessageCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptMessageCell"), CFSTR("setFailed:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptMessageCell"), CFSTR("failureButton"), "@", 0);

}

- (void)setFailed:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptMessageCellAccessibility;
  -[CKTranscriptMessageCellAccessibility setFailed:](&v6, sel_setFailed_, a3);
  -[CKTranscriptMessageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("failureButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("failure.button.text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  return 1;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[CKTranscriptMessageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("failureButton"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
