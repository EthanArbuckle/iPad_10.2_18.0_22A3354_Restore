@implementation MCUINavigationViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCUINavigationViewController;
  -[MCUINavigationViewController viewDidLoad](&v4, sel_viewDidLoad);
  if (MCUIForPairedDevice())
  {
    -[MCUINavigationViewController navigationBar](self, "navigationBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    BPSApplyStyleToNavBar();

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD, _QWORD);
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)MCUINavigationViewController;
  -[MCUINavigationViewController didShowViewController:animated:](&v7, sel_didShowViewController_animated_, a3);
  -[MCUINavigationViewController showViewControllerCompletionBlock](self, "showViewControllerCompletionBlock");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[MCUINavigationViewController setShowViewControllerCompletionBlock:](self, "setShowViewControllerCompletionBlock:", 0);
  if (v6)
    v6[2](v6, v4);

}

- (id)showViewControllerCompletionBlock
{
  return self->_showViewControllerCompletionBlock;
}

- (void)setShowViewControllerCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_showViewControllerCompletionBlock, 0);
}

@end
