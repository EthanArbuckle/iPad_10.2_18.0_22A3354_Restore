@implementation BuddySkipWiFiAlertController

+ (id)alertController
{
  NSBundle *v2;
  id v3;
  NSString *v4;
  NSBundle *v5;
  NSString *v6;
  id v7;
  NSBundle *v8;
  NSString *v9;
  UIAlertAction *v10;
  id v11;
  NSBundle *v12;
  id v13;
  NSString *v14;
  UIAlertAction *v15;
  id v16;
  void **v18;
  uint64_t v19;
  void (*v20)(id *, void *);
  void *v21;
  id v22;
  void **v23;
  int v24;
  int v25;
  void (*v26)(id *, void *);
  void *v27;
  id v28[3];
  id location;
  id v30[3];

  v30[2] = a1;
  v30[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("SKIP_WIFI_TITLE"));
  v4 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v3, &stru_100284738, CFSTR("Localizable"));
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("SKIP_WIFI_MESSAGE"), &stru_100284738, CFSTR("Localizable"));
  v30[0] = +[BuddySkipWiFiAlertController alertControllerWithTitle:message:preferredStyle:](BuddySkipWiFiAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);

  objc_initWeak(&location, v30[0]);
  v7 = v30[0];
  v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Localizable"));
  v23 = _NSConcreteStackBlock;
  v24 = -1073741824;
  v25 = 0;
  v26 = sub_1000724F0;
  v27 = &unk_100280DF0;
  objc_copyWeak(v28, &location);
  v10 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 1, &v23);
  objc_msgSend(v7, "addAction:", v10);

  v11 = v30[0];
  v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v13 = (id)SFLocalizableWAPIStringKeyForKey(CFSTR("USE_WIFI"));
  v14 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", v13, &stru_100284738, CFSTR("Localizable"));
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_1000725AC;
  v21 = &unk_100280DF0;
  objc_copyWeak(&v22, &location);
  v15 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, &v18);
  objc_msgSend(v11, "addAction:", v15, v18, v19, v20, v21);

  v16 = v30[0];
  objc_destroyWeak(&v22);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  objc_storeStrong(v30, 0);
  return v16;
}

- (id)skipWiFi
{
  return self->_skipWiFi;
}

- (void)setSkipWiFi:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)useWiFi
{
  return self->_useWiFi;
}

- (void)setUseWiFi:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_useWiFi, 0);
  objc_storeStrong(&self->_skipWiFi, 0);
}

@end
