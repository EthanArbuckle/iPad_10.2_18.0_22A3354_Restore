@implementation UNLocalizedStringFactory

+ (id)localizedUserNotificationStringForKey:(id)a3 arguments:(id)a4 cfBundle:(__CFBundle *)a5 defaultValue:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a4;
  v10 = a3;
  UNFormatLocalizedStringInBundleWithDefaultValue(v10, v9, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UNLocalizedString localizedStringForKey:arguments:value:](UNLocalizedString, "localizedStringForKey:arguments:value:", v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)localizedUserNotificationStringForKey:(id)a3 arguments:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "un_applicationBundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "un_safeBundleWithURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v5, &stru_1E57F06A0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    UNFormatLocalizedString(v10, v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v10;
  }
  v13 = v12;
  +[UNLocalizedString localizedStringForKey:arguments:value:](UNLocalizedString, "localizedStringForKey:arguments:value:", v5, v6, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
