@implementation WFBooleanSettingOperationResolutionResult

+ (id)successWithResolvedBooleanSettingOperation:(int64_t)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___WFBooleanSettingOperationResolutionResult;
  objc_msgSendSuper2(&v4, sel_successWithResolvedValue_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)confirmationRequiredWithBooleanSettingOperationToConfirm:(int64_t)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___WFBooleanSettingOperationResolutionResult;
  objc_msgSendSuper2(&v4, sel_confirmationRequiredWithValueToConfirm_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
