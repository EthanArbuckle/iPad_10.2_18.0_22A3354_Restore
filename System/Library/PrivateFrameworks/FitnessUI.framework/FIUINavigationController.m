@implementation FIUINavigationController

- (FIUINavigationController)initWithRootViewController:(id)a3
{
  FIUINavigationController *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FIUINavigationController;
  v3 = -[FIUINavigationController initWithRootViewController:](&v8, sel_initWithRootViewController_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "fu_sausageFontOfSize:", 18.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v4, *MEMORY[0x24BEBB360], 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUINavigationController navigationBar](v3, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitleTextAttributes:", v5);

  }
  return v3;
}

- (BOOL)shouldAutorotate
{
  void *v2;
  char v3;

  -[FIUINavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldAutorotate");

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  -[FIUINavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  void *v2;
  int64_t v3;

  -[FIUINavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredInterfaceOrientationForPresentation");

  return v3;
}

@end
