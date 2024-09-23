@implementation WFWeatherAttributionAccessResource

- (unint64_t)status
{
  return 4;
}

- (id)icon
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x24BEC14E0]);
  -[objc_class sharedAttribution](getWFAttributionClass(), "sharedAttribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceAttributionImageForStyle:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithPlatformImage:", v4);

  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRed:green:blue:alpha:", 0.121568628, 0.301960796, 0.611764729, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintedImageWithColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)name
{
  return WFLocalizedString(CFSTR("Weather data sources"));
}

@end
