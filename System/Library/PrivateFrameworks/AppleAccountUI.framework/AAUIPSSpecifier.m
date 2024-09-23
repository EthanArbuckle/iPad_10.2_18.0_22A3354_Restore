@implementation AAUIPSSpecifier

+ (BOOL)_startSpinnerWithSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x1E0D80940]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setColor:", v5);

    objc_msgSend(v4, "startAnimating");
    objc_msgSend(v3, "setAccessoryView:", v4);

  }
  return v3 != 0;
}

+ (BOOL)_stopSpinnerWithSpecifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x1E0D80940]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "propertyForKey:", *MEMORY[0x1E0D807D0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessoryView:", v5);

  }
  return v4 != 0;
}

@end
