@implementation VMPlayerControlButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VMPlayerControlButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("VMPlayerControlButton"), CFSTR("_playerState"), "Q");
}

- (id)accessibilityLabel
{
  uint64_t v2;
  __CFString *v3;
  void *v4;

  v2 = -[VMPlayerControlButtonAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_playerState"));
  if (v2)
  {
    if (v2 != 1)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("pause.voicemail.button");
  }
  else
  {
    v3 = CFSTR("play.voicemail.button");
  }
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

@end
