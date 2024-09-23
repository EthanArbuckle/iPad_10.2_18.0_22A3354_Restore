@implementation BuddyEraseAlertController

+ (id)alertControllerWithWindow:(id)a3 navigationController:(id)a4 proximitySetupController:(id)a5 analyticsManager:(id)a6
{
  NSBundle *v9;
  id v10;
  NSString *v11;
  NSBundle *v12;
  id v13;
  NSString *v14;
  id v15;
  NSBundle *v16;
  id v17;
  NSString *v18;
  UIAlertAction *v19;
  id v20;
  NSBundle *v21;
  NSString *v22;
  UIAlertAction *v23;
  id v24;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33[2];
  id v34;
  id v35;
  id v36;
  id v37;
  id location[2];
  id v39;

  v39 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  objc_storeStrong(&v37, a4);
  v36 = 0;
  objc_storeStrong(&v36, a5);
  v35 = 0;
  objc_storeStrong(&v35, a6);
  v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ERASE_START_OVER"));
  v11 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", v10, &stru_100284738, CFSTR("Localizable"));
  v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v13 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ERASE_START_OVER_BODY"));
  v14 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", v13, &stru_100284738, CFSTR("Localizable"));
  v34 = +[BuddyEraseAlertController alertControllerWithTitle:message:preferredStyle:](BuddyEraseAlertController, "alertControllerWithTitle:message:preferredStyle:", v11, v14, 1);

  v15 = v34;
  v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v17 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ERASE_DEVICE"));
  v18 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", v17, &stru_100284738, CFSTR("Localizable"));
  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_10007599C;
  v29 = &unk_1002816F0;
  v33[1] = v39;
  v30 = location[0];
  v31 = v37;
  v32 = v36;
  v33[0] = v35;
  v19 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 2, &v26);
  objc_msgSend(v15, "addAction:", v19, v26, v27, v28, v29, v30, v31, v32);

  v20 = v34;
  v21 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v22 = -[NSBundle localizedStringForKey:value:table:](v21, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100284738, CFSTR("Localizable"));
  v23 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v22, 1, 0);
  objc_msgSend(v20, "addAction:", v23);

  v24 = v34;
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v24;
}

+ (void)eraseWithWindow:(id)a3 navigationController:(id)a4 proximitySetupController:(id)a5 analyticsManager:(id)a6
{
  NSObject *v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(id *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = 0;
  objc_storeStrong(&v20, a5);
  v19 = 0;
  objc_storeStrong(&v19, a6);
  objc_msgSend(location[0], "setUserInteractionEnabled:", 0);
  v9 = dispatch_get_global_queue(2, 0);
  v10 = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_100075B9C;
  v14 = &unk_100280E90;
  v15 = v20;
  v16 = v19;
  v17 = v21;
  v18 = location[0];
  dispatch_async(v9, &v10);

  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

@end
