@implementation ProxCardKitTestAppIconsViewController

- (ProxCardKitTestAppIconsViewController)initWithContentView:(id)a3
{
  ProxCardKitTestAppIconsViewController *v3;
  ProxCardKitTestAppIconsViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  ProxCardKitTestAppIconsViewController *v16;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;
  void *v24;
  _QWORD v25[3];

  v23.receiver = self;
  v23.super_class = (Class)ProxCardKitTestAppIconsViewController;
  v19 = a3;
  v3 = -[ProxCardKitTestAppIconsViewController initWithContentView:](&v23, "initWithContentView:");
  v4 = v3;
  if (v3)
  {
    -[ProxCardKitTestAppIconsViewController setTitle:](v3, "setTitle:", CFSTR("ProxCardKit Test"));
    -[ProxCardKitTestAppIconsViewController setImageStyle:](v4, "setImageStyle:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v18, "scale");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.MobileSMS"), 2));
    v24 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v6, "scale");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.reminders"), 2));
    v25[0] = v7;
    if (SFIsDevicePhone(v25))
      v8 = CFSTR("com.apple.mobilephone");
    else
      v8 = CFSTR("com.apple.mobilenotes");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v9, "scale");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v8, 2));
    v25[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v11, "scale");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", CFSTR("com.apple.mobilesafari"), 2));
    v25[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 4));
    -[ProxCardKitTestAppIconsViewController setImages:](v4, "setImages:", v13);

    -[ProxCardKitTestAppIconsViewController setBodyText:](v4, "setBodyText:", CFSTR("Use this view to list apps such as Messages, Phone, Reminders, and more when setting up a device."));
    location = 0;
    objc_initWeak(&location, v4);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100109A20;
    v20[3] = &unk_10017E008;
    objc_copyWeak(&v21, &location);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", CFSTR("Next"), 0, v20));
    v15 = -[ProxCardKitTestAppIconsViewController addAction:](v4, "addAction:", v14);

    v16 = v4;
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v4;
}

@end
