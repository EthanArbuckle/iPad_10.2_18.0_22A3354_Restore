@implementation UIViewController(JITAppKit)

- (id)tkPage
{
  return objc_getAssociatedObject(a1, &PAGE_KEY);
}

- (void)setTkPage:()JITAppKit
{
  id location[2];
  id v4;

  v4 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  objc_setAssociatedObject(v4, &PAGE_KEY, location[0], (void *)1);
  objc_storeStrong(location, 0);
}

- (id)identifier
{
  id v3;
  id v4;
  id v5[2];
  id v6;

  v6 = a1;
  v5[1] = a2;
  v5[0] = objc_getAssociatedObject(a1, &IDENTIFIER_KEY);
  if (!v5[0])
  {
    v4 = (id)objc_msgSend(v6, "tkPage");
    v5[0] = (id)objc_msgSend(v4, "viewName");

  }
  v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

- (void)setIdentifier:()JITAppKit
{
  id location[2];
  id v4;

  v4 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  objc_setAssociatedObject(v4, &IDENTIFIER_KEY, location[0], (void *)3);
  objc_storeStrong(location, 0);
}

+ (id)jitappkit:()JITAppKit
{
  id v4;
  id v5;
  id v6;
  id location[3];

  location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v5 = +[TKApplication shared](TKApplication, "shared");
  v4 = (id)objc_msgSend(v5, "loadPage:", location[0]);
  v6 = WithFinalizer(v4);

  objc_storeStrong(location, 0);
  return v6;
}

@end
