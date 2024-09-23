@implementation iFBANonParticipantViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)iFBANonParticipantViewController;
  -[FBASimpleTextNoticeController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBANonParticipantViewController appleSeedWebsiteButton](self, "appleSeedWebsiteButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "titleLabel"));
  objc_msgSend(v4, "setTextAlignment:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iFBANonParticipantViewController developerWebsiteButton](self, "developerWebsiteButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
  objc_msgSend(v6, "setTextAlignment:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[iFBANonParticipantViewController signOutButton](self, "signOutButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleLabel"));
  objc_msgSend(v8, "setTextAlignment:", 1);

}

- (void)didTapAppleSeedWebsite:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBKSharedConstants portalURL](FBKSharedConstants, "portalURL"));
  objc_msgSend(v4, "openURL:options:completionHandler:", v3, &__NSDictionary0__struct, 0);

}

- (void)didTapDeveloperWebsite:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBKSharedConstants developerURL](FBKSharedConstants, "developerURL"));
  objc_msgSend(v4, "openURL:options:completionHandler:", v3, &__NSDictionary0__struct, 0);

}

- (void)didTapSignOut:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "loginManager"));
  objc_msgSend(v5, "logOut");

  +[FBKFileManager deleteAllDraftDirectories](FBKFileManager, "deleteAllDraftDirectories");
  -[iFBANonParticipantViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &stru_1000E7458);
}

- (UIButton)appleSeedWebsiteButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_appleSeedWebsiteButton);
}

- (void)setAppleSeedWebsiteButton:(id)a3
{
  objc_storeWeak((id *)&self->_appleSeedWebsiteButton, a3);
}

- (UIButton)developerWebsiteButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_developerWebsiteButton);
}

- (void)setDeveloperWebsiteButton:(id)a3
{
  objc_storeWeak((id *)&self->_developerWebsiteButton, a3);
}

- (UIButton)signOutButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_signOutButton);
}

- (void)setSignOutButton:(id)a3
{
  objc_storeWeak((id *)&self->_signOutButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_signOutButton);
  objc_destroyWeak((id *)&self->_developerWebsiteButton);
  objc_destroyWeak((id *)&self->_appleSeedWebsiteButton);
}

@end
