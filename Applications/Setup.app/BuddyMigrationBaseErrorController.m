@implementation BuddyMigrationBaseErrorController

- (BuddyMigrationBaseErrorController)initWithError:(id)a3
{
  id v3;
  UIImage *v4;
  BuddyMigrationBaseErrorController *v5;
  objc_super v7;
  id location[2];
  id v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v4 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Alert Icon"));
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)BuddyMigrationBaseErrorController;
  v9 = -[BuddyMigrationBaseErrorController initWithTitle:detailText:icon:](&v7, "initWithTitle:detailText:icon:", &stru_100284738, &stru_100284738, v4);
  objc_storeStrong(&v9, v9);

  if (v9)
    objc_storeStrong((id *)v9 + 2, location[0]);
  v5 = (BuddyMigrationBaseErrorController *)v9;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v5;
}

- (id)initForInsufficientSpace
{
  id v2;
  id v4[2];
  id location;

  location = self;
  v4[1] = (id)a2;
  v4[0] = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), 106, 0);
  location = objc_msgSend(location, "initWithError:", v4[0]);
  objc_storeStrong(&location, location);
  v2 = location;
  objc_storeStrong(v4, 0);
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewDidLoad
{
  id v2;
  UIColor *v3;
  id v4;
  id v5;
  objc_super v6;
  SEL v7;
  BuddyMigrationBaseErrorController *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMigrationBaseErrorController;
  -[BuddyMigrationBaseErrorController viewDidLoad](&v6, "viewDidLoad");
  v2 = -[BuddyMigrationBaseErrorController headerView](v8, "headerView");
  objc_msgSend(v2, "setIconInheritsTint:", 1);

  v3 = +[UIColor redColor](UIColor, "redColor");
  v4 = -[BuddyMigrationBaseErrorController headerView](v8, "headerView");
  objc_msgSend(v4, "setTintColor:", v3);

  v5 = -[BuddyMigrationBaseErrorController navigationItem](v8, "navigationItem");
  objc_msgSend(v5, "setHidesBackButton:", 1);

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
