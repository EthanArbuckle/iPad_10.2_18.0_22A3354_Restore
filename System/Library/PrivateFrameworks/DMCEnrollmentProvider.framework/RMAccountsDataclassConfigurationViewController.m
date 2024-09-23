@implementation RMAccountsDataclassConfigurationViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RMAccountsDataclassConfigurationViewController;
  -[ACUIDataclassConfigurationViewController viewDidLoad](&v3, sel_viewDidLoad);
  if (-[ACUIDataclassConfigurationViewController shouldShowDeleteAccountButton](self, "shouldShowDeleteAccountButton"))
    -[ACUIDataclassConfigurationViewController appendDeleteAccountButton](self, "appendDeleteAccountButton");
}

- (void)_reloadSpecifiersAndDeleteAccountButton
{
  -[RMAccountsDataclassConfigurationViewController reloadSpecifiers](self, "reloadSpecifiers");
  if (-[ACUIDataclassConfigurationViewController shouldShowDeleteAccountButton](self, "shouldShowDeleteAccountButton"))
    -[ACUIDataclassConfigurationViewController appendDeleteAccountButton](self, "appendDeleteAccountButton");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[ACUIDataclassConfigurationViewController specifierForAccountSummaryCell](self, "specifierForAccountSummaryCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BE75590];
    DMCLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupSpecifierWithName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[RMAccountsDataclassConfigurationViewController specifier](self, "specifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE00EB8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v5);
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v11, "addObject:", v8);
      objc_msgSend(v11, "addObjectsFromArray:", v10);
    }
    v12 = (objc_class *)objc_msgSend(v11, "copy");
    v13 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = v12;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)titleForDeleteButton
{
  return (id)DMCLocalizedString();
}

- (id)messageForAccountDeletionWarning
{
  return (id)DMCLocalizedStringByDevice();
}

- (Class)accountInfoControllerClass
{
  return (Class)objc_opt_class();
}

@end
