@implementation BuddyWarrantyTCController

+ (id)warrantyFilePath
{
  return (id)SFWarrantyFilePath(a1, a2);
}

- (id)termsContent
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v2 = +[BuddyWarrantyTCController warrantyFilePath](BuddyWarrantyTCController, "warrantyFilePath");
  location[0] = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v2);

  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", location[0], 4);
  v3 = objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<head>"), CFSTR("<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\"/>"));
  v4 = v7;
  v7 = v3;

  v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)titleString
{
  NSBundle *v2;
  NSString *v3;

  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle", a2, self);
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("WARRANTY"), &stru_100284738, CFSTR("Localizable"));

  return v3;
}

@end
