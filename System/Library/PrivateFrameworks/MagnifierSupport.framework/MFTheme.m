@implementation MFTheme

+ (Class)visualEffectClassAllowingBlur:(BOOL)a3
{
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)visualEffectViewAllowingBlur:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_msgSend(a1, "visualEffectClassAllowingBlur:", a3));
  objc_msgSend(a1, "defaultBlurEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithEffect:", v5);

  objc_msgSend(v6, "_setGroupName:", CFSTR("default-background-group"));
  return v6;
}

+ (id)visualEffectViewAllowingBlur:(BOOL)a3 withBlurEffect:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "visualEffectClassAllowingBlur:", v4)), "initWithEffect:", v6);

  objc_msgSend(v7, "_setGroupName:", CFSTR("default-background-group"));
  return v7;
}

+ (id)defaultBlurEffect
{
  return (id)objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 1100);
}

@end
