@implementation EKUIDeleteAlertController

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  -[EKUIDeleteAlertController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKUIDeleteAlertController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportedInterfaceOrientations");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EKUIDeleteAlertController;
    return -[EKUIDeleteAlertController supportedInterfaceOrientations](&v7, sel_supportedInterfaceOrientations);
  }
}

@end
