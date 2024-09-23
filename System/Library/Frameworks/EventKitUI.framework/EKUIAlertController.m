@implementation EKUIAlertController

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  if (self->_prohibitsRotation)
  {
    -[EKUIAlertController view](self, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "interfaceOrientation");

    return 1 << v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EKUIAlertController;
    return -[EKUIAlertController supportedInterfaceOrientations](&v7, sel_supportedInterfaceOrientations);
  }
}

- (void)setProhibitsRotation:(BOOL)a3
{
  if (self->_prohibitsRotation != a3)
  {
    self->_prohibitsRotation = a3;
    -[EKUIAlertController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  }
}

- (BOOL)prohibitsRotation
{
  return self->_prohibitsRotation;
}

@end
