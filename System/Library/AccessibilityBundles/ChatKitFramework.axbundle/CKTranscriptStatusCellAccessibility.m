@implementation CKTranscriptStatusCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptStatusCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CKTranscriptStatusCell"), CFSTR("statusButton"), "@", 0);
}

+ (id)statusButton
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKTranscriptStatusCellAccessibility;
  objc_msgSendSuper2(&v4, sel_statusButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilitySetIdentification:", CFSTR("CKTranscriptStatusButton"));
  return v2;
}

@end
