@implementation ICHelpViewNavigationController

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (!v4)
    return 2;
  v6.receiver = self;
  v6.super_class = (Class)ICHelpViewNavigationController;
  return -[ICHelpViewNavigationController supportedInterfaceOrientations](&v6, sel_supportedInterfaceOrientations);
}

@end
