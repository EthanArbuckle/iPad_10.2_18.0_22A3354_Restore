@implementation WFAskForInputNumberAnswerResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___WFAskForInputNumberAnswerResolutionResult;
  objc_msgSendSuper2(&v4, sel_unsupportedWithReason_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
