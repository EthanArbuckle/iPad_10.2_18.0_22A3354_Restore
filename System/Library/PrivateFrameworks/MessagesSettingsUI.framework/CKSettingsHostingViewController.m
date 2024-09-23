@implementation CKSettingsHostingViewController

- (void)viewDidLoad
{
  CKSettingsHostingViewController *v2;

  v2 = self;
  CKSettingsHostingViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  CKSettingsHostingViewController *v2;

  v2 = self;
  CKSettingsHostingViewController.viewDidLayoutSubviews()();

}

- (CKSettingsHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  CKSettingsHostingViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_24192BA28();
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKSettingsHostingViewController_hostedViewController) = 0;
    v6 = a4;
    v7 = (void *)sub_24192BA1C();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKSettingsHostingViewController_hostedViewController) = 0;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)CKSettingsHostingViewController;
  v9 = -[CKSettingsHostingViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (CKSettingsHostingViewController)initWithCoder:(id)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKSettingsHostingViewController_hostedViewController) = 0;
  v4.receiver = self;
  v4.super_class = (Class)CKSettingsHostingViewController;
  return -[CKSettingsHostingViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKSettingsHostingViewController_hostedViewController));
}

@end
