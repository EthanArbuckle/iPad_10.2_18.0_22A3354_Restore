@implementation UITableViewCell

+ (double)safari_defaultHeightOfTrivialInstance
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  double v4;

  v0 = (objc_class *)objc_opt_self();
  v1 = (void *)safari_defaultHeightOfTrivialInstance_cellForMeasurement;
  if (!safari_defaultHeightOfTrivialInstance_cellForMeasurement)
  {
    v2 = objc_msgSend([v0 alloc], "initWithStyle:reuseIdentifier:", 3, 0);
    v3 = (void *)safari_defaultHeightOfTrivialInstance_cellForMeasurement;
    safari_defaultHeightOfTrivialInstance_cellForMeasurement = v2;

    v1 = (void *)safari_defaultHeightOfTrivialInstance_cellForMeasurement;
  }
  objc_msgSend(v1, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  return v4;
}

- (void)safari_setLinkedPageTitle:(uint64_t)a3 description:
{
  if (a1)
    return (void *)objc_msgSend(a1, "_safari_setLinkedPageTitle:description:", a2, a3);
  return a1;
}

- (void)safari_setLinkedPageTitle:(uint64_t)a3 URL:
{
  if (a1)
    return (void *)objc_msgSend(a1, "_safari_setLinkedPageTitle:URL:", a2, a3);
  return a1;
}

- (void)safari_setCompletionIcon:(void *)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a1)
  {
    objc_msgSend(a1, "imageView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0DC3870];
    systemImageNameForCompletionIcon(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "systemImageNamed:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredSymbolConfiguration:", v7);

  }
}

@end
