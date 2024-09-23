@implementation iFBAPreferencesTimeoutViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)iFBAPreferencesTimeoutViewController;
  -[iFBAPreferencesTimeoutViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesTimeoutViewController tableView](self, "tableView"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("TimeoutCell"));

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)iFBAPreferencesTimeoutViewController;
  -[iFBAPreferencesTimeoutViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID_REQUIRE"), &stru_1000EA660, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesTimeoutViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v5);

  if (+[iFBKUtils deviceSupportsFaceID](iFBKUtils, "deviceSupportsFaceID"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACE_ID_REQUIRE"), &stru_1000EA660, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[iFBAPreferencesTimeoutViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "setTitle:", v8);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v9, "setInteger:forKey:", -[iFBAPreferencesTimeoutViewController timeoutForRow:](self, "timeoutForRow:", v8), CFSTR("TouchIDTimeoutDuration"));
  objc_msgSend(v7, "reloadData");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  id v14;
  uint64_t v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("TimeoutCell")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration"));
  v9 = sub_10003E944(-[iFBAPreferencesTimeoutViewController timeoutForRow:](self, "timeoutForRow:", objc_msgSend(v6, "row")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "setText:", v10);

  objc_msgSend(v7, "setContentConfiguration:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = objc_msgSend(v11, "integerForKey:", CFSTR("TouchIDTimeoutDuration"));

  v13 = -[iFBAPreferencesTimeoutViewController rowForTimeout:](self, "rowForTimeout:", v12);
  v14 = objc_msgSend(v6, "row");

  if ((id)v13 == v14)
    v15 = 3;
  else
    v15 = 0;
  objc_msgSend(v7, "setAccessoryType:", v15);

  return v7;
}

- (int64_t)rowForTimeout:(int64_t)a3
{
  int64_t result;

  result = a3;
  if (a3 > 299)
  {
    if (a3 == 300)
      return 2;
    if (a3 == 900)
      return 3;
  }
  else
  {
    if (!a3)
      return result;
    if (a3 == 60)
      return 1;
  }
  return -1;
}

- (int64_t)timeoutForRow:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return qword_1000CB978[a3 - 1];
}

@end
