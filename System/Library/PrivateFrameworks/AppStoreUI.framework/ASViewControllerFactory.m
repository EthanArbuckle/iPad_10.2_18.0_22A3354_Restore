@implementation ASViewControllerFactory

- (id)newNetworkLockoutViewControllerWithSection:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8D68]), "initWithSection:", a3);
  objc_msgSend(v3, "setLocalizationBundle:", objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()));
  return v3;
}

- (id)newPlaceholderViewController
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEC8D70]);
  objc_msgSend(v2, "setDefaultBackgroundGradient:", objc_msgSend(MEMORY[0x24BEC8D08], "gradientWithColor:", objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor")));
  return v2;
}

@end
