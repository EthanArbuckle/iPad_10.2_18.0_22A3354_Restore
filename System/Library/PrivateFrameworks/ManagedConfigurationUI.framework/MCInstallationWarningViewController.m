@implementation MCInstallationWarningViewController

- (MCInstallationWarningViewController)initWithStyle:(int64_t)a3
{
  MCInstallationWarningViewController *v3;
  MCInstallationWarningViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCInstallationWarningViewController;
  v3 = -[MCUITableViewController initWithStyle:](&v6, sel_initWithStyle_, a3);
  v4 = v3;
  if (v3)
    -[MCInstallationWarningViewController _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MCInstallationWarningViewController;
  -[MCUITableViewController updateExtendedLayoutIncludesOpaqueBars](&v14, sel_updateExtendedLayoutIncludesOpaqueBars);
  -[MCInstallationWarningViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[MCInstallationWarningCell reuseIdentifier](MCInstallationWarningCell, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  MCUILocalizedString(CFSTR("INSTALL_WARNING_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCInstallationWarningViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelInstallProfile);
  -[MCInstallationWarningViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItem:", v8);

  v10 = objc_alloc(MEMORY[0x1E0CEA380]);
  MCUILocalizedString(CFSTR("INSTALL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v11, 2, self, sel__confirmInstallProfileIfNeeded);
  -[MCInstallationWarningViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

}

- (void)_cancelInstallProfile
{
  id v3;

  -[MCInstallationWarningViewController warningDelegate](self, "warningDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installationWarningViewController:finishedWithUserContinueResponse:", self, 0);

}

- (void)_installProfile
{
  id v3;

  -[MCInstallationWarningViewController warningDelegate](self, "warningDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installationWarningViewController:finishedWithUserContinueResponse:", self, 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[MCInstallationWarningViewController warnings](self, "warnings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[MCInstallationWarningViewController warnings](self, "warnings", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") > (unint64_t)a4;

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  void *v4;
  double v5;
  double v6;

  -[MCInstallationWarningViewController tableView](self, "tableView", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowHeight");
  v6 = v5;

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[MCInstallationWarningViewController warnings](self, "warnings", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a4)
  {
    v10 = 0;
  }
  else
  {
    -[MCInstallationWarningViewController warnings](self, "warnings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "localizedTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  +[MCInstallationWarningCell reuseIdentifier](MCInstallationWarningCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCInstallationWarningViewController warnings](self, "warnings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "section");

  objc_msgSend(v10, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "localizedBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWarningLabelText:", v13);

  return v9;
}

- (BOOL)isMDMInstall
{
  return self->_isMDMInstall;
}

- (void)setIsMDMInstall:(BOOL)a3
{
  self->_isMDMInstall = a3;
}

- (NSArray)warnings
{
  return self->_warnings;
}

- (void)setWarnings:(id)a3
{
  objc_storeStrong((id *)&self->_warnings, a3);
}

- (MCInstallationWarningDelegate)warningDelegate
{
  return (MCInstallationWarningDelegate *)objc_loadWeakRetained((id *)&self->_warningDelegate);
}

- (void)setWarningDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_warningDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_warningDelegate);
  objc_storeStrong((id *)&self->_warnings, 0);
}

@end
