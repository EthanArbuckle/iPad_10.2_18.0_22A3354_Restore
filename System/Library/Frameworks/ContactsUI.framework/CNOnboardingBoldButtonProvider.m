@implementation CNOnboardingBoldButtonProvider

- (id)boldAlternateButton
{
  return (id)objc_msgSend(MEMORY[0x1E0D65138], "boldAlternateButton");
}

- (id)boldButton
{
  return (id)objc_msgSend(MEMORY[0x1E0D65138], "boldButton");
}

@end
