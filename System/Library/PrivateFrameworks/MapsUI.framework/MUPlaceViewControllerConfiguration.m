@implementation MUPlaceViewControllerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  MUPlaceViewControllerConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(MUPlaceViewControllerConfiguration);
  -[MUPlaceViewControllerConfiguration contactsNavigationController](self, "contactsNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewControllerConfiguration setContactsNavigationController:](v4, "setContactsNavigationController:", v5);

  -[MUPlaceViewControllerConfiguration contactsViewController](self, "contactsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewControllerConfiguration setContactsViewController:](v4, "setContactsViewController:", v6);

  -[MUPlaceViewControllerConfiguration headerViewController](self, "headerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceViewControllerConfiguration setHeaderViewController:](v4, "setHeaderViewController:", v7);

  -[MUPlaceViewControllerConfiguration setOptions:](v4, "setOptions:", -[MUPlaceViewControllerConfiguration options](self, "options"));
  return v4;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSString)effectiveBundleIdentifier
{
  return self->_effectiveBundleIdentifier;
}

- (void)setEffectiveBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CNContactViewControllerPrivateDelegate)contactsNavigationController
{
  return (CNContactViewControllerPrivateDelegate *)objc_loadWeakRetained((id *)&self->_contactsNavigationController);
}

- (void)setContactsNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_contactsNavigationController, a3);
}

- (CNContactViewController)contactsViewController
{
  return self->_contactsViewController;
}

- (void)setContactsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contactsViewController, a3);
}

- (UIViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_headerViewController, a3);
}

- (GEOApplicationAuditToken)developerPlaceCardAuditToken
{
  return self->_developerPlaceCardAuditToken;
}

- (void)setDeveloperPlaceCardAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_developerPlaceCardAuditToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerPlaceCardAuditToken, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_contactsViewController, 0);
  objc_destroyWeak((id *)&self->_contactsNavigationController);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
}

@end
