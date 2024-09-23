@implementation GKContactsIntegrationConsentViewController

- (void)viewDidLoad
{
  GKContactsIntegrationConsentViewController *v2;

  v2 = self;
  ContactsIntegrationConsentViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  GKContactsIntegrationConsentViewController *v4;

  v4 = self;
  ContactsIntegrationConsentViewController.viewWillAppear(_:)(a3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  GKContactsIntegrationConsentViewController *v4;

  v4 = self;
  ContactsIntegrationConsentViewController.viewIsAppearing(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  GKContactsIntegrationConsentViewController *v4;

  v4 = self;
  ContactsIntegrationConsentViewController.viewDidAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  GKContactsIntegrationConsentViewController *v4;

  v4 = self;
  ContactsIntegrationConsentViewController.viewWillDisappear(_:)(a3);

}

- (GKContactsIntegrationConsentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1AB7DAF90();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (GKContactsIntegrationConsentViewController *)ContactsIntegrationConsentViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (GKContactsIntegrationConsentViewController)initWithCoder:(id)a3
{
  return (GKContactsIntegrationConsentViewController *)ContactsIntegrationConsentViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GKContactsIntegrationConsentViewController____lazy_storage___contactsView));
}

@end
