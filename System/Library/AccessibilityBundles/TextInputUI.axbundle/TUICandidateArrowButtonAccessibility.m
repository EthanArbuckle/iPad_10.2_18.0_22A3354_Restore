@implementation TUICandidateArrowButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUICandidateArrowButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  int v3;
  __CFString *v4;

  objc_msgSend((id)MEMORY[0x2349226DC](CFSTR("UIKeyboardCandidateController"), a2), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isExtended"));

  if (v3)
    v4 = CFSTR("collapse.suggestions");
  else
    v4 = CFSTR("more.candidates");
  accessibilityLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
