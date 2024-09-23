@implementation FIUIPageViewControllerCell

- (void)setViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_viewController;
  UIViewController *v7;
  void *v8;
  UIViewController *v9;

  v5 = (UIViewController *)a3;
  p_viewController = &self->_viewController;
  if (*p_viewController != v5)
  {
    v9 = v5;
    v7 = *p_viewController;
    -[UIViewController willMoveToParentViewController:](v7, "willMoveToParentViewController:", 0);
    -[UIViewController view](v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[UIViewController removeFromParentViewController](v7, "removeFromParentViewController");
    objc_storeStrong((id *)p_viewController, a3);

    v5 = v9;
  }

}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
