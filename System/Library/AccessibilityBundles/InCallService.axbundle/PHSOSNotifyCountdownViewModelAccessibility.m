@implementation PHSOSNotifyCountdownViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHSOSNotifyCountdownViewModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axAnnouncementString
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = -[PHSOSNotifyCountdownViewModelAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("countdown"));
  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("sos.notify.countdown.announcement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
