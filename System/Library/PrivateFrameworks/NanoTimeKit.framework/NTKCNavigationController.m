@implementation NTKCNavigationController

- (NTKCNavigationController)initWithRootViewController:(id)a3
{
  NTKCNavigationController *v3;
  NTKCNavigationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKCNavigationController;
  v3 = -[NTKCNavigationController initWithRootViewController:](&v6, sel_initWithRootViewController_, a3);
  v4 = v3;
  if (v3)
    -[NTKCNavigationController _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  id v4;

  -[NTKCNavigationController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BPSApplyStyleToNavBarOptions();

  -[NTKCNavigationController toolbar](self, "toolbar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  BPSApplyStyleToToolbar();

}

- (NTKCNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  NTKCNavigationController *v4;
  NTKCNavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKCNavigationController;
  v4 = -[NTKCNavigationController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[NTKCNavigationController _commonInit](v4, "_commonInit");
  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

@end
