@implementation ICASOnboardingScreenType

- (ICASOnboardingScreenType)initWithOnboardingScreenType:(int64_t)a3
{
  ICASOnboardingScreenType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASOnboardingScreenType;
  result = -[ICASOnboardingScreenType init](&v5, sel_init);
  if (result)
    result->_onboardingScreenType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASOnboardingScreenType onboardingScreenType](self, "onboardingScreenType", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("welcome");
  if (v3 == 2)
    return CFSTR("whatsNew");
  else
    return (id)v4;
}

- (int64_t)onboardingScreenType
{
  return self->_onboardingScreenType;
}

@end
