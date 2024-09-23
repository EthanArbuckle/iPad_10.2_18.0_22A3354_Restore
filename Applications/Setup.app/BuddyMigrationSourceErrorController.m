@implementation BuddyMigrationSourceErrorController

- (BuddyMigrationSourceErrorController)initWithError:(id)a3
{
  id v3;
  BuddyMigrationSourceErrorController *v4;
  objc_super v6;
  id location[2];
  id v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyMigrationSourceErrorController;
  v8 = -[BuddyMigrationBaseErrorController initWithError:](&v6, "initWithError:", location[0]);
  objc_storeStrong(&v8, v8);
  if (v8)
    *((_BYTE *)v8 + 24) = 1;
  v4 = (BuddyMigrationSourceErrorController *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (id)initForInsufficientSpace
{
  id v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMigrationSourceErrorController;
  location = -[BuddyMigrationBaseErrorController initForInsufficientSpace](&v4, "initForInsufficientSpace");
  objc_storeStrong(&location, location);
  if (location)
    *((_BYTE *)location + 24) = 1;
  v2 = location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)loadView
{
  id v2;
  NSError *v3;
  id v4;
  id v5;
  NSError *v6;
  id v7;
  BuddyMigrationSourceErrorController *v8;
  NSBundle *v9;
  NSString *v10;
  objc_super v11;
  SEL v12;
  BuddyMigrationSourceErrorController *v13;

  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)BuddyMigrationSourceErrorController;
  -[BuddyMigrationSourceErrorController loadView](&v11, "loadView");
  v2 = -[BuddyMigrationSourceErrorController headerView](v13, "headerView");
  v3 = -[BuddyMigrationBaseErrorController error](v13, "error");
  v4 = +[BuddyMigrationError titleForError:](BuddyMigrationError, "titleForError:", v3);
  objc_msgSend(v2, "setTitle:", v4);

  v5 = -[BuddyMigrationSourceErrorController headerView](v13, "headerView");
  v6 = -[BuddyMigrationBaseErrorController error](v13, "error");
  v7 = +[BuddyMigrationError detailTextForErrorOnSource:](BuddyMigrationError, "detailTextForErrorOnSource:", v6);
  objc_msgSend(v5, "setDetailText:", v7);

  if (-[BuddyMigrationSourceErrorController allowInteraction](v13, "allowInteraction"))
  {
    v8 = v13;
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v13));
    v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Migration"));
    -[BuddyWelcomeController addBoldButton:action:](v8, "addBoldButton:action:", v10, "continueTapped:");

  }
}

- (void)continueTapped:(id)a3
{
  BuddyMiscState *v3;
  BuddyMigrationLockscreenController *v4;
  BFFFlowItemDelegate *v5;
  id location[2];
  BuddyMigrationSourceErrorController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMigrationSourceErrorController miscState](v7, "miscState");
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

- (BOOL)controllerAllowsNavigatingBack
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

- (BOOL)allowInteraction
{
  return self->_allowInteraction;
}

- (void)setAllowInteraction:(BOOL)a3
{
  self->_allowInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miscState, 0);
}

@end
