@implementation BuddyMigrationCancelAlertController

+ (id)alertControllerForSource:(id)a3
{
  NSBundle *v3;
  NSString *v4;
  NSBundle *v5;
  NSString *v6;
  UIAlertAction *v7;
  id v8;
  NSBundle *v9;
  NSString *v10;
  UIAlertAction *v11;
  id v12;
  void **v14;
  int v15;
  int v16;
  void (*v17)(_QWORD *, void *);
  void *v18;
  id v19;
  id v20;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("MIGRATION_CANCEL_CONFIRM_ALERT_TITLE"), &stru_100284738, CFSTR("Migration"));
  v20 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1);

  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("CONTINUE_TRANSFER"), &stru_100284738, CFSTR("Migration"));
  v7 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v6, 0, 0);
  objc_msgSend(v20, "addAction:", v7);

  v8 = v20;
  v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("STOP_TRANSFER"), &stru_100284738, CFSTR("Migration"));
  v14 = _NSConcreteStackBlock;
  v15 = -1073741824;
  v16 = 0;
  v17 = sub_1000F7DA8;
  v18 = &unk_100281AA8;
  v19 = location[0];
  v11 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, &v14);
  objc_msgSend(v8, "addAction:", v11);

  v12 = v20;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v12;
}

+ (id)alertControllerForTargetWithNeedsErase:(BOOL)a3 completion:(id)a4
{
  NSBundle *v4;
  id v5;
  NSString *v6;
  id v7;
  NSBundle *v8;
  id v9;
  NSString *v10;
  id v11;
  NSBundle *v12;
  NSString *v13;
  id v14;
  NSBundle *v15;
  NSString *v16;
  id v17;
  NSBundle *v18;
  NSString *v19;
  UIAlertAction *v20;
  id v21;
  id v22;
  uint64_t v23;
  UIAlertAction *v24;
  id v25;
  void **v27;
  uint64_t v28;
  void (*v29)(_QWORD *, void *);
  void *v30;
  id v31;
  void **v32;
  int v33;
  int v34;
  void (*v35)(_QWORD *, void *);
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id location;
  BOOL v43;
  SEL v44;
  id v45;

  v45 = a1;
  v44 = a2;
  v43 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v41 = 0;
  v40 = 0;
  v39 = 0;
  if (v43)
  {
    v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MIGRATION_CANCEL_CONFIRM_ALERT_DETAIL"));
    v6 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("Migration"));
    v7 = v41;
    v41 = v6;

    v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v9 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("STOP_TRANSFER_AND_RESET"));
    v10 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", v9, &stru_100284738, CFSTR("Migration"));
    v11 = v40;
    v40 = v10;

    v39 = 2;
  }
  else
  {
    objc_storeStrong(&v41, 0);
    v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v13 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("STOP_TRANSFER"), &stru_100284738, CFSTR("Migration"));
    v14 = v40;
    v40 = v13;

    v39 = 1;
  }
  v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v16 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("MIGRATION_CANCEL_CONFIRM_ALERT_TITLE"), &stru_100284738, CFSTR("Migration"));
  v38 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v16, v41, 1);

  v17 = v38;
  v18 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v19 = -[NSBundle localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:", CFSTR("CONTINUE_TRANSFER"), &stru_100284738, CFSTR("Migration"));
  v32 = _NSConcreteStackBlock;
  v33 = -1073741824;
  v34 = 0;
  v35 = sub_1000F8238;
  v36 = &unk_100281AA8;
  v37 = location;
  v20 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 0, &v32);
  objc_msgSend(v17, "addAction:", v20);

  v21 = v38;
  v22 = v40;
  v23 = v39;
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_1000F828C;
  v30 = &unk_100281AA8;
  v31 = location;
  v24 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v22, v23, &v27);
  objc_msgSend(v21, "addAction:", v24, v27, v28, v29, v30);

  v25 = v38;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&location, 0);
  return v25;
}

@end
