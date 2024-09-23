@implementation HFLocalizableStringKey(HREAdditions)

+ (id)hre_stringKeyWithKey:()HREAdditions argumentKeys:
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "stringKeyWithKey:argumentKeys:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hre_localizationBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStringLocalizationBlock:", v3);

  return v2;
}

+ (id)hre_stringKeyWithKey:()HREAdditions arguments:
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "stringKeyWithKey:arguments:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hre_localizationBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStringLocalizationBlock:", v3);

  return v2;
}

@end
