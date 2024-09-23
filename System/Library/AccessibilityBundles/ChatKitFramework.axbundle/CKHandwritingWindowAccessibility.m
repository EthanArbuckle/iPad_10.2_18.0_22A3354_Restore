@implementation CKHandwritingWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKHandwritingWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
