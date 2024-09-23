@implementation HUAddAccessoryUtilities

+ (id)addAccessoryString
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "addAccessoryLocalizationStringKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v2, v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)addAccessoryLocalizationStringKey
{
  if (MGGetBoolAnswer())
    return CFSTR("HUAddOrScanAccessory");
  else
    return CFSTR("HUAddAccessory");
}

@end
