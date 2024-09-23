@implementation BuddyMigrationDisconnectController

- (BuddyMigrationDisconnectController)initWithConnectionType:(int64_t)a3 cancel:(id)a4
{
  id v4;
  id v5;
  void *v6;
  BuddyMigrationDisconnectController *v7;
  objc_super v9;
  id location;
  int64_t v11;
  SEL v12;
  id v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v13;
  v13 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)BuddyMigrationDisconnectController;
  v13 = -[BuddyMigrationBaseDisconnectController initWithConnectionType:](&v9, "initWithConnectionType:", v11);
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    v5 = objc_retainBlock(location);
    v6 = (void *)*((_QWORD *)v13 + 2);
    *((_QWORD *)v13 + 2) = v5;

  }
  v7 = (BuddyMigrationDisconnectController *)v13;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v13, 0);
  return v7;
}

- (void)viewDidLoad
{
  BuddyMigrationDisconnectController *v2;
  NSBundle *v3;
  NSString *v4;
  objc_super v5;
  SEL v6;
  BuddyMigrationDisconnectController *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyMigrationDisconnectController;
  -[BuddyMigrationBaseDisconnectController viewDidLoad](&v5, "viewDidLoad");
  v2 = v7;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v2, "addBoldButton:action:", v4, "cancelTapped:");

}

- (void)cancelTapped:(id)a3
{
  void (**v3)(_QWORD);
  id location[2];
  BuddyMigrationDisconnectController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(_QWORD))-[BuddyMigrationDisconnectController cancelBlock](v5, "cancelBlock");
  v3[2](v3);

  objc_storeStrong(location, 0);
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
}

@end
