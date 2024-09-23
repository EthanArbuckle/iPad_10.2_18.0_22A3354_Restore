@implementation MCInstallationConsentViewController

- (MCInstallationConsentViewController)initWithStyle:(int64_t)a3
{
  MCInstallationConsentViewController *v3;
  MCInstallationConsentViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCInstallationConsentViewController;
  v3 = -[MCUITableViewController initWithStyle:](&v6, sel_initWithStyle_, a3);
  v4 = v3;
  if (v3)
    -[MCInstallationConsentViewController _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MCInstallationConsentViewController;
  -[MCUITableViewController updateExtendedLayoutIncludesOpaqueBars](&v14, sel_updateExtendedLayoutIncludesOpaqueBars);
  -[MCInstallationConsentViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[MCInstallationWarningCell reuseIdentifier](MCInstallationWarningCell, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  if (self->_showInstall)
    v6 = CFSTR("INSTALL");
  else
    v6 = CFSTR("NEXT");
  MCUILocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("INSTALL_CONSENT_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCInstallationConsentViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelInstallProfile);
  -[MCInstallationConsentViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLeftBarButtonItem:", v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithTitle:style:target:action:", v7, 2, self, sel__installProfile);
  -[MCInstallationConsentViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

}

- (void)_cancelInstallProfile
{
  id v3;

  -[MCInstallationConsentViewController consentDelegate](self, "consentDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installationConsentViewController:finishedWithUserContinueResponse:", self, 0);

}

- (void)_installProfile
{
  id v3;

  -[MCInstallationConsentViewController consentDelegate](self, "consentDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installationConsentViewController:finishedWithUserContinueResponse:", self, 1);

}

- (void)setProfile:(id)a3
{
  MCProfile *v5;
  void *v6;
  MCProfile *v7;

  v5 = (MCProfile *)a3;
  if (self->_profile != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_profile, a3);
    -[MCInstallationConsentViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    v5 = v7;
  }

}

- (void)setShowInstall:(BOOL)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_showInstall != a3)
  {
    self->_showInstall = a3;
    if (a3)
      v4 = CFSTR("INSTALL");
    else
      v4 = CFSTR("NEXT");
    MCUILocalizedString(v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithTitle:style:target:action:", v7, 2, self, sel__installProfile);
    -[MCInstallationConsentViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  void *v4;
  double v5;
  double v6;

  -[MCInstallationConsentViewController tableView](self, "tableView", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowHeight");
  v6 = v5;

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[MCInstallationConsentViewController profile](self, "profile", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedConsentText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (!a4 && v7)
  {
    -[MCInstallationConsentViewController profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "organization");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCInstallationConsentViewController profile](self, "profile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
      objc_msgSend(v11, "organization");
    else
      objc_msgSend(v11, "friendlyName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3940];
    MCUILocalizedString(CFSTR("INSTALL_CONSENT_MESSAGE_FROM_%@"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  +[MCInstallationWarningCell reuseIdentifier](MCInstallationWarningCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCInstallationConsentViewController profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedConsentText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWarningLabelText:", v11);

  return v9;
}

- (MCProfile)profile
{
  return self->_profile;
}

- (MCInstallationConsentDelegate)consentDelegate
{
  return (MCInstallationConsentDelegate *)objc_loadWeakRetained((id *)&self->_consentDelegate);
}

- (void)setConsentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_consentDelegate, a3);
}

- (BOOL)showInstall
{
  return self->_showInstall;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_consentDelegate);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
