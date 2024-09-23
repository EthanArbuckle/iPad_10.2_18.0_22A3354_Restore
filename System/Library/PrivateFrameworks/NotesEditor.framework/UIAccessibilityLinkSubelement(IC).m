@implementation UIAccessibilityLinkSubelement(IC)

- (id)supportedRotorTypes
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("ICAccessibilityRotorTypeLinks");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityCustomRotors
{
  void *v0;
  void *v1;

  +[ICAccessibilityCustomRotorController sharedInstance](ICAccessibilityCustomRotorController, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sharedTextViewRotors");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
