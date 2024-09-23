@implementation BuddyRestoreNetworkAlertController

+ (id)alertControllerForNetworkConnectionWithProvider:(id)a3 estimatedRestoreSize:(int64_t)a4
{
  void *v5;
  id location[2];
  id v8;
  id v9;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "currentNetworkSupportsRestore") & 1) == 0
    || (objc_msgSend(location[0], "currentNetworkRequiresDataUsageWarningForRestore") & 1) != 0)
  {
    if ((objc_msgSend(location[0], "currentNetworkSupportsRestore") & 1) != 0)
    {
      if ((objc_msgSend(location[0], "currentNetworkRequiresDataUsageWarningForRestore") & 1) != 0)
        v9 = objc_msgSend((id)objc_opt_class(v8), "_alertControllerForCellular:", a4);
      else
        v9 = 0;
    }
    else
    {
      v5 = (void *)objc_opt_class(v8);
      v9 = objc_msgSend(v5, "alertControllerForUnsupportedNetworkWithCellularRestoreSupport:", (unint64_t)objc_msgSend(location[0], "deviceSupportsCellularRestore") & 1);
    }
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong(location, 0);
  return v9;
}

+ (id)alertControllerForUnsupportedNetworkWithCellularRestoreSupport:(BOOL)a3
{
  NSBundle *v3;
  id v4;
  NSBundle *v5;
  id v6;
  NSString *v7;
  id v8;
  id v9;
  NSBundle *v10;
  id v11;
  NSString *v12;
  UIAlertAction *v13;
  id v14;
  NSBundle *v15;
  NSString *v16;
  UIAlertAction *v17;
  id v18;
  void **v20;
  uint64_t v21;
  void (*v22)(id *, void *);
  void *v23;
  id v24[3];
  id location;
  id val;
  id v27;
  id v28;
  BOOL v29;
  SEL v30;
  id v31;

  v31 = a1;
  v30 = a2;
  v29 = a3;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("RESTORE_REQUIRES_WIFI_TITLE"));
  v28 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("RestoreFromBackup"));

  v27 = 0;
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  if (v29)
    v6 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("RESTORE_REQUIRES_WIFI_WITH_CELLULAR_MESSAGE"));
  else
    v6 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("RESTORE_REQUIRES_WIFI_MESSAGE"));
  v7 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v6, &stru_100284738, CFSTR("RestoreFromBackup"));
  v8 = v27;
  v27 = v7;

  val = +[BuddyRestoreNetworkAlertController alertControllerWithTitle:message:preferredStyle:](BuddyRestoreNetworkAlertController, "alertControllerWithTitle:message:preferredStyle:", v28, v27, 1);
  objc_initWeak(&location, val);
  v9 = val;
  v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v31));
  v11 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("CHOOSE_NETWORK_WIFI"));
  v12 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", v11, &stru_100284738, CFSTR("Localizable"));
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_100136CB4;
  v23 = &unk_100280DF0;
  objc_copyWeak(v24, &location);
  v13 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, &v20);
  objc_msgSend(v9, "addAction:", v13, v20, v21, v22, v23);

  v14 = val;
  v15 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v16 = -[NSBundle localizedStringForKey:value:table:](v15, "localizedStringForKey:value:table:", CFSTR("RESTORE_LATER"), &stru_100284738, CFSTR("RestoreFromBackup"));
  v17 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 1, 0);
  objc_msgSend(v14, "addAction:", v17);

  v18 = val;
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_storeStrong(&val, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  return v18;
}

+ (id)_alertControllerForCellular:(int64_t)a3
{
  NSBundle *v3;
  id v4;
  NSBundle *v5;
  id v6;
  NSString *v7;
  NSString *v8;
  id v9;
  id v10;
  NSBundle *v11;
  id v12;
  NSString *v13;
  UIAlertAction *v14;
  id v15;
  NSBundle *v16;
  NSString *v17;
  UIAlertAction *v18;
  id v19;
  NSBundle *v20;
  NSString *v21;
  UIAlertAction *v22;
  id v23;
  void **v25;
  int v26;
  int v27;
  void (*v28)(id *, void *);
  void *v29;
  id v30;
  void **v31;
  int v32;
  int v33;
  void (*v34)(id *, void *);
  void *v35;
  id v36[3];
  id from;
  id v38;
  id location;
  id v40;
  id v41;
  int64_t v42;
  SEL v43;
  id v44;

  v44 = a1;
  v43 = a2;
  v42 = a3;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("RESTORE_OVER_CELLULAR_PROMPT_TITLE_WIFI"));
  v41 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("RestoreFromBackup"));

  v40 = 0;
  if (v42 > 0)
  {
    location = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", v42, 2);
    v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("RESTORE_OVER_CELLULAR_PROMPT_MESSAGE_ESTIMATE"));
    v7 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v6, &stru_100284738, CFSTR("RestoreFromBackup"));
    v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, location);
    v9 = v40;
    v40 = v8;

    objc_storeStrong(&location, 0);
  }
  v38 = +[BuddyRestoreNetworkAlertController alertControllerWithTitle:message:preferredStyle:](BuddyRestoreNetworkAlertController, "alertControllerWithTitle:message:preferredStyle:", v41, v40, 1);
  objc_initWeak(&from, v38);
  v10 = v38;
  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v44));
  v12 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("CHOOSE_NETWORK_WIFI"));
  v13 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", v12, &stru_100284738, CFSTR("Localizable"));
  v31 = _NSConcreteStackBlock;
  v32 = -1073741824;
  v33 = 0;
  v34 = sub_100137258;
  v35 = &unk_100280DF0;
  objc_copyWeak(v36, &from);
  v14 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, &v31);
  objc_msgSend(v10, "addAction:", v14);

  v15 = v38;
  v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v17 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("RESTORE_OVER_CELLULAR"), &stru_100284738, CFSTR("RestoreFromBackup"));
  v25 = _NSConcreteStackBlock;
  v26 = -1073741824;
  v27 = 0;
  v28 = sub_1001372D8;
  v29 = &unk_100280DF0;
  objc_copyWeak(&v30, &from);
  v18 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 0, &v25);
  objc_msgSend(v15, "addAction:", v18);

  v19 = v38;
  v20 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v44));
  v21 = -[NSBundle localizedStringForKey:value:table:](v20, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100284738, CFSTR("Localizable"));
  v22 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 1, 0);
  objc_msgSend(v19, "addAction:", v22);

  v23 = v38;
  objc_destroyWeak(&v30);
  objc_destroyWeak(v36);
  objc_destroyWeak(&from);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  return v23;
}

- (id)restoreOverCellular
{
  return self->_restoreOverCellular;
}

- (void)setRestoreOverCellular:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)presentWiFiSettings
{
  return self->_presentWiFiSettings;
}

- (void)setPresentWiFiSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentWiFiSettings, 0);
  objc_storeStrong(&self->_restoreOverCellular, 0);
}

@end
