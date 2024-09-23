@implementation BuddySetupTableViewCell

- (BuddySetupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v4;
  id v5;
  id v6;
  BuddySetupTableViewCell *v7;
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
  v9.super_class = (Class)BuddySetupTableViewCell;
  v13 = -[BuddySetupTableViewCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", v11, location);
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    v5 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    objc_msgSend(v5, "applyThemeToTableCell:", v13);

    v6 = objc_msgSend(v13, "textLabel");
    objc_msgSend(v6, "setNumberOfLines:", 0);

  }
  v7 = (BuddySetupTableViewCell *)v13;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v13, 0);
  return v7;
}

@end
