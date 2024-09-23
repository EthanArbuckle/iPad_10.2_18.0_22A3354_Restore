@implementation MTIntentRepeatDayResolutionResult

+ (id)successWithResolvedRepeatDay:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTIntentRepeatDayResolutionResult;
  objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)disambiguationWithRepeatDaysToDisambiguate:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTIntentRepeatDayResolutionResult;
  objc_msgSendSuper2(&v4, sel_disambiguationWithObjectsToDisambiguate_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)confirmationRequiredWithRepeatDayToConfirm:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTIntentRepeatDayResolutionResult;
  objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
