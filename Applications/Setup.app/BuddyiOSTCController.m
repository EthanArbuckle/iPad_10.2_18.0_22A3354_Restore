@implementation BuddyiOSTCController

- (BuddyiOSTCController)init
{
  id v2;
  BuddyiOSTCController *v3;
  objc_super v5;
  SEL v6;
  id location;

  v6 = a2;
  location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyiOSTCController;
  location = -[BuddyiOSTCController init](&v5, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = +[BYLicenseAgreement versionOfOnDiskAgreement](BYLicenseAgreement, "versionOfOnDiskAgreement");
    *((_QWORD *)location + 3) = v2;
  }
  v3 = (BuddyiOSTCController *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (id)termsContent
{
  id v2;
  NSBundle *v3;
  __CFString *v4;
  __CFString *v5;
  NSString *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location;
  id v14;
  id v15;
  id v16[3];

  v16[2] = self;
  v16[1] = (id)a2;
  v2 = (id)SFLicenseFilePath();
  v16[0] = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v2);

  v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v16[0], 4);
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v14 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("TERMS_CONDITIONS_LINK"), &stru_100284738, CFSTR("Localizable"));

  if (sub_10012A424())
    v4 = CFSTR("rtl");
  else
    v4 = CFSTR("ltr");
  v5 = v4;
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<body><p dir=\"%@\" class=\"p1\"><b>%@</b></p><p class=\"p1\"><br></p>"), v5, v14, v5);
  v7 = objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<body>"), v6);
  v8 = v15;
  v15 = v7;

  v9 = objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<head>"), CFSTR("<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\"/>"));
  v10 = v15;
  v15 = v9;

  v11 = v15;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  return v11;
}

- (id)titleString
{
  NSBundle *v2;
  NSString *v3;

  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle", a2, self);
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("TERMS_AND_CONDITIONS"), &stru_100284738, CFSTR("Localizable"));

  return v3;
}

- (void)didAgree
{
  +[BYLicenseAgreement recordUserAcceptedAgreementVersion:](BYLicenseAgreement, "recordUserAcceptedAgreementVersion:", -[BuddyiOSTCController licenseVersionDisplayed](self, "licenseVersionDisplayed", a2, self));
}

- (unint64_t)licenseVersionDisplayed
{
  return self->_licenseVersionDisplayed;
}

- (void)setLicenseVersionDisplayed:(unint64_t)a3
{
  self->_licenseVersionDisplayed = a3;
}

@end
