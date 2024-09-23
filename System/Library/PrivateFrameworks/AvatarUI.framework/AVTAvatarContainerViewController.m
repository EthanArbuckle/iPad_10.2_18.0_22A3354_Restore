@implementation AVTAvatarContainerViewController

- (void)willMoveToParentViewController:(id)a3
{
  id v3;

  if (!a3)
  {
    -[AVTAvatarContainerViewController presentedViewController](self, "presentedViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

@end
