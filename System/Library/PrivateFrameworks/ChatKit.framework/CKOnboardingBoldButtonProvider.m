@implementation CKOnboardingBoldButtonProvider

- (BOOL)shouldForceAlternateButton
{
  return 0;
}

- (id)boldAlternateButton
{
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x1E0D65140], "boldAlternateButton");
  else
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)boldButton
{
  if (-[CKOnboardingBoldButtonProvider shouldForceAlternateButton](self, "shouldForceAlternateButton"))
    -[CKOnboardingBoldButtonProvider boldAlternateButton](self, "boldAlternateButton");
  else
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
