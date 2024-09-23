@implementation UIVibrancyEffect(NCWidgetAdditions_PrivateDEPRECATED)

+ (id)widgetTertiaryVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BE64070], "_visualStylingProviderForStyleSetNamed:inBundle:", CFSTR("platterClientStyle"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_visualStylingForStyle:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)widgetQuaternaryVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BE64070], "_visualStylingProviderForStyleSetNamed:inBundle:", CFSTR("platterClientStyle"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_visualStylingForStyle:", 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)widgetPrimaryHighlightVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BE64070], "_visualStylingProviderForStyleSetNamed:inBundle:", CFSTR("platterClientStyle"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_visualStylingForStyleNamed:", CFSTR("platterClientPrimaryHighlight"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)widgetSecondaryHighlightVibrancyEffect
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BE64070], "_visualStylingProviderForStyleSetNamed:inBundle:", CFSTR("platterClientStyle"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_visualStylingForStyleNamed:", CFSTR("platterClientSecondaryHighlight"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
