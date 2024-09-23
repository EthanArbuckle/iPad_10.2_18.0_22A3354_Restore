@implementation CKPhoneTranscriptMessageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKPhoneTranscriptMessageCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
