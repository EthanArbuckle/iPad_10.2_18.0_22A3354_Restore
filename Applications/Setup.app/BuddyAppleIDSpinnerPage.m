@implementation BuddyAppleIDSpinnerPage

- (BuddyAppleIDSpinnerPage)init
{
  NSBundle *v3;
  NSString *v4;
  BuddyAppleIDSpinnerPage *v5;
  objc_super v7;
  SEL v8;
  id location;

  v8 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_APPLE_ID_WORDY"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyAppleIDSpinnerPage;
  location = -[BuddyAppleIDSpinnerPage initWithSpinnerText:](&v7, "initWithSpinnerText:", v4);
  v5 = (BuddyAppleIDSpinnerPage *)location;

  objc_storeStrong(&location, 0);
  return v5;
}

- (BuddyAppleIDSpinnerPage)initWithAccountMode:(unint64_t)a3
{
  NSBundle *v3;
  NSString *v4;
  id v5;
  NSBundle *v6;
  NSString *v7;
  id v8;
  NSBundle *v9;
  NSString *v10;
  id v11;
  id v12;
  BuddyAppleIDSpinnerPage *v13;
  objc_super v15;
  id location[3];
  id v17;

  v17 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("UPGRADING_ICLOUD_WORDY"), &stru_100284738, CFSTR("Localizable"));
      v11 = location[0];
      location[0] = v10;

      break;
    case 1uLL:
    case 2uLL:
      v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_APPLE_ID_WORDY"), &stru_100284738, CFSTR("Localizable"));
      v5 = location[0];
      location[0] = v4;

      break;
    case 4uLL:
      v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("UPGRADING_APPLE_ID_WORDY"), &stru_100284738, CFSTR("Localizable"));
      v8 = location[0];
      location[0] = v7;

      break;
    default:
      break;
  }
  v12 = v17;
  v17 = 0;
  v15.receiver = v12;
  v15.super_class = (Class)BuddyAppleIDSpinnerPage;
  v17 = -[BuddyAppleIDSpinnerPage initWithSpinnerText:](&v15, "initWithSpinnerText:", location[0]);
  v13 = (BuddyAppleIDSpinnerPage *)v17;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v13;
}

- (id)initForSilentAuthentication
{
  NSBundle *v3;
  id v4;
  NSString *v5;
  id v6;
  objc_super v8;
  SEL v9;
  id location;

  v9 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("SIGN_IN_APPLE_ID_WORDY_SILENT"));
  v5 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v8.receiver = self;
  v8.super_class = (Class)BuddyAppleIDSpinnerPage;
  location = -[BuddyAppleIDSpinnerPage initWithSpinnerText:](&v8, "initWithSpinnerText:", v5);
  v6 = location;

  objc_storeStrong(&location, 0);
  return v6;
}

- (void)loadView
{
  id v2;
  id v3;
  objc_super v4;
  SEL v5;
  BuddyAppleIDSpinnerPage *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyAppleIDSpinnerPage;
  -[BuddyAppleIDSpinnerPage loadView](&v4, "loadView");
  v2 = -[BuddyAppleIDSpinnerPage navigationItem](v6, "navigationItem");
  objc_msgSend(v2, "setTitle:", &stru_100284738);

  v3 = -[BuddyAppleIDSpinnerPage navigationItem](v6, "navigationItem");
  objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  char v4;
  id v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  BuddyAppleIDSpinnerPage *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BuddyAppleIDSpinnerPage;
  -[BuddyAppleIDSpinnerPage viewDidAppear:](&v6, "viewDidAppear:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&v9->_spinnerDelegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "buddyAppleIDSpinnerPageDidAppear:");

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&v9->_spinnerDelegate);
    objc_msgSend(v5, "buddyAppleIDSpinnerPageDidAppear:", v9);

  }
}

- (BuddyAppleIDSpinnerPageDelegate)spinnerDelegate
{
  return (BuddyAppleIDSpinnerPageDelegate *)objc_loadWeakRetained((id *)&self->_spinnerDelegate);
}

- (void)setSpinnerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_spinnerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_spinnerDelegate);
}

@end
