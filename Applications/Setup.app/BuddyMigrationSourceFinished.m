@implementation BuddyMigrationSourceFinished

- (BuddyMigrationSourceFinished)init
{
  NSBundle *v3;
  NSString *v4;
  UIImage *v5;
  BuddyMigrationSourceFinished *v6;
  objc_super v8;
  SEL v9;
  id location;

  v9 = a2;
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("MIGRATION_SOURCE_TRANSFER_COMPLETE_TITLE"), &stru_100284738, CFSTR("Migration"));
  v5 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Checkmark"));
  location = 0;
  v8.receiver = self;
  v8.super_class = (Class)BuddyMigrationSourceFinished;
  location = -[BuddyMigrationSourceFinished initWithTitle:detailText:icon:](&v8, "initWithTitle:detailText:icon:", v4, &stru_100284738, v5);
  objc_storeStrong(&location, location);

  v6 = (BuddyMigrationSourceFinished *)location;
  objc_storeStrong(&location, 0);
  return v6;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  NSBundle *v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  id v10;
  id v11;
  BuddyMigrationSourceFinished *v12;
  NSBundle *v13;
  NSString *v14;
  char v15;
  NSString *v16;
  id location;
  objc_super v18;
  SEL v19;
  BuddyMigrationSourceFinished *v20;

  v20 = self;
  v19 = a2;
  v18.receiver = self;
  v18.super_class = (Class)BuddyMigrationSourceFinished;
  -[BuddyMigrationSourceFinished viewDidLoad](&v18, "viewDidLoad");
  v2 = -[BuddyMigrationSourceFinished headerView](v20, "headerView");
  objc_msgSend(v2, "setIconInheritsTint:", 1);

  v3 = -[BuddyMigrationSourceFinished navigationItem](v20, "navigationItem");
  objc_msgSend(v3, "setHidesBackButton:", 1);

  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v20));
  v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MIGRATION_SOURCE_TRANSFER_COMPLETE_DETAIL"));
  location = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("Migration"));

  v15 = 0;
  v7 = 0;
  if ((os_variant_has_internal_ui("com.apple.purplebuddy", v6) & 1) != 0)
  {
    v16 = -[BuddyMigrationSourceFinished internalStatistics](v20, "internalStatistics");
    v15 = 1;
    v7 = v16 != 0;
  }
  if ((v15 & 1) != 0)

  if (v7)
  {
    v8 = -[BuddyMigrationSourceFinished internalStatistics](v20, "internalStatistics");
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n\n%@"), location, v8);
    v10 = location;
    location = v9;

  }
  v11 = -[BuddyMigrationSourceFinished headerView](v20, "headerView");
  objc_msgSend(v11, "setDetailText:", location);

  v12 = v20;
  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v20));
  v14 = -[NSBundle localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Migration"));
  -[BuddyWelcomeController addBoldButton:action:](v12, "addBoldButton:action:", v14, "continueTapped:");

  objc_storeStrong(&location, 0);
}

- (void)continueTapped:(id)a3
{
  BuddyMiscState *v3;
  BuddyMigrationLockscreenController *v4;
  BFFFlowItemDelegate *v5;
  id location[2];
  BuddyMigrationSourceFinished *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMigrationSourceFinished miscState](v7, "miscState");
  v4 = -[BuddyMiscState migrationLockscreenController](v3, "migrationLockscreenController");
  -[BuddyMigrationLockscreenController deactivate](v4, "deactivate");

  v5 = -[BuddyWelcomeController delegate](v7, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v5, "flowItemDone:", v7);

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 0;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (NSString)internalStatistics
{
  return self->_internalStatistics;
}

- (void)setInternalStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_internalStatistics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalStatistics, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
}

@end
