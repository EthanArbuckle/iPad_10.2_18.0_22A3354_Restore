@implementation QRCodeItem

- (void)didTapDone
{
  void *v2;

  v2 = *(void **)self->viewController;
  if (v2)
    objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

@end
