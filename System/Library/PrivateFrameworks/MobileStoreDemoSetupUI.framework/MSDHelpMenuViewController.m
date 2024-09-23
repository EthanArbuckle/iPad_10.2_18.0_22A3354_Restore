@implementation MSDHelpMenuViewController

- (MSDHelpMenuViewController)init
{
  MSDHelpMenuViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDHelpMenuViewController;
  v2 = -[MSDHelpMenuViewController initWithStyle:](&v7, sel_initWithStyle_, 0);
  if (v2)
  {
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("HELP_HEADER"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDHelpMenuViewController setTitle:](v2, "setTitle:", v3);

    -[MSDHelpMenuViewController tableView](v2, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HelpMenuCell"));

    v5 = (void *)objc_opt_new();
    -[MSDHelpMenuViewController setHelpMenuUserTapped:](v2, "setHelpMenuUserTapped:", v5);

  }
  return v2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  if (objc_msgSend(v4, "row") <= 2)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("HelpMenuCell"));
    objc_msgSend(v5, "defaultContentConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "row"))
    {
      if (objc_msgSend(v4, "row") == 1)
      {
        v7 = CFSTR("LEARN_MORE_OPTION");
      }
      else
      {
        if (objc_msgSend(v4, "row") != 2)
        {
LABEL_10:
          objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "textProperties");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setFont:", v9);

          objc_msgSend(v5, "setContentConfiguration:", v6);
          objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setBackgroundColor:", v11);

          objc_msgSend(v5, "contentView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setLayoutMargins:", 20.0, 0.0, 20.0, 0.0);

          goto LABEL_11;
        }
        v7 = CFSTR("SUPPORT_OPTION");
      }
    }
    else
    {
      v7 = CFSTR("CANNOT_FIND_STORE_OPTION");
    }
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v8);

    goto LABEL_10;
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  BOOL v5;
  void *v6;
  MSDLearnMoreViewController *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v5 = objc_msgSend(v14, "row") <= 2;
  v6 = v14;
  if (v5)
  {
    if (objc_msgSend(v14, "row"))
    {
      if (objc_msgSend(v14, "row") == 1)
      {
        v7 = objc_alloc_init(MSDLearnMoreViewController);
        -[MSDHelpMenuViewController helpMenuUserTapped](self, "helpMenuUserTapped");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("Learn more about device assignment");
      }
      else
      {
        if (objc_msgSend(v14, "row") != 2)
        {
LABEL_11:
          +[MSDSetupUIController sharedInstance](MSDSetupUIController, "sharedInstance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSDHelpMenuViewController helpMenuUserTapped](self, "helpMenuUserTapped");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setHelpMenuRowSelection:", v13);

          v6 = v14;
          goto LABEL_12;
        }
        v7 = objc_alloc_init(MSDSupportViewController);
        -[MSDHelpMenuViewController helpMenuUserTapped](self, "helpMenuUserTapped");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("Get help from a support agent");
      }
    }
    else
    {
      v7 = objc_alloc_init(MSDDefaultStoreViewController);
      -[MSDHelpMenuViewController helpMenuUserTapped](self, "helpMenuUserTapped");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("I Can't find my store or company");
    }
    objc_msgSend(v8, "addObject:", v10);

    if (v7)
    {
      +[MSDSetupUIController sharedInstance](MSDSetupUIController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pushViewController:andRemoveTopmostView:", v7, 0);

    }
    goto LABEL_11;
  }
LABEL_12:

}

- (NSMutableSet)helpMenuUserTapped
{
  return self->_helpMenuUserTapped;
}

- (void)setHelpMenuUserTapped:(id)a3
{
  objc_storeStrong((id *)&self->_helpMenuUserTapped, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpMenuUserTapped, 0);
}

@end
