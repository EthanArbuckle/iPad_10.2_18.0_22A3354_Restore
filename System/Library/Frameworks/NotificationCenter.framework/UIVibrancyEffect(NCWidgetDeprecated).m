@implementation UIVibrancyEffect(NCWidgetDeprecated)

+ (id)widgetPrimaryVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BE64070], "_visualStylingProviderForStyleSetNamed:inBundle:", CFSTR("platterClientStyle"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_visualStylingForStyle:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)widgetSecondaryVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BE64070], "_visualStylingProviderForStyleSetNamed:inBundle:", CFSTR("platterClientStyle"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_visualStylingForStyle:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)notificationCenterVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6F88];
  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectForBlurEffect:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
