@implementation BuddyAccessibilityUtilities

+ (id)accessibilityViewController
{
  unsigned __int8 v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  os_log_t v10;
  id v11;
  os_log_type_t v12;
  os_log_t oslog;
  int v14;
  __int128 v15;
  __int128 v16;
  id v17;
  Class aClass;
  id obj;
  id location;
  id v21[3];
  id v22;
  uint8_t v23[16];
  uint8_t buf[24];

  v21[2] = a1;
  v21[1] = (id)a2;
  v21[0] = +[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/AccessibilityBundles/AXBuddyBundle.bundle"));
  location = 0;
  obj = 0;
  v2 = objc_msgSend(v21[0], "loadAndReturnError:", &obj);
  objc_storeStrong(&location, obj);
  if ((v2 & 1) == 0)
  {
    v10 = (os_log_t)(id)_BYLoggingFacility(v3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_100038C28((uint64_t)v23, (uint64_t)location);
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to load accessibility bundle: %@", v23, 0xCu);
    }
    objc_storeStrong((id *)&v10, 0);
    goto LABEL_12;
  }
  aClass = (Class)objc_msgSend(v21[0], "principalClass");
  v4 = -[objc_class isSubclassOfClass:](aClass, "isSubclassOfClass:", objc_opt_class(UIViewController));
  if ((v4 & 1) == 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    v12 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromClass(aClass);
      sub_100038C28((uint64_t)buf, (uint64_t)v11);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v12, "Accessibility bundle is not subclass of UIViewController (is %@)", buf, 0xCu);

      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
LABEL_12:
    v22 = 0;
    v14 = 1;
    goto LABEL_13;
  }
  v17 = objc_alloc_init(aClass);
  v5 = +[BYDevice currentDevice](BYDevice, "currentDevice");
  v6 = objc_msgSend(v5, "type");

  if (v6 == (id)1)
  {
    objc_msgSend(v17, "setModalPresentationStyle:", 2);
    +[OBBaseWelcomeController preferredContentSize](OBBaseWelcomeController, "preferredContentSize");
    *(double *)&v16 = v7;
    *((double *)&v16 + 1) = v8;
    v15 = v16;
    objc_msgSend(v17, "setPreferredContentSize:", v7, v8);
  }
  v22 = v17;
  v14 = 1;
  objc_storeStrong(&v17, 0);
LABEL_13:
  objc_storeStrong(&location, 0);
  objc_storeStrong(v21, 0);
  return v22;
}

+ (id)navigationBarButton
{
  UIImage *v2;
  id v3;
  id v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;
  UIColor *v10;
  id v11;
  id location;
  id v14[3];

  v14[2] = a1;
  v14[1] = (id)a2;
  v2 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("AccessibilityButtonItem"));
  v14[0] = -[UIImage _imageThatSuppressesAccessibilityHairlineThickening](v2, "_imageThatSuppressesAccessibilityHairlineThickening");

  location = +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
  objc_msgSend(location, "setBackgroundImage:forState:", v14[0], 0);
  v3 = objc_retainAutorelease(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v4 = objc_msgSend(v3, "CGColor");
  v5 = objc_msgSend(location, "layer");
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(v14[0], "size");
  v7 = v6 / 2.0;
  v9 = objc_msgSend(location, "layer", *(_QWORD *)&v6, v8);
  objc_msgSend(v9, "setCornerRadius:", v7);

  v10 = +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  objc_msgSend(location, "setTintColor:", v10);

  v11 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v14, 0);
  return v11;
}

+ (id)navigationBarButtonItemWithButton:(id)a3
{
  id v3;
  id v4;
  id v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc((Class)UIBarButtonItem);
  v6 = objc_msgSend(v3, "initWithCustomView:", location[0]);
  objc_msgSend(v6, "setStyle:", 0);
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

@end
