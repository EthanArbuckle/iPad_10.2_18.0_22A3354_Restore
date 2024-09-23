@implementation PSSpecifier(CoreFollowUpUI)

- (void)fl_startSpinner
{
  void *v1;
  id v2;

  objc_msgSend(a1, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v1, "startAnimating");
  objc_msgSend(v2, "setAccessoryView:", v1);

}

- (void)fl_stopSpinner
{
  id v1;

  objc_msgSend(a1, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAccessoryView:", 0);

}

@end
