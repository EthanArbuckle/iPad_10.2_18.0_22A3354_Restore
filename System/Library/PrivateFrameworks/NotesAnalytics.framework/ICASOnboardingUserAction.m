@implementation ICASOnboardingUserAction

- (ICASOnboardingUserAction)initWithOnboardingUserAction:(int64_t)a3
{
  ICASOnboardingUserAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASOnboardingUserAction;
  result = -[ICASOnboardingUserAction init](&v5, sel_init);
  if (result)
    result->_onboardingUserAction = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASOnboardingUserAction onboardingUserAction](self, "onboardingUserAction", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("continue");
  if (v3 == 2)
    return CFSTR("viewFeaturesLinkTap");
  else
    return (id)v4;
}

- (int64_t)onboardingUserAction
{
  return self->_onboardingUserAction;
}

@end
