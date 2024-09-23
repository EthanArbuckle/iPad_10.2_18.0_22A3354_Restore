@implementation APEducationVCPresentingViewController

- (void)presentEducationViewController:(id)a3
{
  id v4;
  APEducationVCPresentingViewController *v5;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_setModalInPresentation_, 1);
  -[APEducationVCPresentingViewController presentViewController:animated:completion:](v5, sel_presentViewController_animated_completion_, v4, objc_msgSend(v4, sel_wantsAnimatedPresentation), 0);

}

- (void)loadView
{
  id v3;
  APEducationVCPresentingViewController *v4;
  id v5;

  v3 = objc_allocWithZone(MEMORY[0x24BEBDB00]);
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  -[APEducationVCPresentingViewController setView:](v4, sel_setView_, v5);

}

- (APEducationVCPresentingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  APEducationVCPresentingViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_2362FF944();
    v6 = a4;
    v7 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)APEducationVCPresentingViewController;
  v9 = -[APEducationVCPresentingViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (APEducationVCPresentingViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APEducationVCPresentingViewController;
  return -[APEducationVCPresentingViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

@end
