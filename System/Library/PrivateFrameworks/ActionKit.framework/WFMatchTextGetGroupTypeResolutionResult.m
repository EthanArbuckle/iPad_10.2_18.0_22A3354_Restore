@implementation WFMatchTextGetGroupTypeResolutionResult

+ (id)successWithResolvedMatchTextGetGroupType:(int64_t)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___WFMatchTextGetGroupTypeResolutionResult;
  objc_msgSendSuper2(&v4, sel_successWithResolvedValue_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)confirmationRequiredWithMatchTextGetGroupTypeToConfirm:(int64_t)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___WFMatchTextGetGroupTypeResolutionResult;
  objc_msgSendSuper2(&v4, sel_confirmationRequiredWithValueToConfirm_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
