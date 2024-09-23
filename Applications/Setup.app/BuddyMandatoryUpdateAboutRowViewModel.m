@implementation BuddyMandatoryUpdateAboutRowViewModel

+ (id)viewModelsWithScanOptions:(id)a3
{
  id v3;
  id v4;
  NSArray *v5;
  id v7[2];
  id v8;
  _QWORD v9[2];

  v8 = a1;
  v7[1] = (id)a2;
  v7[0] = 0;
  objc_storeStrong(v7, a3);
  v3 = objc_msgSend(v8, "_makeCurrentVersionRow");
  v9[0] = v3;
  v4 = objc_msgSend(v8, "_makeRequiredVersionRowWithScanOptions:", v7[0]);
  v9[1] = v4;
  v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2);

  objc_storeStrong(v7, 0);
  return v5;
}

- (BuddyMandatoryUpdateAboutRowViewModel)initWithTitle:(id)a3 detail:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  BuddyMandatoryUpdateAboutRowViewModel *v10;
  objc_super v12;
  id v13;
  id location[2];
  id v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v5 = v15;
  v15 = 0;
  v12.receiver = v5;
  v12.super_class = (Class)BuddyMandatoryUpdateAboutRowViewModel;
  v15 = -[BuddyMandatoryUpdateAboutRowViewModel init](&v12, "init");
  objc_storeStrong(&v15, v15);
  if (v15)
  {
    v6 = objc_msgSend(location[0], "copy");
    v7 = (void *)*((_QWORD *)v15 + 1);
    *((_QWORD *)v15 + 1) = v6;

    v8 = objc_msgSend(v13, "copy");
    v9 = (void *)*((_QWORD *)v15 + 2);
    *((_QWORD *)v15 + 2) = v8;

  }
  v10 = (BuddyMandatoryUpdateAboutRowViewModel *)v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v10;
}

+ (id)_makeCurrentVersionRow
{
  NSBundle *v2;
  id v3;
  id v5;
  id location[2];
  Class v7;

  v7 = (Class)a1;
  location[1] = (id)a2;
  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateAboutRowViewModel));
  location[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_INFO_CURRENT_VERSION"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));

  v5 = +[BuddyMandatoryUpdateUtilities humanReadableCurrentOSVersion](BuddyMandatoryUpdateUtilities, "humanReadableCurrentOSVersion");
  v3 = objc_msgSend([v7 alloc], "initWithTitle:detail:", location[0], v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v3;
}

+ (id)_makeRequiredVersionRowWithScanOptions:(id)a3
{
  NSBundle *v3;
  id v4;
  id v6;
  id v7;
  id location[2];
  Class v9;

  v9 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyMandatoryUpdateAboutRowViewModel));
  v7 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("MANDATORY_UPDATE_INFO_REQUIRED_VERSION"), &stru_100284738, CFSTR("MandatorySoftwareUpdate"));

  v6 = +[BuddyMandatoryUpdateUtilities humanReadableOSVersionFromScanOptions:](BuddyMandatoryUpdateUtilities, "humanReadableOSVersionFromScanOptions:", location[0]);
  v4 = objc_msgSend([v9 alloc], "initWithTitle:detail:", v7, v6);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
